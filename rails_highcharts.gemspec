# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rails_highcharts/version"
require "rails_highcharts/engine"
require "rails"

Gem::Specification.new do |s|
  s.name        = "rails_highcharts"
  s.version     = RailsHighcharts::VERSION
  s.authors     = ["AlexZhang"]
  s.email       = ["blackanger.z@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Highcharts for Rails 3}
  s.description = %q{Highcharts for Rails 3}
  s.files       =  FileList["[A-Z]*", "{app,config,lib}/**/*"]
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.extra_rdoc_files = FileList["[A-Z]*"] - %w(Gemfile Rakefile)
  s.rubyforge_project = "rails_highcharts"

  s.require_paths = ["lib"]
  s.add_dependency "rails", ">= 3.0.8"
  
end
