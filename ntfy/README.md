<!-- TOC -->
* [ntfy.sh](#ntfysh)
  * [server.yml](#serveryml)
  * [Create Admin User](#create-admin-user)
  * [Send Messages with Authentication](#send-messages-with-authentication)
  * [Pangolin](#pangolin)
<!-- TOC -->

---

# ntfy.sh

Resources:
- https://www.youtube.com/watch?v=poDIT2ruQ9M
- https://www.youtube.com/watch?v=daAnDgC34Kw
- https://thomaswildetech.com/blog/2025/07/31/setting-up-ntfy-and-loggifly/

- [Docker Compose](https://docs.ntfy.sh/install/#docker)
- [Github](https://github.com/binwiederhier/ntfy)
- [server.yml](https://github.com/binwiederhier/ntfy/blob/main/server/server.yml)

## server.yml

Allow authenticated users only:
```yml
auth-file: /var/lib/ntfy/user.db
auth-default-access: "deny-all"
```

Set `behind-proxy: true` due to use of Pangolin
- https://docs.ntfy.sh/troubleshooting/#other

## Create Admin User

Resources:
- https://docs.ntfy.sh/config/#users-via-the-cli

```shell
docker exec -it ntfy sh
ntfy user add --role=admin <username>
ntfy token add <username>
```

## Send Messages with Authentication

Resources:
- https://docs.ntfy.sh/publish/#authentication

```shell
curl -H "Authorization: Bearer <token>" -d "Hello World" https://ntfy.pangolin.<your-domain.com>/<subscription>
```

## Pangolin

Disable "Use Platform SSO" for Resource `ntfy.pangolin.<your-domain.com>` in Pangolin.
- [ ] Test with Sharable Link
