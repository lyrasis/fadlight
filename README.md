# FadLight

A JIT configurable ArcLight using [Docker](https://www.docker.com).

## Getting started

### With Docker for the app

Pre-reqs:

- [Docker](https://www.docker.com)
- [Docker Compose](https://docs.docker.com/compose)

```bash
docker-compose build
docker-compose up
```

### Without Docker for the app

MySQL should be ready: `localhost:3306`, `root:123456`, `fadlight_development`.
Solr should be available at: `http://127.0.0.1:8983/solr/arclight`

```bash
# services via docker if needed
docker-compose up -d db
docker-compose up -d solr

# run the app locally
cp .env .env.local
./startup.sh
```

## Loading data

```bash
PROVIDER=https://archivesspace.lyrasistechnology.org/oai
docker run -it --rm --net=host \
  -e OAI_ENDPOINT=$PROVIDER \
  -e REPOSITORY_URL=https://s3-us-west-2.amazonaws.com/as-public-shared-files/dts/dts.repo.yml \
  -e SOLR_URL=http://localhost:8983/solr/arclight \
  lyrasis/arclight-oai-indexer:latest bundle exec rake arclight:index:oai[1970-01-01]
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
FOOTER_URL=https://example.com/footer.erb
HEADER_URL=https://example.com/header.erb
JS_URL=https://example.com/example.js
LOCALES_URL=https://example.com/en.yml
LOGO_URL=https://example.com/logo.png
REPOSITORY_URL=https://example.com/repositories.yml
THEME_CSS_URL=https://example.com/theme.css
```

## Overriden files:

- `app/views/layouts/blacklight/base.html.erb` (BlackLight)
- `app/views/shared/_header_navbar.html.erb` (ArcLight)

---
