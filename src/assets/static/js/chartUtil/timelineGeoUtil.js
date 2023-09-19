function getNeededDateInfo(date_dic,name) {
    var len=date_dic.length;
    var res=[];
    for (var i = 0; i < len; i++)
    {
        if(date_dic[i].nameKey==name){
            res.push({"key":date_dic[i].date,"value":date_dic[i].value});
        }
    }
    return res;
}

function processDateInfoToDateChart(data, chartId){
	var valuelist=[];
    var dtlen=data.length;
    for (var i = 0; i < dtlen; i++) {
        var dataItem = data[i];
        valuelist.push({
            'x': dataItem.key.slice(4,6)+ '-' +dataItem.key.slice(6,8),
            'y': dataItem.key.slice(0,4),
            'value': dataItem.value
        });
    }
    var chart = initDateChart(valuelist);
 //   makeDateChart(valuelist, 'eventTimeLineDiv');
    AmCharts.makeChart(chartId, chart);
}

function initDateChart(data_dic){
	var date_chart =  {
	        "type": "xy",
	        "theme": "light",
	        "marginRight": 80,
	        "startDuration": 1.5,
	        "trendLines": [],
	        "balloon": {
	            "adjustBorderColor": false,
	            "shadowAlpha": 0
	        },
	        "graphs": [{
	            "balloonText": "<div style='margin:5px;'><b>时间: [[y]]年[[x]]日</b><br><b>数值: [[value]]</b></div>",
	            "bullet": "round",
	            "id": "AmGraph-1",
	            "bulletBorderAlpha": 0.2,
	            "bulletAlpha": 0.8,
	            "lineAlpha": 0,
	            "fillAlphas": 0,
	            "valueField": "value",
	            "xField": "x",
	            "yField": "y"
	        },{}],
	        "valueAxes": [{
	            "id": "ValueAxis-1",
	            "position": "left",
	            "axisAlpha": 0.2,
	            "startOnAxis": true,
	            "tickLength": 0,
	            "precision":0
	        }, {
	            "id": "ValueAxis-2",
	            "axisAlpha": 0.2,
	            "position": "bottom",
	            "type": "date",
	            "dataDateFormat": "MM-DD",
	            "minPeriod": "MM-DD",
	            "parseDates":true,
	            "minHorizontalGap":50
	        }],
	        "allLabels": [],
	        "titles": [],
	        "dataProvider": data_dic,

	        "export": {
	            "enabled": true
	        },

	        "chartScrollbar": {
	            "offset": 15,
	            "scrollbarHeight": 5
	        }
	    };
	    return date_chart;
}

function processDateInfoToStbTmlChart(data, name, chartId){
	var chart;
    dtlen=data.length;
    var valuelist=[];

    for (var i = 0; i < dtlen; i++) {
        var dataItem = data[i];
        if(dataItem.nameKey==name) {
            valuelist.push({
                'key': dataItem.date,
                'x2': dataItem.scaleValue.toFixed(4),
                'x1': dataItem.value
            });
        }
    }

   chart=initStbTmlChart(valuelist,"事件数","稳定性");

    AmCharts.makeChart(chartId, chart);
}

