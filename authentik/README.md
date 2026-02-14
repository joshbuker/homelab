# Authentik
## Setup

https://docs.goauthentik.io/install-config/install/docker-compose/

```sh
echo "PG_PASS=$(openssl rand -base64 36 | tr -d '\n')" >> .env
echo "AUTHENTIK_SECRET_KEY=$(openssl rand -base64 60 | tr -d '\n')" >> .env
```
