#!/usr/bin/env bash
set -o errexit

gem install bundler
bundle update net-pop
bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate