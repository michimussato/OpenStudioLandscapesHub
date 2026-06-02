![Memoria Works](https://avatars.githubusercontent.com/u/286479285?s=200)

---

<!-- TOC -->
* [OpenStudioLandscapesHub](#openstudiolandscapeshub)
  * [gh Client](#gh-client)
    * [Login](#login)
  * [git-crypt](#git-crypt)
    * [Install](#install)
    * [Encrypt Repo](#encrypt-repo)
    * [Decrypt Repo](#decrypt-repo)
<!-- TOC -->

---

# OpenStudioLandscapesHub

> [!TIP]
> 
> This repository contains sensitive data. Sensitive
> data is encrypted using `git-crypt`.
> 
> Resources:
> - [git-crypt - transparent file encryption in git](https://www.agwa.name/projects/git-crypt/)
> - [Github](https://github.com/AGWA/git-crypt)
>
> Files and folder which are prefixed with
> `__SECRET__` will be transparently encrypted when pushed
> to the remote (see `.gitattributes` file).
> 
> When cloning this repository, a key is required to unlock
> and decrypt encrypted files. To do so, follow the following
> steps:
> 1. `git clone <this_repository>`
> 2. `cd <this_repository>`
> 3. `git-crypt unlock <path_to_key_file>`
> 
> `git-crypt` binaries for Windows not (as of latest version `0.8`)
> provided by the maintainer and have to be built individually. 
> Here's a guide for 
> [Windows](https://www.geeksforgeeks.org/git/how-to-install-git-crypt-on-windows/):

## gh Client

References:
- [Installing gh on Linux and BSD](https://github.com/cli/cli/blob/trunk/docs/install_linux.md#debian)

```shell
(type -p wget >/dev/null || (sudo apt update && sudo apt install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
	&& out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
	&& cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& sudo mkdir -p -m 755 /etc/apt/sources.list.d \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y
```

### Login

```shell
gh auth login
```

## git-crypt

### Install

```shell
sudo apt-get update
sudo apt-get install -y git-crypt
```

### Encrypt Repo

```shell
git-crypt init
git-crypt export-key ~/memoriaworks-studio_OpenStudioLandscapesHub.key
```

### Decrypt Repo

```shell
git clone https://github.com/memoriaworks-studio/OpenStudioLandscapesHub.git
cd OpenStudioLandscapesHub
git-crypt unlock ~/memoriaworks-studio_OpenStudioLandscapesHub.key
```
