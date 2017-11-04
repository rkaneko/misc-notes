misc notes
===

[![CircleCI](https://circleci.com/gh/rkaneko/misc-notes.svg?style=svg)](https://circleci.com/gh/rkaneko/misc-notes)

#### Prerequisites

```bash
$ docker-compose -v
docker-compose version 1.14.0
```

### Usage

```bash
# build docker image for mkdocs
$ docker-compose -f tools/docker/docker-compose.yml build --no-cache mkdocs_base

# mkdocs new project
$ docker-compose -f tools/docker/docker-compose.yml run --rm mkdocs_init

# build static files
$ docker-compose -f tools/docker/docker-compose.yml run --rm mkdocs_build

# serve using local dev server
$ docker-compose -f tools/docker/docker-compose.yml up --force-recreate mkdocs_serve

# run with nginx
$ docker-compose -f toos/docker/docker-compose-site.yml up --force-recreate nginx
```
