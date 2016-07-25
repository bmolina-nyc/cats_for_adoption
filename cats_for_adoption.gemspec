# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cats_for_adoption/version'

Gem::Specification.new do |spec|
  spec.name          = "cats_for_adoption"
  spec.version       = CatsForAdoption::VERSION
  spec.authors       = ["bmolina-nyc"]
  spec.email         = "bruce.d.molina@gmail.com"
  spec.summary       = "Cats available for adoption"
  spec.description   = "Provides a list of available cats for adoption"
  spec.homepage      = "https://github.com/bmolina-nyc/cats_for_adoption"
  spec.license       = "MIT"



  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "nokogiri"
end
