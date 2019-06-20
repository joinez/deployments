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
# gems: install packges and gems for dev & test
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
