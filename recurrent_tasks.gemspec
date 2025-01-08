require_relative 'lib/recurrent_tasks/version'

Gem::Specification.new do |spec|
  spec.name = 'recurrent_tasks'
  spec.version = RecurrentTasks::VERSION
  spec.homepage = 'https://rubygems.org/gems/recurrent_tasks'

  spec.summary = 'A rspec manual recurrent tasks integration'
  spec.description = 'A gem that json specs to verify that manual recurrent tasks are regularly executed'
  spec.authors = ['Massimiliano De Vivo']
  spec.email = 'maxtru2005@gmail.com'

  spec.required_ruby_version = '~> 3'
  spec.files = Dir['lib/**/*.rb']

  spec.license = 'MIT'

  # json parser
  spec.add_dependency 'oj', '~> 3'
  # test framework
  spec.add_dependency 'rspec', '~> 3'

  # debugger
  spec.add_development_dependency 'pry-byebug', '~> 3'
  # static analyzer
  spec.add_development_dependency 'rubocop', '~> 1'
end
