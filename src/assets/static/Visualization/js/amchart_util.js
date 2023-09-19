function init_double_column_chart(chartid,data_dic,x1_name,x2_name){
	
	var chart = AmCharts.makeChart( chartid , {
		  "type": "serial",
		  "theme": "light",
		  "path":  getBasePath()+"/static/Visualization/js/amcharts/",
		  "legend": {
			  "valueAlign": "left",
		      "valueWidth": 150,
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
		    "valueAxis":"v1",
		    "balloonText": "[[key]]: <b>[[value]]</b>",
		    "fillAlphas": 0.8,
		    "lineAlpha": 0.2,
		    "gridColor": "#FFFFFF",
		    "type": "column",
		    "title":x1_name,
		    "valueField": "x1"
		  },
		            {
		    "valueAxis":"v2",
		    "balloonText": "[[key]]: <b>[[value]]</b>",
		    "lineAlpha": 1,
		    "bullet": "round",
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
		  "chartCursor": {
		    "categoryBalloonEnabled": false,
		    "cursorAlpha": 0,
		    "zoomable": false
		  },
		  "categoryField": "name",
		  "categoryAxis": {
		    "gridPosition": "start",
		    "gridAlpha": 0.1,
		    "tickPosition": "start",
		    "tickLength": 20
		  },
		  "export": {
		        "enabled": true,
		        "position": "bottom-right",
		       "libs": {
		      "path":  getBasePath()+"/static/Visualization/js/amcharts/export/libs/"
		    }
		  }
		} 
	
	);
	
	
	
	
	
	
	
	
   /* var dcchart={
  "type": "serial",
  "theme": "light",
  "path":  getBasePath()+"/static/Visualization/js/amcharts/",
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
    "valueAxis":"v1",
    "balloonText": "[[category]]: <b>[[value]]</b>",
    "fillAlphas": 0.8,
    "lineAlpha": 0.2,
    "gridColor": "#FFFFFF",
    "type": "column",
    "title":x1_name,
    "valueField": "x1"
  },
            {
    "valueAxis":"v2",
    "balloonText": "[[category]]: <b>[[value]]</b>",
    "lineAlpha": 1,
    "bullet": "round",
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
  "chartCursor": {
    "categoryBalloonEnabled": false,
    "cursorAlpha": 0,
    "zoomable": false
  },
  "categoryField": "key",
  "categoryAxis": {
    "gridPosition": "start",
    "gridAlpha": 0.1,
    "tickPosition": "start",
    "tickLength": 20
  },
  "export": {
        "enabled": true,
        "position": "bottom-right",
       "libs": {
      "path":  getBasePath()+"/static/Visualization/js/amcharts/export/libs/"
    }
  }

}
    return dcchart;*/
}
//修改柱状图
function init_column_chart(data_dic,chartid) {
	AmCharts.makeChart(chartid, {
		  "type": "serial",
		  "theme": "light",
		  "dataProvider": data_dic,
		  "valueAxes": [ {
	            "gridColor": "#FFFFFF",
	            "gridAlpha": 0.2,
	            "dashLength": 0
	       } ],
		  "gridAboveGraphs": true,
		  "startDuration": 1,
		  "graphs": [ {
		    "balloonText": "[[category]]: <b>[[value]]</b>",
		    "fillAlphas": 0.8,
		    "lineAlpha": 0.2,
		    "type": "column",
		    "valueField": "visits"
		  } ],
		  "gridAboveGraphs": true,
          "startDuration": 1,
          "graphs": [ {
            "balloonText": "[[name_key]]: <b>[[value]]</b>",
            "fillAlphas": 0.8,
            "lineAlpha": 0.2,
            "type": "column",
            "valueField": "value"
          } ],
          "chartCursor": {
            "categoryBalloonEnabled": false,
            "cursorAlpha": 0,
            "zoomable": false
          },
          "categoryField": "key",
          "categoryAxis": {
            "labelRotation": 45,
            "gridPosition": "start",
            "gridAlpha": 0,
            "tickPosition": "start",
            "tickLength": 20
          },
		  "export": {
		    "enabled": true,
		    "libs": {
				"path": getBasePath()+"/static/Visualization/js/amcharts/export/libs/"
			}
		  }
		});
}
/*1120 修改*/
function init_column_chart2(data_dic,chartid) {
	AmCharts.makeChart(chartid, {
		  "type": "serial",
		  "theme": "light",
		  "dataProvider": data_dic,
		  "valueAxes": [ {
	            "gridColor": "#FFFFFF",
	            "gridAlpha": 0.2,
	            "dashLength": 0
	       } ],
		  "gridAboveGraphs": true,
		  "startDuration": 1,
		  "graphs": [ {
		    "balloonText": "[[category]]: <b>[[value]]</b>",
		    "fillAlphas": 0.8,
		    "lineAlpha": 0.2,
		    "type": "column",
		    "valueField": "visits"
		  } ],
		  "gridAboveGraphs": true,
          "startDuration": 1,
          "graphs": [ {
            "balloonText": "[[ch_key]]: <b>[[value]]</b>",
            "fillAlphas": 0.8,
            "lineAlpha": 0.2,
            "type": "column",
            "valueField": "value"
          } ],
          "chartCursor": {
            "categoryBalloonEnabled": false,
            "cursorAlpha": 0,
            "zoomable": false
          },
          "categoryField": "key",
          "categoryAxis": {
            "labelRotation": 0,
            "gridPosition": "start",
            "gridAlpha": 0,
            "tickPosition": "start",
            "tickLength": 20
          },
		  "export": {
		    "enabled": true,
		    "libs": {
				"path": getBasePath()+"/static/Visualization/js/amcharts/export/libs/"
			}
		  }
		});
}
function process_dic_to_amchart1(data_dic,chartid,ii,value) {
	
	if(value==null||value==0){
		if(data_dic.length>=10){
			data_dic = data_dic.slice(0,10);
		}
		else{data_dic = data_dic.slice(0,10);}
	}else{
		data_dic = data_dic.slice(0,value);
	}
	AmCharts.makeChart(chartid, {
		"type": "serial",
		"theme": "light",
		"dataProvider": data_dic,
		"valueAxes": [ {
			"gridColor": "#FFFFFF",
			"gridAlpha": 0.2,
			"dashLength": 0
		} ],
		"gridAboveGraphs": true,
		"startDuration": 1,
		"graphs": [ {
			"balloonText": "[[category]]: <b>[[value]]</b>",
			"fillAlphas": 0.8,
			"lineAlpha": 0.2,
			"type": "column",
			"valueField": "visits"
		} ],
		"gridAboveGraphs": true,
		"startDuration": 1,
		"graphs": [ {
			"balloonText": "[[name_key]]: <b>[[value]]</b>",
			"fillAlphas": 0.8,
			"lineAlpha": 0.2,
			"type": "column",
			"valueField": "value"
		} ],
		"chartCursor": {
			"categoryBalloonEnabled": false,
			"cursorAlpha": 0,
			"zoomable": false
		},
		"categoryField": "chname",
		"categoryAxis": {
			"labelRotation": 0,
			"gridPosition": "start",
			"gridAlpha": 0,
			"tickPosition": "start",
			"tickLength": 20
		},
		"export": {
			"enabled": true,
			"libs": {
				"path": getBasePath()+"/static/Visualization/js/amcharts/export/libs/"
			}
		}
	});
}
/*function init_column_chart(data_dic) {
	var chart = {
			"type": "serial",
			"theme": "light",
			"dataProvider": data_dic,
			"valueAxes": [ {
				"gridColor": "#FFFFFF",
				"gridAlpha": 0.2,
				"dashLength": 0
			} ],
			"gridAboveGraphs": true,
			"startDuration": 1,
			"graphs": [ {
				"balloonText": "[[name_key]]: <b>[[value]]</b>",
				"fillAlphas": 0.8,
				"lineAlpha": 0.2,
				"type": "column",
				"valueField": "value"
			} ],
			"chartCursor": {
				"categoryBalloonEnabled": false,
				"cursorAlpha": 0,
				"zoomable": false
			},
			"categoryField": "key",
			"categoryAxis": {
				"labelRotation": 0,
				"gridPosition": "start",
				"gridAlpha": 0,
				"tickPosition": "start",
				"tickLength": 20
			},
			"export": {
				"enabled": true,
				"libs": {
					"path":  getBasePath()+"/static/Visualization/js/amcharts/export/libs/"
				}
			}
	};
	return chart;
}*/

//获取根路径
function getBasePath(){ 
	var obj=window.location; 
	var contextPath=obj.pathname.split("/")[1]; 
	var basePath=obj.protocol+"//"+obj.host+"/"+contextPath; 
	return basePath; 
} 

//修改饼状图
function init_pie_chart(data_dic,chartid) {
	AmCharts.makeChart(chartid, {
		   "type": "pie",
		   "theme": "light",
		   "dataProvider": data_dic,
		   "titleField": "key",
		   "valueField": "value",
		   "labelRadius": 5,
		   "radius": "32%",
		   "innerRadius": "50%",
		   "labelText": "[[key]]",
		   "export": {
		        "enabled": true,
		        "libs": {
		            "path": getBasePath()+"/static/Visualization/js/amcharts/export/libs/"
		          }
		     }
		});
}
//------1214------
function init_pie_chart_lx(data_dic,chartid) {
	AmCharts.makeChart(chartid, {
		   "type": "pie",
		   "theme": "light",
		   "dataProvider": data_dic,
		   "titleField": "key",
		   "valueField": "value",
		   "labelRadius": 5,
		   "radius": "32%",
		   "innerRadius": "50%",
		   "labelText": "[[chname]]",
		   "export": {
		        "enabled": true,
		        "libs": {
		            "path": getBasePath()+"/static/Visualization/js/amcharts/export/libs/"
		          }
		     }
		});
}
/*function init_pie_chart(data_dic) {
	var basePath = getBasePath();
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
        "enabled": true,
        "libs": {
      "path": basePath+"/static/Visualization/js/amcharts/export/libs/"
    }
    }
};
    return pie;
}*/
function init_radar_chart(data_dic,chartid) {
	var chart = AmCharts.makeChart( chartid, {
		"type": "radar",
	    "path": getBasePath()+"/static/Visualization/js/amcharts/",
	    "theme": "light",
	    "dataProvider": data_dic,
	    "valueAxes": [ {
	    "axisTitleOffset": 20,
	    "minimum": 0,
	    "axisAlpha": 0.15
	  } ],
	  "startDuration": 2,
	  "graphs": [ {
	    "balloonText": "[[category]]: [[value]]",
	    "bullet": "round",
	    "valueField": "value"
	  } ],
	  "categoryField":"name_key",
		  "export": {
		    "enabled": true,
		    "libs": {
		        "path": getBasePath()+"/static/Visualization/js/amcharts/export/libs/"
		      }
		  }
		});
}
/*1120修改category-key,name_key-key*/
function init_radar_chart2(data_dic,chartid) {
	var chart = AmCharts.makeChart( chartid, {
		"type": "radar",
	    "path": getBasePath()+"/static/Visualization/js/amcharts/",
	    "theme": "light",
	    "dataProvider": data_dic,
	    "valueAxes": [ {
	    "axisTitleOffset": 20,
	    "minimum": 0,
	    "axisAlpha": 0.15
	  } ],
	  "startDuration": 2,
	  "graphs": [ {
	    "balloonText": "[[key]]: [[value]]",
	    "bullet": "round",
	    "valueField": "value"
	  } ],
	  "categoryField":"key",
		  "export": {
		    "enabled": true,
		    "libs": {
		        "path": getBasePath()+"/static/Visualization/js/amcharts/export/libs/"
		      }
		  }
		});
}
/*function init_radar_chart(data_dic) {
	var radar =  {
			"type": "radar",
			"path":  getBasePath()+"/static/Visualization/js/amcharts/",
			"theme": "light",
			"dataProvider": data_dic,
			"valueAxes": [ {
				"axisTitleOffset": 20,
				"minimum": 0,
				"axisAlpha": 0.15
			} ],
			"startDuration": 2,
			"graphs": [ {
				"balloonText": "[[category]]: [[value]]",
				"bullet": "round",
				"valueField": "value"
			} ],
			"categoryField":"name_key",
			"export": {
				"enabled": true,
				"libs": {
					"path":  getBasePath()+"/static/Visualization/js/amcharts/export/libs/"
				}
			}
	};
	return radar;
}*/

/**
 * 根据数据的长度控制横坐标的最小值
 */
function getMinHorizontalGap(data_dic){
	var minHorizontalGap = 200;
	if(data_dic.length>0){
		if(data_dic.length==2){
			minHorizontalGap=800;
		}else if(data_dic.length==3){
			minHorizontalGap=400;
		}
	}
	return minHorizontalGap;
}

function init_date_chart(chartid,data_dic){
	
	var minHorizontalGap = getMinHorizontalGap(data_dic);
	
	var date_chart = AmCharts.makeChart( chartid, {
        "type": "xy",
        "theme": "light",
        "marginRight": 80,
        "path":  getBasePath()+"/static/Visualization/js/amcharts/",
        "startDuration": 1.5,
        "trendLines": [],
        "balloon": {
            "adjustBorderColor": false,
            "shadowAlpha": 0,
            "textAlign":"left"
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
        },{
        	"balloonText": "",
            "bullet": "diamond",
            "bulletBorderAlpha": 0,
            "bulletAlpha": 0,
            "lineAlpha": 0,
            "fillAlphas": 0,
            "valueField": "value2",
            "xField": "x",
            "yField": "y",
            "maxBulletSize": 100
        }],
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
            "minHorizontalGap":minHorizontalGap,
            "startOnAxis":true,
        }],
        "allLabels": [],
        "titles": [],
        "dataProvider": data_dic,

        "export": {
            "enabled": true,
            "libs": {
          "path":  getBasePath()+"/static/Visualization/js/amcharts/export/libs/"
        }
        },

        "chartScrollbar": {
            "offset": 15,
            "scrollbarHeight": 5
        }
    });
    //return date_chart;

}

