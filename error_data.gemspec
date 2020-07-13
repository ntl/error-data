# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'evt-error_data'
  s.summary = 'Representation of an error as a data structure'
  s.version = '0.1.0.0'
  s.description = ' '

  s.authors = ['The Eventide Project']
  s.email = 'opensource@eventide-project.org'
  s.homepage = 'https://github.com/eventide-project/error-data'
  s.licenses = ['MIT']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.4'

  s.add_runtime_dependency 'evt-schema'
  s.add_runtime_dependency 'evt-casing'

  s.add_development_dependency 'evt-transform'
  s.add_development_dependency 'test_bench'
end
