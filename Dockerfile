FROM klakegg/hugo:0.101.0-alpine as builder

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN hugo --minify



FROM nginx:1.19-alpine

LABEL org.opencontainers.image.source https://github.com/husky-dev/husky-api

COPY --from=builder /usr/src/app/public /usr/share/nginx/html

HEALTHCHECK --interval=30s --timeout=3s CMD curl --fail http://localhost || exit 1
