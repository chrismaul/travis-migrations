FROM ruby:2.5.1-alpine
RUN apk add --no-cache build-base postgresql-dev tzdata postgresql-client
RUN bundle config --global frozen 1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile      /usr/src/app
COPY Gemfile.lock /usr/src/app

RUN bundle install --deployment

COPY . /usr/src/app

ENTRYPOINT [ "/bin/sh" ]
