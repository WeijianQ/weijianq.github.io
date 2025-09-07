FROM ruby:3.2-bullseye

# Install native dependencies for gems and image/diagram tooling
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        git \
        imagemagick \
        graphviz \
        nodejs \
        npm \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /srv/jekyll

# Preseed bundler config to use project-local vendor/bundle and force native builds
ENV BUNDLE_PATH=/srv/jekyll/vendor/bundle \
    BUNDLE_FORCE_RUBY_PLATFORM=true \
    BUNDLE_RETRY=2

# Install gems using Gemfile; vendor/bundle lives in the mounted volume
COPY Gemfile Gemfile.lock* ./
RUN gem install bundler:2.7.1 \
    && npm install -g @mermaid-js/mermaid-cli \
    && bundle install || true

# Default command can be overridden by docker-compose
CMD ["bash", "-lc", "bundle exec jekyll serve --livereload --host 0.0.0.0"]
