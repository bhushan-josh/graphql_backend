# Use the official Ruby image
FROM ruby:3.2.0

# Install dependencies
RUN apt-get update -qq && \
    apt-get install -y nodejs postgresql-client yarn

# Set the working directory
ENV RAILS_ROOT /app
RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT

# Add gem files and install dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle config set deployment 'true'
RUN bundle config set without 'development test'
RUN bundle install

# Copy the application code
COPY . .

# Precompile assets
RUN bundle exec rake assets:precompile

# Expose port
EXPOSE 3000

# Start the app
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
