# FadLight

A JIT configurable ArcLight using [Docker](https://www.docker.com). To be
more specific it's a vanilla Rails + ArcLight application that provides
a Rake task (`./bin/rake fadlight:assets:download`) to download a limited
set of customizations to apply for each deployment.

## Getting started

```bash
# run mysql & solr using docker
docker-compose up -d

# update cfg if preferred
cp .env .env.local
# run the app locally
./run
```

## Loading data

```bash
./load # PROVIDER=https://archivesspace.lyrasistechnology.org/oai
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
