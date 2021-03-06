# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'print_node/version'

Gem::Specification.new do |spec|
  spec.name          = 'print_node'
  spec.version       = PrintNode::VERSION
  spec.authors       = ['Advaitya Kumar']
  spec.email         = ['akumar@enbake.com']

  spec.summary       = %q{Ruby client for Print Pdf File }
  spec.homepage      = 'http://github.com/advaityakumar/print_node'
  spec.license       = 'MIT'



  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'thor', '~> 0.19'
  spec.add_dependency 'faraday', '~> 0.9'
  spec.add_dependency 'faraday_middleware', '~> 0.9'
  spec.add_dependency 'oauth2', '~> 1.0'

  spec.add_development_dependency 'bundler', "~> 1.9"
  spec.add_development_dependency 'rake', "~> 10.0"
  spec.add_development_dependency 'rspec', '~> 3.2'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'webmock', '~> 1.21'
  spec.add_development_dependency 'yard', '~> 0.8'

end
