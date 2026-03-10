#!/usr/bin/env bash
set -o errexit

gem install bundler
bundle config set --local without 'development test'
bundle update net-pop --bundler
bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate