[![ Logo OpenStudioLandscapes ](https://github.com/michimussato/OpenStudioLandscapes/raw/main/media/images/logo128.png)](https://github.com/michimussato/OpenStudioLandscapes)

---

<!-- TOC -->
* [OpenStudioLandscapesHub](#openstudiolandscapeshub)
  * [Requirements](#requirements)
  * [Up](#up)
  * [Topology](#topology)
  * [DNS](#dns)
    * [Zone File](#zone-file)
<!-- TOC -->

---

# OpenStudioLandscapesHub

> [!WARNING]
> 
> This is a work in progress concept. The provided setup
> is functional but might need some manual configuration and tweaking.
> Once this 

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
enable a scalable OpenStudioLandscapes environment.

Services provided:
- [Pangolin](pangolin/README.md)
- [Pi-Hole (DNS)](pihole/README.md)
- [Docker Registry](registry/README.md)
  - [With Registry UI](https://hub.docker.com/r/joxit/docker-registry-ui)
- [Portainer](portainer/README.md)
- [Apache Guacamole (Multi-Arch)](guacamole/README.md)

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
        subgraph "OpenStudioLandscapesHub Host" 

            subgraph "docker-compose.yml" 
                direction TB
                
                subgraph "Exposed Ports"
                    direction TB
                    port_53(("53"))
                    port_80(("80"))
                    port_443(("443"))
                    port_5000(("5000"))
                end
                
                subgraph "Docker Compose Network" 
                    direction TB
                    pangolin["`Pangolin`"]
                    guacamole["`Guacamole`"]
                    pihole["`Pihole (DNS)`"]
                    portainer["`Portainer`"]
                    registry["`Registry`"]
                    registry-ui["`Registry UI`"]
                end
                
            end
        docker_sock(("`Docker Socket`"))
        end
    end
    
    wan -- example.com --> router
    router -- 53 --> port_53
    router -- 80 --> port_80
    router -- 443 --> port_443
    router -- 5000 --> port_5000
    port_53 o-- 53 --o pihole
    port_80 o-- 80 --o pangolin
    port_443 o-- 443 --o pangolin
    pangolin ----> guacamole
    pangolin ----> portainer
    pangolin ----> registry-ui
    pangolin ----> pihole
    registry-ui --> registry
    port_5000 o-- 5000 --o registry
    portainer o---o docker_sock
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
