FROM nginx:1.17.4-alpine

RUN rm /etc/nginx/conf.d/default.conf \
	&& apk --no-cache add curl
RUN apk add --no-cache git
RUN apk add --no-cache bash
