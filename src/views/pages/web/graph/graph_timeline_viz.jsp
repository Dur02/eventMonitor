<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图谱时间线</title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/style.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.standalone.css">
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
	<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
	<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.min.css"/>
	<link rel="stylesheet" href="<%=basePath %>/static/css/sec2_2.css">
	<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
	<script type="text/javascript" src="<%=basePath%>/static/js/echarts.js"></script>
</c:if>
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
	.index_bottomw{
		background-image: url(<%=basePath%>/static/css/img/bg_new.png);
		background-repeat: no-repeat;
		background-size: 100% 100%;
		position: relative;
		overflow: hidden;
		height: calc(100% - 31px);
    	width: 100%;
	}
	.bov {
    	border-radius: 3px;
    }
    .column_line{
    	height: 358px;
	    overflow: hidden;
	    width: 100%;
	    text-align: left;
	    margin-top: -38px;
	    /* border: 1px solid #1b2334; */
    }
    .column{
    	height:314px;
	    overflow: hidden;
	    width: 100%;
	    text-align: left;
	    margin-top: -38px;
	    border: 1px solid #1b2334;
    }
    .country_sort {
	    width: 11%;
	    height: 38px;
	    background: url(../../static/images/zhengjian.png) no-repeat center
	     center;
	    background-size: 100% 100%;
	    margin: 0 auto;
	    text-align: center;
	    /* margin-top:10px; */
	    line-height: 38px;
	}
   .country_sort span:nth-child(1) {
	    /* min-width: 118px; */
	    height: 14px;
	    font-size: 14px;
	    font-family: SimSun;
	    font-weight: bold;
	    color: rgba(255, 255, 255, 1);
	    line-height: 38px;
	    margin: 0 42px 0 33px;
	}
    .float_right {
        width: 190px;
	    display: flex;
	    height: 38px;
	    align-items: center;
	    float: right;
	    margin: -2.2% 3% 0 0;
	    cursor: pointer;
	    font-family: SimSun;
	    font-weight: 400;
	    color: rgb(234, 235, 237);
	}
	.circle {
	    width: 15px;
	    height: 15px;
	    border: 1px solid rgba(0,193,222,1);
	    border-radius: 50%;
	    display: inline-block;
	    margin: 0 2px 0 2px;
		}
	.circleon {
	    background: rgba(0,193,222,1);
	}
	.col_wai{
	    height:409px;
	    overflow: hidden;
	    width: 100%;
	    text-align: left;
	    margin-top:20px; 
	    margin-bottom:10px;
	    background-color:#1b233482;
	    border: 1px solid #1b2334;
	}
	.col_nei{
	    height:362px;
	    overflow: hidden;
	    width: 100%;
	    text-align: left;
	    background-color:#1b233482;
	    border: 1px solid #1b2334;
	}
	/*
		热力图扩大后显示区域
	*/
	.maxBox{
	    top: 8%;
	    position: absolute;
	    border: 1px solid #1c80b9;
	    width: 96%;
	    height: 85%;
	    left: 2%;
	    right: 8%;
	    z-index: 99;
        border-radius: 11px;
    	background-color: #0e1529;
    	display: none;
	}
	/* 遮罩 */
	.zeZhao {
		width: 100%;
		height: 100%;
		background: black;
		opacity: 0.8;
		display: none;
		position: absolute;
		top: 0;
		left: 0;
		z-index: 10;
	}
	#hotCharts_max{
    	width: 100%;
    	height: 93%;
	}
	/*去扩大*/
	.toMax{
        position: absolute;
	    cursor: pointer;
	    width: 22px;
	    height: 22px;
	    background: url(/monitorsystem/static/images/toMax.png) no-repeat;
	    top: 8px;
	    right: 26px;		
	}
	/*去缩小*/
	.toMin{
        position: absolute;
	    margin-right: 19px;
	    margin-top: 10px;
	    cursor: pointer;
	    width: 22px;
	    height: 22px;
	    background: url(/monitorsystem/static/images/toMin.png) no-repeat;
	    top: -2px;
	    right: -1px;	
	}
</style>
</head>
<body>
	<div class="index_top clearfix">
		<h3 class="fl title">图谱库分析 > 图谱时间线</h3>
	</div>
	<div class="index_bottomw">
		<!-- 遮罩 -->
		<div class="zeZhao"></div>
		<!-- 显示图 -->
		<div class="data show" >
			<input type="hidden" id="moduleCode" value="${moduleCode}">
			<div class="maxBox">
                   <h3 class="country_sort"><span>图谱时间线分析</span> 
               		</h3>
               		<div class="float_right">
						<span>时间粒度：</span>
						<span class="circle circle_hot_max" value="2"></span><span>月</span><span class="circle circle_hot_max" value="4" id="week"></span><span>周</span><span class="circle circle_hot_max circleon" value="1" id="hot_day_max"></span><span>日</span>
				    </div>
				    <div class="toMin"></div>
                	<div id="hotCharts_max" ></div>
			</div>
			<div class="row">
				<div class="col-md-12">
		            <div class="col-md-12 bov" style="margin-top: 35px;">
		                <div class="col_wai">
		                    <h3 class="country_sort"><span>图谱时间线展示</span> 
	                			<%-- <div  class="help" onmouseenter="showChartInfo(2,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div> --%>
	                		</h3>
	                		<div class="float_right">
								<span>时间粒度：</span>
								<span class="circle circle_timeLine" value="3"></span><span>年</span><span class="circle circle_timeLine" value="2"></span><span>月</span><span class="circle circle_timeLine" value="4" id="week"></span><span>周</span><span class="circle circle_timeLine circleon" value="1" id="day"></span><span>日</span>
						    </div>
						    <div id="column_chart" class="column_line"></div>
		                </div>
		            </div>
		        </div>
	        </div>
           	<div class="row">
	            <div class="col-md-12">
		            <div class="col-md-12 bov" >
		                <div class="col_nei">
		                   <h3 class="country_sort"><span>图谱时间线分析</span> 
	                			<%-- <div  class="help" onmouseenter="showChartInfo(2,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div> --%>
	                		</h3>
	                		<div class="float_right">
								<span>时间粒度：</span>
								<span class="circle circle_hot" value="2"></span><span>月</span><span class="circle circle_hot" value="4" id="week"></span><span>周</span><span class="circle circle_hot circleon" value="1" id="hot_day"></span><span>日</span>
						    </div>
					     <div class="toMax"></div>
		                <div id="hotCharts" class="column"></div>
		                </div>
		            </div>
	            </div>
            </div>
	   	</div>
	<!-- 页面底部收缩 -->
		<jsp:include page="graph_tab2.jsp"></jsp:include>
	<!-- 页面底部收缩结束 -->
	</div>
	<jsp:include page="../updateUserPassword.jsp"/>
