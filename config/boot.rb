ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

require 'dotenv'

# Load local ENV variables (it does NOT override existing environment variables).
Dotenv.load('.ruby-env')