function init_line_column_chart(data_dic,x1_name,x2_name,chartid){
	AmCharts.makeChart( chartid, {
	      "type": "serial",
	      "theme": "light",
	      "path":  getBasePath()+"/static/Visualization/js/amcharts/",
	      "legend": {
	      	  "valueAlign": "left",
	          "valueWidth": 150,
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
	        "valueAxis":"v1",
	        "balloonText": "[[category]]: <b>[[value]]</b>",
	        "fillAlphas": 0.8,
	        "lineAlpha": 0.2,
	        "gridColor": "#FFFFFF",
	        "type": "column",
	        "title":x1_name,
	        "valueField": "x1"
	      },
	                {
	        "valueAxis":"v2",
	        "balloonText": "[[category]]: <b>[[value]]</b>",
	        "lineAlpha": 1,
	        "bullet": "round",
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
	      "chartCursor": {
	        "categoryBalloonEnabled": false,
	        "cursorAlpha": 0,
	        "zoomable": false
	      },
	      "categoryField": "key",
	      "categoryAxis": {
	        "labelRotation": 45,
	        "gridPosition": "start",
	        "gridAlpha": 0.1,
	        "tickPosition": "start",
	        "tickLength": 20
	      },
	      "export": {
	            "enabled": true,
	            "position": "bottom-right",
	           "libs": {
	          "path":  getBasePath()+"/static/Visualization/js/amcharts/export/libs/"
	        }
	      }
	});
}
//----------12-5---------
function init_line_column_chart2(data_dic,x1_name,chartid){
	AmCharts.makeChart( chartid, {
	      "type": "serial",
	      "theme": "light",
	      "path":  getBasePath()+"/static/Visualization/js/amcharts/",
	      "legend": {
	      	  "valueAlign": "left",
	          "valueWidth": 150,
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
	        "valueAxis":"v1",
	        "balloonText": "[[category]]: <b>[[value]]</b>",
	        "fillAlphas": 0.8,
	        "lineAlpha": 0.2,
	        "gridColor": "#FFFFFF",
	        "type": "column",
	       // "title":x1_name,
	        "valueField": "x1"
	      }],
	      "chartCursor": {
	        "categoryBalloonEnabled": false,
	        "cursorAlpha": 0,
	        "zoomable": false
	      },
	      "categoryField": "key",
	      "categoryAxis": {
	        "labelRotation": 45,
	        "gridPosition": "start",
	        "gridAlpha": 0.1,
	        "tickPosition": "start",
	        "tickLength": 20
	      },
	      "export": {
	            "enabled": true,
	            "position": "bottom-right",
	           "libs": {
	          "path":  getBasePath()+"/static/Visualization/js/amcharts/export/libs/"
	        }
	      }
	});
}
/*function init_line_column_chart(data_dic,x1_name,x2_name){
	var dcchart={
			"type": "serial",
			"theme": "light",
			"path":  getBasePath()+"/static/Visualization/js/amcharts/",
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
				"valueAxis":"v1",
				"balloonText": "[[category]]: <b>[[value]]</b>",
				"fillAlphas": 0.8,
				"lineAlpha": 0.2,
				"gridColor": "#FFFFFF",
				"type": "column",
				"title":x1_name,
				"valueField": "x1"
			},
			{
				"valueAxis":"v2",
				"balloonText": "[[category]]: <b>[[value]]</b>",
				"lineAlpha": 1,
				"bullet": "round",
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
			"chartCursor": {
				"categoryBalloonEnabled": false,
				"cursorAlpha": 0,
				"zoomable": false
			},
			"categoryField": "key",
			"categoryAxis": {
				"labelRotation": 45,
				"gridPosition": "start",
				"gridAlpha": 0.1,
				"tickPosition": "start",
				"tickLength": 20
			},
			"export": {
				"enabled": true,
				"position": "bottom-right",
				"libs": {
					"path":  getBasePath()+"/static/Visualization/js/amcharts/export/libs/"
				}
			}
			
	};
	return dcchart;
}
*/
function init_double_line_chart(chartid,data_dic,x1_name,x2_name){
	AmCharts.makeChart(chartid, {
	  "type": "serial",
	  "theme": "light",
	  "path":  getBasePath()+"/static/Visualization/js/amcharts/",
	  "dataDateFormat": "YYYYMMDD",
	  "legend": {
		  "valueAlign": "left",
	      "valueWidth": 150,
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
	    "gridAlpha": 0.1,
	    "parseDates": true,
	    "axisColor": "#DADADA",
	    "minorGridEnabled": true,
	    "position": "top"
	  },
	  "export": {
	        "enabled": true,
	        "position": "bottom-right",
	       "libs": {
	      "path":  getBasePath()+"/static/Visualization/js/amcharts/export/libs/"
	    }
	  }
	});
}
//------12-5-----------
function init_double_line_chart2(chartid,data_dic,x1_name){
	AmCharts.makeChart(chartid, {
	  "type": "serial",
	  "theme": "light",
	  "path":  getBasePath()+"/static/Visualization/js/amcharts/",
	  "dataDateFormat": "YYYYMMDD",
	  "legend": {
		  "valueAlign": "left",
	      "valueWidth": 150,
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
	  }],
	        "chartScrollbar": {
	        "graph": "v1",
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
	    "gridAlpha": 0.1,
	    "parseDates": true,
	    "axisColor": "#DADADA",
	    "minorGridEnabled": true,
	    "position": "top"
	  },
	  "export": {
	        "enabled": true,
	        "position": "bottom-right",
	       "libs": {
	      "path":  getBasePath()+"/static/Visualization/js/amcharts/export/libs/"
	    }
	  }
	});
}
function init_tri_line_chart(data_dic,x1_name,x2_name,x3_name){
    var dcchart={
  "type": "serial",
  "theme": "light",
  "path":  getBasePath()+"/static/Visualization/js/amcharts/",
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
  }],
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
    "valueAxis":"v1",
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
  },
            {
    "id":"v3",
    "valueAxis":"v1",
    "balloonText": "[[category]]: <b>[[value]]</b>",
    "lineAlpha": 1,
    "bullet": "round",
    "hideBulletsCount": 30,
    "bulletBorderAlpha": 1,
    "bulletColor": "#84B761",
    "lineColor":"#84B761",
    "bulletSize": 7,
    "lineThickness": 2,
    "type": "smoothedLine",
    "useLineColorForBulletBorder": true,
    "title":x3_name,
    "valueField": "x3"
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
        "position": "bottom-right",
       "libs": {
      "path":  getBasePath()+"/static/Visualization/js/amcharts/export/libs/"
    }
  }

};
    return dcchart;
}

