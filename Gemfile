source 'http://rubygems.org'

gem 'rails', '3.0.9'

gem 'simple_form', '1.5.1'
gem 'jquery-rails', '1.0.14'
gem 'omniauth'
gem 'omniauth-oauth2'
gem 'omniauth-dailycred', '0.0.2'

platform :ruby do
  gem 'pg', '~> 0.13.2'
  group :development do
    gem 'sqlite3' 
  end
  gem 'unicorn'
end

platforms :jruby do
  gem 'activerecord-jdbc-adapter'
  gem 'jruby-openssl'
  gem 'jdbc-mysql', :require => false
  gem 'jdbc-sqlite3', :require => false
  gem 'jdbc-postgres', :require => false
  gem 'trinidad'
  gem 'thor'
end

group :rbx do
  gem 'puma'
end


# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do

end
