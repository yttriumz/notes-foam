---
sitemap:
  lastmod: 2024-11-04 +0000
---

# Web Development

Last modified: 2024-11-04 +0000

- [Interesting posts](#interesting-posts)
- [nginx](#nginx)
  - [OpenResty](#openresty)
- [CIDR](#cidr)
- [CSRF](#csrf)

## Interesting posts

- [Demystifying cookies and tokens \| Hacker News](https://news.ycombinator.com/item?id=41033042)
- [Let's inspect a phishing site](https://chenhuijing.com/blog/lets-inspect-a-phishing-site/)

HTML:

- [HTML Symbols \| HTML Emojis](https://www.rapidtables.com/web/html/html-codes.html)
- [HTML Character Entities](https://www.w3schools.com/html/html_entities.asp)
- [<br>: The Line Break element - HTML: HyperText Markup Language \| MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/br)
- [html - How to add a new line in textarea element? - Stack Overflow](https://stackoverflow.com/questions/8627902/how-to-add-a-new-line-in-textarea-element)
- [string - What is the difference between a "line feed" and a "carriage return"? - Stack Overflow](https://stackoverflow.com/questions/12747722/what-is-the-difference-between-a-line-feed-and-a-carriage-return)
- [\n vs \r - waht's the difference? - JavaScript - The freeCodeCamp Forum](https://forum.freecodecamp.org/t/n-vs-r-wahts-the-difference/407506)
- [HTML 5: Is it `<br>`, `<br/>`, or `<br />`? - Stack Overflow](https://stackoverflow.com/questions/1946426/html-5-is-it-br-br-or-br)

HTMX:

- [Htmx 2.0.0 has been released \| Hacker News](https://news.ycombinator.com/item?id=40709769)
- [Htmx is part of the GitHub Accelerator \| Hacker News](https://news.ycombinator.com/item?id=37144985)
- [Honest question about HTMX : r/htmx](https://www.reddit.com/r/htmx/comments/1abnl9r/honest_question_about_htmx/)

## nginx

*References*:

- [Core functionality](https://nginx.org/en/docs/ngx_core_module.html#worker_processes)
- [what is worker_processes and worker_connections in Nginx? - Stack Overflow](https://stackoverflow.com/questions/23386986/what-is-worker-processes-and-worker-connections-in-nginx)
- [Avoiding the Top 10 NGINX Configuration Mistakes](https://www.f5.com/company/blog/nginx/avoiding-top-10-nginx-configuration-mistakes)
- [Optimizing Nginx Configuration for high traffic websites - Tutorial & Documentation](https://www.webhi.com/how-to/optimize-nginx-configuration-for-high-traffic-websites-busy-server/)
- [openresty/echo-nginx-module: An Nginx module for bringing the power of "echo", "sleep", "time" and more to Nginx's config file](https://github.com/openresty/echo-nginx-module)

### OpenResty

```bash
docker run --name my-nginx -p 80:80 -v nginx.conf:/usr/local/openresty/nginx/conf/nginx.conf:ro -v default.conf:/etc/nginx/conf.d/default.conf:ro -d --rm openresty/openresty:1.25.3.2-jammy
```

*References*:

- [How To Run Nginx in a Docker Container on Ubuntu 22.04 \| DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-run-nginx-in-a-docker-container-on-ubuntu-22-04)
- [OpenResty - Getting Started](http://openresty.org/en/getting-started.html)
- [openresty/openresty - Docker Image \| Docker Hub](https://hub.docker.com/r/openresty/openresty)

## CIDR

*References*:

- [Classless Inter-Domain Routing - Wikipedia](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing)
- [What is CIDR? - CIDR Blocks and Notation Explained - AWS](https://aws.amazon.com/what-is/cidr/)

## CSRF

*References*:

- [How to protect your websites and web apps with anti-CSRF tokens \| Invicti](https://www.invicti.com/blog/web-security/protecting-website-using-anti-csrf-token/)
