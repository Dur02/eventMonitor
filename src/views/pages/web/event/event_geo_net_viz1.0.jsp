<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>地理网络</title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/style.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath%>/static/lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/combo.select.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/perfect-scrollbar.css" />
<link rel="shortcut icon" type="image/x-icon" href="<%=basePath%>/static/Visualization/base/ico.png" />
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/base/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/base/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/base/base.css" />
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/event_result.css" />
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/js/amcharts/export/export.css" />
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/leaflet.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/dvf.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/example.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/ui.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/infomap.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/geonetmap.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window_zs.css"/><!-- 弹出提示框样式 -->
<style type="text/css">
	.info-talbe{
		margin-top: 3px;
		margin-bottom: 10px;
	}
</style>
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
</head>
<body>
	<div class="index_top clearfix">
		<h3 class="fl title">事件库分析 > 地理网络</h3>
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
					<h3 class="tx-c mapText">地理联系展示
		            		<div  class="help" onmouseover="showChartInfo(1,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
	            	</h3>
		            <div class="bor">
		                <div id="map" class="myleafletjsMap"></div>
						<div id="tab_down_info"  class="leaflet-control-legend">
							<span style="font-style: italic; font-size: 16px;">Click on LocationNode to view details
								<img class="isShowViewImage" id="isShowView-image" onclick="isShowView()" src="<%=basePath%>/static/images/mapInfoUp.png">
							</span>
							<div id="info-table"></div>
						</div>
		            </div>
	            </div>
			</div>
			<div class="row" id="charts_area">
				<div class="col-md-12 mg_t">
					<div class="col-md-12 bor">
						<h3 id="graph_country_text" class="tx-c">国家联系展示
							<select  class="selectCounts" style="margin-left:10px;" id="selectCountry"></select>
							<div  class="help" onmouseover="showChartInfo(2,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
						</h3>
						<div id="graph_country" class="amcharts oneColumChart"></div>
					</div>
				</div>
			</div>
			<div class="row" id="charts_area">
				<div class="col-md-12 mg_t mg_b">
					<div id="chart-content">
						<div class="col-md-6 bor w50l">
							<h3 id="graph_state_text" class="tx-l">州省联系展示
								<select class="selectCounts" style="margin-left:10px;" id="selectState"></select>
								<div  class="help" onmouseover="showChartInfo(3,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
							</h3>
							<div id="graph_state" class="amcharts twoCharts"></div>
						</div>
						<div class="col-md-6 bor w50r">
							<h3 id="graph_city_text" class="tx-l">城市联系展示
								<select  class="selectCounts" style="margin-left:10px;" id="selectCity"></select>
								<div  class="help" onmouseover="showChartInfo(4,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
							</h3>
							<div id="graph_city" class="amcharts twoCharts">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 条件tab页 st -->
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
<script src="<%=basePath%>/static/Visualization/base/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/static/Visualization/base/base.js"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/amcharts.js"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/themes/light.js"></script>
<script src="<%=basePath%>/static/Visualization/js/amchart_util.js"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/ammap.js"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/export/export.js"></script>
<script src="<%=basePath%>/static/Visualization/js/leaflet/leaflet-src.js"></script>
<script src="<%=basePath%>/static/Visualization/js/leaflet/leaflet.js"></script>
<script src="<%=basePath%>/static/Visualization/js/leaflet/tile.stamen.js"></script>
<script src="<%=basePath%>/static/Visualization/js/leaflet/geohash.js"></script>
<script src="<%=basePath%>/static/Visualization/js/leaflet/underscore-min.js"></script>
<script src="<%=basePath%>/static/Visualization/js/leaflet/moment.min.js"></script>
<script src="<%=basePath%>/static/Visualization/js/leaflet/leaflet-dvf.js"></script>
<script src="<%=basePath%>/static/Visualization/js/leaflet/leaflet.dvf.experimental.js"></script>
<script src="<%=basePath%>/static/Visualization/datamap/d3.min.js"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/serial.js"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/pie.js"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/radar.js"></script>
<script src="<%=basePath%>/static/loading/js/loading.js"></script>
<!-- 人工查询js -->
<script src="<%=basePath %>/static/Visualization/rgQuery.js"></script>
<script src="<%=basePath%>/static/Visualization/downLoad.js"></script>
<script src="<%=basePath%>/static/js/map-tileLayer.js"></script>
<!-- 计算显示图的高度 -->	
<script src="<%=basePath%>/static/js/chartHeight.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<script type="text/javascript">
	$(function(){
		//美化图表展示界面的右侧滚动条
		//index_bottom_perfectScrollbar();
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
 	var map;
 	var $info = $('#tab_down_info');
   	var $map = $('#map');
 	map = L.map('map');
 	//bounds
	var corner1 = L.latLng(-60, -180),
   	corner2 = L.latLng(90, 180),
   	bounds = L.latLngBounds(corner1, corner2); 
   	map.setMaxBounds(bounds);
   	
 	var baseLayer = getOSMBrightLayer().addTo(map);
 	//定义全局控制图层
 	var layerControl = null;
 	var legendControl = null;
 	
	function render(configId){
		startLoad();
		$("#info-table").empty();
			$.ajax({
				url:'<%=basePath%>/search/event_geo_net_viz/'+configId,
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
		//清空info-table内容
		$("#info-table").empty();
		//先让被选中的节点去掉
		qxMapSelectNode();
		var Location_Nodes = data.Location_Nodes;
		var Location_Edges = data.Location_Edges;
		var country_dic = data.country_dic;
		var city_dic = data.city_dic;
		var state_dic = data.state_dic;
		var viewLatLong = data.viewLatLong;
		if(country_dic.length>0){
			$("#selectCountry").show();
			$("#selectCountry").html(""); 
			var countryNum = country_dic.length > 20 ? 20:country_dic.length;
			for(var i=5;i<=countryNum;i+=5){
				document.getElementById("selectCountry").options.add(new Option(i,i));
			} 
			var	countryOptionCount = $("#selectCountry option").map(function(){return $(this).val();}).get().join(", ");
			if(countryOptionCount.indexOf(15)!=-1){
				$("#selectCountry option[value='15']").attr("selected",true);
				process_dic_to_amchart2(country_dic,'column_chart','graph_country',15);
			}else{
				$("#selectCountry").hide();
				process_dic_to_amchart2(country_dic,'column_chart','graph_country',countryNum);
			}
			$("#selectCountry").change(function () {
	        	var changeValue = $("#selectCountry option:selected").val();
        		process_dic_to_amchart2(country_dic,'column_chart','graph_country',changeValue);
	        });
		}else{
			$("#selectCountry").hide();
			$("#graph_country").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
		}
		if(state_dic.length > 0){
			$("#selectState").show();
			$("#selectState").html(""); 
			var stateNum = state_dic.length > 20 ? 20:state_dic.length;
			for(var i=2;i<=stateNum;i+=2){
				document.getElementById("selectState").options.add(new Option(i,i));
			}
			var countryOptionCount = $("#selectState option").map(function(){return $(this).val();}).get().join(", ");
			
			if(countryOptionCount.indexOf(8)!=-1){
				$("#selectState option[value='8']").attr("selected",true);
				process_dic_to_pie(state_dic,'pie_chart','graph_state',8);
			}else{
				$("#selectState").hide();
				process_dic_to_pie(state_dic,'pie_chart','graph_state',stateNum);
			}
			
			$("#selectState").change(function () {
	        	var changeValue = $("#selectState option:selected").val();
	        	process_dic_to_pie(state_dic,'pie_chart','graph_state',changeValue);
	        });
		}else{
			$("#selectState").hide();
			$("#graph_state").html('<img alt="" class="tubiao2"  src="<%=basePath %>/static/images/tubiao2.png">');					
		}
		if(city_dic.length > 0){
			$("#selectCity").show();
			$("#selectCity").html(""); 
			var cityNum = city_dic.length > 20 ? 20:city_dic.length;
			for(var i=3;i<=cityNum;i+=3){
				document.getElementById("selectCity").options.add(new Option(i,i));
			}
			var cityOptionCount = $("#selectCity option").map(function(){return $(this).val();}).get().join(", ");
			if(cityOptionCount.indexOf(6)!=-1){
				$("#selectCity option[value='6']").attr("selected",true);
				process_dic_to_amchart2(city_dic,'radar_chart','graph_city',6);
			}else{
				$("#selectCity").hide();
				process_dic_to_amchart2(city_dic,'radar_chart','graph_city',cityNum);
			}
	        $("#selectCity").change(function () {
	        	var changeValue = $("#selectCity option:selected").val();
        		process_dic_to_amchart2(city_dic,'radar_chart','graph_city',changeValue);
	        });
		}else{
			$("#selectCity").hide();
			$("#graph_city").html('<img alt="" class="tubiao2"  src="<%=basePath %>/static/images/tubiao2.png">');
		}
		//处理页面展示的中心位置
		if(viewLatLong == undefined || viewLatLong.length == 0){
			map.setView([ 37.8, 113.7 ], 3);
		}else{
			map.setView(viewLatLong,3);
		}
		
        if(layerControl != null){
        	//把控制图层移除
        	map.removeControl(layerControl);
        	map.removeControl(legendControl);
        	map.removeLayer(LocationEdgeLayer);
        	map.removeLayer(allLayer);
        	map.removeLayer(Location_NodesLayer);
        }
        //添加
      	legendControl = new L.Control.Legend({autoAdd: false})
      	legendControl.addTo(map);
      	//添加控制图层
       	layerControl = new L.Control.Layers()
       	layerControl.addTo(map);
        var Location_NodesLookup = L.GeometryUtils.arrayToMap(Location_Nodes, 'locationName');
        
    	Location_Edges = _.sortBy(Location_Edges, function (value) {
            return -1 * value.eventSum;
        });
    	var LocationEdgeLookUp = _.groupBy(Location_Edges, function (value) {
            return value.originator;
        });
        Location_Edges = _.filter(Location_Edges, function (value) {
            return value.originator !== 'all';
        });
        var maxCount = Number(Location_Edges[0].eventSum);
        var count = 0;
        var getLocation = function (context, locationField, fieldValues, callback) {
            var key = fieldValues[0];
            var LocationNode = Location_NodesLookup[key];
            var location;
            if (LocationNode) {
                var latlng = new L.LatLng(Number(LocationNode.lat), Number(LocationNode.lon));
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
                fromField: 'originator',
                toField: 'destination',
                codeField: null,
                getLocation: getLocation,
                getEdge: L.Graph.EDGESTYLE.ARC,
                includeLayer: function (record) {
                    return false;
                },
                getIndexKey: function (location, record) {
                    return record.originator + '_' + record.destination;
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
                    iconSize: new L.Point(100, 66),
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
        allLayer = new L.Graph(Location_Edges, options);
        map.addLayer(allLayer);
        Location_NodesLayer = new L.MarkerDataLayer(Location_NodesLookup, {
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
                'locationName222': {
                    title: function (value) {
                        return value;
                    }
                }
            },
            layerOptions: {
                fill: false,
                stroke: false,
                weight: 0,
                color: '#A0A0A0'
            },
            /* filter: function (record) {
                return Number(record.threshold) > 0;///
            }, */
            setIcon: function (record, options) {
                var html = '<div><i class="fa fa-flag"></i></div>';
                var $html = $(html);
                var $i = $html.find('i');
                L.StyleConverter.applySVGStyle($i.get(0), options);
                var directLocation_Edges = L.Util.getFieldValue(record, 'nodeSize');
                var size = sizeFunction.evaluate(directLocation_Edges);
                $i.width(size);
                $i.height(size);
                $i.css('font-size', size + 'px');
                $i.css('line-height', size + 'px');
                var $code = $html.find('.code');
                $code.width(size);
                $code.height(size);
                $code.css('line-height', size + 'px');
                $code.css('font-size', size / 3 + 'px');//
                $code.css('margin-top', -size / 2 + 'px');
                var icon = new L.DivIcon({
                    iconSize: new L.Point(size, size),
                    iconAnchor: new L.Point(size / 2, size / 2),
                    className: 'locationnode-icon',
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
                        return newRecord.originator === record.locationName || newRecord.destination === record.locationName;
                    };
                    allLayer.reloadData();
                });
            }
        });
        
        //默认选中
        map.addLayer(Location_NodesLayer);
        
        layerControl.addOverlay(Location_NodesLayer, 'LocationNodes');
        for (var key in LocationEdgeLookUp) {
            if (key !== 'all' && count <20) {//控制可显示国家的数量
                var LocationNodeOptions = L.extend(options, {
                    includeLayer: function (record) {
                        return record.originator === key;
                    }
                });
                LocationEdgeLayer = new L.Graph(Location_Edges, LocationNodeOptions);
                
               layerControl.addOverlay(LocationEdgeLayer, key);
                if (count === 0) {
                    legendControl.addLayer(LocationEdgeLayer);
                }
                count++;
            }
        }
      	//有数据时大地图的第一个节点点击
		if(Location_Nodes.length!=1 && Location_Nodes.length !=1){
			 $(".leaflet-control-layers label input :eq(1)").click();
    	}
	}
	
	var autoTextarea = function (elem, extra, maxHeight) {
	    extra = extra || 0;
	    var isFirefox = !!document.getBoxObjectFor || 'mozInnerScreenX' in window,
	    isOpera = !!window.opera && !!window.opera.toString().indexOf('Opera'),
	        addEvent = function (type, callback) {
	            elem.addEventListener ?
	                elem.addEventListener(type, callback, false) :
	                elem.attachEvent('on' + type, callback);
	        },
	        getStyle = elem.currentStyle ? 
	        function (name) {
	            var val = elem.currentStyle[name];
	            if (name === 'height' && val.search(/px/i) !== 1) {
	                var rect = elem.getBoundingClientRect();
	                return rect.bottom - rect.top -
	                       parseFloat(getStyle('paddingTop')) -
	                       parseFloat(getStyle('paddingBottom')) + 'px';       
	            };
	            return val;
	        } : function (name) {
	            return getComputedStyle(elem, null)[name];
	        },
	    minHeight = parseFloat(getStyle('height'));
	    elem.style.resize = 'both';//如果不希望使用者可以自由的伸展textarea的高宽可以设置其他值

	    var change = function () {
	        var scrollTop, height,
	            padding = 0,
	            style = elem.style;

	        if (elem._length === elem.value.length) return;
	        elem._length = elem.value.length;

	        if (!isFirefox && !isOpera) {
	            padding = parseInt(getStyle('paddingTop')) + parseInt(getStyle('paddingBottom'));
	        };
	        scrollTop = document.body.scrollTop || document.documentElement.scrollTop;

	        elem.style.height = minHeight + 'px';
	        if (elem.scrollHeight > minHeight) {
	            if (maxHeight && elem.scrollHeight > maxHeight) {
	                height = maxHeight - padding;
	                style.overflowY = 'auto';
	            } else {
	                height = elem.scrollHeight - padding;
	                style.overflowY = 'hidden';
	            };
	            style.height = height + extra + 'px';
	            scrollTop += parseInt(style.height) - elem.currHeight;
	            document.body.scrollTop = scrollTop;
	            document.documentElement.scrollTop = scrollTop;
	            elem.currHeight = parseInt(style.height);
	        };
	    };

	    addEvent('propertychange', change);
	    addEvent('input', change);
	    addEvent('focus', change);
	    change();
	};
	
	</script>
</html>