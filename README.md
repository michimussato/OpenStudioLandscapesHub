

---

# OpenStudioLandscapes-Infra

## Up

```shell
/usr/bin/docker \
    --config docker_config \
    compose \
    --progress plain \
    --file docker-compose.yml \
    --project-name openstudiolandscapes-infra \
    up \
    --remove-orphans \
    --detach
```