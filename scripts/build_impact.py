#!/usr/bin/env python3
"""Generate _data/impact.yml — headline impact numbers for the home page.

Pulls, using only the Python standard library (no pip deps):
  * Citations / publications / h-index  -> OpenAlex (free, no key)
  * Stars / forks / repos / merged PRs / contributors -> GitHub REST + Search API

(The "most recent papers" list is rendered live in _includes/impact_stats.html
straight from _data/publist.yml, so it needs no work here.)

Run locally:            python3 scripts/build_impact.py
In CI (higher limits):  GITHUB_TOKEN=$GITHUB_TOKEN python3 scripts/build_impact.py

Numbers are cheap to eyeball for sanity; if a source is down the previous
value in _data/impact.yml is kept so the site never renders blanks.
"""

import json
import os
import sys
import time
import urllib.error
import urllib.parse
import urllib.request
from datetime import date

# --- configuration -----------------------------------------------------------

# OpenAlex author IDs whose works define "the group's" published record.
# Add group members' IDs here (find one at https://api.openalex.org/authors?search=Name).
OPENALEX_AUTHOR_IDS = [
    "A5027819799",  # Marine Denolle
]

# GitHub scopes to aggregate. ("org", name) or ("user", name).
GITHUB_SCOPES = [
    ("org", "Denolle-Lab"),
    ("org", "gaia-hazlab"),
    ("user", "mdenolle"),
]

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(ROOT, "_data", "impact.yml")

UA = "denolle-lab-site/1.0 (mailto:mdenolle@uw.edu)"
GH_TOKEN = os.environ.get("GITHUB_TOKEN", "").strip()


def _get(url, headers=None, retries=3):
    hdrs = {"User-Agent": UA}
    if headers:
        hdrs.update(headers)
    last = None
    for attempt in range(retries):
        try:
            req = urllib.request.Request(url, headers=hdrs)
            with urllib.request.urlopen(req, timeout=45) as r:
                return json.load(r)
        except urllib.error.HTTPError as e:
            last = e
            # Respect secondary rate limits.
            if e.code in (403, 429):
                time.sleep(2 * (attempt + 1))
                continue
            raise
        except Exception as e:  # noqa: BLE001 - transient network
            last = e
            time.sleep(1 * (attempt + 1))
    raise last


def gh_get(url):
    headers = {"Accept": "application/vnd.github+json"}
    if GH_TOKEN:
        headers["Authorization"] = f"Bearer {GH_TOKEN}"
    return _get(url, headers)


def gh_paginated(base):
    """Yield items across all pages of a GitHub list endpoint."""
    page = 1
    while True:
        sep = "&" if "?" in base else "?"
        data = gh_get(f"{base}{sep}per_page=100&page={page}")
        if not data:
            break
        for item in data:
            yield item
        if len(data) < 100:
            break
        page += 1


# --- OpenAlex (citations) ----------------------------------------------------

def openalex_metrics(author_ids):
    """Union works across authors (dedup by work id); return totals + h-index."""
    seen = {}  # work_id -> cited_by_count
    for aid in author_ids:
        cursor = "*"
        while cursor:
            url = (
                "https://api.openalex.org/works?"
                + urllib.parse.urlencode(
                    {
                        "filter": f"authorships.author.id:{aid}",
                        "select": "id,cited_by_count",
                        "per_page": "200",
                        "cursor": cursor,
                        "mailto": "mdenolle@uw.edu",
                    }
                )
            )
            data = _get(url)
            for w in data.get("results", []):
                seen[w["id"]] = w.get("cited_by_count", 0)
            cursor = data.get("meta", {}).get("next_cursor")
    citations = sum(seen.values())
    counts = sorted(seen.values(), reverse=True)
    h_index = 0
    for i, c in enumerate(counts, start=1):
        if c >= i:
            h_index = i
        else:
            break
    return {
        "citations": citations,
        "publications": len(seen),
        "h_index": h_index,
    }


# --- GitHub ------------------------------------------------------------------

