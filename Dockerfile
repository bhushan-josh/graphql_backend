FROM ruby:3.2.0

RUN apt-get update -qq && \
    apt-get install -y nodejs postgresql-client yarn

ENV RAILS_ROOT /app
RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile.lock ./

# Ensure correct bundler version
RUN gem install bundler:2.6.7
RUN bundler _2.6.7_ install

COPY . .

# Precompile assets
RUN bundle exec rake assets:precompile

EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
