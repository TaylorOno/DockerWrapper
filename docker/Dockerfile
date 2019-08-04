FROM alpine:3.9

RUN addgroup -g 1000 node \
	&& adduser -u 1000 -G node -s /bin/sh -D node \
	&& mkdir -p /home/node/newman/node_modules/test \
	&& chown -R node:node /home/node/newman \
	&& apk add --update nodejs nodejs-npm \
	&& npm install -g newman \
	&& npm install -g newman-reporter-htmlextra \
	&& cd /home/node/newman

USER node
	
WORKDIR /home/node/newman
