source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 5.2.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
# gem 'bcrypt', '~> 3.1.7'
# gem 'rack-cors'
gem 'versionist', '~> 1.7.0'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'faker', '~> 1.9.1'
end

group :development do
  gem 'rails-erd' # For generating entity relationship diagram
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # gem 'capistrano-rails'
end

group :test do
  gem 'rspec', '~> 3.8.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]