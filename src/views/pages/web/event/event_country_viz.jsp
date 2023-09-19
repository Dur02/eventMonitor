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
<title>事件国家状态展示</title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/style.css">
<!-- 人工查询日期 -->
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath%>/static/lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/combo.select.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath%>/static/lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/combo.select.css">
<!--引入页面下边的条件查询的展示tab  -->
<link rel="stylesheet" href="<%=basePath%>/static/css/perfect-scrollbar.css" />
<!--引入页面下边的条件查询的展示tab  -->
<link rel="shortcut icon" type="image/x-icon" href="<%=basePath%>/static/Visualization/base/ico.png" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/base.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/css/event_result.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/js/amcharts/export/export.css" />
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/leaflet.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/dvf.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/example.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/ui.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/countrymap.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window.css"/><!-- 弹出提示框样式 -->
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
<style>
	/*调整提示弹出框的样式*/
	.window-panel .title {
		width: 36%;
	}
	.window-panel .content {
		line-height: 37px;
	}
	.table td{
		border-right: 1px solid #ddd;
	}
</style>
</head>
<body>
	<div class="index_top clearfix">
		<h3 class="fl title">事件库分析 > 国家状态展示</h3>
		<!-- <div class="title_r fr">
			<span class="export_img_2" title="图表切换"></span> <span
				class="info_img"></span>
			<ul class="info_box">
				<li><span>数据：</span>事件数据库</li>
				<li><span>描述：</span>反映一段时间内，某地发生的事件的对比情况</li>
				<li><span>输入：</span>对比信息，事件编码，阈值信息</li>
				<li><span>介绍：</span>ttajkasdasdfa asdfasdf
					asdfa啊发生的发生地阿打法的疯狂拉升地方案的发生发生的法律看见俺十分啊发生的发生地发沙发</li>
			</ul>
		</div> -->
	</div>
	<div class="index_bottom">
		<div class="data show">
			<div class="row">
			
				<div class="col-md-12 mg_t">
					<h3 class="tx-c mapText">国家事件-稳定时间线
						<div  class="help" onmouseover="showChartInfo(1,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
					</h3>
		            <div class="bor">
		                <div id="map" class="myleafletjsMap"></div>
		                <div id="legend"></div>
		            </div>
	            </div>
				<!-- <div class="col-md-12 bar">
					<div style="text-align:center;"><h3>国家事件-稳定时间线</h3></div>
					<div id="map"></div>
					<div id="legend"></div>
				</div> -->
			</div>
			<div class="row" id="charts_area">
				<div class="col-md-12 mg_b mg_t">
					<div id="chart-content">
					<input type="hidden" id="moduleCode" value="${moduleCode}">
						<div class="col-md-6 w50l bor">
							<h3 id="graph_event_text">国家事件数展示
								<select class="selectCounts" style="margin-left:10px;" id="selectCountryEvent">
	                        	</select>
	                        	<div  class="help" onmouseover="showChartInfo(2,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
							</h3>
							<div id="graph_event" class="amcharts"></div>
						</div>
						<div class="col-md-6 w50r bor">
							<h3 id="graph_scale_text">国家稳定度展示
								<select class="selectCounts" style="margin-left:10px;" id="selectCountryScale">
	                        	</select>
	                        	<div  class="help" onmouseover="showChartInfo(3,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
							</h3>
							<div id="graph_scale" class="amcharts"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%-- <div class="data2">
			<table class="table">
				<thead>
					<tr>
						<th>序号</th>
						<th>排序</th>
						<th>挂起</th>
						<th>事件名称</th>
						<th>事件分类</th>
						<th>创建人</th>
						<th>创建日期</th>
						<th>备注信息</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td><span class="sort sort1">1</span></td>
						<td><img class="gq" src="<%=basePath%>/static/images/gq.png"
							alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state1.png" /></td>
						<td><img class="set"
							src="<%=basePath%>/static/images/set.png" /> <img class="del"
							src="<%=basePath%>/static/images/del.png" /></td>
					</tr>
					<tr>
						<td>2</td>
						<td><span class="sort sort2">2</span></td>
						<td><img class="gq" src="<%=basePath%>/static/images/gq.png"
							alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state1.png" /></td>
						<td><img class="set"
							src="<%=basePath%>/static/images/set.png" /> <img class="del"
							src="<%=basePath%>/static/images/del.png" /></td>
					</tr>
					<tr>
						<td>3</td>
						<td><span class="sort sort3">3</span></td>
						<td><img class="gq" src="<%=basePath%>/static/images/gq.png"
							alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state1.png" /></td>
						<td><img class="set"
							src="<%=basePath%>/static/images/set.png" /> <img class="del"
							src="<%=basePath%>/static/images/del.png" /></td>
					</tr>
					<tr>
						<td>3</td>
						<td><span class="sort sort7">4</span></td>
						<td><img class="gq" src="<%=basePath%>/static/images/gq.png"
							alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state1.png" /></td>
						<td><img class="set"
							src="<%=basePath%>/static/images/set.png" /> <img class="del"
							src="<%=basePath%>/static/images/del.png" /></td>
					</tr>
					<tr>
						<td>5</td>
						<td><span class="sort sort7">5</span></td>
						<td><img class="gq" src="<%=basePath%>/static/images/gq.png"
							alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state1.png" /></td>
						<td><img class="set"
							src="<%=basePath%>/static/images/set.png" /> <img class="del"
							src="<%=basePath%>/static/images/del.png" /></td>
					</tr>
					<tr>
						<td>6</td>
						<td><span class="sort sort7">6</span></td>
						<td><img class="gq" src="<%=basePath%>/static/images/gq.png"
							alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state1.png" /></td>
						<td><img class="set"
							src="<%=basePath%>/static/images/set.png" /> <img class="del"
							src="<%=basePath%>/static/images/del.png" /></td>
					</tr>
					<tr>
						<td>7</td>
						<td><span class="sort sort7">7</span></td>
						<td><img class="gq" src="<%=basePath%>/static/images/gq.png"
							alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state1.png" /></td>
						<td><img class="set"
							src="<%=basePath%>/static/images/set.png" /> <img class="del"
							src="<%=basePath%>/static/images/del.png" /></td>
					</tr>
					<tr>
						<td>8</td>
						<td><span class="sort sort7">8</span></td>
						<td><img class="gq" src="<%=basePath%>/static/images/gq.png"
							alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state1.png" /></td>
						<td><img class="set"
							src="<%=basePath%>/static/images/set.png" /> <img class="del"
							src="<%=basePath%>/static/images/del.png" /></td>
					</tr>
					<tr>
						<td>9</td>
						<td><span class="sort sort7">9</span></td>
						<td><img class="gq" src="<%=basePath%>/static/images/gq.png"
							alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state1.png" /></td>
						<td><img class="set"
							src="<%=basePath%>/static/images/set.png" /> <img class="del"
							src="<%=basePath%>/static/images/del.png" /></td>
					</tr>
					<tr>
						<td>10</td>
						<td><span class="sort">10</span></td>
						<td></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state2.png" /></td>
						<td><img class="set"
							src="<%=basePath%>/static/images/set.png" /> <img class="del"
							src="<%=basePath%>/static/images/del.png" /></td>
					</tr>
					<tr>
						<td>11</td>
						<td><span class="sort sort10">11</span></td>
						<td><img class="gq"
							src="<%=basePath%>/static/images/gq2.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state1.png" /></td>
						<td><img class="set"
							src="<%=basePath%>/static/images/set.png" /> <img class="del"
							src="<%=basePath%>/static/images/del.png" /></td>
					</tr>
					<tr>
						<td>12</td>
						<td><span class="sort">12</span></td>
						<td>
							<!-- <img class="gq" src="../<%=basePath%>/static/images/gq.png" alt="挂起"> -->
						</td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state3.png" /></td>
						<td><img class="set"
							src="<%=basePath%>/static/images/set.png" /> <img class="del"
							src="<%=basePath%>/static/images/del.png" /></td>
					</tr>
				</tbody>
			</table>
			<div id="Pagination" class="pagination">
				<!-- 这里显示分页 -->
			</div>
			<div id="Searchresult">分页初始化完成后这里的内容会被替换。</div>
		</div> --%>
		<!-- 条件tab页 st -->
		<jsp:include page="event_tab2.jsp"></jsp:include>
	</div>
	<jsp:include page="../updateUserPassword.jsp"/>
