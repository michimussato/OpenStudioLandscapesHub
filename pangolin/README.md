<!-- TOC -->
* [Pangolin](#pangolin)
<!-- TOC -->

---

# Pangolin

Git Submodule added with

```shell
git -C pangolin submodule add https://github.com/fosrl/pangolin.git
```

```
.
├── config/
│   ├── config.yml (*)
│   ├── db/
│   │   └── db.sqlite
│   ├── key
│   ├── letsencrypt/
│   │   └── acme.json
│   ├── logs/
│   └── traefik/
│       ├── traefik_config.yml (*)
│       └── dynamic_config.yml (*)
└── docker-compose.yml (*)
```

```shell
mkdir -p \
    ../.volumes/pangolin/data/certificates \
    ../.volumes/pangolin/data/dynamic \
    ../.volumes/pangolin/config/traefik \
    ../.volumes/pangolin/config/db \
    ../.volumes/pangolin/config/letsencrypt \
    ../.volumes/pangolin/config/logs
```

## `docker-compose.yml`

https://docs.pangolin.net/self-host/manual/docker-compose#docker-compose-configuration

## `config.yml`

https://docs.pangolin.net/self-host/advanced/config-file#setting-up-your-config-yml

## Traefik

### Static `traefik_config.yml`

https://docs.pangolin.net/self-host/manual/docker-compose#traefik-static-configuration

### Dynamic `dynamic_config.yml`

https://docs.pangolin.net/self-host/manual/docker-compose#traefik-dynamic-configuration

