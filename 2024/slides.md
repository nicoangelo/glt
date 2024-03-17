---
theme: ../common/theme.json
author: Nicolas Angelo
paging: "%d / %d"
date: 2024-04-06
---

# Metriken für alle

mit Prometheus und Grafana

Nicolas Angelo, Grazer Linuxtage 2024

---

# `whoami`

- Elektrotechnik studiert, Händchen für Software
- Lead Site Reliability Engineer @Nuki
- Freelancing DevOps Projekte und Trainings
- aktuelles Monster-Projekt: Kubernetes Migration

---

# Agenda

- Warum?
- Prometheus Basics
- Zwei Beispiele:
  - Node Exporter auf einer Linux VM
  - Custom exporter auf einem RPi Pico
- Grafana Dashboards

---

# Warum?

Im Zuge der Kubernetes Migration auch Metrics/KPI Collection vereinheitlicht.

Prometheus braucht theoretisch keine weitere Dependency, außer einen HTTP Server.

Sollte man Metriken auf Mikrocontrollern mit HTTP ausliefern? Vermutlich nicht.

Zeigen, wie einfach man ein passables Monitoring Setup hinbekommt

---

# Voraussetzungen

- Linux VM (Debian in VirtualBox)
- Docker lokal installiert
- tinygo

---

# Prometheus

- entstand 2012 bei Soundcloud als Open Source, mittlerweile _CNCF graduated_
- _scrapet_ Metriken von definierten _targets_ ("pull model")
- speichert Metriken als Zeitserien (Time Series)
- bringt eine einfache UI mit
- hat eine eigene Query Language - _PromQL_

---

# Prometheus

Der einfachste Anwendungsfall

```
~~~graph-easy --as=boxart
digraph {
  rankdir="LR"
  P  [label="Prometheus Server"]
  T  [label="Scrape Target"]

  P -> T [label="GET /metrics"]
}
~~~
```

---

# Das _Exposition Format_

```
# HELP <metric name> <description>
# TYPE <metric name> <metric type>
<metric name>{<label name>=<label value>, ...} <value>
```

---

# Das _Exposition Format_

```
# HELP http_requests_total The total number of HTTP requests.
# TYPE http_requests_total counter
http_requests_total{method="post",code="200"} 1027
http_requests_total{method="post",code="400"}    3
```

---

# Exporter

Software die

- Metriken über das _System_* sammelt
- als Prometheus Metriken verpackt/aggregiert
- über HTTP für Prometheus zum _scrapen_ bereitstellt

*) _System_ kann z.B. auch eine Rest API sein

---

# Node Exporter auf einer Linux VM

```
wget -O - https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.linux-amd64.tar.gz | tar xvzf -
node_exporter-1.7.0.linux-amd64/node_exporter
```

---

# Custom exporter auf einem RPi Pico

- tinygo: https://tinygo.org/
- tinygo for Pico W: https://github.com/soypat/cyw43439

---

# Grafana Dashboards

Proudly found elsewhere - Große Sammlung von bereits vorkonfigurierten Dashboards:

https://grafana.com/grafana/dashboards/

---

# Resources

## Prometheus & Grafana Setup

- Simple Prometheus & Grafana setup: https://github.com/docker/awesome-compose/tree/master/prometheus-grafana
- Node Exporter: https://github.com/prometheus/node_exporter
- Dashboard Collection: https://grafana.com/grafana/dashboards/

## Webserver auf RPi Pico W mit Go

- https://github.com/tinygo-org/tinygo
- https://github.com/soypat/cyw43439

---

# Reach out

**Github**: @nicoangelo

**LinkedIn**: [Nicolas Angelo](https://www.linkedin.com/in/nicoangelo)

