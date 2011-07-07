require 'rake'
require 'rails/generators'

# ==================================
# = rails g rails_highcharts:install =
# ==================================

module RailsHighcharts
  module Generators

    class InstallGenerator < Rails::Generators::Base
      
      source_root File.expand_path('../media', __FILE__)
      desc "Copies media files to main project"
      def copy_media_files
        #TODO
      end
    end

  end
end