function scroll_make_chart(id,chart) {
        var hT = $('#'+id).offset().top,
            hH = $('#'+id).outerHeight(),
            wH = $(window).height(),
            wS = $(this).scrollTop();
        if (wS > (hT+hH/3-wH)){
            AmCharts.makeChart(id, chart);
            return true;
        }
    return false;
}
//修改process_dic_to_amchart方法。去掉一个参数text_id
function process_dic_to_amchart(data,charttype,chartid,value) {
	
        if(charttype=='column_chart')
        {
        	if(value==null||value==0){
        		if(data.length>=10){
        			init_column_chart(data.slice(0,10),chartid);
        		}
        		
        		else{init_column_chart(data,chartid);}
        	}else{
        		init_column_chart(data.slice(0,value),chartid);
        	}

        }
        else if(charttype=='pie_chart')
        {
        	if(value==null||value==0){
        		if(data.length>=8){
        			init_pie_chart(data.slice(0,8),chartid);
        		}
        		else{init_pie_chart(data,chartid);}
        	}else{
        		init_pie_chart(data.slice(0,value),chartid);
        	}
        }
        else if(charttype=='radar_chart')
        {
        	if(value==null||value==0){
        		if(data.length>=6){
        			init_radar_chart(data.slice(0,6),chartid);
        		}
        		else{init_radar_chart(data,chartid);}
        	}else{
        		init_radar_chart(data.slice(0,value),chartid);
        	}
        }
}
function process_dic_to_pie(data,charttype,chartid,value) {
   if(charttype=='pie_chart')
    {
    	if(value==null||value==0){
    		if(data.length>=8){
    			init_pie_chart_lx(data.slice(0,8),chartid);
    		}
    		else{init_pie_chart_lx(data,chartid);}
    	}else{
    		init_pie_chart_lx(data.slice(0,value),chartid);
    	}
    }
}
/*1120修改name_key-key*/
function process_dic_to_amchart2(data,charttype,chartid,value) {
    if(charttype=='column_chart')
    {
    	if(value==null||value==0){
    		if(data.length>=10){
    			init_column_chart2(data.slice(0,10),chartid);
    		}
    		else{init_column_chart2(data,chartid);}
    	}else{
    		init_column_chart2(data.slice(0,value),chartid);
    	}

    }
    else if(charttype=='pie_chart')
    {
    	if(value==null||value==0){
    		if(data.length>=8){
    			init_pie_chart(data.slice(0,8),chartid);
    		}
    		else{init_pie_chart(data,chartid);}
    	}else{
    		init_pie_chart(data.slice(0,value),chartid);
    	}
    }
    else if(charttype=='radar_chart')
    {
    	if(value==null||value==0){
    		if(data.length>=6){
    			init_radar_chart2(data.slice(0,6),chartid);
    		}
    		else{init_radar_chart2(data,chartid);}
    	}else{
    		init_radar_chart2(data.slice(0,value),chartid);
    	}
    }
}


