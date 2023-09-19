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
<title>事件热点展示</title>
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
<link rel="stylesheet" href="<%=basePath %>/static/css/event_heat.css"/><!--z专属样式  -->
<link rel="stylesheet" href="<%=basePath %>/static/css/event_heat_one.css"/><!--z专属样式  -->
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/jquery-1.11.1.min.js"></script>
<script src="<%=basePath%>/static/js/config/config.js"></script>
<script src="<%=basePath%>/static/lib/jquery.pagination.js"></script>
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
		background-image: url(<%=basePath%>/static/css/img/indexB-bg.png);
		background-repeat: no-repeat;
		background-size: 100% 100%;
		position: relative;
		overflow: hidden;
	}
	.nodata_image{
			    top: 50%;
			    left: 50%;
			    position: absolute;
			    margin-top: -290px;
			    margin-left: -190px;
			}
</style>
</head>
<body>
	<div class="index_top clearfix">
		<h3 class="fl title">事件库分析 > 事件热点展示</h3>
	</div>
	<div class="index_bottom" style="padding:0;padding-top:36px; height: 98.8% !important;">
		<!-- 显示图 -->
		<div class="data show" >
			<input type="hidden" id="moduleCode" value="${moduleCode}">
			<div class="show_left">
				<div class="country_sort aaa">
					<span >热力图展示</span><span class="seven"></span>
				</div>
				<!-- 点击切换地图按钮 -->
				<div  class="details">
					<div class="places">
						<div id="china_place" class="place" onclick="toChinaMap(this)">世界</div>
					</div>
				</div>
				<!-- 地图 -->
				<div class="echart" id="word_echart"></div>
				<div class="bottom_echart" style="display: none">
					<div class="bot">
						<div class="country_sort">
							<span>城市排行</span><span class="seven"></span>
						</div>
						<div class="clearfloat" style="clear:both"></div>
						<div class="close_echart"></div>
					</div>
					<div style="width: 99%;height:86%" id="lineBar"></div>
				</div>
			</div>
			<div class="show_right">
				<div class="sh_rig_con">
						<div class="country_sort">
							<span>地域排行</span><span class="seven"></span>
						</div>
				
					<table class="coun_table1">
						<thead>
							<tr>
								<td>序号</td><td id="county">国家</td><td>事件数</td>
							</tr>
						</thead>
					</table>
					<div class="over">
						<table class="coun_table" id="tableData">
							<tbody>
							<!-- 真实数据可参考国家关系 的packTable()方法 -->
							<!-- <tr><td><span class="red_span">1</span></td><td title="斯里兰卡-中国" class="qq">中国</td><td>19.272</td></tr>
							<tr><td><span class="orange_span">2</span></td><td title="斯里兰卡-中国" class="qq">中国</td><td>19.272</td></tr>
							<tr><td><span class="green_span">3</span></td><td title="斯里兰卡-中国" class="qq">中国</td><td>19.272</td></tr>
							<tr><td><span >4</span></td><td title="斯里兰卡-中国" class="qq">中国</td><td>19.272</td></tr> -->
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
<!-- 人工查询功能的日期 -->
<script src="<%=basePath %>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-select.min.js"></script>
<script src="<%=basePath %>/static/js/jquery.combo.select.js"></script>
<script src="<%=basePath %>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath %>/static/js/perfect-scrollbar.js"></script>
<script src="<%=basePath %>/static/js/sec2.js"></script>
<%-- <script src="<%=basePath %>/static/js/yuzhi.js"></script> --%>

