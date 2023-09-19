<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网站新闻量统计</title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/style.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/sec2.css">
<!--人工查询 -->
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath %>/static//lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath %>/static/css/combo.select.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/perfect-scrollbar.css"/>
<link rel="shortcut icon" type="image/x-icon" href="<%=basePath %>/static/Visualization/base/ico.png"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/base/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/base/base.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/base/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/css/event_result.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/js/amcharts/export/export.css"/>
<link rel="stylesheet" href="<%=basePath %>/static/Visualization/css/leaflet/leaflet.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath %>/static/Visualization/css/leaflet/dvf.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath %>/static/Visualization/css/leaflet/example.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath %>/static/Visualization/css/leaflet/ui.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath %>/static/Visualization/css/heatmap.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath %>/static/Visualization/css/conflict_viz.css" type="text/css" />
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.min.css"/>
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window_zs.css"/><!-- 弹出提示框样式 -->
<script src="<%=basePath%>/static/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>/static/lib/jquery.pagination.js"></script>
<script src="<%=basePath%>/static/js/config/config.js"></script>
<!-- 两种皮肤切换 -->
<c:if test="${bgFlag == null or bgFlag == 1}">
	<link rel="stylesheet" href="<%=basePath %>/static/css/sec2.css">
	<link rel="stylesheet" href="<%=basePath %>/static/css/hsCheckData.css"/>
	<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
	<link rel="stylesheet" href="<%=basePath %>/static/css/sec2_2.css">
	<link rel="stylesheet" href="<%=basePath %>/static/css/hsCheckData2.css"/>
	<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
</c:if>
<style>
	.circle{
		width:25%;
		height:85%;
		border:1px solid #ccc;
		border-radius:50%;
		background-color:#ccc;
		float: left;
    	margin-left: 76px
	}
	.dbName{
		margin-left: 29%;
	    margin-top: 14%;
	    font-size: 38px;
	}
	.dbCounts{
	    text-align: center;
	    margin-top: 11%;
	    font-size: 30px;
	}
	.mg_b{
		margin-bottom: 20px;
	}
	.dateInput{
	    width: 120px;
	    padding: 0px 20px;
	    margin: -2px 4px;
	    height: 20px;
	    line-height: 20px;
	    border: 1px solid #ccc;
	    border-radius: 1px;
	    color: #1d2334;
	}
	.condtion_div{
	    margin-top: 10px;
    	margin-left: 90px;
	}
	.intpu_radio{
	    margin-left: 4px!important;
    	margin-top: 2px!important;
	}
	.selectDB{
	    margin-top: -3px;
	    width: 46px;
	    height: 23px;
	    line-height: 24px;
	    background: #287fcb;
	    text-align: center;
	    color: #fff;
	    cursor: pointer;
	    border-radius: 2px;
	}
	.selectTop-N{
		 margin-left: 5px;
   		 margin-top: -1px;
	}
	</style>
