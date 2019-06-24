FROM ruby:2.5.3-alpine

ENV PATH=/root/.yarn/bin:$PATH \
    RACK_ENV=production \
    RAILS_ENV=production

RUN apk update && \
    apk add --no-cache \
      bash \
      build-base \
      git \
      openssh \
      mariadb-dev \
      mysql-client \
      nodejs \
      tzdata

RUN apk update && \
    apk add curl bash binutils tar gnupg && \
    rm -rf /var/cache/apk/* && \
    /bin/bash && \
    touch ~/.bashrc && \
    curl -o- -L https://yarnpkg.com/install.sh | bash && \
    apk del curl tar binutils

WORKDIR /app
ADD Gemfile* /app/

RUN gem install bundler && bundle install \
      --jobs "$(getconf _NPROCESSORS_ONLN)" \
      --retry 5 \
      --without development test

COPY . .

RUN echo "Rails.application.config.assets.precompile += %w( fadlight.css fadlight.js )" \
      >> config/initializers/assets.rb

EXPOSE 3000
CMD ["/app/startup.sh"]