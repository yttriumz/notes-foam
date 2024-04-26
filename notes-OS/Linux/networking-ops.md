---
sitemap:
  lastmod: 2024-04-22 +0000
---

# Networking Tools & Operations

Last modified: 2024-04-22 +0000

- [Interesting posts](#interesting-posts)
- [Certificates](#certificates)
   - [Add trusted certificates](#add-trusted-certificates)
   - [Examine certificates](#examine-certificates)
- [Web debugging proxies](#web-debugging-proxies)
- [Check open ports](#check-open-ports)
- [`ip route`](#ip-route)
- [Create Hotspot](#create-hotspot)
   - [Use `linux-wifi-hotspot`](#use-linux-wifi-hotspot)
      - [Manually install](#manually-install)

## Interesting posts

- [What's the meaning of `linkdown` and `onlink' in Linux Route? - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/579087/whats-the-meaning-of-linkdown-and-onlink-in-linux-route)
- [Stop using Telnet to test ports \| Enable Sysadmin](https://www.redhat.com/sysadmin/stop-using-telnet-test-port)

## Certificates

### Add trusted certificates

*References*:

- [Adding trusted root certificates to the server](https://manuals.gfi.com/en/kerio/connect/content/server-configuration/ssl-certificates/adding-trusted-root-certificates-to-the-server-1605.html)
- [update-ca-certificates(8) — ca-certificates — Debian buster — Debian Manpages](https://manpages.debian.org/buster/ca-certificates/update-ca-certificates.8.en.html)
- [update-ca-trust(8) — Arch manual pages](https://man.archlinux.org/man/update-ca-trust.8)
- [Trust a self signed PEM certificate](https://unix.stackexchange.com/questions/17748/trust-a-self-signed-pem-certificate/126571#126571)

### Examine certificates

- `curl`:
  - Get the connection and SSL certificate details for a domain name: `curl https://example.com -vI`.

*References*:

- [Using curl to Check an SSL Certificate's Expiration Date and Details — Nick Janetakis](https://nickjanetakis.com/blog/using-curl-to-check-an-ssl-certificate-expiration-date-and-details)

## Web debugging proxies

*References*:

- [Comparing Charles Proxy, Fiddler, Wireshark, and Requestly | by Requestly | Requestly \| Medium](https://medium.com/requestly/comparing-charles-proxy-fiddler-and-wireshark-5da41363d263)
- [Wireshark is still listed, it's a lot more powerful and open source: https://cho... \| Hacker News](https://news.ycombinator.com/item?id=15792354)
- [Decrypt Traffic with Mitmproxy & Wireshark — Peter Girnus](https://www.petergirnus.com/blog/decrypting-https-traffic-with-mitmproxy-amp-wireshark)

## Check open ports

Use `ss -tupln`.

*References*:

- [How to check open ports in Linux using the CLI - nixCraft](https://www.cyberciti.biz/faq/how-to-check-open-ports-in-linux-using-the-cli/)

## `ip route`

*References*:

- [What's the meaning of `linkdown` and `onlink` in Linux Route?](https://unix.stackexchange.com/questions/579087/whats-the-meaning-of-linkdown-and-onlink-in-linux-route)
- [Interface following a link](https://serverfault.com/questions/1079631/interface-following-a-link)

## Create Hotspot

### Use `linux-wifi-hotspot`

#### Manually install

- openSUSE Tumbleweed:

  1. Install dependencies via the following commands:

     ```bash
     zypper install bash procps hostapd iproute2 iw haveged dnsmasq iptables
     ```

     *References*:

     - https://github.com/lakinduakash/linux-wifi-hotspot/tree/master#dependencies

  2. Install dependencies for building via the following commands:

     ```bash
     zypper install qrencode-devel
     ```

  3. [ ] todo
