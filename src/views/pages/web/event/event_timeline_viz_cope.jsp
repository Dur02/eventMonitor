<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>事件时间线</title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/style.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/combo.select.css">
<link rel="stylesheet" href="<%=basePath%>/static/lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/perfect-scrollbar.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/base.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/css/event_result.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/js/amcharts/export/export.css"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/leaflet.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/dvf.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/example.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/ui.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/actormap.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window_zs.css"/><!-- 弹出提示框样式 -->
<!-- 两种皮肤切换 -->
<c:if test="${bgFlag == null or bgFlag == 1}">
	<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css"/>
	<link rel="stylesheet" href="<%=basePath %>/static/css/sec2.css">
	<link rel="stylesheet" href="<%=basePath %>/static/css/hsCheckData.css"/>
	<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
	<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.min.css"/>
	<link rel="stylesheet" href="<%=basePath %>/static/css/sec2_2.css">
	<link rel="stylesheet" href="<%=basePath %>/static/css/hsCheckData2.css"/>
	<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
</c:if>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/jquery-1.11.1.min.js"></script>
<script src="<%=basePath%>/static/js/config/config.js"></script>
<script src="<%=basePath%>/static/lib/jquery.pagination.js"></script>
<style>
	svg.wordCloud {
    width: 1000px;
    height: 500px;
	}
	svg.wordCloud g {
    transform: translate(500px, 250px);
    -moz-transform: translate(500px, 250px);
    -webkit-transform: translate(350px, 250px);
	}
</style>
</head>
<body>
	<div class="index_top clearfix">
		<h3 class="fl title">事件库分析 > 事件时间线</h3>
	</div>
	<div class="index_bottom">
		<!-- 显示图 -->
		<div class="data show" >
			<input type="hidden" id="moduleCode" value="${moduleCode}">
			<div class="row">
				<div class="col-md-12">
		            <div class="col-md-12 bor" style="margin-top: 16px;">
		                <div class="col-md-12 map-text">
		                    <h3 class="tx-c"><span class="one" style="font-size: 13px;">事件</span>-月份
								<div  class="help" onmouseover="showChartInfo(1,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
							</h3>
		                </div>
		                <div class="col-md-12">
		                    <div id="column_chart" class="amcharts oneColumChart"></div>
		                </div>
		            </div>
		        </div>
	        </div>
	        <%-- <div class="row" >
		        <input type="hidden" id="moduleCode" value="${moduleCode}">
		        <div class="col-md-12"  style="margin-top:6px;">
		            <div class="col-md-10 " style="border: 1px solid #CCCCCC;width:100%; float:left;border-radius:3px;">
		                 <div class="col-md-12 map-text" style="">
		                    <h1 class="zz1" style="font-size:14px;"><span class="one" style="font-size: 13px;">事件</span>-月份 
		                    </h1>
		                 </div>
		                 <div class="col-md-12" style="width:100%;margin-top:20px;">
		                     <div id="column_chart" class="amcharts"></div>
		                 </div>
		            </div>
	          	</div>
	        </div> --%>
           	<div class="row">
	            <div class="col-md-12 mg_t mg_b" >
		            <div class="col-md-10  " style="border: 1px solid #CCCCCC; border-radius:3px;width:100%; float:right;">
		                <div class="col-md-12 map-text">
		                    <h3 class="tx-c" ><span class="one" style="font-size: 13px;">事件</span>时间线 
		                    	<div  class="help" onmouseover="showChartInfo(2,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
		                    </h3>
		                </div>
		                <div id="date_chart" class="amcharts oneColumChart" ></div>
		            </div>
	            </div>
            </div>
	   	</div>
	<!-- 页面底部收缩 -->
		<jsp:include page="event_tab1.jsp"></jsp:include>
	<!-- 页面底部收缩结束 -->
	</div>
	<jsp:include page="../updateUserPassword.jsp"/>
