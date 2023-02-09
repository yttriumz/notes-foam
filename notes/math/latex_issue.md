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

# $\LaTeX$ Issues

## GitHub Page

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

Refer to the following pages:

- https://zhuanlan.zhihu.com/p/36302775
- https://stackoverflow.com/questions/26275645/how-to-support-latex-in-github-pages
- https://docs.mathjax.org/en/v2.7-latest/configuration.html#using-in-line-configuration-options

### Wrap math expressions

Might need to wrap the math expressions with the following:

```text
{% raw %}
SOME_MATH
{% endraw %}
```

Refer to [the GitHub issue](https://github.com/jekyll/jekyll/issues/5458#issuecomment-252063824).
