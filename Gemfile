source 'https://rubygems.org'
ruby '3.1.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'activerecord-session_store'
gem 'active_model_serializers', '~> 0.10.13'
gem 'aws-sdk-rails', '~> 3.6', '>= 3.6.1'
gem 'caxlsx'
gem 'caxlsx_rails'
gem "best_in_place", git: "https://github.com/mmotherwell/best_in_place"
gem 'binding_of_caller'
gem 'browser', '~> 4.0'
gem 'bulma-rails'
gem 'bulma-extensions-rails'
gem 'carrierwave', '~> 1.3', '>= 1.3.1'
gem 'carrierwave-aws'
gem 'cookies_eu', '~> 1.7', '>= 1.7.8'
gem 'coffee-rails', '~> 5.0'
gem 'devise', '~> 4.8', '>= 4.8.1'
gem 'discordrb-webhooks', '~> 3.4', '>= 3.4.2'
gem 'faraday', '~> 1.1'
gem 'faraday_middleware'
gem 'figaro', '~> 1.1', '>= 1.1.1'
gem 'flag-icons-rails'
gem 'font-awesome-sass', '~> 5.8.1'
gem 'friendly_id', '~> 5.3'
gem 'geocoder'
gem 'groupdate'
gem 'impressionist'
gem 'invisible_captcha'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails', '~> 4.4'
gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'
gem 'kaminari'
gem 'mini_magick', '~> 4.9', '>= 4.9.4'
gem 'oauth'
gem 'omniauth-linkedin-oauth2', '~> 1.0'
gem "omniauth-rails_csrf_protection"
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 5.6'
gem 'pry', '~> 0.12.2'
gem 'rails', '~> 7.0'
gem 'rubyzip', '~> 2.3', '>= 2.3.2'
gem 'sass-rails', '~> 6.0'
gem "simple_form", ">= 5.0.0"
gem "slack-notifier"
gem 'social-share-button'
gem "sprockets-rails"
gem 'stripe', '~> 5.28'
gem 'uglifier', '>= 1.3.0'
gem 'redis'
gem 'route_translator'
gem 'sidekiq'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 5.1'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker'
  gem 'rails-controller-testing'
  gem 'database_cleaner'
  gem 'rb-readline', '~> 0.5.3'
  gem "letter_opener"
  gem 'better_errors'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
