<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<title>图谱-地域分析 </title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="shortcut icon" type="image/x-icon" href="<%=basePath%>/static/Visualization/base/ico.png"/>
<link rel="stylesheet" href="<%=basePath%>/static/css/style.css">
<!--人工查询 -->
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath %>/static//lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath %>/static/css/combo.select.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/perfect-scrollbar.css"/>   
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/base.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/css/event_result.css"/>
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window_zs.css"/><!-- 弹出提示框样式 -->
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
<style type="text/css">
	.index_bottom {
		background: url(<%=basePath %>/static/images/beij.png) no-repeat;
		background-size:  100%;	
	}
	.outBox {
		    height: 94%;
		    width: 98%;
		    position: relative;
		    margin: 9px 0 0 1%;
	}
	.inBox {
		height: 40%;
		width: 100%;
		position: absolute;
		border: 1px solid #54628a;
	    background-color: #1b233489;		
	}
	.inBox1 {
		height: 40%;
	    width: 100%;
	    position: absolute;
	    border: 1px solid #54628a;
	    top: 59%;
	    background-color: #1b233489;
	}
	
	.inBox_0 {
		height: 13%;
	    width: 15%;
	    position: absolute;
	    top: -1px;
	    left: 42%;
		
		background: url(<%=basePath %>/static/images/short_111.png) no-repeat;
	}
	.inBox_1 {
		    height: 78.5%;
		    width: 30%;
		    position: absolute;
		    top: 69px;
		    left: 1.3%;
		    border: 1px solid #54628a;
	        
	}
	.inBox_2 {
		    height: 78.7%;
		    width: 65%;
		    position: absolute;
		    top: 69px;
		    left: 32%;
	}
	.inBox_3 {
		    height: 10%;
		    width: 13%;
		    position: absolute;
		    top: 33px;
		    padding-left: 25px;
		    padding-top: 7px;
		    color: #fff;
		    left: 86%;
	}
	.inBox_C3 {
		height: 10%;
	    width: 13%;
	    position: absolute;
	    top: 30px;
	    left: 85%;
	    padding-left: 25px;
	    padding-top: 7px;
	    color: #fff;
	}
	.span_0 {
	    color: #FFF;
	    font-size: 16px;
	    font-family: SimSun;
	    font-weight: bold;
	    position: absolute;
	    top: 10px;
	    left: 32%;
	}
	.span_01 {
        color: #FFF;
	    font-size: 16px;
	    font-family: SimSun;
	    font-weight: bold;
	    position: absolute;
	    top: 10px;
	    left: 24%;
	}
	.chart1{
	    height: 34%;
	    margin-top: 45px;
	}
	.chart2{
   		   height: 86%;
    	   margin-top: 45px;
	}
	 
	.box1{
	    height: 17%;
	}
	
	.box1_inbox{
	    margin-top: 6px;
	    vertical-align: middle;
	    height: 122px;
	    width: 408px;
	    float: left;
	    margin-left: 7.5%;
        cursor: pointer;
	}
	.box1_inbox_act{
		 background: url(<%=basePath %>/static/images/box1_act.png) no-repeat;
	}
	.box1_inbox_notact{
		 background: url(<%=basePath %>/static/images/box1_notact.png) no-repeat;
	}
	.ctry_img{
	 	background: url(<%=basePath %>/static/images/gkg_ctry.png) no-repeat;
	}
	.state_img{
	 	background: url(<%=basePath %>/static/images/gkg_state.png) no-repeat;
	}
	.city_img{
	 	background: url(<%=basePath %>/static/images/gkg_city.png) no-repeat;
	}
	
	.box1_tab1{
	    width: 71px;
	    height: 60px;
	    margin-left: 16px;
	    margin-top: 23px;
        float: left;
	    
	}
	.box1_tab2{
	    width: 80px;
	    height: 60px;
	    margin-left: 4px;
	    margin-top: 23px;
        float: left;
	}
	.box1_tab3{
	    width: 71px;
	    height: 60px;
	    margin-left: 18px;
	    margin-top: 23px;
        float: left;
	}
	.box1_tab4{
	    width: 114px;
	    height: 60px;
	    margin-left: 18px;
	    margin-top: 23px;
        float: left;
	}
	.title_span{
        text-align: center;
	    font-size: 15px;
	    color: white;
	}
	.unit_span{
        font-size: 10px;
	    color: white;
	    display: block;
	    font-size: 10px;
	    color: white;
	    float: left;
	    float: right;
	    margin-top: -20px;
	}
	.all_color{
		color: #EBCB49;
	}
	.heat_color{
		color: #DB6860;
	}
	.relation_color{
		color: #2D79D7;
	}
	.data_span{
		font-weight: bold;
		text-align:center;
		padding-right:10px;
	    font-size: 23px;
	    white-space: nowrap;
	    display: inline-block;
	    width: 100%;
	    /* overflow: hidden; */
	    text-overflow: ellipsis;
	}
	/*时间线分析*/
	.right_top2 {
		width: 6%;
		height: 30px;
		border: 1px solid #1069be;
		position: absolute;
		right: 3%;
		top: 20px;
		background-color: #0c306d;
		padding: 5px 0 0 8px;
		cursor: pointer;
	}
	.span_5 {
		display: inline-block;
		width: 19px;
		height: 14px;
		margin-top: 3px;
		background: url(<%=basePath %>/static/images/IconAnalytics.png) no-repeat;	
	}
	.span_6 {
		color: #02e5e4;
		position: absolute;
		left: 32px;
    	top: 6px;
	}
	
	/*弹出框*/
	.popup {
		width: 86%;
	    height: 51%;
	    border: 1px solid #1c80b9;
	    position: absolute;
	    left: 16%;
	    top: 37%;
	    display: none;	
	    z-index: 10;
	    background: #1d2235;
	    border-radius: 10px;
	}
	.out_1 {
		width: 40%;
		height: 32px;
		position: absolute;
		left: 43%;
		background: url(<%=basePath %>/static/images/bg_title.png) no-repeat;
	}
	.span_8 {
		position: absolute;
		left: 9.8%;
		top: 5px;
		color: white;
		font-size: 14px;
		font-family: SimSun;
		font-weight: bold;
	}
	.out_2 {
		width: 35%;
	    height: 27px;
	    /* border: 1px solid pink; */
		position: absolute;
		left: 1.1%;
    	top: 15px;		
	}
	.out_3 {
	    width:100%;
	    height: 391px;
	    position: absolute;
	    top: 10%;
	}
	.out_4 {
		width: 1.6%;
		cursor: pointer;
	    height: 5%;
		position: absolute;
		right: 0.5%;
    	top: 2%;
    	background: url(<%=basePath %>/static/images/bg_guanbi.png) no-repeat;		
	}
	.out_5 {
	    width: 16%;
	    height: 27px;
	    position: absolute;
	    right: 3.1%;
	    top: 15px;
	}
	.zeZhao {
		width: 100%;
		height: 100%;
		background: black;
		opacity: 0.4;
		display: none;
		position: absolute;
		top: 0;
		left: 0;
		z-index: 10;
	}
	/*下拉框*/
	.pull_down {
        	position: absolute;
        	width: 33.0%;
        	height: 5%;
        	left: 1%;
        	top: 4.5%;
        	border: 1px solid #1f5175;
        	border-radiud: 3px;	
        }
     
     ::-webkit-scrollbar
			{
			  width: 2px;
			  height: 8px;
			  background-color: rgba(255, 255, 255, 0.2);
			}
		::-webkit-scrollbar-track
			
		{
		  -webkit-box-shadow: inset 0 0 8px rgb(1, 64, 118);
		  border-radius: 2px;
		  background-color: rgba(245, 245, 245, 0.2);
		}
				
		::-webkit-scrollbar-thumb
		{
		  border-radius: 10px;
		  -webkit-box-shadow: inset 0 0 8px #014076;
		  background-color: #555;
		}
         ul{
            list-style: none;           
        }                  
        .li_1 {
            background: #122D51;
            position: relative;
            width: 492px;
            height: 23px;
            cursor: pointer;
            color: #d0cbcb;
            padding-left: 10px;
            line-height: 1;
            padding-top: 6px
        }
        .li_1 a {
            position: absolute;
            top: 5px;
    		left: 11px;;
            color: #FFF;
            text-decoration: none;
            font-size: 10px;
        }
        .drop-down{
            width: 456px;
  			height: 23px;
            position: relative;
            /*position: relative;*/
        }
        .drop-down-content{
        	position: absolute;
        	top:23px;
        	height: 100px;
            padding: 0;
            width: 492px;          
            display: none;
            z-index: 10;
            
            /*position: absolute;*/
        }          
        .triangle_1 {
            background-color: #00aeff;
            position: absolute;
            left: 97%;
    		top: -19px;
            width: 14px;
            height: 14px;
            cursor: pointer;
        }
        .triangle_2 {
            border-left: 5px solid transparent;
            border-right: 5px solid transparent;
            border-top: 5px solid #cccccc;
            background-color: #00aeff;
            position: absolute;
            left: 1.5px;
            top: 5px;     
        }
        .title_T {
        	margin-left: 10px;
       	    color: #dad3d3;
		    height: 10px;
		    line-height: 20px;
        }
        .drop-down-content li:hover {
            background-color: #00aeff;
        }
        
       /*时间粒度*/
       .circle{
			width:15px;
			height:15px;
			border:1px solid rgba(0,193,222,1);
			border-radius:50%;
			display:inline-block;
		 	margin:0 2px -2px 2px;
		 	cursor: pointer;
		}
		.circleon{
			background:rgba(0,193,222,1); 
		}
		