</body>
<!-- 人工查询日期 -->
<script src="<%=basePath%>/static/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>/static/lib/jquery.pagination.js"></script>
<script src="<%=basePath%>/static/js/bootstrap-datepicker.min.js"></script>
<!-- js有差别的，这个页面没有的，其他页面有，可能会出问题 -->
<script src="<%=basePath%>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<!-- js有差别的，这个页面没有的，其他页面有，可能会出问题 -->
<script src="<%=basePath%>/static/js/bootstrap-select.min.js"></script>
<!-- js有差别的，这个页面没有的，其他页面有，可能会出问题 -->
<script src="<%=basePath%>/static/js/jquery.combo.select.js"></script>
<!-- js有差别的，这个页面没有的，其他页面有，可能会出问题 -->
<script src="<%=basePath%>/static/js/jquery.mousewheel.js"></script>
<!-- js有差别的，这个页面没有的，其他页面有，可能会出问题 -->
<script src="<%=basePath%>/static/js/perfect-scrollbar.js"></script>
<!-- js有差别的，这个页面没有的，其他页面有，可能会出问题 -->
<script src="<%=basePath%>/static/js/sec2.js"></script>

<%-- <script type="text/javascript" src="<%=basePath %>/static/Visualization/base/js/jquery-1.11.1.min.js"></script> --%>
<script type="text/javascript"
	src="<%=basePath%>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/static/Visualization/base/base.js"></script>
