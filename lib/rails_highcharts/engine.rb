require 'rails'
require File.dirname(__FILE__) + "/../../app/helpers/rails_highcharts/rails_highcharts_helper"

module RailsHighcharts
  class Engine < Rails::Engine

    config.to_prepare do
      ApplicationController.helper(RailsHighchartsHelper)
    end

    # ========================================
    # =   javascript_include_tag :highcharts =
    # ========================================
    config.before_initialize do
      config.action_view.javascript_expansions[:highcharts]     = %w|highcharts/highcharts.js highcharts/exporting.js|
      config.action_view.javascript_expansions[:ie_high_charts] = %w|highcharts/excanvas.compiled.js|
    end

  end
end