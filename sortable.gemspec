# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sortable_table/version"

Gem::Specification.new do |s|
  s.name        = "sortable_table"
  s.version     = SortableTable::VERSION
  s.authors     = ["Michael Kovacs"]
  s.email       = ["kovacs@mkovacs.com"]
  s.homepage    = "http://github.com/kovacs/sortable"
  s.summary     = %q{Rails 3 gem to produce a sortable, paginated, searchable table for any model}
  s.description = %q{Rails 3 gem to produce a sortable, paginated, searchable table for any model}

  s.rubyforge_project = "sortable_table"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