function int_rander_chart3(data,chartId,count){
	if(count==null||count==0){
		if(data.length>=6){
			data = data.slice(0,6);
		}
	}else{
		data = data.slice(0,count);
	}
	var chart = AmCharts.makeChart( chartId, {
		"type": "radar",
	    "path": getBasePath()+"/static/Visualization/js/amcharts/",
	    "theme": "light",
	    "dataProvider": data,
	    "valueAxes": [ {
	    "axisTitleOffset": 20,
	    "minimum": 0,
	    "axisAlpha": 0.15
	  } ],
	  "startDuration": 2,
	  "graphs": [ {
	    "balloonText": "[[ch_key]]: [[value]]",
	    "bullet": "round",
	    "valueField": "value"
	  } ],
	  "categoryField":"key",
		  "export": {
		    "enabled": true,
		    "libs": {
		        "path": getBasePath()+"/static/Visualization/js/amcharts/export/libs/"
		      }
		  }
		});
}

function process_dic_to_datechart(data,chartid) {
        var valuelist=[];
        var dtlen=data.length;
        for (var i = 0; i < dtlen; i++) {
            var dataItem = data[i];
            if(dataItem.key != "" && dataItem.key != null){
            	valuelist.push({
                    'x': dataItem.key.slice(4,6)+"-"+dataItem.key.slice(6,8),
                    'y': dataItem.key.slice(0,4),
                    'value': dataItem.value,
                    'value2':0
                });
            }
        }
        //var chart;
        init_date_chart(chartid,valuelist);
        //AmCharts.makeChart(chartid, chart);
}
//修改
function process_dic_to_line_column_chart(data,chartid,value,weight) {
        var chart;
        dtlen=data.length;
//        alert(data[0].key.slice(4,6));
        var valuelist=[];
        for (var i = 0; i < dtlen; i++) {
            var dataItem = data[i];
            valuelist.push({
            	'name':dataItem.chName,
                'key': dataItem.name_key,
                'x2': Math.floor(dataItem.scale_value),
                'x1': dataItem.value
            });
        }
        if(value==null||value==0){
        	if(data.length>=10){
        		//群众
        		if(weight==1)
        		{
        			init_double_column_chart(chartid,valuelist.slice(0,10),"事件数","稳定性");
        		}
        		
	        	if(weight==2){
	        		init_double_column_chart(chartid,valuelist.slice(0,10),"文章数","稳定性");
	        		
	        	}
	        	if(weight==3){
	        		init_double_column_chart(chartid,valuelist.slice(0,10),"信源数","稳定性");
	        		
	        	}
	        	if(weight==4){
	        		init_double_column_chart(chartid,valuelist.slice(0,10),"事件(去重)","稳定性");
	        		
	        	}
        		
        	}
        	else{
        		if(weight==1)
        		{
        			init_double_column_chart(chartid,valuelist,"事件数","稳定性");
        		}
        		
	        	if(weight==2){
	        		init_double_column_chart(chartid,valuelist,"文章数","稳定性");
	        		
	        	}
	        	if(weight==3){
	        		init_double_column_chart(chartid,valuelist,"信源数","稳定性");
	        		
	        	}
	        	if(weight==4){
	        		init_double_column_chart(chartid,valuelist,"事件(去重)","稳定性");
	        		
	        	}
        		
        	}
        }else{
        	if(weight==1)
    		{
    			init_double_column_chart(chartid,valuelist.slice(0,value),"事件数","稳定性");
    		}
    		
        	if(weight==2){
        		init_double_column_chart(chartid,valuelist.slice(0,value),"文章数","稳定性");
        		
        	}
        	if(weight==3){
        		init_double_column_chart(chartid,valuelist.slice(0,value),"信源数","稳定性");
        		
        	}
        	if(weight==4){
        		init_double_column_chart(chartid,valuelist.slice(0,value),"事件(去重)","稳定性");
        		
        	}
        }
       
}
/*function process_dic_to_line_column_chart(data,chartid) {
	
	var chart;
	dtlen=data.length;
//        alert(data[0].key.slice(4,6));
	var valuelist=[];
	for (var i = 0; i < dtlen; i++) {
		var dataItem = data[i];
		valuelist.push({
			'key': dataItem.name_key,
			'x2': Math.floor(dataItem.scale_value),
			'x1': dataItem.value
		});
	}
	if(data.length>=12)
		chart=init_double_column_chart(valuelist.slice(0,12),"事件数","稳定性");
	else{chart=init_double_column_chart(valuelist,"事件数","稳定性");}
	
	var flag=0;
	$(window).scroll(function() {
		if (flag == 0) {
			
			if (scroll_make_chart(chartid, chart)) {
				flag = 1;
				$('#'+text_id).addClass('show');
			}
		}
	});
}
*/
function process_dic_to_double_line_chart(data,name,chartid,weight) {

       // var chart;
        dtlen=data.length;
        var valuelist=[];

        for (var i = 0; i < dtlen; i++) {
            var dataItem = data[i];
            if(dataItem.name_key==name) {
                valuelist.push({
                    'key': dataItem.date,
                    'x2': dataItem.scale_value.toFixed(4),
                    'x1': dataItem.value
                });
            }
        }
        if(weight==1)
		{
        	init_double_line_chart(chartid,valuelist,"事件数","稳定性");
		}
		
    	if(weight==2){
    		init_double_line_chart(chartid,valuelist,"文章数","稳定性");
    		
    	}
    	if(weight==3){
    		init_double_line_chart(chartid,valuelist,"信源数","稳定性");
    		
    		
    	}
    	if(weight==4){
    		init_double_line_chart(chartid,valuelist,"事件(去重)","稳定性");
    		
    		
    	}
    	
      
        //var flag=0;
        //AmCharts.makeChart(chartid, chart);


}

