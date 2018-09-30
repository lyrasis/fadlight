# FADLight

An ArcLight.

## Pre-steps (fyi only, skip this)

For a new rails project only, add the ArcLight gems then:

```bash
./bin/rails generate blacklight:install --devise
./bin/rails generate arclight:install -f
```

## Getting started

```bash
./bin/setup
```

## Docker runtime environment variables

```bash
DATABASE_HOST=127.0.0.1
DATABASE_NAME=fadlight_production
DATABASE_USERNAME=fadlight
DATABASE_PASSWORD=secret
LOGO_URL=https://example.com/logo.png
REPOSITORY_URL=https://example.com/repositories.yml
SOLR_URL=http://localhost:8983/solr/arclight
```

---