function initStbTmlChart(data_dic,x1_name,x2_name){
    var dcchart={
	  "type": "serial",
	  "theme": "light",
	  "dataDateFormat": "YYYYMMDD",
	  "legend": {
	      "valueWidth": 75,
	  "useGraphSettings": true
	    },
	  "dataProvider": data_dic,
	  "valueAxes": [ {
	    "id":"v1",
	    "axisColor": "#67b7dc",
	    "axisThickness": 2,
	    "gridColor": "#FFFFFF",
	    "gridAlpha": 0,
	    "axisAlpha": 1,
	    "dashLength": 0,
	    "position": "left"
	  },{
	    "id":"v2",
	    "axisColor": "#FCD202",
	    "axisThickness": 2,
	    "gridColor": "#FFFFFF",
	    "gridAlpha": 0,
	    "axisAlpha": 1,
	    "dashLength": 0,
	    "position": "right"
	  } ],
	  "gridAboveGraphs": true,
	  "startDuration": 1,
	  "graphs": [ {
	      "id":"v1",
	    "valueAxis":"v1",
	    "balloonText": "[[category]]: <b>[[value]]</b>",
	    "lineAlpha": 1,
	    "bullet": "round",
	    "hideBulletsCount": 30,
	    "bulletBorderAlpha": 1,
	    "bulletColor": "#67b7dc",
	    "lineColor":"#67b7dc",
	    "bulletSize": 7,
	    "lineThickness": 2,
	    "type": "smoothedLine",
	    "useLineColorForBulletBorder": true,
	    "title":x1_name,
	    "valueField": "x1"
	  },
	            {
	    "id":"v2",
	    "valueAxis":"v2",
	    "balloonText": "[[category]]: <b>[[value]]</b>",
	    "lineAlpha": 1,
	    "bullet": "round",
	    "hideBulletsCount": 30,
	    "bulletBorderAlpha": 1,
	    "bulletColor": "#FCD202",
	    "lineColor":"#FCD202",
	    "bulletSize": 7,
	    "lineThickness": 2,
	    "type": "smoothedLine",
	    "useLineColorForBulletBorder": true,
	    "title":x2_name,
	    "valueField": "x2"
	  }],
	        "chartScrollbar": {
	        "graph": "v1",
	//        "graph":"v2",
	        "scrollbarHeight": 40,
	        "backgroundAlpha": 0,
	        "selectedBackgroundAlpha": 0.1,
	        "selectedBackgroundColor": "#888888",
	        "graphFillAlpha": 0,
	        "graphLineAlpha": 0.5,
	        "selectedGraphFillAlpha": 0,
	        "selectedGraphLineAlpha": 1,
	        "autoGridCount":true,
	        "color":"#AAAAAA"
	    },
	  "chartCursor": {
	    "pan": true,
	    "valueLineEnabled": true,
	    "valueLineBalloonEnabled": true,
	    "valueLineAlpha":0.2,
	    "categoryBalloonEnabled": false,
	    "cursorAlpha": 0,
	    "zoomable": false
	  },
	  "categoryField": "key",
	  "categoryAxis": {
	//    "gridPosition": "start",
	    "gridAlpha": 0.1,
	//  "tickPosition": "start",
	//  "tickLength": 20,
	    "parseDates": true,
	    "axisColor": "#DADADA",
	    "minorGridEnabled": true,
	    "position": "top"
	  },
	  "export": {
	        "enabled": true,
	        "position": "top-right"
	  }
	
	};
    return dcchart;
}

function groupByDate1(data) {
    var ret = {values: {}, seq:[]};
    var minValue, maxValue;
    data.forEach(function(e) {
        var c = {
            key: e.key,
            nameKey: e.nameKey,
            color: e.scaleValue > 0 ? 'green' : 'red',
            value: e.value
        };
        minValue = minValue ? e.value : Math.min(minValue, e.value);
        maxValue = maxValue ? e.value : Math.max(maxValue, e.value);
        if (!(e.date in ret.values)) {
            ret.values[e.date] = [];
            ret.seq.push(e.date);
        }
        ret.values[e.date].push(c);
    });
    ret.seq.sort();
    ret.count = ret.seq.length;
    ret.get = function(idx) {
        return this.values[this.seq[idx]];
    };
    ret.minValue = minValue;
    ret.maxValue = maxValue;
    return ret;
}


function processDataInfoToHeatmap(data,chartId) {
    var valuelist=[];
    dtlen=data.length;
    for (var i = 0; i < dtlen; i++) {
        var dataItem = data[i];
            valuelist.push({
                'id': dataItem.key,
                'name_key':dataItem.nameKey,
                'value': dataItem.value
        });
    }
    var bm;
    bm = initHeatmap(valuelist);
    AmCharts.makeChart(chartId, bm);
}

function initHeatmap(data) {
    var hMap={
      "type": "map",
      "theme": "light",
      colorSteps: 10,

      dataProvider: {
        map: "worldLow",
        areas: data
      },
      areasSettings: {
        balloonText:"<span style='font-size:14px;'><b>[[title]]</b>: [[value]]</span>",
//        autoZoom: true
//        color:"#67b7dc",
//        colorSolid:"#de4c4f"
      },

      valueLegend: {
        right: 10,
        minValue: "little",
        maxValue: "a lot!"
      },

	  "export": {
	    "enabled": true
	  }

    };
    return hMap;
}