</style>
</head>
<body>
    <!-- 事件描述 -->
    <div class="index_top clearfix">
		<h3 class="fl title" >图谱库分析 > 地域分析</h3>
		<input type="hidden" id="moduleCode" value="${moduleCode}">
	</div>
	<div class="index_bottom">
		<div class="zeZhao"></div>
		<!-- 显示图 -->
		<div class="data show">
			<div class="popup">
				<div class="out_1">
					<span class="span_8">时间线分析</span>
				</div>
					<div class="pull_down">
						<ul class="nav">  
						    <li class="drop-down">		
						       <span class="title_T"></span>			                
						          <li class="triangle_1">
						             <span class="triangle_2"></span>
						          </li>
								<ul style="height:200px;overflow:auto" class="drop-down-content">
									  <!-- <li class="li_1 li"><a href="#">你好吗</a></li>
									  <li class="li_1 li"><a href="#">你好吗</a></li>
									  <li class="li_1 li"><a href="#">你好吗</a></li>
									  <li class="li_1 li"><a href="#">你好吗</a></li>
									  <li class="li_1 li"><a href="#">你好吗</a></li>
									  <li class="li_1 li"><a href="#">你好吗</a></li>
									  <li class="li_1 li"><a href="#">你好吗</a></li>
									  <li class="li_1 li"><a href="#">你好吗</a></li>
									  <li class="li_1 li"><a href="#">你好吗</a></li>
									  <li class="li_1 li"><a href="#">你好吗</a></li>
									  <li class="li_1 li"><a href="#">你好吗</a></li>
									  <li class="li_1 li"><a href="#">你好吗</a></li>
									  <li class="li_1 li"><a href="#">你好吗</a></li>
									  <li class="li_1 li"><a href="#">你好吗</a></li> -->
								</ul>
						    </li>    
						</ul>
						
					</div>
				<!-- </div> -->
				<div class="out_3" id="timeLine"></div>
				<div class="out_4"></div>
				<div class="out_5">
					<div class="time">
						<span>时间粒度：</span>
						<span class="circle" value="3"></span><span>年</span><span class="circle" value="2"></span><span>月</span><span class="circle" value="4" id="weekCondtion"></span><span>周</span><span class="circle circleon" value="1" id="dayCondtion"></span><span>日</span>
					</div>
				</div>
			</div>
		
		
			<div class = "outBox">
				<!-- 国家、州省、城市 -->
	    		<div class="box1">
	    			<div class="box1_inbox box1_inbox_act" value="1" id="box1_inbox">
	    				<div class="box1_tab1 ctry_img"></div>
	    				<div class="box1_tab2">
	    					<div class="title_span">涉及国家</div>
	    					<div>
		    					<span class="data_span all_color" title="333" id="staticCountry"></span>
		    					<span class="unit_span">个</span>
	    					</div>
	    				</div>
	    				<div class="box1_tab3">
	    					<div class="title_span">热点国家</div>
	    					<div>
		    					<span class="data_span heat_color" title="33" id="hotCountry"></span>
		    					<span class="unit_span">个</span>
	    					</div>
	    				</div>
	    				<div class="box1_tab4">
	    					<div class="title_span">国家联系数</div>
	    					<div>
		    					<span class="data_span relation_color" title="33333222" id="concatCountry"></span>
		    					<span class="unit_span">对</span>
	    					</div>
	    				</div>
	    			</div>
	    			<div class="box1_inbox box1_inbox_notact" value="2">
	    				<div class="box1_tab1 state_img"></div>
	    				<div class="box1_tab2">
	    					<div class="title_span">涉及州省</div>
	    					<div>
		    					<span class="data_span all_color" title="" id="staticState"></span>
		    					<span class="unit_span">个</span>
	    					</div>
	    				</div>
	    				<div class="box1_tab3">
	    					<div class="title_span">热点州省</div>
	    					<div>
		    					<span class="data_span heat_color" title="" id="hotState"></span>
		    					<span class="unit_span">个</span>
	    					</div>
	    				</div>
	    				<div class="box1_tab4">
	    					<div class="title_span">州省联系数</div>
	    					<div>
		    					<span class="data_span relation_color" title="" id="concatState"></span>
		    					<span class="unit_span">对</span>
	    					</div>
	    				</div>
	    			</div>
	    			<div class="box1_inbox box1_inbox_notact" value="3">
	    				<div class="box1_tab1 city_img"></div>
	    				<div class="box1_tab2">
	    					<div class="title_span">涉及城市</div>
	    					<div>
		    					<span class="data_span all_color" title="" id="staticCity"></span>
		    					<span class="unit_span">个</span>
	    					</div>
	    				</div>
	    				<div class="box1_tab3">
	    					<div class="title_span">热点城市</div>
	    					<div>
		    					<span class="data_span heat_color" title="" id="hotCity"></span>
		    					<span class="unit_span">个</span>
	    					</div>
	    				</div>
	    				<div class="box1_tab4">
	    					<div class="title_span">城市联系数</div>
	    					<div>
		    					<span class="data_span relation_color" title="" id="concatCity"></span>
		    					<span class="unit_span">对</span>
	    					</div>
	    				</div>
	    			</div>
	    		</div>
	    		<!-- xx统计 -->
	    		<div class = "inBox">
	    			<div class = "inBox_0">
	    				<span class = "span_0" id="stat">xx统计</span>
	        		</div>
	        		<div class="right_top2">
		        		<span class="span_5"></span>
		        		<span class="span_6">时间线分析</span>
		        	</div>
	    			</div>
	    			<div class="chart1" id="chart1">
	    			
	    			</div>
	    		<!--  xx联系统计 -->
	    		<div class = "inBox1">
	    			<div class = "inBox_0">
	    				<span class = "span_01" id="contant">xx联系统计</span>
	    			</div>
	    			<div class="chart2" id="chart2">
	    			
	    			</div>
	    		</div>
	    		</div>
	    	</div>	
    	</div>
    <jsp:include page="graph_tab2.jsp"></jsp:include>
    <jsp:include page="../updateUserPassword.jsp"/>
   </div>