<script
	src="<%=basePath%>/static/Visualization/js/amcharts/amcharts.js"
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
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/leaflet.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/tile.stamen.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/static/Visualization/js/leaflet/javascript.util.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/static/Visualization/js/leaflet/jsts.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/geohash.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/underscore-min.js"></script>
<!-- js有差别的，这个页面没有的，其他页面有，可能会出问题 -->
<script type="text/javascript"
	src="<%=basePath%>/static/Visualization/js/leaflet/leaflet-dvf.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/static/Visualization/js/leaflet/countryData.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/leaflet.dvf.experimental.js"></script>
<!-- js有差别的，这个页面没有的，其他页面有，可能会出问题 -->
<script src="<%=basePath%>/static/Visualization/datamap/d3.min.js"></script>
<!-- js有差别的，这个页面没有的，其他页面有，可能会出问题 -->
<script src="<%=basePath%>/static/Visualization/js/amcharts/serial.js"
	type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/pie.js"
	type="text/javascript"></script>
<!-- js有差别的，这个页面没有的，其他页面有，可能会出问题 -->
<script src="<%=basePath%>/static/js/config/config.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
<c:if test="${bgFlag == null or bgFlag == 1}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
</c:if>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/downLoad.js"></script>
<script src="<%=basePath%>/static/js/map-tileLayer.js"	type="text/javascript"></script>
<!-- 人工查询js -->
<script src="<%=basePath %>/static/Visualization/rgQuery.js"></script>
<!-- 计算显示图的高度 -->	
<script src="<%=basePath%>/static/js/chartHeight.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<script type="text/javascript">

