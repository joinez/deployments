ARG NGINX_VERSION=1.17.5
ARG NODE_VERSION=12.13.0

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

ENV VUE_APP_HOST \${VUE_APP_HOST}

WORKDIR /usr/src

COPY --from=npms /usr/src/node_modules/ /usr/src/node_modules/

COPY . .

RUN npm run build

# ------------------------------------------------------------------------------
# production: the production image
# ------------------------------------------------------------------------------
FROM nginx:${NGINX_VERSION}-alpine as production

COPY docker-entrypoint.sh .

COPY --from=build /usr/src/dist /usr/share/nginx/html

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]

# ------------------------------------------------------------------------------
# dev: copy npm packages used for dev & test
# ------------------------------------------------------------------------------
FROM node:${NODE_VERSION}-alpine AS dev

ENV CACHE_ID 3

WORKDIR /usr/src

COPY --from=npms /usr/src/node_modules /usr/src/node_modules

COPY . .
