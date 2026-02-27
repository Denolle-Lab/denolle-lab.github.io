# Denolle Lab Website

This is the website of our academic research group at University of Washington.

This website is powered by Jekyll and some Bootstrap, Bootwatch. We tried to make it simple yet adaptable, so that it is easy for you to use it as a template. Please feel free to copy and modify for your own purposes.  You don't have to link to us or mention us (but of course we appreciate it).


Guidelines for group members:
* fork the gh-pages branch. Make changes on your local, pull request to merge your fork to the gh-pages branch.
* _data/*.yml files to add your content:
  + undgrads.yml, ...

## Local development

This site uses the [github-pages](https://github.com/github/pages-gem) gem set so that local builds match the production environment. To run the site locally:

1. Install dependencies:
   ```bash
   bundle install
   ```
2. Serve the site and watch for changes:
   ```bash
   bin/serve
   ```
3. To build without serving:
   ```bash
   bundle exec jekyll build --trace
   ```

If the build behaves unexpectedly, clear cached files before rebuilding:

```bash
rm -rf _site .jekyll-cache .sass-cache
```

## Publications update workflow

Publications shown on the website are rendered from `_data/publist.yml`, which is generated from `publications.bib`.

- Source of truth: `publications.bib`
- Generated file: `_data/publist.yml`
- Converter: `bin/bibtex_to_yaml.rb`
- GitHub Action: `.github/workflows/publications-sync.yml`

When `publications.bib` changes on GitHub, the workflow automatically regenerates `_data/publist.yml` and commits it to the same branch.

To regenerate locally before pushing:

```bash
bin/update_publications.sh
```


Go to *aboutwebsite.md*  to learn how to copy and modify this page for your purpose.


Copyright Allan Lab. Code released under the MIT License.