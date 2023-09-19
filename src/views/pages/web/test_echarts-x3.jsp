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
		
		$.ajax({
			url:'../echartsTest/test',
			success: function(data){
				alert(data);
			}
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
            
            var option = {
            	title:{
            		x:'center',
            		padding:[0, 0, 10, 0],
            		show:true,
            		text:'测试三维地图'
            	},
            	tooltip:{
            		formatter:'{b}'
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
            			backgroundColor:'',
            			backgroundImage:'<%=basePath %>/static/js/dep/echarts-x/doc/example/asset/earth.jpg',
            			quality:'high'
            		},
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
            				borderColor:'yellow',
            				areaStyle:{
            					color:'rgba(0, 0, 0, 0)'
            				}
            			}
            		},
            		data:[{
            			name:'China',
            			value:155,
            			selected:true
            		}],
            		geoCoord:{
            			'China':[109.1162,34.2004]
            		}
            	}]
            };
            
            chart.setOption(option);
        })
	</script>
</body>
</html>