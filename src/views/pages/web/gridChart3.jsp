<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%
	String basePath = request.getContextPath();
%>
<html>
<head>
<style type="text/css">
	a:link{color:#000;}
	a:visited{color:#F00;}
	a:hover{color:#0F0;}
	a:active{color:#00F;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网格展示</title>
<link rel="stylesheet" href="<%=basePath %>/static/css/style.css">
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/css/sec2.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath %>/static/lib/pagination.css" />
<script type="text/javascript" src="<%=basePath %>/static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/js/echarts/echarts.js"></script>
<script src="<%=basePath %>/static/lib/jquery.pagination.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath %>/static/js/sec2.js"></script>
<!-- 条件tab页 ed -->
<script type="text/javascript" src="<%=basePath %>/static/js/echarts/map/china.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/js/echarts/map/world.js"></script>
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
		<div id="relation" style="height:50%;"></div>
		<div style="height: 50%; border-top: 10px solid #fff;">
			<div id="nationalcontactshow" style="float: left; width: 40%; height:100%; background-color: #fff;"></div>
			<div id="provincecontactshow" style="float: left; width: 30%; height:100%; background-color: #ccc;"></div>
			<div id="citycontactshow" style="float: left; width: 30%; height:100%; background-color: #fff;"></div>
		</div>
		
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
					<li class="" onclick="render2(${t.configId});">${grid.configName }<b></b><span></span></li>
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

	
	<script type="text/javascript">
	//定义国家关系需要的初始化数据:柱状图
	var CxAdata = [],Cledata = [],Csdata = [];
	var temp_country_dic = [];
	//定义国家关系需要的初始化数据:世界国家关系图
	var geoCoordMap = {};
	/* var a = [{name:'上海 ',x:121,y:31},{name:'北京 ',x:44,y:111},{name:'深圳 ',x:66,y:33}];
	for(var i=0;i<a.length;i++){
		geoCoordMap[a[i].name] = [a[i].x,a[i].y];
	} */
	var Actorkey1Data = [],Actorkey2Data = [],Relationdicator = [],top10_relation_dic = [],coord_name_code1 = [],coord_name_code2 = [];
	//定义洲省关系需要的初始化数据:饼状图
	var Pledata = [],temp_province_dic = [];
	//定义城市关系需要的初始化数据:雷达图
	var temp_city_dic = [],Cityindicator = [],Citylegend = [],top6_city_dic = [], Cityvalue = [],top6_city_dic_name = [],
	coord_name_code1_new = [],coord_name_code2_new = [];
	$("document").ready(function(){
		$('#tab_ul').children().eq(0).click();//默认第一个div被选中
	});
	function render(configId){
		var data = {cid:configId};
		$.ajax({
			type: "post",
			url: "${pageContext.request.contextPath}/show2/getDatachart",
			data: data,
			async:false,
			success: function(resultdata){
				//将从后台接收的json字符串转换成json对象
				var jsonobj = resultdata;
				if(jsonobj !=null && jsonobj != undefined){
					$.each(jsonobj,function(i,item){
						var jgxx = eval('(' + item.jgxx + ')');
						$.each(jgxx ,function(j,item2){
							//处理成视图需要的数据
							var Actor1Geo_CountryCode = item2.actor1GeoCtryCode;
					        var Actor2Geo_CountryCode = item2.actor2GeoCtryCode;
					        var Actor1Geo_Type = item2.actor1GeoType;
					        var Actor2Geo_Type = item2.actor2GeoType;
					        var Actor1Geo_Fullname = item2.actor1GeoFullName;
					        if(Actor1Geo_Fullname.indexOf(",")>0){
					        	var Actor1Geo_Fullname_zhou = Actor1Geo_Fullname.substring(0,Actor1Geo_Fullname.indexOf(","));
					        }
					        var Actor2Geo_Fullname = item2.actor2GeoFullName;
					        if(Actor2Geo_Fullname.indexOf(",")>0){
					        	var Actor2Geo_Fullname_zhou = Actor2Geo_Fullname.substring(0,Actor1Geo_Fullname.indexOf(","));
					        }
					        var ACTOR1GEO_LAT = item2.actor1GeoLat;
					        var ACTOR2GEO_LAT = item2.actor2GeoLat;
					        var ACTOR1GEO_LONG = item2.actor1GeoLong;
					        var ACTOR2GEO_LONG = item2.actor2GeoLong;
					        var value = item2.totalWeight;
					        //Country
							var isCRepeat = false;
							if(Actor1Geo_CountryCode != Actor2Geo_CountryCode){
								var key = Actor1Geo_CountryCode+"-"+Actor2Geo_CountryCode;
								for(var k = 0; k < temp_country_dic.length; k++){
									if(temp_country_dic[k].key == key){
										temp_country_dic[k].value += value;
										isCRepeat = true;
									}
								}
								if(!isCRepeat){
									temp_country_dic.push({key: key, value:value});
								}
							}
					        //Province
					        var isPRepeat = false;
					        if((Actor1Geo_Type==2 || Actor1Geo_Type==5) && (Actor2Geo_Type==2 || Actor2Geo_Type==5)
					        	&& (Actor1Geo_Fullname.substring(0,',')!= Actor2Geo_Fullname.split(',')[0])){
					        	var key = Actor1Geo_Fullname_zhou+"-"+Actor2Geo_Fullname_zhou;
					        	for(var i = 0 ; i < temp_province_dic.length; i++){
					        		if(temp_province_dic[i].key == key){
					        			temp_province_dic[i].value += value;
					        			isPRepeat = true;
					        		}
					        	}
					        	if(!isPRepeat){
					        		temp_province_dic.push({value:value,name:key});
					        	}
					        }
					        //City
					        var isCityRepeat = false;
					        if((Actor1Geo_Type==3 || Actor1Geo_Type==4) && (Actor2Geo_Type==3 || Actor2Geo_Type==4)
						        && (Actor1Geo_Fullname.substring(0,',')!= Actor2Geo_Fullname.split(',')[0])){
					        	var key = Actor1Geo_Fullname_zhou+"-"+Actor2Geo_Fullname_zhou;
					        	for(var i = 0;i < Cityindicator.length; i++){
					        		if(Cityindicator[i].key == key){
					        			Cityindicator[i].value += value;
					        			isCityRepeat = true;
					        		}
					        	}
					        	if(!isCityRepeat){
					        		Cityindicator.push({name:key,max:value});
					        	}
					        }
					        //CountryRelationShip
					        if(Actor1Geo_Type == 1){
					        	var key1 = Actor1Geo_Fullname;
					        	coord_name_code1.push({name:key1,lat:ACTOR1GEO_LAT,lg:ACTOR1GEO_LONG});
					        }else {
					        	var key1 = Actor1Geo_Fullname_zhou;
					        	coord_name_code1.push({name:key1,lat:ACTOR1GEO_LAT,lg:ACTOR1GEO_LONG});
					        }
					        if(Actor2Geo_Type == 1){
					        	var key2 = Actor2Geo_Fullname;
					        	coord_name_code2.push({name:key2,lat:ACTOR2GEO_LAT,lg:ACTOR2GEO_LONG});
					        }else {
					        	var key2 = Actor2Geo_Fullname_zhou;
					        	coord_name_code2.push({name:key2,lat:ACTOR2GEO_LAT,lg:ACTOR2GEO_LONG});
					        }
					        var isRRepeat = false;
					        var name1 = Actor1Geo_Fullname.indexOf(",")>0?Actor1Geo_Fullname_zhou:Actor1Geo_Fullname;
					        var name2 = Actor2Geo_Fullname.indexOf(",")>0?Actor2Geo_Fullname_zhou:Actor2Geo_Fullname;
					        if((name1!=""&&name2!="") && (typeof(name1)!="undefined") && (typeof(name2)!="undefined")){
					        	var keycode = name1 +"_"+ name2;
					        	for(var i=0;i<Relationdicator.length;i++){
							    	   if(Relationdicator[i].keycode == keycode){
							    		   Relationdicator[i].value += value;
							    		   isRRepeat = true;
							    	   }
							       }
					        }
					       if(!isRRepeat){
					    	   Relationdicator.push({name: keycode, value:value});
							}
						});
					});
					/* for(var i=0;i<Relationdicator.length;i++){
						if(Relationdicator[i].name)
					} */
					gettop6City();
					gettop10Country();
					getProvince();
					insertData();
				}
			}
		});
		showrelationMap();
		shownationalBarchart();
		showprovincepiechart();
		showcitychart();
	}
	//获取国家热点前10的数据
	function gettop10Country(){
		var cnt = temp_country_dic.length > 10? 10: temp_country_dic.length;
		var top10_country_dic = [];
		for(var i = 0; i < cnt; i++){
			for(var j = temp_country_dic.length - 1; j >= i + 1; j--){
				if(temp_country_dic[j].value > temp_country_dic[j-1].value){
					var  temp = temp_country_dic[j];
					temp_country_dic[j] = temp_country_dic[j-1];
					temp_country_dic[j-1] = temp;
				}
			}
			top10_country_dic[i] = temp_country_dic[i];
		}
		for(var t = 0; t < top10_country_dic.length; t++){
			CxAdata.push(top10_country_dic[t].key);
			Csdata.push(top10_country_dic[t].value);
		}
	}
	//获取城市热点前六的数据
	function gettop6City(){
		var ciy = Cityindicator.length > 6? 6: Cityindicator.length;
		for(var i=0; i < ciy;i++){
			for(var j = Cityindicator.length - 1; j >= i + 1; j--){
				if(Cityindicator[j].max > Cityindicator[j-1].max){
					var temp = Cityindicator[j];
					Cityindicator[j] = Cityindicator[j-1];
					Cityindicator[j-1] = temp;
				}
			}
			top6_city_dic[i] = Cityindicator[i];
		}
		for(var j=0;j<top6_city_dic.length;j++){
			Cityvalue.push(top6_city_dic[j].max);
			top6_city_dic_name.push({name:top6_city_dic[j].name});
		}
	}
	//获取洲省数据
	function getProvince(){
		for(var j=0; j < temp_province_dic.length; j++){
			Pledata.push(temp_province_dic[j].key);
			
		}
	}
	function unique1(){
		coord_name_code1_new = [coord_name_code1[0]];
		for(var i=1;i<coord_name_code1.length;i++){
			var repeat = false;
			for(var j=0;j<coord_name_code1_new.length;j++){
				if(coord_name_code1[i].name ==  coord_name_code1_new[j].name){
					repeat = true;
					break;
				}
			}
			if(!repeat){
				coord_name_code1_new.push(coord_name_code1[i]);
			}
		}
		return coord_name_code1_new;
	}
	function unique2(){
		coord_name_code2_new = [coord_name_code2[0]];
		for(var i=1;i<coord_name_code2.length;i++){
			var repeat = false;
			for(var j=0;j<coord_name_code2_new.length;j++){
				if(coord_name_code2[i].name ==  coord_name_code2_new[j].name){
					repeat = true;
					break;
				}
			}
			if(!repeat){
				coord_name_code2_new.push(coord_name_code2[i]);
			}
		}
		return coord_name_code2_new;
	}
	//往对象中存放数据
	function insertData(){
		unique1();
		unique2();
		var new_data = coord_name_code1_new.concat(coord_name_code2_new);
		for(var i=0;i<new_data.length;i++){
				geoCoordMap[new_data[i].name] = [new_data[i].lat,new_data[i].lg];
			}
	}
	/*
		显示世界关系图方法：
		@param showType:展示类型 1:方向 2：坐标
	**/
	function showrelationMap(){
		var dom = document.getElementById("relation");
		var myChart = echarts.init(dom);
		var geoCoordMap = geoCoordMap;
		var BJData = [];
		var planePath = 'path://M1750.06,1318.313v-89.2541-319.9-221.79910.073-208.063c0.521-84.662-26.629-121.796-63.961-121.491c-37.332-0.305-64.482,36.829-63.961,121.49110.073,208.0631-319.9,221.799v89.2541330.343-157.288112.238,241.3081-134.449,92.93110.531,42.0341175.125-42.9171175.125,42.91710.531-42.0341-134.449-92.931112.238-241.308L1705.06,1318.313z';
		var convertData = function(data){
			var res = [];
			for (var i = 0; i < data.length; i++){
				var dataItem = data[i];
				var fromCoord = geoCoordMap[dataItem[0].name];
				var toCoord = geoCoordMap[dataItem[1].name];
				if(fromCoord && toCoord){
					res.push({
						fromName:dataItem[0].name,
						toName:dataItem[1].name,
						coords:[fromCoord,toCoord]
					});
				}
			}
			return res;
		};
		var color = ['#a6c84c','#ffa022','#46bee9'];
		var series = [];
		[].forEach(function(item,i){
			series.push({
				name: item[0] + ' top10',
				type: 'lines',
				zlevel: 1,
				effect: {
					show: true,
					period: 6,
					trailLength: 0.7,
					color: '#fff',
					symbolSize:3
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
				name: item[0]+' top10',
				type: 'lines',
				zlevel: 2,
				symbol: ['none','arrow'],
				symbolSize: 10,
				effect:{
					show: true,
					period: 6,
					trailLength: 0,
					symbol: planePath,
					symbolSize:15
				},
				lineStyle:{
					normal:{
						color:color[i],
						width:1,
						opacity: 0.6,
						curveness: 0.2
					}
				},
				data: convertData(item[1])
			},
			{
				name: item[0] + ' Top10',
				type: 'effectScatter',
				coordinateSystem: 'geo',
				zlevel: 2,
				rippleEffect: {
					brushType: 'stroke'
				},
				lable:{
					normal:{
						show: true,
						position: 'right',
						formatter: '{b}'
					}
				},
				symbolSize: function(val){
					return val[2] / 8;
				},
				itemStyle:{
					normal:{
						color: color[i]
					}
				},
				data: item[1].map(function (dataItem){
					return{
						name: dataItem[1].name,
						value: geoCoordMap[dataItem[1].name].concat([dataItem[1].value])
					};
				})
			});
		});
		
		option = {
			backgroundColor: '#404a59',
			title : {
				text: '关系',
				subtext: '数据纯属虚构',
				left: 'center',
				textStyle:{
					color: '#fff'
				}
			},
			tooltip:{
				trigger: 'item'
			},
			legend:{
				orient: 'vertical',
				top: 'bottom',
				left: 'right',
				data:['北京  Top10','广州  Top10', '上海 Top10'],
				textStyle:{
					color: '#fff'
				},
				selectedMode: 'single'
			},
			geo:{
				map: 'world',
				lable:{
					emphasis:{
						show: false
					}
				},
				roam: true,
				itemStyle:{
					normal:{
						areaColor: '#323c48',
						borderColor: '#404a59'
					},
					emphasis:{
						areaColor: '#2a333d'
					}
				}
			},
			series: series
		};
		if (option && typeof option === "object") {
	    	myChart.setOption(option, true);
		}
	}
	/**
	显示国家关系图方法：
	@param showType:展示类型 1:柱状图 
	*/
	function shownationalBarchart(){
		var dom = document.getElementById("nationalcontactshow");
		var myChart = echarts.init(dom);
		option = {
			color: ['#3398DB'],
			tooltip : {
				trigger: 'axis',
				axisPointer : {
					type : 'line'
				},
				show : true,
			},
			grid: {
				left: '3%',
				right: '4%',
				bottom: '3%',
				containLabel: true
			},
			legend : {
				data : Cledata
			},
			xAxis: [
				{
					type : 'category',
					data : CxAdata,
					axisTick: {
						alignWithLabel: true
					}
				}
			],
			yAxis : [
				{
					type : 'value'
				}         
			],
			series : [
			          {
			        	  name: '关系度',
			        	  type: 'bar',
			        	  barWidth: '60%',
			        	  data: Csdata
			          }
			 ]
		};
		//过度控制，隐藏loading(读取中)
		myChart.hideLoading();
		//为echarts对象加载数据
		myChart.setOption(option)
	}
	/**
	显示洲省关系：
	@param showType:展示类型 1:饼状图
	*/
	function showprovincepiechart(){
		var dom = document.getElementById("provincecontactshow");
		var myChart = echarts.init(dom);
		option = {
				tooltip: {
					trigger: 'item',
					formatter: "{a} <br/>{b}: {c} ({d}%)"
				},
				legend: {
					orient: 'vertical',
					x: 'left',
					data:Pledata
				},
				series:[
					{
						name:'洲省关系',
						type:'pie',
						radius: ['50%','70%'],
						avoidLabelOverlap: false,
						label: {
							normal: {
								show: false,
								position: 'center'
							},
							emphasis: {
								show: true,
								textStyle: {
									fontSize: '30',
									fontWeight: 'bold'
								}
							}
						},
						labelLine: {
							normal: {
								show: false
							}
						},
						data:temp_province_dic
					}        
				]
		};
		if (option && typeof option === "object") {
	    	myChart.setOption(option, true);
		}
	}
	/**
	显示城市雷达图方法：
	*/
	function showcitychart(){
		var dom = document.getElementById("citycontactshow");
		var myChart = echarts.init(dom);
		option = {
			title: {
				text: '城市关系图'
			},
			tooltip: {},
			radar: {
				indicator: top6_city_dic_name
			},
			series: [{
				type: 'radar',
				data : [
					{
						value : Cityvalue,
						name : '城市关系'
					}        
				]
			}]
		};
		if (option && typeof option === "object") {
	    	myChart.setOption(option, true);
		}
	}
	//showrelationMap(1);
	shownationalBarchart();
	//showprovincepiechart();
	//showcitychart();
	</script>
	<script src="<%=basePath %>/static/js/yuzhi.js"></script>
</body>
<!--
 表格中的数据
 [{"actorInfo":[{"attrId":1,"attrValue":49,"configId":57,"id":125,"mc":"中国","roleFlag":1},
			   {"attrId":2,"attrValue":0,"configId":57,"id":126,"mc":"","roleFlag":1},
			   {"attrId":1,"attrValue":254,"configId":57,"id":127,"mc":"","roleFlag":2},
			   {"attrId":2,"attrValue":0,"configId":57,"id":128,"mc":"","roleFlag":2}],
  "atLeastOneKey":"",
  "configCategory":3,
  "configFlag":1,
  "configId":57,
  "configName":"网格展示1",
  "creatorId":1,
  "dateInfo":[{"configId":57,"edDate":"2016-02-01","id":47,"stDate":"2014-08-05"}],
  "dateType":1,
  "edgeThreshold":100000,
  "eventInfo":[{"attrId":2==根事件,"attrValue":0,"configId":57,"id":94,"mc":""},
  			   {"attrId":1==基事件,"attrValue":0,"configId":57,"id":95,"mc":""},
  			   {"attrId":3==事件发生位置,"attrValue":0,"configId":57,"id":96,"mc":""}],
  "exclusiveKey":"",
  "msgCondition1":"",
  "msgCondition2":"",
  "msgCondition3":"",
  "necessaryKey":"",
  "nodeThreshold":200,
  "priorityInfo":[],
  "remark":"",
  "scheduleStatus":2,
  "weightFlag":1,
  "yl1":0}] 
   图表中的数据
   [{"id":21,
  "jgflx":1,
  "jgxx":"[{\"actor1GeoCtryCode\":\"CH\",
  			\"actor1GeoFullName\":\"Beijing, Beijing, China\",
  			\"actor1GeoLat\":39.9289,
  			\"actor1GeoLong\":116.388,
  			\"actor1GeoType\":4,
  			\"actor2GeoCtryCode\":\"US\",
  			\"actor2GeoFullName\":\"Washington, District of Columbia, United States\",
  			\"actor2GeoLat\":38.8951,
  			\"actor2GeoLong\":-77.0364,
  			\"actor2GeoType\":3,
  			\"eventNum\":0,
  			\"totalWeight\":344},
  			{\"actor1GeoCtryCode\":\"CH\",
  			 \"actor1GeoFullName\":\"China\",
  			 \"actor1GeoLat\":35,
  			 \"actor1GeoLong\":105,\"actor1GeoType\":1,
  			 \"actor2GeoCtryCode\":\"US\",
  			 \"actor2GeoFullName\":\"Washington, District of Columbia, United States\",
  			 \"actor2GeoLat\":38.8951,
  			 \"actor2GeoLong\":-77.0364,
  			 \"actor2GeoType\":3,
  			 \"eventNum\":0,
  			 \"totalWeight\":112},
  			 {\"actor1GeoCtryCode\":\"FR\",
  			  \"actor1GeoFullName\":\"France\",
  			  \"actor1GeoLat\":46,
  			  \"actor1GeoLong\":2,
  			  \"actor1GeoType\":1,
  			  \"actor2GeoCtryCode\":\"US\",
  			  \"actor2GeoFullName\":\"Washington, District of Columbia, United States\",\"actor2GeoLat\":38.8951,\"actor2GeoLong\":-77.0364,\"actor2GeoType\":3,\"eventNum\":0,\"totalWeight\":96},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"China\",\"actor1GeoLat\":35,\"actor1GeoLong\":105,\"actor1GeoType\":1,\"actor2GeoCtryCode\":\"US\",
  			  \"actor2GeoFullName\":\"Chicago, Illinois, United States\",\"actor2GeoLat\":41.85,\"actor2GeoLong\":-87.6501,\"actor2GeoType\":3,\"eventNum\":0,\"totalWeight\":35},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"Shanghai, Shanghai, China\",\"actor1GeoLat\":31.2222,\"actor1GeoLong\":121.458,\"actor1GeoType\":4,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"United States\",\"actor2GeoLat\":38,\"actor2GeoLong\":-97,\"actor2GeoType\":1,\"eventNum\":0,\"totalWeight\":24},{\"actor1GeoCtryCode\":\"UK\",\"actor1GeoFullName\":\"United Kingdom\",\"actor1GeoLat\":54,\"actor1GeoLong\":-2,\"actor1GeoType\":1,\"actor2GeoCtryCode\":\"IR\",\"actor2GeoFullName\":\"Tehran, Tehran, Iran\",\"actor2GeoLat\":35.75,\"actor2GeoLong\":51.5148,\"actor2GeoType\":4,\"eventNum\":0,\"totalWeight\":24},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"Lanzhou, Gansu, China\",\"actor1GeoLat\":36.0564,\"actor1GeoLong\":103.792,\"actor1GeoType\":4,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"Texas, United States\",\"actor2GeoLat\":31.106,\"actor2GeoLong\":-97.6475,\"actor2GeoType\":2,\"eventNum\":0,\"totalWeight\":24},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"China\",\"actor1GeoLat\":35,\"actor1GeoLong\":105,\"actor1GeoType\":1,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"United States\",\"actor2GeoLat\":38,\"actor2GeoLong\":-97,\"actor2GeoType\":1,\"eventNum\":0,\"totalWeight\":18},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"Beijing, Beijing, China\",\"actor1GeoLat\":39.9289,\"actor1GeoLong\":116.388,\"actor1GeoType\":4,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"Iowa, United States\",\"actor2GeoLat\":42.0046,\"actor2GeoLong\":-93.214,\"actor2GeoType\":2,\"eventNum\":0,\"totalWeight\":16},{\"actor1GeoCtryCode\":\"RS\",\"actor1GeoFullName\":\"Russia\",\"actor1GeoLat\":60,\"actor1GeoLong\":100,\"actor1GeoType\":1,\"actor2GeoCtryCode\":\"IR\",\"actor2GeoFullName\":\"Tehran, Tehran, Iran\",\"actor2GeoLat\":35.75,\"actor2GeoLong\":51.5148,\"actor2GeoType\":4,\"eventNum\":0,\"totalWeight\":14},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"Beijing, Beijing, China\",\"actor1GeoLat\":39.9289,\"actor1GeoLong\":116.388,\"actor1GeoType\":4,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"United States\",\"actor2GeoLat\":38,\"actor2GeoLong\":-97,\"actor2GeoType\":1,\"eventNum\":0,\"totalWeight\":13},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"Wang Yu, Shaanxi, China\",\"actor1GeoLat\":34.4961,\"actor1GeoLong\":108.618,\"actor1GeoType\":4,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"Washington, District of Columbia, United States\",\"actor2GeoLat\":38.8951,\"actor2GeoLong\":-77.0364,\"actor2GeoType\":3,\"eventNum\":0,\"totalWeight\":12},{\"actor1GeoCtryCode\":\"RS\",\"actor1GeoFullName\":\"Russia\",\"actor1GeoLat\":60,\"actor1GeoLong\":100,\"actor1GeoType\":1,\"actor2GeoCtryCode\":\"CH\",\"actor2GeoFullName\":\"China\",\"actor2GeoLat\":35,\"actor2GeoLong\":105,\"actor2GeoType\":1,\"eventNum\":0,\"totalWeight\":10},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"Shanghai, Shanghai, China\",\"actor1GeoLat\":31.2222,\"actor1GeoLong\":121.458,\"actor1GeoType\":4,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"New York, United States\",\"actor2GeoLat\":42.1497,\"actor2GeoLong\":-74.9384,\"actor2GeoType\":2,\"eventNum\":0,\"totalWeight\":10},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"Zhuang Zi, Shaanxi, China\",\"actor1GeoLat\":34.7839,\"actor1GeoLong\":109.71,\"actor1GeoType\":4,\"actor2GeoCtryCode\":\"JA\",\"actor2GeoFullName\":\"Japan\",\"actor2GeoLat\":36,\"actor2GeoLong\":138,\"actor2GeoType\":1,\"eventNum\":0,\"totalWeight\":10},{\"actor1GeoCtryCode\":\"US\",\"actor1GeoFullName\":\"Washington, District of Columbia, United Stat\",\"actor1GeoLat\":38.8951,\"actor1GeoLong\":-77.0364,\"actor1GeoType\":3,\"actor2GeoCtryCode\":\"CH\",\"actor2GeoFullName\":\"Beijing, Beijing, China\",\"actor2GeoLat\":39.9289,\"actor2GeoLong\":116.388,\"actor2GeoType\":4,\"eventNum\":0,\"totalWeight\":10},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"Beijing, Beijing, China\",\"actor1GeoLat\":39.9289,\"actor1GeoLong\":116.388,\"actor1GeoType\":4,\"actor2GeoCtryCode\":\"AS\",\"actor2GeoFullName\":\"Brisbane, Queensland, Australia\",\"actor2GeoLat\":-27.5,\"actor2GeoLong\":153.017,\"actor2GeoType\":4,\"eventNum\":0,\"totalWeight\":10},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"China\",\"actor1GeoLat\":35,\"actor1GeoLong\":105,\"actor1GeoType\":1,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"Florida, United States\",\"actor2GeoLat\":27.8333,\"actor2GeoLong\":-81.717,\"actor2GeoType\":2,\"eventNum\":0,\"totalWeight\":10},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"Diaoyu, Liaoning, China\",\"actor1GeoLat\":42.8333,\"actor1GeoLong\":124.633,\"actor1GeoType\":4,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"United States\",\"actor2GeoLat\":38,\"actor2GeoLong\":-97,\"actor2GeoType\":1,\"eventNum\":0,\"totalWeight\":8},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"Wing On, Guangdong, China\",\"actor1GeoLat\":23.6444,\"actor1GeoLong\":115.173,\"actor1GeoType\":4,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"New York, United States\",\"actor2GeoLat\":42.1497,\"actor2GeoLong\":-74.9384,\"actor2GeoType\":2,\"eventNum\":0,\"totalWeight\":8},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"China\",\"actor1GeoLat\":35,\"actor1GeoLong\":105,\"actor1GeoType\":1,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"Boston, Massachusetts, United States\",\"actor2GeoLat\":42.3584,\"actor2GeoLong\":-71.0598,\"actor2GeoType\":3,\"eventNum\":0,\"totalWeight\":8},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"China\",\"actor1GeoLat\":35,\"actor1GeoLong\":105,\"actor1GeoType\":1,\"actor2GeoCtryCode\":\"GM\",\"actor2GeoFullName\":\"Berlin, Berlin, Germany\",\"actor2GeoLat\":52.5167,\"actor2GeoLong\":13.4,\"actor2GeoType\":4,\"eventNum\":0,\"totalWeight\":8},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"Tianjin, Tianjin, China\",\"actor1GeoLat\":39.1422,\"actor1GeoLong\":117.177,\"actor1GeoType\":4,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"New York, United States\",\"actor2GeoLat\":42.1497,\"actor2GeoLong\":-74.9384,\"actor2GeoType\":2,\"eventNum\":0,\"totalWeight\":7},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"Beijing, Beijing, China\",\"actor1GeoLat\":39.9289,\"actor1GeoLong\":116.388,\"actor1GeoType\":4,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"New York, United States\",\"actor2GeoLat\":42.1497,\"actor2GeoLong\":-74.9384,\"actor2GeoType\":2,\"eventNum\":0,\"totalWeight\":7},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"China\",\"actor1GeoLat\":35,\"actor1GeoLong\":105,\"actor1GeoType\":1,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"Texas, United States\",\"actor2GeoLat\":31.106,\"actor2GeoLong\":-97.6475,\"actor2GeoType\":2,\"eventNum\":0,\"totalWeight\":6},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"China\",\"actor1GeoLat\":35,\"actor1GeoLong\":105,\"actor1GeoType\":1,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"Falmouth, Massachusetts, United States\",\"actor2GeoLat\":41.5515,\"actor2GeoLong\":-70.6148,\"actor2GeoType\":3,\"eventNum\":0,\"totalWeight\":6},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"Dongbei, Shaanxi, China\",\"actor1GeoLat\":34.4334,\"actor1GeoLong\":108.55,\"actor1GeoType\":4,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"United States\",\"actor2GeoLat\":38,\"actor2GeoLong\":-97,\"actor2GeoType\":1,\"eventNum\":0,\"totalWeight\":6},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"China\",\"actor1GeoLat\":35,\"actor1GeoLong\":105,\"actor1GeoType\":1,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"Ohio, United States\",\"actor2GeoLat\":40.3736,\"actor2GeoLong\":-82.7755,\"actor2GeoType\":2,\"eventNum\":0,\"totalWeight\":6},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"China\",\"actor1GeoLat\":35,\"actor1GeoLong\":105,\"actor1GeoType\":1,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"Kentucky, United States\",\"actor2GeoLat\":37.669,\"actor2GeoLong\":-84.6514,\"actor2GeoType\":2,\"eventNum\":0,\"totalWeight\":5},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"China\",\"actor1GeoLat\":35,\"actor1GeoLong\":105,\"actor1GeoType\":1,\"actor2GeoCtryCode\":\"UK\",\"actor2GeoFullName\":\"London, London, City of, United Kingdom\",\"actor2GeoLat\":51.5,\"actor2GeoLong\":-0.116667,\"actor2GeoType\":4,\"eventNum\":0,\"totalWeight\":5},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"China\",\"actor1GeoLat\":35,\"actor1GeoLong\":105,\"actor1GeoType\":1,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"White House, District of Columbia, United States\",\"actor2GeoLat\":38.8951,\"actor2GeoLong\":-77.0364,\"actor2GeoType\":3,\"eventNum\":0,\"totalWeight\":4},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"Wang Shu, Hebei, China\",\"actor1GeoLat\":37.95,\"actor1GeoLong\":117.317,\"actor1GeoType\":4,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"United States\",\"actor2GeoLat\":38,\"actor2GeoLong\":-97,\"actor2GeoType\":1,\"eventNum\":0,\"totalWeight\":4},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"China\",\"actor1GeoLat\":35,\"actor1GeoLong\":105,\"actor1GeoType\":1,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"California, United States\",\"actor2GeoLat\":36.17,\"actor2GeoLong\":-119.746,\"actor2GeoType\":2,\"eventNum\":0,\"totalWeight\":4},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"Anyang, Henan, China\",\"actor1GeoLat\":36.0994,\"actor1GeoLong\":114.329,\"actor1GeoType\":4,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"Chicago, Illinois, United States\",\"actor2GeoLat\":41.85,\"actor2GeoLong\":-87.6501,\"actor2GeoType\":3,\"eventNum\":0,\"totalWeight\":4},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"Karamay, Xinjiang, China\",\"actor1GeoLat\":45.6004,\"actor1GeoLong\":84.8601,\"actor1GeoType\":4,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"Chicago, Illinois, United States\",\"actor2GeoLat\":41.85,\"actor2GeoLong\":-87.6501,\"actor2GeoType\":3,\"eventNum\":0,\"totalWeight\":4},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"Rongshi, Fujian, China\",\"actor1GeoLat\":25.2157,\"actor1GeoLong\":116.457,\"actor1GeoType\":4,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"Michigan, United States\",\"actor2GeoLat\":43.3504,\"actor2GeoLong\":-84.5603,\"actor2GeoType\":2,\"eventNum\":0,\"totalWeight\":4},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"Tianjin, Tianjin, China\",\"actor1GeoLat\":39.1422,\"actor1GeoLong\":117.177,\"actor1GeoType\":4,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"United States\",\"actor2GeoLat\":38,\"actor2GeoLong\":-97,\"actor2GeoType\":1,\"eventNum\":0,\"totalWeight\":4},{\"actor1GeoCtryCode\":\"NO\",\"actor1GeoFullName\":\"Norway\",\"actor1GeoLat\":62,\"actor1GeoLong\":10,\"actor1GeoType\":1,\"actor2GeoCtryCode\":\"CH\",\"actor2GeoFullName\":\"Beijing, Beijing, China\",\"actor2GeoLat\":39.9289,\"actor2GeoLong\":116.388,\"actor2GeoType\":4,\"eventNum\":0,\"totalWeight\":4},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"Beijing, Beijing, China\",\"actor1GeoLat\":39.9289,\"actor1GeoLong\":116.388,\"actor1GeoType\":4,\"actor2GeoCtryCode\":\"MY\",\"actor2GeoFullName\":\"Malaysia\",\"actor2GeoLat\":2.5,\"actor2GeoLong\":112.5,\"actor2GeoType\":1,\"eventNum\":0,\"totalWeight\":4},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"China\",\"actor1GeoLat\":35,\"actor1GeoLong\":105,\"actor1GeoType\":1,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"Hollywood, California, United States\",\"actor2GeoLat\":34.0983,\"actor2GeoLong\":-118.327,\"actor2GeoType\":3,\"eventNum\":0,\"totalWeight\":3},{\"actor1GeoCtryCode\":\"US\",\"actor1GeoFullName\":\"California, United States\",\"actor1GeoLat\":36.17,\"actor1GeoLong\":-119.746,\"actor1GeoType\":2,\"actor2GeoCtryCode\":\"CH\",\"actor2GeoFullName\":\"Beijing, Beijing, China\",\"actor2GeoLat\":39.9289,\"actor2GeoLong\":116.388,\"actor2GeoType\":4,\"eventNum\":0,\"totalWeight\":3},{\"actor1GeoCtryCode\":\"BR\",\"actor1GeoFullName\":\"Brazil\",\"actor1GeoLat\":-10,\"actor1GeoLong\":-55,\"actor1GeoType\":1,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"Chicago, Illinois, United States\",\"actor2GeoLat\":41.85,\"actor2GeoLong\":-87.6501,\"actor2GeoType\":3,\"eventNum\":0,\"totalWeight\":2},{\"actor1GeoCtryCode\":\"RS\",\"actor1GeoFullName\":\"Tohoku, Sakhalinskaya Oblast', Russia\",\"actor1GeoLat\":46.4333,\"actor1GeoLong\":141.883,\"actor1GeoType\":4,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"United States\",\"actor2GeoLat\":38,\"actor2GeoLong\":-97,\"actor2GeoType\":1,\"eventNum\":0,\"totalWeight\":2},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"China\",\"actor1GeoLat\":35,\"actor1GeoLong\":105,\"actor1GeoType\":1,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"Michigan, United States\",\"actor2GeoLat\":43.3504,\"actor2GeoLong\":-84.5603,\"actor2GeoType\":2,\"eventNum\":0,\"totalWeight\":2},{\"actor1GeoCtryCode\":\"GM\",\"actor1GeoFullName\":\"Germany\",\"actor1GeoLat\":51,\"actor1GeoLong\":9,\"actor1GeoType\":1,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"Washington, District of Columbia, United States\",\"actor2GeoLat\":38.8951,\"actor2GeoLong\":-77.0364,\"actor2GeoType\":3,\"eventNum\":0,\"totalWeight\":2},{\"actor1GeoCtryCode\":\"RS\",\"actor1GeoFullName\":\"Russia\",\"actor1GeoLat\":60,\"actor1GeoLong\":100,\"actor1GeoType\":1,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"Washington, District of Columbia, United States\",\"actor2GeoLat\":38.8951,\"actor2GeoLong\":-77.0364,\"actor2GeoType\":3,\"eventNum\":0,\"totalWeight\":2},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"Beijing, Beijing, China\",\"actor1GeoLat\":39.9289,\"actor1GeoLong\":116.388,\"actor1GeoType\":4,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"Oregon, United States\",\"actor2GeoLat\":44.5672,\"actor2GeoLong\":-122.127,\"actor2GeoType\":2,\"eventNum\":0,\"totalWeight\":2},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"Hong Xiao, Hunan, China\",\"actor1GeoLat\":27.8322,\"actor1GeoLong\":111.953,\"actor1GeoType\":4,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"New York, United States\",\"actor2GeoLat\":42.1497,\"actor2GeoLong\":-74.9384,\"actor2GeoType\":2,\"eventNum\":0,\"totalWeight\":2},{\"actor1GeoCtryCode\":\"IN\",\"actor1GeoFullName\":\"Mumbai, Maharashtra, India\",\"actor1GeoLat\":18.975,\"actor1GeoLong\":72.8258,\"actor1GeoType\":4,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"White House, District of Columbia, United States\",\"actor2GeoLat\":38.8951,\"actor2GeoLong\":-77.0364,\"actor2GeoType\":3,\"eventNum\":0,\"totalWeight\":2},{\"actor1GeoCtryCode\":\"BX\",\"actor1GeoFullName\":\"South China Sea, Brunei (general), Brunei\",\"actor1GeoLat\":15,\"actor1GeoLong\":115,\"actor1GeoType\":4,\"actor2GeoCtryCode\":\"CH\",\"actor2GeoFullName\":\"Beijing, Beijing, China\",\"actor2GeoLat\":39.9289,\"actor2GeoLong\":116.388,\"actor2GeoType\":4,\"eventNum\":0,\"totalWeight\":2},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"China\",\"actor1GeoLat\":35,\"actor1GeoLong\":105,\"actor1GeoType\":1,\"actor2GeoCtryCode\":\"JA\",\"actor2GeoFullName\":\"Japan\",\"actor2GeoLat\":36,\"actor2GeoLong\":138,\"actor2GeoType\":1,\"eventNum\":0,\"totalWeight\":2},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"China\",\"actor1GeoLat\":35,\"actor1GeoLong\":105,\"actor1GeoType\":1,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"Seattle, Washington, United States\",\"actor2GeoLat\":47.6062,\"actor2GeoLong\":-122.332,\"actor2GeoType\":3,\"eventNum\":0,\"totalWeight\":2},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"Beijing, Beijing, China\",\"actor1GeoLat\":39.9289,\"actor1GeoLong\":116.388,\"actor1GeoType\":4,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"South Carolina, United States\",\"actor2GeoLat\":33.8191,\"actor2GeoLong\":-80.9066,\"actor2GeoType\":2,\"eventNum\":0,\"totalWeight\":2},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"Beijing, Beijing, China\",\"actor1GeoLat\":39.9289,\"actor1GeoLong\":116.388,\"actor1GeoType\":4,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"Virginia, United States\",\"actor2GeoLat\":37.768,\"actor2GeoLong\":-78.2057,\"actor2GeoType\":2,\"eventNum\":0,\"totalWeight\":2},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"China\",\"actor1GeoLat\":35,\"actor1GeoLong\":105,\"actor1GeoType\":1,\"actor2GeoCtryCode\":\"RS\",\"actor2GeoFullName\":\"Russia\",\"actor2GeoLat\":60,\"actor2GeoLong\":100,\"actor2GeoType\":1,\"eventNum\":0,\"totalWeight\":2},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"Tibet, Xizang, China\",\"actor1GeoLat\":32,\"actor1GeoLong\":90,\"actor1GeoType\":5,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"White House, District of Columbia, United States\",\"actor2GeoLat\":38.8951,\"actor2GeoLong\":-77.0364,\"actor2GeoType\":3,\"eventNum\":0,\"totalWeight\":2},{\"actor1GeoCtryCode\":\"FR\",\"actor1GeoFullName\":\"France\",\"actor1GeoLat\":46,\"actor1GeoLong\":2,\"actor1GeoType\":1,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"Stewart Park, North Carolina, United States\",\"actor2GeoLat\":34.974,\"actor2GeoLong\":-80.5653,\"actor2GeoType\":3,\"eventNum\":0,\"totalWeight\":2},{\"actor1GeoCtryCode\":\"US\",\"actor1GeoFullName\":\"Kentucky, United States\",\"actor1GeoLat\":37.669,\"actor1GeoLong\":-84.6514,\"actor1GeoType\":2,\"actor2GeoCtryCode\":\"CH\",\"actor2GeoFullName\":\"China\",\"actor2GeoLat\":35,\"actor2GeoLong\":105,\"actor2GeoType\":1,\"eventNum\":0,\"totalWeight\":2},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"Beijing, Beijing, China\",\"actor1GeoLat\":39.9289,\"actor1GeoLong\":116.388,\"actor1GeoType\":4,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"Kivalina, Alaska, United States\",\"actor2GeoLat\":67.7269,\"actor2GeoLong\":-164.533,\"actor2GeoType\":3,\"eventNum\":0,\"totalWeight\":1},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"Karamay, Xinjiang, China\",\"actor1GeoLat\":45.6004,\"actor1GeoLong\":84.8601,\"actor1GeoType\":4,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"Millennium Park, Illinois, United States\",\"actor2GeoLat\":42.0134,\"actor2GeoLong\":-88.3384,\"actor2GeoType\":3,\"eventNum\":0,\"totalWeight\":1},{\"actor1GeoCtryCode\":\"US\",\"actor1GeoFullName\":\"Texas, United States\",\"actor1GeoLat\":31.106,\"actor1GeoLong\":-97.6475,\"actor1GeoType\":2,\"actor2GeoCtryCode\":\"CH\",\"actor2GeoFullName\":\"Lanzhou, Gansu, China\",\"actor2GeoLat\":36.0564,\"actor2GeoLong\":103.792,\"actor2GeoType\":4,\"eventNum\":0,\"totalWeight\":1},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"Beijing, Beijing, China\",\"actor1GeoLat\":39.9289,\"actor1GeoLong\":116.388,\"actor1GeoType\":4,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"Los Angeles, California, United States\",\"actor2GeoLat\":34.0522,\"actor2GeoLong\":-118.244,\"actor2GeoType\":3,\"eventNum\":0,\"totalWeight\":1},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"China\",\"actor1GeoLat\":35,\"actor1GeoLong\":105,\"actor1GeoType\":1,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"Alaska, United States\",\"actor2GeoLat\":61.385,\"actor2GeoLong\":-152.268,\"actor2GeoType\":2,\"eventNum\":0,\"totalWeight\":1},{\"actor1GeoCtryCode\":\"US\",\"actor1GeoFullName\":\"United States\",\"actor1GeoLat\":38,\"actor1GeoLong\":-97,\"actor1GeoType\":1,\"actor2GeoCtryCode\":\"RS\",\"actor2GeoFullName\":\"Tohoku, Sakhalinskaya Oblast', Russia\",\"actor2GeoLat\":46.4333,\"actor2GeoLong\":141.883,\"actor2GeoType\":4,\"eventNum\":0,\"totalWeight\":1},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"Beijing, Beijing, China\",\"actor1GeoLat\":39.9289,\"actor1GeoLong\":116.388,\"actor1GeoType\":4,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"Arizona, United States\",\"actor2GeoLat\":33.7712,\"actor2GeoLong\":-111.388,\"actor2GeoType\":2,\"eventNum\":0,\"totalWeight\":1},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"Heilongjiang, Heilongjiang, China\",\"actor1GeoLat\":48,\"actor1GeoLong\":128,\"actor1GeoType\":5,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"Kivalina, Alaska, United States\",\"actor2GeoLat\":67.7269,\"actor2GeoLong\":-164.533,\"actor2GeoType\":3,\"eventNum\":0,\"totalWeight\":1},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"China\",\"actor1GeoLat\":35,\"actor1GeoLong\":105,\"actor1GeoType\":1,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"New York, United States\",\"actor2GeoLat\":42.1497,\"actor2GeoLong\":-74.9384,\"actor2GeoType\":2,\"eventNum\":0,\"totalWeight\":1},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"China\",\"actor1GeoLat\":35,\"actor1GeoLong\":105,\"actor1GeoType\":1,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"Bradford County, Pennsylvania, United States\",\"actor2GeoLat\":41.8754,\"actor2GeoLong\":-76.875,\"actor2GeoType\":3,\"eventNum\":0,\"totalWeight\":1},{\"actor1GeoCtryCode\":\"MX\",\"actor1GeoFullName\":\"Mexico\",\"actor1GeoLat\":23,\"actor1GeoLong\":-102,\"actor1GeoType\":1,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"White House, District of Columbia, United States\",\"actor2GeoLat\":38.8951,\"actor2GeoLong\":-77.0364,\"actor2GeoType\":3,\"eventNum\":0,\"totalWeight\":1},{\"actor1GeoCtryCode\":\"CH\",\"actor1GeoFullName\":\"Beijing, Beijing, China\",\"actor1GeoLat\":39.9289,\"actor1GeoLong\":116.388,\"actor1GeoType\":4,\"actor2GeoCtryCode\":\"US\",\"actor2GeoFullName\":\"California, United States\",\"actor2GeoLat\":36.17,\"actor2GeoLong\":-119.746,\"actor2GeoType\":2,\"eventNum\":0,\"totalWeight\":1},{\"actor1GeoCtryCode\":\"UK\",\"actor1GeoFullName\":\"United Kingdom\",\"actor1GeoLat\":54,\"actor1GeoLong\":-2,\"actor1GeoType\":1,\"actor2GeoCtryCode\":\"CH\",\"actor2GeoFullName\":\"Dongbei, Shaanxi, China\",\"actor2GeoLat\":34.4334,\"actor2GeoLong\":108.55,\"actor2GeoType\":4,\"eventNum\":0,\"totalWeight\":1}]",
  "jgzlx":1,
  "pzid":57}]
  -->
</html>







