#!/bin/bash

maxcounter=45
counter=1
while ! mysql -h "$DATABASE_HOST" -u "$DATABASE_USERNAME" -p"$DATABASE_PASSWORD" \
  -e "show databases;" > /dev/null 2>&1; do
    sleep 1
    counter=`expr $counter + 1`
    if [ $counter -gt $maxcounter ]; then
      >&2 echo "We have been waiting for MySQL too long already; failing."
      exit 1
    fi;
done

if [[ -v FAVICON_URL ]]; then
  echo "Downloading favicon: $FAVICON_URL"
  wget -O app/assets/images/favicon.ico $FAVICON_URL
fi

if [[ -v JS_URL ]]; then
  echo "Downloading javascript: $JS_URL"
  wget -O app/assets/javascripts/fadlight.js $JS_URL
fi

if [[ -v LOCALES_URL ]]; then
  echo "Downloading locales: $LOCALES_URL"
  wget -O config/locales/en.yml $LOCALES_URL
fi

if [[ -v LOGO_URL ]]; then
  mkdir -p app/assets/images/blacklight/
  echo "Downloading logo: $LOGO_URL"
  wget -O app/assets/images/blacklight/logo.png $LOGO_URL
fi

if [[ -v REPOSITORY_URL ]]; then
  echo "Downloading repositories configuration: $REPOSITORY_URL"
  wget -O config/repositories.yml $REPOSITORY_URL
fi

if [[ -v THEME_CSS_URL ]]; then
  echo "Downloading theme css: $THEME_CSS_URL"
  wget -O app/assets/stylesheets/fadlight.css $THEME_CSS_URL
fi

bin/rake assets:precompile
bin/rake db:migrate
bundle exec puma -C config/puma.rb