FROM ruby:2.7.1

USER root

# Install and setup mail
RUN apt update
RUN apt-get install -y bsd-mailx
RUN apt-get install -y sendmail

WORKDIR /etc/mail

RUN echo \"AuthInfo:smtp.domain.com "U:USERNAME" "P:PASSWORD" "M:PLAIN"\" > authinfo
RUN makemap hash authinfo < authinfo
RUN make

WORKDIR /home/cybersource

COPY . .

RUN bundle install
