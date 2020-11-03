lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'RspecInit'

Gem::Specification.new do |spec|
  spec.name        = 'rspec_init'
  spec.version     = RspecInit::VERSION
  spec.date        = '2020-06-01'
  spec.summary     = 'Rspec start place'
  spec.description = 'Dummy gem to be able to practice rspec testing'
  spec.authors     = ['Estaban Cordero']
  spec.email       = 'ecordero@growthaccelerationpartners.com'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rspec'
end
