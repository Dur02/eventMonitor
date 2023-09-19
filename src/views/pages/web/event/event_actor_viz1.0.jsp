<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>事件国家角色展示</title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/style.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath%>/static/lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/combo.select.css">
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
<style type="text/css">
	.table {
	    margin-top: 9px;
	}
	.info-talbe{
		margin-top: 3px;
	}
</style>
</head>
<body>
	<div class="index_top clearfix">
		<h3 class="fl title">事件库分析 > 国家角色展示</h3>
	</div>
	<div class="index_bottom">
		<div class="data show">
			<input type="hidden" id="moduleCode" value="${moduleCode}">
			<div class="row">
				<div class="col-md-12 mg_t">
					<h3 class="tx-c mapText">国家角色联系展示
					<div  class="help" onmouseover="showChartInfo(1,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
					</h3>
		            <div class="bor">
		                <div id="map" class="myleafletjsMap"></div>
		                <div id="info" class="leaflet-control-legend">
		                	<span style="font-style: italic; font-size: 16px;">Click on CountryNode to view details
		                		<img class="isShowViewImage" id="isShowView-image" onclick="isShowView()" src="<%=basePath%>/static/images/mapInfoUp.png">
		                	</span>
		                	<div id="info-table"></div>
		                </div>
		            </div>
	            </div>
			
			
	            <!-- <div class="col-md-12">
	            	<div class="bor">
	            	<h3 class="tx-c">国家角色联系展示</h3>
	                <div id="map"></div>
	                <div id="info" class="leaflet-control-legend"><span style="font-style: italic; font-size: 16px;">Click on CountryNode to view details</span></div>
	            	</div>
	            </div> -->
	        </div>
	        <div class="row" id="charts_area">
                <div class='col-md-12'>
					<div class='col-md-12 mg_t bor'>
						<div id='chart-content'>
							<div class='col-md-6 w50l'>
								<h3 id='graph_actor_text_Prev'>角色1国家展示
								<div  class="help" onmouseover="showChartInfo(2,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
								</h3>
								<div id='graph_event' class='amcharts twoCharts'></div>
							</div>
							<div class='col-md-6 w50r'>
								<h3 id='graph_actor_text_Last'>角色2国家展示
								<div  class="help" onmouseover="showChartInfo(3,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
								</h3>
								<div id='graph_event2' class='amcharts twoCharts'></div>
							</div>
						</div>
					</div>
				</div>
	        </div>
		</div>
		<!-- 存放actor1和actor2 -->
		<div class="row" id="actorRow">
			<div class='col-md-12'>
				<div class='col-md-12 mg_t bor'>
					<div id='chart-content'>
						<div class='col-md-6 w50l'>
							<h3 id='graph_actor_text_Prev'>角色1类型展示
							<div  class="help" onmouseover="showChartInfo(4,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
							</h3>
							<div id='graph_actor1_type' class='amcharts twoCharts'></div>
						</div>
						<div class='col-md-6 w50r'>
							<h3 id='graph_actor_text_Last'>角色2类型展示
							<div  class="help" onmouseover="showChartInfo(5,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
							</h3>
							<div id='graph_actor2_type' class='amcharts twoCharts'></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 存放多组日期的actor1和actor2的组织 -->
		<div class="row" id="actorKnownGroup">
			<div class='col-md-12'>
				<div class='col-md-12 mg_t bor'>
					<div id='chart-content'>
						<div class='col-md-6 w50l'>
							<h3 id='graph_actor_text_Prev'>角色1组织展示
							<div  class="help" onmouseover="showChartInfo(6,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
							</h3>
							<div id='actor1_KnownGroup' class='amcharts twoCharts'></div>
						</div>
						<div class='col-md-6 w50r'>
							<h3 id='graph_actor_text_Last'>角色2组织展示
							<div  class="help" onmouseover="showChartInfo(7,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
							</h3>
							<div id='actor2_KnownGroup' class='amcharts twoCharts'></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 存放多组日期的宗教 -->
		<div class="row" id="actorReligionRow">
			<div class='col-md-12'>
				<div class='col-md-12 mg_t bor'>
					<div id='chart-content'>
						<div class='col-md-6 w50l'>
							<h3 id='graph_actor_text_Prev'>角色1宗教展示
							<div  class="help" onmouseover="showChartInfo(8,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
							</h3>
							<div id='actor1_religion' class='amcharts twoCharts'></div>
						</div>
						<div class='col-md-6 w50r'>
							<h3 id='graph_actor_text_Last'>角色2宗教展示
							<div  class="help" onmouseover="showChartInfo(9,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
							</h3>
							<div id='actor2_religion' class='amcharts twoCharts'></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 存放多组日期的种族 -->
		<div class="row" id="actorEthnic">
			<div class='col-md-12'>
				<div class='col-md-12 mg_b mg_t bor'>
					<div id='chart-content'>
						<div class='col-md-6 w50l'>
							<h3 id='graph_actor_text_Prev'>角色1种族展示
							<div  class="help" onmouseover="showChartInfo(10,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
							</h3>
							<div id='graph_actor1_Ethnic' class='amcharts twoCharts'></div>
						</div>
						<div class='col-md-6 w50r'>
							<h3 id='graph_actor_text_Last'>角色2种族展示
							<div  class="help" onmouseover="showChartInfo(11,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
							</h3>
							<div id='graph_actor2_Ethnic' class='amcharts twoCharts'></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="event_tab1.jsp"></jsp:include>
	</div>
	<jsp:include page="../updateUserPassword.jsp"/>
