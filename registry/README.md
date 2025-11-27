<!-- TOC -->
* [Registry](#registry)
  * [DNS](#dns)
  * [Create Certificates](#create-certificates)
    * [Create Certificate Authority Certificates (CA)](#create-certificate-authority-certificates-ca)
    * [Create Server Certificate](#create-server-certificate)
    * [Resulting Structure](#resulting-structure)
  * [Add User/Password to `htpasswd`](#add-userpassword-to-htpasswd)
  * [Add `rootCA.crt` to CA-Certificates Store](#add-rootcacrt-to-ca-certificates-store)
    * [Debian](#debian)
    * [Arch](#arch)
  * [Login to Docker](#login-to-docker)
  * [`docker compose up`](#docker-compose-up)
  * [Test](#test)
  * [Issues](#issues)
<!-- TOC -->

---

# Registry

References
- https://www.youtube.com/watch?v=uM3a-rzACbM

```
$ tree -pug registry
[drwxr-xr-x user     user    ]  registry
├── [-rw-r--r-- user     user    ]  README.md
└── [drwxr-xr-x user     user    ]  volumes
    ├── [drwxr-xr-x user     user    ]  auth
    ├── [drwxr-xr-x user     user    ]  certs
    └── [drwxr-xr-x user     user    ]  data

5 directories, 1 file
```

## DNS

```
$ dig registry.openstudiolandscapes.lan

; <<>> DiG 9.20.13 <<>> registry.openstudiolandscapes.lan
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 32244
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1232
;; QUESTION SECTION:
;registry.openstudiolandscapes.lan. IN  A

;; ANSWER SECTION:
registry.openstudiolandscapes.lan. 0 IN CNAME   openstudiolandscapes.lan.
openstudiolandscapes.lan. 0     IN      A       192.168.178.10

;; Query time: 4 msec
;; SERVER: 192.168.178.10#53(192.168.178.10) (UDP)
;; WHEN: Mon Nov 10 10:46:08 CET 2025
;; MSG SIZE  rcvd: 116
```

## Create Certificates

References
- https://github.com/jeffspiinthesky/pki
- https://github.com/jeffspiinthesky/pki/blob/main/create_ca_cert.sh

```shell
git clone https://github.com/jeffspiinthesky/pki
cd pki
chmod +x *.sh
```

### Create Certificate Authority Certificates (CA)

```shell
./create_ca_cert.sh
```

Password: `myp4ssword`

```
$ cat conf/ca-create.conf 
[ req ]
default_bits           = 2048
default_keyfile        = openstudiolandscapes_ca.pem
distinguished_name     = openstudiolandscapes_ca
attributes             = req_attributes
req_extensions         = v3_ca
prompt                 = no
output_password        = myp4ssword
dirstring_type = nobmp

[ openstudiolandscapes_ca ]
C                      = CH
ST                     = GR
L                      = Chur
O                      = OpenStudioLandscapes
OU                     = Registry
CN                     = openstudiolandscapes_ca
emailAddress           = michimussato@gmail.com

[ req_attributes ]
challengePassword              = myp4ssword
challengePassword_min          = 4
challengePassword_max          = 20

[ v3_ca ]

subjectKeyIdentifier=hash
authorityKeyIdentifier=keyid:always,issuer:always
basicConstraints = critical, CA:true
```

### Create Server Certificate

```shell
./create_server_cert.sh
```

### Resulting Structure

```
 $ tree -pug .
[drwxr-xr-x user     user    ]  .
├── [drwxr-xr-x user     user    ]  client_keys
├── [-rwxr-xr-x user     user    ]  common.sh
├── [drwxr-xr-x user     user    ]  conf
│   ├── [-rw-r--r-- user     user    ]  ca-create.conf
│   ├── [-rw-r--r-- user     user    ]  domain-csr-req.conf
│   ├── [-rw-r--r-- user     user    ]  domain.ext
│   └── [-rw-r--r-- user     user    ]  orgs.conf
├── [-rwxr-xr-x user     user    ]  create_ca_cert.sh
├── [-rwxr-xr-x user     user    ]  create_client_cert.sh
├── [-rwxr-xr-x user     user    ]  create_server_cert.sh
├── [drwxr-xr-x user     user    ]  private_keys
│   ├── [-rw------- user     user    ]  registry.openstudiolandscapes.lan.key
│   └── [-rw------- user     user    ]  rootCA.key
├── [drwxr-xr-x user     user    ]  public_keys
│   ├── [-rw-r--r-- user     user    ]  registry.openstudiolandscapes.lan.crt
│   ├── [-rw-r--r-- user     user    ]  rootCA.crt
│   └── [-rw-r--r-- user     user    ]  rootCA.srl
├── [-rw-r--r-- user     user    ]  README.md
└── [drwxr-xr-x user     user    ]  templates
    ├── [-rw-r--r-- user     user    ]  ca-create.templ
    ├── [-rw-r--r-- user     user    ]  client-csr-req.templ
    ├── [-rw-r--r-- user     user    ]  domain-csr-req.templ
    └── [-rw-r--r-- user     user    ]  domain.templ

6 directories, 18 files
```

```shell
cp ./private_keys/registry.openstudiolandscapes.lan.key <PATH_TO_OPENSTUDIOLANDSCAPESHUB_REPO>/.volumes/data/registry/certs/
cp ./public_keys/registry.openstudiolandscapes.lan.crt <PATH_TO_OPENSTUDIOLANDSCAPESHUB_REPO>/.volumes/data/registry/certs/
```

## Add User/Password to `htpasswd`

```shell
docker run --entrypoint htpasswd httpd:2 -Bbn registry-user registry-password >> <PATH_TO_OPENSTUDIOLANDSCAPESHUB_REPO>/.volumes/data/registry/auth/htpasswd
```

## Add `rootCA.crt` to CA-Certificates Store

> [!IMPORTANT]
> 
> The `rootCA.crt` has to be installed on _*every*_ individual host and restart
> Docker daemon after successful installation.
 
### Debian

```shell
sudo cp public_keys/rootCA.crt /usr/local/share/ca-certificates/
sudo update-ca-certificates
```

```
Updating certificates in /etc/ssl/certs...
rehash: warning: skipping ca-certificates.crt,it does not contain exactly one certificate or CRL
1 added, 0 removed; done.
Running hooks in /etc/ca-certificates/update.d...
done.
```

References to
- https://www.openmediavault.org/

### Arch

References
- https://wiki.archlinux.org/title/User:Grawity/Adding_a_trusted_CA_certificate

```shell
sudo trust anchor --store ~/Downloads/rootCA.crt
```

## Login to Docker

> [!IMPORTANT]
> 
> Adding a root CA while the `docker` daemon is running requires
> a `docker` daemon restart
> > ```
> > Error response from daemon: Get "https://registry.<YOUR_LAN_DOMAIN>:5000/v2/": tls: failed to verify certificate: x509: certificate signed by unknown authority
> > ```
> ```shell
> sudo systemctl restart docker
> ```

```shell
docker login registry.openstudiolandscapes.lan:5000
```

```
Username: registry-user
Password: 

WARNING! Your credentials are stored unencrypted in '/home/user/.docker/config.json'.
Configure a credential helper to remove this warning. See
https://docs.docker.com/go/credential-store/

Login Succeeded
```

Results in

```
$ cat ~/.docker/config.json
{
        "auths": {
                "registry.openstudiolandscapes.lan:5000": {
                        "auth": "cmVnaXN0cnktdXNlcjpyZWdpc3RyeS1wYXNzd29yZA=="
                }
        }
}
```

## `docker compose up`

```shell
/usr/bin/docker \
    --config ~/.docker/ \
    compose \
    --progress plain \
    --file docker-compose.yml \
    up \
    --remove-orphans \
    --detach
```

## Test

```shell
docker pull ubuntu:16.04
docker tag ubuntu:16.04 registry.openstudiolandscapes.lan:5000/my-test-repo/ubuntu:1
docker push registry.openstudiolandscapes.lan:5000/my-test-repo/ubuntu:1
```

```
The push refers to repository [registry.openstudiolandscapes.lan:5000/my-test-repo/ubuntu]
1251204ef8fc: Pushed 
47ef83afae74: Pushed 
df54c846128d: Pushed 
be96a3f634de: Pushed 
1: digest: sha256:a3785f78ab8547ae2710c89e627783cfa7ee7824d3468cae6835c9f4eae23ff7 size: 1150
```

## Issues

```
registry  | time="2025-11-10T09:27:59.57136951Z" level=error msg="traces export: Post \"https://localhost:4318/v1/traces\": dial tcp [::1]:4318: connect: connection refused" environment=development go.version=go1.23.7 instance.id=09d8dc2a-03d3-42c6-a155-bf7a8a1d301f service=registry version=3.0.0
```

- Restart Docker after Root CA installation!