</body>
<script src="<%=basePath%>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath%>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath%>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath%>/static/js/perfect-scrollbar.js"></script>
<script src="<%=basePath%>/static/js/sec2.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/base.js"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/amcharts.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/themes/light.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amchart_util.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/ammap.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/ammap_util.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/export/export.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/leaflet-src.js"></script>
<script type="text/javascript"
src="<%=basePath%>/static/Visualization/js/leaflet/leaflet.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/tile.stamen.js"></script>
<script type="text/javascript"
src="<%=basePath%>/static/Visualization/js/leaflet/geohash.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/underscore-min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/moment.min.js" ></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/leaflet-dvf.js"></script>
<script type="text/javascript"
src="<%=basePath%>/static/Visualization/js/leaflet/leaflet.dvf.experimental.js"></script>
<script src="<%=basePath%>/static/Visualization/datamap/d3.min.js"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/serial.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/pie.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/xy.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
<c:if test="${bgFlag == null or bgFlag == 1}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
</c:if>
<!-- 人工查询js -->
<script src="<%=basePath %>/static/Visualization/rgQuery.js"></script>
<!-- 计算显示图的高度 -->	
<script src="<%=basePath%>/static/js/chartHeight.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/js/jquery.combo.select.js"></script>
<script src="<%=basePath%>/static/js/perfect-scrollbar.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/downLoad.js"></script>	
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<script type="text/javascript">
	$(function(){
		/* //美化图表展示界面的右侧滚动条
		index_bottom_perfectScrollbar(); */
		$(".bizhong").show();
		//处理配置
		handleConfigs();
		//控制Tone字段的显示问题
		//美化滚动条
		glorifyComboSelect();
		gkgToneIsShow();
		// 选择年月日
		$('.day1').datepicker({
			format: 'yyyy-mm-dd', 
			weekStart: 0,
			autoclose: true, 
			orientation:" top auto",
			startView: 0,
			maxViewMode: 2,
			minViewMode:0,
			forceParse: false, 
			language: 'zh-CN',
			startDate: '${minDate[2]}',
			endDate : '${maxDate[2]}',
		}).on('changeDate',function(e){  
			    if($(this).val() > $('.day2').val()){
			    	$('.day2').val($(this).val());
			    }
			    var startTime = e.date; 
			    $('.day2').datepicker('setStartDate',startTime);  
			});
		$('.day2').datepicker({
			format: 'yyyy-mm-dd', 
			weekStart: 0,
			autoclose: true, 
			orientation:" top auto",
			startView: 0,
			maxViewMode: 2,
			minViewMode:0,
			forceParse: false, 
			language: 'zh-CN',
			startDate: '${minDate[2]}',
			endDate : '${maxDate[2]}'
		}).on('changeDate',function(e){  
				if($(this).val() < $('.day1').val()){
					$('.day1').val($(this).val());
				}
			    var endTime = e.date;  
			    $('.day1').datepicker('setEndDate',endTime);  
		}); 
	});
	
		function render(configId){
			startLoad();
			var resultcode = 'ALL';
			$.ajax({
				url:'<%=basePath%>/search/event_timeline_viz/'+configId,
				type: 'POST',
				dataType:"json",
				success:function(data){
					if(data=="-1"){
						endLoad();
						alert("加载失败");
					}
					renderData(data);
					endLoad();
				}
			});
		}
		function renderData(data){
			var monther_data = data.monther_data;
			var date_data = data.date_data;
			var days = data.days;
			var staticBasic =  data.weightFlag;
			if(monther_data.length>0){
				if(staticBasic==1){
					init_column_chart_new(monther_data,'column_chart');
				}else{
					init_column_chart(monther_data,'column_chart');
				}
			}else{
				$("#column_chart").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
			}
			var num =  Math.floor(days/1825);///以四年为基础
			if(num > 1){
				var ll = 200*num+400;
				document.getElementById("date_chart").style.height = ll+"px";
			}
			if(date_data.length>0){
				if(staticBasic==1){
					process_dic_to_datechart_new(date_data,'date_chart');
				}else{
					process_dic_to_datechart(date_data,'date_chart');
				}
			}else{
				$("#date_chart").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
			}
		} 
		function init_column_chart_new(data_dic,chartid) {
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
		            "balloonText": "[[name_key]]: <b>[[value]]%</b>",
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
		function process_dic_to_datechart_new(data,chartid) {
	        var valuelist=[];
	        var dtlen=data.length;
	        for (var i = 0; i < dtlen; i++) {
	            var dataItem = data[i];
	            if(dataItem.key != "" && dataItem.key != null){
	            	valuelist.push({
	                    'x': dataItem.key.slice(4,6)+"-"+dataItem.key.slice(6,8),
	                    'y': dataItem.key.slice(0,4),
	                    'value': dataItem.value,
	                    'value2':0,
	                    'value3':dataItem.value3
	                });
	            }
	        }
	        init_date_chart_new(chartid,valuelist);
		}
		function init_date_chart_new(chartid,data_dic){
			var minHorizontalGap = getMinHorizontalGap(data_dic);
			
			var date_chart = AmCharts.makeChart( chartid, {
		        "type": "xy",
		        "theme": "light",
		        "marginRight": 80,//图表距右侧的距离
		        "path":  getBasePath()+"/static/Visualization/js/amcharts/",
		        "startDuration": 1.5,//控制开始加载完毕的时间
		        "trendLines": [],
		        "balloon": {
		            "adjustBorderColor": false,
		            "shadowAlpha": 0,//控制滑动显示时的边框线
		            "textAlign":"left"
		        },
		        "graphs": [{
		            "balloonText": "<div style='margin:5px;'><b>时&nbsp;&nbsp;&nbsp;间: [[y]]年[[x]]日</b><br><b>事件数: [[value3]]</b><br><b>比&nbsp;&nbsp;&nbsp;重: [[value]]%</b></div>",
		            "bullet": "round",
		            "id": "AmGraph-1",
		            "bulletBorderAlpha": 0.2,
		            "bulletAlpha": 0.8,
		            "lineAlpha": 0,//圆球之间的线
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
    </script>
</html>