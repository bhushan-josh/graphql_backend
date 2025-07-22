# Use the official Ruby image as a parent image
FROM ruby:3.2.0

# Install dependencies
RUN apt-get update -qq && \
    apt-get install -y nodejs postgresql-client yarn

# Set an environment variable to store where the app is installed to inside of Docker image
ENV RAILS_ROOT /app
RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT

# Set up gems
COPY Gemfile Gemfile.lock ./
RUN bundle install --without development test

# Copy the rest of the application code
COPY . .

# Precompile assets for production
RUN bundle exec rake assets:precompile

# Expose port 3000 to the Docker host, so we can access it from the outside
EXPOSE 3000

# Start the main process
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
