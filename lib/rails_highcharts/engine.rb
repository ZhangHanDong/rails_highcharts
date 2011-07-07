require 'rails'

module RailsHighcharts
  class Engine < Rails::Engine

    # ========================================
    # =   javascript_include_tag :highcharts =
    # ========================================
    config.before_initialize do
      config.action_view.javascript_expansions[:highcharts] = %w(highcharts/highcharts.js)
    end

  end
end