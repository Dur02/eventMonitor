<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>事件库分析-情感稳定分析</title>
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
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window_zs.css"/><!-- 弹出提示框样式 -->
<link rel="stylesheet" href="<%=basePath %>/static/css/event_heat.css"/><!--z专属样式  -->
<link rel="stylesheet" href="<%=basePath %>/static/css/event_heat_one.css"/><!--z专属样式  -->
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
<style>
	.index_bottom {
	background: url(<%=basePath %>/static/images/beij.png) no-repeat;
		background-size: 100%;			
	}
	.show {
		position: relative;	
	}
	.upBox {
		width: 96%;
		height: 46%;
		border: 1px solid #2a3042;
		position: absolute;
		left: 2%;
		top: 3%;
		background-color: rgba(29,36,56,0.5);
	}
	.upBox1 {
		width: 96%;
		height: 46%;
		border: 1px solid #2a3042;
		position: absolute;
		left: 2%;
		top: 3%;
		background-color: rgba(29,36,56,0.5);
		display: none;
	}
	.upBox2 {
		width: 96%;
		height: 46%;
		border: 1px solid #2a3042;
		position: absolute;
		left: 2%;
		top: 3%;
		background-color: rgba(29,36,56,0.5);
		display: none;
	}
	
	.downBox {
		width: 96%;
		height: 46%;
		border: 1px solid #2a3042;
		position: absolute;
		left: 2%;
		bottom: 3%;
		background-color: rgba(29,36,56,0.5);
	}
	.downBox1 {
		width: 96%;
		height: 46%;
		border: 1px solid #2a3042;
		position: absolute;
		left: 2%;
		bottom: 3%;
		background-color: rgba(29,36,56,0.5);
		display: none;
	}
	.downBox2 {
		width: 96%;
		height: 46%;
		border: 1px solid #2a3042;
		position: absolute;
		left: 2%;
		bottom: 3%;
		background-color: rgba(29,36,56,0.5);
		display: none;
	}
	.top {
		position: absolute;
		width: 20%;
		height: 32px;
		left: 40%;
		background: url(<%=basePath %>/static/images/bg_duan.png) no-repeat;
	}
	.span_0 {
		position: absolute;
		left: 24%;
		top: 5px;
		color: white;
		font-size: 14px;
		font-family: SimSun;
		font-weight: bold;		
	}
	.left_top {
		width: 17%;
	    height: 27px;
	    border: 1px solid #1069be;
	    position: absolute;
	    left: 1.2%;
	    top: 20px;
	    background-color: rgba(29,35,55,0.8);
	}
	.left1 {
		position: absolute;
	    left: 30.2%;
	    top: 10px;
	}
	.left2 {
		width: 96%;
		height: 80%;
		position: absolute;
	    left: 2%;
	    top: 19%;
	}
	.span_1 {
		color: white;
	}
	.span_2 {
		color: #00c1de;
		font-size: 25px;
		font-weight: 700;
	}
	.left_bottom {
		width: 23%;
	    height: 78%;
	    border: 1px solid #4c5367;
	    position: absolute;
	    left: 1.2%;
	    top: 68px;
	    background-color: rgba(29,35,55,0.8);
	}
	.right {
		width: 73%;
	    height: 78%;
	    border: 1px solid #4c5367;
	    position: absolute;
	    left: 25.5%;
	    top: 68px;
	    background-color: rgba(29,35,55,0.8);
        color: #fff;
	}
	.right1 {
		width: 16%;
	    height: 10%;
	    position: absolute;
	    right: 2%;
	    top: 10px;
	    z-index: 100;
	}
	.right2 {
		width: 96%;
	    height: 97%;
	    position: absolute;
	    left: 2%;
	    top: 2%;
	}
	.span_3 {
		color: white;
		background: #102941;
		border-right: 1px solid #1069be;
		display: inline-block;
		width: 33.4%;
		height: 100%;
		text-align: center;
		line-height: 25px;
		cursor: pointer;
	}
	.span_4 {
		color: white;
		background: #102941;
		border-right: 1px solid #1069be;
		display: inline-block;
		width: 33.3%;
		height: 100%;
		margin-left: -3px;
		text-align: center;
		line-height: 25px;
		cursor: pointer;
	}
	.span_5 {
		color: white;
		background: #102941;
		display: inline-block;
		width: 33.1%;
		height: 100%;
		margin-left: -4px;
		text-align: center;
		line-height: 25px;
		cursor: pointer;
	}
	
	.span_6 {
		color: white;
		background: #102941;
		border-right: 1px solid #1069be;
		display: inline-block;
		width: 33.4%;
		height: 100%;
		text-align: center;
		line-height: 25px;
		cursor: pointer;
	}
	.span_7 {
		color: white;
		background: #102941;
		border-right: 1px solid #1069be;
		display: inline-block;
		width: 33.3%;
		height: 100%;
		margin-left: -3px;
		text-align: center;
		line-height: 25px;
		cursor: pointer;
	}
	.span_8 {
		color: white;
		background: #102941;
		display: inline-block;
		width: 33.1%;
		height: 100%;
		margin-left: -4px;
		text-align: center;
		line-height: 25px;
		cursor: pointer;
	}
	.span {
		background: #0c3d71;
		color: #00fff6;
	}
	.circle {
	    width: 15px;
	    height: 15px;
	    border: 1px solid rgba(0,193,222,1);
	    border-radius: 50%;
	    display: inline-block;
        margin-bottom: -2px;
    	margin-left: 2px;
    	cursor:pointer;
	}
	.circleon {
	    background: rgba(0,193,222,1);
	}
	.circle1 {
	    width: 15px;
	    height: 15px;
	    border: 1px solid rgba(0,193,222,1);
	    border-radius: 50%;
	    display: inline-block;
        margin-bottom: -2px;
    	margin-left: 2px;
    	cursor:pointer;
	}
	.circleon1 {
	    background: rgba(0,193,222,1);
	}
	.circle2 {
	    width: 15px;
	    height: 15px;
	    border: 1px solid rgba(0,193,222,1);
	    border-radius: 50%;
	    display: inline-block;
        margin-bottom: -2px;
    	margin-left: 2px;
    	cursor:pointer;
	}
	.circleon2 {
	    background: rgba(0,193,222,1);
	}
	.circle3 {
	    width: 15px;
	    height: 15px;
	    border: 1px solid rgba(0,193,222,1);
	    border-radius: 50%;
	    display: inline-block;
        margin-bottom: -2px;
    	margin-left: 2px;
    	cursor:pointer;
	}
	.circleon3 {
	    background: rgba(0,193,222,1);
	}
	.circle4 {
	    width: 15px;
	    height: 15px;
	    border: 1px solid rgba(0,193,222,1);
	    border-radius: 50%;
	    display: inline-block;
        margin-bottom: -2px;
    	margin-left: 2px;
    	cursor:pointer;
	}
	.circleon4 {
	    background: rgba(0,193,222,1);
	}
	.circle5 {
	    width: 15px;
	    height: 15px;
	    border: 1px solid rgba(0,193,222,1);
	    border-radius: 50%;
	    display: inline-block;
        margin-bottom: -2px;
    	margin-left: 2px;
    	cursor:pointer;
	}
	.circleon5 {
	    background: rgba(0,193,222,1);
	}
