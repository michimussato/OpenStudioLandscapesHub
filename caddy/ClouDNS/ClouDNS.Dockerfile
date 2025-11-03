# For prod you'd want to pin the version: e.g., 2.9.1-builder
FROM caddy:builder AS builder

# https://caddyserver.com/docs/json/admin/identity/issuers/acme/challenges/dns/provider/cloudns/
# https://github.com/caddy-dns/cloudns
RUN xcaddy build \
    --with github.com/caddy-dns/cloudns
FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy