# syntax=docker/dockerfile:1

# This Dockerfile is designed for production, not development. Use with Kamal or build'n'run by hand:
# docker build -t probesys .
# docker run -d -p 80:80 -e RAILS_MASTER_KEY=<value from config/master.key> --name probesys probesys

# For a containerized dev environment, see Dev Containers: https://guides.rubyonrails.org/getting_started_with_devcontainer.html

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version
ARG RUBY_VERSION=3.4.4
FROM ruby:$RUBY_VERSION-slim

# Rails app lives here
WORKDIR /rails

# Install system dependencies for Rails and MariaDB
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential default-mysql-client libjemalloc2 libvips libmariadb-dev git libyaml-dev pkg-config && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Copy Gemfile and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Add bundle bin to PATH for rails command
ENV PATH="/usr/local/bundle/bin:${PATH}"

# Copy app code
COPY . .

# Expose Rails port
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
