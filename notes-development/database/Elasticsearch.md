---
sitemap:
  lastmod: 2024-09-23 +0000
---

# Elasticsearch & OpenSearch

Last modified: 2024-09-23 +0000

- [Interesting posts](#interesting-posts)
- [Kibana/OpenSearch Dashboards](#kibanaopensearch-dashboards)
- [elasticdump](#elasticdump)
- [Tools](#tools)
- [ECS](#ecs)

## Interesting posts

- OpenSearch is derived from Elasticsearch 7.10.2.
- > OpenSearch is a fork of open source Elasticsearch 7.10. As such, it provides backwards REST APIs for ingest, search, and management. The query syntax and responses are also the same. In addition, OpenSearch can use indices from Elasticsearch versions 6.0 up to 7.10. We also aim to support the existing Elasticsearch clients that work with Elasticsearch 7.10.
  >
  > Note that while the OpenSearch API is backwards compatible, some clients or tools may include code, such as version checks, that may cause the client or tool to not work with OpenSearch.
- [ElectricBrain \| OpenSearch VS ElasticSearch](https://www.electricbrain.com.au/pages/analytics/opensearch-vs-elasticsearch.php)
- [Frequently Asked Questions · OpenSearch](https://opensearch.org/faq/)
- [Meilisearch vs Elasticsearch](https://blog.meilisearch.com/meilisearch-vs-elasticsearch/)
- [Compatibility matrices for Logstash and Beats](https://opensearch.org/docs/latest/tools/#compatibility-matrices)
- [OpenSearch Shards & Replicas: Explanations, Optimization & More](https://opster.com/blogs/opensearch-shards-and-replicas/)
- [Version history - OpenSearch documentation](https://opensearch.org/docs/2.11/version-history/)
- [Check OpenSearch Version: A How-to Guide](https://opster.com/guides/opensearch/opensearch-operations/checking-opensearch-version/)
- [Efficient Duplicate Prevention for Event-Based Data in Elasticsearch \| Elastic Blog](https://www.elastic.co/blog/efficient-duplicate-prevention-for-event-based-data-in-elasticsearch)
- [Elastic integrations \| Documentation](https://www.elastic.co/docs/current/integrations)
- [Elasticsearch is open source, again \| Hacker News](https://news.ycombinator.com/item?id=41394797)
- [Elasticsearch is open source, again : r/programming](https://www.reddit.com/r/programming/comments/1f4ealr/elasticsearch_is_open_source_again/)
- [Prometheus vs Elasticsearch stack - Key concepts, features, and differences \| SigNoz](https://signoz.io/blog/prometheus-vs-elasticsearch/)

## Kibana/OpenSearch Dashboards

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

## elasticdump

- For version >= 6.67.0 (<= 6.110.0), node version >= 10.0.0 is required.

*References*:

- [A practical guide to working with Elasticdump - LogRocket Blog](https://blog.logrocket.com/a-practical-guide-to-working-with-elasticdump/)

## Tools

*References*:

- [OpenSearch Monitoring Tools: A Review of Open Source Dev Tools](https://opster.com/blogs/opensearch-monitoring-tools/)
- [Use Cerebro to access an Elasticsearch cluster - Elasticsearch - Alibaba Cloud Documentation Center](https://www.alibabacloud.com/help/en/es/use-cases/use-cerebro-to-access-an-elasticsearch-cluster)

## ECS

*References*:

- [Source Fields \| Elastic Common Schema (ECS) Reference [8.11] \| Elastic](https://www.elastic.co/guide/en/ecs/current/ecs-source.html)
