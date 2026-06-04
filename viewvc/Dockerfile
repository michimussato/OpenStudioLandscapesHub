# docker build \
#     --progress plain \
#     --shm-size=32g \
#     --tag viewvc:$(date "+%Y-%m-%d_%H-%M-%S") \
#     --tag viewvc:latest \
#     --file Dockerfile \
#     --no-cache \
#     .

# docker run --rm --interactive --tty --name viewvc-nginx --hostname viewvc docker.io/debian:bookworm-slim /bin/bash

# FROM docker.io/nginx:1.26-bookworm AS base
FROM docker.io/debian:bookworm-slim AS base
LABEL authors="michimussato@etik.com"

ARG DEBIAN_FRONTEND=noninteractive

ENV CONTAINER_TIMEZONE=Europe/UTC
ENV SET_CONTAINER_TIMEZONE=true

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

SHELL ["/bin/bash", "-c"]

RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y install \
        wget \
        python3-pip \
        python3-subversion \
        python3-pygments \
        python3-dev \
        python3-venv \
    && apt-get -y upgrade \
    && apt-get -y autoremove --purge \
    && apt-get -y clean \
    && apt-get -y autoclean


FROM base AS build

WORKDIR /download

# RUN wget https://viewvc.org/downloads/viewvc-1.3.0-beta1.tar.gz
# ./viewvc-install --help
# Usage: viewvc-install [OPTIONS]
#
# Installs the ViewVC web-based version control repository browser.
#
# Options:
#
#     --help, -h, -?    Show this usage message and exit.
#
#     --prefix=DIR      Install ViewVC into the directory DIR.  If not provided,
#                       the script will prompt for this information.
#
#     --destdir=DIR     Use DIR as the DESTDIR.  This is generally only used
#                       by package maintainers.  If not provided, the script will
#                       prompt for this information.
#
#     --clean-mode=     If 'true', overwrite existing ViewVC configuration files
#                       found in the target directory, and purge Python modules
#                       from the target directory that aren't part of the ViewVC
#                       distribution.  If 'false', do not overwrite configuration
#                       files, and do not purge any files from the target
#                       directory.  If not specified, the script will prompt
#                       for the appropriate action on a per-file basis.
RUN wget https://github.com/viewvc/viewvc/releases/download/1.3.0/viewvc-1.3.0.tar.gz \
    && tar -xzvf viewvc-1.3.0.tar.gz \
    && cd viewvc-1.3.0 \
    && ./viewvc-install --prefix=/viewvc --destdir=


FROM base AS viewvc

COPY --from=build "/viewvc" "/viewvc"

# DAEMON_OPTS=-f
# /usr/sbin/fcgiwrap $DAEMON_OPTS
# /usr/sbin/fcgiwrap -f
# /usr/sbin/fcgiwrap -p /viewvc/bin/cgi/viewvc.cgi

WORKDIR /viewvc

# ENTRYPOINT ["/usr/sbin/fcgiwrap", "-f", "-p", "/viewvc/bin/cgi/viewvc.cgi"]
ENTRYPOINT ["/usr/bin/python3", "bin/standalone.py"]
#   --config-file=FILE (-c)    Read configuration options from FILE.  If not
#                              specified, ViewVC will look for a configuration
#                              file in its installation tree, falling back to
#                              built-in default values.
#
#   --daemon (-d)              Background the server process.
#
#   --help                     Show this usage message and exit.
#
#   --host=HOSTNAME (-h)       Listen on HOSTNAME.  Required for access from a
#                              remote machine.  [default: localhost]
#
#   --htpasswd-file=FILE       Authenticate incoming requests, validating against
#                              against FILE, which is an Apache HTTP Server
#                              htpasswd file.
#
#   --port=PORT (-p)           Listen on PORT.  [default: 49152]
#
#   --repository=PATH (-r)     Serve the Subversion or CVS repository located
#                              at PATH.  This option may be used more than once.
#
#   --script-alias=PATH (-s)   Use PATH as the virtual script location (similar
#                              to Apache HTTP Server's ScriptAlias directive).
#                              For example, "--script-alias=repo/view" will serve
#                              ViewVC at "http://HOSTNAME:PORT/repo/view".
#                              [default: viewvc]
