source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '5.2.1'
gem 'mysql2'
gem 'puma'
gem 'bootsnap', require: false
gem 'rack-cors'
gem 'ridgepole'

# Trailblazer related
gem 'trailblazer-finder', git: 'git://github.com/obiyuta/trailblazer-finder.git',
                          branch: 'stop_parsing_value_to_date'
gem 'trailblazer-loader'
gem 'trailblazer-rails'
gem 'reform-rails'
gem 'multi_json'

group :development, :test do
  gem 'rubocop'
  gem 'database_rewinder'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'rspec-mocks'
  gem 'factory_bot_rails'
  gem 'rubocop-rspec'
  gem 'shoulda-matchers'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
end

group :development do
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
