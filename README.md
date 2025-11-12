

---

# OpenStudioLandscapesHub

## Up

```shell
/usr/bin/docker \
    compose \
    --progress plain \
    --file docker-compose.yml \
    --project-name openstudiolandscapes-hub \
    up \
    --remove-orphans \
    --detach
```

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
        router["`Router`"]
        subgraph "docker-compose.yml" 
            direction TB
            traefik["`Traefik`"]
            teleport["`Teleport`"]
            pihole["`Pihole`"]
            dns["`DNS`"]
            portainer["`Portainer`"]
            registry["`Registry`"]
        end
    end
    
    wan -- example.com --> router
    router <-- 80, 443, 8080 --> traefik
    traefik -- 443 --> teleport
    teleport ---> pihole
    pihole o--o dns
    teleport ----> portainer
    router <-- 5000 --> registry
    router <-- 53 --> dns


```