<body>
	<div class="index_top clearfix">
		<h3 class="fl title"> 数据统计 > 入库量统计 </h3>
	</div>
	<div class="index_bottom">
		<!--热点事件图表dom  -->
		<div class="data show">
			<div class="row">
				<div class="col-md-12 mg_t">
					<div class="bor" style="height: 40px;">
						<form id="cxForm" method="post">
		                   	<div class="fl condtion_div">
		                    	<span class="fl">开始时间:</span>
		                    	<input class="dateInput inp_selc day1"  name="stDate" value="${stDate}" type="text" readonly/>
		                   	</div>
							<div class="fl condtion_div">
								<span class="fl">结束时间:</span>
								<input class="dateInput inp_selc day2"  name="edDate" value="${maxDate[2]}" type="text" readonly/>
							</div>
							<div class="fl condtion_div">
								<span class="fl">网站名称:</span>
								<input class="dateInput inp_selc" style="padding: 0px 5px;" type="text" name="newsName"/>
							</div>
							<div class="fl condtion_div">
								<span class="fl"> TOP-N:</span>
								<select  class="selectCounts selectTop-N" name="topNumber">
									<option>10</option>
									<option>20</option>
									<option>30</option>
									<option>40</option>
									<option>50</option>
									<option>60</option>
									<option>70</option>
									<option>80</option>
									<option>90</option>
									<option>100</option>
								</select>
							</div>
							<div class="fl condtion_div">
								<input class="fl selectDB" id="selectMongoDbButton" type="button" onclick="selectMongoDbByCondtion()" value="查询" />
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="row">
	        	<div class="col-md-12 mg_t">
		            <div class="col-md-10" style="width:100%;border: 1px solid #CCCCCC;margin: 0px -8px 0 0;border-radius:3px;">
		                <div class="col-md-5" id="column_chart_text" style="text-align: center;width: 100%;">
		                    <h3 class="tx-c">网站新闻量</h3>
		                </div>
		                <div class="col-md-7" style="width:100%;">
		                	<div id="column_chart" class="amcharts oneColumChart"></div>
		                </div>
		            </div>
	        	</div>
        	</div>
	        <div class="row"> 
		        <div class="col-md-12">
					<div class="col-md-12 mg_t mg_b bor">
	                    <div class="map-text">
	                        <h3>网站新闻量时间线</h3>
	                    </div>
	                    <div style="margin-left: 3%;margin-right: 8%">
               				 <select class="selectCounts form-control" style="margin-left:10px;" id="netsSelect" ></select>
               			</div>
	                    <div id="newsTimelineChart" class="oneColumChart"></div>
		             </div>
		        </div>	
	       </div>
        </div>
	</div>
	<jsp:include page="updateUserPassword.jsp"/>
</body>
<!-- 人工查询功能的日期 -->
<script src="<%=basePath %>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-select.min.js"></script>
<script src="<%=basePath %>/static/js/jquery.combo.select.js"></script>
<script src="<%=basePath %>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath %>/static/js/perfect-scrollbar.js"></script>
<script src="<%=basePath %>/static/js/sec2.js"></script>

<script type="text/javascript" src="<%=basePath %>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/Visualization/base/base.js"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/amcharts.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/themes/light.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amchart_util.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/ammap.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/ammap_util.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/export/export.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/echarts.js"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/serial.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/pie.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/radar.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/worldLow.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/leaflet/leaflet.js" type="text/javascript" ></script>
<script src="<%=basePath %>/static/Visualization/js/leaflet/heatmap.js"></script>
<script src="<%=basePath %>/static/Visualization/js/leaflet/leaflet-heatmap.js"></script>
<script src="<%=basePath %>/static/Visualization/js/leaflet/tile.stamen.js"></script>
<script src="<%=basePath %>/static/Visualization/datamap/d3.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
<c:if test="${bgFlag == null or bgFlag == 1}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
</c:if>
 <!-- 人工查询js -->