function process_dic_to_country_line_column_chart(data,chartid,value) {
        var chart;
        dtlen=data.length;
        var valuelist=[];
        for (var i = 0; i < dtlen; i++) {
            var dataItem = data[i];
            valuelist.push({
                'key': dataItem.name_key,
                'x2': dataItem.tone_value.toFixed(4),
                'x1': dataItem.value
            });
        }
        if(value==null||value==0){
        	if(data.length>=12){
        		init_line_column_chart(valuelist.slice(0,10),"出现次数","平均情感值",chartid);
        	}
        	else{
        		init_line_column_chart(valuelist,"出现次数","平均情感值",chartid);
        	}
        }else{
        	init_line_column_chart(valuelist.slice(0,value),"出现次数","平均情感值",chartid);
        }
}
function process_dic_to_country_line_column_chart2(data,chartid,value) {
    var chart;
    dtlen=data.length;
    var valuelist=[];
    for (var i = 0; i < dtlen; i++) {
        var dataItem = data[i];
        valuelist.push({
            'key': dataItem.name_key,
            'x1': dataItem.value
        });
    }
    if(value==null||value==0){
    	if(data.length>=12){
    		init_line_column_chart2(valuelist.slice(0,10),"出现次数",chartid);
    	}
    	else{
    		init_line_column_chart2(valuelist,"出现次数",chartid);
    	}
    }else{
    	init_line_column_chart2(valuelist.slice(0,value),"出现次数",chartid);
    }
}
function process_dic_to_country_line_column_chart3(data,chartid,value) {
    var chart;
    dtlen=data.length;
    var valuelist=[];
    for (var i = 0; i < dtlen; i++) {
        var dataItem = data[i];
        valuelist.push({
        	'name_key' :dataItem.name_key,
            'key': dataItem.key+"("+dataItem.name_key+")",
            'x2': dataItem.tone_value.toFixed(4),
            'x1': dataItem.value
        });
    }
    if(value==null||value==0){
    	if(data.length>=12){
    		init_line_column_chart3(valuelist.slice(0,10),"事件数","情感总值",chartid);
    	}
    	else{
    		init_line_column_chart3(valuelist,"事件数","情感总值",chartid);
    	}
    }else{
    	init_line_column_chart3(valuelist.slice(0,value),"事件数","情感总值",chartid);
    }
}
function init_line_column_chart3(data_dic,x1_name,x2_name,chartid){
	AmCharts.makeChart( chartid, {
	      "type": "serial",
	      "theme": "light",
	      "path":  getBasePath()+"/static/Visualization/js/amcharts/",
	      "legend": {
	      	  "valueAlign": "left",
	          "valueWidth": 150,
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
	        "valueAxis":"v1",
	        "balloonText": "[[key]]: <b>[[value]]</b>",
	        "fillAlphas": 0.8,
	        "lineAlpha": 0.2,
	        "gridColor": "#FFFFFF",
	        "type": "column",
	        "title":x1_name,
	        "valueField": "x1"
	      },
	                {
	        "valueAxis":"v2",
	        "balloonText": "[[key]]: <b>[[value]]</b>",
	        "lineAlpha": 1,
	        "bullet": "round",
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
	      "chartCursor": {
	        "categoryBalloonEnabled": false,
	        "cursorAlpha": 0,
	        "zoomable": false
	      },
	      "categoryField": "name_key",
	      "categoryAxis": {
	        "labelRotation": 45,
	        "gridPosition": "start",
	        "gridAlpha": 0.1,
	        "tickPosition": "start",
	        "tickLength": 20
	      },
	      "export": {
	            "enabled": true,
	            "position": "bottom-right",
	           "libs": {
	          "path":  getBasePath()+"/static/Visualization/js/amcharts/export/libs/"
	        }
	      }
	});
}
/*function process_dic_to_country_line_column_chart(data,chartid) {
	var chart;
	dtlen=data.length;
	var valuelist=[];
	for (var i = 0; i < dtlen; i++) {
		var dataItem = data[i];
		valuelist.push({
			'key': dataItem.name_key,
			'x2': dataItem.tone_value.toFixed(4),
			'x1': dataItem.value
		});
	}
	if(data.length>=12)
		chart=init_line_column_chart(valuelist.slice(0,12),"出现次数","平均情感值");
	else{chart=init_line_column_chart(valuelist,"出现次数","平均情感值");}
	
	var flag=0;
	$(window).scroll(function() {
		if (flag == 0) {
			
			if (scroll_make_chart(chartid, chart)) {
				flag = 1;
				$('#'+text_id).addClass('show');
			}
		}
	});
}
*/
function process_dic_to_country_double_line_chart(data,name,chartid) {

        //var chart;
        dtlen=data.length;
        var valuelist=[];
        for (var i = 0; i < dtlen; i++) {
            var dataItem = data[i];
            if(dataItem.name_key==name) {
                valuelist.push({
                    'key': dataItem.date,
                    'x2': dataItem.tone_value.toFixed(4),
                    'x1': dataItem.value
                });
            }
        }
       init_double_line_chart(chartid,valuelist,"事件数","情感值");
}
function process_dic_to_country_double_line_chart2(data,name,chartid) {

    //var chart;
    dtlen=data.length;
    var valuelist=[];
    for (var i = 0; i < dtlen; i++) {
        var dataItem = data[i];
        if(dataItem.name_key==name) {
            valuelist.push({
                'key': dataItem.date,
                'x1': dataItem.value
            });
        }
    }
   init_double_line_chart2(chartid,valuelist,"次数");
}
function process_dic_to_tri_line_chart(data,chartid) {

        var chart;
        dtlen=data.length;
        var valuelist=[];

        for (var i = 0; i < dtlen; i++) {
            var dataItem = data[i];

                valuelist.push({
                    'key': dataItem.key,
                    'x3': dataItem.p_value.toFixed(3),
                    'x2': dataItem.n_value.toFixed(3),
                    'x1': dataItem.value.toFixed(3)
                });

        }

       chart=init_tri_line_chart(valuelist,"平均情感值","负向情感值","正向情感值");

        var flag=0;
        AmCharts.makeChart(chartid, chart);


}

function line_chart(domId,fields,data)
{
    var chartData = data;
    var chart = AmCharts.makeChart(domId, {
            "type": "serial",
            "theme": "dark",
            "dataDateFormat": "YYYY-MM-DD",
            "dataProvider": chartData,
            /*"titles": [{
                "text": fields.yTitle,
                "size": 15
            }],*/
            "valueAxes": [{
                "axisAlpha": 0,
                "guides": [{
                    "fillAlpha": 0.1,
                    "fillColor": "#428bca",
                    "lineAlpha": 0,
                    "toValue": 120,
                    "value": 0
                }, {
                    "fillAlpha": 0.1,
                    "fillColor": "#428bca",
                    "lineAlpha": 0,
                    "toValue": 200,
                    "value": 120
                }]
            }],
            "graphs": [{
                "bullet": "round",
                "lineColor":"#67b7dc",
                "dashLength": 4,
                "valueField": fields.value||"value"
            }],
            "chartCursor": {
                "cursorAlpha": 0
            },
            "categoryField": fields.category||"key",
            "categoryAxis": {
                "parseDates": true
            }
    });
}
//修改后柱状图
function column_chart(domId,fields,data){
	AmCharts.makeChart(domId, {
		"type": "serial",
		"theme": "light",
		"dataProvider": data,
		"valueAxes": [ {
			"gridColor": "#FFFFFF",
			"gridAlpha": 0.2,
			"dashLength": 0
		} ],
		"gridAboveGraphs": true,
		"startDuration": 1,
		"graphs": [ {
			"balloonText": "[[key]]: <b>[[value]]</b>",
			"fillAlphas": 0.8,
			"lineAlpha": 0.2,
			"type": "column",
			"valueField":"value"
		} ],
		"chartCursor": {
			"categoryBalloonEnabled": false,
			"cursorAlpha": 0,
			"zoomable": false
		},
		"categoryField":"key",
		"categoryAxis": {
			"labelRotation": 45,
			"gridPosition": "start",
			"gridAlpha": 0,
			"tickPosition": "start",
			"tickLength": 20
		},
		  "export": {
		    "enabled": true,
		    "libs": {
				"path": getBasePath()+"/static/Visualization/js/amcharts/export/libs/"
			}
		  }
		});
}
//修改前柱状图
/*function column_chart(domId,text_id,fields,data,scroll)
{
	var chart ={
			"type": "serial",
			"theme": "light",
			"dataProvider": data,
			"valueAxes": [ {
				"gridColor": "#FFFFFF",
				"gridAlpha": 0.2,
				"dashLength": 0
			} ],
			"gridAboveGraphs": true,
			"startDuration": 1,
			"graphs": [ {
				"balloonText": "[[key]]: <b>[[value]]</b>",
				"fillAlphas": 0.8,
				"lineAlpha": 0.2,
				"type": "column",
				"valueField":"value"
			} ],
			"chartCursor": {
				"categoryBalloonEnabled": false,
				"cursorAlpha": 0,
				"zoomable": false
			},
			"categoryField":"key",
			"categoryAxis": {
				"labelRotation": 45,
				"gridPosition": "start",
				"gridAlpha": 0,
				"tickPosition": "start",
				"tickLength": 20
			},
			"export": {
				"enabled": true,
				"libs": {
					"path":  getBasePath()+"/static/Visualization/js/amcharts/export/libs/"
				}
			}
	};
	if(scroll==0){
		var flag=0;
		$(window).scroll(function() {
			if (flag == 0) {
				if (scroll_make_chart(domId, chart)) {
					flag = 1;
					$('#'+text_id).addClass('show');
				}
			}
		});
	}
	else
	{
		AmCharts.makeChart(domId,chart);
		$('#'+text_id).addClass('show');
	}
}
*///修改饼状图
function pie_chart(domId,data) {
	AmCharts.makeChart( domId, {
		  "type": "pie",
		  "theme": "light",
		  "dataProvider": data,
		  "titleField": "key",
		  "valueField": "value",
		  "labelRadius": 5,

		  "radius": "38%",
		  "innerRadius": "50%",
		  "labelText": "[[chName]]",
		  "export": {
		    "enabled": true,
		    "libs": {
                "path": getBasePath()+"/static/Visualization/js/amcharts/export/libs/"
            }
		  }
	
		} );
}
function pie_chart2(domId,data) {
	AmCharts.makeChart( domId, {
		  "type": "pie",
		  "theme": "light",
		  "dataProvider": data,
		  "titleField": "key",
		  "valueField": "value",
		  "labelRadius": 5,

		  "radius": "38%",
		  "innerRadius": "50%",
		  "labelText": "[[key]]",
		  "export": {
		    "enabled": true,
		    "libs": {
                "path": getBasePath()+"/static/Visualization/js/amcharts/export/libs/"
            }
		  }
	
		} );
}