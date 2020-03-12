# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'recurl/version'

Gem::Specification.new do |spec|
  spec.name          = 'recurl'
  spec.version       = Recurl::VERSION
  spec.authors       = ['zaru']
  spec.email         = ['zarutofu@gmail.com']

  spec.summary       = 'save the request with curl command'
  spec.description   = 'save the request with curl command ( rack middleware )'
  spec.homepage      = 'https://github.com/zaru/recurl'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/zaru/recurl'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rubocop', '~> 0.80.1'
  spec.add_development_dependency 'rspec', '~> 3.9'
  spec.add_development_dependency 'rack-test', '~> 1.1'
  spec.add_development_dependency 'simplecov', '~> 0.18'
  spec.add_development_dependency 'pry', '~> 0.12.2'
end
