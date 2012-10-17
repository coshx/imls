source 'https://rubygems.org'

gem 'rails', '3.2.5'

gem 'haml'
gem 'heroku_san'
gem 'jquery-rails'
gem 'factory_girl_rails', '>= 1.6.0'
gem 'blacklight', git: 'git://github.com/rahearn/blacklight.git', branch: 'feature/escape_index_link'
gem 'blacklight_advanced_search'
gem 'blacklight_highlight'
gem 'devise'
gem 'therubyracer'

gem 'thin'

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails', '>= 2.8.1'
  gem 'pry'
  gem 'pry-nav'
  gem 'capistrano'
  gem 'capistrano_colors'
end

group :test do
  gem 'cucumber-rails', '>= 1.2.1'
  gem 'capybara', '>= 1.1.2'
  gem 'database_cleaner', '>= 0.7.1'
  gem 'launchy', '>= 2.0.5'
  gem 'timecop'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'compass-rails', '~> 1.0.0'
  gem 'compass-susy-plugin', '~> 0.9.0'
end

group :production do
  gem 'mysql2'
  gem 'passenger'
end
