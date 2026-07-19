[![ Logo OpenStudioLandscapes ](https://github.com/michimussato/OpenStudioLandscapes/raw/main/media/images/logo128.png)](https://github.com/michimussato/OpenStudioLandscapes)

---

<!-- TOC -->
* [OpenStudioLandscapesHub](#openstudiolandscapeshub)
  * [Requirements](#requirements)
  * [Up](#up)
  * [Topology Concept](#topology-concept)
  * [DNS](#dns)
    * [Zone File Example for mydomain.com](#zone-file-example-for-mydomaincom)
<!-- TOC -->

---

# OpenStudioLandscapesHub

> [!WARNING]
> 
> This is a work in progress concept. The provided setup
> is functional but might need some manual configuration and tweaking.
> This guide will improve over time. Once it's consiered finished,
> this warning will be removed.

This is a basic Docker Compose setup to provide distributed teams (remote workers)
access to your resources created with [OpenStudioLandscapes](https://github.com/michimussato/OpenStudioLandscapes).

> [!NOTE]
> 
> As long as you're running
> [OpenStudioLandscapes](https://github.com/michimussato/OpenStudioLandscapes) 
> on a single, isolated machine, embedding Landscapes into a 
> network infrastructure is not generally needed. 

As soon as multiple machines are involved (for example workers in a render farm or 
remote collaborators accessing your locally hosted OpenStudioLandscapes 
resources), things can get complicated pretty quickly in case you
don't have such a system set up already - like a local DNS server
for instance.

OpenStudioLandscapesHub provides a basic selection of services that
enable a scalable OpenStudioLandscapes environment. A core system
of this Hub is [Pangolin](https://docs.pangolin.net/). It's open source and free (when hosted
locally).

Services provided:
- [Pangolin](pangolin/README.md)
- [Pi-Hole (DNS)](pihole/README.md)
- [Docker Registry](registry/README.md)
  - [With Registry UI](https://hub.docker.com/r/joxit/docker-registry-ui)
- [Portainer](portainer/README.md)
- [Apache Guacamole (Multi-Arch)](guacamole/README.md)
- [ntfy.sh](ntfy/README.md)

Consider:
- [Infisical](https://infisical.com/)
- [Arcane](https://getarcane.app/)
  - [The Best Docker Manager I’ve Seen! // Arcane Tutorial](https://www.youtube.com/watch?v=YwpWqdexEIk)
  - [Docs](https://getarcane.app/docs)
- [Caddy](https://caddyserver.com/)
  - already deployed in the `memoriaworks` branch

Maybe checkout this repo as `--bare`.

## Requirements

- `docker` ([Setup Guide](https://docs.docker.com/engine/install/))
- [Domain](#dns)

## Up

```shell
docker compose \
    --file docker-compose.yml \
    --project-name openstudiolandscapes-hub \
    up \
    --remove-orphans \
    --detach
```

## Topology Concept

```mermaid
---
config:
  flowchart:
    htmlLabels: false
---
flowchart TB
    wan(("`WAN`"))
    %%newLines["`Line1
    %%Line 2
    %%Line 3`"]
    subgraph "LAN"
        direction TB
        router(("`Router/Firewall`"))
        subgraph sg_host[OpenStudioLandscapesHub Host]

            subgraph sg_compose[docker-compose.yml]
                direction TB
                
                subgraph "Exposed Ports"
                    direction TB
                    %%port_53(("53"))
                    port_80(("80"))
                    port_443(("443"))
                    %%%port_5000(("5000"))
                    port_21820(("21820"))
                    port_51820(("51820"))
                end
                
                subgraph "Docker Compose Network" 
                    direction TB
                    
                    subgraph sg_pangolin[Pangolin]
                        direction TB
                        
                        %%subgraph Traefik 
                        %%    domain["`example.com`"]
                        %%    www_domain["`www.example.com`"]
                        %%    pangolin_domain["`pangolin.example.com`"]
                        %%    guacamole_domain["`guacamole.example.com`"]
                        %%    pihole_domain["`pihole.example.com`"]
                        %%    portainer_domain["`portainer.example.com`"]
                        %%    ntfy_domain["`ntfy.example.com`"]
                        %%end
                        %%traefik["`Traefik`"]
                        %%port_53(("53"))
                        pangolin_port_80(("80"))
                        pangolin_port_443(("443"))
                        %%%port_5000(("5000"))
                        pangolin_port_21820(("21820"))
                        pangolin_port_51820(("51820"))
                        pangolin["`Pangolin`"]
                        %%gerbil["`Gerbil`"]
                    end
                    
                    subgraph sg_protected
                        direction TB
                        guacamole["`Guacamole`"]
                        pihole["`Pihole (DNS)`"]
                        portainer["`Portainer`"]
                        registry["`Registry`"]
                        registry-ui["`Registry UI`"]
                        ntfy["`ntfy.sh`"]
                    end
                    
                    subgraph sg_unprotected 
                        direction TB
                        caddy["`Caddy (Web Server)`"]
                    end
                end
                
            end
        docker_sock(("`Docker Socket`"))
        end
    end
    
    wan ---> router
    
    port_80 ---> pangolin_port_80
    pangolin_port_80 ---> pangolin_port_443
    port_443 ---> pangolin_port_443
    port_21820 ---> pangolin_port_21820
    port_51820 ---> pangolin_port_51820
    %%port_80 -------> pangolin
    %%port_443 -------> www_domain
    %%port_443 -------> guacamole_domain
    %%port_443 -------> portainer_domain
    %%port_443 -------> ntfy_domain
    %%port_443 -------> pihole_domain
    %%domain ---> www_domain
    %%pangolin -------> www_domain
    %%port_443 -------> pangolin_domain
    %%pangolin -------> caddy
    %%pangolin ------> pangolin_domain
    %%pangolin ------> guacamole_domain
    %%pangolin ------> portainer_domain
    %%pangolin ------> ntfy_domain
    %%pangolin ------> pihole_domain
    
    %%port_21820 ---> pangolin
    %%port_51820 ---> pangolin
    
    router ---> port_80
    router ---> port_443
    router ---> port_21820
    router ---> port_51820
    
    %%port_80 --> port_443
    
    pangolin_port_443 --> pangolin
    pangolin_port_21820 --> pangolin
    pangolin_port_51820 --> pangolin
    
    pangolin -- guacamole.example.com -----> guacamole
    %%port_80 ---> port_443
    %%pangolin ------> port_443
    pangolin -- pihole.example.com -----> pihole
    pangolin -- portainer.example.com -----> portainer
    pangolin -- registry.example.com -----> registry
    pangolin -- registry-ui.example.com -----> registry-ui
    pangolin -- ntfy.example.com -----> ntfy
    pangolin -- example.com -----> caddy
    pangolin -- www.example.com -----> caddy
    
    %%port_443 --> example_com_internal
    %%port_443 --> www_example_com_internal
    %%example_com_internal --> www_example_com_internal
    
    %%pangolin --> www
    %%www --> caddy
    %%pangolin 
    
    %%wan -- example.com --> router
    %%pangolin -- example.com ----> caddy
    %%%%router -- 53 --> port_53
    %%router -- 80 --> port_80
    %%router -- 443 --> port_443
    %%%%router -- 5000 --> port_5000
    %%router -- 21820 --> port_21820
    %%router -- 51820 --> port_51820
    %%port_53 o-- 53 --o pihole
    %%port_80 o-- 80 --o pangolin
    %%port_443 o-- 443 --o pangolin
    %%port_21820 o-- 21820 --o pangolin
    %%port_51820 o-- 51820 --o pangolin
    %%pangolin ----> guacamole
    %%pangolin ----> portainer
    %%pangolin ----> registry-ui
    %%pangolin ----> pihole
    %%pangolin ----> ntfy
    %%registry-ui --> registry
    %%port_5000 o-- 5000 --o registry
    %%portainer o---o docker_sock
    
    classDef blue fill:#4285f4,color:#fff,stroke:#333;
    classDef red fill:#db4437,color:#fff,stroke:#333;
    classDef yellow fill:#f4b400,color:#fff,stroke:#333;
    classDef green fill:#0f9d58,color:#fff,stroke:#333;
    class sg_pangolin blue
    class sg_compose green
    %%class Network red
    class sg_host yellow
```

## DNS

DNS-01 Challenge needs API access.

### Zone File Example for mydomain.com

```
$ORIGIN mydomain.com.
@	3600	IN	SOA	[...]
@	3600	IN	NS	[ns1].
@	3600	IN	NS	[ns2].
@	3600	IN	A	<MY_PUBLIC_IP>
pangolin	3600	IN	CNAME	mydomain.com.
*.pangolin	3600	IN	CNAME	pangolin.mydomain.com.
```
