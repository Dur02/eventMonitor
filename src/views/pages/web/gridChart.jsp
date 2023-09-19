<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <style type="text/css">
    	#chartdiv{
		   	width:100%;
		   	height:400px;
		   	font-size:11px;
    	}
    	#chartdiv2{
    		width:100%;
    		height:400px;
    	}
    	#chartdiv3{
    		width:100%;
    		height:400px;
    	}
    </style>
       <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
       <title>网格展示</title>
       	<link rel="stylesheet" href="../static/css/style.css">
		<link rel="stylesheet" id="main_link" href="../static/css/sec2.css">
		<link rel="stylesheet" href="../static/css/bootstrap-datepicker.min.css">
		<link rel="stylesheet" href="../static/css/bootstrap-datepicker.standalone.css">
		<link rel="stylesheet" href="../static/lib/pagination.css" />
		<script type="text/javascript" src="../static/js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="../static/js/echarts/echarts.js"></script>
		<script src="../static/lib/jquery.pagination.js"></script>
		<script src="../static/js/bootstrap-datepicker.min.js"></script>
		<script src="../static/js/bootstrap-datepicker.zh-CN.min.js"></script>
		<script src="../static/js/sec2.js"></script>
	<!-- 条件tab页 ed -->
	<script type="text/javascript" src="../static/js/echarts/map/china.js"></script>
	<script type="text/javascript" src="../static/js/echarts/map/world.js"></script>
    <!--Resource-->
    <script src="../static/js/amcharts/amcharts.js"></script>
	<script src="../static/js/amcharts/serial.js"></script>
	<script src="../static/js/amcharts/plugins/export/export.min.js"></script>
	<link rel="stylesheet" href="../static/js/amcharts/plugins/export/export.css" type="text/css" media="all" ></script>
	<script src="../static/js/amcharts/themes/light.js"></script>
	<script src="../static/js/amcharts/pie.js"></script>
	<script src="../static/js/amcharts/radar.js"></script>
  </head>
