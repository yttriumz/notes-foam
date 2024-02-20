# Databases

Last modified: 2024/02/02 UTC

- [Interesting posts](#interesting-posts)
- [PostgreSQL](#postgresql)
- [Elasticsearch/OpenSearch](#elasticsearchopensearch)
  - [Kibana/OpenSearch Dashboards](#kibanaopensearch-dashboards)
  - [elasticdump](#elasticdump)
  - [Tools](#tools)

## Interesting posts

- [Database.Guide](https://database.guide/)
- [《Designing Data-Intensive Application》DDIA中文翻译](https://github.com/Vonng/ddia)
- [Database design with UML and SQL, 4th edition](https://web.csulb.edu/colleges/coe/cecs/dbdesign/dbdesign.php)
- [Shard (database architecture) - Wikipedia](https://en.wikipedia.org/wiki/Shard_(database_architecture))

## PostgreSQL

*References*:

- [postgres - Official Image](https://github.com/docker-library/docs/blob/master/postgres/README.md)
- [Docker PostgreSQL: Efficient Database Management with Containers](https://hevodata.com/learn/docker-postgresql/#step2)
- [Three Easy Steps to Install Docker PostgreSQL](https://linuxhint.com/three-easy-steps-to-install-docker-postgresql/)

## Elasticsearch/OpenSearch

- OpenSearch is derived from Elasticsearch 7.10.2.
- > OpenSearch is a fork of open source Elasticsearch 7.10. As such, it provides backwards REST APIs for ingest, search, and management. The query syntax and responses are also the same. In addition, OpenSearch can use indices from Elasticsearch versions 6.0 up to 7.10. We also aim to support the existing Elasticsearch clients that work with Elasticsearch 7.10.
  >
  > Note that while the OpenSearch API is backwards compatible, some clients or tools may include code, such as version checks, that may cause the client or tool to not work with OpenSearch.

*References*:

- [Frequently Asked Questions · OpenSearch](https://opensearch.org/faq/)
- [Compatibility matrices for Logstash and Beats](https://opensearch.org/docs/latest/tools/#compatibility-matrices)
- [OpenSearch Shards & Replicas: Explanations, Optimization & More](https://opster.com/blogs/opensearch-shards-and-replicas/)
- [Version history - OpenSearch documentation](https://opensearch.org/docs/2.11/version-history/)

### Kibana/OpenSearch Dashboards

- OpenSearch Dashboards is derived from Kibana 7.10.2.

*References*:

- [Elastic: Search Results \| Elastic](https://www.elastic.co/search?q=unsafe-eval&size=n_20_n&filters%5B0%5D%5Bfield%5D=product_name&filters%5B0%5D%5Bvalues%5D%5B0%5D=Kibana&filters%5B0%5D%5Btype%5D=all&filters%5B1%5D%5Bfield%5D=website_area&filters%5B1%5D%5Bvalues%5D%5B0%5D=documentation&filters%5B1%5D%5Btype%5D=all&sort-field=%2C%20&sort-direction=)
- [Does Kibana need the autorisation of 'unsafe-inline' or 'unsafe-eval' to work properly - Elastic Stack / Kibana - Discuss the Elastic Stack](https://discuss.elastic.co/t/does-kibana-need-the-autorisation-of-unsafe-inline-or-unsafe-eval-to-work-properly/234390)
- [Client-side unsafe-eval Sandbox · Issue #27047 · elastic/kibana](https://github.com/elastic/kibana/issues/27047)
- [A single content security policy error appears in browser console on load · Issue #30468 · elastic/kibana](https://github.com/elastic/kibana/issues/30468)
- [CSP unsafe-eval auditing · Issue #36311 · elastic/kibana](https://github.com/elastic/kibana/issues/36311)
- [\[Reporting\] Refused to execute inline script error in Kibana log when generating a report · Issue #55997 · elastic/kibana](https://github.com/elastic/kibana/issues/55997)
- [CSP default-src 'self' · Issue #56996 · elastic/kibana](https://github.com/elastic/kibana/issues/56996)
- [Add csp.disableUnsafeEval config option to remove the unsafe-eval CSP by watson · Pull Request #124484 · elastic/kibana](https://github.com/elastic/kibana/pull/124484)

### elasticdump

- For version >= 6.67.0 (<= 6.110.0), node version >= 10.0.0 is required.

### Tools

*References*:

- [OpenSearch Monitoring Tools: A Review of Open Source Dev Tools](https://opster.com/blogs/opensearch-monitoring-tools/)
- [Use Cerebro to access an Elasticsearch cluster - Elasticsearch - Alibaba Cloud Documentation Center](https://www.alibabacloud.com/help/en/es/use-cases/use-cerebro-to-access-an-elasticsearch-cluster)
