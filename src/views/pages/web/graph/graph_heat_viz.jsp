<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图谱实体地理热点展示</title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="shortcut icon" type="image/x-icon"
	href="<%=basePath%>/static/Visualization/base/ico.png" />
<link rel="stylesheet" href="<%=basePath%>/static/css/style.css">
<!--人工查询 -->
<link rel="stylesheet"
	href="<%=basePath %>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath %>/static//lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath %>/static/css/combo.select.css">
<link rel="stylesheet"
	href="<%=basePath %>/static/css/perfect-scrollbar.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/static/Visualization/base/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/static/Visualization/base/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/static/Visualization/base/base.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/static/Visualization/css/event_result.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/static/Visualization/js/amcharts/export/export.css" />
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
</c:if>
<style type="text/css">
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
<link rel="stylesheet"
	href="<%=basePath%>/static/Visualization/css/leaflet/leaflet.css"
	type="text/css" media="screen" />
<link rel="stylesheet"
	href="<%=basePath%>/static/Visualization/css/leaflet/dvf.css"
	type="text/css" media="screen" />
<link rel="stylesheet"
	href="<%=basePath%>/static/Visualization/css/leaflet/example.css"
	type="text/css" media="screen" />
<link rel="stylesheet"
	href="<%=basePath%>/static/Visualization/css/leaflet/ui.css"
	type="text/css" media="screen" />
<link rel="stylesheet"
	href="<%=basePath%>/static/Visualization/css/heatmap.css"
	type="text/css" media="screen" />
