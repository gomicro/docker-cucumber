FROM ruby:2.5-alpine

MAINTAINER dev@gomicro.io

RUN apk update && \
	 apk upgrade && \
	 apk add \
		 bash build-base && \
	 rm -rf /var/cache/apk/*

COPY files/. /usr/app/

WORKDIR /usr/app
RUN gem install bundler && bundle install --local

CMD ["cucumber"]
