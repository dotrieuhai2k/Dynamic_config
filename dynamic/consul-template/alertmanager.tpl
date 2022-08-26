global:
  resolve_timeout: {{key "resolve_timeout"}}

route:
  group_by: alertmanager
  group_wait: {{key "group_wait"}}
  group_interval: {{key "group_interval"}}
  repeat_interval: {{key "repeat_interval"}}
  receiver: email_default 
  - match:
      severity: critical|warning
    receiver: email_default
      routes:
        {{ range ls "db/routes"}}
        {{ .Value }}{{end}}

receivers:
  {{ range ls "db/receivers"}}
  {{ .Value }}{{end}}
