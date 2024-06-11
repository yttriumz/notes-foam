---
sitemap:
  lastmod: 2024-06-11 +0000
  priority: 1.0
---

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

# $\LaTeX$

Last modified: 2024-06-11 +0000

- [Interesting posts](#interesting-posts)
- [Commonly used formulas](#commonly-used-formulas)
    - [Elementary arithmetic](#elementary-arithmetic)
    - [Exponential function](#exponential-function)
    - [Square root](#square-root)
    - [Trigonometric functions](#trigonometric-functions)
    - [Fraction](#fraction)
    - [Progression](#progression)
    - [Limit](#limit)
    - [Factorial function](#factorial-function)
    - [Matrix](#matrix)
    - [Piecewise function](#piecewise-function)
    - [Calculus](#calculus)
    - [Align](#align)

## Interesting posts

- [Visual Studio Code (vscode)配置LaTeX - 知乎](https://zhuanlan.zhihu.com/p/166523064)
- [TexLive+VScode优雅编写LaTeX文档 - 知乎](https://zhuanlan.zhihu.com/p/150992859)
- [使用VSCode编写LaTeX - 知乎](https://zhuanlan.zhihu.com/p/38178015)
- [【LaTex】还在用 Word 写论文、报告？VScode + LaTex 的配置让你爱上用 LaTex 写论文_【欢迎关注，一起学习，共同进步！】-CSDN博客_vscode写word](https://blog.csdn.net/qq_44324181/article/details/117167287)
- [用VScode编写LaTex-教程2023/12/30_vscode写latex-CSDN博客](https://blog.csdn.net/weixin_43356770/article/details/104035291)
- [vscode中，Latex 如何利用 Todo Tree 添加标记_哪惧明天，风高路斜-CSDN博客_todo tree 使用](https://blog.csdn.net/m0_37586991/article/details/104239568)
- [vscode中，将Latex 的编译文件存放在指定目录_哪惧明天，风高路斜-CSDN博客_latex运行文件保存路径](https://blog.csdn.net/m0_37586991/article/details/104242452)

## Commonly used formulas

*References*:

- [常用 LaTeX 數學符號指令](https://hackmd.io/@CynthiaChuang/Basic-LaTeX-Commands)
- [How to write dots symbols in LaTeX?](https://www.scijournal.org/articles/dots-symbols-in-latex)

### Elementary arithmetic

$$
2x - 5y = 8\\
3x + 9y= -12\\
7x \times 2y \neq 3z
$$

### Exponential function

$$
x^3 + x^9 + x^y
$$

### Square root

$$
\sqrt{3x - 1} + \sqrt[5]{2y^5 - 4}
$$

### Trigonometric functions

$$
\cos(2\theta) = \cos^2 \theta - \sin^2 \theta
$$

### Fraction

$$
\frac{x}{2y} + \frac{x - y}{x + y}
$$

### Progression

$$
\sum_{i = 1}^\infty \frac{1}{i^2} \quad and \quad
\prod_{i = 1}^n \frac{1}{i^2} \quad and \quad
\bigcup_{i = 1}^{2} R
$$

### Limit

$$
\lim_{x \to \infty} \exp(-x) = 0
$$

### Factorial function

$$
\frac{n!}{k!(n - k)!} = \binom{n}{k}
$$

### Matrix

$$
\begin{bmatrix}
    1 & 2 & 3 \\
    4 & 5 & 6 \\
    7 & 8 & 9
\end{bmatrix}
$$

### Piecewise function

$$
X(m,n) =
\begin{cases}
    x(n) \\
    x(n - 1) \\
    x(n + 1) \\
\end{cases}
$$

### Calculus

{% raw %}
$$
\left. \frac{{\rm d}u}{{\rm d}x} \right|_{x = 0} \quad and \quad
\int_0^1 (x^2) \,{\rm d}x \quad and \quad
\frac{\partial x}{\partial y}
$$
{% endraw %}

### Align

$$
\begin{align}
    \sqrt{37} & = \sqrt{\frac{73^2 - 1}{12^2}} \\
    & = \sqrt{\frac{73^2}{12^2} \cdot \frac{73^2 - 1}{73^2}} \\
    & = \frac{73}{12} \sqrt{1 - \frac{1}{73^2}} \\
    & \approx \frac{73}{12} (1 - \frac{1}{2 \cdot 73^2})
\end{align}
$$
