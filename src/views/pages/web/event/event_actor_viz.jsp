<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>事件角色展示</title>
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
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/leaflet.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/dvf.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/example.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/ui.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/actormap.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window_zs.css"/><!-- 弹出提示框样式 -->
<script src="<%=basePath%>/static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/echarts.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/echarts/map/china.js"></script>
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
			border-bottom： 1px solid #7e7b7d;
		}
		.index_bottom {
			position: relative;	
			background: url(<%=basePath %>/static/images/beij.png) no-repeat;
			background-size: 100%;	
		}
		.left_box {
			position: absolute;
    		width: 17%;
    		height: 56.7%;
    		left: 2%;
    		border: #383e54 solid 1px;
    		top: 10.6%;
    		background-color: #1b2334;
		}
		.left_page1 {
		    width: 100%;
    		height: 100%;
			position: absolute;
			color: white;	
			display: block;
			margin-top: 43px;		
		}
		.left_page2 {
			width: 17%;
    		height: 56.7%;
			position: absolute;
			width: 100%;
			height: 100%;
			color: white;
			display: none;
			margin-top: 43px;			
		}
		.right_page1 {
			position: obsolute;
			width: 100%;
			height: 100%;
			color: white;	
			display: block;	
			margin-top: 43px;
		}	
		.right_page2 {
			position: absolute;
			width: 100%;
			height: 100%;
			color: white;
			display: none;	
			margin-top: 43px;		
		}
		.bottomL_page1 {
			position: absolute;
			width: 100%;
			height: 100%;
			color: white;
			display: block;
			margin-top: 43px;
		}
		.bottomL_page2 {
			position: absolute;
			width: 100%;
			height: 100%;
			color: white;
			display: none;
			margin-top: 43px;
		}
		.bottomM_page1 {
			position: absolute;
			width: 100%;
			height: 100%;
			color: white;
			display: block;
			margin-top: 43px;
		}
		.bottomM_page2 {
			position: absolute;
			width: 100%;
			height: 100%;
			color: white;
			display: none;
			margin-top: 43px;
		}
		.bottomR_page1 {
			position: absolute;
			width: 100%;
			height: 100%;
			color: white;
			display: block;
			margin-top: 43px;
		}
		.bottomR_page2 {
			position: absolute;
			width: 100%;
			height: 100%;
			color: white;
			display: none;
			margin-top: 43px;
		}
		.right_box {
			position: absolute;
			width: 17%;
			height: 56.7%;
			right: 2%;
			border: #383e54 solid 1px;
			top: 10.6%;
			background-color: #1b2334;
		}
		.left_bottom1 {
			position: absolute;
			width: 30.6%;
			height: 22%;
			left: 2%;
			border: #383e54 solid 1px;
			bottom: 60px;
			background-color: #1b2334;			
		}
		.left_bottom2 {
			position: absolute;
			width: 30.6%;
			height: 22%;
			left: 34.6%;
			border: #383e54 solid 1px;
			bottom: 60px;
			background-color: #1b2334;
		}
		.left_bottom3 {
			position: absolute;
			width: 30.6%;
			height: 22%;
			left: 67.2%;
			border: #383e54 solid 1px;
			bottom: 60px;
			background-color: #1b2334;
		}
		.middle_box {
			position: absolute;
			height: 3.14%;
			left: 20.9%;
			top: 11%;
			color: white;
		}
		.middle_box1 {
			position: absolute;
			width: 13.6%;
    		height: 4.7%;
			left: 43%;
			top: 37px;
			color: white;
			border: #383e54 solid 0px;
			background: url(<%=basePath %>/static/images/ti_1.png) no-repeat;
		}
		.active {
		 	background: url(<%=basePath %>/static/images/faguang11.png) no-repeat;
		}
		.active1 {
		 	background: url(<%=basePath %>/static/images/faguang22.png) no-repeat;
		}
		.role {
			    display: inline-block;
		   	 	width: 49.9%;
		    	height: 8.7%;
		    	color: white;
		    	background-color: #091d31;
		    	float: left;
		    	text-align: center;
		    	line-height: 43.6px;
		    	cursor: pointer;
		    	font-size: 14px;
		    	font-family: SimSun;
		    	font-weight: bold;
		}
		.role_1 {
			display: inline-block;
			width: 50%;
			height: 22%;
			color: white;
			background-color: #091d31;
			float: left;
			text-align: center;
			line-height: 38.6px;
			cursor: pointer;
			font-size: 14px;
   		 	font-family: SimSun;
    		font-weight: bold;
		}		
		.middle_map {
			position: absolute;
		    left: 44.3%;
		    top: 17.3%;
		    width: 13%;
			height: 16%;
			display: none;
		}
		.middle_map img {
			width: 100%;
			height: 100%;			
		}
		.dis_none {
			width: 55.5%;
			height: 56%;
			margin-left: 22.3%;
			margin-top: 4.9%;		
		}
		.dis_block {
			width: 55.1%;
    		height: 53.4%;
    		top: 14%;
    		left: 22.5%;
			position: absolute;
			display: block;
		}
		.dis_block1 {
			width: 55.1%;
    		height: 53.4%;
    		top: 14%;
    		left: 22.5%;
			position: absolute;
			display: block;
		}
		.top_echart {
			width: 100%;
    		height: 60%;
    		top: 26%;
			position: absolute;
			display: block;
		}
		.rank {
			width: 55%;
			height: 28.5%;
			background-color: #091d31;
			position: absolute;
			bottom: 32.6%;
			border: 1px solid #383e54;
			display: none;
		}
        .world {
        	display: inline-block;
        	height: 26px;
        	width: 73px;
        	transform: skew(20deg);
        	border-radius: 3px;
        	border: 1px solid #00aeff;
        	background-color: #024a73;
        	margin-right: 7px;
       	    cursor: pointer;
        }
        .world1 {
        	display: inline-block;
        	margin-left: 25px;
        	margin-top: 3px;
        	transform: skew(-20deg);
        }
         .country {
        	display: inline-block;
        	height: 26px;
        	transform: skew(20deg);
        	border-radius: 3px;
        	/* display:none; */
        	border: 1px solid #00aeff;
        	background-color: #00aeff;
        }
        .country1 {
        	display: inline-block;
        	margin-left: 25px;
        	margin-right: 25px;
        	margin-top: 3px;
        	transform: skew(-20deg);
        }
        .Province {
        	display: inline-block;
        	height: 26px;
        	width: 73px;
        	transform: skew(20deg);
        	border-radius: 3px;
        	/* display:none; */
        	border: 1.3px solid #00aeff;
        	background-color: #1683c1;
        	cursor: pointer;
        	margin-left: -7px;
        }
        .Province1 {
        	display: inline-block;
        	margin-left: 25px;
        	margin-top: 3px;
        	transform: skew(-20deg);
        	color: #28e0f7;
        }
        .trapezoid {
        	font-size: 14px;
   	 		font-family: SimSun;
    		font-weight: bold;
    		position: absolute;
    		left: 75px;
    		top: 10px;	
        }
		.city {
        	display: inline-block;
        	height: 26px;
        	width: 73px;
        	transform: skew(20deg);
        	border-radius: 3px;
        	border: 1.3px solid #00aeff;
        	background-color: #024a73;
        	cursor: pointer;
        	margin-left: -6px;
        	/* display: none; */
        }
        .city1 {
        	display: inline-block;
        	margin-left: 25px;
        	margin-top: 3px;
        	transform: skew(-20deg);       	
        }
        #change {
        	position: absolute;
        	left: 700px;
    		top: 100px;      	
        }
        .rank_top {
        	width: 214px;
        	height: 33px;
        	background: url(<%=basePath %>/static/images/faguang3.png) no-repeat;
        	position: absolute;
        	margin-left: 390px;
        }
        .rank_top1 {
        	position: absolute;
        	left: 66px;
    		top: 6px;
    		color: #FFF;

        }
        .nodata_image{
	    top: 46%;
	    left: 50%;
	    position: absolute;
	    margin-top: -290px;
	    margin-left: -190px;
	    height: 231px;
	}
	.bottom_echart {
    width: 100%;
    margin: 0 auto;
    height: 55%;
    border: 1px solid rgba(82, 89, 113, 1);
    background: #20263A;
    position: absolute;
    bottom: -0.2%;
    z-index: 999999;
}   
   
   .country_sort {
    width: 26%;
    height: 38px;
    background: url(../../static/images/zhengjian.png) no-repeat center center;
    background-size: 100% 100%;
    margin: 0 auto;
    text-align: center;
    line-height: 38px;
    color: #fff;
}
.close_echart {
    width: 20px;
    height: 20px;
    color: #fff;
    font-size: 18px;
    float: right;
    margin: -30px 20px 0 0;
    background: url(img/down.png) no-repeat;
    background-size: 20px 20px;
    cursor: pointer;
}
	</style>
