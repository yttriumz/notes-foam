---
sitemap:
  lastmod: 2025-12-04 +0000
---

# Kubernetes Metrics

Last modified: 2025-12-04 +0000

## Metrics Server vs Prometheus

TL;DR, Metrics Server is for live resource dashboards, while Prometheus is for historical analytics and alerting.

| Aspect         | Metrics Server                                                                                                                                     | Prometheus                                                                                                                                                                            |
| :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Core Purpose   | **Live, short-term resource dashboard.** Provides real-time CPU/Memory usage for `kubectl top` and the Kubernetes Horizontal Pod Autoscaler (HPA). | **Comprehensive monitoring & alerting system.** Collects, stores, and queries a vast array of time-series metrics for long-term analysis, visualization, and alerting.                |
| Data Scope     | Narrow: Only basic node and pod CPU/Memory usage.                                                                                                  | Broad: System metrics, application metrics, custom business metrics, and everything Metrics Server provides (via a scraper).                                                          |
| Data Retention | Very short (in-memory, minutes). Not for history.                                                                                                  | Long-term (days to years) on its own time-series database.                                                                                                                            |
| Primary User   | **Kubernetes itself** (for autoscaling) and **cluster operators** (for quick CLI checks).                                                          | **SREs, DevOps engineers, developers** (for troubleshooting, capacity planning, and application performance monitoring).                                                              |
| Key Use Case   | - `kubectl top nodes/pods`<br>- **Autoscaling pods based on CPU/Memory**                                                                           | - Creating dashboards (e.g., in Grafana)<br>- Setting complex alerts (e.g., error rate > 1%)<br>- Debugging performance issues over time<br>- Monitoring application-specific metrics |
| Architecture   | Simple: Single component that fetches data from kubelets.                                                                                          | Complex: Multi-component ecosystem (server, exporters, alertmanager, client libraries).                                                                                               |

### How They Work Together

Like a **two layers of a monitoring stack**:

1.  **Layer 1: Metrics Server** - The essential, minimal layer for core Kubernetes operations (autoscaling).
2.  **Layer 2: Prometheus** - The full-featured observability platform built on top. Prometheus can even *scrape metrics from the Metrics Server* to centralize them with other data.

The diagram below illustrates this relationship and their position in the Kubernetes monitoring architecture:

```mermaid
flowchart TD
    subgraph K8s_Cluster[Kubernetes Cluster]
        Kubelet_A[Kubelet<br>Node 1]
        Kubelet_B[Kubelet<br>Node 2]
        App_Pod_A[Application Pod<br>Custom Metrics]
        App_Pod_B[Application Pod<br>Custom Metrics]
    end

    MS[Metrics Server]
    Prom[Prometheus Server]

    Kubelet_A & Kubelet_B -- "Basic Node/Pod<br>CPU/Memory" --> MS
    MS --> kubectl_top["kubectl top<br>(Live CLI View)"]
    MS --> HPA["Horizontal Pod Autoscaler<br>(Auto-scaling)"]

    Kubelet_A & Kubelet_B -- "System Metrics" --> Prom
    App_Pod_A & App_Pod_B -- "Application &<br>Custom Metrics" --> Prom
    MS -- "Can also be scraped" --> Prom

    Prom --> Grafana[Grafana<br>Dashboards]
    Prom --> AlertManager[Alert Manager<br>Notifications]
    Prom --> LongTermStorage[Long-term Storage &<br>Historical Analysis]
```
