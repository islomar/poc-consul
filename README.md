#Proof of concept about Consul.

dig @127.0.0.1 -p 8600 web.service.consul

### DNS API: retrieve the entire address/port pair using SRV records
dig @127.0.0.1 -p 8600 web.service.consul SRV

### DNS API: filter services by tags (e.g. rails)
dig @127.0.0.1 -p 8600 rails.web.service.consul

### Query using HTTP API
curl http://localhost:8500/v1/catalog/service/carriers

### curl POST
curl -H "Content-Type: application/json" -X POST -d '{"username":"xyz","password":"xyz"}' http://localhost:3000/api/login

### to use an external JSon file
--data @body.json

### CONSUL links:
* https://github.com/hashicorp/consul/tree/master/demo/vagrant-cluster
* https://github.com/sgargan/consul-vagrant
* HTTP API: http://www.consul.io/docs/agent/http.html
* Register a new service: http://www.consul.io/docs/agent/http.html#_v1_agent_service_register

### LINUX links:
* http://www.cyberciti.biz/tips/linux-display-open-ports-owner.html
