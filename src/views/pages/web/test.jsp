<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>地图测试</title>
<script type="text/javascript" src="<%=basePath %>/static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/js/echarts/echarts.js"></script>
</head>
<body>
	<div id="container" style="height: 100%"></div>
	<!-- 
	<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
	 -->
    <script type="text/javascript" src="<%=basePath %>/static/js/echarts/map/china.js"></script>
    <script type="text/javascript" src="<%=basePath %>/static/js/echarts/map/world.js"></script>
    <!-- 
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
     -->
	<script type="text/javascript">
	var dom = document.getElementById("container");
	var myChart = echarts.init(dom);
	var app = {};
	option = null;
	var geoCoordMap = null;
	var mapData = null;
	
	$.ajax({
		url:'../echartsTest/getGeoMapData',
		type:"GET",
		dataType:"json",
		async:false,
		success:function(data){
			geoCoordMap = data;
		}
	});

	$.ajax({
		url:'../echartsTest/getData',
		type:"GET",
		dataType:"json",
		async:false,
		success:function(data){
			mapData = data;
		}
	});
	
	var convertData = function (data) {
	    var res = [];
	    for (var i = 0; i < data.length; i++) {
	        var geoCoord = geoCoordMap[data[i].name];
	        if (geoCoord) {
	            res.push({
	                name: data[i].name,
	                value: geoCoord.concat(data[i].value)
	            });
	        }
	    }
	    return res;
	};

	option = {
	    backgroundColor: '#404a59',
	    /*标头信息相关*/
	    title: {
	        text: '全国主要城市空气质量',
	        subtext: 'data from PM25.in',
	        sublink: 'http://www.pm25.in',
	        x:'center',
	        textStyle: {
	            color: '#fff'
	        }
	    },
	    /*鼠标划过冒泡*/
	    tooltip: {
	        trigger: 'item',
	        formatter: function (params) {
	            return params.name + ' : ' + params.value[2];
	        }
	    },
	    /*右下角显示*/
	    legend: {
	        orient: 'vertical',
	        y: 'bottom',
	        x:'right',
	        data:['pm2.5'],
	        /*=========设置pm2.5系列组件显示*/
	        /*
	        data:[{
	            name: 'pm2.5',
	            // 强制设置图形为圆。
	            icon: 'rectangle',
	            // 设置文本为红色
	            textStyle: {
	                color: 'blue'
	            }
	        }],
	        */
	        textStyle: {
	            color: '#fff'
	        }
	    },
	    /*左下角视觉映射组件*/
	    visualMap: {
	        min: 0,
	        max: 200,
	        calculable: true,
	        inRange: {
	            color: ['#50a3ba', '#eac736', '#d94e5d']
	        },
	        textStyle: {
	            color: '#fff'
	        }
	    },
	    /*地图显示  map属性指定地理位置，需先将相应地图加载进来*/
	    geo: {
	        map: 'china',
	        label: {
	        	/*突出显示,true将光标所在地域名称显示出来*/
	            emphasis: {
	                show: false
	            }
	        },
	        itemStyle: {
	        	/*光标未经过显示 设置*/
	            normal: {
	                areaColor: '#323c48',
	                borderColor: '#111'
	            },
	            /*光标经过显示 设置*/
	            emphasis: {
	                areaColor: '#2a333d'
	            }
	        }
	    },
	    /*连续系列设置，即地图各部分显示*/
	    series: [
	        {
	            name: 'pm2.5',
	            type: 'scatter',
	            coordinateSystem: 'geo',
	            data: convertData(mapData),
	            symbolSize: 12,
	            label: {
	                normal: {
	                    show: false
	                },
	                emphasis: {
	                    show: false
	                }
	            },
	            itemStyle: {
	                emphasis: {
	                    borderColor: '#fff',
	                    borderWidth: 1
	                }
	            }
	        }
	    ]
	};
	if (option && typeof option === "object") {
	    myChart.setOption(option, true);
	}
	</script>
</body>
</html>