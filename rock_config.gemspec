# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rock_config/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jiri Pospisil"]
  gem.email         = ["mekishizufu@gmail.com"]
  gem.summary       = %q{RockConfig allows you to use custom config files easily.}
  gem.description   = %q{RockConfig allows you to use custom config files easily.}
  gem.homepage      = "https://github.com/mekishizufu/rock_config"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rock_config"
  gem.require_paths = ["lib"]
  gem.version       = RockConfig::VERSION

  gem.add_development_dependency "rspec", "~> 2.11.0"
  gem.add_development_dependency "pry", "~> 0.9.10"
  gem.add_development_dependency "pry-nav", "~> 0.2.2"
end
