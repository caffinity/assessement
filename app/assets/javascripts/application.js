// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require chartkick
//= require highcharts.js
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require turbolinks
//= require chart
//= require nvd3
//= require google

google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
  var rubyData = $('pieData').data('ruby')
  var data = google.visualization.arrayToDataTable([rubyData]);

  var options = {
    pieHole: 0.5,
    pieSliceText: 'label',
    pieSliceTextStyle: {
      color: 'black',
    },
    legend: 'none'
  };

  var chart = new google.visualization.PieChart(document.getElementById('donut_single'));
  chart.draw(data, options);
}
