# FadLight

A JIT configurable ArcLight using [Docker](https://www.docker.com).

## Pre-steps (fyi only, skip this)

For a new rails project only, add the ArcLight gems then:

```bash
./bin/rails generate blacklight:install --devise
./bin/rails generate arclight:install -f
```

## Getting started

Pre-reqs:

- [Docker](https://www.docker.com)
- [Docker Compose](https://docs.docker.com/compose)

```bash
docker-compose build
docker-compose up
```

## Loading data

```bash
PROVIDER=https://archivesspace.lyrasistechnology.org/oai
docker run -it --rm --net=host \
  -e OAI_ENDPOINT=$PROVIDER \
  -e SOLR_URL=http://localhost:8983/solr/arclight \
  lyrasis/arclight-oai-indexer:latest bundle exec rake arclight:oai:index[1970-01-01]
```

## Docker runtime environment variables

```bash
# RAILS CONFIG ENVVARS (config/)
DATABASE_HOST=127.0.0.1
DATABASE_NAME=fadlight_production
DATABASE_USERNAME=fadlight
DATABASE_PASSWORD=secret
RAILS_LOG_TO_STDOUT=true # preferred for docker
RAILS_SERVE_STATIC_FILES=true
SECRET_KEY_BASE=supersecretkey
SOLR_URL=http://localhost:8983/solr/arclight

# FADLIGHT CONFIG ENVVARS (startup.sh)
FAVICON_URL=https://example.com/favicon.ico
JS_URL=https://example.com/example.js
LOCALES_URL=https://example.com/en.yml
LOGO_URL=https://example.com/logo.png
REPOSITORY_URL=https://example.com/repositories.yml
THEME_CSS_URL=https://example.com/theme.css
```

---
