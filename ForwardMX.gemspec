# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ForwardMX'

Gem::Specification.new do |spec|
  spec.name          = "ForwardMX"
  spec.version       = ForwardMX::VERSION
  spec.authors       = ["Roman Pramberger"]
  spec.email         = ["roman@pramberger.ch"]

  spec.summary       = "Ruby bindler for ForwardMX.io"
  spec.description   = "Manage your email forwarders from ForwardMX.io with Ruby"
  spec.homepage      = "https://ForwardMX.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
end
