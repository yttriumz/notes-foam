---
sitemap:
  lastmod: 2024-09-11 +0000
---

# Single Sign-On

Last modified: 2024-09-11 +0000

- [Interesting posts](#interesting-posts)
- [Shibboleth](#shibboleth)
  - [IDP](#idp)
    - [Existing container builds](#existing-container-builds)
  - [SP](#sp)
- [Casdoor](#casdoor)

## Interesting posts

- [What is SSO? \| How single sign-on works \| Cloudflare](https://www.cloudflare.com/learning/access-management/what-is-sso/)
- [Why Is Single Sign-On (SSO) Important? \| OneLogin](https://www.onelogin.com/learn/why-sso-important)
- [Trying to understand SSO. How is it more secure? : r/sysadmin](https://www.reddit.com/r/sysadmin/comments/16mwv9s/trying_to_understand_sso_how_is_it_more_secure/)
- [robchahin/sso-wall-of-shame: A list of vendors that treat single sign-on as a luxury feature, not a core security requirement.](https://github.com/robchahin/sso-wall-of-shame)
- [ssotax/ssotax: A list of vendors that treat single sign-on as a luxury feature, not a core security requirement.](https://github.com/ssotax/ssotax)

## Shibboleth

*References*:

- [Shibboleth Concepts - Confluence](https://shibboleth.atlassian.net/wiki/spaces/CONCEPT/overview)
- [Shibboleth Login Details \| NC State Shibboleth](https://docs.shib.ncsu.edu/docs/shiblogindetails.html)

### IDP

*References*:

- [SystemRequirements - Identity Provider 4 - Confluence](https://shibboleth.atlassian.net/wiki/spaces/IDP4/pages/1265631833/SystemRequirements)
- [Installation - Identity Provider 4 - Confluence](https://shibboleth.atlassian.net/wiki/spaces/IDP4/pages/1265631502/Installation)

#### Existing container builds

- [iay/shibboleth-idp-docker: Shibboleth IdP deployment using Docker](https://github.com/iay/shibboleth-idp-docker)
- [winstonhong/Shibboleth-SAML-IdP-and-SP: Shibboleth SAML identity provider and SAML service provider](https://github.com/winstonhong/Shibboleth-SAML-IdP-and-SP/tree/master)
- [InCommon Trusted Access Platform Release - InCommon Trusted Access Platform Library - Internet2 Wiki](https://spaces.at.internet2.edu/display/ITAP/InCommon+Trusted+Access+Platform+Release)
  - [tier/shib-idp Tags \| Docker Hub](https://hub.docker.com/r/tier/shib-idp/tags)
    - doc: [TIER Shibboleth-IdP Container Instructions](https://docs.google.com/document/d/1qb5XTde1nulCdA_8QUei48CxDj0lQs7ShD622Ze_4II/edit)
    - source code: [TIER "Standalone" Shibboleth-IdP](https://github.internet2.edu/docker/shib-idp)
  - [tier/shibbidp_configbuilder_container Tags \| Docker Hub](https://hub.docker.com/r/tier/shibbidp_configbuilder_container/tags)
    - doc:
      - [TIER Shibboleth-IdP Config Builder Docker image](https://spaces.at.internet2.edu/display/TPD/TIER+Shibboleth-IdP+Config+Builder+Docker+image)
      - [Using TAP Shibboleth IdP Upstream Container](https://docs.google.com/document/d/17-0O3Tvty9PONL6wu4PiC6ZWramdyntXmOsq1UpD2tE/edit)
    - source code: [ShibbIdP_ConfigBuilder_Container](https://github.internet2.edu/docker/ShibbIdP_ConfigBuilder_Container)
- [Unicon/shibboleth-idp-dockerized: A Shibboleth Identity Provider (IdP) base-image](https://github.com/Unicon/shibboleth-idp-dockerized)
  - [UniconLabs/dockerized-idp-testbed: Used to validate the dockerized shibboleth-idp image.](https://github.com/UniconLabs/dockerized-idp-testbed)

### SP

*References*:

- [CheckVersion - Service Provider 3 - Confluence](https://shibboleth.atlassian.net/wiki/spaces/SP3/pages/2065335710/CheckVersion)
- [Apache - Service Provider 3 - Confluence](https://shibboleth.atlassian.net/wiki/spaces/SP3/pages/2065335062/Apache#Apache-SetHandler)

## Casdoor

*References*:

- [Overview \| Casdoor · An Open Source UI-first Identity Access Management (IAM) / Single-Sign-On (SSO) platform supporting OAuth 2.0, OIDC, SAML and CAS](https://casdoor.org/docs/overview)
