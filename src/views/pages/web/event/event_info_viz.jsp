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
<title>事件发生地展示</title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/style.css">
<!-- 人工查询日期 -->
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath %>/static/lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath %>/static/css/combo.select.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/perfect-scrollbar.css"/>

<link rel="shortcut icon" type="image/x-icon" href="<%=basePath %>/static/Visualization/base/ico.png"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/base/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css"href="<%=basePath %>/static/Visualization/base/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/base/base.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/css/event_result.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/js/amcharts/export/export.css"/>
<link rel="stylesheet" href="<%=basePath %>/static/Visualization/css/leaflet/leaflet.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath %>/static/Visualization/css/leaflet/dvf.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath %>/static/Visualization/css/leaflet/example.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath %>/static/Visualization/css/leaflet/ui.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath %>/static/Visualization/css/infomap.css" type="text/css" media="screen" />
<link rel="stylesheet"	href="<%=basePath%>/static/Visualization/css/export.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window_zs.css"/><!-- 弹出提示框样式 -->
<script src="<%=basePath%>/static/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>/static/lib/jquery.pagination.js"></script>
<script src="<%=basePath%>/static/js/config/config.js"></script>
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
<body>
	<div class="index_top clearfix">
		<h3 class="fl title">事件库分析 >事件发生地展示</h3>
		<!-- <div class="title_r fr">
			<span class="export_img_2" title="图表切换"></span>
			<span class="info_img"></span>
			<ul class="info_box">
				<li><span>数据：</span>事件数据库</li>
				<li><span>描述：</span>反映一段时间内，某地发生的事件的对比情况</li>
				<li><span>输入：</span>对比信息，事件编码，阈值信息</li>
				<li><span>介绍：</span>ttajkasdasdfa asdfasdf asdfa啊发生的发生地阿打法的疯狂拉升地方案的发生发生的法律看见俺十分啊发生的发生地发沙发</li>
			</ul>
		</div> -->
	</div>
	<div class="index_bottom">
		<div class="data show">
		<input type="hidden" id="moduleCode" value="${moduleCode}">
			 <div class="row">
			 	<div class="col-md-12 mg_t">
			 		<h3 class="tx-c mapText">事件地理展示
			 			<div  class="help" onmouseover="showChartInfo(1,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
			 		</h3>
		            <div class="bor">
		                <div id="map" class="myleafletjsMap"></div>
		            </div>
	            </div>
	        </div>
	        <div class="row" id="charts_area">
	            <div class="col-md-12 mg_b mg_t">
	                <div id="chart-content">
	                    <div class="col-md-6 w50l bor">
	                        <h3 id="graph_quadclass_text">事件大类展示
	                        	<div  class="help" onmouseover="showChartInfo(2,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
	                        </h3>
	                        <div id="graph_quadclass" class="amcharts"></div>
	                    </div>
	                    <div class="col-md-6 w50r bor">
	                        <h3 id="graph_eventroot_text">事件根类展示
	                        	<div  class="help" onmouseover="showChartInfo(3,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
	                        </h3>
	                        <div id="graph_eventroot" class="amcharts"></div>
	                    </div>
	                </div>
	            </div>
	        </div>
		</div>
		<!-- 存放location -->
		<!-- <div class="row" id="locationRow" style="margin-bottom:33px!important;">
			
		</div> -->
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
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>2</td>
						<td><span class="sort sort2">2</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>3</td>
						<td><span class="sort sort3">3</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>3</td>
						<td><span class="sort sort7">4</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>5</td>
						<td><span class="sort sort7">5</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>6</td>
						<td><span class="sort sort7">6</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>7</td>
						<td><span class="sort sort7">7</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>8</td>
						<td><span class="sort sort7">8</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>9</td>
						<td><span class="sort sort7">9</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
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
						<td><img src="<%=basePath %>/static/images/state2.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>11</td>
						<td><span class="sort sort10">11</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq2.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>12</td>
						<td><span class="sort">12</span></td>
						<td><!-- <img class="gq" src="../<%=basePath %>/static/images/gq.png" alt="挂起"> --></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state3.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
				</tbody>
			</table>
			<div id="Pagination" class="pagination"><!-- 这里显示分页 --></div>
			<div id="Searchresult">分页初始化完成后这里的内容会被替换。</div>
		</div>  --%>
	<!-- 条件tab页 st -->
	<jsp:include page="event_tab1.jsp"></jsp:include>
	</div>
	<jsp:include page="../updateUserPassword.jsp"/>
</body>
<!-- 人工查询日期 -->
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
<script type="text/javascript" src="<%=basePath %>/static/Visualization/js/leaflet/leaflet.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/Visualization/js/leaflet/tile.stamen.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/Visualization/js/leaflet/geohash.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/Visualization/js/leaflet/underscore-min.js"></script>

