consul{
  address = "consul:8500"

}

exec {
  # apply config prometheus config command 
  command       = "/bin/prometheus --config.file=/etc/prometheus/prometheus.yml"
  command       = " /bin/alertmanager --config.file=/etc/alertmanager/alertmanager.yml"

  # apply config alertmanager config command 
  # command       = "/bin/alertmanager --config.file=/etc/alertmanager/alertmanager.yml"

  # Send reload signal when a change occurs in a watchd template
  # In this case: prometheus.yml and alertmanager.yml
  # This is the signal to listen for to trigger a reload event 
  reload_signal = "SIGHUP"

  # This defines the signal sent to the child process when Consul Template is gracefully shutting down
  kill_signal   = "SIGTERM"

  # This defines the amount of time to wait for the child process to gracefully terminate when Consul Template exits
  kill_timeout  = "15s"
}

template {
  #source      = "/etc/prometheus/prometheus.tpl"
  #destination = "/etc/prometheus/prometheus.yml"
  
  #source      = "/etc/alertmanager/alertmanager.tpl"
  #destination = "/etc/alertmanager/alertmanager.yml"
  
  source      = "/etc/prometheus/alert.tpl"
  destination = "/etc/prometheus/alert.rules"

  # permission to render the file 
  perms       = 0600
}
