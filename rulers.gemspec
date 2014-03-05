# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rulers/version'

Gem::Specification.new do |spec|
  spec.name          = "rulers"
  spec.version       = Rulers::VERSION
  spec.authors       = ["Matt Fritz"]
  spec.email         = ["mfritz@itriagehealth.com"]
  spec.summary       = %q{A microframework in the spirit of Rails}
  spec.description   = %q{A microframework in the spirit of Rails, from the book Rebuilding Rails.}
  spec.homepage      = "https://github.com/apothem/rulers"
  spec.license       = "None"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 0"
  spec.add_development_dependency "rack-test", "~> 0"
  spec.add_development_dependency "test-unit", "~> 2.5"

  spec.add_runtime_dependency "rack", "~> 1.5"
end
