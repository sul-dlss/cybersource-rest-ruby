FROM ruby:3.2.2

USER root

WORKDIR /home/cybersource

COPY . .

RUN bundle install
