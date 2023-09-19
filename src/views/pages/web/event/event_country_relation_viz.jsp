<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>国家关系展示</title>
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
<link rel="stylesheet" href="<%=basePath %>/static/css/eventCountryRelation.css"/><!--z专属样式  -->
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/jquery-1.11.1.min.js"></script>
<script src="<%=basePath%>/static/js/config/config.js"></script>
<script src="<%=basePath%>/static/lib/jquery.pagination.js"></script>
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
	.index_bottom{
			background-image: url(<%=basePath%>/static/css/img/bg_new.png);
			background-repeat: no-repeat;
			background-size: 100% 100%;
			position: relative;
			overflow: hidden;
		}
	.zhezhao{
		width:100%;
		height:calc(100% - 40px);
		position:fixed;
		top:0;
		bottom:0;
		left:0;
		right:0;
		display:none;
		background-color:rgba(0,0,0,0.5);
		z-index:101;
	}
	.popup_echart{
		position: absolute;
	    left:50%;
	    top:50%;
	    transform: translateX(-50%) translateY(-50%);
	        border-radius: 8px;
	}
	#info{
		top: 87px!important;
	}
	/* 弹出框样式 */
	.window-panel .content{
	    font-size: 16px;
	    min-height: 46px;
	    line-height: 22px;
    }