</head>
<body>
	<div class="index_top clearfix">
		<h3 class="fl title">图谱库分析 > 热点显示</h3>
	</div>
	<div class="index_bottom">
		<!-- 显示图 -->
		<div class="data show">
		<input type="hidden" id="moduleCode" value="${moduleCode}">
			<div class="row">
				<div class="col-md-12 mg_t">
					<h3 class="tx-c mapText">热力图展示
						<div  class="help" onmouseover="showChartInfo(1,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
					</h3>
		            <div class="bor">
		                <div id="map" class="myleafletjsMap"></div>
		                <div id="info">
		                    <div class="col-md-12 text-center black">
		                        <h4>Heat Range</h4>
		                    </div>
		                    <div class="col-md-12">
		                        <div class="col-md-2" style="background: mediumpurple;height: 5px;"></div>
		                        <div class="col-md-2" style="background: limegreen;height: 5px;"></div>
		                        <div class="col-md-4" style="background: orange;height: 5px;"></div>
		                        <div class="col-md-2" style="background: orangered;height: 5px;"></div>
		                        <div class="col-md-2" style="background: red;height: 5px;"></div>
		                    </div>
		                    <div class="col-md-12">
		                        <div class="col-md-6 text-left black"><h6>Low</h6></div>
		                        <div class="col-md-6 text-right black"><h6>High</h6></div>
		                    </div>
		                </div>
		            </div>
	            </div>
			
			
				<!-- <h3 class="tx-c">热点地理展示</h3> -->
				<!-- <div class="mg_t" style="margin-left:-15px;margin-top:-15p;">
					<div class="col-md-10" style="width:100%;">
						<div class="col-md-12" style="margin-top:-10px;">
							<div id="map" style="width: 100%; height: 437px"></div>
							<div id="info">
								<div class="col-md-12 text-center black">
									<h4>Heat Range</h4>
								</div>
								<div class="col-md-12">
									<div class="col-md-2"
										style="background: mediumpurple; height: 5px;"></div>
									<div class="col-md-2"
										style="background: limegreen; height: 5px;"></div>
									<div class="col-md-4" style="background: orange; height: 5px;"></div>
									<div class="col-md-2"
										style="background: orangered; height: 5px;"></div>
									<div class="col-md-2" style="background: red; height: 5px;"></div>
								</div>
								<div class="col-md-12">
									<div class="col-md-6 text-left black">
										<h6>Low</h6>
									</div>
									<div class="col-md-6 text-right black">
										<h6>High</h6>
									</div>
								</div>
							</div>
						</div>
					</div>
			</div> -->
		</div>
		
		<div class="row">
			<div class="col-md-12 mg_t">
                <div class="col-md-12 map-text">
                    <h3 class="tx-c mapText_heat">热点国家展示
                    	<div  class="help" onmouseover="showChartInfo(2,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
                    </h3>
                </div>
                <div class="bor">
                    <div id="heat_map" class="ammap myAmchartMap" ></div>
                </div>
	        </div>
        </div>
        
        <div class="row">
			<div class="col-md-12 mg_t">
                <div class="col-md-12 map-text">
                    <h3 class="tx-c mapText_heat">热点城市展示
                    	<div  class="help" onmouseover="showChartInfo(3,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
                    </h3>
                </div>
                <div class="bor">
                    <div id="bubble_map" class="ammap myAmchartMap" ></div>
                    <%-- <div class="heatTl">
	                    <div>
                        	<span id="heatMinVlaue"></span>
                        	<img src="<%=basePath %>/static/images/heatTl2.png">
                        	<span id="heatMaxVlaue"></span>
                        </div>
		             </div> --%>
                </div>
	        </div>
        </div>
	        
	        
		<!-- <div class="row" >
			<div class="col-md-12 mg_t ">	
				<div class="col-md-10"style="width:100%;border: 1px solid #CCCCCC;border-radius:5px; float:left;height:437px"">
					<div class="col-md-12 map-text"style="opacity:1;">
						<h1 class="zz1" style="font-size:14px;">热点国家展示</h1>
					</div>
					<div class="col-md-12" style="height:335px;">
						<div id="heat_map" class="ammap" style="height:340px;"></div>
					</div>
				</div>
			</div>
		</div> -->
		<!-- <div class="row">
			<div class="col-md-12 mg_t ">
				<div class="col-md-10" style="width:100%;height:437px;border: 1px solid #CCCCCC;float:right;border-radius:3px;">
					<div class="col-md-12 map-text"style="opacity:1;">
						<h1 class="zz1" style="font-size:14px;">热点城市展示</h1>
					</div>
					<div class="col-md-12"  style="height:335px;">
						<div id="bubble_map" class="ammap" style="height:340px;"></div>
					</div>
				</div>
			</div>
		</div> -->
		<div class="row" >
			<div class="col-md-12 mg_t ">
				<div class="col-md-10"style="border: 1px solid #CCCCCC;border-radius:3px;width:100%;">
					<div class="col-md-5 chart-text" id="column_chart_text" style="opacity:1;margin-top:0px;float:initial;width: 100%;text-align: center;">
						<h3 class="tx-c">热点国家统计
							<select class="selectCounts" style="margin-left:10px;" id="selectCountry2"></select>
							<div  class="help" onmouseover="showChartInfo(4,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
						</h3>
					</div>
					<div class="col-md-7" style="width:100%;">
						<div id="column_chart" class="amcharts oneColumChart"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="row" id="charts_area">
				<div class="col-md-12 mg_b mg_t">
					<div id="chart-content">
						<div class="col-md-6 bor w50l">
							<h3 class="tx-l">热点国家统计
								<select class="selectCounts" style="margin-left:10px;" id="selectCountry1"></select>
								<div  class="help" onmouseover="showChartInfo(5,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
							</h3>
							<div id="radar_chart" class="amcharts twoCharts"></div>
						</div>
						<div class="col-md-6 bor w50r">
							<h3 class="tx-l" id="graph_base_text">热点城市统计
								<select class="selectCounts" style="margin-left:10px;" id="selectCity"></select>
								<div  class="help" onmouseover="showChartInfo(6,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
							</h3>
							<div id="pie_chart" class="amcharts twoCharts"></div>
						</div>
					</div>
				</div>
		</div>
		<!-- <div class="row" >
				 <div class="col-md-12 mg_b mg_t">
				<div class="col-md-10" style="border: 1px solid #CCCCCC;  border-radius:3px; width:49.5%; float:left;margin-bottom:70px;">
					<div class="col-md-5 chart-text" id="radar_chart_text"style="opacity:1;margin-top:0px;float:initial;width: 50%;">
							<h1 style="font-size:14px;margin-left:-15px;">热点国家统计
								<select class="selectCounts" style="margin-left:10px;" id="selectCountry1"></select>
							</h1>
					</div>
					<div class="col-md-7"  style="width:100%;">
						<div id="radar_chart" class="amcharts"></div>
					</div>
				</div>
				<div class="col-md-10" style="border: 1px solid #CCCCCC;border-radius:3px;width:49.5%; float:right;margin-bottom:70px;">
					<div class="col-md-5 chart-text" id="pie_chart_text"style="opacity:1;margin-top:0px;width: 50%;">
						<h1 style="font-size:14px;margin-left:-15px;">热点城市统计
							<select class="selectCounts" style="margin-left:10px;" id="selectCity"></select>
						</h1>
					</div>
					<div class="col-md-7"  style="width:100%;">
						<div id="pie_chart" class="amcharts"></div>
					</div>
				</div>
			</div>
		</div> -->
		</div>
	</div>
		<!-- 显示表格结束 -->
		<!-- 页面底部收缩 -->
		<jsp:include page="graph_tab2.jsp"></jsp:include>
		<!-- 页面底部收缩结束 -->
		<jsp:include page="../updateUserPassword.jsp"/>
