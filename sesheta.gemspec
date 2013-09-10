# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sesheta/version'

Gem::Specification.new do |spec|
  spec.name          = "sesheta"
  spec.version       = Sesheta::VERSION
  spec.authors       = ["Hubert Huang"]
  spec.email         = ["hhuang@practicefusion.com"]
  spec.description   = %q{Client gem for the PracticeFusion EHR}
  spec.summary       = %q{Client gem for the PracticeFusion EHR}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'hashie'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec', '~> 2.0'
end
