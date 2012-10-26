var options = {
    chart: {
        renderTo: 'container',
	polar: true,
	type: 'line'
    },
    title: {
        text: 'Classification based on cloud run-time efficiency',
	x: -80
    },
	pane: {
	                  size: '80%'
		              },
    xAxis: {
        categories: [],
			        tickmarkPlacement: 'on',
		                lineWidth: 0
    },
    yAxis: {
type: 'logarithmic',
gridLineInterpolation: 'polygon'
    },
tooltip: {
		             shared: true,
		             valueSuffix: ' sec'
			         },
	         
		         legend: {
			             align: 'right',
			             verticalAlign: 'top',
			             y: 100,
			             layout: 'vertical'
				         },
    series: []
};
$.get('<?php echo "data/".$filename?>.csv', function(data) {
    // Split the lines
    var lines = data.split('\n');
    
    // Iterate over the lines and add categories or series
    $.each(lines, function(lineNo, line) {
        var items = line.split(',');
        
        // header line containes categories
        if (lineNo == 0) {
            $.each(items, function(itemNo, item) {
                if (itemNo > 0) options.xAxis.categories.push(item);
            });
        }
        
        // the rest of the lines contain data with their name in the first position
        else {
            var series = {
                data: [],
		pointPlacement: 'on'
            };
            $.each(items, function(itemNo, item) {
                if (itemNo == 0) {
                    series.name = item;
                } else {
                    series.data.push(parseFloat(item));
                }
            });
            if (series.name != "" && series.data != "")  
	            options.series.push(series);
    
        }
        
    });
    
    // Create the chart
    var chart = new Highcharts.Chart(options);
});
