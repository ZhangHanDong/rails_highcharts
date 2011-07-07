Highcharts for Rails 3
=========================================================================

__modify from: [lazy-high-charts](https://github.com/michelson/lazy_high_charts "lazy-high-charts"), with Highcharts v2.1.5 and Rails 3__

__use: [Highcharts](http://highcharts.com/ "Highcharts")__

__[Demo](http://highcharts.com/demo/)__

Support Env:
------------
Rails3.0.8+/Ruby1.8.7+

## Usage:

    gem 'rails_highcharts'

    rails g rails_highcharts:install
 
Usage in Controller:
 
     @h = RailsHighcharts.new('graph') do |f|
        f.series(:name=>'John', :data=>[3, 20, 3, 5, 4, 10, 12 ,3, 5,6,7,7,80,9,9])
        f.series(:name=>'Jane', :data=> [1, 3, 4, 3, 3, 5, 4,-46,7,8,8,9,9,0,0,9] )
      end

Without overriding entire option , (only change a specific option index):
 
     @h = RailsHighcharts.new('graph') do |f|
      .....
          f.options[:chart][:defaultSeriesType] = "area"
          f.options[:chart][:inverted] = true
          f.options[:legend][:layout] = "horizontal"
          f.options[:x_axis][:categories] = ["uno" ,"dos" , "tres" , "cuatro"]
     ......

Overriding entire option:
 
     @h = RailsHighcharts.new('graph') do |f|
       .....
          f.x_axis(:categories => @days.reverse! , :labels=>{:rotation=>-45 , :align => 'right'})
          f.chart({:defaultSeriesType=>"spline" , :renderTo => "myRenderArea" , :inverted => true})
       .....

Usage in layout:
 
    <%= javascript_include_tag :highcharts %> 
    <!--[if IE]> <%= javascript_include_tag :ie_high_charts %> <![endif]-->
 
Usage in view:
 
    <%= high_chart("my_id", @h) %>

Passing formatting options in the view to the helper block , because all the helper options declared in the controller are converted in strict/valid json (quoted key); so we need to extend the json object with some js.
 
      <% high_chart("my_id", @h) do |c| %>
            <%= "options.tooltip.formatter = function() { return '<b>HEY!!!'+ this.series.name +'</b><br/>'+ this.x +': '+ this.y +' units';}" %>
            <%= "options.xAxis.labels.formatter = function() { return 'ho';}" %>
            <%= "options.yAxis.labels.formatter = function() { return 'hey';}" %>
       <%end %> 

Option reference:
 
     http://www.highcharts.com/ref/

HighCharts License:
 
     http://www.highcharts.com/license