<script src="<%=basePath %>/static/Visualization/rgQuery.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/downLoad.js"></script>
<script src="<%=basePath%>/static/js/map-tileLayer.js"	type="text/javascript"></script>
<!-- 计算显示图的高度 -->	
<script src="<%=basePath%>/static/js/chartHeight.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<script type="text/javascript">
	$(function(){
		//美化滚动条
		glorifyComboSelect();
		// 选择年月日
		$('.day1').datepicker({
			format: 'yyyy-mm-dd', 
			weekStart: 0,
			autoclose: true, 
			orientation:"auto",
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
			orientation:"auto",
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
		
		$("#selectMongoDbButton").click();
		
		//网站新闻量
		//网站新闻量时间线
	});
	
	//查询
	function selectMongoDbByCondtion(){
		var data = $("#cxForm").serialize();
		//ajax
		startLoad();
		$.ajax({
			url:'../dataStatistics/selectNetNewsDataByCondtion',
			type: 'POST',
			dataType:"json",
			data:data,
			success:function(data){
				//清空下拉框
				$("#netsSelect").html("");
				$("#netsSelect").show();
				if(data.msg == "error"){
					win.alertEx("数据加载失败");
					$("#netsSelect").hide();
					$("#column_chart").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
		        	$("#newsTimelineChart").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
				}else{
					var netNews =eval('(' + data.netNews + ')');
					var netNewsTimeLine = eval('(' + data.netNewsTimeLine + ')');
					var dtlen1 = netNews.length;
					process_dic_to_amchart(netNews,'column_chart','column_chart',dtlen1);
					if(dtlen1>0){
						for (var i = 0; i < dtlen1; i++){
				            var name = netNews[i].name_key.toString();
				            var number = netNews[i].value.toString();
				            $("#netsSelect").append("<option value='"+name+"'>网站："+name+"   新闻量："+number + "</option>");
				        }
						//默认第一个加载时间线插件
						inintTimelineChart(netNewsTimeLine[$("#netsSelect option:selected").val().toString()]);
					}else{//无数据时
						$("#netsSelect").hide();
			        	$("#column_chart").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
			        	$("#newsTimelineChart").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
					}
					//网站下拉框改变值
					$("#netsSelect").change(function () {
			        	var selectOptionValue = $("#netsSelect option:selected").val();
			        	var netNewsTimeLineData = netNewsTimeLine[selectOptionValue.toString()];
			        	inintTimelineChart(netNewsTimeLineData);
			     	});
				}
				endLoad();
			}
		});
	}
	
	//加载时间线图表
	function inintTimelineChart(timeLineChartData){/* 
	    	var chart = AmCharts.makeChart("newsTimelineChart", {
			"path": "../static/Visualization/js/amcharts/",
		    "type": "serial",
		    "theme": "light",
		    "marginRight": 40,
		    "marginLeft": 40,
		    "autoMarginOffset": 20,
		    "mouseWheelZoomEnabled":true,
		    "dataDateFormat": "YYYYMMDD",
		    "valueAxes": [{
		        "id": "v1",
		        "axisAlpha": 0,
		        "position": "left",
		        "ignoreAxisWidth":true
		    }],
		    "balloon": {
		        "borderThickness": 1,
		        "shadowAlpha": 0
		    },
		    "graphs": [{
		        "id": "g1",
		        "balloon":{
		          "drop":true,
		          "adjustBorderColor":false,
		          "color":"#ffffff"
		        },
		        "bullet": "round",
		        "bulletBorderAlpha": 1,
		        "bulletColor": "#FFFFFF",
		        "bulletSize": 5,
		        "hideBulletsCount": 50,
		        "lineThickness": 2,
		        "title": "red line",
		        "useLineColorForBulletBorder": true,
		        "valueField": "value",
		        "balloonText": "<span style='font-size:18px;'>[[value]]</span>"
		    }],
		    "chartScrollbar": {
		        "graph": "g1",
		        "oppositeAxis":false,
		        "offset":30,
		        "scrollbarHeight": 80,
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
		        "cursorAlpha":1,
		        "cursorColor":"#258cbb",
		        "limitToGraph":"g1",
		        "valueLineAlpha":0.2,
		        "valueZoomable":true
		    },
		    "valueScrollbar":{
		      "oppositeAxis":false,
		      "offset":50,
		      "scrollbarHeight":10
		    },
		    "categoryField": "date",
		    "categoryAxis": {
		        "parseDates": true,
		        "dashLength": 1,
		        "minorGridEnabled": true
		    },
		    "export": {
		        "enabled": true
		    },
		    "dataProvider": timeLineChartData
		}); */
		
		var chart = AmCharts.makeChart("newsTimelineChart", {
			"path": "../static/Visualization/js/amcharts/",
		    "type": "serial",
		    "theme": "light",
		    "marginRight": 80,
		    "marginTop": 17,
		    "autoMarginOffset": 20,
		    "dataProvider": timeLineChartData,
		    "graphs": [{
		        "bullet": "round",
		        "id": "g1",
		        "bulletBorderAlpha": 1,
		        "bulletColor": "#FFFFFF",
		        "bulletSize": 7,
		        "lineThickness": 2,
		        "title": "value",
		        "type": "smoothedLine",
		        "useLineColorForBulletBorder": true,
		        "valueField": "value"
		    }],
		    "chartScrollbar": {},
		    "chartCursor": {
		        "valueLineEnabled": true,
		        "valueLineBalloonEnabled": true,
		        "valueLineAlpha": 0.5,
		        "fullWidth": true,
		        "cursorAlpha": 0.05
		    },
		    "dataDateFormat": "YYYY-MM-DD",
		    "categoryField": "date",
		    "categoryAxis": {
		        "parseDates": true
		    },
		    "export": {
		        "enabled": true
		    }
		});
	}
	
</script>
</html>