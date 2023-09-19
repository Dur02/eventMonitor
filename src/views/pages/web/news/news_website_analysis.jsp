<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<title>新闻库分析-网站分析</title>
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
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/js/amcharts/export/export.css"/>
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window_zs.css"/><!-- 弹出提示框样式 -->
<script src="<%=basePath %>/static/js/config/config.js"></script>
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
		background-size: 100%;
		position: relative;	
		overflow: hidden;	
	}
	.show {
		position: relative;	
	}
	.left_top {
		width: 49%;
		height: 388px;
		border: 1px solid #4c5367;
		position: absolute;
		left: 0.7%;
		top: 18.4px;
		/* background: #1d2235;
		opacity: 0.8; */
		background-color: rgba(29,34,53,0.7);
	}
	.left_bottom {
		width: 49%;
		height: 388px;
		border: 1px solid #4c5367;
		position: absolute;
		left: 0.7%;
		top: 419px;
		background-color: rgba(29,34,53,0.7);
	}
	.right_top {
		width: 49%;
	    height: 790px;
	    border: 1px solid #4c5367;
	    position: absolute;
	    right: 0.5%;
	    top: 18.4px;
	    background-color: rgba(29,34,53,0.7);
	}
	.left_top1 {
		width: 39%;
		height: 30px;
		position: absolute;
		left: 37%;
		background: url(<%=basePath %>/static/images/bg_duan.png) no-repeat;
	}
	.left_top2 {
		/* width: 148px;
		height: 100px;
		position: absolute;
		left: 19%;
		top: 65px;
		padding: 18px; */
	    height: 100px;
	    position: absolute;
	    right: 270px;
	    top: 65px;
	    padding: 18px;
        text-align: center;
	}
	.left_top3 {
	    height: 321px;
	    position: absolute;
	    /* left: 47%; */
	    top: 65px;
	    width: 98%;
	    /* padding: 18px; */
	    text-align: center;
	}
	.span {
		color: white;
	}
	.span_0 {
		position: absolute;
		left: 20%;
		top: 5px;
		color: white;
		font-size: 14px;
		font-family: SimSun;
		font-weight: bold;
	    z-index: 999;
	}
	.span_1 {
		color: #01b9d5;
		font-size: 35px;
	}
	.span_2 {
		color: #dea200;
		font-size: 35px;
	}
	.span_3 {
		position: absolute;
		left: 20%;
		top: 5px;
		color: white;
		font-size: 14px;
		font-family: SimSun;
		font-weight: bold;
	}
	.left_top4 {
		width: 1px;
		height: 50px;
		background-color: #4c5367;
		position: absolute;
		left: 49%;
		top: 94px;
	}
	.left_bottom1 {
		width: 39%;
		height: 30px;
		position: absolute;
		left: 37%;
		background: url(<%=basePath %>/static/images/bg_duan.png) no-repeat;
	}
	.left_bottom2 {
		/* width: 98%;
		height: 315px;
		border: 1px solid pink;
		margin: 6% 0 0 1%; */
	    height: 315px;
	    margin: 6% 0 0 0%;
	}
	.left_top22 {
		margin-left: 10px;
	}
	.right_top1 {
		width: 39%;
		height: 30px;
		position: absolute;
		left: 40%;
		background: url(<%=basePath %>/static/images/bg_duan.png) no-repeat;
	}
	.span_4 {
		position: absolute;
		left: 18%;
		top: 5px;
		color: white;
		font-size: 14px;
		font-family: SimSun;
		font-weight: bold;
	}
	.right_top2 {
		width: 13%;
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
	.right_top3 {
        width: 100%;
	    height: 58%;
	    position: absolute;
	    top: 5%;
	}
	.right_top4 {
        width: 100%;
	    height: 34%;
	    top: 64%;
	    position: absolute;
	}
	.outBox {
		width: 86%;
	    height: 58%;
	    border: 1px solid #1c80b9;
	    position: absolute;
	    left: 7%;
	    top: 20%;
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
	    width: 100%;
	    height: 87%;
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
       	    right: -96%;
            background-color: #00aeff;
            position: absolute;
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
    <div class="index_top clearfix">
		<h3 class="fl title">新闻库分析 >网站分析</h3>
	</div>
	<div class="index_bottom">
		<input type="hidden" id="moduleCode" value="${moduleCode}">
		<!-- 显示图 -->
			<div class="zeZhao"></div>
		<!-- 显示图 -->
		<div class="data show">
			<div class="outBox">
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
	        <div class="left_top">
	        	<div class="left_top1">
	        		<span class="span_0">网站统计排行</span>
	        	</div>
	        	<div class="right_top2" value="1">
	        		<span class="span_5"></span>
	        		<span class="span_6">时间线分析</span>
	        	</div>
	        	<div class="left_top3" id="webStaticsRanks"></div>
	        </div>
	        <div class="left_bottom">
	        	<div class="left_bottom1"><span class="span_3">域名统计排行</span></div>
	        	<div class="right_top2" value="2">
	        		<span class="span_5"></span>
	        		<span class="span_6">时间线分析</span>
	        	</div>
	        	<div class="left_bottom2" id="domainStaticsRanks"></div>      	
	        </div>
	        <div class="right_top">
	        	<div class="right_top1">
	        		<span class="span_4">网站地域分布</span>
	        	</div>
	        	<div class="right_top3" id="word_echart"></div>
	        	<div class="right_top4" id="bar_echart"></div>
	        </div>
		</div>
		<!-- 页面底部收缩 -->
		<jsp:include page="news_tab1.jsp"></jsp:include>
	</div>
	<!-- 修改密码 -->
	<jsp:include page="../updateUserPassword.jsp"/>
</body>
    
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/chartUtil/echarts.min.js"></script>
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
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
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
<script type="text/javascript">
    $(function(){
    	//处理配置
		handleConfigs();
		//美化滚动条
		glorifyComboSelect();
    });
    //渲染图表
    var myChart_webStaticsRanks;
    var myChart_domainStaticsRanks;
    var myChart_word_echart;
    var myChart_bar_echart;
    function render(configId){
		 startLoad();
			$.ajax({
				url:'<%=basePath %>/search/news_analysis_viz/'+configId,
				type: 'POST',
				dataType:"json",
				success:function(data){
					if(data == "-1"){
						endLoad();
						win.alertEx("获取结果信息数据失败");
					}else{
						renderData(data);
						endLoad();
						//左侧菜单栏 扩大缩小后重新渲染图表
						window.onresize=function (){
							myChart_webStaticsRanks.resize();
							myChart_domainStaticsRanks.resize();
							myChart_word_echart.resize();
							myChart_bar_echart.resize();
							myChart_timeLine.resize();
				        }
					}
				}
		});
	}
    
    //渲染图表
    var web_news_topn =[];
    var web_news_time_line;
	function renderData(data){
		console.log("data="+JSON.stringify(data));
		//弹出框关闭
		$(".out_4").click();
		//网站统计排行
    	web_news_topn = data.web_news_topn;
    	webStaticsRankShow(web_news_topn);
    	//网站时间线
    	web_news_time_line = data.web_news_time_line;
    	//域名统计排行
    	domain_news_topn = data.domain_news_topn;
    	domainStaticsRankShow(domain_news_topn);
    	//网站时间线
    	domain_news_time_line =data.domain_news_time_line;
    	//网站地域分布
         worldData = data.worldData;
		 showMap(worldData);
		 showBar(worldData);
	}
    var val;
    var keys;
    //时间线分析-弹出框
    $('.right_top2').click(function(){
    	
		$('.outBox').css('display','block');
		$('.zeZhao').css('display','block')
		val=$(this).attr("value");
		if(val==1){
			$(".drop-down-content").empty();
			//渲染网站数下拉框数据
			var num = web_news_topn.length > 10 ? 10:web_news_topn.length;
			for(var i=0;i<num;i++){
				$('.drop-down-content').append(' <li value="'+web_news_topn[i].name+'" class="li_1 li">网站：'+web_news_topn[i].name+'    数量：'+web_news_topn[i].value+'</li>');
			}
			//下拉框点击事件
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
				showTimeLine(web_news_time_line[keys])
				
	    	});
			//点击时间线时，第一个li点击
			$(".li_1").first().click();	
			
		}
		if(val==2){
			$(".drop-down-content").empty();
			//渲染网站数下拉框数据
			var num = domain_news_topn.length > 10 ? 10:domain_news_topn.length;
			for(var i=0;i<num;i++){
				$('.drop-down-content').append(' <li value="'+domain_news_topn[i].name+'" class="li_1 li">网站：'+domain_news_topn[i].name+'    数量：'+domain_news_topn[i].value+'</li>');
			}
			//下拉框点击事件
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
				showTimeLine(domain_news_time_line[keys])
				
	    	});
			//点击时间线时，第一个li点击
			$(".li_1").first().click();	
		}
		
	});
    
	$('.out_4').click(function(){
		$('.outBox').css('display','none');
		$('.zeZhao').css('display','none');
	})
	
	//时间线分析-下拉框
    let flag = true;  
    $('.pull_down').click(function(){    	  	    	
    	if(flag = !flag){
    		$('.drop-down-content').css("display","block");
    	}else {
    		$('.drop-down-content').css("display","none");
    	}
    })
    ///时间线数据力度切换方法
	function packDataType(date_data,len){
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
     			value:date_new[obj].toFixed(2)
   	      	}	
     		quadclass_value.push(d1);
		 }
         showTimeLine(quadclass_value);
	}
    //时间粒度切换
	$('.circle').on('click',function(){
		$(this).addClass('circleon').siblings('.circle').removeClass('circleon');
		var selectVal=$(this).attr('value');
		var lineEventData=[];
		if(val==1){
			 lineEventData = web_news_time_line[keys];
    	}
		if(val==2){
			 lineEventData =domain_news_time_line[keys];
    	}
		if(selectVal=="1"){
			showTimeLine(lineEventData);
		}
		if(selectVal=="2"){
			packDataType(lineEventData,6);
        }
		if(selectVal=="3"){
			packDataType(lineEventData,4);
        }
		if(selectVal=="4"){
			packDataType(lineEventData,2);
        }
   	}) 
	
	//网站统计排行
	function webStaticsRankShow(data){
    	var data1=[];
    	var data2=[];
    	var maxIndex=0;
    	var minIndex=0;
    	for(var i=0;i<data.length;i++){
    		var time=data[i].name;
    		var value=data[i].value;
			if(maxIndex<value){
				maxIndex=value
			}
			if(minIndex>value){
				minIndex=value
			}
    		data1.push(time);
    		data2.push(value);
       }
        myChart_webStaticsRanks = echarts.init(document.getElementById('webStaticsRanks'));
       // 颜色
      var lightBlue = {
           type: 'linear',
           x: 0,
           y: 0,
           x2: 0,
           y2: 1,
           colorStops: [{
               offset: 0,
               color: 'rgba(0, 192, 255, 1)' // 0% 处的颜色
           }, {
               offset: 1,
               color: 'rgba(0, 192, 255, 0.1)' // 100% 处的颜色
           }],
           globalCoord: false // 缺省为 false
       }
       var darkBlue = {
           type: 'linear',
           x: 0,
           y: 0,
           x2: 0,
           y2: 1,
           colorStops: [{
               offset: 0,
               color: 'rgba(41, 121, 255, 1)' // 0% 处的颜色
           }, {
               offset: 1,
               color: 'rgba(41, 121, 255, 0.1)' // 100% 处的颜色
           }],
           globalCoord: false // 缺省为 false
       }
       // 指定图表的配置项和数据
       var option = {
   		  dataZoom: [
   	      		        {
   	      		            start: 0,
   	      		            end:20
   	      		        },
   	      		      {
   	      		            type: 'slider',
   	      		          textStyle:{
   	    		        		color:"#fff"
   	    		        	}
   	      		            
   	      		        }
   	      		    ],
    		
   		  tooltip: {
		        show:true,
		        formatter:"{b} : {c}"
		    },
           grid:{
        	   bottom:"18%",
        	   left:"20",
        	   right:"15",
        	   top:'10'
           },
           xAxis: {
               type: 'category',
               boundaryGap: false,
               // boundaryGap: 100,
               axisLine: {
            	   show:false,
                   lineStyle: {
                       color: '#4bbbf8',
                       shadowColor: 'rgba(75, 211, 255, 0.5)',
                       shadowBlur: 5
                   }
               },
               axisTick: {
            	   show: false,
                   interval: (index) => {
                       if (index === -1 || index === 9) {
                           return false;
                       } else {
                           return true;
                       }
                   }
               },
               axisLabel: {
                   color: '#4bbbf8',
                   fontSize: 12
               },
               splitLine: {
                   show: false
               },
               data: data1,

           },
           yAxis: [{
               axisLine: {
            	   show:false,
                   lineStyle: {
                       color: '#4bbbf8',
                       shadowColor: 'rgba(75, 211, 255, 0.5)',
                       shadowBlur: 5
                   }
               },
               axisLabel: {
            	   show: false,
                   color: '#fff',
                   fontSize: 12
               },
               axisTick: {
            	   show: false,
                   interval: (index) => {
                       if (index === -1 || index === 9) {
                           return false;
                       } else {
                           return true;
                       }
                   }
               },
               splitLine: {
            	   show: false,
                   lineStyle: {
                       color: 'rgba(75, 211, 255, 0.2)',
                       type: 'dashed'
                   }
               }
           }],
           series: [{
               name: '数量',
               type: 'pictorialBar',
               barCategoryGap: '-20%',
               symbol: 'path://d="M150 0 L75 200 L225 200 Z"',
               label: {
                   show: true,
                   position: 'top',
                   color: '#1798ff',
                   fontSize: 14
               },
               itemStyle: {

                   color: function(params) {
                       return params.dataIndex % 2 ? darkBlue : lightBlue;
                   }
               },
               data: data2
           }],
       };
      myChart_webStaticsRanks.setOption(option);
    }
    //时间线
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
	    				right: '3%',
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
    //域名统计排行
    function domainStaticsRankShow(data){
    	var data1=[];
    	var data2=[];
    	var maxIndex=0;
    	var minIndex=0;
    	for(var i=0;i<data.length;i++){
    		var time=data[i].name;
    		var value=data[i].value;
			if(maxIndex<value){
				maxIndex=value
			}
			if(minIndex>value){
				minIndex=value
			}
    		data1.push(time);
    		data2.push(value);
       }
        myChart_domainStaticsRanks = echarts.init(document.getElementById('domainStaticsRanks'));
       var option = {
    		   	
    		   dataZoom: [
	      		        {
	      		            start: 0,
	      		            end:20
	      		        },
	      		      {
	      		            type: 'slider',
	      		          textStyle:{
	    		        		color:"#fff"
	    		        	}
	      		            
	      		        }
	      		    ],
    		    xAxis: {
    		        data: data1,
    		        axisLine: {
    		            lineStyle: {
    		                color: '#0177d4'
    		            }
    		        },
    		        axisLabel: {
    		            color: '#fff',
    		            fontSize: 14
    		        }
    		    },
    		    tooltip: {
			        show:true,
			        formatter:"{b} : {c}"
			    },
			    grid:{
    		    	left:"80",
    		    	right:"15",
    		    	bottom:"19%",
    		    },
    		    yAxis: {
    		        name: "",
    		        nameTextStyle: {
    		            color: '#fff',
    		            fontSize: 16
    		        },
    		        axisLine: {
    		            lineStyle: {
    		                color: '#0177d4'
    		            }
    		        },
    		        axisLabel: {
    		            color: '#fff',
    		            fontSize: 16
    		        },
    		        splitLine: {
    		            show:false,
    		            lineStyle: {
    		                color: '#0177d4'
    		            }
    		        },
    		        max:maxIndex
    		    },
    		    series: [{
    		        type: 'bar',
    		        barWidth: 18,
    		        itemStyle:{
    		            normal:{
    		                color:new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
    		                    offset: 0,
    		                    color: '#00b0ff'
    		                }, {
    		                    offset: 0.8,
    		                    color: '#7052f4'
    		                }], false)
    		            }
    		        },
    		        data: data2
    		    }]
    		};
       myChart_domainStaticsRanks.setOption(option);
    }
  //世界地图
	   var mapname="world";
	   function showMap(data){
		   	var maxVisualMap = 0;
		   	for(var i=0;i<data.length;i++){
		   		if(data[i].value>maxVisualMap){
		   			maxVisualMap = data[i].value;
		   		}
		   	}
		   	
	   		myChart_word_echart = echarts.init(document.getElementById('word_echart'));
    		//世界地图option所需要数据
    		var jsons ='../../static/js/worldJson/'+mapname+'.json'; 
    		$.get(jsons, function (getJson) {
	            echarts.registerMap("world",getJson);
				option = {
					//backgroundColor:"#1b2334",
				    tooltip: {
				        trigger: 'item',
				        formatter: function (params) {
				            var value = (params.value + '').split('.');
				            value = value[0].replace(/(\d{1,3})(?=(?:\d{3})+(?!\d))/g, '$1,')
				                    + '.' + value[1];
				            return "国家"+":"+ params.name+'('+ params.data.chName+')' +'<br/>' + "新闻量" + ' : ' + params.data.value;
				        }
				    },
				    toolbox: {
				        show: false,
				        orient: 'vertical',
				        left: 'right',
				        top: 'center',
				        feature: {
				            dataView: {readOnly: false},
				            restore: {},
				            saveAsImage: {},
        		            dataView: {}
				        }
				    },
				    visualMap: {
				        min: 0,
				        max: maxVisualMap,
				        text:['高','低'],
				        realtime: false,
				        calculable: true,
				        textStyle :{
				        	color:"#fff"
				        }
				        //color: ['orangered','yellow','lightskyblue']
				    },
				    series: [
				        {
				            name: 'World Population (2010)',
				            type: 'map',
				            mapType: 'world',
				            roam: true,
				            itemStyle:{
				                emphasis:{label:{show:true}}
				            },
				            zoom:1.2,
				            data:data
				        }
				    ]
			};
			myChart_word_echart.setOption(option);
    		})
	}
	   //网站地域排行前十的柱状图
	   function showBar(data){
	    	var data1=[];
	    	var data2=[];
	    	var maxIndex=0;
	    	var minIndex=0;
	    	for(var i=0;i<data.length;i++){
	    		var time=data[i].chName;
	    		var value=data[i].value;
				if(maxIndex<value){
					maxIndex=value
				}
				if(minIndex>value){
					minIndex=value
				}
	    		data1.push(time);
	    		data2.push(value);
	       }
	        myChart_bar_echart = echarts.init(document.getElementById('bar_echart'));
	       var option = {
	    		    xAxis: {
	    		        data: data1,
	    		        axisLine: {
	    		            lineStyle: {
	    		                color: '#0177d4'
	    		            }
	    		        },
	    		        axisLabel: {
	    		            color: '#fff',
	    		            fontSize: 14
	    		        }
	    		    },
	    		    dataZoom: [
	   	      		        {
	   	      		            start: 0,
	   	      		            end:20
	   	      		        },
	   	      		      {
	   	      		            type: 'slider',
	   	      		          textStyle:{
	   	    		        		color:"#fff"
	   	    		        	}
	   	      		            
	   	      		        }
	   	      		    ],
	    		    tooltip: {
				        show:true,
				        formatter:"{b} : {c}",
				        "trigger": "axis",
				    },
	    		    grid:{
	    		    	left:"10%",
	    		    	right:"5%",
	    		    	bottom: 60,
	    		    },
	    		    yAxis: {
	    		        name: "",
	    		        nameTextStyle: {
	    		            color: '#fff',
	    		            fontSize: 16
	    		        },
	    		        axisLine: {
	    		            lineStyle: {
	    		                color: '#0177d4'
	    		            }
	    		        },
	    		        axisLabel: {
	    		            color: '#fff',
	    		            fontSize: 16
	    		        },
	    		        splitLine: {
	    		            show:false,
	    		            lineStyle: {
	    		                color: '#0177d4'
	    		            }
	    		        },

	    		    },
	    		    series: [{
	    		        type: 'bar',
	    		        barWidth: 18,
	    		        itemStyle:{
	    		        	 normal: {
	    		                    color: function(params) {
	    		                    	//debugger
	    		                    	 var colorList = [
		    		                            '#ff2600',
		    		                            '#ffc000',
		    		                            '#00ad4e',
		    		                            '#0073c2',
		    		                            '#165868',
		    		                            '#e76f00',
		    		                            '#316194',
		    		                            '#723761',
		    		                            '#00b2f1',
		    		                            '#4d6022',
		    		                            '#4b83bf',
		    		                            '#f9c813',
		    		                            '#0176c0'
		    		                        ];
	    		                        	 if(params.dataIndex==0){
	    		                        		 return  colorList[0]
	    		                        	 }else
	    		                        	 if(params.dataIndex==1){
	    		                        		 return  colorList[0]
	    		                        	 }else
	    		                        	 if(params.dataIndex==2){
	    		                        		 return  colorList[0]
	    		                        	 }else{
	    		                        		 return  colorList[1]
	    		                        	 }
	    		                        	 
	    		                        }
	    		                       
	    		                    },
	    		        },
	    		        data: data2
	    		    }]
	    		};
	       myChart_bar_echart.setOption(option);
	    }
    </script>
</html>