<script type="text/javascript" src="<%=basePath %>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/Visualization/base/base.js"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/amcharts.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/themes/light.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amchart_util.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/ammap.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/ammap_util.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/export/export.js" type="text/javascript"></script>
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
<script type="text/javascript" src="<%=basePath%>/static/js/echarts/echarts.js" ></script>
<script type="text/javascript" src="<%=basePath%>/static/js/echarts/map/world.js" ></script>
<script src="<%=basePath %>/static/Visualization/countryEn.js"></script>	
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框js脚本 -->
<script type="text/javascript">
var mapName="world";
$(function(){
	/* $('.circle').on('click',function(){
		$(this).addClass('circleon').siblings('.circle').removeClass('circleon');
		var yLineData2 = yLineData[$(this).attr('val')];
		showBarLine(xLineData[$(this).attr('val')],yLineData2[$('.coun_table .clickon .qq').text()]);
	}) */
	
	$('.close_echart').on('click',function(){
		$(this).parent().parent().toggle()
	})
	/* $("body").on('click','.coun_table tr',function(){
		$(this).addClass('clickon').siblings('tr').removeClass('clickon')
		$('.bottom_echart').show();
		var yLineData2 = yLineData[1];
		showBarLine(xLineData[1],yLineData2[$(this).children('.qq').text()]);
		$('.change_country').html($(this).children('.qq').text()+"  关系时间线");
	}) */
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
var countyData;
var ctry_stateData;
var ctry_cityData;
function render(configId){
	startLoad();
	$("#inputCountryName").val("");//每次切换配置清空查询条件
	$.ajax({
		url:'<%=basePath%>/search/event_heat_viz/'+configId,
		type: 'POST',
		dataType:"json",
		success:function(data){
			console.log("countyData"+JSON.stringify(data.countyData));
			console.log("ctry_stateData"+JSON.stringify(data.ctry_stateData));
			console.log("ctry_cityData"+JSON.stringify(data.ctry_cityData));
			if(data=="-1"){
				endLoad();
				alert("加载失败");
			}
			renderData(data);
			window.setTimeout(endLoad(), 2000);
		}
	});
}
function renderData(data){
	 //国家数据			
	 countyData=data.countyData;
    //州省数据/经纬度
     ctry_stateData=data.ctry_stateData;
    //国家城市数据
     ctry_cityData=data.ctry_cityData;
    //地图
		showMap(mapName,countyData);
    //右侧列表
		showList(mapName,countyData);
	
	
}
//点击返回上一级
function toChinaMap(obj){
	//将下一级的地点标签删除
	$(obj).next().remove();
 	$('.bottom_echart').hide();
	//加载当前选中状态下的中国地图对应的数据
	// $.getJSON("../../static/js/worldJson/MapList.json", function(data) { //详细的表格
		/*  var data=data.worldList;
		 var chinaData=data.chinaList;
		 var data1=data.cityvalue;
		 var geoCoordMap=data.cityGeo; */
		 showMap(mapName,countyData);
		 showList(mapName,countyData);
		//});
}
//地图
var geoCoordMap={};
function showMap(name,data){
   var myChart = echarts.init(document.getElementById('word_echart'));
   //世界地图option所需要数据
  

	//var maxValue = 5;
	if(data==undefined){
		var data=[];
	} 
   var nameMap = {}
	   var jsons ='../../static/js/worldJson/'+name+'.json';  
   $.get(jsons, function (getJson) {
   echarts.registerMap(name,getJson);
   if(name=="world"){
	   var countrySum=[];
	   var maxIndex=0;
	   for(var i=0;i<data.length;i++){
		   var d1 = {
			        name: data[i].enName,
			        value: data[i].value
			       };
		   if(maxIndex<(data[i].value*1)){
				maxIndex = (data[i].value*1);
			}
		   countrySum.push(d1); 
	   }
   }else{
	   //城市数据
	   var stateSum=[];
	   //最大值
	   var maxValue=0;
	   //Geo数据
	   for(var i=0;i<data.length;i++){
		   var d2 = {
			        name: data[i].chName,
			        value: data[i].value
			       };
		   var GeoSum=[];
		   var chName=data[i].chName;
		   GeoSum.push(data[i].lon,data[i].lat);
		   //map添加城市对应的经纬度
		   geoCoordMap[chName] = GeoSum;
		  
		   if(maxValue<(data[i].value*1)){
			   maxValue = (data[i].value*1);
			}
		   stateSum.push(d2);
		   
	   }
	   console.log("geoCoordMap:"+JSON.stringify(geoCoordMap));
	   var convertData = function (stateSum) {
		    var res = [];
		    for (var i = 0; i < stateSum.length; i++) {
		    	var sname=stateSum[i].name;
		    	console.log("geoCoordMap3:"+JSON.stringify(geoCoordMap));
		    	var geoCoord = geoCoordMap[sname];
		        if (geoCoord) {
		            res.push({
		                name: stateSum[i].name,
		                value: geoCoord.concat(stateSum[i].value)
		            });
		        }
		    }
		    return res;
		}; 
	 var option1 = {
		    visualMap: {
		        min: 0,
		        max: maxValue,//动态控制
		        left: 'left',
		        bottom: '10%',
                text: ['高', '低'], // 文本，默认为数值文本
                calculable: true,
                inRange: {
                    color: ['lightskyblue', 'yellow', 'orangered','red'],
                    symbolSize: [2,20]
                },
                textStyle: {
                	color: '#fff',
                }
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter:function(params){
		            return params.name+':'+params.value[2]
		        }
		    },
		    geo: {
		        map: name,
		        label: {
		            emphasis: {
		                show: true
		            }
		        },
		        roam: true,
		        itemStyle: {
		            normal: {
		                color: '#0958a0', //地图背景色
		                borderColor: 'rgba(100,149,237,1)' //省市边界线
		            },
		            emphasis: {
		                color: '#0a82ef' //悬浮背景
		            }
	        	}
		    },
		    series : [
		        {
		            type: 'scatter',
		            coordinateSystem: 'geo',
		            data: convertData(stateSum),
		            label: {
		                normal: {
		                    formatter: '{b}',
		                    position: 'right',
		                    show: false
		                },
		                emphasis: {
		                    show: false
		                }
		            },
		            itemStyle: {
		                normal: {
		                    color: '#ddb926'
		                }
		            }
		        },
		        {
		            type: 'effectScatter',
		            coordinateSystem: 'geo',
		            data: convertData(stateSum.sort(function (a, b) {
		                return b.value - a.value;
		            }).slice(0, 3)),
		            showEffectOn: 'render',
		            rippleEffect: {
		                brushType: 'fill'
		            },
		            hoverAnimation: true,
		            label: {
		                normal: {
		                    formatter: '{b}',
		                    position: 'right',
		                    show: false
		                }
		            },
		            itemStyle: {
		                normal: {
		                    color: '#f4e925',
		                    shadowBlur: 10,
		                    shadowColor: '#333'
		                }
		            },
		            zlevel: 1
		        }
		    ]
		}; 
   }
   var option = {
	    tooltip: {
	        trigger: 'item',
	        textStyle:{
	        	fontSize:'18'
	        }
	    },
	    grid: {
	        show:false
	    },
	    visualMap: {
	        min: 0,
	        max: maxIndex,
	        left: 'left',
	        bottom: '10%',
	        text: ['高', '低'],
	        show:true,
	        colorLightness: [0.2, 100],
	        color: ['red','orangered', 'yellow', 'lightskyblue'],
	        dimension: 0,
	        calculable: true,
            inRange: {
                color: ['lightskyblue', 'yellow', 'orangered','red'],
                symbolSize: [2,20]
            },
            textStyle: {
            	color: '#fff',
            }
	    },
	    xAxis: [{
	       // position: 'top',
	        type: 'value',
	        boundaryGap: false,
	        splitLine: {
	            show: false
	        },
	        axisLine: {
	            show: false
	        },
	        axisTick: {
	            show: false
	        },
	    }],
	    yAxis: [{
	    	show:false,
	        type: 'category',
	        data: name,
	        inverse:true,
	        axisTick: {
	            alignWithLabel: true
	        }
	    }],
	    series: [{
	        z: 1,
	        name: ("分布","")+'数量',
	        type: 'map',
	        map: name,
	        left: '10%',
	        right: '10%',
	        top: "10%",
	        bottom: "10%", 
	        label: {
	            normal: {
	                show: false
	            },
	            emphasis: {
	                show: false
	            }
	        },
	        roam: true,
	        data: countrySum
	    }],
	};
     if(name=="world"){
       myChart.setOption(option);
     } else{
    	 myChart.setOption(option1);
     } 
   }); 
   if(name=="world"){
	   myChart.on('click', function (worldParam) {
	   	 var cname = worldParam.name;
	   	 if(cname.length>6){
	   		var cnameStr=cname.substring(0,6);
	   	    $(".places").append('<div class="place" title="'+cname+'">'+cnameStr+'</div>');
	   	 }else{
	   		$(".places").append('<div class="place">'+cname+'</div>'); 
	   	 }
	   	 var name =  cname.split(' ').join('_');
	   	 $('.bottom_echart').show();
	     //$.getJSON("../../static/js/worldJson/MapList.json", function(result) { //详细的表格
	    	    //国家数据			
				//var data=data.countyData;
			    //州省数据/经纬度
			    //var ctry_stateData=data.ctry_stateData;
			   /*  if(cname="North Korea"){
			       cname=""
			    } */
			    if(cname=="North Korea"){
			       cname="Korea, North"
			    }
			    if(cname=="South Korea"){
			    	cname="Korea, South"
			    }
			    if(cname=="Czechia"){
			    	cname="Czech Republic"
			    }
			    if(cname=="W.Sahara"){
			    	cname="Western Sahara"
			    }
			    if(cname=="The Netherlands"){
			    	cname="Netherlands"
			    }
			    if(cname=="Guinea-Bissau"){
			    	cname="Equatorial Guinea"
			    }
			    if(cname=="Congo-Brazzaville"){
			    	cname="Congo, Republic of the"
			    }
			    if(cname=="Congo-Kinshasa"){
			    	cname="Congo, Republic of the"
			    }
			    var catyData=ctry_stateData[cname];
			    //国家城市数据
			    //var ctry_cityData=data.ctry_cityData;
			    var barDate=ctry_cityData[cname];
	    	if(name=="Côte_d'Ivoire"||name=="New_Caledonia"||name=="W._Sahara"){
	    		$("#word_echart").empty();
	    		var imgHTM='<img class="nodata_image" src="../../static/images/map_none.png">';
	    		$("#word_echart").append(imgHTM);
		   		showList(name,catyData);
		   		showBar(barDate);
	    	}else{
	    		showMap(name,catyData);
		   		showList(name,catyData);
		   		showBar(barDate);
	    	}
	   		
			//});
	   	});
	 }
}

//柱状图
function showBar(chinaData){
	if(chinaData==undefined){
		var chinaData=[];
	} 
	var nameSum=[];
	var valueSum=[];
	var maxIndex=0;
	for(var i=0;i<chinaData.length;i++){
		nameSum.push(chinaData[i].name);
		valueSum.push(chinaData[i].value);
		if(maxIndex<(chinaData[i].value*1)){
			maxIndex = (chinaData[i].value*1);
		}
	}
	console.log(maxIndex);
	var myChart = echarts.init(document.getElementById('lineBar'));
	option = {
		    //backgroundColor:"#111c4e",
		    //color: ['#3398DB'],
		    tooltip: {
		        trigger: 'axis',
		        axisPointer: {
		            type: 'line',
		            lineStyle: {
		                opacity: 0
		            }
		        },
		        formatter: function(prams) {
		            if (prams[0].data ===0) {
		                return prams[0].name+"：0"
		            } else {
		                return prams[0].name+"：" + prams[0].data
		            }
		        }
		    },
		    legend: {
		        data: ['直接访问', '背景'],
		        show: false
		    },
		    grid: {
		        left: '0%',
		        right: '0%',
		        bottom: '5%',
		        top: '7%',
		        height: '85%',
		        containLabel: true,
		        z: 22
		    },
		    xAxis: [{
		        type: 'category',
		        gridIndex: 0,
		        data: nameSum,
		        axisTick: {
		            alignWithLabel: true
		        },
		        axisLine: {
		            lineStyle: {
		                color: '#fff'
		            }
		        },
		        axisLabel: {
		            show: true,
		             color: 'rgb(170,170,170)',
		             fontSize:16,
		             formatter: function(value) {
		                 var res = value;
		                 if(res.length >5) {
		                     res = res.substring(0, 2) + "..";
		                 }
		                 return res;
		                }
		        }
		    }],
		    yAxis: [{
		            type: 'value',
		            gridIndex: 0,
		            splitLine: {
		                show: false
		            },
		            axisTick: {
		                show: false
		            },
		            min: 0,
		            max: maxIndex,
		            axisLine: {
		                lineStyle: {
		                    color: '#fff'
		                }
		            },
		            axisLabel: {
		                color: 'rgb(170,170,170)',
		                formatter: '{value}'
		            }
		        }/* ,
		        {
		            type: 'value',
		            gridIndex: 0,
		            min: 0,
		            max: maxIndex,
		            splitNumber: 12,
		            splitLine: {
		                show: false
		            },
		            axisLine: {
		                show: false
		            },
		            axisTick: {
		                show: false
		            },
		            axisLabel: {
		                show: false
		            },
		            splitArea: {
		                show: true,
		                areaStyle: {
		                    color: ['rgba(250,250,250,0.0)', 'rgba(250,250,250,0.05)']
		                }
		            }
		        } */
		    ],
		    series: [{
		            name: '事件数',
		            type: 'bar',
		            barWidth: '30%',
		            xAxisIndex: 0,
		            yAxisIndex: 0,
		            itemStyle: {
		                normal: {
		                    barBorderRadius: 30,
		                    color: new echarts.graphic.LinearGradient(
		                        0, 0, 0, 1, [{
		                                offset: 0,
		                                color: '#00feff'
		                            },
		                            {
		                                offset: 0.5,
		                                color: '#027eff'
		                            },
		                            {
		                                offset: 1,
		                                color: '#0286ff'
		                            }
		                        ]
		                    )
		                }
		            },
		            data: valueSum,
		            zlevel: 11

		        }/* ,
		        {
		            name: '背景',
		            type: 'bar',
		            barWidth: '50%',
		            xAxisIndex: 0,
		            yAxisIndex: 1,
		            barGap: '-135%',
		            data: valueSum,
		            itemStyle: {
		                normal: {
		                    color: 'rgba(255,255,255,0.1)'
		                }
		            },
		            zlevel: 9
		        },
		       */
		    ]
		};

	myChart.setOption(option);
	
}
//右侧列表
function showList(name,data){
    if(data==undefined){
    	var data=[];
    }
	if(name!="world"){
		$("#county").text("州省");
	}else{
		$("#county").text("国家");
	}
	var trs = "";
	var index = 1;
	for(var i=0;i<data.length;i++){
		if(i==1){
			trs+="<tr><td><span class='red_span'>"+index+"</span></td>";
		}else if(i==2){
			trs+="<tr><td><span class='orange_span'>"+index+"</span></td>";
		}else if(i==3){
			trs+="<tr><td><span class='green_span'>"+index+"</span></td>";
		}else{
			trs+="<tr><td><span>"+index+"</span></td>";
		}
		trs+="<td title='"+data[i].chName+"' class='qq'>"+data[i].chName+"</td>";
		trs+="<td>"+data[i].value+"</td></tr>";
		index++;
	}
	$("#tableData tbody").html(trs);
}



/* function packNewData(data){
	var list = [];
	for(var i=0;i<data.length;i++){
		list.push(-1*data[i])
	}
	return list;
} */
	
</script>
</html>