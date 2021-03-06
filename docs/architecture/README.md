### Architecture
![architecture](architecture.png)
### Nodes
- Naming convention: `{BUILDING}.{CARDINAL_POINT}.{ROOM}.{SERVICE}`
- Example: `house.north.lvgrm.window-lamp`

### Internal Reverse Proxy
- TLS Termination
- Request Logging
- Request Telemetry

### Device Router
- Routing
- Service Discovery
- Business Logic
- Interface Backend

### Elastic Search Cluster

### Firewall
- Rule set
- Interacting

### Devices and Monitors
- Single Ingress / Egress

### API

### Centralized Syslog
TL;DR Centralized `rsyslog` with logstash to elasticsearch and Sense UI overlay

At very least, for the ESP8266 chips running Tasmota, there is the option to
forward logs to an rsyslog host. This will be taken full advantage of. Logs will
be forwarded from the nodes to the centralized log server running `rsyslog-ng`.
From there, they will be formated into a json template and passed along to a
local logstash instance running on the same host.

Ideally, we could avoid some network latency and try running elasticsearch on
this same node, as well as the Sense UI over top. This may require some over
head which could result in some costs. This should be avoided. Ideally, this
project should never go over $10US a month, where that cost is spent entirely
upon the external hosting server.

### Hosting Server
TL;DR A Digital Ocean droplet which serves as a public proxy to the local private
network, a centralized log, a log search UI, and grafana dashboard... Too much?
