# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.version       = '0.0.1'

  gem.authors       = ["Cainã Costa"]
  gem.email         = ["cainan.costa@gmail.com"]
  gem.description   = %q{Adds a layer of delegation to your Virtus objects.}
  gem.summary       = %q{Adds a layer of delegation to your Virtus objects.}
  gem.homepage      = "https://github.com/cfcosta/virtus-delegate"

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- test/*`.split("\n")
  gem.name          = "virtus-delegate"
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'virtus', '~>1.0'
end
