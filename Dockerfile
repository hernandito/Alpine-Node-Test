FROM node:7-alpine

WORKDIR /app

RUN apk --no-cache add tar curl && \
  curl -L https://github.com/jishi/node-sonos-http-api/archive/master.tar.gz | tar xz --strip-components=1 -C /app && \
  mkdir cache && \
  ln -s settings/settings.json && \
  chown -R abc:abc static cache && \
  npm install --production && \
  rm -rf /tmp/* /root/.npm

EXPOSE 5005 5006
VOLUME /app

USER abc