$(function(){
	/* //美化图表展示界面的右侧滚动条
	index_bottom_perfectScrollbar(); */
	//处理配置
	handleConfigs();
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
	var baseLayer = getOSMBrightLayer();
	var map = L.map('map', {
		layers: [baseLayer]
	});
	
	var baseMaps = {
	    "Stamen Toner": baseLayer
	};
	
	var corner1 = L.latLng(-60, -180),
 	corner2 = L.latLng(90, 180),
 	bounds = L.latLngBounds(corner1, corner2);
 	map.setMaxBounds(bounds);
	var controlLayer  = null;
 	 function render(configId){
 		startLoad();
			$.ajax({
				url:'<%=basePath%>/search/event_country_viz/'+configId,
				type: 'POST',
				dataType:"json",
				async:false,
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
		//不同配置之间切换时需要将
		if (controlLayer != null) {
			//把上一个对应的配置添加到地图的图层移除
        	 map.removeLayer(EventLayer);
		     map.removeLayer(EventBarChart);
		     map.removeLayer(ScaleLayer);
		     map.removeLayer(ScaleBarChart);
		     //把控制图层移除
        	 map.removeControl(controlLayer);
        }
		
		//数据
		var date_dic = data.Date_list;//时间线
		var event_dic = data.Country_dic;
		var scale_dic = data.Country_dic2;
		var max_sum = data.max_sum;//总事件数
        var max_date_sum = data.max_date_sum;//最大一天的总事件数
        var max_scale = data.max_scale;//总稳定数
        var max_date_scale = data.max_date_scale;//最大一天的总稳定数
        
		var country_event_rank = data.country_rank1;
		var country_scale_rank = data.country_rank2;
		if(event_dic.length==0){
			 map.setView([ 37.8, 113.7 ], 4);
		 }else{
			 map.setView([ 47.8, 0 ], 2);
		 }
		//柱状图
		if(country_event_rank.length>0){
			$("#selectCountryEvent").show();
			$("#selectCountryEvent").html(""); 
			var eventNum = country_event_rank.length > 20 ? 20:country_event_rank.length;
			for(var i=5;i<=eventNum;i+=5){
				document.getElementById("selectCountryEvent").options.add(new Option(i,i));
			}
			var	countryOptionCount = $("#selectCountryEvent option").map(function(){return $(this).val();}).get().join(", ");
			if(countryOptionCount.indexOf(10)!=-1){
				$("#selectCountryEvent option[value='10']").attr("selected",true);
				process_dic_to_amchart(country_event_rank.slice(0,10),'column_chart','graph_event');
			}else{
				$("#selectCountryEvent").hide();
				process_dic_to_amchart(country_event_rank.slice(0,eventNum),'column_chart','graph_event');
			}
			
			$("#selectCountryEvent").change(function () {
	        	var changeValue = $("#selectCountryEvent option:selected").val();
	        	process_dic_to_amchart(country_event_rank.slice(0,changeValue),'column_chart','graph_event',changeValue);
        		//column_chart('graph_event',{category:'key',value:'value'},country_event_rank.slice(0,changeValue));
	        	
	        });
		}else{
			$("#selectCountryEvent").hide();
			$("#graph_event").html('<img alt="" class="tubiao2"  src="<%=basePath %>/static/images/tubiao2.png">');
		}
		if(country_scale_rank.length>0){
			$("#selectCountryScale").show();
			$("#selectCountryScale").html(""); 
			var scaleNum = country_scale_rank.length > 20 ? 20:country_scale_rank.length;
			for(var i=5;i<=scaleNum;i+=5){
				document.getElementById("selectCountryScale").options.add(new Option(i,i));
			}
			var	countryOptionCount = $("#selectCountryScale option").map(function(){return $(this).val();}).get().join(", ");
			if(countryOptionCount.indexOf(10)!=-1){
				$("#selectCountryScale option[value='10']").attr("selected",true);
				process_dic_to_amchart(country_scale_rank.slice(0,10),'column_chart','graph_scale');
			}else{
				$("#selectCountryScale").hide();
				process_dic_to_amchart(country_scale_rank.slice(0,scaleNum),'column_chart','graph_scale');
			}
			
	        //column_chart('graph_scale',{category:'key',value:'value'},country_scale_rank.slice(0,10));
	       $("#selectCountryScale").change(function () {
	        	var changeValue = $("#selectCountryScale option:selected").val();
	        	process_dic_to_amchart(country_scale_rank.slice(0,changeValue),'column_chart','graph_scale',changeValue);
        		//column_chart('graph_scale',{category:'key',value:'value'},country_scale_rank.slice(0,changeValue));
	        });
		}else{
			$("#selectCountryScale").hide();
			$("#graph_scale").html('<img alt="" class="tubiao2"  src="<%=basePath %>/static/images/tubiao2.png">');
		}
        
		//最大事件数
        var colorFunction = new L.HSLHueFunction(new L.Point(0,50), new L.Point(max_sum,0), {outputSaturation: '100%', outputLuminosity: '30%'});
        //最大事件数
        var fillColorFunction = new L.HSLHueFunction(new L.Point(0,50), new L.Point(max_sum,0));
        options = {
            recordsField: null,
            locationMode: L.LocationModes.COUNTRY,
            codeField: 'CountryCode',
            displayOptions: {
                EventSum: {
                    displayName: '国家事件数范围',
                    color: colorFunction,
                    fillColor: fillColorFunction
                }
            },
            layerOptions: {
                fillOpacity: 0.7,
                opacity: 1,
                weight: 1
            },
            tooltipOptions: {
                iconSize: new L.Point(100,65),
                iconAnchor: new L.Point(-5,65)
            },

            onEachRecord: function (layer, record) {
                var $html = $(L.HTMLUtils.buildTable(record));

                layer.bindPopup($html.wrap('<div/>').parent().html(), {
                    maxWidth: 400,
                    minWidth: 400
                });
            }
        };
        //事件图层
        EventLayer = new L.ChoroplethDataLayer(event_dic, options);
        
        map.addLayer(EventLayer);
        
        //事件时间线
        $("#legend").empty();
        $('#legend').append(EventLayer.getLegend({
            className: 'well'
        })); 
        var categories = date_dic;
        var fillColorFunctionBars = new L.HSLLuminosityFunction(new L.Point(0,0.5), new L.Point(categories.length - 1,1), {outputHue: 0, outputSaturation: '100%'});
        var styleFunction = new L.StylesBuilder(categories,{
            displayName: function (index) {
                return categories[index];
            },
            color: 'hsl(0,100%,20%)',
            fillColor: fillColorFunctionBars,
            minValue: 0,
            maxValue: max_date_sum/3
        });
        options = {
            recordsField: null,
            locationMode: L.LocationModes.COUNTRY,
            codeField: 'CountryCode',
            chartOptions: styleFunction.getStyles(),
            layerOptions: {
                fillOpacity: 0.7,
                opacity: 1,
                weight: 1,
                width: 6
            },
            tooltipOptions: {
                iconSize: new L.Point(100,65),
                iconAnchor: new L.Point(-5,65)
            },

            onEachRecord: function (layer, record) {
                var $html = $(L.HTMLUtils.buildTable(record));

                layer.bindPopup($html.wrap('<div/>').parent().html(), {
                    maxWidth: 400,
                    minWidth: 400
                });
            }
        };
        EventBarChart = new L.BarChartDataLayer(event_dic, options);
        
        //稳定度图层
        var colorFunction = new L.HSLHueFunction(new L.Point(0,50), new L.Point(max_scale,0), {outputSaturation: '100%', outputLuminosity: '30%'});
        var fillColorFunction = new L.HSLHueFunction(new L.Point(0,50), new L.Point(max_scale,0));
        options = {
            recordsField: null,
            locationMode: L.LocationModes.COUNTRY,
            codeField: 'CountryCode',
            displayOptions: {
                ScaleSum: {
                    displayName: '国家稳定度范围',
                    color: colorFunction,
                    fillColor: fillColorFunction
                }
            },
            layerOptions: {
                fillOpacity: 0.7,
                opacity: 1,
                weight: 1
            },
            tooltipOptions: {
                iconSize: new L.Point(100,65),
                iconAnchor: new L.Point(-5,65)
            },

            onEachRecord: function (layer, record) {
                var $html = $(L.HTMLUtils.buildTable(record));

                layer.bindPopup($html.wrap('<div/>').parent().html(), {
                    maxWidth: 400,
                    minWidth: 400
                });
            }
        };
        
        ScaleLayer = new L.ChoroplethDataLayer(scale_dic, options);
        $('#legend').append(ScaleLayer.getLegend({
            className: 'well'
        }));
        
        //稳定度时间线
        var categories = date_dic;
        var fillColorFunctionBars = new L.HSLLuminosityFunction(new L.Point(0,0.5), new L.Point(categories.length - 1,1), {outputHue: 0, outputSaturation: '100%'});
        var styleFunction = new L.StylesBuilder(categories,{
            displayName: function (index) {
                return categories[index];
            },
            color: 'hsl(0,100%,20%)',
            fillColor: fillColorFunctionBars,
            minValue: 0,
            maxValue: max_date_scale/5//
        });

        options = {
            recordsField: null,
            locationMode: L.LocationModes.COUNTRY,
            codeField: 'CountryCode',
            chartOptions: styleFunction.getStyles(),
            layerOptions: {
                fillOpacity: 0.7,
                opacity: 1,
                weight: 1,
                width: 6
            },
            tooltipOptions: {
                iconSize: new L.Point(100,65),
                iconAnchor: new L.Point(-5,65)
            },

            onEachRecord: function (layer, record) {
                var $html = $(L.HTMLUtils.buildTable(record));

                layer.bindPopup($html.wrap('<div/>').parent().html(), {
                    maxWidth: 400,
                    minWidth: 400
                });
            }
        };

        ScaleBarChart = new L.BarChartDataLayer(scale_dic, options);

        $('#legend').append(ScaleBarChart.getLegend({
            className: 'well',
            title: '时间线'
        }));
		
         overlays = {
            "国家事件数": EventLayer,
            "国家事件时间线": EventBarChart,
            "国家稳定度":ScaleLayer,
            "国家稳定时间线":ScaleBarChart
        };
         
        controlLayer = L.control.layers(baseMaps, overlays);
        controlLayer.addTo(map);
       if(event_dic.length==0){//新加的，原来的插件头铁
    	   $(".min-value").html(0);
       }
	}



</script>
</html>