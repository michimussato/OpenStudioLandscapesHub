<!-- TOC -->
* [Pangolin](#pangolin)
  * [`docker-compose.pangolin.yml`](#docker-composepangolinyml)
  * [`config.yml`](#configyml)
  * [Traefik](#traefik)
    * [Static `traefik_config.yml`](#static-traefik_configyml)
    * [Dynamic `dynamic_config.yml`](#dynamic-dynamic_configyml)
    * [DNS](#dns)
      * [Wildcard Domains](#wildcard-domains)
  * [Firewall](#firewall)
  * [Site](#site)
  * [Proxy Blueprints](#proxy-blueprints)
  * [Reset](#reset)
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

## Firewall

Open ports on firewall for 80 (TCP), 443 (TCP), 51820 (UDP), and 21820 (UDP for clients)
https://docs.pangolin.net/self-host/quick-install#prerequisites

## Site

At least ONE SITE must be online in order to be able to work.

## Proxy Blueprints

https://docs.pangolin.net/manage/blueprints

> [!WARNING]
> 
> Bug: Creating Resource via Blueprint or with Labels
> not working after reboot. 
> Documented [here](https://github.com/fosrl/pangolin/issues/1709#issuecomment-3529004161).
> Use manual using the Web UI for now.

Current (manual) Resources:

![2025-11-13_19-27.png](.media/2025-11-13_19-27.png)

```yaml
proxy-resources:
  nice-resource-id:
    name: "Nice Resource Name"
    # subdomain: 
    full-domain: resource.pangolin.openstudiolandscapes.cloud-ip.cc
    protocol: http
    auth:
      sso-enabled: true
    targets:
      - site: <site-nice-id>
        hostname: <resource>
        method: http
        port: <port>
```

is equivalent to

https://docs.pangolin.net/manage/blueprints#docker-labels-format

```yaml
services:
  transmission:
    labels:
      - pangolin.proxy-resources.transmission.name=Transmission
      - pangolin.proxy-resources.transmission.full-domain=transmission.pangolin.openstudiolandscapes.cloud-ip.cc
      - pangolin.proxy-resources.transmission.protocol=http
      - pangolin.proxy-resources.transmission.auth.sso-enabled=true
      - pangolin.proxy-resources.transmission.targets[0].method=http
      - pangolin.proxy-resources.transmission.targets[0].hostname=transmission
      - pangolin.proxy-resources.transmission.targets[0].port=9091
```

and make sure to add

```yaml
services:
  newt:
    environment:
      - DOCKER_SOCKET=/var/run/docker.sock
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock

networks:
  default:
    name: pangolin_default
```

to the `newt` service.


## Reset

```shell
sudo rm ~/git/repos/OpenStudioLandscapesHub/.volumes/pangolin/__SECRET__config/key
sudo rm ~/git/repos/OpenStudioLandscapesHub/.volumes/pangolin/__SECRET__config/db/db.sqlite
sudo rm ~/git/repos/OpenStudioLandscapesHub/.volumes/pangolin/__SECRET__config/letsencrypt/*.json
```