</body>
<script type="text/javascript"
	src="<%=basePath%>/static/Visualization/base/js/jquery-1.11.1.min.js"></script>

<!-- 人工查询功能的日期 -->
<script src="<%=basePath %>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-select.min.js"></script>
<script src="<%=basePath %>/static/js/jquery.combo.select.js"></script>
<script src="<%=basePath %>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath %>/static/js/perfect-scrollbar.js"></script>

<script src="<%=basePath %>/static/js/config/config.js"></script>
<script src="<%=basePath%>/static/js/sec2.js"></script>
<script src="<%=basePath%>/static/lib/jquery.pagination.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/static/Visualization/base/base.js"></script>

<script src="<%=basePath%>/static/Visualization/js/amcharts/amcharts.js"
	type="text/javascript"></script>
<script
	src="<%=basePath%>/static/Visualization/js/amcharts/themes/light.js"
	type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amchart_util.js"
	type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/ammap.js"
	type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/ammap_util.js"
	type="text/javascript"></script>
<script
	src="<%=basePath%>/static/Visualization/js/amcharts/export/export.js"
	type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/serial.js"
	type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/pie.js"
	type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/radar.js"
	type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/worldLow.js"
	type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/leaflet/leaflet.js"
	type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/leaflet/heatmap.js"
	type="text/javascript"></script>
<script
	src="<%=basePath%>/static/Visualization/js/leaflet/leaflet-heatmap.js"
	type="text/javascript"></script>
<script
	src="<%=basePath%>/static/Visualization/js/leaflet/tile.stamen.js"
	type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/datamap/d3.min.js"
	type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
