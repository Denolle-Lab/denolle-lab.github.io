// Latest Updates auto-scroll functionality
document.addEventListener('DOMContentLoaded', function() {
  const scrollContainer = document.querySelector('.latest-scroll-wrapper');
  if (!scrollContainer) return;
  
  // Auto-scroll function
  let autoScrollInterval;
  const startAutoScroll = () => {
    autoScrollInterval = setInterval(() => {
      if (scrollContainer.scrollTop + scrollContainer.clientHeight >= scrollContainer.scrollHeight) {
        // If we're at the bottom, scroll back to top
        scrollContainer.scrollTo({ top: 0, behavior: 'smooth' });
      } else {
        // Otherwise scroll down a bit
        scrollContainer.scrollBy({ top: 50, behavior: 'smooth' });
      }
    }, 5000); // Auto-scroll every 5 seconds
  };
  
  // Start auto-scroll after a delay
  setTimeout(startAutoScroll, 2000);
  
  // Pause auto-scroll when hovering over the container
  scrollContainer.addEventListener('mouseenter', () => {
    clearInterval(autoScrollInterval);
  });
  
  // Resume auto-scroll when mouse leaves the container
  scrollContainer.addEventListener('mouseleave', () => {
    startAutoScroll();
  });
  
  // Highlight item on hover
  const items = document.querySelectorAll('.latest-scroll-item');
  items.forEach(item => {
    item.addEventListener('mouseenter', () => {
      item.style.backgroundColor = 'rgba(0,0,0,0.05)';
    });
    item.addEventListener('mouseleave', () => {
      item.style.backgroundColor = '';
    });
  });
});

// Animated stat counters (Option C)
document.addEventListener('DOMContentLoaded', function() {
  const counters = document.querySelectorAll('.stat-number[data-target]');
  if (!counters.length) return;
  const counterObs = new IntersectionObserver(function(entries) {
    entries.forEach(function(e) {
      if (e.isIntersecting) {
        const el = e.target;
        const target = parseInt(el.dataset.target, 10);
        let current = 0;
        const step = Math.max(1, Math.ceil(target / 40));
        const timer = setInterval(function() {
          current += step;
          if (current >= target) { current = target; clearInterval(timer); }
          el.textContent = current;
        }, 30);
        counterObs.unobserve(el);
      }
    });
  }, { threshold: 0.5 });
  counters.forEach(function(c) { counterObs.observe(c); });
});
