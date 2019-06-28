ARG NODE_VERSION=12.4.0
ARG RUBY_VERSION=2.6.3

# ------------------------------------------------------------------------------
# gems: install (tmp) build packages and production gems
# ------------------------------------------------------------------------------
FROM ruby:${RUBY_VERSION}-alpine3.9 AS gems

WORKDIR /usr/src

COPY backend/Gemfile* ./

RUN apk add --update --no-cache --virtual .gem-deps \
  build-base \
  postgresql-dev \
  tzdata \
  && cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime \
  && gem install bundler -N -v "< 2" \
  && bundle install --without development test --with production \
    --no-cache --jobs 4 --retry 3 \
  && apk del --no-network .gem-deps \
  && rm -rf /root/.bundle \
    /usr/local/bundle/cache/* \
  && find /usr/local/bundle/gems/ -name "*.c" -delete \
  && find /usr/local/bundle/gems/ -name "*.o" -delete

# ------------------------------------------------------------------------------
# npms: install (tmp) build packages and npm packages
# ------------------------------------------------------------------------------
FROM node:${NODE_VERSION}-alpine AS npms

WORKDIR /usr/src

COPY frontend/package*json ./

RUN npm i && rm -rf /root/.npm/_cacache

# ------------------------------------------------------------------------------
# dev-backend: install packges and gems for dev & test backend
# ------------------------------------------------------------------------------
FROM ruby:${RUBY_VERSION}-alpine3.9 AS dev-backend

WORKDIR /usr/src

COPY backend/Gemfile* ./

COPY --from=gems /usr/local/bundle /usr/local/bundle

RUN apk add --update --no-cache \
  build-base \
  postgresql-dev \
  tzdata \
  && cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime \
  && bundle install --without production --with development test \
    --jobs 4 --retry 3

COPY backend ./

# ------------------------------------------------------------------------------
# dev-frontend: dev & test frontend
# ------------------------------------------------------------------------------
FROM node:${NODE_VERSION}-alpine AS dev-frontend

WORKDIR /usr/src

COPY --from=npms /usr/src/node_modules /usr/src/node_modules

COPY frontend ./
