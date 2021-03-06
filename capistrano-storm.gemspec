lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'capistrano-storm'
  spec.version       = '0.2.1'
  spec.authors       = ['Jeff Byrnes']
  spec.email         = ['jeff@evertrue.com']
  spec.summary       = %q{Capistrano 3 plugin for handling Storm topologies.}
  spec.description   = %q{
Capistrano 3 plugin that handles updating & deploying a Storm topology.
  }
  spec.homepage      = "https://github.com/evertrue/#{spec.name}"
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'capistrano', '~> 3.1'

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
end
