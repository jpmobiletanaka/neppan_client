FROM ruby:3.0.6-alpine

# Install system dependencies required for nokogiri and native extensions
RUN apk add --no-cache \
    build-base \
    git \
    curl \
    libxml2-dev \
    libxslt-dev \
    zlib-dev \
    gcompat

# Set working directory
WORKDIR /app

# Copy gemspec and Gemfile first for better caching
COPY neppan_client.gemspec Gemfile ./
COPY lib/neppan_client/version.rb ./lib/neppan_client/

# Install gem dependencies
RUN bundle config build.nokogiri --use-system-libraries && \
    bundle install

# Copy the rest of the application
COPY . .

# Default command
CMD ["bundle", "exec", "rspec"]
