<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>XX安全检测系统_main</title>
<link rel="stylesheet" href="<%=basePath %>/static/css/style.css">
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/css/sec2.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath %>/static/lib/pagination.css" />
<script type="text/javascript" src="<%=basePath %>/static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/js/echarts/echarts.js"></script>
<script src="<%=basePath %>/static/lib/jquery.pagination.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath %>/static/js/sec2.js"></script>
<script src="<%=basePath %>/static/js/yuzhi.js"></script>
<!-- 条件tab页 ed -->
<script type="text/javascript" src="<%=basePath %>/static/js/echarts/map/china.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/js/dep/echart-wordcloud.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/js/echarts/map/world.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>国家角色展示</title>
</head>
<body>
	<div class="index_top clearfix">
		<h3 class="fl title">事件分析 > 事件热点分析</h3>
		<div class="title_r fr">
			<span class="export_img_2" title="图表切换"></span>
			<span class="info_img"></span>
			<ul class="info_box">
				<li><span>数据：</span>事件数据库</li>
				<li><span>描述：</span>反映一段时间内，某地发生的事件的对比情况</li>
				<li><span>输入：</span>对比信息，事件编码，阈值信息</li>
				<li><span>介绍：</span>ttajkasdasdfa asdfasdf asdfa啊发生的发生地阿打法的疯狂拉升地方案的发生发生的法律看见俺十分啊发生的发生地发沙发</li>
			</ul>
		</div>
	</div>
        <div id="chart" style="height: 40%;"></div>
       <div id="chart2" style="height: 60%;"></div>
    
    <script type="text/javascript">
    function show2(){
		var dom = document.getElementById("chart");
		var myChart = echarts.init(dom);
		option = {
				tooltip: {
					trigger: 'item',
					formatter: "{a} <br/>{b}: {c} ({d}%)"
				},
				legend: {
					orient: 'vertical',
					x: 'left',
					data:['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
				},
				series:[
					{
						name:'访问来源',
						type:'pie',
						radius: ['50%','70%'],
						avoidLabelOverlap: false,
						label: {
							normal: {
								show: false,
								position: 'center'
							},
							emphasis: {
								show: true,
								textStyle: {
									fontSize: '30',
									fontWeight: 'bold'
								}
							}
						},
						labelLine: {
							normal: {
								show: false
							}
						},
						data:[
							{value:335, name:'直接访问'},
							{value:310, name:'邮件营销'},
							{value:234, name:'联盟广告'},
							{value:135, name:'视频广告'},
							{value:1548, name:'搜索引擎'}
						]
					}        
				]
		};
		if (option && typeof option === "object") {
	    	myChart.setOption(option, true);
		}
	}
    show2();
    
    //标签云图显示有问题
    function show3(){
		var dom = document.getElementById("chart2");
		var myChart = echarts.init(dom);
		option = {
			    title:{
			        text:"词云图",
			        link:'https://github.com/ecomfe/echarts-wordcloud',
			        subtext: 'data-visual.cn',
			        sublink:'http://data-visual.cn',
			    },
			    tooltip: {},
			    series: [{
			        type: 'wordCloud',
			        gridSize: 20,
			        sizeRange: [12, 50],
			        rotationRange: [0, 0],
			        shape: 'circle',
			        textStyle: {
			            normal: {
			                color: function() {
			                    return 'rgb(' + [
			                        Math.round(Math.random() * 160),
			                        Math.round(Math.random() * 160),
			                        Math.round(Math.random() * 160)
			                    ].join(',') + ')';
			                }
			            },
			            emphasis: {
			                shadowBlur: 10,
			                shadowColor: '#333'
			            }
			        },
			        data: [{
			            name: 'Sam S Club',
			            value: 10000,
			            textStyle: {
			                normal: {
			                    color: 'black'
			                },
			                emphasis: {
			                    color: 'red'
			                }
			            }
			        }, {
			            name: 'Macys',
			            value: 6181
			        }, {
			            name: 'Amy Schumer',
			            value: 4386
			        }, {
			            name: 'Jurassic World',
			            value: 4055
			        }, {
			            name: 'Charter Communications',
			            value: 2467
			        }, {
			            name: 'Chick Fil A',
			            value: 2244
			        }, {
			            name: 'Planet Fitness',
			            value: 1898
			        }, {
			            name: 'Pitch Perfect',
			            value: 1484
			        }, {
			            name: 'Express',
			            value: 1112
			        }, {
			            name: 'Home',
			            value: 965
			        }, {
			            name: 'Johnny Depp',
			            value: 847
			        }, {
			            name: 'Lena Dunham',
			            value: 582
			        }, {
			            name: 'Lewis Hamilton',
			            value: 555
			        }, {
			            name: 'KXAN',
			            value: 550
			        }, {
			            name: 'Mary Ellen Mark',
			            value: 462
			        }, {
			            name: 'Farrah Abraham',
			            value: 366
			        }, {
			            name: 'Rita Ora',
			            value: 360
			        }, {
			            name: 'Serena Williams',
			            value: 282
			        }, {
			            name: 'NCAA baseball tournament',
			            value: 273
			        }, {
			            name: 'Point Break',
			            value: 265
			        }]
			    }]
			};
		if (option && typeof option === "object") {
	    	myChart.setOption(option, true);
		}
	}
    show3();
    
    </script>
    
    
</body>
</html>