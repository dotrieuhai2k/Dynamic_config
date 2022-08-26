global:
  scrape_interval: {{key "scrape_interval"}}
  evaluation_interval: {{key "evaluation_interval"}}

alerting:
  alertmanagers:
    - static_configs:
      - targets:
        - alertmanager:9093

rule_files:
  - "alert.rules"

scrape_configs:
  - job_name: "prometheus"
    scrape_interval: 1m
    static_configs:
    - targets: ["{{key "ip_prometheus"}}"]

  - job_name: "node-exporter" 
    static_configs:
    - targets: ["{{key "ip_node"}}"]
