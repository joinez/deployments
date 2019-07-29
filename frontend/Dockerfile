ARG NGINX_VERSION=1.17.2
ARG NODE_VERSION=12.6.0

# ------------------------------------------------------------------------------
# npms: install (tmp) build packages and npm packages
# ------------------------------------------------------------------------------
FROM node:${NODE_VERSION}-alpine AS npms

ENV CACHE_ID 1

WORKDIR /usr/src

COPY package*json ./

RUN npm i && rm -rf /root/.npm/_cacache

# ------------------------------------------------------------------------------
# build: compile dists for production
# ------------------------------------------------------------------------------
FROM node:${NODE_VERSION}-alpine as build

ENV CACHE_ID 2

ENV NODE_ENV production

WORKDIR /usr/src

COPY --from=npms /usr/src/node_modules/ /usr/src/node_modules/

COPY . .

RUN npm run build

# ------------------------------------------------------------------------------
# production: the production image
# ------------------------------------------------------------------------------
FROM nginx:${NGINX_VERSION}-alpine as production

COPY --from=build /usr/src/dist /usr/share/nginx/html

# ------------------------------------------------------------------------------
# dev: copy npm packages used for dev & test
# ------------------------------------------------------------------------------
FROM node:${NODE_VERSION}-alpine AS dev

ENV CACHE_ID 3

WORKDIR /usr/src

COPY --from=npms /usr/src/node_modules /usr/src/node_modules

COPY . .