</style>
</head>
<body>
	<div class="index_top clearfix">
		<h3 class="fl title">事件库分析 > 情感稳定分析</h3>
		<input type="hidden" id="moduleCode" value="${moduleCode}">
	</div>
	<div class="index_bottom" style="padding:0;padding-top:36px; height: 98.8% !important;">
		<!-- 显示图 -->
		<div class="data show" >
		
		<!-- 情感事件数  -->
			<div class="upBox">
				<div class="top">
					<span class="span_0">情感分析</span>
				</div>
				<div class="left_top">
					<span class="span_3 span">情感事件数</span>
					<span class="span_4">情感均值</span>
					<span class="span_5">情感指数</span>
				</div>
				<div class="left_bottom">
					<div class="left1">
						<span class="span_1">事件总数：</span>
						<span class="span_2" id="eventSum"></span>
					</div>
					<div class="left2" id="toneEvent"></div>
				</div>
				<div class="right">
					<div class="right1">
					    <span>时间粒度：</span>
						<span class="circle" value="3"></span><span>年</span><span class="circle" value="2"></span><span>月</span><span class="circle" value="4" id="week"></span><span>周</span><span class="circle circleon" value="1" id="day"></span><span>日</span>
					</div>
					<div class="right2" id="toneEventLine"></div>
				</div>
			</div>
			
			<!-- 情感均值  -->
			<div class="upBox1">
				<div class="top">
					<span class="span_0">情感分析</span>
				</div>
				<div class="left_top">
					<span class="span_3 span">情感事件数</span>
					<span class="span_4">情感均值</span>
					<span class="span_5">情感指数</span>
				</div>
				<div class="left_bottom">
					<div class="left1">
						<span class="span_1">情感均值：</span>
						<span class="span_2" id="toneAvg"></span>
					</div>
					<div class="left2" id="avgTone"></div>
				</div>
				<div class="right">
					<div class="right1">
						<span>时间粒度：</span>
						<span class="circle1" value="3"></span><span>年</span><span class="circle1" value="2"></span><span>月</span><span class="circle1" value="4" id="week2"></span><span>周</span><span class="circle1 circleon1" value="1" id="day2"></span><span>日</span>
					</div>
					<div class="right2" id="avgToneLine"></div>
				</div>
			</div>
			
			<!-- 情感指数  -->
			<div class="upBox2">
				<div class="top">
					<span class="span_0">情感分析</span>
				</div>
				<div class="left_top">
					<span class="span_3 span">情感事件数</span>
					<span class="span_4">情感均值</span>
					<span class="span_5">情感指数</span>
				</div>
				<div class="left_bottom">
					<div class="left1">
						<span class="span_1">情感总值：</span>
						<span class="span_2" id="toneSum"></span>
					</div>
					<div class="left2" id="sumTone"></div>
				</div>
				<div class="right">
					<div class="right1">
						<span>时间粒度：</span>
						<span class="circle2" value="3"></span><span>年</span><span class="circle2" value="2"></span><span>月</span><span class="circle2" value="4" id="week3"></span><span>周</span><span class="circle2 circleon2" value="1" id="day3"></span><span>日</span>
					</div>
					<div class="right2" id="sumToneLine"></div>
				</div>
			</div>
			
		<!-- 稳定事件数  -->
			<div class="downBox">
				<div class="top">
					<span class="span_0">稳定分析</span>
				</div>
				<div class="left_top">
					<span class="span_6 span">稳定事件数</span>
					<span class="span_7">稳定均值</span>
					<span class="span_8">稳定指数</span>
				</div>
				<div class="left_bottom">
					<div class="left1">
						<span class="span_1">总事件数：</span>
						<span class="span_2" id="stabilizeSum"></span>
					</div>
					<div class="left2" id="stabilizeSumLine"></div>
				</div>
				<div class="right">
					<div class="right1">
						<span>时间粒度：</span>
						<span class="circle3" value="3"></span><span>年</span><span class="circle3" value="2"></span><span>月</span><span class="circle3" value="4" id="week4"></span><span>周</span><span class="circle3 circleon3" value="1" id="day4"></span><span>日</span>
					</div>
					<div class="right2" id="stabilizeDataLine"></div>
				</div>
			</div>
		<!-- 稳定均值  -->
			<div class="downBox1">
				<div class="top">
					<span class="span_0">稳定分析</span>
				</div>
				<div class="left_top">
					<span class="span_6 span">稳定事件数</span>
					<span class="span_7">稳定均值</span>
					<span class="span_8">稳定指数</span>
				</div>
				<div class="left_bottom">
					<div class="left1">
						<span class="span_1">稳定均值：</span>
						<span class="span_2" id="stabilizeAvg"></span>
					</div>
					<div class="left2" id="stabilizeAvgData"></div>
				</div>
				<div class="right">
					<div class="right1">
					    <span>时间粒度：</span>
						<span class="circle4" value="3"></span><span>年</span><span class="circle4" value="2"></span><span>月</span><span class="circle4" value="4" id="week5"></span><span>周</span><span class="circle4 circleon4" value="1" id="day5"></span><span>日</span>
					</div>
					<div class="right2" id="avgStabilizeLine"></div>
				</div>
			</div>
		<!-- 稳定指数  -->
			<div class="downBox2">
				<div class="top">
					<span class="span_0">稳定分析</span>
				</div>
				<div class="left_top">
					<span class="span_6 span">稳定事件数</span>
					<span class="span_7">稳定均值</span>
					<span class="span_8">稳定指数</span>
				</div>
				<div class="left_bottom">
					<div class="left1">
						<span class="span_1">稳定总值：</span>
						<span class="span_2"id="totalValue"></span>
					</div>
					<div class="left2" id="stabilizeTotalData"></div>
				</div>
				<div class="right">
					<div class="right1">
						<span>时间粒度：</span>
						<span class="circle5" value="3"></span><span>年</span><span class="circle5" value="2"></span><span>月</span><span class="circle5" value="4" id="week6"></span><span>周</span><span class="circle5 circleon5" value="1" id="day6"></span><span>日</span>
					</div>
					<div class="right2" id="showStabilizeTotalLine"></div>
				</div>
			</div>
			
	   	</div>
		<!-- 页面底部收缩 -->
		<jsp:include page="event_tab1.jsp"></jsp:include>
		<!-- 页面底部收缩结束 -->
	</div>
	<jsp:include page="../updateUserPassword.jsp"/>