<body>
    <div class="index_top clearfix">
		<h3 class="fl title">事件分析 > 网格展示</h3>
		<div class="title_r fr">
			<span class="export_img_2" title="图表切换"></span>
			<span class="info_img"></span>
			<ul class="info_box">
				<li><span>数据：</span>事件数据库</li>
				<li><span>描述：</span>反映一段时间内，某地发生的事件的对比情况</li>
				<li><span>输入：</span>对比信息，事件编码，阈值信息</li>
				<li><span>介绍：</span>ttajkasdasdfa asdfasdf asdfa啊发生的发生地阿打法的疯狂拉升地方案的发生发生的法律看见俺十分啊发生的发生地发沙发</li>
			</ul>
		</div>
	</div>
	<div>
	</div>
	<div id="chartdiv4" style="width: 100%; height: 400px;"></div>
	<div style="height: 50%; border-top: 10px solid #fff;">
		<div id="chartdiv" style="width: 40%; height: 100%; float: left;" ></div>
		<div id="chartdiv2" style="width: 25%; height: 100%; float: left;" ></div>
		<div id="chartdiv3" style="width: 35%; height: 100%; float: left;"></div>
	</div>
	<!-- 条件tab页 st -->
	<div class="tab" style="">
	<span class="ul_xl"></span>
	<ul id="tab_ul" class="tab_ul clearfix">
		<c:forEach items="${gridList }" var = "grid" varStatus="indx">
		<c:if test="${indx.index == 0 }">
			<li class="active mgl-30" onclick="render(${grid.configId})">${grid.configName }<b></b><span></span></li>
		</c:if>
		<c:if test="${indx.index != 0 }">
			<li class="" onclick="render(${grid.configId})">${grid.configName }<b></b><span></span></li>
		</c:if>
		</c:forEach>
		<li class="manual">人工输入查询<b></b></li>
	</ul>
	<div class="tab_div">
	<c:forEach items="${gridList}" var = "grid" varStatus="indx">
		<!-- 预设点A -->
		<c:if test="${indx.index == 0 }">
		<div class="tab_down show"></div>
		</c:if>
		<c:if test="${indx.index != 0 }">
		<div class="tab_down" ></div>
		</c:if>
			<ul class="tab_down_info">
				<li class="clearfix">
				<c:forEach items="${grid.dateInfo }" var="grid2">
					<div class="td1 fl"><p class="time_png fl"></p><b>日期属性：</b></div>
					<c:if test="${grid.dateType == 1}">
					<div class="td2 fl"><span class="date">年</span><span>月</span><span class="active_span">日</span></div>
					</c:if>
					<c:if test="${grid.dateType == 2}">
					<div class="td2 fl"><span>年</span><span class="active_span">月</span><span>日</span></div>
					</c:if>
					<c:if test="${grid.dateType == 3}">
					<div class="td2 fl"><span class="active_span">年</span><span>月</span><span>日</span></div>
					</c:if>
					<div class="td3 fl"><span>${grid2.stDate }</span></div>
					<div class="td3 fl"><span>${grid2.edDate }</span></div>
				</c:forEach>
				</li>
				<li class="clearfix">
					<div class="td1 fl"><p class="people_png fl"></p><b>角色属性：</b></div>
						<div class="width544 fl clearfix">
						<div class="td2_2 fl"><span class="span1">角色1</span></div>
						<div class="td3 fl"><span class="w_138">
							<c:forEach items="${grid.actorInfo }"  var="m">
						     <c:if test="${m.roleFlag==1&&m.attrId==1 }"> ${m.mc}</c:if>
					</c:forEach>
						</span>国家</div>
						<div class="td4 fl"></div>
						<div class="td3 fl"><span class="w_138">
								<c:forEach items="${grid.actorInfo }"  var="m">
						     <c:if test="${m.roleFlag==1&&m.attrId==2 }"> ${m.mc}</c:if>
					</c:forEach>
						</span>编码</div>
					</div>
					<div class="width450 fl clearfix">
						<div class="td2_2 fl"><span class="span2">角色2</span></div>
						<div class="td3 fl"><span class="w_138">
								<c:forEach items="${grid.actorInfo }"  var="m">
						     <c:if test="${m.roleFlag==2&&m.attrId==1 }"> ${m.mc}</c:if>
					</c:forEach>
						</span>国家</div>
						<div class="td4 fl"></div>
						<div class="td3 fl"><span class="w_138">
								<c:forEach items="${grid.actorInfo }"  var="m">
						     <c:if test="${m.roleFlag==2&&m.attrId==2 }"> ${m.mc}</c:if>
					</c:forEach>
						</span>编码</div>
					</div>
				</li>
				<li class="clearfix">
					<div class="td1 fl"><p class="event_png fl"></p><b>事件属性：</b></div>
					<div class="width254 fl clearfix">
						<div class="td2_2 fl"><span class="span1">基事件编码</span></div>
						<div class="td3 fl"><span class="w_138">
						<c:forEach items="${grid.eventInfo}" var="m">
							<c:if test="${m.attrId==1}">${m.mc}</c:if>
						</c:forEach>
						</span></div>
					</div>
					<div class="td4 fl"></div>
					<div class="width254 fl clearfix">
						<div class="td2_2 fl"><span class="span1">根事件编码</span></div>
						<div class="td3 fl"><span class="w_138">
						<c:forEach items="${grid.eventInfo}" var="m">
							<c:if test="${m.attrId==2}">${m.mc}</c:if>
						</c:forEach>
						</span></div>
					</div>
					<div class="td4 fl"></div>
					<div class="width254 fl clearfix">
						<div class="td2_2 fl"><span class="span1">事件发生位置</span></div>
						<div class="td3 fl"><span class="w_138">
						<c:forEach items="${grid.eventInfo}" var="m">
							<c:if test="${m.attrId==3}">${m.mc}</c:if>
						</c:forEach>
						</span></div>
					</div>
				</li>
				<li class="clearfix">
					<div class="td1 fl"><p class="weight_png fl"></p><b>权重依据：</b></div>
					<c:if test="${grid.weightFlag==1}">
					<div class="td5 fl"><input id="radio1" type="radio" checked="checked"><label for="radio1"> 事件出现次数</label></div>
					<div class="td5 fl"><input id="radio2" type="radio"><label for="radio2"> 出现该事件的文章数</label></div>
					</c:if>
					<c:if test="${grid.weightFlag==2}">
					<div class="td5 fl"><input id="radio1" type="radio"><label for="radio1"> 事件出现次数</label></div>
					<div class="td5 fl"><input id="radio2" type="radio" checked="checked"><label for="radio2"> 出现该事件的文章数</label></div>
					</c:if>
				</li>
				<li class="clearfix">
					<div class="td1 fl"><p class="threshold_png fl"></p><b>事件阈值过滤：</b></div>
					<div class="td5 fl">节点阈值 <span>${grid.nodeThreshold }</span></div>
					<div class="td5 fl">边阈值 <span>${grid.edgeThreshold }</span></div>
				</li>
			</ul>
		</c:forEach>
		</div>
		<!-- 人工输入查询 -->
		<div class="tab_down">
			<ul class="info">
				<li class="clearfix">
					<div class="td1 fl"><p class="time_png fl"></p><b>日期属性：</b></div>
					<div class="td2 fl"><span class="date">年</span><span class="active_span">月</span><span>日</span></div>
					<div class="td3_2 fl"><input class="year" type="text" value="2014"/>年<input class="month mon_dat" type="text" value="12"/>月<input class="day mon_dat" type="text" value="31"/>日</div>
					<div class="td4 fl"></div>
					<div class="td3_2 fl"><input class="year" type="text" value="2014"/>年<input class="month mon_dat" type="text" value="12"/>月<input class="day mon_dat" type="text" value="31"/>日</div>
				</li>
				<li class="clearfix">
					<div class="td1 fl"><p class="people_png fl"></p><b>角色属性：</b></div>
					<div class="width544 fl clearfix">
						<div class="td2_2 fl"><span class="span1">角色1</span></div>
						<div class="td3_2 fl"><input class="w_138" type="text" value="土库曼斯坦"/>国家</div>
						<div class="td4 fl"></div>
						<div class="td3_2 fl"><input class="w_138" type="text" value="PekingaCinefege"/>编码</div>
					</div>
					<!-- <div class="td4_2_inp fl"></div> -->
					<div class="width490 fl clearfix">
						<div class="td2_2 fl"><span class="span2">角色1</span></div>
						<div class="td3_2 fl"><input class="w_138" type="text" value="土库曼斯坦"/>国家</div>
						<div class="td4 fl"></div>
						<div class="td3_2 fl"><input class="w_138" type="text" value="PekingaCinefege"/>编码</div>
					</div>
				</li>
				<li class="clearfix">
					<div class="td1 fl"><p class="event_png fl"></p><b>事件属性：</b></div>
					<div class="width272 fl clearfix">
						<div class="td2_2 fl"><span class="span1">基事件编码</span></div>
						<div class="td3_2_2 fl"><input type="text" value="fight"/></div>
					</div>
					<!-- <div class="td4 fl"><span></span></div>
					<div class="td4 fl"><span></span></div> -->
					<div class="width272 fl clearfix">
						<div class="td2_2 fl"><span class="span1">根事件编码</span></div>
						<div class="td3_2_2 fl"><input type="text" value="fight"/></div>
					</div>
					<!-- <div class="td4 fl"><span></span></div> -->
					<div class="width272 fl clearfix">
						<div class="td2_2 fl"><span class="span1">事件发生位置</span></div>
						<div class="td3_2_2 fl"><input type="text" value="fight"/></div>
					</div>
				</li>
				<li class="clearfix">
					<div class="td1 fl"><p class="weight_png fl"></p><b>权重依据：</b></div>
					<div class="td5 fl"><input id="radio1" type="radio" checked="checked"><label for="radio1"> 事件出现次数</label></div>
					<div class="td5 fl"><input id="radio2" type="radio"><label for="radio2"> 出现该事件的文章数</label></div>
				</li>
				<li class="clearfix">
					<div class="td1 fl"><p class="threshold_png fl"></p><b>事件阈值过滤：</b></div>
					<div class="td5 fl">节点阈值 <input id="reduce1" class="reduce" type="button" value="-" /><input id="threshold1" class="threshold" type="text" value="200"/><input id="add1" class="add" type="button" value="+" /></div>


					<div class="td5 fl">边阈值 <input id="reduce2" class="reduce" type="button" value="-" /><input id="threshold2" class="threshold" type="text" value="100000"/><input id="add2" class="add" type="button" value="+" /></div>
				</li>
				<li><input class="submit" type="button" value="提交"></li>
			</ul>
		</div>
	</div>
