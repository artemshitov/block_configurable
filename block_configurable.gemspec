# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'block_configurable/version'

Gem::Specification.new do |spec|
  spec.name          = "block_configurable"
  spec.version       = BlockConfigurable::VERSION
  spec.authors       = ["Artem Shitov"]
  spec.email         = ["inbox@artemshitov.ru"]
  spec.description   = %q{A little mixin to make your classes and modules configurable using either single statements or blocks.}
  spec.summary       = %q{A little mixin to make your classes and modules configurable}
  spec.homepage      = "https://github.com/artemshitov/block_configurable"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", '~> 5.0.6'
end
