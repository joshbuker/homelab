# Home Assistant
## Setup

To allow for reverse proxy connections, add the following to your `config/configuration.yaml`:

```yaml
http:
  use_x_forwarded_for: true
  trusted_proxies:
    - 10.0.0.200      # Add the IP address of the proxy server
    - 172.30.33.0/24  # You may also provide the subnet mask
```
