source 'https://rubygems.org'
ruby '2.5.1'

# Ruby on Rails
gem 'rails', '~> 5.1.0'

# ActiveRecord
gem 'pg', '~> 0.21'
gem 'enumerize'

# Orchestration
gem 'puma'
gem 'foreman'
gem 'figaro'

# CORS
gem 'rack-cors'

# API
gem 'pragma-rails'
gem 'pragma-contract', '>= 2.0.1'
gem 'kaminari'

# Background jobs
gem 'sidekiq'
gem 'clockwork'

# Error reporting
gem 'bugsnag'

# Push notifications
gem 'rpush'

# JWT
gem 'jwt'

# RabbitMQ
gem 'bunny'

# Timezone info
gem 'tzinfo-data'

# Pubnub
gem 'pubnub', '4.0.23' # https://stackoverflow.com/q/46739303/705588

# ActionCable
gem 'redis', '~> 3.0' # https://github.com/rails/rails/issues/30527

group :production do
  # Heroku
  gem 'rails_12factor'

  # Throttling
  gem 'rack-attack'

  # Monitoring
  gem 'scout_apm'
end

group :development, :test do
  # Factories
  gem 'factory_bot_rails'
  gem 'faker'

  # Debugging
  gem 'pry-rails'

  # Testing
  gem 'rspec-rails'
end

group :development do
  # Code quality
  gem 'rubocop'
  gem 'rubocop-rspec'

  # Preloading
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen'
end

group :test do
  # Testing
  gem 'capybara'
  gem 'database_cleaner'
  gem 'fuubar'
  gem 'shoulda-matchers'
  gem 'webmock'

  # CircleCI
  gem 'rspec_junit_formatter'

  # Code coverage
  gem 'codacy-coverage', require: false
end
