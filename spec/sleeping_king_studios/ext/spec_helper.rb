# spec/sleeping_king_studios/ext/spec_helper.rb

Bundler.require # because the Gemfile specifies gems from git

require 'rspec'

#=# Require Factories, Custom Matchers, &c #=#
Dir[File.join __dir__, 'support', '**', '*.rb'].each { |f| require f }

RSpec.configure do |config|
  # :focus => true
  config.treat_symbols_as_metadata_keys_with_true_values = true
end # config
