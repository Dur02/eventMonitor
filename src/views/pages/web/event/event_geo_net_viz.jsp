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
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/leaflet.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/dvf.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/example.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/ui.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/infomap.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/geonetmap.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window_zs.css"/><!-- 弹出提示框样式 -->
<script src="<%=basePath%>/static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/echarts.js"></script>
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
<style>
 	.index_top {
 		border-bottom: 1.5px solid #4b546e;
 	}
 	.index_bottom { 		
		background: url(<%=basePath %>/static/images/beij.png) no-repeat;
		background-size: 100% 100%;	
 	}
	.outer_frame {
		width: 100%;
    	height: 95%;
    	margin: 0 auto;
    	/* border: 1px solid #394055;  */
    	position: relative;  
    	background: url(<%=basePath %>/static/images/beij.png) no-repeat top right;		
	}
	.neihe {
		width: 95.5%;
	    height: 95%;
	    margin-top: 3%;
	    margin-left: 2.3%;
	   /*  border: 1px solid red; */
	    position: absolute; 
	}
	.pic_left {
		height: 295px;
	    width: 29.3%;
	    position: absolute;
	    left: 4.6%;
	    top: 486px;
	    overflow: hidden;
    		
	}
	.pic_left1 {
		position: absolute;
		width: 100%;
		height: 100%;
		background: url(<%=basePath %>/static/images/biankuang.png) no-repeat;
		background-size: 480px 305px;		
	}
	.donghua {
		animation: run 1s forwards;	
	}
	@keyframes run {
		0% {
			top: 0;
		}
		100% {
			top: 307px;
		}
	}
	.donghua1 {
		animation: run1 1s forwards;
	}
	@keyframes run1 {
		0% {
			top: 307px;
		}
		100% {
			top: 0;
		}
	}
	.left_span {
		position: absolute;
	    left: 30px;
	    top: 21px;
	    color: #fff;
	    font-size: 15px;
	}
	.country {
		position: absolute;
	    height: 16px;
	    width: 44px;
	    left: 127px;
	    top: 23px;
	    border: 1px solid white;
	    cursor: pointer;
	}
	.img_0 {
		left: 28px;
		position: absolute;
		top: 4px;
		cursor: pointer;
	}
	.num {
		position: absolute;
		color: #fff;
		top: -2px;
		left: 5px;
	}
	.left_span1 {
		cursor: pointer;
		position: absolute;
	    left: 422px;
	    top: 28px;
	}
	.pic_middle {
		height: 295px;
	    width: 34.3%;
	    position: absolute;
	    left: 35.5%;
	    top: 486px;
	    overflow: hidden;
	}
	.pic_middle1 {
		position: absolute;
		width: 100%;
		height: 100%;
		background: url(<%=basePath %>/static/images/biankuang.png) no-repeat;
		background-size: 530px 305px;
	}
	.middle_span {
		position: absolute;
	    left: 30px;
	    top: 17px;
	    color: #fff;
	    font-size: 15px;
	}
	.province {
		position: absolute;
	    height: 16px;
	    width: 44px;
	    left: 126px;
	    top: 20px;
	    border: 1px solid white;
	    cursor: pointer;
	}
	.img_1 {
		left: 28px;
		position: absolute;
		top: 4px;
		cursor: pointer;
	}
	.num1 {
		position: absolute;
		color: #fff;
		top: -2px;
		left: 5px;
	}
	.middle_span1 {
		cursor: pointer;
		position: absolute;
	    left: 468px;
	    top: 27px;
	}
	
	.right_span {
		position: absolute;
	    left: 31px;
	    top: 18px;
	    color: #fff;
	    font-size: 15px;
	}
	.city {
		position: absolute;
	    height: 16px;
	    width: 44px;
	    left: 126px;
	    top: 21px;
	    border: 1px solid white;
	    cursor: pointer;
	}
	.img_2 {
		left: 28px;
		position: absolute;
		top: 4px;
		cursor: pointer;
	}
	.num2 {
		position: absolute;
		color: #fff;
		top: -2px;
		left: 5px;
	}
	.right_span1 {
		cursor: pointer;
		position: absolute;
	    left: 422px;
	    top: 26px;
	}
	
	.pic_right {
		height: 307px;
    	width: 30%;
    	left: 68.8%;
    	top: 486px;	 
    	position: absolute;
    	overflow: hidden;
   	    z-index: 999;
	}
	.pic_right1 {
		
		position: absolute;
		width: 100%;
		height: 100%;
		background: url(<%=basePath %>/static/images/biankuang.png) no-repeat;
		background-size: 478px 305px;
		
	}
	.geography {
		height: 45px;
		width: 242px;
		position: absolute;		
		left: 685px;
		background: url(<%=basePath %>/static/images/dili3.png) no-repeat;
	}
	.geography1 {
		position: absolute;
		font-size: 14px;
    	font-family: SimSun;
    	font-weight: bold;
    	color: #fff;
    	left: 61px;
    	top: 11px;
	}
	.things {
		width: 244px;
		height: 66px;
		border: 1px solid yellow;
		position: absolute;
		right: 15px;	
	}
	.go {
		width: 28px;
		height: 15px;
		border: 1px solid #1069be;
		position: absolute;
		bottom: 0px;
	    z-index: 9999999;
	}
	.top1 {
		cursor: pointer;
		display: none;		
		left: 508px;
		background:  url(<%=basePath %>/static/images/shangla.png) no-repeat;
    	bottom: -10px;
	}
	.top2 {	
		cursor: pointer;
		display: none;		
		left: 1073px;
		background:  url(<%=basePath %>/static/images/shangla.png) no-repeat;
    	bottom: -10px;
	}
	.top3 {		
		cursor: pointer;
		display: none;	
		left: 1585px;
		background:  url(<%=basePath %>/static/images/shangla.png) no-repeat;
    	bottom: -10px;
	}
	.ziti {
		font-size: 14px;
    	font-family: SimSun;
    	font-weight: bold;
	}
	.content_zs {
		position: absolute;
		width: 87%;
		height: 227px;
		left: 20px;
    	top: 48px;		 
	}
	.uu {
		width: 44px;
		height: 70px;
	    position: absolute;
	    left: 127px;
	    top: 39px;
	    background: #8b9bc6;
	    padding-left: 10px;
	    display: none; 
	    overflow-y:scroll;    
	}
	.uu::-webkit-scrollbar {
    	width: 3px;
    	height: 1px;
    }
    .uu1::-webkit-scrollbar {
    	width: 3px;
    	height: 1px;
    }
    .uu2::-webkit-scrollbar {
    	width: 3px;
    	height: 1px;
    }
	.uu1 {
		width: 44px;
		height: 70px;
	    position: absolute;
	    left: 126px;
    	top: 36px;
	    background: #8b9bc6;
	    padding-left: 10px;
	    display: none;
	    overflow-y:scroll;    
	}
	.uu2 {
		width: 44px;
		height: 70px;
	    position: absolute;
	    left: 126px;
    	top: 37px;
	    background: #8b9bc6;
	    padding-left: 10px;
	    display: none;
	    overflow-y:scroll;    
	}
	.leaflet-right .leaflet-control {
    	margin-right: 39px;
	}
	#info{
	    float: right;
	    position: relative;
	    top: -692px;
	    right: 103px;
	}
	.uu li {
    list-style: none;
    cursor: pointer;
	}
	.uu1 li {
    list-style: none;
    cursor: pointer;
	}
	.uu2 li {
    list-style: none;
    cursor: pointer;
	}
