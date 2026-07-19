

# Caddy

```shell
docker compose \
    --file docker-compose.yml \
    --project-name caddy \
    up \
    --remove-orphans \
    --detach
```

## nginx

## Stop nginx

```shell
sudo systemctl stop nginx
```

## Start nginx

```shell
sudo systemctl start nginx && sudo journalctl -fu nginx.service
```
