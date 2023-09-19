<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>地图测试</title>
 <script type="text/javascript" src="<%=basePath %>/static/js/dep/esl.js"></script>
 <script type="text/javascript" src="<%=basePath %>/static/js/dep/text.js"></script>
 <script src="<%=basePath %>/static/js/jquery-1.9.1.min.js"></script>
</head>
<body>
	<div id="container" style="height: 100%; background: #eee;"></div>
	<script type="text/javascript">
		require.config({
			packages: [{
                name: 'echarts-x',
                location: '<%=basePath %>/static/js/dep/echarts-x/src',
                main: 'echarts-x'
            }, {
                name: 'echarts',
                location: '<%=basePath %>/static/js/dep/echarts/src',
                main: 'echarts'
            }, {
                name: 'zrender',
                location: '<%=basePath %>/static/js/dep/zrender/src',
                main: 'zrender'
            }, {
                name: 'qtek',
                location: '<%=basePath %>/static/js/dep/qtek/src',
                main: 'qtek.amd'
            }]
		});
		
		
		require([
            'echarts',
            'echarts-x',
            // ECharts-X 中 map3d 的地图绘制基于 ECharts 中的 map。
            'echarts/chart/map',
            'echarts-x/chart/map3d'
        ], function (ec) {
            // 跟 ECharts 一样的方式初始化
            var chart = ec.init(document.getElementById('container'));
            var dt = {eventCode: 80};
            $.ajax({
            	url: '../echartsTest/get3DData',
            	data:dt,
            	success:function(data){
            		var max = -Infinity;
            		var min = Infinity;
            		data = data.map(function(dataItem){
            			max = Math.max(dataItem[2], max);
            			min = Math.min(dataItem[2],min);
            			return {
            				geoCoord: dataItem.slice(0, 2),
            				value: dataItem[2],
            				distance: Math.random()
            			}
            		});
            		data.forEach(function(dataItem){
            			dataItem.symbolSize=(dataItem.value - min)/ (max - min) * 18 + 2;
            		});
            		var option = {
                        	title:{
                        		x:'center',
                        		padding:[0, 0, 10, 0],
                        		show:true,
                        		text:'测试三维地图',
                        		textStyle:{
                        			color: 'white'
                        		}
                        	},
                        	/*
                        	tooltip:{
                        		formatter:'{b}'
                        	},
                        	*/
                        	dataRange: {
                        		min: 0,
                        		max: max,
                        		text: ['High', 'Low'],
                        		realtime: false,
                        		calculable: true,
                        		color: ['red', 'yellow', 'lightskyblue']
                        	},
                        	//背景色，整个container的背景色
                        	backgroundColor:'#ccc',
                        	series:[{
                        		name:'全球',
                        		type:'map3d',
                        		mapType:'world',
                        		nameMap:{
                        			'China':'中国'
                        		},
                        		baseLayer:{
                        			backgroundColor:'#005f99',
                        			backgroundImage:'<%=basePath %>/static/js/dep/echarts-x/doc/example/asset/earth.jpg',
                        		//	quality:'high'
                        		},
                        		
                        		hoverable: false,
                        		
                        		surfaceLayers:[{
                        			type:'texture',
                        			distance:3,
                        			image:'<%=basePath %>/static/js/dep/echarts-x/doc/example/asset/clouds.png'
                        		}],
                        		
                        		selectedMode:'single',
                        		
                        		itemStyle:{
                        			normal:{
                        				label:{
                        					show:true
                        				},
                        				borderWidth:1,
                        				borderColor:'#777',
                        				areaStyle:{
                        					color:'#000011'
                        				}
                        			}
                        		},
                        		markPoint:	{
                        			large: true,
                        			effect: {
                        				show: true,
                        				shadowBlur: 0.4
                        			},
                        			data: data
                        		}
                        	}]
                        };
                        
                        chart.setOption(option);
            	}
            });
        })
	</script>
</body>
</html>