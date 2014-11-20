# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'tzinfo/microsoft/version'

Gem::Specification.new do |spec|
    spec.name = 'tzinfo-microsoft'
    spec.version = TZInfo::Microsoft::VERSION
    spec.authors = ['Ryan Larson']
    spec.email = ['ryan.mango.larson@gmail.com']
    spec.summary = 'Microsoft Timezone Data for TZInfo'
    spec.description = 'TZInfo::Microsoft contains data from the Microsoft Time Zone Database packaged as Ruby modules for use with TZInfo.'
    spec.homepage = 'http://rubygems.org/gems/tzinfo-microsoft'
    spec.license = 'MIT'
    spec.files = `git ls-files -z`.split("\x0")
    spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
    spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
    spec.require_paths = ['lib']

    spec.add_runtime_dependency 'tzinfo-data'
    spec.add_runtime_dependency 'tzinfo'

    spec.add_development_dependency 'bundler', '~> 1.5'
    spec.add_development_dependency 'rake'
    spec.add_development_dependency 'rspec'
    spec.add_development_dependency 'rubygems-tasks'
    spec.add_development_dependency 'nokogiri'
end