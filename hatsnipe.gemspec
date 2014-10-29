# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hatsnipe/version'

Gem::Specification.new do |spec|
  spec.name          = 'hatsnipe'
  spec.version       = Hatsnipe::VERSION
  spec.authors       = ['Clarke Brunsdon', 'Kevin Attfield']
  spec.email         = ['clarke@freerunningtechnologies.com', 'kevin@freerunningtechnologies.com']
  spec.summary       = %q{Snipes people that wear hats. Or snipes hats for people. Who knows.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'dotenv-rails'
  spec.add_dependency 'faraday'
  spec.add_dependency 'twilio-ruby'

  spec.add_development_dependency 'bundler', "~> 1.7"
  spec.add_development_dependency 'rake', "~> 10.0"
end