</body>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/echarts.js" ></script>
<!-- 人工查询功能的日期 -->
<script src="<%=basePath %>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-select.min.js"></script>
<script src="<%=basePath %>/static/js/jquery.combo.select.js"></script>
<script src="<%=basePath %>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath %>/static/js/perfect-scrollbar.js"></script>
<script src="<%=basePath%>/static/js/sec2.js"></script>
<script src="<%=basePath%>/static/lib/jquery.pagination.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/base.js"></script>
<script src="<%=basePath %>/static/js/config/config.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script><!-- 看到这 -->
<c:if test="${bgFlag == null or bgFlag == 1}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
</c:if>
<!-- 人工查询js -->
<script src="<%=basePath %>/static/Visualization/rgQuery.js"></script>
<!-- 计算显示图的高度 -->	
<script src="<%=basePath%>/static/js/chartHeight.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/downLoad.js"></script>
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<link rel="stylesheet" href="<%=basePath %>/static/css/hsCheckData.css"/>
<script type="text/javascript" src="<%=basePath%>/static/js/hsCheckData.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/customUtils.js"></script>
<script type="text/javascript">
    $(function(){
    	//处理配置
		handleConfigs();
		//控制Tone字段的显示问题
		gkgToneIsShow();
		//美化滚动条
		glorifyComboSelect();
    });
	var myChart_timeLine;
    function render(configId){
    	startLoad();
    	var resultcode = 'ALL';
    	$.ajax({
    		url:'<%=basePath%>/search/graph_country_timeline_viz/'+configId,
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
				window.onresize=function (){
					renderData(data);
					myChart_timeLine.resize();
		        }
   			}
    	});
    }
    var involvingCountry;//涉及国家
    var hotCountry;//热点国家
    var contactCountry;//国家联系数
	//国家统计
	var staticsCountry;
	//国家联系统计
	var contactCountry;
	//国家时间线分析
	var timeLineCountry;
	
	var involvingState;//涉及州省
	var hotState;//热点州省
	var contactState;//州省联系数
	//州省统计
	var staticsState;
	//州省联系统计
	var contactState;
	//州省时间线分析
	var timeLineState;
	
	var involvingCity;//涉及城市
	var hotCity;//热点城市
	var contactCity;//城市联系数
	//城市统计
	var staticsCity;
	//城市联系统计
	var contactCity;
	//城市时间线分析
	var timeLineCity;
	var avgCity=0;
	var avgCountry=0;
	var avgState=0;
	var contactCountryNum;
	var contactStateNum;
	var contactCityNum;
    function renderData(data){
    	avgCity=data.avgCity;//城市平均数
    	avgCountry=data.avgCountry;//国家平均数
    	avgState=data.avgState;//州省平均数
    	contactCountryNum=data.contactCountryNum;//国家联系总数
    	contactStateNum=data.contactStateNum;//州省联系总数
    	contactCityNum=data.contactCityNum;//城市联系总数
    	var tabCountry=data.tabCountry;
    	var tabState=data.tabState;
    	var tabCity=data.tabCity;
    	involvingCountry =tabCountry.involvingCountry;//涉及国家
    	hotCountry=tabCountry.hotCountry;;//热点国家
    	countryData=tabCountry.countryData;;//国家联系数
    	//国家统计
    	staticsCountry=data.staticsCountry;
    	//国家联系统计
    	contactCountry=data.contactCountry;
    	//国家时间线分析
    	timeLineCountry=data.timeLineCountry;
    	
    	involvingState=tabState.involvingState;//涉及州省
    	hotState=tabState.hotState;//热点州省
    	stateData=tabState.stateData;//州省联系数
    	//州省统计
    	staticsState=data.staticsState;
    	//州省联系统计
    	contactState=data.contactState;
    	//州省时间线分析
    	timeLineState=data.timeLineState;
    	
    	involvingCity=tabCity.involvingCity;//涉及城市
    	hotCity=tabCity.hotCity;//热点城市
    	cityData=tabCity.cityData;//城市联系数
    	//城市统计
    	staticsCity=data.staticsCity;
    	//城市联系统计
    	contactCity=data.contactCity;
    	//城市时间线分析
    	timeLineCity=data.timeLineCity;
         
    	//让国家点击被选中
    	$("#box1_inbox").click();
    	//涉及国家
    	$("#staticCountry").html(numAddUnit(involvingCountry));
    	$("#staticCountry").attr("title",numAddUnit(involvingCountry));
		$("#hotCountry").html(numAddUnit(hotCountry));
		$("#hotCountry").attr("title",numAddUnit(hotCountry));
		$("#concatCountry").html(numAddUnit(countryData));
		$("#concatCountry").attr("title",numAddUnit(countryData));
		//涉及州省
		$("#staticState").html(numAddUnit(involvingState));
		$("#hotState").html(numAddUnit(hotState));
		$("#concatState").html(numAddUnit(stateData));
		//修改title的值
		$("#staticState").attr("title",numAddUnit(involvingState));
		$("#hotState").attr("title",numAddUnit(hotState));
		$("#concatState").attr("title",numAddUnit(stateData));
		//涉及城市
		$("#staticCity").html(numAddUnit(involvingCity));
		$("#hotCity").html(numAddUnit(hotCity));
		$("#concatCity").html(numAddUnit(cityData));
		//修改城市title的值
		$("#staticCity").attr("title",numAddUnit(involvingCity));
		$("#hotCity").attr("title",numAddUnit(hotCity));
		$("#concatCity").attr("title",numAddUnit(cityData));
		//渲染时间线下拉框数据
    }
    
    //国家、州省、城市切换
    var clickValue;
    var keys;
    $(".box1_inbox").on('click',function(){
    	$(".box1_inbox").removeClass("box1_inbox_act");
    	$(".box1_inbox").addClass("box1_inbox_notact");
    	$(this).removeClass("box1_inbox_notact");
    	$(this).addClass("box1_inbox_act");
    	clickValue=$(this).attr('value');
    	if(clickValue==1){
    		showStatistics(staticsCountry,avgCountry);//国家统计图
    		showContactStatis(contactCountry,contactCountryNum)//国家联系统计图
    		//showTimeLine(timeLineCountry)//国家时间线
    		$("#stat").html("国家统计");
    		$("#contant").html("国家联系统计");
    		$(".drop-down-content").empty();
    		var num = staticsCountry.length > 10 ? 10:staticsCountry.length;
    		for(var i=0;i<num;i++){
    			$('.drop-down-content').append(' <li value="'+staticsCountry[i].name+'" class="li_1 li">国家：'+staticsCountry[i].name+'    数量：'+staticsCountry[i].value+'</li>');
    		}
    	}
    	if(clickValue==2){
    		showStatistics(staticsState,avgState);//州省统计图
    		showContactStatis(contactState,contactStateNum)//州省联系统计图
    		//showTimeLine(timeLineState)//州省时间线统计图
    		$("#stat").html("州省统计");
    		$("#contant").html("州省联系统计");
    		$(".drop-down-content").empty();
    		var num = staticsState.length > 10 ? 10:staticsState.length;
    		for(var i=0;i<num;i++){
    			$('.drop-down-content').append(' <li value="'+staticsState[i].name+'" class="li_1 li">州省：'+staticsState[i].name+'    数量：'+staticsState[i].value+'</li>');
    		}
    	}
    	if(clickValue==3){
    		showStatistics(staticsCity,avgCity);//城市统计图
    		showContactStatis(contactCity,contactCityNum)//城市联系统计图
    		//showTimeLine(timeLineCity)//城市时间线统计图
    		$("#stat").html("城市统计");
    		$("#contant").html("城市联系统计");
    		$(".drop-down-content").empty();
    		var num = staticsCity.length > 10 ? 10:staticsCity.length;
    		for(var i=0;i<num;i++){
    			$('.drop-down-content').append(' <li value="'+staticsCity[i].name+'" class="li_1 li">城市：'+staticsCity[i].name+'    数量：'+staticsCity[i].value+'</li>');
    		}
    	}
    	//下拉框点击时间
    	$(".li_1").on('click',function(){
    		$(".title_T").text($(this).text());
    		setTimeout(function() {
    			$('.drop-down-content').css("display","none");
             }, 10);
    		
    		//将时间粒度修重置为日粒度
    		$(".circleon").removeClass("circleon");
    		$("#dayCondtion").addClass("circleon");
    		//渲染组织时间线图
    		keys =  $(this).attr("value");
    		if(clickValue==1){
    			showTimeLine(timeLineCountry[keys])
        	}
    		if(clickValue==2){
    			showTimeLine(timeLineState[keys])
        	}
    		if(clickValue==3){
    			showTimeLine(timeLineCity[keys])
        	}
    		//initOrgTimeLineChart(organTimeLineData[key],1);
    		
       	});
    })
    
    //时间线分析-弹出框
    $('.right_top2').click(function(){
		$('.popup').css('display','block');
		$('.zeZhao').css('display','block')
		//点击时间线时，第一个li点击
		$(".li_1").first().click();		
	});
    //关闭弹出框
	$('.out_4').click(function(){
		$('.popup').css('display','none');
		$('.zeZhao').css('display','none');
	})
	
	//事件分析-下拉框
    let flag = false;  
    $('.pull_down').click(function(){    	  	    	
    	if(flag = !flag){
    		$('.drop-down-content').css("display","block");
    	}else {
    		$('.drop-down-content').css("display","none");
    	}
    })
    
    ////时间线数据力度切换方法
	function packDataType(len,date_data){
		 var date_new={};
         for(var i=0;i<date_data.length;i++){
         	//截取日期到月
         	var key=date_data[i].key;
         	var dateValue=key.substring(0,len);
         	if(len==2){
         		dateValue = getWeekNum(key+"");
         	}
         	if(date_new[dateValue]!=undefined){
         		var nnn = date_new[dateValue];
         		date_new[dateValue] = nnn + date_data[i].value;
         	}else{
            	date_new[dateValue] = date_data[i].value;
         	}
         }
         var quadclass_value=[];
         for(var obj in date_new){
     		var d1={
     			key:obj,
     			value:date_new[obj].toFixed(3)
   	      	}	
     		quadclass_value.push(d1);
		 }
         showTimeLine(quadclass_value);
	}
    
    
    //时间粒度切换
	$('.circle').on('click',function(){
		$(this).addClass('circleon').siblings('.circle').removeClass('circleon');
		selectVal=$(this).attr('value');
		var lineEventData;
		if(clickValue==1){
			 lineEventData = timeLineCountry[keys];
    	}
		if(clickValue==2){
			 lineEventData =timeLineState[keys];
    	}
		if(clickValue==3){
			 lineEventData =timeLineCity[keys];
    	}
		if(selectVal=="1"){
			showTimeLine(lineEventData);
		}
		if(selectVal=="2"){
			packDataType(6,lineEventData);
        }
		if(selectVal=="3"){
			packDataType(4,lineEventData);
        }
		if(selectVal=="4"){
			packDataType(2,lineEventData);
        }
	})
	
	//统计图
	function showStatistics(data,avgData){
    	var myChart= echarts.init(document.getElementById('chart1'));
    	var data1=[];
    	var data2=[];
    	for(var i=0;i<data.length;i++){
    		var name=data[i].name;
    		var value=data[i].value;
    		data1.push(name);
    		data2.push(value);
    	}

    	option = {
		    dataZoom: [
 		        {
	        	  start: 0,
 		          end: 20,
 		        },
 		        {
 		        	 start: 0,
 	 		          end: 20,
 		          type: 'slider',
 		          textStyle:{
	        	  color:"#fff"
	        	  }
 		            
 		        }
		  	],
		   tooltip:{
			   show:true
		   },	
	  	   grid:{
				left:80,
				right:80
			},
		    xAxis: {
		        data: data1,
		        axisLine: {
		            lineStyle: {
		                color: '#606985',
		                width:2
		            }
		        },
		        axisLabel: {
		        	textStyle: {
    	                color: 'white',
    	                fontSize: 14
    	            }
		        }
		    },
		    yAxis: {
		        nameTextStyle: {
		            color: '#fff',
		            fontSize: 16
		        },
		        axisLine: {
		            lineStyle: {
		                color: '#606985',
		                width:2
		            }
		        },
		        axisLabel: {
		        	textStyle: {
    	                color: 'white',
    	                fontSize: 14
    	            }
		        },
		        splitLine: {
		            show:false,
		            lineStyle: {
		                color: '#0177d4'
		            }
		        }
		    },
		    series: [{
		        type: 'bar',
		        barWidth: 18,
		        itemStyle:{
		            normal:{
		               		 color:new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
		                    offset: 0,
		                    color: '#7052f4'
		                }, {
		                    offset: 0.8,
		                    color: '#00b0ff'
		                }], false)
		            }
		        },
		        data: data2,
		        markLine:{
		            data : [
                   {
                    name: '平均数',
                    yAxis: avgData
  				 },
               ],
               itemStyle : { 
                   normal: { 
                       borderWidth:1, 
                       lineStyle: { 
                           type: 'dashed', 
                           color:'red', 
                           width:2 
                       },
					label:{ formatter:'平均数'}
					
                   } 
                  
               }, 
		       }
		    }]
		};
   		myChart.setOption(option);
    }
	//联系统计
    function showContactStatis(data,concantData){
    	var myChart= echarts.init(document.getElementById('chart2'));
    	var data1=[];
    	var data2=[];
    	var contantSum=2000;
    	for(var i=0;i<data.length;i++){
    		var name=data[i].name;
    		var value=data[i].value;
    		data1.push(name);
    		data2.push(value);
    	}

    	option = {
    	    tooltip: {
    	        trigger: 'axis',
    	        axisPointer: {
    	            type: 'line'
    	        },
    	        formatter: function (params) {
    	            return params[0].name + ': ' + params[0].value;
    	        }
    	    },
    	    grid: {
				top: '1%',
				left: '1%',
				right: '1%',
				bottom: '10%',
				containLabel: true,
			},
	        dataZoom: [
		        {
	        	   start: 0,
		           end: 20,
		        },
		        {
		        	start: 0,
			           end: 20,
		            type: 'slider',
	    		    textStyle:{
	        			color:"#fff"
	        				  }
			            
			    }
	  	    ],
    	    grid:{
				left:80,
				right:80
			},
    	    xAxis: {
    	        data: data1,
    	        axisTick: {show: false},
    	        axisLine: {
    	            lineStyle: {
    				                color: '#606985',
    				                width:2
    				            }
    	        },
    	        axisLabel: {
    	            textStyle: {
    	                color: 'white',
    	                fontSize: 14
    	            }
    	            },
    	        
    	    },
    	    yAxis: {
    	    	name:"联系总数:"+concantData+"次",
    	    	nameTextStyle:{
	            	color:"#F7993F",
	            	align :"top",
	            	fontSize  :"16"
	            },
	            nameGap :40,
	            //nameLocation:"left",
    	        splitLine: {show: false},
    	        axisTick: {show: false},
    	        axisLine: {
    	            show: true,
    	            lineStyle: {
    				                color: '#606985',
    				                width:2
    				            }
    	        },
    	        axisLabel: {
    	             textStyle: {
    	                color: 'white',
    	                fontSize: 14
    	            }
    	        }
    	    },
    	    color: ['#045D60'],
    	    series: [{
    	        name: 'hill',
    	        type: 'pictorialBar',
    	        barCategoryGap: '-130%',
    	        // symbol: 'path://M0,10 L10,10 L5,0 L0,10 z',
    	        symbol: 'path://M0,10 L10,10 C5.5,10 5.5,5 5,0 C4.5,5 4.5,10 0,10 z',
    	        itemStyle: {
    	            normal: {
    	                opacity: 0.5
    	            },
    	            emphasis: {
    	                opacity: 1
    	            }
    	        },
    	        data: data2,
    	        z: 10
    	    }
    	    ]
    	};
    	myChart.setOption(option);
    }
    
    function showTimeLine(data){
    	var data1=[];
    	var data2=[];
    	for(var i=0;i<data.length;i++){
    		var time=data[i].key;
    		var value=data[i].value;
    		data1.push(time);
    		data2.push(value);
    	}
    	myChart_timeLine = echarts.init(document.getElementById('timeLine'));
    	option = {
   			 backgroundColor: '#1b233482',
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
    	     tooltip: {
    	        trigger: 'axis',
    	        axisPointer: {
    	            lineStyle: {
    	                color: '#57617B'
    	            }
    	        },
    	        formatter: '{b} : {c}<br />',
    	      },
    			grid: {
    				top: '8%',
    				left: '1%',
    				right: '2%',
    				bottom: '10%',
    				containLabel: true,
    			},
    			 dataZoom: {
    	       		            type: 'slider',
    	          		        textStyle:{
    	        		        		color:"#fff"
    	        		        	},
    	       		        	showDataShadow :false
    	          		        },
    			xAxis: [{
    				type: 'category',
    				boundaryGap: false,
    				axisLine: { //坐标轴轴线相关设置。数学上的x轴
    					 show: true,
    					 lineStyle: {
    						 color: '#233e64'
    					 },
    				 },
    				 axisLabel: { //坐标轴刻度标签的相关设置
    					 textStyle: {
    						 color: '#fff',
    						 margin:15,
    					 },
    				 },
    				 axisTick: { show: false,},
    				data:data1 ,
    			}],
    			yAxis: [{
    				type: 'value',
    				splitNumber: 7,
    				splitLine: {
    					 show: true,
    					 lineStyle: {
    						 color: '#233e64'
    					 }
    				 },
    				 axisLine: { 
    				     show: true,
    					 lineStyle: {
    						 color: '#233e64'
    					 },
    				     
    				 },
    				 axisLabel: {
    				 	margin:20,
    					 textStyle: {
    						 color: '#fff',
    						 
    					 },
    				 },
    				 axisTick: { show: false,},  
    			}],
    			series: [{
    				name: '时间线',
    				type: 'line',
    				smooth: true, //是否平滑曲线显示
    	 			symbol:'circle',  // 默认是空心圆（中间是白色的），改成实心圆
    				symbolSize:2,
    				itemStyle: {
    	                normal: {
    	                     
    	                    color: new echarts.graphic.LinearGradient(0, 0, 1, 0, [{
    	                        offset: 0,
    	                        color: 'rgba(205,52,42,1)'
    	                    }, {
    	                        offset: 1,
    	                        color: 'rgba(235,235,21,1)'
    	                    }])
    	                },
    	                emphasis: {
    	                color: 'rgb(99,250,235)',
    	                borderColor: 'rgba(99,250,235,0.2)',
    	                extraCssText: 'box-shadow: 8px 8px 8px rgba(0, 0, 0, 1);',
    	                borderWidth: 10
    	            }
    	            },
    				lineStyle: {
    					normal: {
    						color: "#3deaff"   // 线条颜色
    					}
    				},
    				areaStyle: { //区域填充样式
    	                normal: {
    	                 //线性渐变，前4个参数分别是x0,y0,x2,y2(范围0~1);相当于图形包围盒中的百分比。如果最后一个参数是‘true’，则该四个值是绝对像素位置。
    	                   color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
    						   { offset: 0,  color: 'rgba(61,234,255, 0.9)'}, 
    						   { offset: 1,  color: 'rgba(61,234,255, 0)'}
    					   ], false),

    	                 shadowColor: 'rgba(53,142,215, 0.9)', //阴影颜色
    	                 shadowBlur: 20 //shadowBlur设图形阴影的模糊大小。配合shadowColor,shadowOffsetX/Y, 设置图形的阴影效果。
    	             }
    	         },
    				data: data2
    			}]
    	};
    	myChart_timeLine.setOption(option);
    }
    
    </script>
</html>