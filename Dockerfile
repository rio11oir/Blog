FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /blog
WORKDIR /blog
COPY Gemfile /blog/Gemfile
COPY Gemfile.lock /blog/Gemfile.lock
RUN bundle install
EXPOSE 3000
COPY . /blog
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]