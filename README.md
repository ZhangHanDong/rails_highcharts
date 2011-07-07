Highcharts for Rails 3
=========================================================================

__modify from: [highcharts-rails](https://github.com/loudpixel/highcharts-rails "highcharts-rails")__

__use: [Highcharts](http://highcharts.com/ "Highcharts")__

__[Demo](http://highcharts.com/demo/)__

Support Env:
------------
Rails3.0.8+/Ruby1.8.7+

## Usage:

    gem 'rails_highcharts'

    rails g rails_highcharts:install

in footer layout

    $(document).ready(function(){
      <%= javascript_include_tag :highcharts  %>
      <%= yield :javascript %>
    });

in our controller:

    # Create a pie chart
    browser_data = [
      {:name => 'Safari',               :y => 3.57,     :identifier => 'applewebkit'},
      {:name => 'Firefox',              :y => 22.32,    :identifier => 'gecko'}, 
      {:name => 'Internet Explorer',    :y => 56.9,     :identifier => 'msie'}, 
      {:name => 'Other',                :y => 17.21}
    ]
 
    user_agent = request.env['HTTP_USER_AGENT'].downcase
 
    # determine the users browser and pull that piece of the pie chart
    browser_data.each do |browser|
      if user_agent.index(browser[:identifier].to_s)
        browser[:sliced] = true
 
        # some browsers will match more than one identifier, stop looking as soon as one is found
        break;
      end
    end
 
    # format the labels that show up on the chart
    pie_label_formatter = '
      function() {
        if (this.y > 15) return this.point.name;
      }'
 
    # format the tooltips
    pie_tooltip_formatter = '
      function() {
        return "<strong>" + this.point.name + "</strong>: " + this.y + " %";
      }'
 
    @pie_chart = 
        Highchart.pie({
        :chart => {
              :renderTo => "pie-chart-container",
              :margin => [50, 30, 0, 30]
            },
            :credits => {
              :enabled => true,
              :href => 'http://marketshare.hitslink.com/browser-market-share.aspx?qprid=3',
              :text => 'Data provided by NETMARKETSHARE'
            },
            :plotOptions => {
              :pie => {
                :dataLabels => {
                  :formatter => pie_label_formatter, 
                  :style => {
                    :textShadow => '#000000 1px 1px 2px'
                  }
                }
              }
            },
          :series => [
                {
                    :type => 'pie',
                    :data => browser_data
                }
            ],
            :subtitle => {
              :text => 'January 2010'
            },
            :title => {
              :text => 'Browser Market Share'
            },
            :tooltip => {
              :formatter => pie_tooltip_formatter
            },
        })
 
in your views:
 
    <!-- container to hold the pie chart -->
    <div id="pie-chart-container" class="chart-container"></div>
 
    <% content_for :javascript do %>
        <%= @pie_chart %>
    <% end %>