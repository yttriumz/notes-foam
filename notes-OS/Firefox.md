---
sitemap:
  lastmod: 2025-04-02 +0000
---

# Firefox

Last modified: 2025-04-02 +0000

## Interesting posts

- [How do I make Firefox open new tabs next to the current tab?](https://support.mozilla.org/en-US/questions/1348563)
- [Firefox scroll bar disappearing](https://superuser.com/questions/1720362/firefox-scroll-bar-disappearing)
- [high cpu usage by a firefox subprocess called RDD Process - Ask Ubuntu](https://askubuntu.com/questions/1483112/high-cpu-usage-by-a-firefox-subprocess-called-rdd-process)
- [Profiles - Where Firefox stores your bookmarks, passwords and other user data \| Firefox Help](https://support.mozilla.org/en-US/kb/profiles-where-firefox-stores-user-data)
- [Firefox has two default profiles: "default-release" and "default". Which one should I choose? - Super User](https://superuser.com/questions/1507251/firefox-has-two-default-profiles-default-release-and-default-which-one-sho)
- [Third-party cookies and Firefox tracking protection \| Firefox Help](https://support.mozilla.org/en-US/kb/third-party-cookies-firefox-tracking-protection)
- [Introducing Total Cookie Protection in Standard Mode \| Firefox Help](https://support.mozilla.org/en-US/kb/introducing-total-cookie-protection-standard-mode?as=u&utm_source=inproduct#firefox:linux:fx126)
  - [Total Cookie Protection and website breakage FAQ \| Firefox Help](https://support.mozilla.org/en-US/kb/total-cookie-protection-and-website-breakage-faq)
- [Disable the HTTP/3 (QUIC) Protocol](https://www.watchguard.com/help/docs/help-center/en-US/Content/en-US/Endpoint-Security/manage-settings/disable-http-3-protocol-for-web-access-control.html?TocPath=Troubleshooting%7C_____19)
- [How do I get firefox to show the http:// in a web address? \| Firefox Support Forum \| Mozilla Support](https://support.mozilla.org/en-US/questions/881261)
- [How do I decrease the number of suggestions in the "Awesome Bar"? \| Firefox Support Forum \| Mozilla Support](https://support.mozilla.org/en-US/questions/946909)

Concerning issues:

- [keyboard shortcut to directly search open tabs? : r/firefox](https://www.reddit.com/r/firefox/comments/wtya9t/keyboard_shortcut_to_directly_search_open_tabs/)
- [Cannot get rid of flexible space : r/firefox](https://www.reddit.com/r/firefox/comments/1j02z5i/cannot_get_rid_of_flexible_space/)

## Themes

- [FirefoxCSS-Store/FirefoxCSS-Store.github.io: A collection site of Firefox userchrome themes, mostly from FirefoxCSS Reddit community.](https://github.com/FirefoxCSS-Store/FirefoxCSS-Store.github.io)

## Disable middle click closing tabs

~~At the time of writing (*Firefox 125.0.3*), no solution.~~ At the time of updating (*Firefox 136.0.2*), setting `widget.gtk.middle-click-enabled` to `false` works, but it disables all middle click events on widget level.

*References*:

- [1439247 - "close tab with middle click" feature is disruptive on touchpads where middle click is triggered unintentionally](https://bugzilla.mozilla.org/show_bug.cgi?id=1439247)
- [browser - How do I prevent Firefox from closing tabs on middle click? - Super User](https://superuser.com/questions/113048/how-do-i-prevent-firefox-from-closing-tabs-on-middle-click)

## Disable middle click pasting

Set `middlemouse.paste` to `false` in `about:config`.

*References*:

- [disable middle mouse button PASTE in firefox [SOLVED] - Linux Mint Forums](https://forums.linuxmint.com/viewtopic.php?t=20767)
- [linux - How to disable "middle click on URL bar paste last websites URL" Firefox? - Super User](https://superuser.com/questions/1330519/how-to-disable-middle-click-on-url-bar-paste-last-websites-url-firefox/1813827#1813827)

## Open new tab next to current opened tab

Set `browser.tabs.insertAfterCurrent` to `true` in `about:config`.

*References*:

- [How do I make Firefox open new tabs next to the current tab? \| Firefox Support Forum \| Mozilla Support](https://support.mozilla.org/en-US/questions/1348563)

## Tab unloading

*References*:

- [Unload inactive tabs to save system memory in Firefox \| Firefox Help](https://support.mozilla.org/en-US/kb/unload-inactive-tabs-save-system-memory-firefox)

## Video playback

~~At the time of writing (*Firefox 136.0.4*), [certain video](https://www.bilibili.com/video/BV1wXXtYdELY) is flickery.~~ At the time of updating (*Firefox 137.0*), it's fixed. Might because of [the new HEVC playback support on Linux](https://www.mozilla.org/en-US/firefox/137.0/releasenotes/).

*References*:

- [Firefox 137 for developers - Mozilla \| MDN](https://developer.mozilla.org/en-US/docs/Mozilla/Firefox/Releases/137)
- [Web video codec guide - Media technologies on the web \| MDN](https://developer.mozilla.org/en-US/docs/Web/Media/Guides/Formats/Video_codecs#hevc_h.265)

## Zen Browser

- Hide the edge around the whole of zen browser: `zen.theme.content-element-separation`
