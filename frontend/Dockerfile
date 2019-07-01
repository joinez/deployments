ARG NODE_VERSION=12.4.0

# ------------------------------------------------------------------------------
# npms: install (tmp) build packages and npm packages
# ------------------------------------------------------------------------------
FROM node:${NODE_VERSION}-alpine AS npms

ENV CACHE_ID 1

WORKDIR /usr/src

COPY package*json ./

RUN npm i && rm -rf /root/.npm/_cacache

# ------------------------------------------------------------------------------
# dev: copy npm packages used for dev & test
# ------------------------------------------------------------------------------
FROM node:${NODE_VERSION}-alpine AS dev

ENV CACHE_ID 2

WORKDIR /usr/src

COPY --from=npms /usr/src/node_modules /usr/src/node_modules

COPY . .
