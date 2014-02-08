$(function () {

$('.question_text').on('click', function(event) {
  event.preventDefault();

  var data = $(this).serializeArray();
  console.log(data)

  var graphData = new Array()
    for(var i = 0; i < data.length; i++) {
      graphData[i] = [data[i].name, parseInt(data[i].value)]
  }
console.log(graphData)
    $('.pie_chart').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },
        title: {
            text: ''
        },
        tooltip: {
          pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    color: '#000000',
                    connectorColor: '#000000',
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                }
            }
        },
        series: [{
            type: 'pie',
            name: 'Answers',
            data: graphData
        }]
    });
});
});

//

// Our data needs to be passed in with the 'name' of the answer and the number of times the answer has been selected



//

// Our data needs to be passed in with the 'name' of the answer and the number of times the answer has been selected

