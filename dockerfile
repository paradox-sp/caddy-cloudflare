# Stage 1: Build Caddy with Cloudflare DNS plugin
FROM caddy:builder-alpine AS builder
RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

# Stage 2: Get cloudflared binary
FROM cloudflare/cloudflared:latest AS cloudflared

# Stage 3: Final image
FROM caddy:alpine
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY --from=cloudflared /usr/local/bin/cloudflared /usr/local/bin/cloudflared
RUN strip /usr/local/bin/cloudflared 2>/dev/null || true
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
COPY Caddyfile /etc/caddy/Caddyfile
EXPOSE 80 443 443/udp
ENTRYPOINT ["/entrypoint.sh"]