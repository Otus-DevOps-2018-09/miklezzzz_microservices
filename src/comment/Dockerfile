FROM ruby:2.2

ENV APP_HOME /app
ENV COMMENT_DATABASE_HOST comment_db
ENV COMMENT_DATABASE comments

RUN apt-get update -qq && apt-get install -y build-essential && mkdir $APP_HOME
WORKDIR $APP_HOME

COPY . $APP_HOME
RUN bundle install

CMD ["puma"]
