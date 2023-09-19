//获取根路径
function getBasePath(){ 
	var obj=window.location; 
	var contextPath=obj.pathname.split("/")[1]; 
	var basePath=obj.protocol+"//"+obj.host+"/"+contextPath; 
	return basePath; 
} 
//初始化map
function init_bubble_map(img) {
	var basePath = getBasePath();
	if(img == undefined){
		var b_map={
			 "type": "map",
			 "theme": "light",
			 "path": basePath+"/static/Visualization/js/amcharts/",
			 "dataProvider": {
				 mapVar: AmCharts.maps.worldLow,
			 },
			 "areasSettings": {
			        unlistedAreasColor: "#000000",
					unlistedAreasAlpha: 0.3
			      },
		     "smallMap": {
		    	 "rectangleColor":"#ccc"
		     },
			 "export": {
			        "enabled": true,
			        "position": "bottom-right",
		            "libs": {
			           "path": basePath+"/static/Visualization/js/amcharts/export/libs/"
		            }
		}
	};
	}else{
		var b_map={
			      "type": "map",
			      "theme": "light",
			      "path": basePath+"/static/Visualization/js/amcharts/",
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
					unlistedAreasAlpha: 0.2
			      },
			      "smallMap": {
			    	  "rectangleColor":"#ccc"
			      },
			      "export": {
			        "enabled": true,
			        "position": "bottom-right",
			           "libs": {
			      "path": basePath+"/static/Visualization/js/amcharts/export/libs/"
			    }

			      }
			    };
	}
    return b_map;
}
function process_dic_to_bubblemap(data,chartid, minValue, maxValue) {
	if(!jQuery.isEmptyObject(data)){//判断state_data是否为空
			var dtlen = data.length;
		    
		    if(dtlen>0){
			    var min = minValue;
			    if (min==undefined ) {
			        min = data[0].value;
			        for (var _i = 1; _i < data.length; ++_i) {
			            if (data[_i].value < min) { min = data[_i].value; }
			        }
			    }
			    var max = maxValue;
			    if (max==undefined ) {
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
		    }
	}
	var chart = null;
    if (typeof(chartid) === 'string') {
        var bm;
        bm = init_bubble_map(img);
        chart = AmCharts.makeChart(chartid, bm);
    }
    else {
        chart = chartid;
        chart.dataProvider.images = img;
        chart.validateData();
    }
    return chart;
}
function process_dic_to_bubblemap2(data,chartid, minValue, maxValue) {
	if(!jQuery.isEmptyObject(data)){//判断state_data是否为空
		 var dtlen = data.length;
		 if(dtlen>0){
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
		        var color = dataItem.color;
		        if(value == 0){
		        	color = "#ffffff";
		        }
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
		            color: color,
		            longitude: dataItem.longitude,
		            latitude: dataItem.lat,
		            title: dataItem.key,
		            value: value
		        });
		    }
		 }
	}
	var chart = null;
    if (typeof(chartid) === 'string') {
        var bm;
        bm = init_bubble_map(img);
        chart = AmCharts.makeChart(chartid, bm);
    }
    else {
        chart = chartid;
        chart.dataProvider.images = img;
        chart.validateData();
    }
    return chart;
}
function process_dic_to_bubblemap3(data,chartid, maxValue) {
	if(!jQuery.isEmptyObject(data)){//判断state_data是否为空
		 var dtlen = data.length;
		 if(dtlen>0){
		    var min = 0;
		    var max = maxValue;
		    var img = [];
		    var minBulletSize = 5;
		    var maxBulletSize = 30;
		    var maxSquare = maxBulletSize * maxBulletSize * 2 * Math.PI;
		    var minSquare = minBulletSize * minBulletSize * 2 * Math.PI;

		    for (var i = 0; i < dtlen; i++) {
		        var dataItem = data[i];
		        var value = dataItem.value;
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
		 }
	}
	var chart = null;
    if (typeof(chartid) === 'string') {
        var bm;
        bm = init_bubble_map(img);
        chart = AmCharts.makeChart(chartid, bm);
    }
    else {
        chart = chartid;
        chart.dataProvider.images = img;
        chart.validateData();
    }
    return chart;
}
function init_heat_map(chartid,data,maxValue) {
	var map = AmCharts.makeChart( chartid, {
	      "type": "map",
	      "theme": "light",
	      "path": getBasePath()+"/static/Visualization/js/amcharts/",
	      "colorSteps": 10,
	      "minVlaue":0,
	      "maxValue":maxValue,
	      dataProvider: {
	        map: "worldLow",
	        areas: data
	      },
	      areasSettings: {
	    	    unlistedAreasColor: "#000000",
				unlistedAreasAlpha: 0.3,
				balloonText:"<span style='font-size:14px;'><b>[[title]]</b>: [[value]]</span>",
	      },
	      "smallMap": {
	    	  "rectangleColor":"#ccc"
	      },
	      valueLegend: {
	        right: 100,
	        bottom:10,
	        minValue: "little",
	        maxValue: "a lot!"
	  },
	  "export": {
	    "enabled": true,
	    "position": "bottom-right",
	    "libs": {
	      "path": getBasePath()+"/static/Visualization/js/amcharts/export/libs/"
	    }
	  }
		}
	
	
	);
    
}


function process_dic_to_heatmap(data,chartid,maxValue) {
    var valuelist=[];
    if(!data==""||!data==null||!data==undefined){
    	dtlen=data.length;
        for (var i = 0; i < dtlen; i++) {
            var dataItem = data[i];
                valuelist.push({
                    'id': dataItem.key,
                    'name_key':dataItem.name_key,
                    'value': dataItem.value
            });
        }
    }
   init_heat_map(chartid,valuelist,maxValue);
}
function init_line_map(chartid,data,line) {
	if(!jQuery.isEmptyObject(data) || !jQuery.isEmptyObject(data) ){//判断state_data是否为空
	AmCharts.makeChart( chartid, {
		   type: "map",
		      "theme": "light",
		      path: getBasePath()+"/static/Visualization/js/amcharts/",

		      dataProvider: {
		        map: "worldLow",
		        linkToObject: data[0].id,
		        images: data,
		          lines:line
		      },

		      areasSettings: {
		        unlistedAreasColor: "#000000",
		        unlistedAreasAlpha: 0.2
		      },

		      imagesSettings: {
		        color: "#CC0000",
		        rollOverColor: "#CC0000",
		        selectedColor: "#000000"
		      },

		      linesSettings: {
		        color: "#CC4748",
		        alpha: 0.4
		      },
		      linesAboveImages: true,
		      "smallMap": {
		    	  "rectangleColor":"#ccc"
		      },
		      "export": {
		        "enabled": true,
		        "position": "bottom-right",
	            "libs": {
		        	  "path": getBasePath()+"/static/Visualization/js/amcharts/export/libs/"
		        }
		      }
		    }
	);
	}
   
}

function process_dic_to_linemap(data,chartid) {

	if(jQuery.isEmptyObject(data)){//判断data是否为空,清空div或者是清除图表数据
		$("#"+chartid).empty();
	}
    dtlen=data.length;
    var maxvalue=0;
    if(dtlen>0){maxvalue=data[0].value;}
    var rate=4.0/maxvalue;
    var valuedic={};
    var dotdic={};
    for (var i = 0; i < dtlen; i++) {
        var dataItem = data[i];
        if (dataItem.actor1_name in valuedic) {
            var temp=rate * dataItem.value;
            if(temp<1){temp=1;}
            valuedic[dataItem.actor1_name]['lines'].push({
                thickness: temp,
                latitudes: [ dataItem.actor1_lat, dataItem.actor2_lat ],
                longitudes: [ dataItem.actor1_long, dataItem.actor2_long ]
            })

        }
        else {
            valuedic[dataItem.actor1_name] = {
                'id': dataItem.actor1_name,
                'color': "#000000",
                'type': 'circle',
                'title':dataItem.actor1_name,
                'latitude': dataItem.actor1_lat,
                'longitude': dataItem.actor1_long,
                'scale': 0.9,
                'lines': [
                    {
                        arrow:"end",
                        arrowSize:rate * dataItem.value*3,
                        thickness: rate * dataItem.value,
                        latitudes: [ dataItem.actor1_lat, dataItem.actor2_lat ],
                        longitudes: [ dataItem.actor1_long, dataItem.actor2_long ]
                    }
                ]
            }

        }
        if(dataItem.actor2_name in dotdic){

                dotdic[dataItem.actor2_name]['scale']=0.5;
        }

        else
        {
            dotdic[dataItem.actor2_name] = {
                'type': 'circle',
                'title':dataItem.actor2_name,
                'latitude': dataItem.actor2_lat,
                'longitude': dataItem.actor2_long,
                'scale': 0.5,
                'color':"#FF9966"
            }
        }
    }
    
	//}
    var linelist=[];
    var valuelist=[];
    for (var key in valuedic) {
        valuelist.push(valuedic[key]);
        linelist=linelist.concat(valuedic[key]['lines'])
    }
    for(var dkey in dotdic) {
        valuelist.push(dotdic[dkey]);
    }
    
    init_line_map(chartid,valuelist,linelist);

}
