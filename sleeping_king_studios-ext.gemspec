# sleeping_king_studios-ext.gemspec

require File.expand_path "lib/sleeping_king_studios/ext/version"

Gem::Specification.new do |gem|
  gem.name        = 'sleeping_king_studios-ext'
  gem.version     = SleepingKingStudios::Ext::VERSION
  gem.date        = '2013-09-19'
  gem.summary     = 'Extensions to core classes.'
  gem.description = <<-DESCRIPTION
    A collection of extensions to core classes, gemified to prevent a
    maintenance nightmare if multiple library or application projects require
    general extensions.
  DESCRIPTION
  gem.authors     = ['Rob "Merlin" Smith']
  gem.email       = ['merlin@sleepingkingstudios.com']
  gem.homepage    = 'http://sleepingkingstudios.com'
  gem.license     = 'MIT'
  
  gem.require_path = 'lib'
  gem.files        = Dir["lib/**/*.rb", "LICENSE", "*.md"]
  
  gem.add_development_dependency 'rspec',  '~> 2.14'
  gem.add_development_dependency 'fuubar', '~> 1.2.1'
  gem.add_development_dependency 'yard',   '~> 0.8.7'
end # gemspec