function processCityDataToPieChart(data, chartId){
	var chart;
	if(data.length>=8)
        chart=initCityPieChart(data.slice(0,8));
    else{
    	chart=initCityPieChart(data);
    }
	AmCharts.makeChart(chartId, chart);
}

function initCityPieChart(data_dic) {
    var pie = {
	  "type": "pie",
	  "theme": "light",
	  "dataProvider": data_dic,
	  "titleField": "key",
	  "valueField": "value",
	  "labelRadius": 5,
	
	  "radius": "32%",
	  "innerRadius": "50%",
	  "labelText": "[[title]]",
	  "export": {
	        "enabled": true
	  }
	};
    return pie;
}



function groupByDate2(data) {
    var ret = {values: {}, seq:[]};
    var minValue, maxValue;
    data.forEach(function(e) {
        var c = {
            lat: e.lat,
            long: e.long,
            key: e.nameKey,
            color: e.value > 200 ? 'red' : (e.value > 100 ? '#ff4500' : (e.value > 20 ? 'green' : 'limegreen')),
            value: e.value
        };
        minValue = minValue ? e.value : Math.min(minValue, e.value);
        maxValue = maxValue ? e.value : Math.max(maxValue, e.value);
        if (!(e.date in ret.values)) {
            ret.values[e.date] = [];
            ret.seq.push(e.date);
        }
        ret.values[e.date].push(c);
    });
    ret.seq.sort();
    ret.count = ret.seq.length;
    ret.get = function(idx) {
        return this.values[this.seq[idx]];
    };
    ret.minValue = minValue;
    ret.maxValue = maxValue;
    return ret;
}


function processDataInfoToBubblemap(data,chartid, minValue, maxValue) {

    var dtlen = data.length;
    var min = minValue;
    if (!min) {
        min = data[0].value;
        for (var _i = 1; _i < data.length; ++_i) {
            if (data[_i].value < min) { min = data[_i].value; }
        }
    }
    var max = maxValue;
    if (!max) {
        max = data[0].value;
        for (var _j = 1; _j < data.length; ++_j) {
            if (data[_j].value > max) { max = data[_j].value; }
        }
    }
    var img = [];
    var minBulletSize = 5;
    var maxBulletSize = 30;
    var maxSquare = maxBulletSize * maxBulletSize * 2 * Math.PI;
    var minSquare = minBulletSize * minBulletSize * 2 * Math.PI;

    for (var i = 0; i < dtlen; i++) {
        var dataItem = data[i];
        var value = dataItem.value;
        // calculate size of a bubble
        var square = (value - min) / (max - min) * (maxSquare - minSquare) + minSquare;
        if (square < minSquare) {
            square = minSquare;
        }
        var size = Math.sqrt(square / (Math.PI * 2));
        var id = dataItem.key;

        img.push({
            type: "circle",
            width: size,
            height: size,
            color: dataItem.color,
            longitude: dataItem.long,
            latitude: dataItem.lat,
            title: dataItem.key,
            value: value
        });
    }

    var chart = null;
    if (typeof(chartid) === 'string') {
        var bm;
        bm = initBubblemap(img);
        chart = AmCharts.makeChart(chartid, bm);
    }
    else {
        chart = chartid;
        chart.dataProvider.images = img;
        chart.validateData();
    }
    return chart;
}


function initBubblemap(img) {
    var bMap={

      "type": "map",
      "theme": "light",
      "titles": [],
      "dataProvider": {
        mapVar: AmCharts.maps.worldLow,
		images: img

      },
      "imagesSettings":{
        balloonText:"<span style='font-size:14px;'><b>[[title]]</b>: [[value]]</span>"
      },
      "areasSettings": {
        unlistedAreasColor: "#000000",
		unlistedAreasAlpha: 0.1
//        "autoZoom": true,
//        "selectedColor": "#CC0000"
      },
//      "smallMap": {
//          mapColor:"#67b7dc",
//          borderColor:"#67b7dc"
//      },
      "export": {
        "enabled": true
      }
    };
    return bMap;
}