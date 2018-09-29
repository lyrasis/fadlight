# FADLight

An ArcLight.

## Pre-steps

For a new rails project only, add the ArcLight gems:

```bash
./bin/rails generate blacklight:install --devise
./bin/rails generate arclight:install -f
```

## Getting started

```bash
docker-compose -f docker-compose-db.yml up
./bin/rails db:migrate
```

---
