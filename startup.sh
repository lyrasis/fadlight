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

if [[ -v LOGO_URL ]]; then
  mkdir -p app/assets/images/blacklight/
  echo "Downloading logo: $LOGO_URL"
  wget -O app/assets/images/blacklight/logo.png $LOGO_URL
fi

if [[ -v THEME_CSS_URL ]]; then
  echo "Downloading theme css: $THEME_CSS_URL"
  wget -O app/assets/stylesheets/application.css $THEME_CSS_URL
fi

bin/rake assets:precompile
bin/rake db:migrate
bundle exec puma -C config/puma.rb