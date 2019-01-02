FROM alpine:latest

RUN apk -X http://dl-cdn.alpinelinux.org/alpine/v3.7/main -X http://dl-cdn.alpinelinux.org/alpine/v3.7/community add --no-cache ruby=2.4.5-r0 ruby-dev=2.4.5-r0 build-base mongodb bash
RUN gem install bundler --no-ri --no-rdoc && gem install capistrano-rvm --no-ri --no-rdoc
RUN mkdir /reddit
COPY ./reddit /reddit
COPY ./docker-monolith/mongod.conf /etc/mongod.conf
COPY ./docker-monolith/db_config /reddit/db_config
COPY ./docker-monolith/start.sh /start.sh
RUN cd /reddit && bundle lock && bundle install
RUN chmod 0777 /start.sh

CMD ["/start.sh"]
