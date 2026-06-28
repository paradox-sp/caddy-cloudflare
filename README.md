[![Docker Build and Publish](https://github.com/paradox-sp/caddy-cloudflare/actions/workflows/build.yml/badge.svg)](https://github.com/paradox-sp/caddy-cloudflare/actions/workflows/build.yml)
[![Docker Pulls](https://img.shields.io/docker/pulls/paradoxsp/caddy-cloudflare?logo=docker)](https://hub.docker.com/r/paradoxsp/caddy-cloudflare)
[![GitHub License](https://img.shields.io/github/license/paradox-sp/caddy-cloudflare)](https://github.com/paradox-sp/caddy-cloudflare/blob/main/LICENSE)

# caddy-cloudflare

Caddy with the [Cloudflare DNS module](https://github.com/caddy-dns/cloudflare) and optional [cloudflared](https://github.com/cloudflare/cloudflared) tunnel in a single container.

**Docker Hub:** [paradoxsp/caddy-cloudflare](https://hub.docker.com/r/paradoxsp/caddy-cloudflare)

---

## Environment variables

| Variable | Required | Description |
|----------|----------|-------------|
| `TUNNEL_ENABLED` | No | Set to `true` to start cloudflared. Default: `false` |
| `TUNNEL_TOKEN` | If tunnel enabled | Token from Cloudflare Zero Trust dashboard |
| `CF_API_TOKEN` | For TLS | Cloudflare API token with `Zone:DNS:Edit` permission |
| `ACME_EMAIL` | For TLS | Let's Encrypt account email |

---

## Cloudflare Tunnel

When `TUNNEL_ENABLED=true`, cloudflared connects outbound — no open inbound ports required.

1. Go to [Cloudflare Zero Trust](https://one.dash.cloudflare.com) → Networks → Tunnels
2. Create a tunnel → copy the token
3. Set tunnel ingress to `http://localhost:80`
4. Set `TUNNEL_ENABLED: "true"` and `TUNNEL_TOKEN` in your environment

See also:
* [Link](https://github.com/zastrixarundell/caddy-cloudflare)