<script type="text/javascript"	src="<%=basePath%>/static/Visualization/js/leaflet/javascript.util.js"></script>
<script type="text/javascript"	src="<%=basePath%>/static/Visualization/js/leaflet/jsts.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/Visualization/js/leaflet/leaflet-dvf.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/Visualization/js/leaflet/leaflet.dvf.experimental.js"></script>
<script type="text/javascript"	src="<%=basePath%>/static/Visualization/js/leaflet/countryData.min.js"></script>
<script src="<%=basePath %>/static/Visualization/datamap/d3.min.js"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/serial.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/pie.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
<c:if test="${bgFlag == null or bgFlag == 1}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
</c:if>
 <!-- 人工查询js -->
<script src="<%=basePath %>/static/Visualization/rgQuery.js"></script>
<script src="<%=basePath%>/static/js/map-tileLayer.js"	type="text/javascript"></script>
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
	
	 //定义Map控件
	 map = L.map('map');
	 var corner1 = L.latLng(-60, -180),
 	 corner2 = L.latLng(90, 180),
 	 bounds = L.latLngBounds(corner1, corner2);
 	 map.setMaxBounds(bounds);
     baseLayer = getOSMBrightLayer();
     baseLayer.addTo(map);
      var layerControl = new L.Control.Layers({
         'Stamen Toner': baseLayer
     }).addTo(map);
     var fillColor = new L.HSLHueFunction([1, 120], [8, 0]);
    var styles = {};
    for (var i = 1; i <= 1; ++i) {
         styles[i] = {
             fillColor: fillColor.evaluate(i)
         };
     }
    var dataLayer;
   
    //根据配置ID事件信息渲染图表
	function render(configId){
		startLoad();
		$.ajax({
			url:'<%=basePath %>/search/event_info_viz/'+configId,
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
    //事件信息渲染图表
    function renderData(data){
    	$("#locationRow").empty();
    	var Event_Nodes = data.Event_Nodes;
        var quadclass_dic = data.quadclass_dic;
        var eventroot_dic = data.eventroot_dic;
        //var location_data = data.location_dic;
        var viewLatLong = data.viewLatLong;
        //渲染四大类饼图
        var flag = false;
        for(var i in quadclass_dic){
        	if(quadclass_dic[i].value!=0){
        		flag = true;
        		break;
        	}
        }
        if(flag){
        	 pie_chart('graph_quadclass',quadclass_dic);
        }else{
        	$("#graph_quadclass").html('<img alt="" class="tubiao2"  src="<%=basePath %>/static/images/tubiao2.png">');
        }
        var flag1 = false;
        for(var i in eventroot_dic){
        	if(eventroot_dic[i].value!=0){
        		flag1 = true;
        		break;
        	}
        }
        if(flag1){
        	 pie_chart('graph_eventroot',eventroot_dic);
        }else{
        	$("#graph_eventroot").html('<img alt="" class="tubiao2"  src="<%=basePath %>/static/images/tubiao2.png">');
        }
        
      	//处理展示中心位置
        if(viewLatLong == undefined || viewLatLong.length == 0){
			map.setView([ 37.8, 113.7 ], 4);
		}else{
			map.setView(viewLatLong,4);
		}
        if(dataLayer == undefined){
            dataLayer = new L.MapMarkerDataLayer(Event_Nodes,{
                recordsField: null,
                latitudeField: '纬度',
                longitudeField: '经度',
                displayOptions: {
	                    	发生地: {
	                    }
                },
                layerOptions: {
                    numberOfSides: 4,
                    fillOpacity: 0.7,
                    opacity: 1,
                    weight: 0.4,
                    gradient: true,
                    dropShadow: true
                },
                tooltipOptions: {
                    iconSize: new L.Point(100, 60),
                    iconAnchor: new L.Point(-5, 100)
                },
                onEachRecord: function (layer, record) {
                    var $html = $(L.HTMLUtils.buildTable(record));

                    layer.bindPopup($html.wrap('<div/>').parent().html(),{
                        minWidth: 450,
                        maxWidth: 450,
    					minHeight:400,
    					maxHeight:400
                    });
                }
            });
            map.addLayer(dataLayer);
        }else{
        	map.removeLayer(dataLayer);
        	dataLayer = new L.MapMarkerDataLayer(Event_Nodes,{
                recordsField: null,
                latitudeField: '纬度',
                longitudeField: '经度',
                displayOptions: {
	                    	发生地: {
	                    }
                },
                layerOptions: {
                    numberOfSides: 4,
                    fillOpacity: 0.7,
                    opacity: 1,
                    weight: 0.4,
                    gradient: true,
                    dropShadow: true
                },
                tooltipOptions: {
                    iconSize: new L.Point(100, 60),
                    iconAnchor: new L.Point(-5, 100)
                },
                onEachRecord: function (layer, record) {
                    var $html = $(L.HTMLUtils.buildTable(record));

                    layer.bindPopup($html.wrap('<div/>').parent().html(),{
                        minWidth: 450,
                        maxWidth: 450,
    					minHeight:400,
    					maxHeight:400
                    });
                }
            });
            map.addLayer(dataLayer); 
        }
        //显示表格
        /* if(location_data!=""){
    		for(var j=0;j<location_data.length;j++){
    			var newLocationsTable = "<div class='col-md-12'>"+
    			"<div id='chart-content'>"+
    				"<div class='col-md-12' style='margin-top: -50px;'>"+
    					"<div class='panel panel-primary filterable'>"+
    						"<div class='panel-heading clearfix'>"+
    							"<h3 class='panel-title fl'>事件发生地(国家)</h3>"+
    							"<div class='pull-right'>"+
    								"<button class='btn btn-default btn-xs btn-filter'>"+
    									"<span class='fa fa-filter'></span> Filter"+
    								"</button>"+
    							"</div>"+
    						"</div>"+
    						"<div class='col-md-6'>"+
    							"<table class='table table2' id='Location"+j+"'>"+
    								"<thead>"+
    									"<tr class='filters'>"+
    										"<th><input type='text' class='form-control' placeholder='Name' disabled></th>"+
    										"<th><input type='text' class='form-control' placeholder='Value' disabled></th>"+
    									"</tr>"+
    								"</thead>"+
    								"<tbody>"+
    									"<tr></tr>"+
    								"</tbody>"+
    							"</table>"+
    						"</div>"+
    						"<div class='col-md-6'>"+
    							"<table class='table table2' id='Locations"+j+"'>"+
    								"<thead>"+
    									"<tr class='filters'>"+
    										"<th><input type='text' class='form-control' placeholder='Name' disabled></th>"+
    										"<th><input type='text' class='form-control' placeholder='Value' disabled></th>"+
    									"</tr>"+
    								"</thead>"+
    								"<tbody>"+
    									"<tr></tr>"+
    								"</tbody>"+
    							"</table>"+
    						"</div>"+
    					"</div>"+
    				"</div>"+
    			"</div>"+
    		"</div>";
				$("#locationRow").append(newLocationsTable);
				var num1 = 15<location_data[j].length?15:location_data[j].length;
				var num2 = 15<location_data[j].length?location_data[j].length:15;
    			for(var i=0;i<num1;i++){
 	                addRow("Location"+j,location_data[j][i].key, location_data[j][i].value)
 	            }
				for(var i=15;i<num2;i++){
 	               addRow2("Locations"+j,location_data[j][i].key, location_data[j][i].value)
 	            }
    		}
   		} */
        $('.filterable .btn-filter').click(function(){
            var $panel = $(this).parents('.filterable'),
            $filters = $panel.find('.filters input'),
            $tbody = $panel.find('.table tbody');
            if ($filters.prop('disabled') == true) {
                $filters.prop('disabled', false);
                $filters.first().focus();
            } else {
                $filters.val('').prop('disabled', false);//bug
                $tbody.find('.no-result').remove();
                $tbody.find('tr').show();
            }
        });

        $('.filterable .filters input').keyup(function(e){
            var code = e.keyCode || e.which;
            if (code == '9') return;
            var $input = $(this),
            inputContent = $input.val().toLowerCase(),
            $panel = $input.parents('.filterable'),
            column = $panel.find('.filters th').index($input.parents('th')),
            $table = $panel.find('.table'),
            $rows = $table.find('tbody tr');
            var $filteredRows = $rows.filter(function(){
                var value = $(this).find('td').eq(column).text().toLowerCase();
                return value.indexOf(inputContent) === -1;
            });
            $table.find('tbody .no-result').remove();
            $rows.show();
            $filteredRows.hide();
            if ($filteredRows.length === $rows.length) {
                $table.find('tbody').prepend($('<tr class="no-result text-center"><td colspan="'+ $table.find('.filters th').length +'">No result found</td></tr>'));
            }
        });
        function addRow(id,text1,text2){
            var table = document.getElementById(id);
            var newRow = table.insertRow(); //创建新行
            var newCell1 = newRow.insertCell(); //创建新单元格
            newCell1.innerHTML = text1; //单元格内的内容
            var newCell2 = newRow.insertCell(); //创建新单元格
            newCell2.innerHTML = text2; //单元格内的内容
            
         }
		function addRow2(id,text1,text2){
            var table = document.getElementById(id);
            var newRow = table.insertRow(); //创建新行
            var newCell1 = newRow.insertCell(); //创建新单元格
            newCell1.innerHTML = text1; //单元格内的内容
            var newCell2 = newRow.insertCell(); //创建新单元格
            newCell2.innerHTML = text2; //单元格内的内容
         }
    }
</script>
</html>