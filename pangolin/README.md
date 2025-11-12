<!-- TOC -->
* [Pangolin](#pangolin)
  * [`docker-compose.pangolin.yml`](#docker-composepangolinyml)
  * [`config.yml`](#configyml)
  * [Traefik](#traefik)
    * [Static `traefik_config.yml`](#static-traefik_configyml)
    * [Dynamic `dynamic_config.yml`](#dynamic-dynamic_configyml)
<!-- TOC -->

---

# Pangolin

Full Self-host Pangolin Documentation is available
[here](https://docs.pangolin.net/self-host/quick-install)

Pangolin volume structure:

```
../.volumes/pangolin
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
└── data/
    ├── certificates/
    └── dynamic/
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

`scp`
```shell
scp /home/michael/git/repos/OpenStudioLandscapesHub/.volumes/pangolin/config/config.yml user@192.168.178.10:/home/user/git/repos/OpenStudioLandscapesHub/.volumes/pangolin/config/
scp /home/michael/git/repos/OpenStudioLandscapesHub/.volumes/pangolin/config/traefik/*.yml user@192.168.178.10:/home/user/git/repos/OpenStudioLandscapesHub/.volumes/pangolin/config/traefik/
```

## `docker-compose.pangolin.yml`

https://docs.pangolin.net/self-host/manual/docker-compose#docker-compose-configuration

## `config.yml`

https://docs.pangolin.net/self-host/advanced/config-file#setting-up-your-config-yml

## Traefik

### Static `traefik_config.yml`

https://docs.pangolin.net/self-host/manual/docker-compose#traefik-static-configuration

### Dynamic `dynamic_config.yml`

https://docs.pangolin.net/self-host/manual/docker-compose#traefik-dynamic-configuration

### DNS

#### Wildcard Domains

https://docs.pangolin.net/self-host/advanced/wild-card-domains

