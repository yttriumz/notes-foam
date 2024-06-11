---
sitemap:
  lastmod: 2024-06-11 +0000
---

# GitHub Pages

Last modified: 2024-06-11 +0000

## Interesting posts

Content:

- [Getting Started with Jekyll and GitHub Pages \| Aleksandr Hovhannisyan](https://www.aleksandrhovhannisyan.com/blog/getting-started-with-jekyll-and-github-pages/)
- [Collapsible Code Blocks in GitHub Pages \| endtoend.ai](https://www.endtoend.ai/tutorial/collapsible-code-blocks/)
- [Jekyll Text Expand or Collapsible Markdown \| Tom Ordonez](https://tomordonez.com/jekyll-text-expand-collapsible-markdown/)

Deployment:

- [my github.io page does not show up in google search](https://github.com/community/community/discussions/44421)
- [Get Github Pages Site found in Google Search Results](https://stackoverflow.com/questions/49073043/get-github-pages-site-found-in-google-search-results)
- [Github Pages and Jekyll - sitemap - Kourtney's Blog](https://klee1611.github.io/en/posts/jekyll-sitemap-github-pages.html/)
- [不使用套件直接產生 Jekyll 的 sitemap.xml](https://blog.poychang.net/generating-sitemap-in-jekyll-without-plugin/)
- [XML Sitemap Priority & Sitemap Change Frequency](https://slickplan.com/blog/xml-sitemap-priority-changefreq)
- [Jekyll’s site.url and baseurl - Made Mistakes](https://mademistakes.com/mastering-jekyll/site-url-baseurl/)
- [Variables \| Jekyll • Simple, blog-aware, static sites](https://jekyllrb.com/docs/variables/#page-variables)
- [Build and Submit a Sitemap \| Google Search Central  \|  Documentation  \|  Google for Developers](https://developers.google.com/search/docs/crawling-indexing/sitemaps/build-sitemap)
- [Add example of using <details> tag in Markdown kitchen sink by blaylockbk · Pull Request #1297 · just-the-docs/just-the-docs](https://github.com/just-the-docs/just-the-docs/pull/1297)

## $\LaTeX$ on GitHub Pages

### Add the following code to the head of the markdown files

```html
<head>
    <!-- <script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.7/MathJax.js?config=TeX-MML-AM_CHTML" type="text/javascript"></script>
    <script type="text/x-mathjax-config">
        MathJax.Hub.Config({
            tex2jax: {
            skipTags: ['script', 'noscript', 'style', 'textarea', 'pre'],
            inlineMath: [ ['$','$'], ["\\(","\\)"] ],
            displayMath: [ ['$$','$$'], ["\\[","\\]"] ],
            }
        });
    </script>
</head>
```

*References*:

- [让GitHub Page支持Latex公式](https://zhuanlan.zhihu.com/p/36302775)
- [How to support latex in GitHub-pages?](https://stackoverflow.com/questions/26275645/how-to-support-latex-in-github-pages)
- [Using in-line configuration options](https://docs.mathjax.org/en/v2.7-latest/configuration.html#using-in-line-configuration-options)

### Wrap math expressions

Might need to wrap the math expressions with the following:

```text
{% raw %}
SOME_MATH
{% endraw %}
```

{% raw %}
*References*:

- [Liquid Exception: Liquid syntax error (line 123): Variable '{{0,1}' was not properly terminated with regexp: /\}\}/ in xxx.md #5458](https://github.com/jekyll/jekyll/issues/5458#issuecomment-252063824)
{% endraw %}