</body>

<script src="<%=basePath%>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath%>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath%>/static/js/bootstrap-select.min.js"></script>
<script src="<%=basePath%>/static/js/jquery.combo.select.js"></script>
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
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/leaflet.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/tile.stamen.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/geohash.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/underscore-min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/moment.min.js" ></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/leaflet-dvf.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/leaflet.dvf.experimental.js"></script>
<script src="<%=basePath%>/static/Visualization/datamap/d3.min.js"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/serial.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/pie.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
<!-- 人工查询js -->
<script src="<%=basePath %>/static/Visualization/rgQuery.js"></script>
<c:if test="${bgFlag == null or bgFlag == 1}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
</c:if>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/downLoad.js"></script>	
<script src="<%=basePath%>/static/js/map-tileLayer.js"	type="text/javascript"></script>	
<!-- 计算显示图的高度 -->	
<script src="<%=basePath%>/static/js/chartHeight.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<script type="text/javascript">
	function IsJsonString(str) {
	    try {
	        JSON.parse(str);
	    } catch (e) {
	        return false;
	    }
	    return true;
	}
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
	    var map;
	    var $info = $('#info');
	    var $map = $('#map');
	    map = L.map('map');/////////
	  	//bounds
		var corner1 = L.latLng(-60, -180),
	   	corner2 = L.latLng(90, 180),
	   	bounds = L.latLngBounds(corner1, corner2); 
	   	map.setMaxBounds(bounds);
	    var baseLayer = getOSMBrightLayer().addTo(map);
	    var layerControl=null;
	    var legendControl=null; 
	    var CountryEdgeLayer=null; 
	    var Country_NodesLayer=null; 
		function render(configId){
			startLoad();
			/* $info.empty(); */
			//清空info-table内容
			$("#info-table").empty();
			$.ajax({
				url:'<%=basePath%>/search/event_actor_viz/'+configId,
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
			
			
			$("#info-table").empty();
			//先让被选中的节点去掉
			qxMapSelectNode();
			
			//设置地图的中心位置
			if(data.Country_Nodes.length!=1 && data.Country_Edges.length !=1){
				map.setView([ 47.8, 30 ], 2);
	    	}else{
	    		map.setView([ 37.8, 113.7 ], 4);
	    	}
			
			
	    	var Country_Nodes;
	    	var Country_Edges;
	    	var actor1_dic;
	    	var actor2_dic;
	    	
	    	if(IsJsonString(data.Country_Nodes) == true){
	    		Country_Nodes = eval('(' + data.Country_Nodes + ')');
	    	}else{
	    		Country_Nodes = data.Country_Nodes;
	    	}
	    	if(IsJsonString(data.Country_Edges) == true){
	    		Country_Edges = eval('(' + data.Country_Edges + ')');
	    	}else{
	    		Country_Edges = data.Country_Edges;
	    	}
	    	if(IsJsonString(data.actor1_dic) == true){
	    		actor1_dic = eval('(' + data.actor1_dic + ')');
	    	}else{
	    		actor1_dic = data.actor1_dic;
	    	}
	    	if(IsJsonString(data.actor2_dic) == true){
	    		actor2_dic = eval('(' + data.actor2_dic + ')');
	    	}else{
	    		actor2_dic = data.actor2_dic;
	    	}
			var actor1_data = data.actor1_dic_type;
	        var actor2_data = data.actor2_dic_type;
	        var actor1Ethnic_dic = data.actor1Ethnic_dic;
	        var actor2Ethnic_dic = data.actor2Ethnic_dic;
	        var actor1KnownGroup_dic = data.actor1KnownGroup_dic;
	        var actor2KnownGroup_dic = data.actor2KnownGroup_dic;
	        var actor1Religion_dic = data.actor1Religion_dic;
	        var actor2Religion_dic = data.actor2Religion_dic;
            //column_chart('',{category:'key',value:'value'},actor1_dic);
            //column_chart('',{category:'key',value:'value'},actor2_dic);
            if(actor1_dic.length > 0){
            	process_dic_to_amchart(actor1_dic,'column_chart','graph_event');
            }else{
            	$("#graph_event").html('<img alt="" class="tubiao2"  src="<%=basePath %>/static/images/tubiao2.png">');
            }
            if(actor1_dic.length > 0){
            	process_dic_to_amchart(actor2_dic,'column_chart','graph_event2');
            }else{
            	$("#graph_event2").html('<img alt="" class="tubiao2"  src="<%=basePath %>/static/images/tubiao2.png">');
            }
            if(layerControl != null){
            	//把控制图层移除
            	map.removeControl(layerControl);
            	map.removeControl(legendControl);
            	map.removeLayer(CountryEdgeLayer);
            	map.removeLayer(Country_NodesLayer);
            	map.removeLayer(allLayer);
            }
            if(Country_Nodes.length>0){
	            layerControl = L.control.layers().addTo(map);
	            legendControl = L.control.legend({autoAdd: false}).addTo(map);
	            var Country_NodesLookup = L.GeometryUtils.arrayToMap(Country_Nodes, 'countryCode');
	            Country_Edges = _.sortBy(Country_Edges, function (value) {
	                return -1 * value.eventSum;
	            });
	            var CountryEdgeLookUp = _.groupBy(Country_Edges, function (value) {
	                return value.originator;
	            });
	            var maxCountAll = Number(Country_Edges[0].eventSum);
	            Country_Edges = _.filter(Country_Edges, function (value) {
	                return value.originator !== 'all';
	            });
	            var maxCount = Number(Country_Edges[0].eventSum);
	            var count = 0;
	            var getLocation = function (context, locationField, fieldValues, callback) {
	                var key = fieldValues[0];
	                var CountryNode = Country_NodesLookup[key];
	                var location;
	                if (CountryNode) {
	                    var latlng = new L.LatLng(Number(CountryNode.lat), Number(CountryNode.lon));
	
	                    location = {
	                        location: latlng,
	                        text: key,
	                        center: latlng
	                    };
	                }
	                return location;
	            };
	            var sizeFunction = new L.LinearFunction([1, 16], [253, 48]);
	            var options = {
	                recordsField: null,
	                locationMode: L.LocationModes.CUSTOM,
	                fromField: 'actor1',
	                toField: 'actor2',
	                codeField: null,
	                getLocation: getLocation,
	                getEdge: L.Graph.EDGESTYLE.ARC,
	                includeLayer: function (record) {
	                    return false;
	                },
	                getIndexKey: function (location, record) {
	                    return record.actor1 + '_' + record.actor2;
	                },
	                setHighlight: function (style) {
	                    style.opacity = 1.0;
	                    return style;
	                },
	                unsetHighlight: function (style) {
	                    style.opacity = 0.5;
	                    return style;
	                },
	                layerOptions: {
	                    fill: false,
	                    opacity: 0.5,
	                    weight: 0.5,
	                    fillOpacity: 1.0,
	                    distanceToHeight: new L.LinearFunction([0, 20], [1000, 300]),
	                    markers: {
	                        end: true
	                    }
	                },
	                legendOptions: {
	                    width: 200,
	                    numSegments: 5,
	                    className: 'legend-line'
	                },
	                tooltipOptions: {
	                    iconSize: new L.Point(80, 64),
	                    iconAnchor: new L.Point(-5, 64),
	                    className: 'leaflet-div-icon line-legend'
	                },
	                displayOptions: {
	                    eventSum: {
	                        weight: new L.LinearFunction([0, 2], [maxCount, 4]),
	                        color: new L.HSLHueFunction([0, 200], [maxCount, 330], {
	                            outputLuminosity: '60%'
	                        }),
	                        displayName: '事件数'
	                    }
	                },
	                onEachRecord: function (layer, record) {
	                    layer.bindPopup($(L.HTMLUtils.buildTable(record)).wrap('<div/>').parent().html());
	                }
	            };
	            allLayer = new L.Graph(Country_Edges, options);
	            map.addLayer(allLayer);
	            Country_NodesLayer = new L.MarkerDataLayer(Country_NodesLookup, {
	                recordsField: null,
	                locationMode: L.LocationModes.LATLNG,
	                latitudeField: 'lat',
	                longitudeField: 'lon',
	                displayOptions: {
	                    'nodeSize': {
	                        color: new L.HSLHueFunction([0, 200], [253, 330], {
	                            outputLuminosity: '60%'
	                        })
	                    },
	                    'countryCode': {
	                        /* title: function (value) {
	                            return value;
	                        } */
	                    }
	                },
	                layerOptions: {
	                    fill: false,
	                    stroke: false,
	                    weight: 0,
	                    color: '#A0A0A0'
	                },
	               /*  filter: function (record) {
	                    return Number(record.threshold) > 5;///
	                }, */
	                setIcon: function (record, options) {
	                    var html = '<div><i class="fa fa-user"></i><span class="code">' + record.countryCode + '</span></div>';
	                    var $html = $(html);
	                    var $i = $html.find('i');
	                    L.StyleConverter.applySVGStyle($i.get(0), options);
	                    var directCountry_Edges = L.Util.getFieldValue(record, 'nodeSize');
	                    var size = sizeFunction.evaluate(directCountry_Edges);
	                    $i.width(size);
	                    $i.height(size);
	                    $i.css('font-size', size + 'px');
	                    $i.css('line-height', size / 2 + 'px');
	                    var $code = $html.find('.code');
	                    $code.width(size);
	                    $code.height(size);
	                    $code.css('line-height', size + 'px');
	                    $code.css('font-size', size / 3 + 'px');//
	                    $code.css('margin-top', -size / 2 + 'px');
	                    //$code.css('color',"red")
	                    var icon = new L.DivIcon({
	                        iconSize: new L.Point(size, size),
	                        iconAnchor: new L.Point(size / 2, size / 2),
	                        className: 'countrynode-icon',
	                        html: $html.wrap('<div/>').parent().html()
	                    });
	                    return icon;
	                },
	                onEachRecord: function (layer, record) {
	                    layer.on('click', function () {
	                    	//将不是locationNode中选中的清空
	                    	var i = 0;
	                    	$(".leaflet-control-layers-selector").each(function(i){
	                    		if(i != 0){
	                    			if(this.checked == true){
	       		            		 	$(this).click();
	       			           		}
	                    		}
	                    		i++;
	    			        })
	                    	
	                    	$("#isShowView-image").show();
	                    	$("#isShowView-image").attr("src","<%=basePath%>/static/images/mapInfoDown.png");
	                        $("#info-table").css("display","block");
	                        $("#info-table").empty();
	                        $("#info-table").append($(L.HTMLUtils.buildTable(record)).wrap('<div/>').parent().html());
	                        allLayer.options.includeLayer = function (newRecord) {
	                            return newRecord.actor1 === record.countryCode || newRecord.actor2 === record.countryCode;
	                        };
	                        allLayer.reloadData();
	                    });
	                }
	            });
	            map.addLayer(Country_NodesLayer);
	            layerControl.addOverlay(Country_NodesLayer, 'countryNodes');
            }
            for (var key in CountryEdgeLookUp) {
                if (key !== 'all' && count <20) {//控制可显示国家的数量
                    var CountryNodeOptions = L.extend(options, {
                        includeLayer: function (record) {
                            return record.originator === key;
                        }
                    });
                    CountryEdgeLayer = new L.Graph(Country_Edges, CountryNodeOptions);
                    layerControl.addOverlay(CountryEdgeLayer, key);
                    if (count === 0) {
                        legendControl.addLayer(CountryEdgeLayer);
                    }
                    count++;
                }
            }
            if(actor1_data.length>0){
				//显示柱状图
				process_dic_to_amchart(actor1_data,'column_chart','graph_actor1_type');
            }else{
    			$("#graph_actor1_type").html('<img alt="" class="tubiao2"  src="<%=basePath %>/static/images/tubiao2.png">');
            }
            if(actor2_data.length>0){
				//显示柱状图
				process_dic_to_amchart(actor2_data,'column_chart','graph_actor2_type');
            }else{
    			$("#graph_actor2_type").html('<img alt="" class="tubiao2"  src="<%=basePath %>/static/images/tubiao2.png">');
            }
            if(actor1Ethnic_dic.length>0){
				//显示柱状图
				process_dic_to_amchart(actor1Ethnic_dic,'column_chart','graph_actor1_Ethnic');
            }else{
				$("#graph_actor1_Ethnic").html('<img alt="" class="tubiao2"  src="<%=basePath %>/static/images/tubiao2.png">');
            }
            if(actor2Ethnic_dic.length>0){
				//显示柱状图
				process_dic_to_amchart(actor2Ethnic_dic,'column_chart','graph_actor2_Ethnic');
            }else{
    			$("#graph_actor2_Ethnic").html('<img alt="" class="tubiao2"  src="<%=basePath %>/static/images/tubiao2.png">');
            }
            if(actor1Religion_dic.length>0){
				//显示柱状图
				process_dic_to_amchart(actor1Religion_dic,'column_chart','actor1_religion');
            }else{
				$("#actor1_religion").html('<img alt="" class="tubiao2"  src="<%=basePath %>/static/images/tubiao2.png">');
            }
            if(actor2Religion_dic.length>0){
				//显示柱状图
				process_dic_to_amchart(actor2Religion_dic,'column_chart','actor2_religion');
            }else{
    			$("#actor2_religion").html('<img alt="" class="tubiao2"  src="<%=basePath %>/static/images/tubiao2.png">');
            }
            if(actor1KnownGroup_dic.length>0){
				//显示柱状图
				process_dic_to_amchart(actor1KnownGroup_dic,'column_chart','actor1_KnownGroup');
            }else{
				$("#actor1_KnownGroup").html('<img alt="" class="tubiao2"  src="<%=basePath %>/static/images/tubiao2.png">');
            }
            if(actor2KnownGroup_dic.length>0){
				//显示柱状图
				process_dic_to_amchart(actor2KnownGroup_dic,'column_chart','actor2_KnownGroup');
            }else{
    			$("#actor2_KnownGroup").html('<img alt="" class="tubiao2"  src="<%=basePath %>/static/images/tubiao2.png">');
            }
            //有数据时大地图的第一个节点点击
			if(data.Country_Nodes.length!=1 && data.Country_Edges.length !=1){
				 $(".leaflet-control-layers label input :eq(1)").click();
	    	}
           
	    }
    </script>
</html>