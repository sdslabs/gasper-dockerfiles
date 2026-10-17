FROM nginx:1.30.6-alpine3.24

RUN rm /etc/nginx/conf.d/default.conf \
	&& apk --no-cache add curl
RUN apk add --no-cache git