</style>
</head>
<body>
	<div class="index_top clearfix">
		<h3 class="fl title">事件库分析 > 地理网络</h3>
		<input type="hidden" id="moduleCode" value="${moduleCode}">
	</div>
	<div class="index_bottom" style="height: 968px!important;">
		<!-- 填充   -->
		<div class="outer_frame">
			<div class="neihe">
				<div id="map" style="height: 744px;"></div>
				<div id="info" class="leaflet-control-legend">
	                	<span style="font-style: italic; font-size: 16px;">Click on CountryNode to view details
	                		<img class="isShowViewImage" id="isShowView-image" onclick="isShowView()" src="<%=basePath%>/static/images/mapInfoUp.png">
	                	</span>
	                	<div id="info-table"></div>
                </div>
			</div>
			<div class="geography">
				<span class="geography1">地理联系展示</span>
			</div>
			<!-- 上拉按钮 -->
			<div class="go top1"></div>
			<div class="go top2"></div>
			<div class="go top3"></div>
			<!-- 左下框 -->
			<div class="pic_left">
				<div class="pic_left1">
					<span class="left_span">国家联系展示</span>
						<span class="country">
							<span class="num" id="country_select">5</span>
							<span class="img_0">
								<img alt="" src="<%=basePath %>/static/images/arrow_white.png">
							</span>
						</span>
					<span class="left_span1">
						<img alt="" src="<%=basePath %>/static/images/arrow_1.png">
					</span>
					<div class="content_zs" id="countryShow" ></div>					
					<ul class="uu" id="test">
						<li>5</li>
						<li>10</li>
						<li>15</li>
						<li>20</li>
						<!-- <li>1</li>
						<li>2</li>
						<li>3</li>
						<li>4</li>
						<li>1</li>
						<li>2</li>
						<li>3</li>
						<li>4</li> -->
					</ul>
				</div>				
			</div>
			<!-- 中下框 -->
			<div class="pic_middle">
				<div class="pic_middle1">
					<span class="middle_span">州省联系展示</span>
					<span class="province">
						<span class="num1" id="province_select">5</span>
						<span class="img_1">
							<img alt="" src="<%=basePath %>/static/images/arrow_white.png">
						</span>
					</span>
					<span class="middle_span1">
						<img alt="" src="<%=basePath %>/static/images/arrow_1.png">
					</span>
					<div class="content_zs" id="stateShow"></div>					
					<ul class="uu1" id="test1">
						<li>5</li>
						<li>10</li>
						<li>15</li>
						<li>20</li>
						<!-- <li>1</li>
						<li>2</li>
						<li>3</li>
						<li>4</li>
						<li>1</li>
						<li>2</li>
						<li>3</li>
						<li>4</li> -->
					</ul>
				</div>
				
			</div>
			<!-- 右下 -->
			<div class="pic_right">
			<div class="pic_right1">
				<span class="right_span">城市联系展示</span>
				<span class="city">
				<span class="num2" id="city_select">5</span>
				<span class="img_2">
					<img alt="" src="<%=basePath %>/static/images/arrow_white.png">
				</span>
				</span>
				<span class="right_span1">
					<img alt="" src="<%=basePath %>/static/images/arrow_1.png">
				</span>
				<div class="content_zs" id="cityShow"></div>	
				
				<ul class="uu2" id="test2">
						<li>5</li>
						<li>10</li>
						<li>15</li>
						<li>20</li>
						<!-- <li>1</li>
						<li>2</li>
						<li>3</li>
						<li>4</li>
						<li>1</li>
						<li>2</li>
						<li>3</li>
						<li>4</li> -->
				</ul>
			</div>	
					
			</div>
		</div>
		
		
		
		<!-- 条件tab页  -->
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
<script src="<%=basePath%>/static/Visualization/js/leaflet/leaflet-src.js"></script>
<script src="<%=basePath%>/static/Visualization/js/leaflet/leaflet.js"></script>
<script src="<%=basePath%>/static/Visualization/js/leaflet/tile.stamen.js"></script>
<script src="<%=basePath%>/static/Visualization/js/leaflet/geohash.js"></script>
<script src="<%=basePath%>/static/Visualization/js/leaflet/underscore-min.js"></script>
<script src="<%=basePath%>/static/Visualization/js/leaflet/moment.min.js"></script>
<script src="<%=basePath%>/static/Visualization/js/leaflet/leaflet-dvf.js"></script>
<script src="<%=basePath%>/static/Visualization/js/leaflet/leaflet.dvf.experimental.js"></script>
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
	
 	//加载配置对应的结果数据
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
						win.alertEx("加载失败");
					}
					renderData(data);
					endLoad();
					//左侧菜单栏 扩大缩小后重新渲染图表
					window.onresize = function(){
						renderData(data);
					}
				}
			});
	}
	var country_dic=[];
	var state_dic =[];
	var city_dic =[];
	/*
	  将数据渲染至图表中
	*/
	function renderData(data){
		//地图假数据
		//var Country_Nodes = [{"countryCode":"USA","chineseName":"美国","englishName":"UNITED STATES","lat":"38.8895","lon":"-77.032"},{"countryCode":"CHN","chineseName":"中国","englishName":"CHINA","lat":"40.0495","lon":"116.286"},{"countryCode":"JPN","chineseName":"日本","englishName":"JAPAN","lat":"35.67","lon":"139.77"},{"countryCode":"GBR","chineseName":"英国","englishName":"UNITED KINGDOM","lat":"51.5002","lon":"-0.126236"}];
		//var Country_Edges = [{"国家编码1":"USA","国家编码2":"JPN","国家1":"美国","国家2":"日本","联系数":4432},{"国家编码1":"USA","国家编码2":"GBR","国家1":"美国","国家2":"英国","联系数":8719},{"国家编码1":"CHN","国家编码2":"JPN","国家1":"中国","国家2":"日本","联系数":1857},{"国家编码1":"CHN","国家编码2":"GBR","国家1":"中国","国家2":"英国","联系数":1778}];
		var Location_Nodes = data.Location_Nodes;
		var Location_Edges = data.Location_Edges;
		var viewLatLong = data.viewLatLong;
		country_dic = data.country_dic;//国家联系
		state_dic = data.state_dic;//州省联系
		city_dic = data.city_dic;//城市联系
		var flag=5;
		$("#country_select").html(flag);
		$("#province_select").html(flag);
		$("#city_select").html(flag);
		top1.onclick();
		top2.onclick();
		top3.onclick();
		uu.style.display = 'none';
		uu.style.display = 'none';
		uu.style.display = 'none';
		//加载地图
		showLeafletMap(Location_Nodes,Location_Edges,viewLatLong);
		//加载下方图表
		showCountryRelation(flag,country_dic);
		showStateRelation(flag,state_dic);
		showCityRelation(flag,city_dic);
	}
	
	var top1 = document.querySelector('.top1');
	var top2 = document.querySelector('.top2');
	var top3 = document.querySelector('.top3');
	var left_span1 = document.querySelector('.left_span1');
	var middle_span1 = document.querySelector('.middle_span1');
	var right_span1 = document.querySelector('.right_span1');
	var pic_left1 = document.querySelector('.pic_left1'); 
	var pic_middle1 = document.querySelector('.pic_middle1'); 
	var pic_right1 = document.querySelector('.pic_right1'); 
	var img_0 = document.querySelector('.country')
	var img_1 = document.querySelector('.province')
	var img_2 = document.querySelector('.city')
	
	var uu = document.querySelector('.uu')
	var uu1 = document.querySelector('.uu1')
	var uu2 = document.querySelector('.uu2')
	
	//左侧国家联系展示点击显示隐藏
	left_span1.onclick = function(){
		pic_left1.classList.add('donghua');
		pic_left1.classList.remove('donghua1');
		top1.style.display = "block";
	}
	//中间州省联系展示点击显示隐藏
	middle_span1.onclick = function(){
		pic_middle1.classList.remove('donghua1');	
		pic_middle1.classList.add('donghua');
		top2.style.display = "block";
	}
	//右侧城市联系展示点击显示隐藏
	right_span1.onclick = function(){
		pic_right1.classList.remove('donghua1');		
		pic_right1.classList.add('donghua');
		top3.style.display = "block";
	}
	
	top1.onclick = function(){
		pic_left1.classList.add('donghua1');
		pic_left1.classList.remove('donghua');
		top1.style.display = "none";
	}
	top2.onclick = function(){
		pic_middle1.classList.add('donghua1');
		pic_middle1.classList.remove('donghua');
		top2.style.display = "none";
	}
	
	top3.onclick = function(){
		pic_right1.classList.add('donghua1');
		pic_right1.classList.remove('donghua');
		top3.style.display = "none";
	}
	
	var flags = undefined;
	//左侧国家联系展示点击下拉框
	img_0.onclick = function(){
		flags = !flags;
		if(flags){
			uu.style.display = 'none'
		}else {
			uu.style.display = 'block'
		}
	}
	//中间州省联系展示点击下拉框
	img_1.onclick = function(){
		flags = !flags;
		if(flags){
			uu1.style.display = 'none'
		}else {
			uu1.style.display = 'block'
		}
	}
	//右侧城市联系展示点击下拉框
	img_2.onclick = function(){
		flags = !flags;
		if(flags){
			uu2.style.display = 'none'
		}else {
			uu2.style.display = 'block'
		}
	}
	/*
	    国家数据
	*/
	function showCountryRelation(flag,country_dic){
		var countryShow_chart = echarts.init(document.getElementById('countryShow'));
		var countryNameList=[];
		var newCountryData=[];
		//根据country_dic长度取对falg重新赋值
		flag = country_dic.length > flag?flag:country_dic.length;
		for(var i=0;i<flag;i++){
			var countryName;
			var countrychName;
			var countryData;
			if(country_dic.length!=0){
				countryName=country_dic[i].key;
				countrychName=country_dic[i].ch_key
				countryData=country_dic[i].value;
			}
			countryNameList.push(countryName);
			var d1={
					name:countrychName,
					value:countryData
			}
			newCountryData.push(d1)
		}
		option = {
			    color: ['#3398DB'],
			     tooltip: {
			        trigger: 'axis',
			        axisPointer: {
			            type: 'line',
			            z: 0
			        },
			        confine :true,
			        showContent: true,
			        formatter:  function (params) {
			        	var data = params[0].data;
			        	var name=data.name;
			        	var value=data.value;
			        	if(name!=undefined){
			        		return name+'：'+value;
			        	}
			        	
			        }
			    },
			    grid: {
			        left: '3%',
			        right: '4%',
			        bottom: '3%',
			        containLabel: true
			    },
			    /* dataZoom: {
			        show: true,
			        type: 'slider',
			        realtime: true,
			        height: 10,
			        start: 0,
			        end: 100,
			        textStyle:false,
			        bottom:"5%"
			    }, */
			    xAxis: [{
			        type: 'category',
			        axisTick: {
			            show: true,
			            alignWithLabel: true,
			            interval:"auto" 
			        },
			        axisLabel: {
			            color: '#fff',
			            fontSize:16,
			            interval:1,
                        rotate:0,
                       /*  formatter: function(value) {
			                 var res = value;
			                 if(res!=undefined){
			                	 if(res.length >5) {
				                     res = res.substring(0, 3) + "..";
				                 }
			                	 return res;  
			                 }
			                 
			                } */
			        },
			        axisLine: {
			            lineStyle: {
			                color: '#f9f9f9',
			                fontSize: 16
			            }
			        },
			        data: countryNameList
			    }],
			    yAxis: [{
			        type: 'value',
			        boundaryGap: ['0%', '10%'],
			        splitLine: {
			            show: false
			        },
			        axisLabel: {
			            color: '#fff',
			            fontSize: 16
			        },
			        axisLine: {
			            lineStyle: {
			                color: '#f9f9f9'
			            }
			        }
			    }],
			    series: [{
			        name: '国家联系展示',
			        type: 'bar',
			        barWidth: 26,
			        emphasis: {
			            label: {
			                show: true,
			                position: 'top',
			                distance: 8,
			                textStyle: {
			                    color: '#fff',
			                    fontSize: 18
			                }
			            }
			        },
			        itemStyle: {
			            normal: {
			                show: true,
			                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
			                        offset: 0,
			                        color: '#07fb96'
			                    },
			                    {
			                        offset: 1,
			                        color: '#3149fc'
			                    }
			                ])
			            }
			        },
			        data: newCountryData
			    }]
			}
			countryShow_chart.setOption(option);
	        //调节echarts图表自适应
	        window.onresize=function (){
	        	countryShow_chart.resize();
	        }
	}
	
	/*
	    州省数据
	*/
	function showStateRelation(flag,state_dic){
		var stateShow_chart = echarts.init(document.getElementById('stateShow'));
		var stateNameList=[];
		var newstateData=[];
		//根据state_dic长度取对falg重新赋值
		flag = state_dic.length > flag ? flag:state_dic.length;
		for(var i=0;i<flag;i++){
			var stateName;
			var stateData;
			if(state_dic.length!=0){
				stateName=state_dic[i].key;
				stateData=state_dic[i].value;
			}
			stateNameList.push(stateName);
			var d1={
					name:stateName,
					value:stateData
			}
			newstateData.push(d1)
		}
		option = {
			    calculable: true,
			    "tooltip": {
			        "trigger": "item",
			        "confine" :true,
			        "formatter": "{b}:{c}"
			    },
			    "legend": {
			    	'show':false,
			    	'type':'scroll',
			    	'top': 0,
			    	'width':'auto',
			        "data": stateNameList,
			        "textStyle": {
			            "color": "#fff"
			        }
			    },
			    "calculable": true,
			    "series": [{
			        "name": "州省联系展示",
			        "type": "pie",
			        "radius": [
			            15,
			           80
			        ],
			        "avoidLabelOverlap": false,
			        "startAngle": 0,
			        "center": [
			            "50.1%",
			            "50%"
			        ],
			        "roseType": "area",
			        "selectedMode": "single",
			        "label": {
			            "normal": {
			                "show": true,
			                "formatter": function(params){
			                	var name=params.name;
			                	if(name !=''){
			                		var nameArray = name.split("_");
				                	var fname=nameArray[0].substr(0,6);
				                	var lname=nameArray[1].substr(0,6);
				                	/* var fname=fstName.match(/[\u4e00-\u9fa5]/g).join("");
				                	var lname=lastName.match(/[\u4e00-\u9fa5]/g).join(""); */
				                	var pname=fname+".."+"_"+lname+".."
				                	return pname;
			                	}
			                	
			                }
			            },
			            "emphasis": {
			                "show": true
			            }
			        },
			        color: ['#f845f1', '#ad46f3', '#5045f6', '#4777f5','#44aff0','#45dbf7','#f6d54a','#f69846','#ff4343'],
			        "data":newstateData 
			}]
		}
			stateShow_chart.setOption(option);
	        //调节echarts图表自适应
	        window.onresize=function (){
	        	stateShow_chart.resize();
	        }
	}
	/*
	    城市数据
	*/
	
	function showCityRelation(flag,city_dic){
		var cityShow_chart = echarts.init(document.getElementById('cityShow'));
		var cityNameList=[];
		var newscityData=[];
		var maxIndex=0;
		//根据state_dic长度取对falg重新赋值
		flag = city_dic.length > flag ? flag:city_dic.length;
		for(var i=0;i<flag;i++){
			var cityName;
			var cityData;
			if(city_dic.length!=0){
				var cityName=city_dic[i].key;
				var cityData=city_dic[i].value;
			}
			cityNameList.push(cityName);
			if(maxIndex<(cityData*1)){
				maxIndex = (cityData*1);
			}
			var d1={
					name:cityName,
					value:cityData
			}
			newscityData.push(d1)
		}
		var color1 = new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
		    offset: 0,
		    color: '#fff'
		}, {
		    offset: 0.4,
		    color: '#d3beff'
		}, {
		    offset: 0.9,
		    color: '#6862ff'
		}]);
		var color2 = new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
		    offset: 0,
		    color: '#FFFFC2'
		}, {
		    offset: 1,
		    color: '#F8F876'
		}]);
		option = {
		    tooltip: {
		        show:true,
		        formatter:'{b}:{c}'
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
		    xAxis: [{
		        type: 'category',
		        data: cityNameList,
		        splitLine: {
		            show: false
		        },
		        axisTick: {
		            show: true,
		            alignWithLabel: true,
		            interval:3 
		        },
		        axisLine: {
		            lineStyle: {
		                color: '#f9f9f9'
		            }
		        },
		        axisLabel: {
		            color: '#fff',
		            fontSize:16,
		            interval:1,
                    rotate:0,
                    formatter: function(value) {
		                 var res = value;
		                 if(res!=undefined){
		                	 if(res.length >5) {
			                     res = res.substring(0, 3) + "..";
			                 }
		                	 return res; 
		                 }
		                 
		                }
		        }
		    }],
		    yAxis: [{
		        type: 'value',
		        min: 0,
		        axisTick: {
		            show: true
		        },
		        axisLine: {
		            lineStyle: {
		                color: '#f9f9f9'
		            }
		        },
		        axisLabel: {
		            formatter: '{value}',
		            textStyle: {
		                fontSize: 14,
		                color: '#fff'
		            }
		        },
		        splitLine: {
		            show: false
		        },
		        splitArea: {
		            show: false
		        },
		        max: maxIndex
		    }],
		    series: [{
		        name: '城市关系展示',
		        type: 'bar',
		        barWidth: '15',
		        data: newscityData,
		        itemStyle: {
		            normal: {
		                barBorderRadius: 15,
		                color: color1
		            }
		        }
		    }]
		};
		cityShow_chart.setOption(option);
        //调节echarts图表自适应
        window.onresize=function (){
        	cityShow_chart.resize();
        }
	}
	
	/*
	     地图数据
	*/
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
	// 加载leaftlet地图 
	function showLeafletMap(Location_Nodes,Location_Edges,viewLatLong){
		
		$("#info-table").empty();
		//先让被选中的节点去掉
		qxMapSelectNode();
		
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
        var sizeFunction = new L.LinearFunction([1, 20], [253, 48]);
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
            setIcon: function (record, options) {
                var html = '<div><i class="fa fa-flag"></i></div>';
                var $html = $(html);
                var $i = $html.find('i');
                L.StyleConverter.applySVGStyle($i.get(0), options);
                var directLocation_Edges = L.Util.getFieldValue(record, 'nodeSize');
                var size = sizeFunction.evaluate(directLocation_Edges);
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
        //所有节点选中
        $(".leaflet-control-layers label :eq(0)").click();
	}
	
	//国家联系展示下拉选择展示数量
	$("ul#test").on("click","li",function(){
		var flag=$(this).text();
		$("#country_select").html(flag);
		showCountryRelation(flag,country_dic);
		//showStateRelation(flag,state_dic);
		//showCityRelation(flag,city_dic);
		$("#test").hide();
	});
	
	//州省联系展示下拉选择展示数量
	$("ul#test1").on("click","li",function(){
		var flag=$(this).text();
		$("#province_select").html(flag);
		showStateRelation(flag,state_dic);
		$("#test1").hide();
	});
	
	//城市联系展示下拉选择展示数量
	$("ul#test2").on("click","li",function(){
		var flag=$(this).text();
		$("#city_select").html(flag);
		showCityRelation(flag,city_dic);
		$("#test2").hide();
	});
	
	</script>
</html>