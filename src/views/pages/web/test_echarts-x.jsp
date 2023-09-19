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
</head>
<body>
	<div id="container" style="height: 100%"></div>
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
            
            chart.setOption({
                title: {
                    text: 'A Simple Example'
                },
                series: [{}]
                }]
            })
        })
	</script>
</body>
</html>