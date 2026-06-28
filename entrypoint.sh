#!/bin/sh
set -e

if [ "${TUNNEL_ENABLED}" = "true" ]; then
  [ -z "${TUNNEL_TOKEN}" ] && echo "TUNNEL_TOKEN required" >&2 && exit 1
  cloudflared tunnel --no-autoupdate run --token "${TUNNEL_TOKEN}" 2>&1 | sed 's/^/[cloudflared] /' &
fi

exec caddy run --config /etc/caddy/Caddyfile --adapter caddyfile