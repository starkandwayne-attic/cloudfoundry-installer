# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cloudfoundry-installer/version'

Gem::Specification.new do |gem|
  gem.name          = "cloudfoundry-installer"
  gem.version       = Cloudfoundry::Installer::VERSION
  gem.authors       = ["Dr Nic Williams"]
  gem.email         = ["drnicwilliams@gmail.com"]
  gem.description   = %q{Super simple installer for CloudFoundry on your own servers}
  gem.summary       = %q{Super simple installer for CloudFoundry on your own servers}
  gem.homepage      = "https://github.com/StarkAndWayne/cloudfoundry-installer"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
