# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vstream/version'

Gem::Specification.new do |spec|
  spec.name          = "vstream"
  spec.version       = Vstream::VERSION
  spec.authors       = ["Adam Cardenas"]
  spec.email         = ["cevaris@gmail.com"]
  spec.summary       = %q{Abstracted virtual streams of computation or data}
  spec.description   = %q{Abstracted virtual streams of computation or data via RabbitMQ and JRuby}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'amqp'
end
