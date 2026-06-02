![Memoria Works](https://avatars.githubusercontent.com/u/286479285?s=200)

---

<!-- TOC -->
* [cloudflare-ddns](#cloudflare-ddns)
  * [Run](#run)
<!-- TOC -->

---

# cloudflare-ddns

Reference:
- [GitHub](https://github.com/timothymiller/cloudflare-ddns)
- [Cloudflare DDNS](https://github.com/memoriaworks-studio/migration-repo/blob/main/Wiki/Infrastructure%20%26%20DevOps/01%20Setup%20Server.md#cloudflare-ddns)

Using existing Docker image from [docker.io/timothyjmiller/cloudflare-ddns](https://hub.docker.com/r/timothyjmiller/cloudflare-ddns)

## Run

### Docker compose up (--detach)

```shell
docker compose \
    --progress plain \
    --file ./docker/cloudflare-ddns/docker-compose.cloudflare-ddns.yml \
    --project-name memoriaworks \
    up \
    --pull=always \
    --remove-orphans \
    --detach
```

### Enter running container

```shell
docker exec \
    --interactive \
    --tty \
    memoriaworks-cloudflare-ddns /bin/bash
```

### Docker compose logs

```shell
docker compose \
    --progress plain \
    --file ./docker/cloudflare-ddns/docker-compose.cloudflare-ddns.yml \
    --project-name memoriaworks \
    logs \
    --follow
```

### Docker compose down

```shell
docker compose \
    --progress plain \
    --file ./docker/cloudflare-ddns/docker-compose.cloudflare-ddns.yml \
    --project-name memoriaworks \
    down
```