<script src="<%=basePath%>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath%>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath%>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath%>/static/js/perfect-scrollbar.js"></script>
<script src="<%=basePath%>/static/js/sec2.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/base.js"></script>
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
<script type="text/javascript" src="<%=basePath%>/static/js/echarts/map/world.js" ></script>
<script src="<%=basePath %>/static/Visualization/countryEn.js"></script>	
<script src="<%=basePath %>/static/win_alert/window.js"></script>
</body>
<script type="text/javascript">
	$(function(){
		$(".bizhong").show();
		
		//时间线数据力度切换方法(总共有两种方法，一种含有四个参数，一种含有三种参数)
		function packFourDataType(data,len,ty){
			var date_news = {};
			for(var i=0;i<data.length;i++){
				var date_str=data[i].key;
        		var date_clas=date_str+"";
        		var date_class=date_clas.substring(0,len);
        		if(len==2){
        			date_class = getWeekNum(date_clas);
        		}
        		var q1 = data[i].forword_value;
            	var q2 = data[i].negative_value;
            	var q3 = data[i].avg_value;
            	var q4 = data[i].sum_value;
        		if(date_news[date_class] != undefined){
        			var q11 = date_news[date_class].forword_value;
                	var q22 = date_news[date_class].negative_value;
                	var q33 = date_news[date_class].avg_value;
                	var q44 = date_news[date_class].sum_value;
                	date_news[date_class].forword_value = q1 + q11;
                	date_news[date_class].negative_value = q2 + q22;
                	date_news[date_class].avg_value = q3 + q33;
                	date_news[date_class].sum_value = q4 + q44;
        		}else{
        			var date_new = {};
        			date_new.forword_value = q1;
        			date_new.negative_value = q2;
        			date_new.avg_value = q3;
        			date_new.sum_value = q4;
        			date_news[date_class] = date_new;
        		}
            }
       		var date_value=[];
            var quadclass_value=[];
            for(var obj in date_news){
            	var date_new = date_news[obj];
            	date_value.push(obj);
            	var d1={
           			key:obj,
        			sum_value:date_new.sum_value.toFixed(3),
        			negative_value:date_new.negative_value.toFixed(3),
        	 	 	forword_value:date_new.forword_value.toFixed(3),
        	 		avg_value:date_new.avg_value.toFixed(3)
            	}
            	quadclass_value.push(d1);
            }
            if(ty=="tone"){//情感值
	            showToneEventLine(1,quadclass_value,date_value);
            }else{//稳定值
            	showstabilizeEventLine(1,quadclass_value,date_value);
            }
		}
		//时间线数据力度切换方法(总共有两种方法，一种含有四个参数，一种含有三种参数)
		function packThreeDataType(data,len,ty){
			var date_news = {};
			var date_num = {};
			for(var i=0;i<data.length;i++){
				var date_str=data[i].key;
        		var date_clas=date_str+"";
        		var date_class=date_clas.substring(0,len);
        		if(len==2){
        			date_class = getWeekNum(date_clas);
        		}
        		var q1 = data[i].forword_value;
            	var q2 = data[i].negative_value;
            	var q3 = data[i].avg_value;
        		if(date_news[date_class] != undefined){
        			date_num[date_class] = date_num[date_class]+1;
        			var q11 = date_news[date_class].forword_value;
                	var q22 = date_news[date_class].negative_value;
                	var q33 = date_news[date_class].avg_value;
                	date_news[date_class].forword_value = q1 + q11;
                	date_news[date_class].negative_value = q2 + q22;
                	date_news[date_class].avg_value = q3 + q33;
        		}else{
        			date_num[date_class] = 1;
        			var date_new = {};
        			date_new.forword_value = q1;
        			date_new.negative_value = q2;
        			date_new.avg_value = q3;
        			date_news[date_class] = date_new;
        		}
            }
    		var date_value=[];
            var quadclass_value=[];
            for(var obj in date_news){
            	var date_new = date_news[obj];
            	date_value.push(obj);
            	var n1 = date_new.negative_value;
            	var f1 = date_new.forword_value;
            	var a1 = date_new.avg_value;
            	if(ty=="toneAvg" || ty=="scaleAvg"){//计算均值的方式，  均值再均值
            		n1 = n1/date_num[obj];
            		f1 = f1/date_num[obj];
            		a1 = a1/date_num[obj];
            	}
            	var d1={
           			key:obj,
        			negative_value:n1.toFixed(3),
        	 	 	forword_value:f1.toFixed(3),
        	 		avg_value:a1.toFixed(3)
            	}
            	quadclass_value.push(d1);
            }
            if(ty=="toneAvg"){
	            showToneAvgLine(2,quadclass_value,date_value);
            }else if(ty=="toneSum"){
            	showToneAvgLine(3,quadclass_value,date_value);
            }else if(ty=="scaleAvg"){
            	showStabilizeAvgLine(2,quadclass_value,date_value);
            }else{
            	showStabilizeAvgLine(3,quadclass_value,date_value);
            }
		}
		
		//情感事件数年月日切换
		$('.circle').on('click',function(){
			$(this).addClass('circleon').siblings('.circle').removeClass('circleon');
			selectVal=$(this).attr('value');
			if(selectVal=="1"){
				showToneEventLine(1,lineEventData);
			}
			if(selectVal=="2"){
				packFourDataType(lineEventData,6,"tone");
            }
			if(selectVal=="3"){
				packFourDataType(lineEventData,4,"tone");
            }
			if(selectVal=="4"){
				packFourDataType(lineEventData,2,"tone");
            }
		})
		//情感均值年月日切换
		$('.circle1').on('click',function(){
			$(this).addClass('circleon1').siblings('.circle1').removeClass('circleon1');
			selectVal=$(this).attr('value');
			if(selectVal=="1"){
				showToneAvgLine(2,lineAvgToneData);
			}
			if(selectVal=="2"){
				packThreeDataType(lineAvgToneData,6,"toneAvg");
            }
			if(selectVal=="3"){
				packThreeDataType(lineAvgToneData,4,"toneAvg");
            }
			if(selectVal=="4"){
				packThreeDataType(lineAvgToneData,2,"toneAvg");
            }
		})
		//情感总值年月日切换
		$('.circle2').on('click',function(){
			$(this).addClass('circleon2').siblings('.circle2').removeClass('circleon2');
			selectVal=$(this).attr('value');
			if(selectVal=="1"){
				showToneAvgLine(3,lineSumToneData);
			}
			if(selectVal=="2"){
				packThreeDataType(lineSumToneData,6,"toneSum");
            }
			if(selectVal=="3"){
				packThreeDataType(lineSumToneData,4,"toneSum");
            }
			if(selectVal=="4"){
				packThreeDataType(lineSumToneData,2,"toneSum");
            }
		})
		//稳定事件数年月日切换
		$('.circle3').on('click',function(){
			$(this).addClass('circleon3').siblings('.circle3').removeClass('circleon3');
			selectVal=$(this).attr('value');
			if(selectVal=="1"){
				showstabilizeEventLine(1,lineStabilizeData);
			}
			if(selectVal=="2"){
				packFourDataType(lineStabilizeData,6,"scale");
            }
			if(selectVal=="3"){
				packFourDataType(lineStabilizeData,4,"scale");
            }
			if(selectVal=="4"){
				packFourDataType(lineStabilizeData,2,"scale");
            }
		})
		//稳定均值年月日切换
		$('.circle4').on('click',function(){
			$(this).addClass('circleon4').siblings('.circle4').removeClass('circleon4');
			selectVal=$(this).attr('value');
			if(selectVal=="1"){
				showStabilizeAvgLine(2,AvgStabilizeData);
			}
			if(selectVal=="2"){
				packThreeDataType(AvgStabilizeData,6,"scaleAvg");
            }
			if(selectVal=="3"){
				packThreeDataType(AvgStabilizeData,4,"scaleAvg");
            }
			if(selectVal=="4"){
				packThreeDataType(AvgStabilizeData,2,"scaleAvg");
            }
		})
		//情感总值年月日切换
		$('.circle5').on('click',function(){
			$(this).addClass('circleon5').siblings('.circle5').removeClass('circleon5');
			selectVal=$(this).attr('value');
			if(selectVal=="1"){
				showStabilizeAvgLine(3,sumStabilizeData);
			}
			if(selectVal=="2"){
				packThreeDataType(sumStabilizeData,6,"scaleSum");
            }
			if(selectVal=="3"){
				packThreeDataType(sumStabilizeData,4,"scaleSum");
            }
			if(selectVal=="4"){
				packThreeDataType(sumStabilizeData,2,"scaleSum");
            }
		})
		//render(configId)
		//$('.span_3').click();
		//$('.span_6').click();
		//处理配置
		handleConfigs();
		//控制Tone字段的显示问题
		//美化滚动条
		glorifyComboSelect();
		gkgToneIsShow();
		
		
	});
	
	function render(configId){
		startLoad();
		$.ajax({
			url:'<%=basePath%>/search/event_tone_scale_viz/'+configId,
			type: 'POST',
			dataType:"json",
			success:function(data){
				if(data=="-1"){
					endLoad();
					win.alertEx("加载失败");
				}
				renderData(data);
				endLoad();
				//调节echarts图表自适应
				window.onresize=function (){
					renderData(data);
	            }
			}
		});
	}
	//var data;
	//情感事件数
	var eventSum;
	var pieData;
	//var eventdate;
	var lineEventData;
	//情感均值
	var toneAvg;
	var barData;
	//var avgTonedate;
	var lineAvgToneData;
	//情感指数
	var toneSum;
	var sumData;
	//var sumTonedate;
	var lineSumToneData;
	//稳定事件数
	var stabilizeSum;
	var stabilizePieData;
	//var stabilizeEventdate;
	var lineStabilizeData;
	//稳定均值
	var	stabilizeAvg;
	var	stabilizeBarData;
	//var	avgStabilizedate;
	var	AvgStabilizeData;
	//稳定指数
	var	totalValue;
	var	stabilizeData;
	//var	sumstabilizedate;
	var	sumStabilizeData;
	function renderData(data){
			/* data={
				"toneEvent":{
					"eventSum":5,
					"pieData":[{"value":1, "name":'正向事件数'},{"value":1, "name":'负向事件数'},{"value":3, "name":'中性事件数'}],
					"lineData":[{"key":"20150802","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5},{"key":"20150803","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5},{"key":"20150804","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5},{"key":"20150805","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5},{"key":"20150806","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5},{"key":"20150807","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5}]
				},
				"avgTone":{
					"toneAvg":3.65,
					"barData":[1,1],//正向均值、负向均值
					"lineData":[{"key":"20150802","forword_value":30,"negative_value":11,"avg_value":33.5},{"key":"20150803","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5},{"key":"20150804","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5},{"key":"20150805","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5},{"key":"20150806","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5},{"key":"20150807","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5}]
				},
				"sumTone":{
					"toneSum":3.65,
					"barData":[60000, 130000],//正向总值、负向总值
					"lineData":[{"key":"20150802","forword_value":30,"negative_value":11,"avg_value":33.5},{"key":"20150803","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5},{"key":"20150804","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5},{"key":"20150805","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5},{"key":"20150806","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5},{"key":"20150807","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5}]				
				},
				"scaleEvent":{
					"scaleSum":10026,
					"pieData":[{"value":123, "name":'正向事件数'},{"value":321, "name":'负向事件数'},{"value":234, "name":'中性事件数'}],
					"lineData":[{"key":"20150802","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5},{"key":"20150803","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5},{"key":"20150804","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5},{"key":"20150805","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5},{"key":"20150806","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5},{"key":"20150807","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5}]
				},
				"avgScale":{
					"scaleAvg":3.65,
					"barData":[60000, 130000],//正向均值/负向均值
					"lineData":[{"key":"20150802","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5},{"key":"20150803","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5},{"key":"20150804","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5},{"key":"20150805","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5},{"key":"20150806","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5},{"key":"20150807","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5}]
				},
				"sumScale":{
					"scaleValue":3.65,
					"barData":[60000, 130000],//正向总值/负向总值
					"lineData":[{"key":"20150802","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5},{"key":"20150803","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5},{"key":"20150804","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5},{"key":"20150805","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5},{"key":"20150806","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5},{"key":"20150807","sum_value":20,"forword_value":30,"negative_value":11,"avg_value":33.5}]				
				}
			}; */
		//情感事件数
		var toneEvent=data.toneEvent;
		eventSum=toneEvent.eventSum;
		pieData=toneEvent.pieData;
		//eventdate=toneEvent.date;
		lineEventData=toneEvent.lineData;
		//情感均值
		var avgTone=data.avgTone;
		toneAvg=avgTone.toneAvg;
		barData=avgTone.barData;
		//avgTonedate=avgTone.date;
		lineAvgToneData=avgTone.lineData;
		//情感指数
		var sumTone=data.sumTone;
		toneSum=sumTone.toneSum;
		sumData=sumTone.barData;
		//sumTonedate=sumTone.date;
		lineSumToneData=sumTone.lineData;
		//稳定事件数
		var stabilizeEvent=data.scaleEvent;
		stabilizeSum=stabilizeEvent.scaleSum;
		stabilizePieData=stabilizeEvent.pieData;
		//stabilizeEventdate=stabilizeEvent.date;
		lineStabilizeData=stabilizeEvent.lineData;
		//稳定均值
		var avgStabilize=data.avgScale;
		stabilizeAvg=avgStabilize.scaleAvg;
		stabilizeBarData=avgStabilize.barData;
		//avgStabilizedate=avgStabilize.date;
		AvgStabilizeData=avgStabilize.lineData;
		//稳定指数
		var sumStabilize=data.sumScale;
		totalValue=sumStabilize.toneSum;
		stabilizeData=sumStabilize.barData;
		//sumstabilizedate=sumStabilize.date;
		sumStabilizeData=sumStabilize.lineData;
		$('.span_3').click();
		$('.span_6').click();
	}
	//情感事件数点击事件
	$('.span_3').click(function(){
		var flag=1;
		$('.span_3').addClass("span");	
		$('.span_4').removeClass("span");	
		$('.span_5').removeClass("span");
		$('.upBox').css("display","block");
		$('.upBox1').css("display","none");
		$('.upBox2').css("display","none");
		$("#eventSum").html(eventSum);
		$("#day1").addClass('circleon').siblings('.circle').removeClass('circleon');
		showToneEvent(pieData);
		showToneEventLine(flag,lineEventData);
		
	})
	//情感均值点击事件
	$('.span_4').click(function(){
		var flag=2;
		$('.span_4').addClass("span");	
		$('.span_3').removeClass("span");	
		$('.span_5').removeClass("span");
		$('.upBox1').css("display","block");
		$('.upBox').css("display","none");
		$('.upBox2').css("display","none");
		$("#toneAvg").html(toneAvg);
		$("#day2").addClass('circleon1').siblings('.circle1').removeClass('circleon1');
		showAvgTone(barData);
		showToneAvgLine(flag,lineAvgToneData);
	})
	//情感总值点击事件
	$('.span_5').click(function(){
		$('.span_5').addClass("span");	
		$('.span_4').removeClass("span");	
		$('.span_3').removeClass("span");	
		$('.upBox2').css("display","block");
		$('.upBox').css("display","none");
		$('.upBox1').css("display","none");
		$("#toneSum").html(toneSum);
		$("#day3").addClass('circleon2').siblings('.circle2').removeClass('circleon2');
		showSumTone(sumData);
		showToneAvgLine(3,lineSumToneData);
	})
	//稳定事件数点击事件
	$('.span_6').click(function(){
		$('.span_6').addClass("span");	
		$('.span_7').removeClass("span");	
		$('.span_8').removeClass("span");
		$('.downBox').css("display","block");
		$('.downBox1').css("display","none");
		$('.downBox2').css("display","none");
		$("#stabilizeSum").html(stabilizeSum);
		$("#day4").addClass('circleon3').siblings('.circle3').removeClass('circleon3');
		showStabilizeEvent(stabilizePieData);
		showstabilizeEventLine(1,lineStabilizeData);
	})
	//稳定均值点击事件
	$('.span_7').click(function(){
		$('.span_7').addClass("span");	
		$('.span_6').removeClass("span");	
		$('.span_8').removeClass("span");
		$('.downBox1').css("display","block");
		$('.downBox').css("display","none");
		$('.downBox2').css("display","none");
		$("#stabilizeAvg").html(stabilizeAvg);
		$("#day5").addClass('circleon4').siblings('.circle4').removeClass('circleon4');
		stabilizeAvgData(stabilizeBarData);
		showStabilizeAvgLine(2,AvgStabilizeData);
		
	})
	//稳定总值点击事件
	$('.span_8').click(function(){
		$('.span_8').addClass("span");	
		$('.span_7').removeClass("span");	
		$('.span_6').removeClass("span");	
		$('.downBox2').css("display","block");
		$('.downBox').css("display","none");
		$('.downBox1').css("display","none");
		$("#totalValue").html(totalValue);
		$("#day6").addClass('circleon5').siblings('.circle5').removeClass('circleon5');
		stabilizeTotalData(stabilizeData);
		showStabilizeAvgLine(3,sumStabilizeData);
	})
	//情感事件数饼图
	function showToneEvent(pieData){
		var myChart = echarts.init(document.getElementById('toneEvent'));
		var option = {
			    tooltip: {
			        trigger: 'item',
			        formatter: "{b}: {c}（{d}%）",
			    },
			    series: [
			         
			        {
			            name:'情感值',
			            type:'pie',
			            radius: ['0', '70%'],
			            center:['50%','58%'],
			            color: ['#4ED380','#E05651', '#43C4DC'],
			            label: {
			                normal: {
			                    formatter: function(params, ticket, callback) {
			                        var total = 0; //总数量
			                        var percent = 0; //占比
			                        pieData.forEach(function(value, index, array) {
			                            total += value.value;
			                        });
			                        percent = ((params.value / total) * 100).toFixed(1);
			                        return  params.name + ':\n' + params.value + '(' + percent + '%)';
			                    }
			                }
			            },
			            data:pieData
			        }
			    ]
			};
		if(eventSum!=0){
			myChart.setOption(option);
		}
	}
	
	//情感均值图表
	function showAvgTone(barData){
		var myChart = echarts.init(document.getElementById('avgTone'));
		var colorList = ["#4ED380", "#E55752"];
		var bgColor = '#102155';
		//var data = [60000, 130000];
		var legendData = ['正向情感均值', '负向情感均值'];
		var total = 0;
		for (var i = 0; i < barData.length; i++) {
		    total += Math.abs(barData[i]);
		}
		option = {
		    tooltip: {
		         formatter: function(params, ticket, callback) {
		            var tlData = 0;
		            switch (params.seriesName) {
		                case '正向情感均值':
		                    tlData = barData[0]
		                    // code
		                    break;
		                case '负向情感均值':
		                    tlData = barData[1]
		                    // code
		                    break;
		                    default:
		                    // code
		            }
		            return params.seriesName + ':' + tlData +'（'+(total == 0 ?0:(Math.abs(tlData)/(Math.abs(barData[0])+Math.abs(barData[1]))*100)).toFixed(2)+'%）';
		        } 
		    },
		    grid:{
		    	/* left:"0",
		    	right:"160" */
		    },
		    xAxis: {
		        data: [],
		        type: 'value',
		        max: 100,
		        show: false,
		        axisTick: {
		            show: false
		        }
		    },
		    yAxis: {
		        type: 'category',
		        show: false,

		        axisTick: {
		            show: false
		        }
		    },
		    color: colorList,
		    series: [{
		        type: 'bar',
		        name: '正向情感均值',
		        data: [Math.abs(barData[0]) * 100 / total],
		        stack: 'income',
		        barWidth: 60,
		        itemStyle: {
		            normal: {
		            	 label:{ 
	                            show: true, 
	                            position:'top',
	                            distance:30,
	                            formatter: '正向情感均值:'+barData[0]
	                        },
	                        labelLine :{show:true}
		            },
		            emphasis: {
		                shadowColor: 'rgba(0, 0, 0, 0.5)',
		                shadowBlur: 10,
		                opacity: 0.8
		            }
		        }
		    }, {
		        type: 'bar',
		        name: '负向情感均值',
		        data: [Math.abs(barData[1]) * 100 / total],
		        stack: 'income',
		        barWidth: 60,
		        itemStyle: {
		            normal: {
		            	 label:{ 
	                            show: true, 
	                            position:"bottom",
	                            distance:25,
	                            formatter: '负向情感均值:'+Math.abs(barData[1])
	                        },labelLine :{show:true}
		            },
		            emphasis: {
		                shadowColor: 'rgba(0, 0, 0, 0.5)',
		                shadowBlur: 10,
		                opacity: 0.8
		            }
		        }
		    }]
		};
		myChart.setOption(option);
	}
	//情感总值图表
	function showSumTone(sumData){
		var myChart = echarts.init(document.getElementById('sumTone'));
		var colorList = ["#4ED380", "#E55752"];
		var bgColor = '#102155';
		//var data = [60000, 130000];
		var legendData = ['正向情感总值', '负向情感总值'];
		var total = 0;
		for (var i = 0; i < sumData.length; i++) {
		    total += Math.abs(sumData[i]);
		}
		option = {
		    /* legend: {
		        textStyle: {
		            color: "#FFFFFF"
		        },
		        data: legendData
		    }, */
		    tooltip: {
		        formatter: function(params, ticket, callback) {
		            var tlData = 0;
		            switch (params.seriesName) {
		                case '正向情感总值':
		                    tlData = sumData[0]
		                    // code
		                    break;
		                case '负向情感总值':
		                    tlData = sumData[1]
		                    // code
		                    break;
		                    default:
		                    // code
		            }
		            return params.seriesName + ':' + tlData +'（'+(total == 0 ?0:(Math.abs(tlData)/(Math.abs(sumData[0])+Math.abs(sumData[1]))*100)).toFixed(2)+'%）';
		        }
		    },
		    grid:{
		    	/* left:"0",
		    	right:"160" */
		    },
		    xAxis: {
		        data: [],
		        type: 'value',
		        max: 100,
		        show: false,
		        axisTick: {
		            show: false
		        }
		    },
		    yAxis: {
		        type: 'category',
		        show: false,

		        axisTick: {
		            show: false
		        }
		    },
		    color: colorList,
		    series: [{
		        type: 'bar',
		        name: '正向情感总值',
		        data: [sumData[0] * 100 / total],
		        stack: 'income',
		        barWidth: 60,
		        itemStyle: {
		            normal: {
		            	 label:{ 
	                            show: true, 
	                            position:'top',
	                            distance:30,
	                            formatter: '正向情感总值:'+sumData[0]
	                        }
		            },
		            emphasis: {
		                shadowColor: 'rgba(0, 0, 0, 0.5)',
		                shadowBlur: 10,
		                opacity: 0.8
		            }
		        }
		    }, {
		        type: 'bar',
		        name: '负向情感总值',
		        data: [Math.abs(sumData[1]) * 100 / total],
		        stack: 'income',
		        barWidth: 60,
		        itemStyle: {
		            normal: {
		            	 label:{ 
	                            show: true, 
	                            position:'bottom',
	                            distance:25,
	                            formatter: '负向情感总值:'+Math.abs(sumData[1])
	                        }
		            },
		            emphasis: {
		                shadowColor: 'rgba(0, 0, 0, 0.5)',
		                shadowBlur: 10,
		                opacity: 0.8
		            }
		        }
		    }]
		};
		myChart.setOption(option);
	}
	//组装数据
	function getDataByCat(cat,data){
        var len = data.length;
        var ret=[];
        for(var i =0 ;i<len;i++)
        {
            ret[i] = data[i][cat];
        }
        return ret;
    }
	//折线图
	function showToneEventLine(flag,data_dic){
		var data_date=[];
		for(var i=0;i<data_dic.length;i++){
			var time = data_dic[i].key;
			data_date.push(time);
		}
		var myChart = echarts.init(document.getElementById('toneEventLine'));
		var	legendData=["事件总数","正向事件数","负向事件数","中性事件数"];
		var option = {
				backgroundColor: '#1b233482',
          		toolbox: {
      		        feature: {
      		            dataZoom: {
      		                yAxisIndex: 'none'
      		            },
      		            restore: {},
      		            saveAsImage: {},
    		            dataView: {}
      		        },
      		        top:20
      		    }, 
      		    color:["#DBDF07","#51D368","#e32f46","#1B64C4"],
      		    dataZoom: [
      		        {
      		            start: 0
      		        },
      		      {
      		            type: 'slider',
      		          textStyle:{
    		        		color:"#fff"
    		        	}
      		            
      		        }
      		    ],
      		    /* tooltip: {
  			        trigger: "axis",
  			        axisPointer: { // 坐标轴指示器，坐标轴触发有效
  			            type: 'line', // 默认为直线，可选为：'line' | 'shadow'
  			        },
  			        formatter: '{b}<br />{a0}: {c0}<br />{a1}: {c1}<br />{a2}: {c2}<br />{a3}:{c3}',
  			        backgroundColor: 'rgba(0,0,0,0.7)', // 背景
  			        padding: [8, 10], //内边距
  			        extraCssText: 'box-shadow: 0 0 3px rgba(255, 255, 255, 0.4);', //添加阴影
  			    }, */
  			   tooltip: {
			        trigger: "axis",
			        axisPointer: { // 坐标轴指示器，坐标轴触发有效
			            type: 'line', // 默认为直线，可选为：'line' | 'shadow'
			        },
			       /*  formatter: '{b}<br />{a0}: {c0}<br />{a1}: {c1}<br />{a2}: {c2}<br />{a3}:{c3}', */
			        backgroundColor: 'rgba(0,0,0,0.7)', // 背景
			        padding: [8, 10], //内边距
			        extraCssText: 'box-shadow: 0 0 3px rgba(255, 255, 255, 0.4);', //添加阴影
			    }, 
          	    legend: {
  			        textStyle: {
  			            color: '#fff',
  			            fontSize: '12'
  			        },
          	    	//selectedMode:false,
          	    	data:legendData
          	    },
          	    grid: {
	   		        left: '1%',
	   		        right: '1%',
	   		        bottom: '15%',
	   		        top: '15%',
	   		        containLabel: true,
	   		        z: 22
	   		    	},
          	    	xAxis: [
	          	        {
	          	        	type: "category",
	      			        axisLine: {
	      			            lineStyle: {
	      			                color: '#bac0c0'
	      			            }
	      			        },
	      			        splitLine: {
	      			            show: false
	      			        },
	      			        axisTick: {
	      			            show: false
	      			        },
	      			        splitArea: {
	      			            show: false
	      			        },
	      			        axisLabel: {
	      			            inside: false,
	      			            textStyle: {
	      			                color: '#f9f9f9',
	      			                fontWeight: 'normal',
	      			                fontSize: '12',
	      			            },
	      			        },
	          	            data: data_date
	          	        }
          	    	],
	          	    yAxis: [
	          	        {
	          	        	type: 'value',
	       			        axisTick: {
	       			            show: false
	       			        },
	       			        axisLine: {
	       			            show: true,
	       			            lineStyle: {
	       			                color: '#bac0c0',
	       			            }
	       			        },
	       			        splitLine: {
	       			            show: false,
	       			            lineStyle: {
	       			                color: '#32346c ',
	       			            }
	       			        },
	       			        axisLabel: {
	       			            textStyle: {
	       			                color: '#f9f9f9',
	       			                fontWeight: 'normal',
	       			                fontSize: '12',
	       			            },
	       			            formatter: '{value}',
	       			        },
	          	        }
	          	    ],
	          	    series:  [
	                            {
	                                name:legendData[0],
	                                type:'line',
	                                data:getDataByCat('sum_value',data_dic),
	                                smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
	                                symbolSize:10,
	                                symbol: 'circle',
	                                itemStyle: {
	            			            normal: {
	            			            	color:'#DBDF07',
	            			                lineStyle: {
	            			                    width: 1,
	            			                    color:'#7B851E',
	            			                    type: 'solid' //'dotted'虚线 'solid'实线
	            			                },
	            			                barBorderRadius: 0,
	            			                label: {
	            			                    show: false,
	            			                },
	            			                borderWidth: 2,
	            			                borderColor:'#DBDF07'
	            			            }
	            			        },
	                            },
	                            {
	                                name:legendData[1],
	                                type:'line',
	                                data:getDataByCat("forword_value",data_dic),
	                                smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
	                                symbolSize:10,
	                                symbol: 'circle',
	                                itemStyle: {
	            			            normal: {
	            			            	color:'#51D368',
	            			                lineStyle: {
	            			                	color:'#51D368',
	            			                    width: 1,
	            			                    type: 'solid' //'dotted'虚线 'solid'实线
	            			                },
	            			                barBorderRadius: 0,
	            			                label: {
	            			                    show: false,
	            			                },
	            			                borderWidth: 2,
	            			                borderColor:'#51D368'
	            			            }
	            			        },
	                            },
	                            {
	                                name:legendData[2],
	                                type:'line',
	                                data:getDataByCat("negative_value",data_dic),
	                                smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
	                                symbolSize: 10,
	                                symbol: 'circle',
	                                itemStyle: {
	            			            normal: {
	            			            	color:'#e32f46',
	            			                lineStyle: {
	            			                	color:'#e32f46',
	            			                    width: 1,
	            			                    type: 'solid' //'dotted'虚线 'solid'实线
	            			                },
	            			                barBorderRadius: 0,
	            			                label: {
	            			                    show: false,
	            			                },
	            			                borderWidth: 2,
	            			                borderColor:'#e32f46'
	            			            }
	            			        },
	                            },
	                            {
	                                name:legendData[3],
	                                type:'line',
	                                data:getDataByCat("avg_value",data_dic),
	                                smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
	                                symbolSize:10,
	                                symbol: 'circle',
	                                itemStyle: {
	            			            normal: {
	            			            	color:'#1B64C4',
	            			                lineStyle: {
	            			                	color:'#1B64C4',
	            			                    width: 1,
	            			                    type: 'solid' //'dotted'虚线 'solid'实线
	            			                },
	            			                barBorderRadius: 0,
	            			                label: {
	            			                    show: false,
	            			                },
	            			                borderWidth: 2,
	            			                borderColor:'#1B64C4'
	            			            }
	            			        },
	                            }
	                        ]
		          	};	
			  myChart.setOption(option);
	}
	//情感均值、总值折线图
	function showToneAvgLine(flag,data_dic){
		var data_date=[];
		for(var i=0;i<data_dic.length;i++){
			var time = data_dic[i].key;
			data_date.push(time);
		}
		var legendData=[];
		var myChart;
		if(flag==2){
			myChart = echarts.init(document.getElementById('avgToneLine'));
			legendData=["情感均值","正向情感均值","负向情感均值"];
		}
		if(flag==3){
			myChart = echarts.init(document.getElementById('sumToneLine'));
			legendData=["情感指数","正向情感指数","负向情感指数"];
		}
		var option = {
				backgroundColor: '#1b233482',
          		toolbox: {
      		        feature: {
      		            dataZoom: {
      		                yAxisIndex: 'none'
      		            },
      		            restore: {},
      		            saveAsImage: {},
    		            dataView: {}
      		        },
      		      top:20
      		    }, 
      		    dataZoom: [
      		        {
      		            start: 0
      		        },
      		      {
      		            type: 'slider',
      		          textStyle:{
    		        		color:"#fff"
    		        	}
      		            
      		        }
      		    ],
      		    tooltip: {
  			        trigger: "axis",
  			        axisPointer: { // 坐标轴指示器，坐标轴触发有效
  			            type: 'line', // 默认为直线，可选为：'line' | 'shadow'
  			        },
  			        /* formatter: '{b}<br />{a0}: {c0}<br />{a1}: {c1}<br />{a2}: {c2}<br />', */
  			        backgroundColor: 'rgba(0,0,0,0.7)', // 背景
  			        padding: [8, 10], //内边距
  			        extraCssText: 'box-shadow: 0 0 3px rgba(255, 255, 255, 0.4);', //添加阴影
  			    },
          	    legend: {
  			        textStyle: {
  			            color: '#fff',
  			            fontSize: '12'
  			        },
          	    	//selectedMode:false,
          	    	data:legendData
          	    },
          	    grid: {
	   		        left: '1%',
	   		        right: '1%',
	   		        bottom: '15%',
	   		        top: '15%',
	   		        containLabel: true,
	   		        z: 22
	   		    	},
          	    	xAxis: [
	          	        {
	          	        	type: "category",
	      			        axisLine: {
	      			            lineStyle: {
	      			                color: '#bac0c0'
	      			            }
	      			        },
	      			        splitLine: {
	      			            show: false
	      			        },
	      			        axisTick: {
	      			            show: false
	      			        },
	      			        splitArea: {
	      			            show: false
	      			        },
	      			        axisLabel: {
	      			            inside: false,
	      			            textStyle: {
	      			                color: '#f9f9f9',
	      			                fontWeight: 'normal',
	      			                fontSize: '12',
	      			            },
	      			        },
	          	            data: data_date
	          	        }
          	    	],
	          	    yAxis: [
	          	        {
	          	        	type: 'value',
	       			        axisTick: {
	       			            show: false
	       			        },
	       			        axisLine: {
	       			            show: true,
	       			            lineStyle: {
	       			                color: '#bac0c0',
	       			            }
	       			        },
	       			        splitLine: {
	       			            show: false,
	       			            lineStyle: {
	       			                color: '#32346c ',
	       			            }
	       			        },
	       			        axisLabel: {
	       			            textStyle: {
	       			                color: '#f9f9f9',
	       			                fontWeight: 'normal',
	       			                fontSize: '12',
	       			            },
	       			            formatter: '{value}',
	       			        },
	          	        }
	          	    ],
	          	    series:  [
	                            {
	                                name:legendData[0],
	                                type:'line',
	                                data:getDataByCat('avg_value',data_dic),
	                                smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
	                                symbolSize:10,
	                                symbol: 'circle',
	                                itemStyle: {
	            			            normal: {
	            			            	color:'#DBDF07',
	            			                lineStyle: {
	            			                    width: 1,
	            			                    color:'#7B851E',
	            			                    type: 'solid' //'dotted'虚线 'solid'实线
	            			                },
	            			                barBorderRadius: 0,
	            			                label: {
	            			                    show: false,
	            			                },
	            			                borderWidth: 2,
	            			                borderColor:'#DBDF07'
	            			            }
	            			        },
	                            },
	                            {
	                                name:legendData[1],
	                                type:'line',
	                                data:getDataByCat("forword_value",data_dic),
	                                smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
	                                symbolSize:10,
	                                symbol: 'circle',
	                                itemStyle: {
	            			            normal: {
	            			            	color:'#51D368',
	            			                lineStyle: {
	            			                	color:'#51D368',
	            			                    width: 1,
	            			                    type: 'solid' //'dotted'虚线 'solid'实线
	            			                },
	            			                barBorderRadius: 0,
	            			                label: {
	            			                    show: false,
	            			                },
	            			                borderWidth: 2,
	            			                borderColor:'#51D368'
	            			            }
	            			        },
	                            },
	                            {
	                                name:legendData[2],
	                                type:'line',
	                                data:getDataByCat("negative_value",data_dic),
	                                smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
	                                symbolSize: 10,
	                                symbol: 'circle',
	                                itemStyle: {
	            			            normal: {
	            			            	color:'#e32f46',
	            			                lineStyle: {
	            			                	color:'#e32f46',
	            			                    width: 1,
	            			                    type: 'solid' //'dotted'虚线 'solid'实线
	            			                },
	            			                barBorderRadius: 0,
	            			                label: {
	            			                    show: false,
	            			                },
	            			                borderWidth: 2,
	            			                borderColor:'#e32f46'
	            			            }
	            			        },
	                            }
	                        ]
		          	};	
			  myChart.setOption(option);
		}
	//稳定事件数
	function showStabilizeEvent(stabilizePieData){
		var myChart = echarts.init(document.getElementById('stabilizeSumLine'));
		var option = {
			    tooltip: {
			        trigger: 'item',
			        formatter: "{b}: {c}（{d}%）",

			    },
			    series: [
			         
			        {
			            name:'情感值',
			            type:'pie',
			            radius: ['0', '70%'],
			            center:['50%','58%'],
			            color: [ '#4ED380', '#E05651','#43C4DC'],
			            label: {
			                normal: {
			                	formatter: function(params, ticket, callback) {
			                        var total = 0; //总数量
			                        var percent = 0; //占比
			                        stabilizePieData.forEach(function(value, index, array) {
			                            total += value.value;
			                        });
			                        percent = ((params.value / total) * 100).toFixed(1);
			                        return  params.name + ':\n' + params.value + '(' + percent + '%)';
			                    }
			                },
			          
			            },
			            data:stabilizePieData
			        }
			    ]
			};
			if(stabilizeSum!=0){
				myChart.setOption(option);
			}
	}
	//稳定事件数折线图
	function showstabilizeEventLine(flag,data_dic){
		var data_date=[];
		for(var i=0;i<data_dic.length;i++){
			var time = data_dic[i].key;
			data_date.push(time);
		}
		var myChart = echarts.init(document.getElementById('stabilizeDataLine'));
		var	legendData=["事件总数","正向事件数","负向事件数","中性事件数"];
		var option = {
				backgroundColor: '#1b233482',
          		toolbox: {
      		        feature: {
      		            dataZoom: {
      		                yAxisIndex: 'none'
      		            },
      		            restore: {},
      		            saveAsImage: {},
    		            dataView: {}
      		        },
      		      top:20
      		    }, 
      		    dataZoom: [
      		        {
      		            start: 0
      		        },
      		      {
      		            type: 'slider',
      		          textStyle:{
    		        		color:"#fff"
    		        	}
      		            
      		        }
      		    ],
      		    tooltip: {
  			        trigger: "axis",
  			        axisPointer: { // 坐标轴指示器，坐标轴触发有效
  			            type: 'line', // 默认为直线，可选为：'line' | 'shadow'
  			        },
  			        /* formatter: '{b}<br />{a0}: {c0}<br />{a1}: {c1}<br />{a2}: {c2}<br />{a3}:{c3}', */
  			        backgroundColor: 'rgba(0,0,0,0.7)', // 背景
  			        padding: [8, 10], //内边距
  			        extraCssText: 'box-shadow: 0 0 3px rgba(255, 255, 255, 0.4);', //添加阴影
  			    },
          	    legend: {
  			        textStyle: {
  			            color: '#fff',
  			            fontSize: '12'
  			        },
          	    	//selectedMode:false,
          	    	data:legendData
          	    },
          	    grid: {
	   		        left: '1%',
	   		        right: '1%',
	   		        bottom: '15%',
	   		        top: '15%',
	   		        containLabel: true,
	   		        z: 22
	   		    	},
          	    	xAxis: [
	          	        {
	          	        	type: "category",
	      			        axisLine: {
	      			            lineStyle: {
	      			                color: '#bac0c0'
	      			            }
	      			        },
	      			        splitLine: {
	      			            show: false
	      			        },
	      			        axisTick: {
	      			            show: false
	      			        },
	      			        splitArea: {
	      			            show: false
	      			        },
	      			        axisLabel: {
	      			            inside: false,
	      			            textStyle: {
	      			                color: '#f9f9f9',
	      			                fontWeight: 'normal',
	      			                fontSize: '12',
	      			            },
	      			        },
	          	            data: data_date
	          	        }
          	    	],
	          	    yAxis: [
	          	        {
	          	        	type: 'value',
	       			        axisTick: {
	       			            show: false
	       			        },
	       			        axisLine: {
	       			            show: true,
	       			            lineStyle: {
	       			                color: '#bac0c0',
	       			            }
	       			        },
	       			        splitLine: {
	       			            show: false,
	       			            lineStyle: {
	       			                color: '#32346c ',
	       			            }
	       			        },
	       			        axisLabel: {
	       			            textStyle: {
	       			                color: '#f9f9f9',
	       			                fontWeight: 'normal',
	       			                fontSize: '12',
	       			            },
	       			            formatter: '{value}',
	       			        },
	          	        }
	          	    ],
	          	    series:  [
	                            {
	                                name:legendData[0],
	                                type:'line',
	                                data:getDataByCat('sum_value',data_dic),
	                                smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
	                                symbolSize: 0,
	                                symbol: 'circle',
	                                itemStyle: {
	            			            normal: {
	            			            	color:'#DBDF07',
	            			                lineStyle: {
	            			                    width: 1,
	            			                    type: 'solid' //'dotted'虚线 'solid'实线
	            			                },
	            			                barBorderRadius: 0,
	            			                label: {
	            			                    show: false,
	            			                }
	            			            }
	            			        },
	            			        areaStyle:{
	            			        	normal:{
	            			        		color:"#DBDF07"
	            			        	}
	            			        }
	                            },
	                            {
	                                name:legendData[1],
	                                type:'line',
	                                data:getDataByCat("forword_value",data_dic),
	                                smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
	                                symbolSize:0,
	                                symbol: 'circle',
	                                itemStyle: {
	            			            normal: {
	            			            	color:'#51D368',
	            			                lineStyle: {
	            			                    width: 1,
	            			                    type: 'solid' //'dotted'虚线 'solid'实线
	            			                },
	            			                barBorderRadius: 0,
	            			                label: {
	            			                    show: false,
	            			                }
	            			            }
	            			        },
	            			        areaStyle:{
	            			        	normal:{
	            			        		color:"#51D368"
	            			        	}
	            			        }
	                            },
	                            {
	                                name:legendData[2],
	                                type:'line',
	                                data:getDataByCat("negative_value",data_dic),
	                                smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
	                                symbolSize: 0,
	                                symbol: 'circle',
	                                itemStyle: {
	            			            normal: {
	            			            	color:'#e32f46',
	            			                lineStyle: {
	            			                    width: 1,
	            			                    type: 'solid' //'dotted'虚线 'solid'实线
	            			                },
	            			                barBorderRadius: 0,
	            			                label: {
	            			                    show: false,
	            			                }
	            			            }
	            			        },
	            			        areaStyle:{
	            			        	normal:{
	            			        		color:"#e32f46"
	            			        	}
	            			        }
	                            },
	                            {
	                                name:legendData[3],
	                                type:'line',
	                                data:getDataByCat("avg_value",data_dic),
	                                smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
	                                symbolSize:0,
	                                symbol: 'circle',
	                                itemStyle: {
	            			            normal: {
	            			            	color:'#1B64C4',
	            			                lineStyle: {
	            			                    width: 1,
	            			                    type: 'solid' //'dotted'虚线 'solid'实线
	            			                },
	            			                barBorderRadius: 0,
	            			                label: {
	            			                    show: false,
	            			                }
	            			            }
	            			        },
	            			        areaStyle:{
	            			        	normal:{
	            			        		color:"#1B64C4"
	            			        	}
	            			        }
	                            }
	                        ]
		          	};	
			  myChart.setOption(option);
	}
	//稳定均值柱状图
	function stabilizeAvgData(barData){
		var myChart = echarts.init(document.getElementById('stabilizeAvgData'));
		var colorList = ["#4ED380", "#E55752"];
		var bgColor = '#102155';
		var legendData = ['正向稳定均值', '负向稳定均值'];
		var total = 0;
		for (var i = 0; i < barData.length; i++) {
		    total += barData[i];
		}
		option = {
		    tooltip: {
		        formatter: function(params, ticket, callback) {
		            var tlData = 0;
		            switch (params.seriesName) {
		                case '正向稳定均值':
		                    tlData = barData[0]
		                    // code
		                    break;
		                case '负向稳定均值':
		                    tlData = barData[1]
		                    // code
		                    break;
		                    default:
		                    // code
		            }
		            return params.seriesName + ':' + tlData +'（'+(total == 0 ?0:(Math.abs(tlData)/(Math.abs(barData[0])+Math.abs(barData[1]))*100)).toFixed(2)+'%）';
		        }
		    },
		    grid:{
		    	//left:"0",
		    	//right:"150"
		    },
		    xAxis: {
		        data: [],
		        type: 'value',
		        max: 100,
		        show: false,
		        axisTick: {
		            show: false
		        }
		    },
		    yAxis: {
		        type: 'category',
		        show: false,

		        axisTick: {
		            show: false
		        }
		    },
		    color: colorList,
		    series: [{
		        type: 'bar',
		        name: '正向稳定均值',
		        data: [ Math.abs(barData[0]) * 100 / total],
		        stack: 'income',
		        barWidth: 60,
		        itemStyle: {
		            normal: {
		            	 label:{ 
	                            show: true, 
	                            position:'top',
	                            distance:30,
	                            formatter: '正向稳定均值:'+barData[0]
	                        },
	                        labelLine :{show:true}
		            },
		            emphasis: {
		                shadowColor: 'rgba(0, 0, 0, 0.5)',
		                shadowBlur: 10,
		                opacity: 0.8
		            }
		        }
		    }, {
		        type: 'bar',
		        name: '负向稳定均值',
		        data: [ Math.abs(barData[1]) * 100 / total],
		        stack: 'income',
		        barWidth: 60,
		        itemStyle: {
		            normal: {
		            	 label:{ 
	                            show: true, 
	                            position:'bottom',
	                            distance:25,
	                            formatter: '负向稳定均值:'+Math.abs(barData[1])
	                        },labelLine :{show:true}
		            },
		            emphasis: {
		                shadowColor: 'rgba(0, 0, 0, 0.5)',
		                shadowBlur: 10,
		                opacity: 0.8
		            }
		        }
		    }]
		};
		myChart.setOption(option);
	}
	//稳定均值折线图
	function showStabilizeAvgLine(flag,data_dic){
		var data_date=[];
		for(var i=0;i<data_dic.length;i++){
			var time = data_dic[i].key;
			data_date.push(time);
		}
		var legendData=[];
		var myChart;
		if(flag==2){
			myChart = echarts.init(document.getElementById('avgStabilizeLine'));
			legendData=["稳定均值","正向稳定均值","负向稳定均值"];
		}
		if(flag==3){
			myChart = echarts.init(document.getElementById('showStabilizeTotalLine'));
			legendData=["稳定指数","正向稳定指数","负向稳定指数"];
		}
		var option = {
				backgroundColor: '#1b233482',
          		toolbox: {
      		        feature: {
      		            dataZoom: {
      		                yAxisIndex: 'none'
      		            },
      		            restore: {},
      		            saveAsImage: {},
    		            dataView: {}
      		        },
      		      top:20
      		    }, 
      		    dataZoom: [
      		        {
      		            start: 0
      		        },
      		      {
      		            type: 'slider',
      		          textStyle:{
    		        		color:"#fff"
    		        	}
      		            
      		        }
      		    ],
      		    tooltip: {
  			        trigger: "axis",
  			        axisPointer: { // 坐标轴指示器，坐标轴触发有效
  			            type: 'line', // 默认为直线，可选为：'line' | 'shadow'
  			        },
  			        //formatter: '{b}<br />{a0}: {c0}<br />{a1}: {c1}<br />{a2}: {c2}<br />',
  			        backgroundColor: 'rgba(0,0,0,0.7)', // 背景
  			        padding: [8, 10], //内边距
  			        extraCssText: 'box-shadow: 0 0 3px rgba(255, 255, 255, 0.4);', //添加阴影
  			    },
          	    legend: {
  			        textStyle: {
  			            color: '#fff',
  			            fontSize: '12'
  			        },
          	    	//selectedMode:false,
          	    	data:legendData
          	    },
          	    grid: {
	   		        left: '1%',
	   		        right: '1%',
	   		        bottom: '15%',
	   		        top: '15%',
	   		        containLabel: true,
	   		        z: 22
	   		    	},
          	    	xAxis: [
	          	        {
	          	        	type: "category",
	      			        axisLine: {
	      			            lineStyle: {
	      			                color: '#bac0c0'
	      			            }
	      			        },
	      			        splitLine: {
	      			            show: false
	      			        },
	      			        axisTick: {
	      			            show: false
	      			        },
	      			        splitArea: {
	      			            show: false
	      			        },
	      			        axisLabel: {
	      			            inside: false,
	      			            textStyle: {
	      			                color: '#f9f9f9',
	      			                fontWeight: 'normal',
	      			                fontSize: '12',
	      			            },
	      			        },
	          	            data: data_date
	          	        }
          	    	],
	          	    yAxis: [
	          	        {
	          	        	type: 'value',
	       			        axisTick: {
	       			            show: false
	       			        },
	       			        axisLine: {
	       			            show: true,
	       			            lineStyle: {
	       			                color: '#bac0c0',
	       			            }
	       			        },
	       			        splitLine: {
	       			            show: false,
	       			            lineStyle: {
	       			                color: '#32346c ',
	       			            }
	       			        },
	       			        axisLabel: {
	       			            textStyle: {
	       			                color: '#f9f9f9',
	       			                fontWeight: 'normal',
	       			                fontSize: '12',
	       			            },
	       			            formatter: '{value}',
	       			        },
	          	        }
	          	    ],
	          	    series:  [
	                            {
	                                name:legendData[0],
	                                type:'line',
	                                data:getDataByCat('avg_value',data_dic),
	                                smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
	                                symbolSize: 0,
	                                symbol: 'circle',
	                                itemStyle: {
	            			            normal: {
	            			            	color:'#DBDF07',
	            			                lineStyle: {
	            			                    width: 1,
	            			                    type: 'solid' //'dotted'虚线 'solid'实线
	            			                },
	            			                barBorderRadius: 0,
	            			                label: {
	            			                    show: false,
	            			                }
	            			            }
	            			        },
	            			        areaStyle:{
	            			        	normal:{
	            			        		color:"#DBDF07"
	            			        	}
	            			        }
	                            },
	                            {
	                                name:legendData[1],
	                                type:'line',
	                                data:getDataByCat("forword_value",data_dic),
	                                smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
	                                symbolSize:0,
	                                symbol: 'circle',
	                                itemStyle: {
	            			            normal: {
	            			            	color:'#51D368',
	            			                lineStyle: {
	            			                    width: 1,
	            			                    type: 'solid' //'dotted'虚线 'solid'实线
	            			                },
	            			                barBorderRadius: 0,
	            			                label: {
	            			                    show: false,
	            			                }
	            			            }
	            			        },
	            			        areaStyle:{
	            			        	normal:{
	            			        		color:"#51D368"
	            			        	}
	            			        }
	                            },
	                            {
	                                name:legendData[2],
	                                type:'line',
	                                data:getDataByCat("negative_value",data_dic),
	                                smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
	                                symbolSize: 0,
	                                symbol: 'circle',
	                                itemStyle: {
	            			            normal: {
	            			            	color:'#e32f46',
	            			                lineStyle: {
	            			                    width: 1,
	            			                    type: 'solid' //'dotted'虚线 'solid'实线
	            			                },
	            			                barBorderRadius: 0,
	            			                label: {
	            			                    show: false,
	            			                }
	            			            }
	            			        },
	            			        areaStyle:{
	            			        	normal:{
	            			        		color:"#e32f46"
	            			        	}
	            			        }
	                            }
	                        ]
		          	};	
			  myChart.setOption(option);
	}
	//稳定总值柱状图
	function stabilizeTotalData(sumData){
		var myChart = echarts.init(document.getElementById('stabilizeTotalData'));
		var colorList = ["#4ED380", "#E55752"];
		var bgColor = '#102155';
		//var sumData = [250, 500];
		var legendData = ['正向稳定总值', '负向稳定总值'];
		var total = 0;
		for (var i = 0; i < sumData.length; i++) {
		    total += Math.abs(sumData[i]);
		}
		option = {
		   /*  legend: {
		        textStyle: {
		            color: "#FFFFFF"
		        },
		        data: legendData
		    }, */
		    tooltip: {
		        formatter: function(params, ticket, callback) {
		            var tlData = 0;
		            switch (params.seriesName) {
		                case '正向稳定总值':
		                    tlData = sumData[0]
		                    // code
		                    break;
		                case '负向稳定总值':
		                    tlData = sumData[1]
		                    // code
		                    break;
		                    default:
		                    // code
		            }
		            return params.seriesName + ':' + tlData +'（'+(total == 0 ?0:(Math.abs(tlData)/(Math.abs(sumData[0])+Math.abs(sumData[1]))*100)).toFixed(2)+'%）';
		        }
		    },
		     grid:{
		    	/* left:"0",
		    	right:"160" */
		    }, 
		    xAxis: {
		        data: [],
		        type: 'value',
		        max: 100,
		        show: false,
		        axisTick: {
		            show: false
		        }
		    },
		    yAxis: {
		        type: 'category',
		        show: false,

		        axisTick: {
		            show: false
		        }
		    },
		    color: colorList,
		    series: [{
		        type: 'bar',
		        name: '正向稳定总值',
		        data: [Math.abs(sumData[0]) * 100 / total],
		        stack: 'income',
		        barWidth: 60,
		        itemStyle: {
		            normal: {
		            	 label:{ 
	                            show: true, 
	                            position:'top',
	                            distance:30,
	                            formatter: '正向稳定总值:'+sumData[0]
	                        }
		            },
		            emphasis: {
		                shadowColor: 'rgba(0, 0, 0, 0.5)',
		                shadowBlur: 10,
		                opacity: 0.8
		            }
		        }
		    }, {
		        type: 'bar',
		        name: '负向稳定总值',
		        data: [Math.abs(sumData[1]) * 100 / total],
		        stack: 'income',
		        barWidth: 60,
		        itemStyle: {
		            normal: {
		            	 label:{ 
	                            show: true, 
	                            position:'bottom',
	                            distance:25,
	                            formatter: '负向稳定总值:'+Math.abs(sumData[1])
	                        }
		            },
		            emphasis: {
		                shadowColor: 'rgba(0, 0, 0, 0.5)',
		                shadowBlur: 10,
		                opacity: 0.8
		            }
		        }
		    }]
		};
		myChart.setOption(option);
	}
    </script>
</html>