<c:if test="${bgFlag == null or bgFlag == 1}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
</c:if>
<!-- 计算显示图的高度 -->	
<script src="<%=basePath%>/static/js/chartHeight.js" type="text/javascript"></script>
<!-- 人工查询js -->
<script src="<%=basePath %>/static/Visualization/rgQuery.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/downLoad.js"></script>
<script src="<%=basePath%>/static/js/map-tileLayer.js"	type="text/javascript"></script>	
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<script type="text/javascript">
	$(function(){
		/* //美化滚动条
    	index_bottom_perfectScrollbar(); */
		//处理配置
		handleConfigs();
		//控制Tone字段的显示问题
		gkgToneIsShow();
		//美化滚动条
		glorifyComboSelect();
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
		//地图
		var map = L.map('map');
		var corner1 = L.latLng(-60, -180),
	 	corner2 = L.latLng(90, 180),
	 	bounds = L.latLngBounds(corner1, corner2);
	 	map.setMaxBounds(bounds);
	    var baseLayer = getOSMBrightLayer().addTo(map);
	    var heatmapLayer = null;
		function render(configId){
			var resultcode = 'ALL';
			startLoad();
			$.ajax({
					url:'<%=basePath%>/search/graph_heat_viz/'+configId,
					type: 'POST',
					dataType:"json",
				success:function(data){
					if(data=="-1"){
						endLoad();
						win.alertEx("加载失败");
					}
					renderData(data);
					endLoad();
				}
			});
		}
		function renderData(data){
			var country_data=data.country_dic;
			var city_data=data.city_dic;
			var location_data =data.location_dic;
			//处理大地图中心位置
			if(location_data.data.length == 0){
				map.setView([ 37.8, 113.7 ], 4);
			}else{
				map.setView([location_data.data[0].lat,location_data.data[0].lng],4);
			}
			if(country_data.length>0){
				$("#selectCountry2").show();
				$("#selectCountry2").html(""); 
		        var countryNum = country_data.length > 20 ? 20:country_data.length;
		        /* if(countryNum==1 && country_data[0].value != 0){
					document.getElementById("selectCountry2").options.add(new Option("1","1"));
				} */
		        for(var i=5;i<=countryNum;i+=5){
		        	document.getElementById("selectCountry2").options.add(new Option(i,i));
		        }
		        var Country2OptionCount = $("#selectCountry2 option").map(function(){return $(this).val();}).get().join(", ");
				if(Country2OptionCount.indexOf(10)!=-1){
					$("#selectCountry2 option[value='10']").attr("selected",true);
					process_dic_to_amchart1(country_data,'column_chart','column_chart',10);
				}else{
					$("#selectCountry2").hide();
					process_dic_to_amchart1(country_data,'column_chart','column_chart');
				}
				
				$("#selectCountry2").change(function () {
		        	var changeValue = $("#selectCountry2 option:selected").val();
		        		process_dic_to_amchart1(country_data,'column_chart','column_chart',changeValue);
		        });
			}else{
				$("#selectCountry2").hide();
				$("#column_chart").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
			}
			if(country_data.length>0){
				$("#selectCountry1").show();
				$("#selectCountry1").html(""); 
				/* if(countryNum==1 && country_data[0].value != 0){
					document.getElementById("selectCountry1").options.add(new Option("1","1"));
				} */
		        for(var i=3;i<=countryNum;i+=3){
		        	document.getElementById("selectCountry1").options.add(new Option(i,i));
		        }
		        var cityOptionCount = $("#selectCountry1 option").map(function(){return $(this).val();}).get().join(", ");
				if(cityOptionCount.indexOf(6)!=-1){
					$("#selectCountry1 option[value='6']").attr("selected",true);
					process_dic_to_amchart(country_data,'radar_chart','radar_chart',6);
				}else{
					$("#selectCountry1").hide();
		        	process_dic_to_amchart(country_data,'radar_chart','radar_chart',countryNum);
				}
		        $("#selectCountry1").change(function () {
		        	var changeValue = $("#selectCountry1 option:selected").val();
		        		process_dic_to_amchart(country_data,'radar_chart','radar_chart',changeValue);
		        });
		        process_dic_to_heatmap(country_data,'heat_map');
			}else{
				process_dic_to_heatmap(country_data,'heat_map');
				$("#selectCountry1").hide();
				$("#radar_chart").html('<img alt="" class="tubiao2"  src="<%=basePath %>/static/images/tubiao2.png">');
			}
	        
			//处理城市热点图例
	        if(city_data.length>0){
	        	$("#selectCity").show();
		        $("#selectCity").html(""); 
		        var cityNum = city_data.length > 20 ? 20:city_data.length;
		        /* if(cityNum==1 && city_data[0].value != 0){
					document.getElementById("selectCity").options.add(new Option("1","1"));
				} */
		        for(var i=2;i<=cityNum;i+=2){
		        	document.getElementById("selectCity").options.add(new Option(i,i));
		        }
		        var cityOptionCount = $("#selectCity option").map(function(){return $(this).val();}).get().join(", ");
				if(cityOptionCount.indexOf(8)!=-1){
					$("#selectCity option[value='8']").attr("selected",true);
					process_dic_to_amchart(city_data,'pie_chart','pie_chart',8);
				}else{
					$("#selectCity").hide();
					process_dic_to_amchart(city_data,'pie_chart','pie_chart',cityNum);
				}
		        
		        $("#selectCity").change(function () {
		        	var changeValue = $("#selectCity option:selected").val();
		        		process_dic_to_amchart(city_data,'pie_chart','pie_chart',changeValue);
		        });
		        process_dic_to_bubblemap2(city_data,'bubble_map');
	        }else{
	        	process_dic_to_bubblemap2(city_data,'bubble_map');
	        	$("#selectCity").hide();
	        	$("#pie_chart").html('<img alt="" class="tubiao2"  src="<%=basePath %>/static/images/tubiao2.png">');
	        }
	        
			if(heatmapLayer != null){
				map.removeLayer(heatmapLayer);
			}
	        //事件热点图
	        if(!$.isEmptyObject(location_data)){
	        	var cfg = {			     
	      	          "radius": 2,
	      	          "maxOpacity": 0.8,
	      	          "scaleRadius": true,
	      	          "useLocalExtrema": true,			        
	      	          latField: 'lat',			         
	      	          lngField: 'lng',
	      	          valueField: 'count'
	      	        };
	      	        heatmapLayer = new HeatmapOverlay(cfg);
	      	        heatmapLayer.setData(location_data);
	      	        map.addLayer(heatmapLayer); 
	        }else{
	        	var cfg = {			     
		      	          "radius": 2,
		      	          "maxOpacity": 0.8,
		      	          "scaleRadius": true,
		      	          "useLocalExtrema": true,			        
		      	          latField: 'lat',			         
		      	          lngField: 'lng',
		      	          valueField: 'count'
		      	        };
	        }
		}
    </script>
</html>