require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'bundler/gem_tasks'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the sortable plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the sortable_table plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Sortable Table'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "sortable_table"
    gemspec.summary = "Rails 3 gem to produce a sortable, paginated, searchable table for any model"
    gemspec.description = "Rails 3 gem to produce a sortable, paginated, searchable table for any model"
    gemspec.email = ""
    gemspec.homepage = "https://github.com/kovacs/sortable"
    gemspec.authors = ["Michael Kovacs", "Oleg Vivtash"]
    gemspec.add_runtime_dependency 'will_paginate', '~> 3.0.pre2'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end