</body>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/jquery-1.11.1.min.js"></script>
<script src="<%=basePath%>/static/lib/jquery.pagination.js"></script>
<script src="<%=basePath%>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath%>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath%>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath%>/static/js/perfect-scrollbar.js"></script>
<script src="<%=basePath%>/static/js/sec2.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/base.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/timeline/echarts.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/timeline/echarts-gl.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/timeline/bmap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/timeline/dataTool.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/timeline/world.js"></script>
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
<script src="<%=basePath%>/static/js/config/config.js"></script>
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
<script type="text/javascript" src="<%=basePath%>/static/Visualization/downLoad.js"></script>	
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<!-- 多选框样式以及js -->
<link rel="stylesheet" href="<%=basePath %>/static/css/hsCheckData.css"/>
<script type="text/javascript" src="<%=basePath%>/static/js/hsCheckData.js"></script>
<script type="text/javascript">
	$(function(){
		/* //美化图表展示界面的右侧滚动条
		index_bottom_perfectScrollbar(); */
		$(".bizhong").show();
		//处理配置
		handleConfigs();
		//控制Tone字段的显示问题
		gkgToneIsShow();
	});
	
	////时间线数据力度切换方法
	function packDataType(len){
		 var date_new={};
         for(var i=0;i<date_data.length;i++){
         	//截取日期到月
         	var key=date_data[i].key;
         	var dateValue=key.substring(0,len);
         	if(len==2){
         		dateValue = getWeekNum(key+"");
         	}
         	if(date_new[dateValue]!=undefined){
         		var nnn = date_new[dateValue];
         		date_new[dateValue] = nnn + date_data[i].value*1;
         	}else{
            	date_new[dateValue] = date_data[i].value*1;
         	}
         }
         var quadclass_value=[];
         for(var obj in date_new){
     		var d1={
     			key:obj,
     			value:date_new[obj].toFixed(3)
   	      	}	
     		quadclass_value.push(d1);
		 }
         showline(quadclass_value);
	}
	
	//年月日选中点击事件
	$('.circle_timeLine').on('click',function(){
		$(this).addClass('circleon').siblings('.circle').removeClass('circleon');
		selectVal=$(this).attr('value');
		if(selectVal=="1"){
			showline(date_data);
		}
		if(selectVal=="2"){
			packDataType(6);
        }
		if(selectVal=="3"){
			packDataType(4);
        }
		if(selectVal=="4"){
			packDataType(2);
        }
	})
	
	//给热力图的时间粒度绑定点击事件
	$('.circle_hot').on('click',function(){
		$(this).addClass('circleon').siblings('.circle').removeClass('circleon');
		selectVal=$(this).attr('value');
		showhot(date_data,selectVal);
	})
	//给扩大后的热力图的时间粒度绑定点击事件
	$('.circle_hot_max').on('click',function(){
		$(this).addClass('circleon').siblings('.circle').removeClass('circleon');
		selectVal=$(this).attr('value');
		showhot_max(date_data,selectVal,'hotCharts_max','5%','3%','3%','10%');
	})
	
	
		var myChart;
		var timeline_chart;
		var myChart_max;
		function render(configId){
			startLoad();
			var resultcode = 'ALL';
			$.ajax({
				url:'<%=basePath%>/search/graph_timeline_viz/'+configId,
				type: 'POST',
				dataType:"json",
				success:function(data){
					if(data=="-1"){
						endLoad();
						win.alertEx("加载失败");
					}
					renderData(data);
					endLoad();
					//左侧菜单栏收缩后重新加载热力图
					window.onresize=function (){
			        	 myChart.resize();
			        	 timeline_chart.resize();
			        	 myChart_max.resize();
			        }
				}
			});
		}
		function renderData(data){
	//		date_data=[{"key":"20160101","value":70.046},{"key":"20160102","value":61.964},{"key":"20160103","value":59.795},{"key":"20160104","value":63.442},{"key":"20160105","value":65.918},{"key":"20160106","value":67.678},{"key":"20160107","value":69.363},{"key":"20160108","value":68.126},{"key":"20160109","value":67.278},{"key":"20160110","value":68.853},{"key":"20160111","value":71.111},{"key":"20160112","value":71.635},{"key":"20160113","value":71.923},{"key":"20160114","value":68.891},{"key":"20160115","value":70.374},{"key":"20160116","value":71.044},{"key":"20160117","value":72.034},{"key":"20160118","value":73.767},{"key":"20160119","value":72.301},{"key":"20160120","value":71.968},{"key":"20160121","value":71.762},{"key":"20160122","value":72.352},{"key":"20160123","value":70.24},{"key":"20160124","value":72.808},{"key":"20160125","value":72.181},{"key":"20160126","value":72.383},{"key":"20160127","value":72.197},{"key":"20160128","value":74.14},{"key":"20160129","value":73.101},{"key":"20160130","value":73.923},{"key":"20160131","value":70.417},{"key":"20160201","value":72.191},{"key":"20160202","value":73.928},{"key":"20160203","value":72.356},{"key":"20160204","value":73.454},{"key":"20160205","value":70.783},{"key":"20160206","value":70.404},{"key":"20160207","value":71.075},{"key":"20160208","value":73.948},{"key":"20160209","value":72.142},{"key":"20160210","value":71.182},{"key":"20160211","value":71.726},{"key":"20160212","value":71.243},{"key":"20160213","value":75.791},{"key":"20160214","value":70.358},{"key":"20160215","value":72.665},{"key":"20160216","value":71.037},{"key":"20160217","value":70.747},{"key":"20160218","value":72.063},{"key":"20160219","value":73.081},{"key":"20160220","value":69.386},{"key":"20160221","value":68.557},{"key":"20160222","value":70.597},{"key":"20160223","value":70.555},{"key":"20160224","value":71.684},{"key":"20160225","value":71.784},{"key":"20160226","value":69.641},{"key":"20160227","value":67.862},{"key":"20160228","value":67.452},{"key":"20160229","value":69.926},{"key":"20160301","value":70.703},{"key":"20160302","value":72.886},{"key":"20160303","value":72.708},{"key":"20160304","value":71.869},{"key":"20160305","value":69.999},{"key":"20160306","value":71.574},{"key":"20160307","value":71.48},{"key":"20160308","value":71.27},{"key":"20160309","value":69.178},{"key":"20160310","value":71.497},{"key":"20160311","value":72.813},{"key":"20160312","value":70.897},{"key":"20160313","value":68.795},{"key":"20160314","value":70.2},{"key":"20160315","value":71.117},{"key":"20160316","value":69.888},{"key":"20160317","value":71.401},{"key":"20160318","value":70.731},{"key":"20160319","value":68.753},{"key":"20160320","value":70.002},{"key":"20160321","value":73.248},{"key":"20160322","value":69.823},{"key":"20160323","value":69.413},{"key":"20160324","value":70.633},{"key":"20160325","value":66.404},{"key":"20160326","value":68.471},{"key":"20160327","value":67.298},{"key":"20160328","value":68.912},{"key":"20160329","value":71.056},{"key":"20160330","value":72.274},{"key":"20160331","value":72.11},{"key":"20160401","value":72.889},{"key":"20160402","value":68.877},{"key":"20160403","value":69.433},{"key":"20160404","value":72.19},{"key":"20160405","value":70.548},{"key":"20160406","value":71.815},{"key":"20160407","value":72.582},{"key":"20160408","value":72.389},{"key":"20160409","value":69.827},{"key":"20160410","value":69.887},{"key":"20160411","value":69.441},{"key":"20160412","value":71.849},{"key":"20160413","value":71.52},{"key":"20160414","value":71.356},{"key":"20160415","value":71.89},{"key":"20160416","value":74.222},{"key":"20160417","value":70.985},{"key":"20160418","value":72.718},{"key":"20160419","value":72.05},{"key":"20160420","value":72.034},{"key":"20160421","value":74.369},{"key":"20160422","value":76.789},{"key":"20160423","value":72.89},{"key":"20160424","value":73.162},{"key":"20160425","value":72.18},{"key":"20160426","value":71.804},{"key":"20160427","value":71.102},{"key":"20160428","value":68.914},{"key":"20160429","value":70.341},{"key":"20160430","value":70.396},{"key":"20160501","value":71.654},{"key":"20160502","value":72.708},{"key":"20160503","value":69.699},{"key":"20160504","value":71.609},{"key":"20160505","value":71.815},{"key":"20160506","value":70.075},{"key":"20160507","value":67.279},{"key":"20160508","value":67.284},{"key":"20160509","value":72.543},{"key":"20160510","value":70.451},{"key":"20160511","value":72.567},{"key":"20160512","value":72.356},{"key":"20160513","value":71.223},{"key":"20160514","value":67.032},{"key":"20160515","value":69.382},{"key":"20160516","value":71.107},{"key":"20160517","value":71.369},{"key":"20160518","value":71.347},{"key":"20160519","value":72.369},{"key":"20160520","value":73.798},{"key":"20160521","value":74.058},{"key":"20160522","value":72.24},{"key":"20160523","value":70.564},{"key":"20160524","value":70.02},{"key":"20160525","value":70.906},{"key":"20160526","value":72.537},{"key":"20160527","value":74.712},{"key":"20160528","value":72.696},{"key":"20160529","value":73.22},{"key":"20160530","value":69.7},{"key":"20160531","value":70.885},{"key":"20160601","value":71.956},{"key":"20160602","value":71.271},{"key":"20160603","value":71.746},{"key":"20160604","value":71.553},{"key":"20160605","value":69.131},{"key":"20160606","value":69.537},{"key":"20160607","value":70.689},{"key":"20160608","value":72.532},{"key":"20160609","value":71.077},{"key":"20160610","value":70.09},{"key":"20160611","value":70.358},{"key":"20160612","value":65.033},{"key":"20160613","value":64.164},{"key":"20160614","value":66.815},{"key":"20160615","value":68.439},{"key":"20160616","value":69.694},{"key":"20160617","value":69.913},{"key":"20160618","value":69.278},{"key":"20160619","value":68.155},{"key":"20160620","value":67.522},{"key":"20160621","value":69.457},{"key":"20160622","value":72.792},{"key":"20160623","value":69.291},{"key":"20160624","value":73.178},{"key":"20160625","value":71.36},{"key":"20160626","value":72.576},{"key":"20160627","value":72.099},{"key":"20160628","value":72.184},{"key":"20160629","value":70.159},{"key":"20160630","value":68.214},{"key":"20160701","value":69.625},{"key":"20160702","value":66.982},{"key":"20160703","value":69.638},{"key":"20160704","value":69.069},{"key":"20160705","value":70.312},{"key":"20160706","value":68.86},{"key":"20160707","value":69.123},{"key":"20160708","value":59.592},{"key":"20160709","value":63.242},{"key":"20160710","value":63.491},{"key":"20160711","value":67.869},{"key":"20160712","value":66.418},{"key":"20160713","value":71.866},{"key":"20160714","value":73.234},{"key":"20160715","value":70.995},{"key":"20160716","value":70.1},{"key":"20160717","value":64.155},{"key":"20160718","value":65.622},{"key":"20160719","value":67.527},{"key":"20160720","value":70.373},{"key":"20160721","value":69.161},{"key":"20160722","value":70.292},{"key":"20160723","value":66.912},{"key":"20160724","value":67.564},{"key":"20160725","value":69.143},{"key":"20160726","value":68.797},{"key":"20160727","value":70.009},{"key":"20160728","value":70.392},{"key":"20160729","value":70.755},{"key":"20160730","value":68.61},{"key":"20160731","value":67.769},{"key":"20160801","value":67.536},{"key":"20160802","value":68.799},{"key":"20160803","value":69.61},{"key":"20160804","value":67.254},{"key":"20160805","value":68.803},{"key":"20160806","value":67.215},{"key":"20160807","value":71.035},{"key":"20160808","value":68.122},{"key":"20160809","value":66.859},{"key":"20160810","value":69.412},{"key":"20160811","value":68.576},{"key":"20160812","value":68.722},{"key":"20160813","value":68.32},{"key":"20160814","value":62.737},{"key":"20160815","value":65.416},{"key":"20160816","value":67.402},{"key":"20160817","value":68.526},{"key":"20160818","value":70.281},{"key":"20160819","value":71.737},{"key":"20160820","value":67.864},{"key":"20160821","value":63.485},{"key":"20160822","value":70.109},{"key":"20160823","value":70.519},{"key":"20160824","value":69.731},{"key":"20160825","value":69.351},{"key":"20160826","value":69.972},{"key":"20160827","value":72.126},{"key":"20160828","value":71.368},{"key":"20160829","value":70.238},{"key":"20160830","value":70.484},{"key":"20160831","value":71.006},{"key":"20160901","value":72.88},{"key":"20160902","value":71.526},{"key":"20160903","value":75.672},{"key":"20160904","value":74.137},{"key":"20160905","value":70.285},{"key":"20160906","value":70.006},{"key":"20160907","value":74.544},{"key":"20160908","value":72.806},{"key":"20160909","value":71.269},{"key":"20160910","value":69.637},{"key":"20160911","value":70.506},{"key":"20160912","value":71.061},{"key":"20160913","value":74.193},{"key":"20160914","value":72.945},{"key":"20160915","value":70.642},{"key":"20160916","value":72.532},{"key":"20160917","value":67.324},{"key":"20160918","value":67.996},{"key":"20160919","value":71.959},{"key":"20160920","value":72.807},{"key":"20160921","value":69.102},{"key":"20160922","value":67.049},{"key":"20160923","value":69.875},{"key":"20160924","value":68.31},{"key":"20160925","value":69.703},{"key":"20160926","value":71.583},{"key":"20160927","value":71.915},{"key":"20160928","value":73.2},{"key":"20160929","value":70.545},{"key":"20160930","value":71.905},{"key":"20161001","value":70.231},{"key":"20161002","value":71.241},{"key":"20161003","value":69.276},{"key":"20161004","value":68.946},{"key":"20161005","value":71.108},{"key":"20161006","value":71.266},{"key":"20161007","value":71.638},{"key":"20161008","value":69.473},{"key":"20161009","value":66.456},{"key":"20161010","value":68.95},{"key":"20161011","value":71.154},{"key":"20161012","value":70.492},{"key":"20161013","value":70.403},{"key":"20161014","value":72.142},{"key":"20161015","value":71.932},{"key":"20161016","value":70.995},{"key":"20161017","value":69.895},{"key":"20161018","value":72.015},{"key":"20161019","value":71.062},{"key":"20161020","value":71.783},{"key":"20161021","value":70.875},{"key":"20161022","value":69.13},{"key":"20161023","value":70.943},{"key":"20161024","value":72.118},{"key":"20161025","value":69.248},{"key":"20161026","value":70.706},{"key":"20161027","value":71.97},{"key":"20161028","value":70.031},{"key":"20161029","value":67.625},{"key":"20161030","value":71.265},{"key":"20161031","value":70.924},{"key":"20161101","value":71.111},{"key":"20161102","value":68.715},{"key":"20161103","value":68.703},{"key":"20161104","value":67.628},{"key":"20161105","value":68.816},{"key":"20161106","value":68.384},{"key":"20161107","value":71.307},{"key":"20161108","value":72.68},{"key":"20161109","value":77.129},{"key":"20161110","value":75.702},{"key":"20161111","value":71.659},{"key":"20161112","value":69.03},{"key":"20161113","value":67.652},{"key":"20161114","value":72.864},{"key":"20161115","value":71.947},{"key":"20161116","value":71.678},{"key":"20161117","value":72.188},{"key":"20161118","value":73.736},{"key":"20161119","value":71.97},{"key":"20161120","value":72.873},{"key":"20161121","value":68.328},{"key":"20161122","value":71.347},{"key":"20161123","value":69.503},{"key":"20161124","value":71.467},{"key":"20161125","value":68.976},{"key":"20161126","value":72.905},{"key":"20161127","value":72.354},{"key":"20161128","value":71.218},{"key":"20161129","value":72.415},{"key":"20161130","value":73.281},{"key":"20161201","value":71.722},{"key":"20161202","value":72.186},{"key":"20161203","value":71.897},{"key":"20161204","value":72.409},{"key":"20161205","value":71.404},{"key":"20161206","value":72.143},{"key":"20161207","value":71.745},{"key":"20161208","value":72.695},{"key":"20161209","value":71.381},{"key":"20161210","value":72.34},{"key":"20161211","value":72.501},{"key":"20161212","value":71.204},{"key":"20161213","value":72.183},{"key":"20161214","value":71.009},{"key":"20161215","value":72.888},{"key":"20161216","value":71.065},{"key":"20161217","value":71.145},{"key":"20161218","value":68.204},{"key":"20161219","value":69.919},{"key":"20161220","value":69.057},{"key":"20161221","value":69.668},{"key":"20161222","value":71.005},{"key":"20161223","value":69.666},{"key":"20161224","value":69.296},{"key":"20161225","value":71.79},{"key":"20161226","value":70.669},{"key":"20161227","value":74.216},{"key":"20161228","value":71.452},{"key":"20161229","value":69.599},{"key":"20161230","value":68.191},{"key":"20161231","value":70.603},{"key":"20170101","value":67.099},{"key":"20170102","value":68.172},{"key":"20170103","value":70.066},{"key":"20170104","value":71.847},{"key":"20170105","value":67.754},{"key":"20170106","value":72.705},{"key":"20170107","value":71.829},{"key":"20170108","value":69.485},{"key":"20170109","value":70.89},{"key":"20170110","value":70.925},{"key":"20170111","value":73.021},{"key":"20170112","value":72.315},{"key":"20170113","value":73.135},{"key":"20170114","value":70.605},{"key":"20170115","value":69.225},{"key":"20170116","value":72.86},{"key":"20170117","value":73.046},{"key":"20170118","value":72.352},{"key":"20170119","value":70.172},{"key":"20170120","value":73.471},{"key":"20170121","value":71.953},{"key":"20170122","value":73.452},{"key":"20170123","value":74.175},{"key":"20170124","value":73.715},{"key":"20170125","value":71.916},{"key":"20170126","value":73.551},{"key":"20170127","value":73.277},{"key":"20170128","value":71.21},{"key":"20170129","value":64.89},{"key":"20170130","value":66.576},{"key":"20170131","value":67.205},{"key":"20170201","value":71.564},{"key":"20170202","value":71.141},{"key":"20170203","value":68.844},{"key":"20170204","value":69.893},{"key":"20170205","value":67.681},{"key":"20170206","value":69.534},{"key":"20170207","value":72.675},{"key":"20170208","value":69.101},{"key":"20170209","value":69.714},{"key":"20170210","value":71.316},{"key":"20170211","value":69.095},{"key":"20170212","value":69.043},{"key":"20170213","value":71.13},{"key":"20170214","value":73.441},{"key":"20170215","value":73.443},{"key":"20170216","value":73.044},{"key":"20170217","value":71.229},{"key":"20170218","value":73.265},{"key":"20170219","value":70.664},{"key":"20170220","value":72.059},{"key":"20170221","value":71.463},{"key":"20170222","value":71.851},{"key":"20170223","value":71.771},{"key":"20170224","value":69.893},{"key":"20170225","value":69.256},{"key":"20170226","value":71.544},{"key":"20170227","value":71.432},{"key":"20170228","value":69.669},{"key":"20170301","value":73.723},{"key":"20170302","value":73.646},{"key":"20170303","value":74.31},{"key":"20170304","value":71.233},{"key":"20170305","value":68.489},{"key":"20170306","value":69.527},{"key":"20170307","value":69.667},{"key":"20170308","value":70.17},{"key":"20170309","value":70.59},{"key":"20170310","value":71.769},{"key":"20170311","value":68.42},{"key":"20170312","value":67.254},{"key":"20170313","value":73.317},{"key":"20170314","value":72.293},{"key":"20170315","value":72.696},{"key":"20170316","value":70.983},{"key":"20170317","value":70.634},{"key":"20170318","value":70.788},{"key":"20170319","value":68.877},{"key":"20170320","value":73.114},{"key":"20170321","value":73.53},{"key":"20170322","value":71.644},{"key":"20170323","value":70.961},{"key":"20170324","value":71.707},{"key":"20170325","value":70.367},{"key":"20170326","value":67.532},{"key":"20170327","value":69.999},{"key":"20170328","value":71.366},{"key":"20170329","value":74.681},{"key":"20170330","value":73.575},{"key":"20170331","value":72.43},{"key":"20170401","value":72.294},{"key":"20170402","value":72.167},{"key":"20170403","value":72.035},{"key":"20170404","value":71.784},{"key":"20170405","value":68.842},{"key":"20170406","value":71.531},{"key":"20170407","value":61.26},{"key":"20170408","value":65.967},{"key":"20170409","value":64.613},{"key":"20170410","value":70.128},{"key":"20170411","value":70.65},{"key":"20170412","value":71.844},{"key":"20170413","value":70.578},{"key":"20170414","value":68.166},{"key":"20170415","value":67.879},{"key":"20170416","value":71.408},{"key":"20170417","value":70.258},{"key":"20170418","value":72.017},{"key":"20170419","value":72.117},{"key":"20170420","value":71.248},{"key":"20170421","value":70.217},{"key":"20170422","value":71},{"key":"20170423","value":70.675},{"key":"20170424","value":70.323},{"key":"20170425","value":71.541},{"key":"20170426","value":73.097},{"key":"20170427","value":69.026},{"key":"20170428","value":71.094},{"key":"20170429","value":69.77},{"key":"20170430","value":72.024},{"key":"20170501","value":67.741},{"key":"20170502","value":71.201},{"key":"20170503","value":72.685},{"key":"20170504","value":73.789},{"key":"20170505","value":71.365},{"key":"20170506","value":69.468},{"key":"20170507","value":73.256},{"key":"20170508","value":72.169},{"key":"20170509","value":71.407},{"key":"20170510","value":76.218},{"key":"20170511","value":76.069},{"key":"20170512","value":74.731},{"key":"20170513","value":74.448},{"key":"20170514","value":69.842},{"key":"20170515","value":70.969},{"key":"20170516","value":72.383},{"key":"20170517","value":73.695},{"key":"20170518","value":72.848},{"key":"20170519","value":73.634},{"key":"20170520","value":76.683},{"key":"20170521","value":74.539},{"key":"20170522","value":76.592},{"key":"20170523","value":71.732},{"key":"20170524","value":73.862},{"key":"20170525","value":72.338},{"key":"20170526","value":69.835},{"key":"20170527","value":72.584},{"key":"20170528","value":70.36},{"key":"20170529","value":71.696},{"key":"20170530","value":68.887},{"key":"20170531","value":70.565},{"key":"20170601","value":72.72},{"key":"20170602","value":72.435},{"key":"20170603","value":70.267},{"key":"20170604","value":64.896},{"key":"20170605","value":66.433},{"key":"20170606","value":68.716},{"key":"20170607","value":69.349},{"key":"20170608","value":72.369},{"key":"20170609","value":71.835},{"key":"20170610","value":67.64},{"key":"20170611","value":70.718},{"key":"20170612","value":71.163},{"key":"20170613","value":71.873},{"key":"20170614","value":69.851},{"key":"20170615","value":70.218},{"key":"20170616","value":70.442},{"key":"20170617","value":67.109},{"key":"20170618","value":70.641},{"key":"20170619","value":67.381},{"key":"20170620","value":71.059},{"key":"20170621","value":71.774},{"key":"20170622","value":71.493},{"key":"20170623","value":68.865},{"key":"20170624","value":70.216},{"key":"20170625","value":70.205},{"key":"20170626","value":72.001},{"key":"20170627","value":71.221},{"key":"20170628","value":70.098},{"key":"20170629","value":69.877},{"key":"20170630","value":69.748},{"key":"20170701","value":67.296},{"key":"20170702","value":68.413},{"key":"20170703","value":72.654},{"key":"20170704","value":71.986},{"key":"20170705","value":71.533},{"key":"20170706","value":73.433},{"key":"20170707","value":69.039},{"key":"20170708","value":73.268},{"key":"20170709","value":72.078},{"key":"20170710","value":72.297},{"key":"20170711","value":71.491},{"key":"20170712","value":72.324},{"key":"20170713","value":74.868},{"key":"20170714","value":69.624},{"key":"20170715","value":67.912},{"key":"20170716","value":70.142},{"key":"20170717","value":70.623},{"key":"20170718","value":71.407},{"key":"20170719","value":71.5},{"key":"20170720","value":70.078},{"key":"20170721","value":68.09},{"key":"20170722","value":68.407},{"key":"20170723","value":69.343},{"key":"20170724","value":69.319},{"key":"20170725","value":71.511},{"key":"20170726","value":68.556},{"key":"20170727","value":69.894},{"key":"20170728","value":68.445},{"key":"20170729","value":67.365},{"key":"20170730","value":65.041},{"key":"20170731","value":67.571},{"key":"20170801","value":71.095},{"key":"20170802","value":70.545},{"key":"20170803","value":70.48},{"key":"20170804","value":70.734},{"key":"20170805","value":70.666},{"key":"20170806","value":70.265},{"key":"20170807","value":69.633},{"key":"20170808","value":71.677},{"key":"20170809","value":69.816},{"key":"20170810","value":69.047},{"key":"20170811","value":71.766},{"key":"20170812","value":67.025},{"key":"20170813","value":65.723},{"key":"20170814","value":67.861},{"key":"20170815","value":68.146},{"key":"20170816","value":67.943},{"key":"20170817","value":68.532},{"key":"20170818","value":65.848},{"key":"20170819","value":65.28},{"key":"20170820","value":68.511},{"key":"20170821","value":71.058},{"key":"20170822","value":71.223},{"key":"20170823","value":71.306},{"key":"20170824","value":71.722},{"key":"20170825","value":69.131},{"key":"20170826","value":70.423},{"key":"20170827","value":72.215},{"key":"20170828","value":74.12},{"key":"20170829","value":74.115},{"key":"20170830","value":74.774},{"key":"20170831","value":74.168},{"key":"20170901","value":73.321},{"key":"20170902","value":71.091},{"key":"20170903","value":71.176},{"key":"20170904","value":72.926},{"key":"20170905","value":71.785},{"key":"20170906","value":73.327},{"key":"20170907","value":74.183},{"key":"20170908","value":73.713},{"key":"20170909","value":70.818},{"key":"20170910","value":72.174},{"key":"20170911","value":71.282},{"key":"20170912","value":72.265},{"key":"20170913","value":74.023},{"key":"20170914","value":74.426},{"key":"20170915","value":68.21},{"key":"20170916","value":66.482},{"key":"20170917","value":68.612},{"key":"20170918","value":71.986},{"key":"20170919","value":70.237},{"key":"20170920","value":73.103},{"key":"20170921","value":73.018},{"key":"20170922","value":73.144},{"key":"20170923","value":69.407},{"key":"20170924","value":69.085},{"key":"20170925","value":69.298},{"key":"20170926","value":70.366},{"key":"20170927","value":70.783},{"key":"20170928","value":70.4},{"key":"20170929","value":73.439},{"key":"20170930","value":73.545},{"key":"20171001","value":68.391},{"key":"20171002","value":63.223},{"key":"20171003","value":68.613},{"key":"20171004","value":71.368},{"key":"20171005","value":69.707},{"key":"20171006","value":71.504},{"key":"20171007","value":69.98},{"key":"20171008","value":70.309},{"key":"20171009","value":71.998},{"key":"20171010","value":69.862},{"key":"20171011","value":71.28},{"key":"20171012","value":72.074},{"key":"20171013","value":71.975},{"key":"20171014","value":71.889},{"key":"20171015","value":69.012},{"key":"20171016","value":68.929},{"key":"20171017","value":68.464},{"key":"20171018","value":69.082},{"key":"20171019","value":69.199},{"key":"20171020","value":70.527},{"key":"20171021","value":68.791},{"key":"20171022","value":71.007},{"key":"20171023","value":72.079},{"key":"20171024","value":72.845},{"key":"20171025","value":73.156},{"key":"20171026","value":71.725},{"key":"20171027","value":72.428},{"key":"20171028","value":70.343},{"key":"20171029","value":69.967},{"key":"20171030","value":70.331},{"key":"20171031","value":72.376},{"key":"20171101","value":70.506},{"key":"20171102","value":72.252},{"key":"20171103","value":71.398},{"key":"20171104","value":72.273},{"key":"20171105","value":68.073},{"key":"20171106","value":67.19},{"key":"20171107","value":69.583},{"key":"20171108","value":72.913},{"key":"20171109","value":73.293},{"key":"20171110","value":70.663},{"key":"20171111","value":74.351},{"key":"20171112","value":75.47},{"key":"20171113","value":75.697},{"key":"20171114","value":73.541},{"key":"20171115","value":72.02},{"key":"20171116","value":72.133},{"key":"20171117","value":72.011},{"key":"20171118","value":73.324},{"key":"20171119","value":74.978},{"key":"20171120","value":71.676},{"key":"20171121","value":73.381},{"key":"20171122","value":71.165},{"key":"20171123","value":75.363},{"key":"20171124","value":69.606},{"key":"20171125","value":62.517},{"key":"20171126","value":71.351},{"key":"20171127","value":73.575},{"key":"20171128","value":73.618},{"key":"20171129","value":72.935},{"key":"20171130","value":73.438},{"key":"20171201","value":71.847},{"key":"20171202","value":70.775},{"key":"20171203","value":72.567},{"key":"20171204","value":74.257},{"key":"20171205","value":72.005},{"key":"20171206","value":72.693},{"key":"20171207","value":70.531},{"key":"20171208","value":69.074},{"key":"20171209","value":68.692},{"key":"20171210","value":66.007},{"key":"20171211","value":71.003},{"key":"20171212","value":72.219},{"key":"20171213","value":71.419},{"key":"20171214","value":69.85},{"key":"20171215","value":70.928},{"key":"20171216","value":69.658},{"key":"20171217","value":70.289},{"key":"20171218","value":71.904},{"key":"20171219","value":71.772},{"key":"20171220","value":69.988},{"key":"20171221","value":68.977},{"key":"20171222","value":71.049},{"key":"20171223","value":68.65},{"key":"20171224","value":70.07},{"key":"20171225","value":69.752},{"key":"20171226","value":71.34},{"key":"20171227","value":71.807},{"key":"20171228","value":67.883},{"key":"20171229","value":67.075},{"key":"20171230","value":61.986},{"key":"20171231","value":64.342},{"key":"20180101","value":67.087},{"key":"20180102","value":68.649},{"key":"20180103","value":69.388},{"key":"20180104","value":70.228},{"key":"20180105","value":70.853},{"key":"20180106","value":70.92},{"key":"20180107","value":72.404},{"key":"20180108","value":72.894},{"key":"20180109","value":73.645},{"key":"20180110","value":73.929},{"key":"20180111","value":73.49},{"key":"20180112","value":72.12},{"key":"20180113","value":71.431},{"key":"20180114","value":72.9},{"key":"20180115","value":71.576},{"key":"20180116","value":71.681},{"key":"20180117","value":72.223},{"key":"20180118","value":73.206},{"key":"20180119","value":72.499},{"key":"20180120","value":73.697},{"key":"20180121","value":65.367},{"key":"20180122","value":71.381},{"key":"20180123","value":72.611},{"key":"20180124","value":70.705},{"key":"20180125","value":73.885},{"key":"20180126","value":71.144},{"key":"20180127","value":71.005},{"key":"20180128","value":73.08},{"key":"20180129","value":71.941},{"key":"20180130","value":71.93},{"key":"20180131","value":74.046},{"key":"20180201","value":73.056},{"key":"20180202","value":70.243},{"key":"20180203","value":67.425},{"key":"20180204","value":68.909},{"key":"20180205","value":71.233},{"key":"20180206","value":70.604},{"key":"20180207","value":72.034},{"key":"20180208","value":71.6},{"key":"20180209","value":72.634},{"key":"20180210","value":68.934},{"key":"20180211","value":73.339},{"key":"20180212","value":72.757},{"key":"20180213","value":71.81},{"key":"20180214","value":71.841},{"key":"20180215","value":67.394},{"key":"20180216","value":70.245},{"key":"20180217","value":70.181},{"key":"20180218","value":68.282},{"key":"20180219","value":68.658},{"key":"20180220","value":68.579},{"key":"20180221","value":69.143},{"key":"20180222","value":68.772},{"key":"20180223","value":69.529},{"key":"20180224","value":67.827},{"key":"20180225","value":71.036},{"key":"20180226","value":71.625},{"key":"20180227","value":71.417},{"key":"20180228","value":72.328},{"key":"20180301","value":72.593},{"key":"20180302","value":69.803},{"key":"20180303","value":67.839},{"key":"20180304","value":70.111},{"key":"20180305","value":72.849},{"key":"20180306","value":74.772},{"key":"20180307","value":72.345},{"key":"20180308","value":73.463},{"key":"20180309","value":74.783},{"key":"20180310","value":73.106},{"key":"20180311","value":73.359},{"key":"20180312","value":73.803},{"key":"20180313","value":74.331},{"key":"20180314","value":72.876},{"key":"20180315","value":71.261},{"key":"20180316","value":71.231},{"key":"20180317","value":70.993},{"key":"20180318","value":70.872},{"key":"20180319","value":72.349},{"key":"20180320","value":71.393},{"key":"20180321","value":71.009},{"key":"20180322","value":71.25},{"key":"20180323","value":69.675},{"key":"20180324","value":68.327},{"key":"20180325","value":68.813},{"key":"20180326","value":70.064},{"key":"20180327","value":70.035},{"key":"20180328","value":72.235},{"key":"20180329","value":68.994},{"key":"20180330","value":67.638},{"key":"20180331","value":70.716},{"key":"20180401","value":68.532},{"key":"20180402","value":70.184},{"key":"20180403","value":72.276},{"key":"20180404","value":72.547},{"key":"20180405","value":71.012},{"key":"20180406","value":67.482},{"key":"20180407","value":67.601},{"key":"20180408","value":67.634},{"key":"20180409","value":67.676},{"key":"20180410","value":68.67},{"key":"20180411","value":68.126},{"key":"20180412","value":69.585},{"key":"20180413","value":68.259},{"key":"20180414","value":60.221},{"key":"20180415","value":68.651},{"key":"20180416","value":72.049},{"key":"20180417","value":69.732},{"key":"20180418","value":75.247},{"key":"20180419","value":74.496},{"key":"20180420","value":76.901},{"key":"20180421","value":69.694},{"key":"20180422","value":67.241},{"key":"20180423","value":71.897},{"key":"20180424","value":71.75},{"key":"20180425","value":68.651},{"key":"20180426","value":69.407},{"key":"20180427","value":72.234},{"key":"20180428","value":70.817},{"key":"20180429","value":75.497},{"key":"20180430","value":71.163},{"key":"20180501","value":73.177},{"key":"20180502","value":72.286},{"key":"20180503","value":72.877},{"key":"20180504","value":73.183},{"key":"20180505","value":70.347},{"key":"20180506","value":68.251},{"key":"20180507","value":71.702},{"key":"20180508","value":73.704},{"key":"20180509","value":74.973},{"key":"20180510","value":71.336},{"key":"20180511","value":71.821},{"key":"20180512","value":70.369},{"key":"20180513","value":65.378},{"key":"20180514","value":65.392},{"key":"20180515","value":67.999},{"key":"20180516","value":72.101},{"key":"20180517","value":73.537},{"key":"20180518","value":73.833},{"key":"20180519","value":74.08},{"key":"20180520","value":72.363},{"key":"20180521","value":74.073},{"key":"20180522","value":73.92},{"key":"20180523","value":71.988},{"key":"20180524","value":74.686},{"key":"20180525","value":71.231},{"key":"20180526","value":73.663},{"key":"20180527","value":75.194},{"key":"20180528","value":74.271},{"key":"20180529","value":75.483},{"key":"20180530","value":71.694},{"key":"20180531","value":75.75},{"key":"20180601","value":74.302},{"key":"20180602","value":71.922},{"key":"20180603","value":71.595},{"key":"20180604","value":73.775},{"key":"20180605","value":72.045},{"key":"20180606","value":74.242},{"key":"20180607","value":74.417},{"key":"20180608","value":71.966},{"key":"20180609","value":73.608},{"key":"20180610","value":76.583},{"key":"20180611","value":76.996},{"key":"20180612","value":76.756},{"key":"20180613","value":73.72},{"key":"20180614","value":74.695},{"key":"20180615","value":70.541},{"key":"20180616","value":70.283},{"key":"20180617","value":68.038},{"key":"20180618","value":68.821},{"key":"20180619","value":71.56},{"key":"20180620","value":74.789},{"key":"20180621","value":73.952},{"key":"20180622","value":74.085},{"key":"20180623","value":70.657},{"key":"20180624","value":72.537},{"key":"20180625","value":73.112},{"key":"20180626","value":71.509},{"key":"20180627","value":71.522},{"key":"20180628","value":73.601},{"key":"20180629","value":69.275},{"key":"20180630","value":70.246},{"key":"20180701","value":71.401},{"key":"20180702","value":68.212},{"key":"20180703","value":71.783},{"key":"20180704","value":72.025},{"key":"20180705","value":72.544},{"key":"20180706","value":72.294},{"key":"20180707","value":67.841},{"key":"20180708","value":71.257},{"key":"20180709","value":73.065},{"key":"20180710","value":74.342},{"key":"20180711","value":72.1},{"key":"20180712","value":73.309},{"key":"20180713","value":73.174},{"key":"20180714","value":71.584},{"key":"20180715","value":68.44},{"key":"20180716","value":70.696},{"key":"20180717","value":70.658},{"key":"20180718","value":72.309},{"key":"20180719","value":71.922},{"key":"20180720","value":72.852},{"key":"20180721","value":70.41},{"key":"20180722","value":69.302},{"key":"20180723","value":67.128},{"key":"20180724","value":70.005},{"key":"20180725","value":70.783},{"key":"20180726","value":70.252},{"key":"20180727","value":69.207},{"key":"20180728","value":69.337},{"key":"20180729","value":68.484},{"key":"20180730","value":70.958},{"key":"20180731","value":71.786},{"key":"20180801","value":71.337},{"key":"20180802","value":71.499},{"key":"20180803","value":70.424},{"key":"20180804","value":68.502},{"key":"20180805","value":68.789},{"key":"20180806","value":67.919},{"key":"20180807","value":64.767},{"key":"20180808","value":67.772},{"key":"20180809","value":68.472},{"key":"20180810","value":68.347},{"key":"20180811","value":69.012},{"key":"20180812","value":69.543},{"key":"20180813","value":70.261},{"key":"20180814","value":69.024},{"key":"20180815","value":69.688},{"key":"20180816","value":71.889},{"key":"20180817","value":71.237},{"key":"20180818","value":73.431},{"key":"20180819","value":74.442},{"key":"20180820","value":72.441},{"key":"20180821","value":71.849},{"key":"20180822","value":70.037},{"key":"20180823","value":70.558},{"key":"20180824","value":72.021},{"key":"20180825","value":74.766},{"key":"20180826","value":74.279},{"key":"20180827","value":70.642},{"key":"20180828","value":72.576},{"key":"20180829","value":71.883},{"key":"20180830","value":69.923},{"key":"20180831","value":72.892},{"key":"20180901","value":72.701},{"key":"20180902","value":70.758},{"key":"20180903","value":70.211},{"key":"20180904","value":68.923},{"key":"20180905","value":71.998},{"key":"20180906","value":71.012},{"key":"20180907","value":73.494},{"key":"20180908","value":71.136},{"key":"20180909","value":79.625},{"key":"20180910","value":67.848},{"key":"20180911","value":68.398},{"key":"20180912","value":70.035},{"key":"20180913","value":73.795},{"key":"20180914","value":74.799},{"key":"20180915","value":69.913},{"key":"20180916","value":68.23},{"key":"20180917","value":71.388},{"key":"20180918","value":70.227},{"key":"20180919","value":71.733},{"key":"20180920","value":71.652},{"key":"20180921","value":68.717},{"key":"20180922","value":67.905},{"key":"20180923","value":70.164},{"key":"20180924","value":72.708},{"key":"20180925","value":71.753},{"key":"20180926","value":71.438},{"key":"20180927","value":71.166},{"key":"20180928","value":68.78},{"key":"20180929","value":65.736},{"key":"20180930","value":69.043},{"key":"20181001","value":70.978},{"key":"20181002","value":71.607},{"key":"20181003","value":71.877},{"key":"20181004","value":68.86},{"key":"20181005","value":67.58},{"key":"20181006","value":68.09},{"key":"20181007","value":69.128},{"key":"20181008","value":72.659},{"key":"20181009","value":73.898},{"key":"20181010","value":73.097},{"key":"20181011","value":73.511},{"key":"20181012","value":83.879},{"key":"20181013","value":72.121},{"key":"20181014","value":72.325},{"key":"20181015","value":76.03},{"key":"20181016","value":74.484},{"key":"20181017","value":71.034},{"key":"20181018","value":72.829},{"key":"20181019","value":72.213},{"key":"20181020","value":70.878},{"key":"20181021","value":68.116},{"key":"20181022","value":73.686},{"key":"20181023","value":72.662},{"key":"20181024","value":73.413},{"key":"20181025","value":72.875},{"key":"20181026","value":71.933},{"key":"20181027","value":69.021},{"key":"20181028","value":65.781},{"key":"20181029","value":71.232},{"key":"20181030","value":71.074},{"key":"20181031","value":72.321},{"key":"20181101","value":72.3},{"key":"20181102","value":68.908},{"key":"20181103","value":68.94},{"key":"20181104","value":68.819},{"key":"20181105","value":71.691},{"key":"20181106","value":72.423},{"key":"20181107","value":73.57},{"key":"20181108","value":70.068},{"key":"20181109","value":70.181},{"key":"20181110","value":70.536},{"key":"20181111","value":71.361},{"key":"20181112","value":69.064},{"key":"20181113","value":70.8},{"key":"20181114","value":71.858},{"key":"20181115","value":72.103},{"key":"20181116","value":70.601},{"key":"20181117","value":71.603},{"key":"20181118","value":71.414},{"key":"20181119","value":71.58},{"key":"20181120","value":69.255},{"key":"20181121","value":68.995},{"key":"20181122","value":70.297},{"key":"20181123","value":69.601},{"key":"20181124","value":67.146},{"key":"20181125","value":71.262},{"key":"20181126","value":69.569},{"key":"20181127","value":72.489},{"key":"20181128","value":71.767},{"key":"20181129","value":71.303},{"key":"20181130","value":72.4},{"key":"20181201","value":71.836},{"key":"20181202","value":74.823},{"key":"20181203","value":74.314},{"key":"20181204","value":76.468},{"key":"20181205","value":74.183},{"key":"20181206","value":71.878},{"key":"20181207","value":74.39},{"key":"20181208","value":71.191},{"key":"20181209","value":68.84},{"key":"20181210","value":71.611},{"key":"20181211","value":70.293},{"key":"20181212","value":70.033},{"key":"20181213","value":70.746},{"key":"20181214","value":68.253},{"key":"20181215","value":69.693},{"key":"20181216","value":69.605},{"key":"20181217","value":68.524},{"key":"20181218","value":70.695},{"key":"20181219","value":71.96},{"key":"20181220","value":69.629},{"key":"20181221","value":71.697},{"key":"20181222","value":70.571},{"key":"20181223","value":71.885},{"key":"20181224","value":72.482},{"key":"20181225","value":72.094},{"key":"20181226","value":72.438},{"key":"20181227","value":73.127},{"key":"20181228","value":70.434},{"key":"20181229","value":67.324},{"key":"20181230","value":67.364},{"key":"20181231","value":69.689}];
			date_data=data.date_data;
			//默认日粒度热力图数据显示
            $("#hot_day").click();
            //默认日粒度显示
            $("#day").click();
            //将遮罩关闭
            $(".toMin").click();
		}
		//扩大缩小的关闭
		$(".toMax").click(function(){
			$('.maxBox').css('display','block');
			$('.zeZhao').css('display','block');
			$("#hot_day_max").click();
		})
		$(".toMin").click(function(){
			$('.maxBox').css('display','none');
			$('.zeZhao').css('display','none');
			
		})
		//折线图
		function showline(date_data){
			var xtimeline=[];
			var ytimeline=[];
			var maxIndex=0;
			for(var i=0;i<date_data.length;i++){
				if(maxIndex<(date_data[i].value*1)){
					maxIndex = (date_data[i].value*1);
				}
				xtimeline.push(date_data[i].key);
				ytimeline.push(date_data[i].value);
			}
			timeline_chart = echarts.init(document.getElementById('column_chart'));
			//var datas = [96.3, 96.4, 97.5, 95.6, 98.1, 94.8, 89.6, 94.1, 80.1, 52.4, 75.8, 94.7];
			var timeline_option = {
				backgroundColor: '#1b233482',
			    toolbox: {
      		        feature: {
      		            dataZoom: {
      		                yAxisIndex: 'none'
      		            },
      		            restore: {},
      		            saveAsImage: {},
    		            dataView: {}
      		        }
      		    }, 
      		    dataZoom: [
      		        {
      		            start: 0
      		        },
      		      {
      		            type: 'slider',
      		          textStyle:{
    		        		color:"#fff"
    		        	}
      		            
      		        }
      		    ],
			    title: {
			        text: '',
			        textStyle: {
			            fontWeight: 'normal',
			            fontSize: 12,
			            color: '#F1F1F3'
			        },
			        left: '6%'
			    },
			    tooltip: {
			        trigger: 'axis',
			        axisPointer: {
			            lineStyle: {
			                color: '#57617B'
			            }
			        },
			        formatter: '{b0}: {c0}'
			    },
			    legend: {
			        icon: 'rect',
			        itemWidth: 14,
			        itemHeight: 5,
			        itemGap: 13,
			        data: [''],
			        right: '4%',
			        textStyle: {
			            fontSize: 12,
			            color: '#F1F1F3'
			        }
			    },
			    grid: {
			        left: '4%',
			        right: '4%',
			        bottom: '12%',
			        top: '14%',
			        containLabel: true
			    },
			    xAxis: [{
			        type: 'category',
			        boundaryGap: false,
			        axisLine: {
			            lineStyle: {
			            	 color: '#F1F1F3'
			            }
			        },
			        data: xtimeline,
			        axisLabel: {
			            //interval: 1,
			            //rotate: 50,
			            textStyle: {
			                fontSize: 12
			            }
			        },
			        
			    }],
			    yAxis: [{
			        type: 'value',
			        max: maxIndex,
			        min:0,
			        axisTick: {
			            show: false
			        },
			        axisLine: {
			            lineStyle: {
			            	 color: '#F1F1F3'
			            }
			        },
			        axisLabel: {
			            textStyle: {
			                fontSize: 12
			            }
			        },
			        splitLine: {
			            show:false
			        }
			    }],
			    series: [{
			        name: '',
			        type: 'line',
			        smooth: true,
			        lineStyle: {
			            normal: {
			                width: 2
			            }
			        },
			        areaStyle: {
			            normal: {
			                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
			                    offset: 0.8,
			                    color: 'rgba(82, 191, 255, 0.3)'
			                }, {
			                    offset: 1,
			                    color: 'rgba(82, 191, 255, 0)'
			                }], false),
			                shadowColor: 'rgba(228, 139, 76, 0.1)',
			                shadowBlur: 10
			            }
			        },
			        symbolSize: 4,
			        itemStyle: {
			            normal: {
			                color: 'rgb(82, 191, 255)',
			                borderColor: '#e48b4c'
			            },
			        },
			        data: ytimeline,
			    }]
			};
			 timeline_chart.setOption(timeline_option);
		}
		
		
		/*
		 渲染热力图
		 dateType:1：日、2：月、4：周
		*/
		function showhot(date_data,dateType){
			
			if(date_data.length > 0 && dateType==2){//月
				date_data = packDate(date_data,6);
			}else if(date_data.length > 0 && dateType==4){//周
				date_data = packDate(date_data,2);
			}
			
			//先遍历X轴取出每个日期
    	    var date_new=[];
    	    //最大值
     	    var maxValue=0;
            for(var i=0;i<date_data.length;i++){
            	//截取日期到月
            	var key=date_data[i].key;
            	var dateValue=key.substring(0,4);
            	 if(maxValue<(date_data[i].value*1)){
      			    maxValue = (date_data[i].value*1);
  				}
            	date_new.push(dateValue);
            }
            //将年份的数组去重,并形成新的数组,此数组用于纵坐标的值
            var axisnums=[];
            for (var i = 0; i < date_new.length; i++) {
          	     if(axisnums.indexOf(date_new[i])==-1){
          	    	axisnums.push(date_new[i]);
          	     }
          	}
            
            //去重只剩下到月的日期组成新数组
            var axisdata=[];
            if(dateType == 1){//日粒度
           		for(var i=1;i<13;i++){
	           		var xdata="";
	           		if(i==2){
	           			for(var j=1;j<30;j++){
	           				xdata=i+"-"+j;     
	           				axisdata.push(xdata);
	           			}
	           		}else if(i==1||i==3||i==5||i==7||i==8||i==10||i==12){
						for(var j=1;j<32;j++){
							xdata=i+"-"+j;  
							axisdata.push(xdata);
						           			}
	           		}else{
	           			for(var j=1;j<31;j++){
	           				xdata=i+"-"+j; 
	           				axisdata.push(xdata);
	           			}
	           		}
	           	}
           	}else if(dateType == 2){//月粒度
           		axisdata = [1,2,3,4,5,6,7,8,9,10,11,12];
           	}else if(dateType == 4){//周粒度
           		axisdata = [1,2,3,4,5,6,7,8,9,10,
           					11,12,13,14,15,16,17,18,19,20,
           					21,22,23,24,25,26,27,28,29,30,
           					31,32,33,34,35,36,37,38,39,40,
           					41,42,43,44,45,46,47,48,49,50,
           					51,52,53
           					];
           	}
           	//x/y/值
           	var data=[];
            //获取zeo在在x轴数组中对应的的索引值
           	var index;
			for(var i=0;i<date_data.length;i++){
           		var ydata=date_data[i].key;//年月日/年月/年周
           		var dataHb=ydata.substring(0,4);//年
           		var zeo="";
           		if(dateType == 1){//日粒度
           			//每一个小数组
	           		var dataYz=ydata.substring(4,8);//月日
	           		var fst=dataYz.substr(0,1);//月第一位
	           		var sec=dataYz.substr(1,1);//月第二位
	           		var thi=dataYz.substr(2,1);//日第一位
	           		var fiv=dataYz.substr(3,4);//日第二位
	           		
	           		if(fst=="0"&&thi=="0"){//02 04 -->2-4
	           			zeo=sec+"-"+fiv;
	           		}else if(fst=="0"&&thi!="0"){//01 12 --> 1-12
	           			zeo=sec+"-"+thi+fiv;
	           		}else if(fst!="0"&&thi=="0"){//12 08 --> 12-8
	           			zeo=fst+sec+"-"+fiv;
	           		}else if(fst!="0"&&thi!="0"){//12 11 -->12-11
	           			zeo=fst+sec+"-"+thi+fiv;
	           		}
	           		index = axisdata.indexOf(zeo);//获取zeo在在x轴数组中对应的的索引值
           		}else if(dateType == 2){//月
           			var month = ydata.substring(4,6);//月份
           			//将0去掉
           			month = month.replace(/\b(0+)/gi,"");
           			//根据月份值获取对应的索引
           			index = axisdata.indexOf(parseInt(month));
           		}else if(dateType == 4){
           			var week = ydata.split("-")[1];//周
           			index = axisdata.indexOf(parseInt(week));
           		}
           		//封装三维数组
           		for(var j=0;j<axisnums.length;j++){
           			var schildVal=[];
           			if(dataHb==axisnums[j]){
           				schildVal.push(index,j,date_data[i].value);
               			data.push(schildVal);
           			}
           		}
           	}
			//var axisnums = ['2017', '2018'];，
			//var axisdata = ['1-1','1-2','1-3','1-4','1-5','1-6','1-7','1-8','1-9','1-10','1-11','1-12','1-13','1-14','1-15','1-16','1-17','1-18','1-19','1-20','1-21','1-22','1-23','1-24','1-25','1-26','1-27','1-28','1-29','1-30','2-1','2-2','2-3','2-4','2-5','2-6','2-7','2-8','2-9','2-10','2-11','2-12','2-13','2-14','2-15','2-16','2-17','2-18','2-19','2-20','2-21','2-22','2-23','2-24','2-25','2-26','2-27','2-28','2-29','2-30'];
		    //var data = [ [ 0, 0, 5 ], [ 1, 0, 1 ], [ 2, 0, 0 ], [ 3, 0, 0 ], [ 4, 0, 0 ], [ 5, 0, 0 ], [ 6, 0, 0 ], [ 7, 0, 0 ], [ 8, 0, 0 ], [ 9, 0, 0 ], [ 10, 0, 0 ], [ 11, 0, 2 ], [ 12, 0, 4 ], [ 13, 0, 1 ], [ 14, 0, 1 ], [ 15, 0, 3 ], [ 16, 0, 4 ], [ 17, 0, 6 ], [ 18, 0, 4 ], [ 19, 0, 4 ], [ 20, 0, 3 ], [ 21, 0, 3 ], [ 22, 0, 2 ], [ 23, 0, 5 ], [ 24, 0, 5 ], [ 25, 0, 5 ], [ 26, 0, 5 ], [ 27, 0, 5 ], [ 28, 0, 5 ], [ 29, 0, 5 ], [ 30, 0, 5 ], [ 31, 0, 5 ], [ 32, 0, 5 ], [ 33, 0, 5 ], [ 34, 0, 5 ], [ 35, 0, 5 ], [ 36, 0, 5 ], [ 37, 0, 5 ], [ 38, 0, 5 ], [ 39, 0, 5 ], [ 40, 0, 5 ], [ 41, 0, 5 ], [ 42, 0, 5 ], [ 43, 0, 5 ], [ 44, 0, 5 ], [ 45, 0, 5 ], [ 46, 0, 5 ], [ 47, 0, 5 ], [ 48, 0, 5 ], [ 49, 0, 5 ], [ 50, 0, 5 ], [ 51, 0, 5 ], [ 52, 0, 5 ], [ 53, 0, 5 ], [ 54, 0, 5 ], [ 55, 0, 5 ], [ 56, 0, 5 ], [ 57, 0, 5 ], [ 58, 0, 5 ], [ 59, 0, 5 ], [ 60, 0, 5 ], [ 0, 1, 7 ], [ 1, 1, 0 ], [ 2, 1, 0 ], [ 3, 1, 0 ], [ 4, 1, 0 ], [ 5, 1, 0 ], [ 6, 1, 0 ], [ 7, 1, 0 ], [ 8, 1, 0 ], [ 9, 1, 0 ], [ 10, 1, 5 ], [ 11, 1, 2 ], [ 12, 1, 2 ], [ 13, 1, 6 ], [ 14, 1, 9 ], [ 15, 1, 11 ], [ 16, 1, 6 ], [ 17, 1, 7 ], [ 18, 1, 8 ], [ 19, 1, 12 ], [ 20, 1, 5 ], [ 21, 1, 5 ], [ 22, 1, 7 ], [ 23, 1, 2 ], [ 24, 1, 5 ], [ 25, 1, 5 ], [ 26, 1, 5 ], [ 27, 1, 5 ], [ 28, 1, 5 ], [ 29, 1, 5 ], [ 30, 1, 5 ], [ 31, 0, 5 ], [ 32, 0, 5 ], [ 33, 0, 5 ], [ 34, 0, 5 ], [ 35, 0, 5 ], [ 36, 0, 5 ], [ 37, 0, 5 ], [ 38, 0, 5 ], [ 39, 0, 5 ], [ 40, 0, 5 ], [ 41, 0, 5 ], [ 42, 0, 5 ], [ 43, 0, 5 ], [ 44, 0, 5 ], [ 45, 0, 5 ], [ 46, 0, 5 ], [ 47, 0, 5 ], [ 48, 0, 5 ], [ 49, 0, 5 ], [ 50, 0, 5 ], [ 51, 0, 5 ], [ 52, 0, 5 ], [ 53, 0, 5 ], [ 54, 0, 5 ], [ 55, 0, 5 ], [ 56, 0, 5 ], [ 57, 0, 5 ], [ 58, 0, 5 ], [ 59, 0, 5 ], [ 60, 0, 5 ] ];
			option = {
					backgroundColor: '#1b233482',
					tooltip: {
						show: true,
						formatter: function (params) {
					             return axisnums[params.value[1]] +'-'+ axisdata[params.value[0]]+" : "  +params.value[2] ;
					        }
					},
					toolbox: {
        		        feature: {
        		            saveAsImage: {}
        		        }
        		    }, 
					geo: [{
						map:'world',
						zoom: 1,
						roam: true,
						show:false,
						id:'geo1',
						itemStyle:{
							areaColor:'rgb(0,0,0,0)'
						},
						height:'100%',
						width:'100%'
					}],
					grid: {
						show: true,
						top:'14%',
						left:'3%',
						right:"3%",
						bottom:"20%",
						borderColor:'rgb(0,0,0,0)'
					}, 
					calculable: true,
					animation: false,
					xAxis: {
						type: 'category',
						axisTick:{
							interval:0
						},
						axisLine: {
				            lineStyle: {
				            	 color: '#F1F1F3'
				            }
				        },
						data:axisdata
					},
					yAxis: {
						type: 'category',
						axisLine: {
				            lineStyle: {
				            	 color: '#F1F1F3'
				            }
				        },
						data:axisnums
					},
					series: [
						{
							id:'test',
							name: "fs",
							type: 'heatmap',
							coordinateSystem: 'cartesian2d',
							data: data,
							gridIndex:0,
							gradientColors: ['blue', 'cyan', 'lime', 'yellow', 'red'],
							blurSize: 10,
							pointSize: 10,
							itemStyle: {
								show:true,
								color:'rgb(0,0,0,0)'
							}
						},
					]
				};
			    myChart = echarts.init(document.getElementById('hotCharts'));
				myChart.clear();
				myChart.setOption(option);
				
				function convertToPx(dataitem){
					var newxy = myChart.convertToPixel({seriesId:'test'},dataitem);
					return newxy
				}
			
				function convertToGeo(dataitem){
					var pointobj = myChart.convertFromPixel({geoId:'geo1'},convertToPx(dataitem));
					var point = [pointobj[0],pointobj[1]];
					return point;
				}
				/*
				  将横向、纵向滚动条对应的数据封装为热力图所需数据
				*/
				function convertData(data,x_start,x_end,y_start,y_end){
					var convertedData = [];
					//横坐标对应的索引值范围
					x_start = Math.ceil(x_start);
					x_end = Math.ceil(x_end);
					//纵坐标对应的索引值范围
					y_start = Math.ceil(y_start);
					y_end = Math.ceil(y_end);
					
					for(var i = 0;i<data.length;i++){
					    
					    if (data[i][0] >= x_start && data[i][0] < x_end &&
					        data[i][1] >= y_start && data[i][1] < y_end){//将数组中所有符合规范的数据筛选出来
		    				var geoCoord = convertToGeo([data[i][0],data[i][1]]);
		    				geoCoord.push(data[i][2]);
		    				convertedData.push(geoCoord);
					    }
					    
					}
					return convertedData;
				}
				//默认将全部的数据转换为热力图数据
				var x_start = 0;
			    var x_end = axisdata.length
			    var y_start = 0;
			    var y_end = axisnums.length;
				var cusdata = convertData(data,x_start,x_end,y_start,y_end);
				//定时任务将echarts热力图数据重新渲染
			    setTimeout(function() {
					myChart.setOption({
						series: [
								{
									name: 'testheatmap',
									type: 'heatmap',
									id:'testheatmap',
									coordinateSystem: 'geo',
									seriesIndex:1,
									geoIndex: 0,
									data: cusdata,
									blurSize: 10,
									pointSize: 8
								},
							],
						visualMap: {
							show: false,
							min: 0,
					        max: maxValue,
							top: 'bottom',
							seriesIndex: 1,
							calculable: true,
							inRange: {
								//color: ["#e8192f","#d6664d","#B9044E","#f0ba2e","#d3ce2b","#169A7f","#0b6573","#1BB3c8"]
								color: ['blue', 'cyan', 'lime', 'yellow', 'red']
							}
						},
						dataZoom:[ 
						    {
					            xAxisIndex: 0,
					            filterMode: 'empty'
					        },
					        {
					            yAxisIndex: 0,
					            filterMode: 'empty'
					        }, 
					        {
					            id: 'dataZoomX',
					            type: 'slider',
					            xAxisIndex: [0],
					            filterMode: 'empty',
					            textStyle:{
					            	color:'white'
					            }
					        },
					        {
					            id: 'dataZoomY',
					            type: 'slider',
					            yAxisIndex: [0],
					            filterMode: 'empty',
					            textStyle:{
					            	color:'white'
					            }
					        }]
						});
				}, 500);
			//监听滚动条的事件
			myChart.on('dataZoom',function(params) {
			    if(params.dataZoomId== 'dataZoomX'){//"横坐标"
	                x_start = (axisdata.length)*params.start/100;
	                x_end = (axisdata.length)*params.end/100;
	            }else{ //"纵坐标"
	                y_start = (axisnums.length)*params.start/100;
	                y_end = (axisnums.length)*params.end/100;
	            }
	            cusdata = convertData(data,x_start,x_end,y_start,y_end);
			    myChart.setOption({
						series: [
							{
								name: 'testheatmap',
								type: 'heatmap',
								id:'testheatmap',
								coordinateSystem: 'geo',
								seriesIndex:1,
								geoIndex: 0,
								data: cusdata,
								blurSize: 10,
								pointSize: 8
							}
						],
				});
			})		
		 }

		/*
		  渲染扩大后的热力图（注意：复制多份是为了解决，左侧菜单栏扩大缩小后重新渲染echarts
		 dateType:1：日、2：月、4：周
		*/
		function showhot_max(date_data,dateType,echartID,grid_top,grid_left,grid_right,grid_bottom){
			 
			if(date_data.length > 0 && dateType==2){//月
				date_data = packDate(date_data,6);
			}else if(date_data.length > 0 && dateType==4){//周
				date_data = packDate(date_data,2);
			}
			
			//先遍历X轴取出每个日期
		    var date_new=[];
		    //最大值
	 	    var maxValue=0;
	        for(var i=0;i<date_data.length;i++){
	        	//截取日期到月
	        	var key=date_data[i].key;
	        	var dateValue=key.substring(0,4);
	        	 if(maxValue<(date_data[i].value*1)){
	  			    maxValue = (date_data[i].value*1);
					}
	        	date_new.push(dateValue);
	        }
	        //将年份的数组去重,并形成新的数组,此数组用于纵坐标的值
	        var axisnums=[];
	        for (var i = 0; i < date_new.length; i++) {
	      	     if(axisnums.indexOf(date_new[i])==-1){
	      	    	axisnums.push(date_new[i]);
	      	     }
	      	}
	        
	        //去重只剩下到月的日期组成新数组
	        var axisdata=[];
	        if(dateType == 1){//日粒度
	       		for(var i=1;i<13;i++){
	           		var xdata="";
	           		if(i==2){
	           			for(var j=1;j<30;j++){
	           				xdata=i+"-"+j;     
	           				axisdata.push(xdata);
	           			}
	           		}else if(i==1||i==3||i==5||i==7||i==8||i==10||i==12){
						for(var j=1;j<32;j++){
							xdata=i+"-"+j;  
							axisdata.push(xdata);
						           			}
	           		}else{
	           			for(var j=1;j<31;j++){
	           				xdata=i+"-"+j; 
	           				axisdata.push(xdata);
	           			}
	           		}
	           	}
	       	}else if(dateType == 2){//月粒度
	       		axisdata = [1,2,3,4,5,6,7,8,9,10,11,12];
	       	}else if(dateType == 4){//周粒度
	       		axisdata = [1,2,3,4,5,6,7,8,9,10,
	       					11,12,13,14,15,16,17,18,19,20,
	       					21,22,23,24,25,26,27,28,29,30,
	       					31,32,33,34,35,36,37,38,39,40,
	       					41,42,43,44,45,46,47,48,49,50,
	       					51,52,53
	       					];
	       	}
	       	//x/y/值
	       	var data=[];
	        //获取zeo在在x轴数组中对应的的索引值
	       	var index;
			for(var i=0;i<date_data.length;i++){
	       		var ydata=date_data[i].key;//年月日/年月/年周
	       		var dataHb=ydata.substring(0,4);//年
	       		var zeo="";
	       		if(dateType == 1){//日粒度
	       			//每一个小数组
	           		var dataYz=ydata.substring(4,8);//月日
	           		var fst=dataYz.substr(0,1);//月第一位
	           		var sec=dataYz.substr(1,1);//月第二位
	           		var thi=dataYz.substr(2,1);//日第一位
	           		var fiv=dataYz.substr(3,4);//日第二位
	           		
	           		if(fst=="0"&&thi=="0"){//02 04 -->2-4
	           			zeo=sec+"-"+fiv;
	           		}else if(fst=="0"&&thi!="0"){//01 12 --> 1-12
	           			zeo=sec+"-"+thi+fiv;
	           		}else if(fst!="0"&&thi=="0"){//12 08 --> 12-8
	           			zeo=fst+sec+"-"+fiv;
	           		}else if(fst!="0"&&thi!="0"){//12 11 -->12-11
	           			zeo=fst+sec+"-"+thi+fiv;
	           		}
	           		index = axisdata.indexOf(zeo);//获取zeo在在x轴数组中对应的的索引值
	       		}else if(dateType == 2){//月
	       			var month = ydata.substring(4,6);//月份
	       			//将0去掉
	       			month = month.replace(/\b(0+)/gi,"");
	       			//根据月份值获取对应的索引
	       			index = axisdata.indexOf(parseInt(month));
	       		}else if(dateType == 4){
	       			var week = ydata.split("-")[1];//周
	       			index = axisdata.indexOf(parseInt(week));
	       		}
	       		//封装三维数组
	       		for(var j=0;j<axisnums.length;j++){
	       			var schildVal=[];
	       			if(dataHb==axisnums[j]){
	       				schildVal.push(index,j,date_data[i].value);
	           			data.push(schildVal);
	       			}
	       		}
	       	}
			//var axisnums = ['2017', '2018'];，
			//var axisdata = ['1-1','1-2','1-3','1-4','1-5','1-6','1-7','1-8','1-9','1-10','1-11','1-12','1-13','1-14','1-15','1-16','1-17','1-18','1-19','1-20','1-21','1-22','1-23','1-24','1-25','1-26','1-27','1-28','1-29','1-30','2-1','2-2','2-3','2-4','2-5','2-6','2-7','2-8','2-9','2-10','2-11','2-12','2-13','2-14','2-15','2-16','2-17','2-18','2-19','2-20','2-21','2-22','2-23','2-24','2-25','2-26','2-27','2-28','2-29','2-30'];
		    //var data = [ [ 0, 0, 5 ], [ 1, 0, 1 ], [ 2, 0, 0 ], [ 3, 0, 0 ], [ 4, 0, 0 ], [ 5, 0, 0 ], [ 6, 0, 0 ], [ 7, 0, 0 ], [ 8, 0, 0 ], [ 9, 0, 0 ], [ 10, 0, 0 ], [ 11, 0, 2 ], [ 12, 0, 4 ], [ 13, 0, 1 ], [ 14, 0, 1 ], [ 15, 0, 3 ], [ 16, 0, 4 ], [ 17, 0, 6 ], [ 18, 0, 4 ], [ 19, 0, 4 ], [ 20, 0, 3 ], [ 21, 0, 3 ], [ 22, 0, 2 ], [ 23, 0, 5 ], [ 24, 0, 5 ], [ 25, 0, 5 ], [ 26, 0, 5 ], [ 27, 0, 5 ], [ 28, 0, 5 ], [ 29, 0, 5 ], [ 30, 0, 5 ], [ 31, 0, 5 ], [ 32, 0, 5 ], [ 33, 0, 5 ], [ 34, 0, 5 ], [ 35, 0, 5 ], [ 36, 0, 5 ], [ 37, 0, 5 ], [ 38, 0, 5 ], [ 39, 0, 5 ], [ 40, 0, 5 ], [ 41, 0, 5 ], [ 42, 0, 5 ], [ 43, 0, 5 ], [ 44, 0, 5 ], [ 45, 0, 5 ], [ 46, 0, 5 ], [ 47, 0, 5 ], [ 48, 0, 5 ], [ 49, 0, 5 ], [ 50, 0, 5 ], [ 51, 0, 5 ], [ 52, 0, 5 ], [ 53, 0, 5 ], [ 54, 0, 5 ], [ 55, 0, 5 ], [ 56, 0, 5 ], [ 57, 0, 5 ], [ 58, 0, 5 ], [ 59, 0, 5 ], [ 60, 0, 5 ], [ 0, 1, 7 ], [ 1, 1, 0 ], [ 2, 1, 0 ], [ 3, 1, 0 ], [ 4, 1, 0 ], [ 5, 1, 0 ], [ 6, 1, 0 ], [ 7, 1, 0 ], [ 8, 1, 0 ], [ 9, 1, 0 ], [ 10, 1, 5 ], [ 11, 1, 2 ], [ 12, 1, 2 ], [ 13, 1, 6 ], [ 14, 1, 9 ], [ 15, 1, 11 ], [ 16, 1, 6 ], [ 17, 1, 7 ], [ 18, 1, 8 ], [ 19, 1, 12 ], [ 20, 1, 5 ], [ 21, 1, 5 ], [ 22, 1, 7 ], [ 23, 1, 2 ], [ 24, 1, 5 ], [ 25, 1, 5 ], [ 26, 1, 5 ], [ 27, 1, 5 ], [ 28, 1, 5 ], [ 29, 1, 5 ], [ 30, 1, 5 ], [ 31, 0, 5 ], [ 32, 0, 5 ], [ 33, 0, 5 ], [ 34, 0, 5 ], [ 35, 0, 5 ], [ 36, 0, 5 ], [ 37, 0, 5 ], [ 38, 0, 5 ], [ 39, 0, 5 ], [ 40, 0, 5 ], [ 41, 0, 5 ], [ 42, 0, 5 ], [ 43, 0, 5 ], [ 44, 0, 5 ], [ 45, 0, 5 ], [ 46, 0, 5 ], [ 47, 0, 5 ], [ 48, 0, 5 ], [ 49, 0, 5 ], [ 50, 0, 5 ], [ 51, 0, 5 ], [ 52, 0, 5 ], [ 53, 0, 5 ], [ 54, 0, 5 ], [ 55, 0, 5 ], [ 56, 0, 5 ], [ 57, 0, 5 ], [ 58, 0, 5 ], [ 59, 0, 5 ], [ 60, 0, 5 ] ];
			option = {
					backgroundColor: '#0e1529',
					tooltip: {
						show: true,
						formatter: function (params) {
					             return axisnums[params.value[1]] +'-'+ axisdata[params.value[0]]+" : "  +params.value[2] ;
					        }
					},
					toolbox: {
	    		        feature: {
	    		            saveAsImage: {}
	    		        }
	    		    }, 
					geo: [{
						map:'world',
						zoom: 1,
						roam: true,
						show:false,
						id:'geo1',
						itemStyle:{
							areaColor:'rgb(0,0,0,0)'
						},
						height:'100%',
						width:'100%'
					}],
					grid: {
						show: true,
						top:grid_top,
						left:grid_left,
						right:grid_right,
						bottom:grid_bottom,
						borderColor:'rgb(0,0,0,0)'
					}, 
					calculable: true,
					animation: false,
					xAxis: {
						type: 'category',
						axisTick:{
							interval:0
						},
						axisLine: {
				            lineStyle: {
				            	 color: '#F1F1F3'
				            }
				        },
						data:axisdata
					},
					yAxis: {
						type: 'category',
						axisLine: {
				            lineStyle: {
				            	 color: '#F1F1F3'
				            }
				        },
						data:axisnums
					},
					series: [
						{
							id:'test',
							name: "fs",
							type: 'heatmap',
							coordinateSystem: 'cartesian2d',
							data: data,
							gridIndex:0,
							gradientColors: ['blue', 'cyan', 'lime', 'yellow', 'red'],
							blurSize: 10,
							pointSize: 10,
							itemStyle: {
								show:true,
								color:'rgb(0,0,0,0)'
							}
						},
					]
				};
			    myChart_max = echarts.init(document.getElementById(echartID));
				myChart_max.clear();
				myChart_max.setOption(option);
				function convertToPx(dataitem){
					var newxy = myChart_max.convertToPixel({seriesId:'test'},dataitem);
					return newxy
				}
			
				function convertToGeo(dataitem){
					var pointobj = myChart_max.convertFromPixel({geoId:'geo1'},convertToPx(dataitem));
					var point = [pointobj[0],pointobj[1]];
					return point;
				}
				/*
				  将横向、纵向滚动条对应的数据封装为热力图所需数据
				*/
				function convertData(data,x_start,x_end,y_start,y_end){
					var convertedData = [];
					//横坐标对应的索引值范围
					x_start = Math.ceil(x_start);
					x_end = Math.ceil(x_end);
					//纵坐标对应的索引值范围
					y_start = Math.ceil(y_start);
					y_end = Math.ceil(y_end);
					
					for(var i = 0;i<data.length;i++){
					    
					    if (data[i][0] >= x_start && data[i][0] < x_end &&
					        data[i][1] >= y_start && data[i][1] < y_end){//将数组中所有符合规范的数据筛选出来
		    				var geoCoord = convertToGeo([data[i][0],data[i][1]]);
		    				geoCoord.push(data[i][2]);
		    				convertedData.push(geoCoord);
					    }
					    
					}
					return convertedData;
				}
				//默认将全部的数据转换为热力图数据
				var x_start = 0;
			    var x_end = axisdata.length
			    var y_start = 0;
			    var y_end = axisnums.length;
				var cusdata = convertData(data,x_start,x_end,y_start,y_end);
				//定时任务将echarts热力图数据重新渲染
			    setTimeout(function() {
					myChart_max.setOption({
						series: [
								{
									name: 'testheatmap',
									type: 'heatmap',
									id:'testheatmap',
									coordinateSystem: 'geo',
									seriesIndex:1,
									geoIndex: 0,
									data: cusdata,
									blurSize: 10,
									pointSize: 8
								},
							],
						visualMap: {
							show: false,
							min: 0,
					        max: maxValue,
							top: 'bottom',
							seriesIndex: 1,
							calculable: true,
							inRange: {
								//color: ["#e8192f","#d6664d","#B9044E","#f0ba2e","#d3ce2b","#169A7f","#0b6573","#1BB3c8"]
								color: ['blue', 'cyan', 'lime', 'yellow', 'red']
							}
						},
						dataZoom:[ 
						    {
					            xAxisIndex: 0,
					            filterMode: 'empty'
					        },
					        {
					            yAxisIndex: 0,
					            filterMode: 'empty'
					        }, 
					        {
					            id: 'dataZoomX',
					            type: 'slider',
					            xAxisIndex: [0],
					            filterMode: 'empty',
					            textStyle:{
					            	color:'white'
					            }
					        },
					        {
					            id: 'dataZoomY',
					            type: 'slider',
					            yAxisIndex: [0],
					            filterMode: 'empty',
					            textStyle:{
					            	color:'white'
					            }
					        }]
						});
				}, 500);
			//监听滚动条的事件
			myChart_max.on('dataZoom',function(params) {
			    if(params.dataZoomId== 'dataZoomX'){//"横坐标"
	                x_start = (axisdata.length)*params.start/100;
	                x_end = (axisdata.length)*params.end/100;
	            }else{ //"纵坐标"
	                y_start = (axisnums.length)*params.start/100;
	                y_end = (axisnums.length)*params.end/100;
	            }
	            cusdata = convertData(data,x_start,x_end,y_start,y_end);
			    myChart_max.setOption({
						series: [
							{
								name: 'testheatmap',
								type: 'heatmap',
								id:'testheatmap',
								coordinateSystem: 'geo',
								seriesIndex:1,
								geoIndex: 0,
								data: cusdata,
								blurSize: 10,
								pointSize: 8
							}
						],
				});
			})		
		}
    </script>
</html>