</head>
<body>
	<div class="index_top clearfix">
		<h3 class="fl title">事件库分析 > 事件角色展示</h3>
		<input type="hidden" id="moduleCode" value="${moduleCode}">
	</div>
	<div class="index_bottom">
		<!-- <div id="change">
			<button>切换</button>
		</div>  -->
		
		<!-- 填充 -->
		<!-- 左侧 -->
		<div class="left_box">
			<span class="active role left_role">角色1国家展示</span>
			<span class="role right_role">角色2国家展示</span>
			<div class="left_page1" id="countryActorOne"></div>
			<div class="left_page2" id="countryActortwo"></div>
		</div>
		<!-- 中部 -->
		<div class="middle_box">
			<span class="world" onclick="toChinaMap(this)">
			<span class="world1">世界</span>
			</span>
			<span style="display:none" class="country" id="country">
			<span class="country1" id="country1" >国家</span>
			</span>
			<span style="display:none" class="Province" id="Province" onclick="toProvinceMap(this)">
			<span class="Province1"  >州省</span>
			</span>
			<span style="display:none" class="city" id="city" onclick="toCityMap(this)">
			<span class="city1" >城市</span>			
			</span>
		</div>
		<div class="middle_box1">
			<span class="trapezoid">			
			角色地理展示
			</span>
		</div>
		<!-- 中部隐藏部分 -->
		<div class="dis_block1" id="dis_block1" style="display: none">
		    <div class="top_echart">
		    
		    </div>
			<div class="bottom_echart">
					<div class="bot">
						<div class="country_sort">
							<span id="rank">城市排行</span><span class="seven"></span>
						</div>
						<div class="clearfloat" style="clear:both"></div>
						<div class="close_echart" title="点击按钮折叠"></div>
					</div>
					<div style="width: 100%;height:80%" id="lineBar"></div>
		   </div>
		</div>
		
		<!-- 中部显示部分 -->
		<div class="dis_block"  id="word_echart">
		
		</div>
		
		<!-- 右侧 -->
		<div class="right_box">
			<span class="active role left_role1">角色1类型展示</span>
			<span class="role right_role1">角色2类型展示</span>
			<div class="right_page1" id="typeActor1"></div>
			<div class="right_page2" id="typeActor2"></div>
		</div>
		<!-- 下部 -->
		<div class="left_bottom1">
			<span class="active1 role_1 left_role2">角色1组织展示</span>
			<span class="role_1 right_role2">角色2组织展示</span>
			<div class="bottomL_page1" id="organizationActor1"></div>
			<div class="bottomL_page2" id="organizationActor2"></div>
		</div>
		<div class="left_bottom2">
			<span class="active1 role_1 left_role3">角色1宗教展示</span>
			<span class="role_1 right_role3">角色2宗教展示</span>
			<div class="bottomM_page1" id="actor1Religion"></div>
			<div class="bottomM_page2" id="actor2Religion"></div>
		</div>
		<div class="left_bottom3">
			<span class="active1 role_1 left_role4">角色1种族展示</span>
			<span class="role_1 right_role4">角色2种族展示</span>
			<div class="bottomR_page1" id="actor1Race"></div>
			<div class="bottomR_page2" id="actor2Race"></div>
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
<%-- <script src="<%=basePath%>/static/Visualization/js/amcharts/amcharts.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/themes/light.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amchart_util.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/ammap.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/ammap_util.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/export/export.js" type="text/javascript"></script> --%>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/leaflet-src.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/leaflet.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/tile.stamen.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/geohash.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/underscore-min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/moment.min.js" ></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/leaflet-dvf.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/leaflet.dvf.experimental.js"></script>
<script src="<%=basePath%>/static/Visualization/datamap/d3.min.js"></script>
<%-- <script src="<%=basePath%>/static/Visualization/js/amcharts/serial.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/pie.js" type="text/javascript"></script> --%>
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/echarts.js"></script>
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

	var areaLevel="国家";
	var wname="world";
	var cname="";
	$(function(){
		//处理配置
		handleConfigs();
		//美化滚动条
		glorifyComboSelect();
	});
	    
		function render(configId){
			startLoad();
			$("#info-table").empty();
			$.ajax({
				url:'<%=basePath%>/search/event_actor_viz/'+configId,
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
		var countryData;
		var stateData;
		var cityData;
		//角色1国家展示
		var actor1_dic=[];
		//角色2国家展示
        var actor2_dic = [];
		//角色1类型展示
		var actor1_data = [];
		//角色2类型展示
        var actor2_data = [];
        //角色1种族展示
        var actor1Ethnic_dic = [];
        //角色2种族展示
        var actor2Ethnic_dic = [];
        //角色1组织展示
        var actor1KnownGroup_dic =[];
        //角色2组织展示
        var actor2KnownGroup_dic = [];
        //角色1宗教展示
        var actor1Religion_dic = [];
        //角色2宗教展示
        var actor2Religion_dic = [];
        
        //渲染结果数据的方法
		function renderData(data){
			/* $('.city').css('display','none')
			$('.Province').css('display','none')
			$('.country').css('display','none') */
			//国家数据(经纬度，角色值)
			 countryData=data.countryData;
			 var geoCoordMap= countryData.geoCoordMap;
			 var mapData= countryData.mapData;
			 var rawData=[];
			 for(var b in mapData){
	        	var ll =[];
	        	ll.push(b);
		        var ls=ll.concat(mapData[b]);
	        	rawData.push(ls)
	        }
			//州省数据(经纬度，角色值)
			 stateData=data.stateData;
			//城市数据(经纬度，角色值)
			 cityData=data.cityData;
			//角色1国家展示
			 actor1_dic = data.actor1_dic;
			//角色2国家展示
	         actor2_dic = data.actor2_dic;
			//角色1类型展示
			 actor1_data = data.actor1_dic_type;
			//角色2类型展示
	         actor2_data = data.actor2_dic_type;
	        //角色1种族展示
	         actor1Ethnic_dic = data.actor1Ethnic_dic;
	        //角色2种族展示
	         actor2Ethnic_dic = data.actor2Ethnic_dic;
	        //角色1组织展示
	         actor1KnownGroup_dic = data.actor1KnownGroup_dic;
	        //角色2组织展示
	         actor2KnownGroup_dic = data.actor2KnownGroup_dic;
	        //角色1宗教展示
	         actor1Religion_dic = data.actor1Religion_dic;
	        //角色2宗教展示
	         actor2Religion_dic = data.actor2Religion_dic;
			left_role.onclick();//角色1国家
			left_role1.onclick();//角色1类型
			left_role2.onclick();//角色1组织
			left_role3.onclick();//角色1宗教
			left_role4.onclick();//角色1种族
			//$('.dis_block1').hide();
			toChinaMap();
		}
		
		//角色1国家展示
		var left_role = document.querySelector('.left_role');
		var right_role = document.querySelector('.right_role');
		var left_page1 = document.querySelector('.left_page1');
		var left_page2 = document.querySelector('.left_page2');
		left_role.onclick = function(){
			left_page1.style.display = 'block';
			left_page2.style.display = 'none';
			left_role.classList.add('active');
			right_role.classList.remove('active');
			state1Show(actor1_dic);
		}
		//角色2国家展示
		right_role.onclick = function(){
			left_page1.style.display = 'none';
			left_page2.style.display = 'block';
			right_role.classList.add('active');
			left_role.classList.remove('active');
			state2Show(actor2_dic);
		}
		//角色1类型展示
		var left_role1 = document.querySelector('.left_role1');
		var right_role1 = document.querySelector('.right_role1');
		var right_page1 = document.querySelector('.right_page1');
		var right_page2 = document.querySelector('.right_page2');
		left_role1.onclick = function(){			
			right_page1.style.display = 'block';
			right_page2.style.display = 'none';
			left_role1.classList.add('active');
			right_role1.classList.remove('active');
			type1Show(actor1_data);
		}
		//角色2类型展示
		right_role1.onclick = function(){			
			right_page1.style.display = 'none';
			right_page2.style.display = 'block';
			right_role1.classList.add('active');
			left_role1.classList.remove('active');
			type2Show(actor2_data);
		}
		
	    //角色1组织展示
		var left_role2 = document.querySelector('.left_role2');
		var right_role2 = document.querySelector('.right_role2');
		var bottomL_page1 = document.querySelector('.bottomL_page1');
		var bottomL_page2 = document.querySelector('.bottomL_page2');
		left_role2.onclick = function(){			
			bottomL_page1.style.display = 'block';
			bottomL_page2.style.display = 'none';
			left_role2.classList.add('active1');
			right_role2.classList.remove('active1');
			var org=1;
			organization1Show(actor1KnownGroup_dic,org);
		}
		//角色2组织展示
		right_role2.onclick = function(){			
			bottomL_page1.style.display = 'none';
			bottomL_page2.style.display = 'block';
			right_role2.classList.add('active1');
			left_role2.classList.remove('active1');
			var org=2;
			organization1Show(actor2KnownGroup_dic,org);
		}
		//角色1宗教展示
		var left_role3 = document.querySelector('.left_role3');
		var right_role3 = document.querySelector('.right_role3');
		var bottomM_page1 = document.querySelector('.bottomM_page1');
		var bottomM_page2 = document.querySelector('.bottomM_page2');
		left_role3.onclick = function(){			
			bottomM_page1.style.display = 'block';
			bottomM_page2.style.display = 'none';
			left_role3.classList.add('active1');
			right_role3.classList.remove('active1');
			var org=1;
			religionShow(actor1Religion_dic,org);
		}
		//角色2宗教展示
		right_role3.onclick = function(){			
			bottomM_page1.style.display = 'none';
			bottomM_page2.style.display = 'block';
			right_role3.classList.add('active1');
			left_role3.classList.remove('active1');
			var org=2;
			religionShow(actor2Religion_dic,org);
		}
		//角色1种族展示
		var left_role4 = document.querySelector('.left_role4');
		var right_role4 = document.querySelector('.right_role4');
		var bottomR_page1 = document.querySelector('.bottomR_page1');
		var bottomR_page2 = document.querySelector('.bottomR_page2');
		left_role4.onclick = function(){			
			bottomR_page1.style.display = 'block';
			bottomR_page2.style.display = 'none';
			left_role4.classList.add('active1');
			right_role4.classList.remove('active1');
			var org=1;
			raceShow(actor1Ethnic_dic,org);
		}
		//角色2种族展示
		right_role4.onclick = function(){			
			bottomR_page1.style.display = 'none';
			bottomR_page2.style.display = 'block';
			right_role4.classList.add('active1');
			left_role4.classList.remove('active1');
			var org=2;
			raceShow(actor2Ethnic_dic,org);
		}
		
		
		//加载地图数据
		function showMap(wname,geoCoordMap,rawData,mapData,areaLevel){
			//console.log("geoCoordMap="+JSON.stringify(geoCoordMap));
			//console.log("mapData="+JSON.stringify(mapData))
		   var myChart = echarts.init(document.getElementById('word_echart'));
	   		// 市区坐标
	   		//在世界地图获取到的为中文名称中国，为了获取到json进行图表设定将wname设置为China，
   		   if(wname == "中国") {
    		   wname = "China";
    	   }
	       var jsons ='../../static/js/worldJson/'+wname+'.json';  
	       $.get(jsons, function (getJson) {
	    	   //将wname设置为china，调用china.js中的注册各省市解决南海显示问题
	    	   if(wname == "China") {
	    		   wname = "china";
	    	   }
		       echarts.registerMap(wname,getJson);
		       if(areaLevel==undefined){
		    	   areaLevel="国家";
		       }
		        if(wname=="world"){
			   		var countrySum=[];
		    	    var maxIndex=0;
		    	    for(var i=0;i<rawData.length;i++){
		    		    var d1 = {
		   			        name: rawData[i].key,
		   			        value: rawData[i].value
		   			       };
		    		    if(maxIndex<(rawData[i].value*1)){
							maxIndex = (rawData[i].value*1);
						}
		    		    countrySum.push(d1); 
		       		}
		    	    var data=mapData;
	    	   }else{
			       	//城市数据
		    	    var stateSum=[];
		    	    //最大值
		    	    var maxValue=0;
		    	    //Geo数据
		    	    if(geoCoordMap==undefined){
		    	    	geoCoordMap=[];
		    	    }
		    	    for(var i=0;i<geoCoordMap.length;i++){
			    		   var d2 = {name: geoCoordMap[i].key,value: geoCoordMap[i].value};
			    		   var GeoSum=[];
			    		   var chName=geoCoordMap[i].key;
			    		   GeoSum.push(chName);
			    		   //map添加城市对应的经纬度
			    		   geoCoordMap[chName] = GeoSum;
			    		   if(maxValue<(geoCoordMap[i].value*1)){
			    			   maxValue = (geoCoordMap[i].value*1);
							}
			    		   stateSum.push(d2);
		      		}
		    	   var data=mapData;
	    	} 
		        
		    
		    //获取地图柱状图的最大值，用于柱状图绝对定位
		    var maxAbsVal = 0;
		    for(var i in mapData){
		    	var tem_1 = data[i][0];
		    	var tem_2 = data[i][1];
		    	if(maxAbsVal<tem_1){
		    		maxAbsVal = tem_1;
		    	}
		    	if(maxAbsVal<tem_2){
		    		maxAbsVal = tem_2;
		    	}
		    }
	    	//定义全局变量
	    	//var data = {'中国':[10,20],"United Kingdom":[20,80],"United States":[10,50],"河北":[10,50]};
	    	var data=mapData;
		    option = {
		        animation: false,
		        // 地图背景颜色
		        /* backgroundColor: new echarts.graphic.RadialGradient(0.5, 0.5, 0.4, [{
		            offset: 0,
		            color: '#4b5769'
		        }, {
		            offset: 1,
		            color: '#404a59'
		        }]), */
		        tooltip: {
		        	trigger: 'item',
		            formatter: function(dataItem) {
		            	var name = dataItem.name;
			            return areaLevel+'：'+name+'<br/>'+'角色1：'+data[name][0]+'<br/>'+'角色2：'+data[name][1];
		          	},
		          	backgroundColor:'#092235'
		        },
		        /* visualMap: {
		        	type:"continuous",
			        min: 0,
			        max: maxIndex,
			        left: 'right',
			        bottom: '0%',
			        text: ['事件数  高', '低'],
			        show:true,
			        inverse:"true",
			        orient:"horizontal",
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
			    }, */
		        geo: {
		            map: wname,
		            roam: true,
		            zoom: 1.155, //地图初始大小
		            label: {
		                emphasis: {
		                    show: true,
		                }
		            },
		            //地区块儿颜色
		            itemStyle: {
		                normal: {
		                    areaColor: '#092235',
		                    borderColor: '#00bcd4'
		                },
		                emphasis: {
		                	areaColor: '#092235',
		                    borderColor: '#00bcd4',
		                    borderWidth :2
		                }
		            },
		            
		        },
		        series: []
		    };

	    function renderEachCity() {
	        var option = {
	            xAxis: [],
	            yAxis: [],
	            grid: [],
	            series: [],
	            tooltip:[]
	        };

	        echarts.util.each(rawData, function(dataItem, idx) {
	            var geoCoord = geoCoordMap[dataItem[0]];
	        	if(geoCoord==null||geoCoord==undefined){
	        		geoCoord=[0,0];
	        	}
	            var coord = myChart.convertToPixel('geo', geoCoord);
	            idx += '';
	            inflationData = [];
	            for (var k = 1; k < 3; k++) {
	                inflationData.push(dataItem[k]);
	            }
	            option.xAxis.push({
	            	show:false,
	                id: idx,
	                gridId: idx,
	                type: 'category',
	                name: dataItem[0],
	                nameLocation: 'middle',
	                nameGap: 3,
	                splitLine: {
	                    show: false
	                },
	                axisTick: {
	                    show: false
	                },
	                axisLabel: {
	                    show: false
	                },
	                axisLine: {
	                    onZero: false,
	                    lineStyle: {
	                        color: '#666'
	                    }
	                },
	                nameTextStyle:{
	                	color:'red'
	                },
	                data: [dataItem[0],dataItem[0]],
	                z: 100
	            });
	            option.yAxis.push({
	                id: idx,
	                gridId: idx,
	                splitLine: {
	                    show: false
	                },
	                axisTick: {
	                    show: false
	                },
	                axisLabel: {
	                    show: false
	                },
	                axisLine: {
	                    show: false,
	                    lineStyle: {
	                        color: '#1C70B6'
	                    }
	                },
	                min:0,
	                max:maxAbsVal,
	                z: 100
	            });
	            option.grid.push({
	                id: idx,
	                width: 20,
	                height: 25,
	                left: coord[0] - 15,
	                top: coord[1] - 15,
	                z: 100
	            });
	            option.series.push({
	                id: idx,
	                type: 'bar',
	                xAxisId: idx,
	                yAxisId: idx,
	                barGap: 0,
	                barCategoryGap: 0,
	                data: inflationData,
	                z: 100,
	                itemStyle: {
	                    normal: {
	                        color: function(params){
	                            // 柱状图每根柱子颜色
	                            var colorList = ['yellow','#1da094'];
	                            return colorList[params.dataIndex];
	                        }
	                    }
	                }
	                
	            });
	        });
	        myChart.setOption(option);
	    }
	    setTimeout(renderEachCity, 0);
	    // 缩放和拖拽
		function throttle(fn, delay, debounce) {

	        var currCall;
	        var lastCall = 0;
	        var lastExec = 0;
	        var timer = null;
	        var diff;
	        var scope;
	        var args;

	        delay = delay || 0;

	        function exec() {
	            lastExec = (new Date()).getTime();
	            timer = null;
	            fn.apply(scope, args || []);
	        }

	        var cb = function() {
	            currCall = (new Date()).getTime();
	            scope = this;
	            args = arguments;
	            diff = currCall - (debounce ? lastCall : lastExec) - delay;

	            clearTimeout(timer);

	            if (debounce) {
	                timer = setTimeout(exec, delay);
	            } else {
	                if (diff >= 0) {
	                    exec();
	                } else {
	                    timer = setTimeout(exec, -diff);
	                }
	            }

	            lastCall = currCall;
	        };

	        return cb;
		}
	   		var throttledRenderEachCity = throttle(renderEachCity, 0);
		    myChart.on('geoRoam', throttledRenderEachCity);
		    myChart.setOption(option);
	   
	    });
	       if(wname=="world"){
			    // 点击显示中国地图对应的柱状图
			    myChart.on('click',function(params){
			    	areaLevel="州省";
			        countryName=params.name;
			        var countryNameStr=countryName;
			        cname =  countryName.split(' ').join('_');
			        if(cname=="Côte_d'Ivoire"||cname=="New_Caledonia"||cname=="W._Sahara"){
			        	$('.dis_block').hide();
			        	$('#dis_block1').show();
			        	$("#word_echart").empty();
			        	$("#country").show();
				        $("#country1").html(countryNameStr);
				        $("#Province").show();
				        $("#city").show();
				        $("#rank").html("州省排行");
			    		 var imgHTM='<img class="nodata_image" src="../../static/images/map_none.png">';
			    		$(".top_echart").append(imgHTM); 
				   		//柱状图
				   		 var MapStateData= stateData.mapData;
				   		 var MapBarData=MapStateData[countryName];
				   		 var Xdata=[]; 
				   		 var Ydata1=[];
				   		 var  Ydata2=[];
				   		 if(MapBarData==undefined||MapBarData==null){
				   			showBar(Xdata,Ydata1,Ydata2);
				   		 }else{
				   			for(var b in MapBarData){
					   			Xdata.push(b);
					   			var mapDatasum=MapBarData[b];
					   			var juese1=mapDatasum[0];
					   			var juese2=mapDatasum[1];
					   			Ydata1.push(juese1);
					   			Ydata1.push(juese2);
					   		 }
				   			showBar(Xdata,Ydata1,Ydata2);
				   		 }
				   		 
			    		
			    	}else{
			        $("#country").show();
			        $("#country1").html(countryNameStr);
			        $("#Province").show();
			        $("#city").show();
			        var geoCoordData= stateData.geoCoordMap;
			        var geoCoordMap=geoCoordData[countryName];
			        if(geoCoordMap==null||geoCoordMap==undefined){
			        	   geoCoordMap={} ;
			        }
			        var countryMapData= stateData.mapData;
			        var mapData=countryMapData[countryName];
			        var rawData=[];
			        if(mapData==null||mapData==undefined){
			        	 mapData= {};
			        }else{
			        	for(var b in mapData){
				        	var ll =[];
				        	ll.push(b);
				        var ls=ll.concat(mapData[b]);
				        	rawData.push(ls)
				        }	
			        }
			       /*  if(stateOfCountry!=null||stateOfCountry!=undefined){
			        	
						var mapData= stateOfCountry.mapData;
						var rawData=[];
						for(var b in mapData){
					        	var ll =[];
					        	ll.push(b);
					        var ls=ll.concat(mapData[b]);
					        	rawData.push(ls)
					        }	
			        }else{
			        	var geoCoordMap={} ;
						var rawData={};
						var mapData= {};
			        }
			         */
			        showMap(cname,geoCoordMap,rawData,mapData,areaLevel);
			    	}
			    });
	       }
		}
		
		//地图无数据显示的柱状图
		function showBar(Xdata,Ydata1,Ydata2){
			var showBar_chart = echarts.init(document.getElementById('lineBar'));
			option = {
				    backgroundColor: '#1b2334',
				    tooltip: {
				        trigger: 'axis',
				        axisPointer: {
				            type: 'shadow'
				        }
				    },
				    legend: {
				        data: ['角色1', '角色2'],
				        align: 'right',
				        right: 10,
				        textStyle: {
				            color: "#fff"
				        },
				        itemWidth: 10,
				        itemHeight: 10,
				        itemGap: 35
				    },
				    grid: {
				        left: '3%',
				        right: '4%',
				        bottom: '3%',
				        containLabel: true
				    },
				    xAxis: [{
				        type: 'category',
				        data:Xdata,
				        axisLine: {
				            show: true,
				            lineStyle: {
				                color: "#063374",
				                width: 1,
				                type: "solid"
				            }
				        },
				        axisTick: {
				            show: false,
				        },
				        axisLabel: {
				            show: true,
				            textStyle: {
				                color: "#00c7ff",
				            }
				        },
				    }],
				    yAxis: [{
				        type: 'value',
				        axisLabel: {
				            formatter: '{value}'
				        },
				        axisTick: {
				            show: false,
				        },
				        axisLine: {
				            show: false,
				            lineStyle: {
				                color: "#00c7ff",
				                width: 1,
				                type: "solid"
				            },
				        },
				        splitLine: {
				            lineStyle: {
				                color: "#063374",
				            }
				        }
				    }],
				    series: [ {
				        name: '角色1',
				        type: 'bar',
				        data: Ydata1,
				        barWidth: 10,
				        barGap: 1,
				        itemStyle: {
				            normal: {
				                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
				                    offset: 0,
				                    color: '#c4e300'
				                }, {
				                    offset: 1,
				                    color: '#728400'
				                }]),
				                opacity: 1,
				            }
				        }
				    }, {
				        name: '角色2',
				        type: 'bar',
				        data: Ydata2,
				        barWidth: 10,
				        barGap: 1,
				        itemStyle: {
				            normal: {
				                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
				                    offset: 0,
				                    color: '#00da9c'
				                }, {
				                    offset: 1,
				                    color: '#007a55'
				                }]),
				                opacity: 1,
				            }
				        }
				    }]
				};
			showBar_chart.setOption(option);
	         //调节echarts图表自适应
	         window.onresize=function (){
	        	 showBar_chart.resize();
	         }
		}
		
		
		
		
		
		
		 var countryName="";
		//角色国家展示数据
		//var state_role={"countryActor_one":[{"countryName":"china","countrySum":100},{"countryName":"china","countrySum":100},{"countryName":"china","countrySum":100},{"countryName":"china","countrySum":100},{"countryName":"china","countrySum":100},{"countryName":"china","countrySum":100},{"countryName":"china","countrySum":100},{"countryName":"china","countrySum":100},{"countryName":"china","countrySum":100},{"countryName":"china","countrySum":100}],"countryActor_two":[{"countryName":"china","countrySum":100},{"countryName":"china","countrySum":100},{"countryName":"china","countrySum":100},{"countryName":"china","countrySum":100},{"countryName":"china","countrySum":100},{"countryName":"china","countrySum":100},{"countryName":"china","countrySum":100},{"countryName":"china","countrySum":100}]}
		//无数据
		//var state_role={"countryActor_one":[],"countryActor_two":[]};
		//renderData(state_role);
		
		//var mapData = {'河北':[30,20],"北京":[10,20],"上海":[10,20],"天津":[10,20],"香港":[10,20],"广东":[10,20],"浙江":[10,20],"重庆":[10,20],"湖南":[10,20],"河南":[10,20],"黑龙江":[10,20]};
		/*
			角色一国家展示
			roleType 1或者是空为角色1 2为角色2
		*/
		function state1Show(state_role){
			
			var valdata=[];//国家数据
			var namedata=[];//国家名称
			for(var i=0;i<state_role.length;i++){
				var countryName=state_role[i].key;
				var countrySum=state_role[i].value;
				valdata.push(countrySum);
				namedata.push(countryName);
			}
			var countryActorOne_chart = echarts.init(document.getElementById('countryActorOne'));
			option = { 
				grid: {
		        left: '5%',
		        right: '5%',
		        bottom: '5%',
		        top: '2%',
		        containLabel: true,
		        z: 22
		        },
			    xAxis: {
			        show: false,
			    },
			     tooltip: {
			        show:true,
			        formatter:"{b}:{c}"
			    },
			   /*  dataZoom: [
			        { // 第一个 dataZoom 组件
			            yAxisIndex: [0, 1] ,// 表示这个 dataZoom 组件控制 第一个 和 第三个 yAxis
			            start:0,
			            end:30
			        },
			        { // 第二个 dataZoom 组件
			            yAxisIndex:[0, 1],      // 表示这个 dataZoom 组件控制 第四个 yAxis
			            start:0,
			            end:30
			        }
			    ], */
			    yAxis: [{
			        show: true,
			        data: namedata,
			        inverse: true,
			        axisLine: {
			            show: false,
			            lineStyle:{
			                 color: '#fff'
			            }
			           
			        },
			        splitLine: {
			            show: false
			        },
			        axisTick: {
			            show: false
			        },
			        axisLabel: {
			            color: '#fff',
			            rich: {
			                lg: {
			                    backgroundColor: '#339911',
			                    color: '#fff',
			                    padding: 5,
			                    align: 'center',
			                    width: 15,
			                    height: 15,
			                },
			            },
			            fontSize:16,
			            interval:0,
                        //rotate:0,
                        formatter: function(value) {
			                 var res = value;
			                 if(res.length >3) {
			                     res = res.substring(0, 2) + "..";
			                 }
			                 return res;
		                }
			        }


			    }, {
			        show: true,
			        inverse: true,
			        data: valdata,
			        axisLabel: {
			            textStyle: {
			                fontSize:12,
			                color: '#fff',
			            },
			        },
			        axisLine: {
			            show: false
			        },
			        splitLine: {
			            show: false
			        },
			        axisTick: {
			            show: false
			        },

			    }],
			    series: [{
			        name: '角色1国家展示',
			        type: 'bar',
			        yAxisIndex: 0,
			        data: valdata,
			        barWidth: 10,
			        barCategoryGap:80,
			        itemStyle: {
			            normal: {
			                color: {
			                    type: 'linear',
			                    x: 0,
			                    y: 0,
			                    x2: 0,
			                    y2: 1,
			                    colorStops: [{
			                        offset: 0,
			                        color: '#e8e81e' // 0% 处的颜色
			                    }, {
			                        offset: 1,
			                        color: '#e8e81e' // 100% 处的颜色
			                    }],
			                    globalCoord: false // 缺省为 false
			                },
			                barBorderRadius: 15,
			            }
			        },
			        label: {
			            normal: {
			                show: false,
			                position: 'inside',
			                formatter: '{c}'
			            }
			        },
			    }]
			};
		countryActorOne_chart.setOption(option);
         //调节echarts图表自适应
         /* window.onresize=function (){
        	 countryActorOne_chart.resize();
         } */
		}
		//角色2国家展示
		function state2Show(state_role){
			var valdata=[];//国家数据
			var namedata=[];//国家名称
			for(var i=0;i<state_role.length;i++){
				var countryName=state_role[i].key;
				var countrySum=state_role[i].value;
				valdata.push(countrySum);
				namedata.push(countryName);
			}
			var countryActorTwo_chart = echarts.init(document.getElementById('countryActortwo'));
				option = { 
					grid: {
			        left: '5%',
			        right: '5%',
			        bottom: '5%',
			        top: '2%',
			        containLabel: true,
			        z: 22
			         },
				    xAxis: {
				        show: false
				    },
				    tooltip: {
				        show:true,
				        formatter:"{b}:{c}"
				    },
				    yAxis: [{
				        show: true,
				        data: namedata,
				        inverse: true,
				        axisLine: {
				            show: false,
				            lineStyle:{
				                 color: '#fff'
				            }
				        },
				        splitLine: {
				            show: false
				        },
				        axisTick: {
				            show: false
				        },
				        axisLabel: {
				            color: '#fff',
				            rich: {
				                lg: {
				                    backgroundColor: '#339911',
				                    color: '#fff',
				                    padding: 5,
				                    align: 'center',
				                    width: 15,
				                    height: 15,
				                },
				            },
				            fontSize:16,
				            interval:0,
	                        //rotate:0,
	                        formatter: function(value) {
				                 var res = value;
				                 if(res.length >3) {
				                     res = res.substring(0, 2) + "..";
				                 }
				                 return res;
				                }
				        }


				    }, {
				        show: true,
				        inverse: true,
				        data: valdata,
				        axisLabel: {
				            textStyle: {
				                fontSize:12,
				                color: '#fff',
				            },
				        },
				        axisLine: {
				            show: false
				        },
				        splitLine: {
				            show: false
				        },
				        axisTick: {
				            show: false
				        },

				    }],
				    series: [{
				        name: '角色2国家展示',
				        type: 'bar',
				        yAxisIndex: 0,
				        data: valdata,
				        barWidth: 10,
				        barCategoryGap:80,
				        itemStyle: {
				            normal: {
				                color: {
				                    type: 'linear',
				                    x: 0,
				                    y: 0,
				                    x2: 0,
				                    y2: 1,
				                    colorStops: [{
				                        offset: 0,
				                        color: '#1da094' // 0% 处的颜色
				                    }, {
				                        offset: 1,
				                        color: '#1da094' // 100% 处的颜色
				                    }],
				                    globalCoord: false // 缺省为 false
				                },
				                barBorderRadius: 15,
				            }
				        },
				        label: {
				            normal: {
				                show: false,
				                position: 'inside',
				                formatter: '{c}'
				            }
				        },
				    }]
				};
			countryActorTwo_chart.setOption(option);
	         //调节echarts图表自适应
	         window.onresize=function (){
	        	 countryActorTwo_chart.resize();
	         }
		}
		//角色1类型展示
		function type1Show(state_role){
			var valdata=[];//国家数据
			var namedata=[];//国家名称
			for(var i=0;i<state_role.length;i++){
				var countryName=state_role[i].key;
				var countrySum=state_role[i].value;
				valdata.push(countrySum);
				namedata.push(countryName);
			}
			var typeActor1_chart = echarts.init(document.getElementById('typeActor1'));
			option = { 
					grid: {
			        left: '5%',
			        right: '5%',
			        bottom: '5%',
			        top: '2%',
			        containLabel: true,
			        z: 22
			        },
			        tooltip: {
				        show:true,
				        formatter:"{b}:{c}"
				    },
				    xAxis: {
				        show: false
				    },
				    yAxis: [{
				        show: true,
				        data: namedata,
				        inverse: true,
				        axisLine: {
				            show: false,
				            lineStyle:{
				                 color: '#fff'
				            }
				        },
				        splitLine: {
				            show: false
				        },
				        axisTick: {
				            show: false
				        },
				        axisLabel: {
				            color: '#fff',
				            rich: {
				                lg: {
				                    backgroundColor: '#339911',
				                    color: '#fff',
				                    padding: 5,
				                    align: 'center',
				                    width: 15,
				                    height: 15,
				                },
				            },
				            fontSize:16,
				            interval:0,
	                        //rotate:0,
	                        formatter:  function(value) {
				                 var res = value;
				                 if(res.length >3) {
				                     res = res.substring(0, 2) + "..";
				                 }
				                 return res;
				                } 
				        }


				    }, {
				        show: true,
				        inverse: true,
				        data: valdata,
				        axisLabel: {
				            textStyle: {
				                fontSize:12,
				                color: '#fff',
				            },
				        },
				        axisLine: {
				            show: false
				        },
				        splitLine: {
				            show: false
				        },
				        axisTick: {
				            show: false
				        },

				    }],
				    series: [{
				        name: '角色1类型展示',
				        type: 'bar',
				        data: valdata,
				        barWidth: '10px',
				        yAxisIndex: 0,
				        barCategoryGap:80,
				        itemStyle: {
				            normal: {
				                color: {
				                    type: 'linear',
				                    x: 0,
				                    y: 0,
				                    x2: 0,
				                    y2: 1,
				                    colorStops: [{
				                        offset: 0,
				                        color: '#e8e81e' // 0% 处的颜色
				                    }, {
				                        offset: 1,
				                        color: '#e8e81e' // 100% 处的颜色
				                    }],
				                    globalCoord: false // 缺省为 false
				                },
				                barBorderRadius: 15,
				            }
				        },
				        /* itemStyle: {
				        	 normal: {
				                 barBorderRadius: [0, 30, 30, 0],
				                 //每个柱子的颜色即为colorList数组里的每一项,如果柱子数目多于colorList的长度，则柱子颜色循环使用该数组
				                 color: new echarts.graphic.LinearGradient(
				                     0, 0, 0, 1,
				                     [{
				                             offset: 0,
				                             color: '#4b71b9'
				                         },
				                         {
				                             offset: 0.5,
				                             color: '#46b5f6'
				                         },
				                         {
				                             offset: 1,
				                             color: '#46b5f6'
				                         }
				                     ]
				                 )
				             }
				        }, */
				        label: {
				            normal: {
				                show: false,
				                position: 'inside',
				                formatter: '{c}'
				            }
				        },
				    }]
				};
			typeActor1_chart.setOption(option);
	         //调节echarts图表自适应
	         window.onresize=function (){
	        	 typeActor1_chart.resize();
	         }
		}
		//角色2类型展示
		function type2Show(state_role){
			var valdata=[];//国家数据
			var namedata=[];//国家名称
			for(var i=0;i<state_role.length;i++){
				var countryName=state_role[i].key;
				var countrySum=state_role[i].value;
				valdata.push(countrySum);
				namedata.push(countryName);
			}
			var typeActor2_chart = echarts.init(document.getElementById('typeActor2'));
			option = { 
					grid: {
			        left: '5%',
			        right: '5%',
			        bottom: '5%',
			        top: '2%',
			        containLabel: true,
			        z: 22
			        },
			        tooltip: {
				        show:true,
				        formatter:"{b}:{c}"
				    },
				    xAxis: {
				        show: false
				    },
				    yAxis: [{
				        show: true,
				        data: namedata,
				        inverse: true,
				        axisLine: {
				            show: false,
				            lineStyle:{
				                 color: '#fff'
				            }
				        },
				        splitLine: {
				            show: false
				        },
				        axisTick: {
				            show: false
				        },
				        axisLabel: {
				            color: '#fff',
				            rich: {
				                lg: {
				                    backgroundColor: '#339911',
				                    color: '#fff',
				                    padding: 5,
				                    align: 'center',
				                    width: 15,
				                    height: 15,
				                },
				            },
				            fontSize:16,
				            interval:0,
	                        //rotate:0,
	                        formatter: function(value) {
				                 var res = value;
				                 if(res.length >3) {
				                     res = res.substring(0, 2) + "..";
				                 }
				                 return res;
				                }
				        }


				    }, {
				        show: true,
				        inverse: true,
				        data: valdata,
				        axisLabel: {
				            textStyle: {
				                fontSize:12,
				                color: '#fff',
				            },
				        },
				        axisLine: {
				            show: false
				        },
				        splitLine: {
				            show: false
				        },
				        axisTick: {
				            show: false
				        },

				    }],
				    series: [{
				        name: '角色2类型展示',
				        type: 'bar',
				        data: valdata,
				        barWidth: '10px',
				        yAxisIndex: 0,
				        barCategoryGap:80,
				        /* itemStyle: {
				        	 normal: {
				                 barBorderRadius: [0, 30, 30, 0],
				                 //每个柱子的颜色即为colorList数组里的每一项,如果柱子数目多于colorList的长度，则柱子颜色循环使用该数组
				                 color: new echarts.graphic.LinearGradient(
				                     0, 0, 0, 1,
				                     [{
				                             offset: 0,
				                             color: '#4b71b9'
				                         },
				                         {
				                             offset: 0.5,
				                             color: '#46b5f6'
				                         },
				                         {
				                             offset: 1,
				                             color: '#46b5f6'
				                         }
				                     ]
				                 )
				             }
				        }, */
				        itemStyle: {
				            normal: {
				                color: {
				                    type: 'linear',
				                    x: 0,
				                    y: 0,
				                    x2: 0,
				                    y2: 1,
				                    colorStops: [{
				                        offset: 0,
				                        color: '#1da094' // 0% 处的颜色
				                    }, {
				                        offset: 1,
				                        color: '#1da094' // 100% 处的颜色
				                    }],
				                    globalCoord: false // 缺省为 false
				                },
				                barBorderRadius: 15,
				            }
				        },
				        label: {
				            normal: {
				                show: false,
				                position: 'inside',
				                formatter: '{c}'
				            }
				        },
				    }]
				};
			typeActor2_chart.setOption(option);
	         //调节echarts图表自适应
	         window.onresize=function (){
	        	 typeActor2_chart.resize();
	         }
		}
		//角色1组织展示
		function organization1Show(state_role,org){
			 var valdata=[];//国家数据
			var namedata=[];//国家名称
			for(var i=0;i<state_role.length;i++){
				var countryName=state_role[i].key;
				var countrySum=state_role[i].value;
				var d1={
						name:countryName,
						value:countrySum
				}
				valdata.push(d1);
				namedata.push(countryName);
			} 
			var itemColor;
			if(org==1){
				var organizationActor1_chart = echarts.init(document.getElementById('organizationActor1'));
				itemColor = [
                 'rgba(154, 206, 46, 0.8)', 'rgba(255, 173, 0.6)',
                 'rgba(154, 206, 46, 0.8)', 'rgba(255, 173, 0.6)',
                 'rgba(154, 206, 46, 0.8)', 'rgba(255, 173, 0.6)'
             	]
			}else if(org==2){
				var organizationActor1_chart = echarts.init(document.getElementById('organizationActor2'));
				itemColor = [
                  'rgba(13,177,205,0.8)', 'rgba(29,103,182,0.6)',
                  'rgba(13,177,205,0.8)', 'rgba(29,103,182,0.6)',
                  'rgba(13,177,205,0.8)', 'rgba(29,103,182,0.6)'
                ];
			}
			
			option = {
			    title: '',
			    grid: {
			        top: '5%',
			        left: '5%',
			        //bottom: '5%',
			        right:"5",
			        containLabel: true
			    },
			    tooltip: {
			        show:true,
			        formatter: '{b0}: {c0}'
			    },
			    xAxis: [{
			            type: 'category',
			            show: true,
			             axisLine: {
				            show: true,
				            lineStyle:{
				                 color: '#fff'
				            }
			            },
			             axisLabel: {
			            show: true,
			            color: '#fff'
			            },
			            data: namedata,
			            axisLabel: {
			                textStyle: {
			                    color: '#fff'
			                },
			                formatter: function(value) {
				                 var res = value;
				                 if(res.length >5) {
				                     res = res.substring(0, 3) + "..";
				                 }
				                 return res;
				                }
			            }
			        }],
			    yAxis: [{
			        show: true,
			        offset:12,
			        splitLine: {
			            show: false,
			            lineStyle: {
			                color: "rgba(255,255,255,0.2)"
			            }
			        },
			        axisTick: {
			            show: false
			        },
			        axisLine: {
			            show: true,
			            lineStyle:{
			                 color: '#fff'
			            }
			           
			        },
			        axisLabel: {
			            show: true,
			            color: '#fff'
			        }
			    }],
			    color: ['#e54035'],
			    series: [{
			            name: '',
			            type: 'pictorialBar',
			            barCategoryGap: '-80%',
			            // barCategoryGap: '-5%',
			            symbol: 'path://d="M150 50 L130 130 L170 130  Z"',
			            itemStyle: {
			                normal: {
			                    color: function(params) {//rgba(154, 206, 46, 0.8)
			                        let colorList = itemColor;
			                        /* let colorList = [
 			                            'rgba(13,177,205,0.8)', 'rgba(29,103,182,0.6)',
 			                            'rgba(13,177,205,0.8)', 'rgba(29,103,182,0.6)',
 			                            'rgba(13,177,205,0.8)', 'rgba(29,103,182,0.6)'
 			                        ]; */
			                        return colorList[params.dataIndex];
			                    }
			                },
			                emphasis: {
			                    opacity: 1
			                }
			            },
			            data:valdata
			        }
			    ]
			}
		organizationActor1_chart.setOption(option);
	        //调节echarts图表自适应
	        window.onresize=function (){
	       	 organizationActor1_chart.resize();
	        }
		}
		
		//角色宗教展示
		function religionShow(state_role,org){
      	    var valdata=[];//国家数据
			var namedata=[];//国家名称
			for(var i=0;i<state_role.length;i++){
				var countryName=state_role[i].key;
				var countrySum=state_role[i].value;
				valdata.push(countrySum);
				namedata.push(countryName);
			}  
			//var valdata = [2220, 1682, 2791, 3000, 4090, 3230, 2910,1000,1500,2909,3409, 1682, 2791, 3000, 4090, 3230, 2910,1000,1500,2909];
			//var namedata = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
			var lineColor;
			var textColor;
			if(org==1){
				lineColor = '#FEC201';
				textColor = '#28ffb3';
				var actor1Religion_chart = echarts.init(document.getElementById('actor1Religion'));
			}else if(org==2){
				lineColor = '#28ffb3';
				textColor = '#FEC201';
				var actor1Religion_chart = echarts.init(document.getElementById('actor2Religion'));
			}
			option = {
				    //backgroundColor: "#05224d",
				    tooltip: {},
				    grid: {
				    	top: '10%',
				        left: '3%',
				        //bottom: '5%',
				        right:"7",
				        containLabel: true
				    },
				    tooltip: {
			            show: true,
			            formatter:"{b}:{c}",
			        },
				    /* legend: {
				        itemGap: 50,
				        data: ['注册总量' ,'最新注册量'],
				        textStyle: {
				            color: '#f9f9f9',
				            borderColor: '#fff'
				        },
				    }, */
				    xAxis: [{
				        type: 'category',
				        boundaryGap: true,
				        axisLine: { //坐标轴轴线相关设置。数学上的x轴
				            show: true,
				            lineStyle: {
				                color: '#f9f9f9'
				            },
				        },
				        axisLabel: { //坐标轴刻度标签的相关设置
				            textStyle: {
				                color: '#d1e6eb',
				                margin: 15,
				            },
				        },
				        axisTick: {
				            show: false,
				        },
				        data: namedata,
				    }],
				    yAxis: [{
				        type: 'value',
				        min: 0,
				        // max: 140,
				        splitNumber: 7,
				        splitLine: {
				            show: false,
				            lineStyle: {
				                color: '#0a3256'
				            }
				        },
				        axisLine: {
				            show: true,
				            lineStyle: {
				                color: '#f9f9f9'
				            }
				        },
				        axisLabel: {
				            margin: 20,
				            textStyle: {
				                color: '#d1e6eb',
				                fontSize:12
				            }
				            
				        },
				        axisTick: {
				            show: false,
				        },
				    }],
				    series: [{
				        name: '注册总量',
				        type: 'line',
				        // smooth: true, //是否平滑曲线显示
				        // 			symbol:'circle',  // 默认是空心圆（中间是白色的），改成实心圆
				        showAllSymbol: true,
				        symbol: 'emptyCircle',
				        symbolSize: 6,
				        lineStyle: {
				            normal: {
				                color: lineColor, // 线条颜色、#28ffb3
				            },
				            borderColor: '#f0f'
				        },
				        label: {
				        	normal: {
				        		show: true,
					            position: 'top',
					            textStyle: {
					                color: textColor,//FEC201
	 				                fontSize: 12,
	 				                fontWeight: 'bold'
					             }

				            }
				            
				        },
				        itemStyle: {
				            normal: {
				                color: "#28ffb3",

				            }
				        },
				        
				        areaStyle: { //区域填充样式
				            normal: {
				                //线性渐变，前4个参数分别是x0,y0,x2,y2(范围0~1);相当于图形包围盒中的百分比。如果最后一个参数是‘true’，则该四个值是绝对像素位置。
				                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
				                        offset: 0,
				                        color: 'rgba(0,154,120,1)'
				                    },
				                    {
				                        offset: 1,
				                        color: 'rgba(0,0,0, 0)'
				                    }
				                ], false),
				                shadowColor: 'rgba(53,142,215, 0.9)', //阴影颜色
				                shadowBlur: 20 //shadowBlur设图形阴影的模糊大小。配合shadowColor,shadowOffsetX/Y, 设置图形的阴影效果。
				            }
				        },
				        data: valdata
				    }]
				};
			actor1Religion_chart.setOption(option);
	         //调节echarts图表自适应
	         window.onresize=function (){
	        	 actor1Religion_chart.resize();
	         }
		}
		//角色种族展示
		function raceShow(state_role,org){
			var valdata=[];//国家数据
			var namedata=[];//国家名称
			for(var i=0;i<state_role.length;i++){
				var countryName=state_role[i].key;
				var countrySum=state_role[i].value;
				valdata.push(countrySum);
				namedata.push(countryName);
			}  
			//var valdata = [2220, 1682, 2791, 3000, 4090, 3230, 2910];
			//var namedata = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
			var itemColor1;
			var itemColor2;
			if(org==1){
				itemColor1 = '#94ff00';
				itemColor2 = '#d3d431';
				var actor1Race = echarts.init(document.getElementById('actor1Race'));
			}else if(org==2){
				itemColor1 = '#00b0ff';
				itemColor2 = '#7052f4';
				var actor1Race = echarts.init(document.getElementById('actor2Race'));
			}
			option = {
				    //backgroundColor:"#080f15",
				    grid: {
				    	top: '5%',
				        left: '3%',
				        //bottom: '5%',
				        right:"7",
				        containLabel: true
				    },
				    xAxis: {
				        axisTick: {
				            show: false
				        },
				        splitLine: {
				            show: false
				        },
				        splitArea: {
				            show: false
				        },
				        data: namedata,
				        axisLabel: {
				             formatter: function(value) {
				            	 var res = value;
				                 if(res.length >5) {
				                     res = res.substring(0, 3) + "..";
				                 }
				                 return res;
				            }, 
				            interval: 1,
				            rotate:0,
				            fontSize: 12,
				            fontWeight: 100,
				            textStyle: {
				                color: '#f9f9f9',

				            }
				        },
				        axisLine: {
				            lineStyle: {
				                color: '#f9f9f9'
				            }
				        }
				    },
				    yAxis: {
				        axisTick: {
				            show: false
				        },
				        splitLine: {
				            show: false
				        },
				        splitArea: {
				            show: false
				        },
				        //min: 200,
				        axisLabel: {
				            textStyle: {
				                color: '#f9f9f9',
				                fontSize: 12,
				            }
				        },
				        axisLine: {
				            lineStyle: {
				                color: '#f9f9f9'
				            }
				        }
				    },
				    "tooltip": {
				      "trigger": "item",
				      "textStyle": {
				        "fontSize": 12
				      },
				      "formatter": "{b0}:{c0}"
				    },
				    series: {
				        type:"bar",
				        barWidth: 18,
				        itemStyle:{
				            normal:{
				                color:new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
				                    offset: 0,
				                    color: itemColor1
				                }, {
				                    offset: 0.8,
				                    color: itemColor2
				                }], false)
				            }
				        },
				        // barWidth: 7,
				        data: valdata
				    }
				};
			actor1Race.setOption(option);
	         //调节echarts图表自适应
	         window.onresize=function (){
	        	 actor1Race.resize();
	         }
		}
		
		//地图展示
		//var change = document.querySelector('#change');
		var none = document.querySelector('.dis_none');
		var block = document.querySelector('.dis_block');
		/* var flag = undefined;
		change.onclick = function(){
			flag = !flag
			if(flag) {
				block.style.display = 'none';
			}else {
				block.style.display = 'block';
			}
		} */
		var Province = document.querySelector('.Province');
		var city = document.querySelector('.city');
		var Province1 = document.querySelector('.Province1');
		var city1 = document.querySelector('.city1');
		var rank_top1 = document.querySelector('.rank_top1');
		/* Province1.onclick = function(){
			console.log('123')
			rank_top1.innerHTML = '州省排行top10';	
			Province.style.background = '#024a73'
			Province1.style.color = '#FFF'
			city.style.background = '#1683c1';
			city1.style.color = '#28e0f7';
		} */
		/* city.onclick = function(){
			console.log('123')
			rank_top1.innerHTML = '城市排行top10';
			city.style.background = '#024a73';
			city1.style.color = '#FFF';
			Province.style.background = '#1683c1'
			Province1.style.color = '#28e0f7'
		} */
		//返回世界地图
		var cname="";
		function toChinaMap(obj){
			$('.dis_block1').hide();
			$(".dis_block").show();
			city.style.background = '#024a73';
			city1.style.color = '#FFF';
			Province.style.background = '#1683c1'
			Province1.style.color = '#28e0f7'
			areaLevel="国家";
			//将下一级的地点标签隐藏
		 	$('.country').hide();
		 	$('.Province').hide();
		 	$('.city').hide();
		 	 //countryData=datas.countryData;
			 var geoCoordMap= countryData.geoCoordMap;
			 var mapData= countryData.mapData;
			 var rawData=[];
			 for(var b in mapData){
		        	var ll =[];
		        	ll.push(b);
		        var ls=ll.concat(mapData[b]);
		        	rawData.push(ls)
		        }
			 showMap(wname,geoCoordMap,rawData,mapData,areaLevel);
			//});
	}
	//点击州省地图
	function toProvinceMap(obj){
		var countryNameStr=countryName;
		if(cname=="Côte_d'Ivoire"||cname=="New_Caledonia"||cname=="W._Sahara"){
			city.style.background = '#024a73';
			city1.style.color = '#FFF';
			Province.style.background = '#1683c1'
			Province1.style.color = '#28e0f7'
			$('#dis_block1').show();
        	$("#word_echart").empty();
        	$("#country").show();
	        $("#country1").html(countryNameStr);
	        $("#Province").show();
	        $("#city").show();
	        $("#rank").html("州省排行");
	        rank_top1.innerHTML = '州省排行top10';	
    		 var imgHTM='<img class="nodata_image" src="../../static/images/map_none.png">';
    		$(".top_echart").append(imgHTM); 
	   		//柱状图
    		var MapStateData= stateData.mapData;
	   		 var MapBarData=MapStateData[countryName];
	   		 var Xdata=[]; 
	   		 var Ydata1=[];
	   		 var  Ydata2=[];
	   		 if(MapBarData==undefined||MapBarData==null){
	   			showBar(Xdata,Ydata1,Ydata2);
	   		 }else{
	   			for(var b in MapBarData){
		   			Xdata.push(b);
		   			var mapDatasum=MapBarData[b];
		   			var juese1=mapDatasum[0];
		   			var juese2=mapDatasum[1];
		   			Ydata1.push(juese1);
		   			Ydata1.push(juese2);
		   		 }
	   			showBar(Xdata,Ydata1,Ydata2);
	   		 }
    	}else{
		areaLevel="州省";
		city.style.background = '#024a73';
		city1.style.color = '#FFF';
		Province.style.background = '#1683c1'
		Province1.style.color = '#28e0f7'
		//将下一级的地点标签隐藏
		 var geoCoordData= stateData.geoCoordMap;
        var geoCoordMap={} ;
		var rawData={};
		var mapData= {};
        if(geoCoordData!=null||geoCoordData!=undefined){
        	 geoCoordMap=geoCoordData[countryName];
        }
        var countryMapData= stateData.mapData;
        if(countryMapData!=null||countryMapData!=undefined){
        	mapData=countryMapData[countryName];
        	var rawData=[];
			for(var b in mapData){
		        	var ll =[];
		        	ll.push(b);
		        var ls=ll.concat(mapData[b]);
		        	rawData.push(ls)
		        }	
        }
        showMap(cname,geoCoordMap,rawData,mapData,areaLevel);
		//});
	     }
    }
    //点击城市地图
	function toCityMap(obj){
		if(cname=="Côte_d'Ivoire"||cname=="New_Caledonia"||cname=="W._Sahara"){
			Province.style.background = '#024a73'
			Province1.style.color = '#FFF'
			city.style.background = '#1683c1';
			city1.style.color = '#28e0f7';
			var countryNameStr=countryName;
			$('#dis_block1').show();
        	$("#word_echart").empty();
        	$("#country").show();
	        $("#country1").html(countryNameStr);
	        $("#Province").show();
	        $("#city").show();
	        $("#rank").html("城市排行");
	        rank_top1.innerHTML = '城市排行top10';
    		 var imgHTM='<img class="nodata_image" src="../../static/images/map_none.png">';
    		$(".top_echart").append(imgHTM); 
	   		//柱状图
    		var MapcityData= cityData.mapData;
	   		 var MapBarData=MapcityData[countryName];
	   		 var Xdata=[]; 
	   		 var Ydata1=[];
	   		 var  Ydata2=[];
	   		 if(MapBarData==undefined||MapBarData==null){
	   			showBar(Xdata,Ydata1,Ydata2);
	   		 }else{
	   			for(var b in MapBarData){
		   			Xdata.push(b);
		   			var mapDatasum=MapBarData[b];
		   			var juese1=mapDatasum[0];
		   			var juese2=mapDatasum[1];
		   			Ydata1.push(juese1);
		   			Ydata1.push(juese2);
		   		 }
	   			showBar(Xdata,Ydata1,Ydata2);
	   		 }
    	}else{
		areaLevel="城市";
		//将下一级的地点标签隐藏
		Province.style.background = '#024a73'
		Province1.style.color = '#FFF'
		city.style.background = '#1683c1';
		city1.style.color = '#28e0f7';
		 var geoCoordData= cityData.geoCoordMap;
	        var geoCoordMap={} ;
			var rawData={};
			var mapData= {};
	        if(geoCoordData!=null||geoCoordData!=undefined){
	        	 geoCoordMap=geoCoordData[countryName];
	        }
	        var countryMapData= cityData.mapData;
	        if(countryMapData!=null||countryMapData!=undefined){
	        	mapData=countryMapData[countryName];
	        	var rawData=[];
				for(var b in mapData){
			        	var ll =[];
			        	ll.push(b);
			        var ls=ll.concat(mapData[b]);
			        	rawData.push(ls)
			        }	
	        }
	    showMap(cname,geoCoordMap,rawData,mapData,areaLevel);
    	}
    }
    </script>
</html>