<!-- TOC -->
* [Portainer](#portainer)
  * [Expose `dockerd` API](#expose-dockerd-api)
    * [`/etc/docker/daemon.json`:](#etcdockerdaemonjson)
    * [`systemd` unit](#systemd-unit)
    * [Restart unit](#restart-unit)
  * [Protect API Access](#protect-api-access)
  * [Add Environment via Docker API URL](#add-environment-via-docker-api-url)
<!-- TOC -->

---

# Portainer

## Expose `dockerd` API

https://docs.docker.com/engine/daemon/remote-access/

### `/etc/docker/daemon.json`:

```
{
  "hosts": ["unix:///var/run/docker.sock", "tcp://0.0.0.0:2375"]
}
```

> [!CAUTION]
> 
> This did not work so far, hence, try [systemd](#systemd-unit)

### `systemd` unit

```
# ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
ExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2375 --containerd=/run/containerd/containerd.sock
```

### Restart unit

```shell
sudo systemctl daemon-reload
sudo systemctl restart docker.service docker.socket 
```

## Protect API Access

```
Oct 24 23:45:48 lenovo dockerd[2394413]: time="2025-10-24T23:45:48.547722033+02:00" level=warning msg="[DEPRECATION NOTICE]: API is accessible on http://0.0.0.0:2375 without encryption.\n         Access to the remote API is equivalent to root access on the host. Refer\n         to the 'Docker daemon attack surface' section in the documentation for\n         more information: https://docs.docker.com/go/attack-surface/\nIn future versions this will be a hard failure preventing the daemon from starting! Learn more at: https://docs.docker.com/go/api-security/"
```

https://docs.docker.com/engine/security/protect-access/

## Add Environment via Docker API URL

1. Environment-related/Environments
2. \+ Add environment
3. Docker Standalone
4. Start Wizard
5. API
   - Name: `Lenovo`
   - Docker API URL: `lenovo.farm.evil:2375`
6. Connect
7. Close