def github_metrics(scopes):
    stars = forks = repos = 0
    contributors = set()
    repo_full_names = []
    for kind, name in scopes:
        base = (
            f"https://api.github.com/orgs/{name}/repos?type=public"
            if kind == "org"
            else f"https://api.github.com/users/{name}/repos?type=owner"
        )
        for repo in gh_paginated(base):
            if repo.get("fork"):
                continue
            repos += 1
            stars += repo.get("stargazers_count", 0)
            forks += repo.get("forks_count", 0)
            repo_full_names.append(repo["full_name"])

    # Contributors (union of logins) — only worthwhile with a token (many calls).
    if GH_TOKEN:
        for full in repo_full_names:
            try:
                for c in gh_paginated(
                    f"https://api.github.com/repos/{full}/contributors?anon=false"
                ):
                    login = c.get("login")
                    if login:
                        contributors.add(login)
            except Exception:  # noqa: BLE001 - skip repos we can't read
                continue

    # Merged PRs via Search API, per scope (disjoint repo sets -> safe to sum).
    merged_prs = 0
    for kind, name in scopes:
        q = f"is:pr is:merged {'org' if kind == 'org' else 'user'}:{name}"
        try:
            d = gh_get(
                "https://api.github.com/search/issues?q="
                + urllib.parse.quote(q)
                + "&per_page=1"
            )
            merged_prs += d.get("total_count", 0)
        except Exception:  # noqa: BLE001
            pass
        time.sleep(1)  # Search API is rate-limited separately (~30/min).

    out = {
        "stars": stars,
        "forks": forks,
        "repos": repos,
        "merged_prs": merged_prs,
    }
    if contributors:
        out["contributors"] = len(contributors)
    return out


# --- YAML emit / parse (no external dep; flat format we fully control) --------

def _q(s):
    s = str(s).replace("\\", "\\\\").replace('"', '\\"')
    return f'"{s}"'


def dump_yaml(data):
    lines = [
        "# Auto-generated by scripts/build_impact.py — do not edit by hand.",
        "# Refreshed by .github/workflows/impact-sync.yml",
        f"updated: {_q(data['updated'])}",
        f"citations: {data['citations']}",
        f"publications: {data['publications']}",
        f"h_index: {data['h_index']}",
        "github:",
    ]
    for k in ("stars", "forks", "repos", "merged_prs", "contributors"):
        if k in data["github"]:
            lines.append(f"  {k}: {data['github'][k]}")
    return "\n".join(lines) + "\n"


def load_existing():
    """Parse the previous impact.yml (our own flat format) without PyYAML."""
    prev = {"github": {}}
    try:
        with open(OUT, "r", encoding="utf-8") as f:
            in_github = False
            for raw in f:
                line = raw.rstrip("\n")
                if not line or line.lstrip().startswith("#"):
                    continue
                if line == "github:":
                    in_github = True
                    continue
                if in_github and line.startswith("  "):
                    k, _, v = line.strip().partition(":")
                    prev["github"][k] = int(v.strip())
                    continue
                in_github = False
                k, _, v = line.partition(":")
                v = v.strip().strip('"')
                if k in ("citations", "publications", "h_index"):
                    prev[k] = int(v)
    except (OSError, ValueError):
        return {"github": {}}
    return prev


def main():
    prev = load_existing()
    today = date.today().isoformat()
    data = {
        "updated": today,
        "citations": prev.get("citations", 0),
        "publications": prev.get("publications", 0),
        "h_index": prev.get("h_index", 0),
        "github": prev.get("github", {}) or {},
    }

    try:
        data.update(openalex_metrics(OPENALEX_AUTHOR_IDS))
        print(f"OpenAlex: {data['citations']} citations, "
              f"{data['publications']} works, h={data['h_index']}")
    except Exception as e:  # noqa: BLE001
        print(f"WARN OpenAlex failed, keeping previous values: {e}", file=sys.stderr)

    try:
        data["github"] = github_metrics(GITHUB_SCOPES)
        print(f"GitHub: {data['github']}")
    except Exception as e:  # noqa: BLE001
        print(f"WARN GitHub failed, keeping previous values: {e}", file=sys.stderr)

    with open(OUT, "w", encoding="utf-8") as f:
        f.write(dump_yaml(data))
    print(f"Wrote {OUT}")


if __name__ == "__main__":
    main()