</style>
</head>
<body>
	<div class="index_top clearfix">
		<h3 class="fl title">事件库分析 > 国家关系展示</h3>
	</div>
	<div class="index_bottom" style="padding:0;padding-top:36px; height: 98.8% !important;">
		<!-- 显示图 -->
		<div class="data show1" >
			<input type="hidden" id="moduleCode" value="${moduleCode}">
			<div class="show_left">
				<div class="country_sort aaa">
					<span >国家关系地域分布</span><span class="seven"></span>
				</div>
				<div class="bor">
		                <div id="map" class="myleafletjsMap"></div>
		                <div id="info" class="leaflet-control-legend">
		                	<span style="font-style: italic; font-size: 16px;">Click on CountryNode to view details
		                		<img class="isShowViewImage" id="isShowView-image" onclick="isShowView()" src="<%=basePath%>/static/images/mapInfoUp.png">
		                	</span>
		                	<div id="info-table"></div>
		                </div>
	            </div>
				<div class="zhezhao">
					<div class="bottom_echart popup_echart">
					<div class="bot">
						<div class="country_sort1">
							<span class="change_country"></span><span class="seven"></span>
						</div>
						<div class="float_right">
							<span>时间粒度：</span>
							<span class="circle" val="4" id="dd"></span><span>年</span><span class="circle" val="3"></span><span>月</span><span class="circle" val="2"></span><span>周</span><span class="circle circleon" val="1"></span><span>日</span>
						</div>
						<div class="clearfloat" style="clear:both"></div>
						<div class="close_echart"></div>
					</div>
					<div style="width: 99%;height:86%" id="lineBar"></div>
					</div>
				</div>
				
			</div>
			<div class="show_right">
				<div class="sh_rig_con">
					
						<div class="country_sort">
							<span>国家关系排行榜</span><span class="seven"></span>
						</div>
						<div class="country_name">
							<input type="text" placeholder="请输入国家名称" id="inputCountryName"><span class="search" onclick="queryCountry()">查询</span>
						</div>
				
					<table class="coun_table1">
						<thead>
							<tr>
								<td>序号</td><td>国家</td><td>关系指数</td>
							</tr>
						</thead>
					</table>
					<div class="over">
						<table class="coun_table" id="tableData">
							<tbody>
							</tbody>
						</table>
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
<!-- leafet地图 -->
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/leaflet-src.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/leaflet.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/tile.stamen.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/geohash.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/underscore-min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/moment.min.js" ></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/leaflet-dvf.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/leaflet.dvf.experimental.js"></script>
<script src="<%=basePath%>/static/js/map-tileLayer.js"	type="text/javascript"></script>	
<!-- 计算显示图的高度 -->	
<script src="<%=basePath%>/static/js/chartHeight.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/js/jquery.combo.select.js"></script>
<script src="<%=basePath%>/static/js/perfect-scrollbar.js"></script>
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
<script type="text/javascript" src="<%=basePath%>/static/js/echarts/echarts.js" ></script>
<script src="<%=basePath %>/static/Visualization/countryEn.js"></script>	
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<script type="text/javascript">
	$(function(){
		//国家关系附加参数展示
		$(".countryRelation").show();
		//高级查询样式修改
		//$(".show").css("display","block");
		$('.circle').on('click',function(){
			$(this).addClass('circleon').siblings('.circle').removeClass('circleon');
			var yLineData2 = timeLineDataDate;
			var xLineData2 = xLineData["date"];
			if($(this).attr('val')==2){//周 力度
				yLineData2 = timeLineDataWeek;
				xLineData2 = xLineData["week"];
			}else if($(this).attr('val')==3){//月 力度
				yLineData2 = timeLineDataMonth;
				xLineData2 = xLineData["month"];
			}else if($(this).attr('val')==4){//年力度
				yLineData2 = timeLineDataYear;
				xLineData2 = xLineData["year"];
			}
			showBarLine(xLineData2,yLineData2[$('.coun_table .clickon .qq').text()]);
		})
		
		$('.close_echart').on('click',function(){
			/* $(this).parent().parent().toggle() */
			$('.zhezhao').hide()
			/* $('.popup1').hide() */
		})
		$("body").on('click','.coun_table tr',function(){
			$(this).addClass('clickon').siblings('tr').removeClass('clickon')
			$('.zhezhao').show();
			/* $('.popup1').show(); */
			//默认展示年数据
			$("#dd").addClass('circleon').siblings('.circle').removeClass('circleon');
			var yLineData2 = timeLineDataYear;
			showBarLine(xLineData["year"],yLineData2[$(this).children('.qq').text()]);
			$('.change_country').html($(this).children('.qq').text()+"  关系时间线");
		})
		 $(".zhezhao").on("click", function() {
            $(this).hide();
        });
		 $(".popup_echart").on("click", function(e) {			 
            e.stopPropagation();
        })
		//处理配置
		handleConfigs();
		//控制Tone字段的显示问题
		//美化滚动条
		glorifyComboSelect();
		gkgToneIsShow();
		
	});
	
	
	   
	//leaftlet的全局变量
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
	// 加载leaftlet地图 
	function showLeafletMap(Country_Nodes,Country_Edges){
		
		$("#info-table").empty();
		//先让被选中的节点去掉
		qxMapSelectNode();
		
		//设置地图的中心位置
		map.setView([ 47.8, 30 ], 2);
		
		if(layerControl != null){
        	//把控制图层移除
        	try{
        		map.removeControl(layerControl);
            	map.removeControl(legendControl);
            	map.removeLayer(CountryEdgeLayer);
            	map.removeLayer(Country_NodesLayer);
            	map.removeLayer(allLayer);
        	}catch(e){
        		
        	}
        }
        if(Country_Nodes.length>0 && Country_Edges.length>0){
            layerControl = L.control.layers().addTo(map);
            legendControl = L.control.legend({autoAdd: false}).addTo(map);
            var Country_NodesLookup = L.GeometryUtils.arrayToMap(Country_Nodes, 'countryCode');
            Country_Edges = _.sortBy(Country_Edges, function (value) {
                return -1 * value.联系数;
            });
            var CountryEdgeLookUp = _.groupBy(Country_Edges, function (value) {
                return value.国家1;
            });
            var maxCountAll = Number(Country_Edges[0].联系数);
            Country_Edges = _.filter(Country_Edges, function (value) {
                return value.国家1 !== 'all';
            });
            var maxCount = Number(Country_Edges[0].联系数);
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
            var sizeFunction = new L.LinearFunction([1, 20], [253, 48]);
            var options = {
                recordsField: null,
                locationMode: L.LocationModes.CUSTOM,
                fromField: '国家编码1',
                toField: '国家编码2',
                codeField: null,
                getLocation: getLocation,
                getEdge: L.Graph.EDGESTYLE.ARC,
                includeLayer: function (record) {
                    return false;
                },
                getIndexKey: function (location, record) {
                    return record.国家编码1 + '_' + record.国家编码2;
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
                    opacity: 1,
                    weight: 1,
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
                    	联系数: {
	                        weight: new L.LinearFunction([0, 2], [maxCount, 4]),
	                        color: new L.HSLHueFunction([0, 200], [maxCount, 330], {
	                            outputLuminosity: '60%'
	                        }),
	                        displayName: '联系数'
	                    }
                },
                onEachRecord: function (layer, record) {
                	console.log("record="+JSON.stringify(record));
                	var new_record =  '{"'+record.国家编码1+'":"'+record.国家1+'","'+record.国家编码2+'":"'+record.国家2+'","联系数":'+record.联系数+'}';
                    layer.bindPopup($(L.HTMLUtils.buildTable($.parseJSON(new_record))).wrap('<div/>').parent().html());
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
                    }
                },
                layerOptions: {
                    fill: false,
                    stroke: false,
                    weight: 0,
                    color: '#A0A0A0'
                },
                setIcon: function (record, options) {
                    var html = '<div><i class="fa fa-flag"></i></div>';
                    var $html = $(html);
                    var $i = $html.find('i');
                    L.StyleConverter.applySVGStyle($i.get(0), options);
                    var directCountry_Edges = L.Util.getFieldValue(record, 'nodeSize');
                    var size = sizeFunction.evaluate(directCountry_Edges);//控制图标的大小
                    $i.width(size);
                    $i.height(size);
                    $i.css('font-size', 25 + 'px');
                    $i.css('line-height', 25 + 'px');
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
                    	var chineseName = record.chineseName;
                    	//
                    	$("#inputCountryName").val(chineseName);//赋值给搜索框
                		queryCountry();//执行查询方法
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
                            return newRecord.国家编码1 === record.countryCode || newRecord.国家编码2 === record.countryCode;
                        };
                        allLayer.reloadData();
                    });
                }
            });
            map.addLayer(Country_NodesLayer);
            //layerControl.addOverlay(Country_NodesLayer, 'countryNodes');
        }
        for (var key in CountryEdgeLookUp) {
            if (key !== 'all' && count <20) {//控制可显示国家的数量
                var CountryNodeOptions = L.extend(options, {
                    includeLayer: function (record) {
                        return record.国家1 === key;
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
		//有数据时大地图的第一个节点点击
		/* if(Country_Nodes.length!=1 && Country_Edges.length !=1){
			 
    	} */
        $(".leaflet-control-layers label").click();
	}
	
	function render(configId){
		startLoad();
		$('.zhezhao').hide();
		/* $('.popup1').hide(); */
		$("#inputCountryName").val("");//每次切换配置清空查询条件
		$.ajax({
			url:'<%=basePath%>/search/event_country_relation_viz/'+configId,
			type: 'POST',
			dataType:"json",
			success:function(data){
				if(data=="-1"){
					endLoad();
					win.alertEx("加载失败");
				}
				renderData(data);
				window.setTimeout(endLoad(), 2000);
			}
		});
	}
	function renderData(data){
		xLineData = data.xLineData;
		timeLineDataDate = data.timeLineDataDate;
		timeLineDataWeek = data.timeLineDataWeek;
		timeLineDataMonth = data.timeLineDataMonth;
		timeLineDataYear = data.timeLineDataYear;
		countryTableData = data.countryTableData;
		packTable(countryTableData);
		
		var Country_Nodes = data.Country_Nodes;
		var Country_Edges = data.Country_Edges;
		console.log("Country_Nodes"+JSON.stringify(Country_Nodes));
		console.log("Country_Edges"+JSON.stringify(Country_Edges));
		///////////
		//$("#inputCountryName").val(countrySet[maxCountryName]);//赋值给搜索框
		//queryCountry();//执行查询方法
		
		//加载地图
		showLeafletMap(Country_Nodes,Country_Edges);
	}
	function queryCountry(){
		var input = $("#inputCountryName").val();
		var newData = {};
		for(var b in countryTableData){
			if(b.indexOf(input)!=-1){
				newData[b]=countryTableData[b];
			}
		}
		packTable(newData);
	}
	
	function packTable(data){
		var trs = "";
		var index = 1;
		for(var b in data){
			if(index>300){//为了缓解前端页面的展示卡顿
				break;
			}
			if(index==1){
				trs+="<tr><td><span class='red_span'>"+index+"</span></td>";
			}else if(index==2){
				trs+="<tr><td><span class='orange_span'>"+index+"</span></td>";
			}else if(index==3){
				trs+="<tr><td><span class='green_span'>"+index+"</span></td>";
			}else{
				trs+="<tr><td><span>"+index+"</span></td>";
			}
			trs+="<td title='"+b+"' class='qq'>"+b+"</td>";
			trs+="<td>"+data[b]+"</td></tr>";
			index++;
		}
		$("#tableData tbody").html(trs);
	}
	function findMaxNum(data){
		var maxNum = 0;
		var maxNums = 5;
		for(var i=0;i<data.length;i++){
			for(var j=0;j<data[i].length;j++){
				if(data[i][j] > maxNum){
					maxNum = data[i][j];
				}
			}
		}
		if(maxNum>5){
			maxNums = 10;
		}
		return maxNums;
	}
	function showBarLine(xData,yData){
		var maxNum = findMaxNum(yData);
		var data_chart = echarts.init(document.getElementById('lineBar'));
		var option = {
			backgroundColor: '#1b233482',
		    tooltip: {
		        trigger: 'axis',
		        axisPointer: {
		            type: 'shadow',
		            crossStyle: {
		                color: '#999'
		            }
		        }
		    },
		    /* 
		    toolbox: {
		    	show:false,
		    }, */
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
		   grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '10%',
		        top:'5%',
		        containLabel: true
		    }, 
		    legend: {
		        data:['口头合作','利益合作','口头冲突','利益冲突','合作均值','冲突均值','关系曲线'],
		        textStyle:{
                    fontSize: 12,//字体大小
                    color: '#ffffff'//字体颜色
                },
		    },
		    dataZoom: [{
				 type: 'slider',
				 show: true,
				 xAxisIndex: [0],
				 bottom:5,
				 start: 0,
				 end: 100, //初始化滚动条
				 textStyle:{
                    fontSize: 12,//字体大小
                    color: '#ffffff'//字体颜色
                },
			}],
		    xAxis: [
		        {
		            type: 'category',
		            data: xData,
		            axisPointer: {
		                type: 'shadow'
		            },
		            axisTick:false,
		            axisLine:{
                        lineStyle:{
                            color:'#fff',
                            width:1,//这里是为了突出显示加上的
                        }
                    },
                    splitLine: {
                        show: false,
                    }
		        }
		    ],
		    yAxis: [
		        {
		            type: 'value',
		            // min:-maxNum,
		            // max:maxNum,
					min: -10,
					max: 10,
		            splitNumber:5,//有很多情况下这个设置的值是无效的，因为他本身规则的优先级要高一些。
		            axisLabel: {
		                formatter: '{value}'
		            },
		            splitLine:{
				　　　　show:false
				　　 },
					itemStyle:{
                        normal:{
                            color:'#fff'
                        }
                    },
					axisLine:{
                        lineStyle:{
                            color:'#fff',
                            width:1,//这里是为了突出显示加上的
                        }
                    }
		        }
		    ],
		    series: [
		        {
		            name:'口头合作',
		            type:'bar',
		            stack:"合作",
		            data:yData[0],
		            itemStyle:{
                        normal:{
                            color:'#90ee90'
                        }
                    }
		        },{
		            name:'利益合作',
		            type:'bar',
		            stack:"合作",
		            data:yData[1],
		            itemStyle:{
                        normal:{
                            color:'#32cd32'
                        }
                    }
		        },{
		            name:'口头冲突',
		            type:'bar',
		            stack:"冲突",
		            data:packNewData(yData[2]),
		            itemStyle:{
                        normal:{
                            color:'#ffb90f'
                        }
                    }
		        },{
		            name:'利益冲突',
		            type:'bar',
		            stack:"冲突",
		            barGap: '-100%',
		            data:packNewData(yData[3]),
		            itemStyle:{
                        normal:{
                            color:'#ff8c00'
                        }
                    }
		        },{
		            name:'合作均值',
		            type:'line',
		            smooth:true,   //关键点，为true是不支持虚线的，实线就用true
		            data:yData[4],
		            symbol: 'circle',
		            itemStyle:{
                        normal:{
                            color:'#0cff00'
                        }
                    }
		        },{
		            name:'冲突均值',
		            type:'line',
		            symbol: 'circle',
		            smooth:true,
		            data:packNewData(yData[5]),
		            itemStyle:{
                        normal:{
                            color:'#ff0000'
                        }
                    }
		        },{
		            name:'关系曲线',
		            type:'line',
		            smooth:true,
		            data:yData[6],
		            symbol: 'circle',
		            itemStyle:{
                        normal:{
                            color:'#f6ff00'
                        }
                    }
		        }
		    ]
		};
		data_chart.setOption(option);
	}
	
	function packNewData(data){
		var list = [];
		for(var i=0;i<data.length;i++){
			list.push(-1*data[i])
		}
		return list;
	}
	
	//leaft
    </script>
</html>