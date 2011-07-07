# coding: utf-8
require 'rubygems'
require 'rails'
require 'active_support'
require 'actionpack'
require 'activerecord'


require File.expand_path(File.join(File.dirname(__FILE__), '../lib/rails_highcharts/rails_highcharts'))
require File.dirname(__FILE__) + "/../app/helpers/rails_highcharts/rails_highcharts_helper"

require 'webrat'

Rspec.configure do |config|
  config.include ActionView::Helpers  
  config.include Webrat::Matchers
end

module HighChartsHelper
  include ActionView::Helpers::TagHelper
end