</body>
 <script>
 	$("document").ready(function(){
		$('#tab_ul').children().eq(0).click();//默认第一个div被选中
	});
 	function render(configId){
 		getbargraph(configId);
 		getpiechart(configId);
 		getRadarChart(configId);
 		getWorld(configId);
 	}
 	//查询柱状图数据,国家
 	function getbargraph(configId){
 		var data = {cid:configId};
 		var djgxx;
 		var newData = [],top10Data = [];
 		$.ajax({
 			type:"post",
 			url:"${pageContext.request.contextPath}/show2/getbargraph",
 			data:data,
 			async:false,
 			success:function(resultdata){
 				var jsonData = eval(resultdata);
 				$.each(jsonData,function(i,item){
 					djgxx = item.jgxx;
 					djgxx = eval(djgxx);
					$.each(djgxx,function(j,item2){
						var isCRepeat = false;
						var key = item2.country;
						var value = item2.visits;
						for(var k=0;k < newData.length;k++){
							if(newData[k].country == key){
								newData[k].visits += value;
								isCRepeat = true;
							}
						}
						if(!isCRepeat){
							newData.push({country:key,visits:value});
						}
					});
 				});
 				top10Data = newData.length > 10?newData.slice(0,10):newData;
 				//前10按照访问量由大到小排序
 				for(var n=0;n<top10Data.length;n++){
 					for(var m=top10Data.length-1;m>=n+1;m--){
 						if(top10Data[m].visits > top10Data[m-1].visits){
 							var temp = top10Data[m];
 							top10Data[m] = top10Data[m-1];
 							top10Data[m-1] = temp; 
 						}
 					}
 					top10Data[n] = top10Data[n];
 				}
 				var chart = AmCharts.makeChart("chartdiv", {
 		            type: "serial",
 		            theme: "light",
 		            dataProvider:top10Data,
 		            categoryField: "country",
 		            categoryAxis: {
 		                labelRotation: 45,
 		                tickPosition:"start",
 		                gridAlpha:0,
 		                tickLength:20,
 		                gridPosition: "start"
 		            },
 		            valueAxes: [{
 		            	gridColor:"#FFFFFF",
 		                axisAlpha:0.2,
 		                dashLength:0
 		            }],
 		            gridAboveGraphs:true,
 		            startDuration:1,
 		            graphs: [{
 		            	balloonText:"<b>[[category]]:[[value]]</b>",
 		                valueField: "visits",
 		                fillColorField: "color",
 		                type: "column",
 		                lineAlpha: 0.2,
 		                fillAlphas: 0.9
 		            }],
 		            chartCursor: {
 		                cursorAlpha: 0,
 		                zoomable: false,
 		                categoryBalloonEnabled: false
 		            },
 		           export: {
 		                enabled: true
 		            }
 		        });
 			}
 		});
 	}
 	//查询饼状图,洲省
 	function getpiechart(configId){
 		var data = {cid:configId};
 		var pjgxx;
 		var newData = [];
 		$.ajax({
 			type:'post',
 			data:data,
 			url:"${pageContext.request.contextPath}/show2/getpiechart",
 			async:false,
 			success:function(resultData2){
 				var Pdata = eval(resultData2);
 				$.each(Pdata,function(i,item){
 					pjgxx = item.jgxx;
 					pjgxx = eval(pjgxx);
 					$.each(pjgxx,function(j,item2){
 						var isRepeat = false;
						var key = item2.province;
						var value = item2.visits;
						for(var k=0;k < newData.length;k++){
							if(newData[k].province == key){
								newData[k].visits += value;
								isRepeat = true;
							}
						}
						if(!isRepeat){
							newData.push({province:key,visits:value});
						}
 					})
 				});
 			}
 		});
 		var chart = AmCharts.makeChart("chartdiv2",{
				type:"pie",
				theme:"light",
				dataProvider:newData,
				valueField:"litres",
				titleField:"country",
				balloon:{
					fixedPosition:true
				},
				export:{
					enabled:true
				}
		});
 	}
 	//查询雷达图:城市关系
 	function getRadarChart(configId){
 		var data = {cid:configId};
 		var djgxx;
 		var newData = [],top6Data = [];
 		$.ajax({
 			type:"post",
 			url:"${pageContext.request.contextPath}/show2/getradarchart",
 			data:data,
 			async:false,
 			success:function(resultdata3){
 				var jsonData = eval(resultdata3);
 				$.each(jsonData,function(i,item){
 					djgxx = item.jgxx;
 					djgxx = eval(djgxx);
					$.each(djgxx,function(j,item2){
						var isCRepeat = false;
						var key = item2.city;
						var value = item2.visits;
						for(var k=0;k < newData.length;k++){
							if(newData[k].city == key){
								newData[k].visits += value;
								isCRepeat = true;
							}
						}
						if(!isCRepeat){
							newData.push({city:key,litres:value});
						}
					});
 				});
 				top6Data = newData.length > 6?newData.slice(0,6):newData
 				var chart = AmCharts.makeChart("chartdiv3", {
 		            type: "radar",
 		            theme: "light",
 		            dataProvider:top6Data,
 		            valueAxes: [{
 					axisTitleOffset:20,
 					minimum:0,
 		            	axisAlpha:0.15
 		            }],
 		            startDuration:2,
 		            graphs: [{
 		            	balloonText:"[[value]] litres of beer per year",
 					bullet:"round",
 					lineThickness:2,
 					valueField:"litres"
 		            }],
 		            categoryField:"city",
 		           export: {
 		                enabled: true
 		            }
 		    	});
 			}
 		});
	}
 	//查询世界地图:国家关系,地区关系,城市关系
 	function getWorld(configId){
 		var dom = document.getElementById("chartdiv4");
 		var myChart = echarts.init(dom);
 		var geoCoordMap = {};
 		var top1Data = [],top2Data = [],top3Data = [],top4Data = [],top5Data = [];
 		var planePath = 'path://M1705.06,1318.313v-89.254l-319.9-221.799l0.073-208.063c0.521-84.662-26.629-121.796-63.961-121.491c-37.332-0.305-64.482,36.829-63.961,121.491l0.073,208.063l-319.9,221.799v89.254l330.343-157.288l12.238,241.308l-134.449,92.931l0.531,42.034l175.125-42.917l175.125,42.917l0.531-42.034l-134.449-92.931l12.238-241.308L1705.06,1318.313z';
 		var color = ['#a6c84c','#ffa022','#46bee9','#ffa022','#46bee9',
 		             '#a6c84c','#ffa022','#46bee9','#ffa022','#46bee9',
 		             '#a6c84c','#ffa022','#46bee9','#ffa022','#46bee9',
 		             '#a6c84c','#ffa022','#46bee9','#ffa022','#46bee9',];
 		var series = [];
 		var data = {cid:configId};
 		$.ajax({
 			type:"post",
 			data:data,
 			url:'${pageContext.request.contextPath}/show2/getworld',
 			async:false,
 			success:function(resultData){
 				var jsonData = eval(resultData);
 				if(jsonData!=null && jsonData!=undefined){
 					$.each(jsonData,function(i,item){
 						var jgxx = eval('(' + item.jgxx + ')');
 						var bdata = eval(jgxx.BeijingData);
 						var gdata = eval(jgxx.geoData);
 						var adata = eval(jgxx.res2);
 						var cdata = eval(jgxx.res3);
 						var ddata = eval(jgxx.res4);
 						var edata = eval(jgxx.res5);
 						var name1;
 						var name2;
 						for(var i=0;i<gdata.length;i++){
 							geoCoordMap[gdata[i].name] = [gdata[i].longitude,gdata[i].latitude];
 						}
 						for(var j=0;j<bdata.length;j++){
 							name1 = bdata[j].name.substring(0,bdata[j].name.indexOf("-"));
 							name2 = bdata[j].name.substring(bdata[j].name.indexOf("-")+1);
 							value = bdata[j].value;
 							top1Data.push([{name:name1},{name:name2,value:value}]);
 						}
 						for(var j=0;j<adata.length;j++){
 							name1 = adata[j].name.substring(0,adata[j].name.indexOf("-"));
 							name2 = adata[j].name.substring(adata[j].name.indexOf("-")+1);
 							value = adata[j].value;
 							top2Data.push([{name:name1},{name:name2,value:value}]);
 						}
 						for(var j=0;j<cdata.length;j++){
 							name1 = cdata[j].name.substring(0,cdata[j].name.indexOf("-"));
 							name2 = cdata[j].name.substring(cdata[j].name.indexOf("-")+1);
 							value = cdata[j].value;
 							top3Data.push([{name:name1},{name:name2,value:value}]);
 						}
 						for(var j=0;j<ddata.length;j++){
 							name1 = ddata[j].name.substring(0,ddata[j].name.indexOf("-"));
 							name2 = ddata[j].name.substring(ddata[j].name.indexOf("-")+1);
 							value = ddata[j].value;
 							top4Data.push([{name:name1},{name:name2,value:value}]);
 						}
 						for(var j=0;j<edata.length;j++){
 							name1 = edata[j].name.substring(0,edata[j].name.indexOf("-"));
 							name2 = edata[j].name.substring(edata[j].name.indexOf("-")+1);
 							value = edata[j].value;
 							top5Data.push([{name:name1},{name:name2,value:value}]);
 						}
 					});
 				}
 				var convertData = function(data){
 					var res = [];
 					for(var i=0;i<data.length;i++){
 						var dataItem = data[i];
 						var formCoord = geoCoordMap[dataItem[0].name];
 						var toCoord = geoCoordMap[dataItem[1].name];
 						if(formCoord && toCoord){
 							res.push({
 								formName: dataItem[0].name,
 								toName: dataItem[1].name,
 								coords: [formCoord,toCoord]
 							});
 						}
 					}
 					return res;
 				};
 				/* for(var i=0;i<top1Data.length;i++){
 					alert(top1Data.length);
 					alert(top1Data[i][0].name+","+top1Data[i][1].name+","+top1Data[i][1].value);
 				} */
 				[[top1Data[0][0].name,top1Data],[top2Data[0][0].name,top2Data],[top3Data[0][0].name,top3Data],
 				[top4Data[0][0].name,top4Data],[top5Data[0][0].name,top5Data]].forEach(function (item,i){
 					series.push({
 						name: item[0] + 'Top10',
 						type: 'lines',
 						zlevel:1,
 						effect:{
 							show: true,
 							period: 6,
 							trailLength: 0.7,
 							color: '#fff',
 							symbolSize: 3
 						},
 						lineStyle:{
 							normal: {
 								color: color[i],
 								width: 0,
 								curveness: 0.2
 							}
 						},
 						data: convertData(item[1])
 					},
 					{
 						name: item[0] + 'Top10',
 						type: 'lines',
 						zlevel:2,
 						symbol:['none','arrow'],
 						symbolSize: 10,
 						effect:{
 							show: true,
 							period: 6,
 							trailLength: 0,
 							symbol: planePath,
 							symbolSize: 15
 						},
 						lineStyle:{
 							normal: {
 								color: color[i],
 								width: 1,
 								opacity:0.6,
 								curveness: 0.2
 							}
 						},
 						data: convertData(item[1])
 					},
 					{
 						name: item[0] + 'Top10',
 						type: 'effectScatter',
 						coordinateSystem:'geo',
 						zlevel:2,
 						rippleEffect:{
 							brushType:'stroke'
 						},
 						label:{
 							normal:{
 								show:true,
 								position:'right',
 								formatter:'{b}'
 							}
 						},
 						symbolSize: function(val){
 							return val[2]/8;
 						},
 						itemStyle:{
 							normal:{
 								color:color[i]
 							}
 						},
 						data: item[1].map(function (dataItem){
 							return{
 								name:dataItem[1].name,
 								value:geoCoordMap[dataItem[1].name].concat([dataItem[1].value])
 							};
 						})
 					});
 				});
 				option = {
 						backgroundColor: '#404a59',
 						title:{
 							text:'世界关系',
							left:'center',
							textStyle:{
								color:'#fff'
							}
 						},
 						tooltip:{
 							trigger:'item'
 						},
 						legend:{
 							orient:'vertical',
 							top:'center',
 							left:'right',
 							data:[top1Data[0][0].name+"Top10",top2Data[0][0].name+"Top10",top3Data[0][0].name+"Top10",top4Data[0][0].name+"Top10",top5Data[0][0].name+"Top10"],
 							textStyle:{
 								color:'#fff'
 							},
 							selectedMode:'single'
 						},
 						geo:{
 							map:'world',
 							lable:{
 								emphasis:{
 									show: false
 								}
 							},
 							roam:true,
 							itemStyle:{
 								normal:{
 									areaColor:'#323c48',
 									borderColor:'#404a59'
 								},
 								emphasis:{
 									areaColor:'#2a333d'
 								}
 							}
 						},
 						series:series
 				};
 			}
 		});
 		if (option && typeof option === "object") {
	    	myChart.setOption(option, true);
		}
 	}
 </script>
</html>