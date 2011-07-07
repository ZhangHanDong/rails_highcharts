# coding: utf-8
require 'rails'
require 'active_support'
require 'action_pack'
require 'action_view'
require 'action_controller'
require 'action_controller'
require 'action_mailer'

require File.dirname(__FILE__) + "/../app/helpers/rails_highcharts/rails_highcharts_helper"
require File.dirname(__FILE__) + "/../app/models/rails_highcharts"

require 'webrat'

Rspec.configure do |config|
  config.include ActionView::Helpers  
  config.include Webrat::Matchers
end

module HighChartsHelper
  include ActionView::Helpers::TagHelper
end
