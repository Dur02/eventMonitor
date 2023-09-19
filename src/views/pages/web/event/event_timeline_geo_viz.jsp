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
<title>地理事件分析</title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/style.css">
<!-- 人工查询日期 -->
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath%>/static/lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/combo.select.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/perfect-scrollbar.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath%>/static/lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/combo.select.css">
<!--引入页面下边的条件查询的展示tab  -->
<link rel="stylesheet"
	href="<%=basePath%>/static/css/perfect-scrollbar.css" />
<!--引入页面下边的条件查询的展示tab  -->
<link rel="shortcut icon" type="image/x-icon" href="<%=basePath%>/static/Visualization/base/ico.png" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/base.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/css/event_result.css" />
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/countrymap.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window_zs.css"/><!-- 弹出提示框样式 -->


<script src="<%=basePath%>/static/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>/static/lib/jquery.pagination.js"></script>
<script src="<%=basePath%>/static/js/config/config.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/echarts.js"></script>
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
		background:url(<%=basePath %>/static/images/beij.png) no-repeat;
    	background-size: 100%;
    	position: relative;
	}
	.middle_box {
			position: absolute;
		    width: 18.3%;
		    height: 3.14%;
		    left: 2%;
		    top: 3.7%;
		    color: white;
		}
		.newShow {
			position: absolute;
			width: 99%;
			height: 95%;
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
        }
        .city1 {
        	display: inline-block;
        	margin-left: 25px;
        	margin-top: 3px;
        	transform: skew(-20deg);
        	margin-top: 2.5px;       	
        }
        .Province {
        	display: inline-block;
        	height: 26px;
        	width: 73px;
        	transform: skew(20deg);
        	border-radius: 3px;
        	border: 1.3px solid #00aeff;
        	background-color: #024a73;
        	cursor: pointer;
        	margin-left: -7px;
        	
        }
        .Province1 {
        	display: inline-block;
        	margin-left: 25px;
        	margin-top: 3px;
        	transform: skew(-20deg);
        	color: #FFF;
        	margin-top: 2.5px;
        }
        .country {
        	display: inline-block;
        	height: 26px;
        	width: 73px;
        	transform: skew(20deg);
        	border-radius: 3px;
        	border: 1px solid #00aeff;
        	background-color: #00aeff;
        }
        .country1 {
        	display: inline-block;
        	margin-left: 25px;
        	margin-top: 3px;
        	transform: skew(-20deg);
        }
        .out_box {
        	position: absolute;
		    border: 1px solid #292d3c;
		    height: 84%;
		    width: 95%;
		    left: 2%;
		    top: 10%;
        }
        .middle_box1 {
			position: absolute;
		    width: 14.6%;
		    height: 6.7%;
		    left: 41%;
		    top: -2px;
		    color: white;
		    border: #383e54 solid 0px;
			background: url(<%=basePath %>/static/images/ti_1.png) no-repeat;
		}
		.middle_box2 {
			position: absolute;
		    width: 14.6%;
		    height: 12.7%;
		    left: 41%;
		    top: -2px;
		    color: white;
		    border: #383e54 solid 0px;
			background: url(<%=basePath %>/static/images/ti_1.png) no-repeat;
		}
		.trapezoid {
        	font-size: 14px;
   	 		font-family: SimSun;
    		font-weight: bold;
    		position: absolute;
    		left: 75px;
    		top: 10px;	
        }
        .trapezoid1 {
        	font-size: 14px;
   	 		font-family: SimSun;
    		font-weight: bold;
    		position: absolute;
    		left: 83px;
    		top: 10px;	
        }
        .middle_space {
        	position: absolute;
		    width: 98%;
		    height: 47.7%;
		    left: 1%;
		    top: 355px;
		    border: #383e54 solid 1px;
        }
        .pull_down {
        	position: absolute;
        	width: 30.5%;
        	height: 7%;
        	left: 1%;
        	top: 4.5%;
        	border: 1px solid #1f5175;
        	border-radiud: 3px;
        	
        }
        .time {
        	position: absolute;
        	width: 20%;
        	height: 7%;
        	right: 0.2%;
        	top: 4.5%;
        }
        /* .combo-select {
		    position: relative;
		    max-width: 490px;
		    margin-bottom: 15px;
		    font: 100% Helvetica, Arial, Sans-serif;
		    /* border: 1px #ccc solid; */
		    border-radius: 3px;
		}
		/* .combo-input {
			background: #0f121f;
			border: 1px solid #164b6d;
			opacity： 0.5px;
		} */
		/* .combo-dropdown {
			border: 1px solid #164b6d;
			overflow-y:auto; overflow-x:auto; width:490px; height:300px;
			height:300px;
			overflow-y:auto;
		}  */
		::webkit-scrollbar {
			width: 30px;
			height: 16px;
		}
		/* .combo-arrow {
			width: 14px;
			height: 14px;
			top: 4px;
    		right: 6px;
			background: #00aeff;
		} */
		
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
		.add_data {
			   position: absolute;
			   width: 98%;
			   height: 40.7%;
			   left: 1%;
			   top: 5.8%;
			   /* border: 1px solid red;  */
		}
		.add_data1 {
			    position: absolute;
			    width: 98%;
			    height: 81.7%;
			    left: 1%;
			    top: 14.8%;
			    /* border: 1px solid red; */
		}
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
            line-height: 2;
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
            left: 2.5px;
            top: 4px;     
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
		
</style>
</head>
<body>
	<div class="index_top clearfix">
		<h3 class="fl title">事件库分析 > 地理事件分析</h3>
		<input type="hidden" id="moduleCode" value="${moduleCode}">
	</div>
	<div class="index_bottom">
		<div class="data show">
			<div class="newShow">
				<div class="middle_box">
							<span class="country astleve">
							<span class="country1 astleve">国家</span>
							</span>
							<span class="Province astleve">
							<span class="Province1" >州省</span>
							</span>
							<span class="city astleve">
							<span class="city1" >城市</span>			
							</span>
				</div>
				<!-- 中部盒子 -->
				<div class="out_box">
					<div class="middle_box1">
						  <span class="trapezoid">国家-事件分析</span>
					</div>
					<div id="eventAnalysisChart" class="add_data">
						
					</div>
					
					<div class="middle_space">
						<div class="middle_box2">
							<span class="trapezoid1">时间线分析</span>
						</div>
						<div class="pull_down">
							 <ul class="nav">  
						        <li class="drop-down">		
						        <span class="title_T"></span>			                
						                <li class="triangle_1">
						                	<span class="triangle_2"></span>
						                </li>
							            <ul style="height:200px;overflow:auto" class="drop-down-content">
							                <!-- <li class="li_1 li"><a href="#"></a></li>  -->
							            </ul>
						        </li>    
						    </ul>
						
							<!--  <select id="selectBox">
							    <option value="中国">国家：中国 事件数：17250 稳定总值：4333.5 平均情感值：2.3 </option>
							    <option value="日本">国家：日本 事件数：17250 稳定总值：4333.5 平均情感值：2.3 </option>
							    <option value="美国">国家：美国 事件数：17250 稳定总值：4333.5 平均情感值：2.3 </option>
							 </select> -->
						</div>
						<div class="time">
							<span>时间粒度：</span>
							<span class="circle" val="3"></span><span>年</span><span class="circle" val="2"></span><span>月</span><span class="circle" val="4" id="weekCondtion"></span><span>周</span><span class="circle circleon" val="1" id="dayCondtion"></span><span>日</span>
						</div>
						<div id="eventTimeLineChart" class="add_data1">
						
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
<!-- 人工查询日期 -->
<script src="<%=basePath %>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-select.min.js"></script>
<script src="<%=basePath %>/static/js/jquery.combo.select.js"></script>
<script src="<%=basePath %>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath %>/static/js/perfect-scrollbar.js"></script>
<script src="<%=basePath %>/static/js/sec2.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/Visualization/base/base.js"></script>
<!-- 人工查询js -->
<script src="<%=basePath %>/static/Visualization/rgQuery.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
<c:if test="${bgFlag == null or bgFlag == 1}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
</c:if>

<script type="text/javascript" src="<%=basePath%>/static/Visualization/downLoad.js"></script>
<!-- 计算显示图的高度 -->	
<script src="<%=basePath%>/static/js/chartHeight.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<script type="text/javascript">
	$(function(){
		
		//增加统计依据
		$(".bizhong").show();
		//处理配置
		handleConfigs();
		//美化滚动条
		glorifyComboSelect();

	////////////////////////////////////////////////////////////////////////////
		// 控制选择年月日
		$(".date").on("click",function(){
			$(this).addClass("active_span").siblings().removeClass("active_span");
		});
		$(".date:eq(5)").on("click",function(){
			$('#dateType').val(3);
			$(".lab1,.lab2").css("display","none");
			$(".lab0").css("display","inline-block");

			$('.year1').datepicker({
				format: 'yyyy', 
				weekStart: 0,
				autoclose: true, 
				orientation:" top auto",
				startView: 2, 
				maxViewMode: 2,
				minViewMode:2,
				forceParse: false, 
				language: 'zh-CN',
				startDate: '${minDate[0]}',
				endDate : '${maxDate[0]}',
			}).on('changeDate',function(e){  
				if($(this).val() > $('.year2').val()){
					$('.year2').val($(this).val());
				}
			    var startTime = e.date;  
			    $('.year2').datepicker('setStartDate',startTime);  
			}); 
			$('.year2').datepicker({
				format: 'yyyy', 
				weekStart: 0,
				autoclose: true, 
				orientation:" top auto",
				startView: 2, 
				maxViewMode: 2,
				minViewMode:2,
				forceParse: false, 
				language: 'zh-CN',
				startDate: '${minDate[0]}',
				endDate : '${maxDate[0]}'
			}).on('changeDate',function(e){ 
				if($(this).val() < $('.year1').val()){
					$('.year1').val($(this).val());
				}
			    var endTime = e.date;  
			    $('.year').datepicker('setEndDate',endTime);  
			}); 
		});
		$(".date:eq(6)").on("click",function(){
			$('#dateType').val(2);
			$(".lab0").css("display","none");
			$(".lab1").css("display","inline-block");
			$(".lab2").css("display","none");

			$('.month1').datepicker({
				format: 'yyyy-mm', 
				weekStart: 0, 
				autoclose: true, 
				orientation:" top auto",
				startView: 1, 
				maxViewMode: 2,
				minViewMode:1,
				forceParse: false, 
				language: 'zh-CN',
				startDate: '${minDate[1]}',
				endDate: '${maxDate[1]}'
			}).on('changeDate',function(e){ 
				if($(this).val() > $('.month2').val()){
					$('.month2').val($(this).val());
				}
			    var startTime = e.date;  
			    $('.month2').datepicker('setStartDate',startTime);  
			});

			$('.month2').datepicker({
				format: 'yyyy-mm', 
				weekStart: 0, 
				autoclose: true, 
				orientation:" top auto",
				startView: 1, 
				maxViewMode: 2,
				minViewMode:1,
				forceParse: false, 
				language: 'zh-CN',
				startDate: '${minDate[1]}',
				endDate: '${maxDate[1]}'
			}).on('changeDate',function(e){  
				if($(this).val() < $('.month1').val()){
					$('.month1').val($(this).val());
				}
			    var endTime = e.date;  
			    $('.month1').datepicker('setEndDate',endTime);  
			});
		});
		$(".date:eq(7)").on("click",function(){
			$('#dateType').val(1);
			$(".lab0").css("display","none");
			$(".lab1").css("display","none");
			$(".lab2").css("display","inline-block");

			$('.day').datepicker({
				format: 'yyyy-mm-dd', 
				weekStart: 0,
				autoclose: true, 
				orientation:" top auto",
				startView: 0,
				maxViewMode: 2,
				minViewMode:0,
				forceParse: false, 
				language: 'zh-CN',
			});
			$('.day').datepicker('setStartDate','2014-12-01');
		});
		
	});
		var timeArray = [];
	    //加载配置对应的结果数据
		function render(configId){
			startLoad();
				 var resultcode = 'ALL';
					$.ajax({
						url:'<%=basePath %>/search/event_timeline_geo_viz/'+configId,
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
	    
		//渲染事件分析图表
	    function initEventAnalysisChart(eventAnalysisData){
	    	//时间
	    	var xAxisData = [];
	    	//事件数
	    	var eventDate = [];
	    	/* var minEventValue = 0; */
	    	var maxEventValue = 0;
	    	//稳定总值
	    	var sumScaleData =[];
	    	var maxSumScale = 0;
	    	/* var minSumScale = 0; */
	    	//平均情感值
	    	var avgToneData = [];
	    	/* var minAvgTone = 0; */
	    	var maxAvgTone = 0;
	    	for(var i=0;i<eventAnalysisData.length;i++){
	    		xAxisData.push(eventAnalysisData[i].key);
	    		eventDate.push(eventAnalysisData[i].eventValue);
	    		avgToneData.push(eventAnalysisData[i].avgTone);
	    		sumScaleData.push(eventAnalysisData[i].sumScale);
	    		//事件数最大值
	    		if(eventAnalysisData[i].eventValue>maxEventValue){
	    			maxEventValue  = eventAnalysisData[i].eventValue;
	    		}
	    		//总稳定最大值、最小值
	    		/* if(eventAnalysisData[i].sumScale > maxSumScale){
	    			maxSumScale  = eventAnalysisData[i].sumScale;
	    		}else if(eventAnalysisData[i].sumScale < minSumScale){
	    			minSumScale  = eventAnalysisData[i].sumScale;
	    		} */
	    		if(Math.abs(eventAnalysisData[i].sumScale) > maxSumScale){
	    			maxSumScale  =  Math.abs(eventAnalysisData[i].sumScale);
	    		}
	    		//平均情感值
	    		var tem_avgTone =eventAnalysisData[i].avgTone;
	    		/* if(tem_avgTone > maxAvgTone){
	    			maxAvgTone = tem_avgTone;
	    		}else if(minAvgTone > tem_avgTone){
	    			minAvgTone  = tem_avgTone;
	    		} */
	    		if(Math.abs(tem_avgTone) > maxAvgTone){
	    			maxAvgTone = Math.abs(tem_avgTone);
	    		}
	    	}
	    	
	    	
	    	/*echarts数据 
	    	var xAxisData = ['12月1日', '12月2日', '12月3日', '12月4日', '12月5日', '12月6日', '12月7日'];
			var eventDate = ['3803', '3703', '3303', '3663', '3503', '3903', '3403'];
			var avgToneData = ['1.1','1.2','1.5','1.6','2.2','1.2','1.1'];
			var sumScaleData = ['0.3', '0.4', '1', '1.2', '0.2', '0.2', '0.1']; */
			
			var XTypelist = ['事件数', '平均情感值', '稳定总值'];
			var color = ['#db8258', 'green', 'yellow']
			var labelstyle1 = {
			    show: true,
			    position: 'top',
			    textStyle: {
			        color: '#fff',
			    }
			};
			var lineStyle1 = {
			    normal: {
			        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
			            offset: 0,
			            color: '#008cff'
			        }, {
			            offset: 1,
			            color: '#005193'
			        }]),
			        opacity: 1,
			
			    }
			};
			var lineStyle2 = {
			    normal: {
			        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
			            offset: 0,
			            color: '#007a55'
			        }, {
			            offset: 1,
			            color: '#007a55'
			        }]),
			        opacity: 1,
			    }
			};
			var lineStyle3 = {
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
			};
			var lineStyle4 = {
			    normal: {
			        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
			            offset: 0,
			            color: '#eda000'
			        }, {
			            offset: 1,
			            color: '#ce42d1'
			
			        }]),
			        opacity: 1,
			    }
			};
			
			 option = {
				backgroundColor: '#1b233482',
				grid:{
					bottom:20,
					left:80,
					right:160
				},
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
			        "trigger": "axis",
			        "axisPointer": {
			            "type": "shadow",
			            textStyle: {
			                color: "#fff"
			            }
			
			        },
			    },
			
			
			 legend: {
			        data: XTypelist,
			        textStyle: {
			            color: "white"
			        }
			    },
			
			    xAxis: {
			        data: xAxisData,
			        axisLine: {
			            lineStyle: {
			                color: '#bac0c0'
			            }
			        },
			        axisLabel: {
			            show: true,
			            textStyle: {
			                color: "#f9f9f9" //X轴文字颜色
			            }
			        }
			    },
			    yAxis: [{
			            type: 'value',
			            name: '事件数',
			            min: -(maxEventValue),
			            max: maxEventValue,
			            position: 'left',
			            axisLine: {
			                lineStyle: {
			                    color: '#f9f9f9'
			                }
			            },
			            axisLabel: {
				            show: true,
				            textStyle: {
				                color: "#f9f9f9" //X轴文字颜色
				            },
			                formatter: '{value}'
			            },
			            splitLine: {
			                show: false,
			                lineStyle: {
			                    color: '#0177d4'
			                }
			            },
			        },
			        {
			            type: 'value',
			            name: '平均情感值',
			            min: -(maxAvgTone),
			            max:  maxAvgTone,
			            position: 'right',
			            axisLine: {
			                lineStyle: {
			                    /* color: color[2] */
			                    color: '#f9f9f9'
			                }
			            },
			            axisLabel: {
				            show: true,
				            textStyle: {
				                color: "#f9f9f9" //X轴文字颜色
				            },
			                formatter: '{value}',
			            },
			            splitLine: {
			                show: false,
			                lineStyle: {
			                    color: '#0177d4'
			                }
			            },
			        },
			        {
			            type: 'value',
			            name: '稳定总值',
			            min:  -(maxSumScale),
			            max: maxSumScale,
			            position: 'right',
			            offset: 80,
			            axisLine: {
			                lineStyle: {
			                   /*  color: color[1] */
			                	 color: '#f9f9f9'
			                }
			            },
			            axisLabel: {
				            show: true,
				            textStyle: {
				                color: "#f9f9f9" //X轴文字颜色
				            },
			                formatter: '{value}'
			            },
			            splitLine: {
			                show: false,
			                lineStyle: {
			                    color: '#0177d4'
			                }
			            },
			        }
			    ],
			    series: [{
			            name: XTypelist[0],
			            type: 'bar',
			            //barWidth: 25,
			            symbol: 'circle',
			            itemStyle: lineStyle1,
			            label: labelstyle1,
			            data: eventDate
			        },
			        {
			            name: XTypelist[1],
			            type: 'line',
			            yAxisIndex: 1,
			            //smooth:true,
			            symbol: 'circle',
			            data: avgToneData,
			            label: labelstyle1,
			            itemStyle: lineStyle3,
			            
			        }, {
			            name: XTypelist[2],
			            type: 'line',
			            //barWidth: 25,
			            yAxisIndex: 2,
			            //smooth:true,
			            symbol: 'circle',
			            label: labelstyle1,
			            itemStyle: lineStyle2,
			            data: sumScaleData
			        }
			
			    ]
			};
			 
			 /* var colors = ['#5793f3', '#d14a61', '#675bba'];

			 option = {
			     color: colors,

			     tooltip: {
			         trigger: 'axis',
			         axisPointer: {
			             type: 'cross'
			         }
			     },
			     grid: {
			         right: '20%'
			     },
			     toolbox: {
			         feature: {
			             dataView: {show: true, readOnly: false},
			             restore: {show: true},
			             saveAsImage: {show: true}
			         }
			     },
			     legend: {
			         data:['蒸发量','降水量','平均温度']
			     },
			     xAxis: [
			         {
			             type: 'category',
			             axisTick: {
			                 alignWithLabel: true
			             },
			             data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
			         }
			     ],
			     yAxis: [
			         {
			             type: 'value',
			             name: '蒸发量',
			             max: 25000,
			             position: 'right',
			             axisLine: {
			                 lineStyle: {
			                     color: colors[0]
			                 }
			             },
			             axisLabel: {
			                 formatter: '{value} ml'
			             },
			             //scale:true
			         },
			         {
			             type: 'value',
			             name: '降水量',
			             max: 2500,
			             position: 'right',
			             offset: 80,
			             axisLine: {
			                 lineStyle: {
			                     color: colors[1]
			                 }
			             },
			             axisLabel: {
			                 formatter: '{value} ml'
			             }
			         },
			         {
			             type: 'value',
			             name: '温度',
			             max: 25,
			             position: 'left',
			             axisLine: {
			                 lineStyle: {
			                     color: colors[2]
			                 }
			             },
			             axisLabel: {
			                 formatter: '{value} °C'
			             }
			         }
			     ],
			     series: [
			         {
			             name:'蒸发量',
			             type:'bar',
			             data:[-20.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]
			         },
			         {
			             name:'降水量',
			             type:'bar',
			             yAxisIndex: 1,
			             data:[-2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
			         },
			         {
			             name:'平均温度',
			             type:'line',
			             yAxisIndex: 2,
			             data:[-2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 20.3, 23.4, 23.0, 16.5, 12.0, 6.2]
			         }
			     ]
			 }; */
			
			var data_chart = echarts.init(document.getElementById('eventAnalysisChart'));
			data_chart.setOption(option);
	    }
	    
		//时间线数据力度切换方法
		function packDataType(data,len,timeDate,eventDate,sumScaleData,avgToneData,maxEventValue,maxSumScale,maxAvgTone){
			var date_news = {};
			var date_num = {};
			for(var i=0;i<data.length;i++){
				var date_str=data[i].date;
        		var date_class=date_str.substring(0,len);
        		if(len==2){
        			date_class = getWeekNum(date_str);
        		}
        		var q1 = data[i].eventValue;
        		var q2 = data[i].sumScale;
        		var q3 = data[i].avgTone;
        		if(date_news[date_class] != undefined){
        			date_num[date_class] = date_num[date_class]+1;
        			var q11 = date_news[date_class].eventValue;
        			var q22 = date_news[date_class].sumScale;
        			var q33 = date_news[date_class].avgTone;
        			date_news[date_class].eventValue = q1 +q11;
        			date_news[date_class].sumScale = q2 +q22;
        			date_news[date_class].avgTone = q3 +q33;
        		}else{
        			date_num[date_class] = 1;
        			var date_new = {};
        			date_new.eventValue = q1;
        			date_new.sumScale = q2;
        			date_new.avgTone = q3;
        			date_news[date_class] = date_new;
        		}
			}
			for(var obj in date_news){
				timeDate.push(obj);
				var eventValue_tem = date_news[obj].eventValue.toFixed(3);
				if(Math.abs(eventValue_tem) > maxEventValue){
					maxEventValue = Math.abs(eventValue_tem);
				}
				eventDate.push(eventValue_tem);
				var sumScale_tem = date_news[obj].sumScale.toFixed(3);
				if(Math.abs(sumScale_tem) > maxSumScale){
					maxSumScale = Math.abs(sumScale_tem);
				}
				sumScaleData.push(sumScale_tem);
				var avgTone_tem = date_news[obj].avgTone;
				avgTone_tem = (avgTone_tem/date_num[obj]).toFixed(3);
				if(Math.abs(avgTone_tem) > maxAvgTone){
					maxAvgTone = Math.abs(avgTone_tem);
				}
				avgToneData.push(avgTone_tem);
			}
			var result = {};
			result['maxEventValue'] = maxEventValue;
			result['maxSumScale'] = maxSumScale;
			result['maxAvgTone'] = maxAvgTone;
			return result;
		}
    	
	    //渲染事件分析时间线图表
	    function initEventTimeLineChart(eventTimeLineData,timeType){
	    	//时间
	    	var timeDate = [];
	    	//事件数
	    	var eventDate = [];
	    	var maxEventValue = 0;
	    	//稳定总值
	    	var sumScaleData =[];
	    	var maxSumScale = 0;
	    	//平均情感值
	    	var avgToneData = [];
	    	var maxAvgTone = 0;
	    	
	    	if(eventTimeLineData.length>0){
	    		
	    		if(timeType == 1){//非日粒度
	    			for(var i=0;i<eventTimeLineData.length;i++){
	    	    		timeDate.push(eventTimeLineData[i].date);
	    	    		eventDate.push(eventTimeLineData[i].eventValue);
	    	    		avgToneData.push(eventTimeLineData[i].avgTone);
	    	    		sumScaleData.push(eventTimeLineData[i].sumScale);
	    	    		//事件数最大值
	    	    		if(Math.abs(eventTimeLineData[i].eventValue) > maxEventValue){
	    	    			maxEventValue  = Math.abs(eventTimeLineData[i].eventValue);
	    	    		}
	    	    		//总稳定最大值、最小值
	    	    		if(Math.abs(eventTimeLineData[i].sumScale) > maxSumScale){
	    	    			maxSumScale  = Math.abs(eventTimeLineData[i].sumScale);
	    	    		}
	    	    		//平均情感值
	    	    		if(Math.abs(eventTimeLineData[i].avgTone) > maxAvgTone){
	    	    			maxAvgTone = Math.abs(eventTimeLineData[i].avgTone);
	    	    		}
	    	    	}
	    		}else if(timeType == 2){//月
	    			var result = packDataType(eventTimeLineData,6,timeDate,eventDate,sumScaleData,avgToneData,maxEventValue,maxSumScale,maxAvgTone);
		    		maxEventValue = result['maxEventValue'];
					maxSumScale = result['maxSumScale'];
					maxAvgTone = result['maxAvgTone'];
	    		}else if(timeType == 3){//年
	    			var result = packDataType(eventTimeLineData,4,timeDate,eventDate,sumScaleData,avgToneData,maxEventValue,maxSumScale,maxAvgTone);
		    		maxEventValue = result['maxEventValue'];
					maxSumScale = result['maxSumScale'];
					maxAvgTone = result['maxAvgTone'];
	    		}else if(timeType == 4){//周
	    			var result = packDataType(eventTimeLineData,2,timeDate,eventDate,sumScaleData,avgToneData,maxEventValue,maxSumScale,maxAvgTone);
		    		maxEventValue = result['maxEventValue'];
					maxSumScale = result['maxSumScale'];
					maxAvgTone = result['maxAvgTone'];
	    		}
	    		
	    	}
	    	
	    	/*
	    	echarts 数据
	    	var timeDate = ['12月1日', '12月2日', '12月3日', '12月4日', '12月5日', '12月6日', '12月7日'];
	    	var eventDate = ['3803', '3703', '3303', '3663', '3503', '3903', '3403'];
	    	var avgToneData = ['1.1','1.2','1.5','1.6','2.2','1.2','1.1'];
	    	var sumScaleData = ['0.3', '0.4', '1', '1.2', '0.2', '0.2', '0.1'];
	    	*/
	    	var XTypelist = ['事件数', '平均情感值', '稳定总值'];
			var color = ['#db8258', 'green', 'yellow']
			var labelstyle1 = {
			    show: true,
			    position: 'top',
			    textStyle: {
			        color: '#fff',
			    }
			};
			var lineStyle1 = {
			    normal: {
			        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
			            offset: 0,
			            color: '#008cff'
			        }, {
			            offset: 1,
			            color: '#005193'
			        }]),
			        opacity: 1,
			
			    }
			};
			var lineStyle2 = {
			    normal: {
			        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
			            offset: 0,
			            color: '#007a55'
			        }, {
			            offset: 1,
			            color: '#007a55'
			        }]),
			        opacity: 1,
			    }
			};
			var lineStyle3 = {
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
			};
			var lineStyle4 = {
			    normal: {
			        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
			            offset: 0,
			            color: '#eda000'
			        }, {
			            offset: 1,
			            color: '#ce42d1'
			
			        }]),
			        opacity: 1,
			    }
			};
			
			
			option = {
				backgroundColor: '#1b233482',
				grid:{
					left:80,
					right:160
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
			        "trigger": "axis",
			        "axisPointer": {
			            "type": "shadow",
			            textStyle: {
			                color: "#fff"
			            }
			
			        },
			    },
			
			
			 legend: {
			        data: XTypelist,
			        textStyle: {
			            color: "white"
			        }
			    },
			    axisLabel: {
		            show: true,
		            textStyle: {
		                color: "#f9f9f9" //X轴文字颜色
		            },
	                formatter: '{value}'
	            },
			    xAxis: {
			        data: timeDate,
			        axisLine: {
			            lineStyle: {
			                color: '#f9f9f9'
			            }
			        },
			        axisLabel: {
			            show: true,
			            textStyle: {
			                color: "#f9f9f9" 
			            }
			        }
			    },
			    yAxis: [{
			            type: 'value',
			            name: '事件数',
			            min: -(maxEventValue),
			            max: maxEventValue,
			            position: 'left',
			            axisLine: {
			                lineStyle: {
			                    color: '#f9f9f9'
			                }
			            },
			            axisLabel: {
				            show: true,
				            textStyle: {
				                color: "#f9f9f9" 
				            },
			                formatter: '{value}'
			            },
			            splitLine: {
			                show: false,
			                lineStyle: {
			                    color: '#f9f9f9'
			                }
			            },
			        },
			        {
			            type: 'value',
			            name: '平均情感值',
			            min: -(maxAvgTone),
			            max:  maxAvgTone,
			            position: 'right',
			            axisLine: {
			                lineStyle: {
			                    /* color: color[2] */
			        			color: '#f9f9f9'
			                }
			            },
			            axisLabel: {
				            show: true,
				            textStyle: {
				                color: "#f9f9f9" 
				            },
			                formatter: '{value}',
			            },
			            splitLine: {
			                show: false,
			                lineStyle: {
			                    color: '#0177d4'
			                }
			            },
			        },
			        {
			            type: 'value',
			            name: '稳定总值',
			            min:  -(maxSumScale),
			            max: maxSumScale,
			            position: 'right',
			            offset: 80,
			            axisLine: {
			                lineStyle: {
			                   /*  color: color[1] */
			                	 color: '#f9f9f9'
			                }
			            },
			            axisLabel: {
				            show: true,
				            textStyle: {
				                color: "#f9f9f9" 
				            },
			                formatter: '{value}'
			            },
			            splitLine: {
			                show: false,
			                lineStyle: {
			                    color: '#0177d4'
			                }
			            },
			        }
			    ],
			    series: [{
			            name: XTypelist[0],
			            type: 'line',
			            barWidth: 25,
			            smooth:true,
			            symbol: 'circle',
			            itemStyle: lineStyle1,
			            label: labelstyle1,
			            data: eventDate
			        },
			        {
			            name: XTypelist[1],
			            type: 'line',
			            yAxisIndex: 1,
			            symbol: 'circle',
			            smooth:true,
			            data: avgToneData,
			            label: labelstyle1,
			            itemStyle: lineStyle3,
			            
			        }, {
			            name: XTypelist[2],
			            type: 'line',
			            barWidth: 25,
			            symbol: 'circle',
			            yAxisIndex: 2,
			            smooth:true,
			            label: labelstyle1,
			            itemStyle: lineStyle2,
			            data: sumScaleData
			        }
			
			    ]
			};
			var data_chart = echarts.init(document.getElementById('eventTimeLineChart'));
			data_chart.setOption(option);
	    }
	    //将结果数据（配置、即时查询）渲染图表
	    function renderData(data){
	    	
	    	//真实数据
	    	var evAnalyResultData = data.evAnalyResultData;
	    	var ctryTimeLineData = data.ctryTimeLineData;
	    	var stateTimeLineData = data.stateTimeLineData;
	    	var cityTimeLineData = data.cityTimeLineData;
	    	
	    	//模拟数据
	    	//事件分析结果数据(国家、州省、城市)
	    	//无数据时
	    	//var evAnalyResultData = {"countryData":[],"stateData":[],"cityData":[]};
	    	//有数据时
	        /* var evAnalyResultData = {
	   								"countryData":[{"key":"中国dddddd","eventValue":3,"avgTone":3,"sumScale":3},{"key":"美国dddddd","eventValue":4,"avgTone":4,"sumScale":4},{"key":"日本","eventValue":2,"avgTone":5,"sumScale":6}],
	   								"stateData":[{"key":"河北","eventValue":1,"avgTone":2,"sumScale":2},{"key":"上海","eventValue":11,"avgTone":22,"sumScale":24},{"key":"河南","eventValue":2,"avgTone":5,"sumScale":6}],
	   								"cityData":[{"key":"田径","eventValue":1,"avgTone":2,"sumScale":2},{"key":"东京","eventValue":11,"avgTone":22,"sumScale":24},{"key":"北京","eventValue":2,"avgTone":5,"sumScale":6}]
	    							};
	    	
	    	var ctryTimeLineData = {
    				"中国dddddd":[{"date":"20180101","eventValue":1,"avgTone":1,"sumScale":1},{"date":"20180202","eventValue":1,"avgTone":1,"sumScale":1},{"date":"20180203","eventValue":1,"avgTone":1,"sumScale":1}],
	    			"美国dddddd":[{"date":"20180101","eventValue":2,"avgTone":2,"sumScale":2},{"date":"20180102","eventValue":2,"avgTone":2,"sumScale":2}],
	    			"日本":[{"date":"20180101","eventValue":1,"avgTone":2,"sumScale":2},{"date":"20180102","eventValue":11,"avgTone":22,"sumScale":24}],
	    			"河北":[{"date":"20180101","eventValue":1,"avgTone":2,"sumScale":2},{"date":"20180102","eventValue":11,"avgTone":22,"sumScale":24}],
	    			"上海":[{"date":"20180101","eventValue":1,"avgTone":2,"sumScale":2},{"date":"20180102","eventValue":11,"avgTone":22,"sumScale":24}],
	    			"河南":[{"date":"20180101","eventValue":1,"avgTone":2,"sumScale":2},{"date":"20180102","eventValue":11,"avgTone":22,"sumScale":24}],
	    			"田径":[{"date":"20180101","eventValue":1,"avgTone":2,"sumScale":2},{"date":"20180102","eventValue":11,"avgTone":22,"sumScale":24}],
	    			"东京":[{"date":"20180101","eventValue":1,"avgTone":2,"sumScale":2},{"date":"20180102","eventValue":11,"avgTone":22,"sumScale":24}],
	    			"北京":[{"date":"20180101","eventValue":1,"avgTone":2,"sumScale":2},{"date":"20180102","eventValue":11,"avgTone":22,"sumScale":24}]
    				};
	    	var stateTimeLineData = {
    				"中国dddddd":[{"date":"20180101","eventValue":1,"avgTone":1,"sumScale":1},{"date":"20180202","eventValue":1,"avgTone":1,"sumScale":1},{"date":"20180203","eventValue":1,"avgTone":1,"sumScale":1}],
	    			"美国dddddd":[{"date":"20180101","eventValue":2,"avgTone":2,"sumScale":2},{"date":"20180102","eventValue":2,"avgTone":2,"sumScale":2}],
	    			"日本":[{"date":"20180101","eventValue":1,"avgTone":2,"sumScale":2},{"date":"20180102","eventValue":11,"avgTone":22,"sumScale":24}],
	    			"河北":[{"date":"20180101","eventValue":1,"avgTone":2,"sumScale":2},{"date":"20180102","eventValue":11,"avgTone":22,"sumScale":24}],
	    			"上海":[{"date":"20180101","eventValue":1,"avgTone":2,"sumScale":2},{"date":"20180102","eventValue":11,"avgTone":22,"sumScale":24}],
	    			"河南":[{"date":"20180101","eventValue":1,"avgTone":2,"sumScale":2},{"date":"20180102","eventValue":11,"avgTone":22,"sumScale":24}],
	    			"田径":[{"date":"20180101","eventValue":1,"avgTone":2,"sumScale":2},{"date":"20180102","eventValue":11,"avgTone":22,"sumScale":24}],
	    			"东京":[{"date":"20180101","eventValue":1,"avgTone":2,"sumScale":2},{"date":"20180102","eventValue":11,"avgTone":22,"sumScale":24}],
	    			"北京":[{"date":"20180101","eventValue":1,"avgTone":2,"sumScale":2},{"date":"20180102","eventValue":11,"avgTone":22,"sumScale":24}]
    				};
	    	var cityTimeLineData = {
    				"中国dddddd":[{"date":"20180101","eventValue":1,"avgTone":1,"sumScale":1},{"date":"20180202","eventValue":1,"avgTone":1,"sumScale":1},{"date":"20180203","eventValue":1,"avgTone":1,"sumScale":1}],
	    			"美国dddddd":[{"date":"20180101","eventValue":2,"avgTone":2,"sumScale":2},{"date":"20180102","eventValue":2,"avgTone":2,"sumScale":2}],
	    			"日本":[{"date":"20180101","eventValue":1,"avgTone":2,"sumScale":2},{"date":"20180102","eventValue":11,"avgTone":22,"sumScale":24}],
	    			"河北":[{"date":"20180101","eventValue":1,"avgTone":2,"sumScale":2},{"date":"20180102","eventValue":11,"avgTone":22,"sumScale":24}],
	    			"上海":[{"date":"20180101","eventValue":1,"avgTone":2,"sumScale":2},{"date":"20180102","eventValue":11,"avgTone":22,"sumScale":24}],
	    			"河南":[{"date":"20180101","eventValue":1,"avgTone":2,"sumScale":2},{"date":"20180102","eventValue":11,"avgTone":22,"sumScale":24}],
	    			"田径":[{"date":"20180101","eventValue":1,"avgTone":2,"sumScale":2},{"date":"20180102","eventValue":11,"avgTone":22,"sumScale":24}],
	    			"东京":[{"date":"20180101","eventValue":1,"avgTone":2,"sumScale":2},{"date":"20180102","eventValue":11,"avgTone":22,"sumScale":24}],
	    			"北京":[{"date":"20180101","eventValue":1,"avgTone":2,"sumScale":2},{"date":"20180102","eventValue":11,"avgTone":22,"sumScale":24}]
    				}; */
    		
    		//功能切换的全局变量
    		var trativeLevel = "国家";
    		var timeType = 1;
    		var key;
    		
    		//切换功能事件处理
    		//时间线图表的时间粒度切换
			$('.circle').on('click',function(){
				$(this).addClass('circleon').siblings('.circle').removeClass('circleon');
				//将timeType的值付给全局变量
				timeType = $(this).attr("val");
				//渲染数据
				var timeTineData;
				if(trativeLevel =="国家"){
					timeTineData = ctryTimeLineData;
				}else if(trativeLevel =="州省"){
					timeTineData = stateTimeLineData;
				}else{
					timeTineData = cityTimeLineData;
				}
				//console.log("时间线数据"+timeTineData);
				initEventTimeLineChart(timeTineData[key],timeType);
				
			})
			//国家/州省/城市的切换
			$(".astleve").on('click',function(){
				trativeLevel = $(this).text().trim();
				//时间线标题名称修改
				$(".trapezoid").text(trativeLevel+"-事件分析");		
				//将时间粒度修重置为日粒度
				$(".circleon").removeClass("circleon");
				$("#dayCondtion").addClass("circleon");
				timeType = 1;
				
				//获取第一个option的value值进行获取数据并付给全局变量
				var eventAnalysisData;
				if(trativeLevel =="国家"){
					eventAnalysisData = evAnalyResultData.countryData;
				}else if(trativeLevel =="州省"){
					eventAnalysisData = evAnalyResultData.stateData;
				}else{
					eventAnalysisData = evAnalyResultData.cityData;
				}
				
				//将事件分析数据进行渲染
				initEventAnalysisChart(eventAnalysisData);
				
				//将事件线数据进行渲染
				//将option清空并加入新的option
				//渲染事件时间线分析-左侧下拉框数据
		    	$(".drop-down-content").empty();
		    	$(".title_T").text('');
		    	$('.drop-down-content').css("display","none");
				if(eventAnalysisData.length>0){
					for(var i =0;i<eventAnalysisData.length;i++){
						if(i==0){
							key = eventAnalysisData[i].key;
							$(".title_T").text(trativeLevel+'：'+eventAnalysisData[i].key+' 事件数：'+eventAnalysisData[i].eventValue+' 稳定总值：'+eventAnalysisData[i].sumScale+' 平均情感值：'+eventAnalysisData[i].avgTone);
						}
			        	$('.drop-down-content').append('<li value="'+eventAnalysisData[i].key+'" class="li_1 li">'+trativeLevel+'：'+eventAnalysisData[i].key+' 事件数：'+eventAnalysisData[i].eventValue+' 稳定总值：'+eventAnalysisData[i].sumScale+' 平均情感值：'+eventAnalysisData[i].avgTone +'</li>');
			    	}
					//下拉康点击时间
			    	$(".li_1").on('click',function(){
			    		key = $(this).attr("value").trim();
			    		$(".title_T").text($(this).text());
			    		$('.drop-down-content').css("display","none");
			    		//将key赋给全局变量
			    		var timeTineData;
						if(trativeLevel =="国家"){
							timeTineData = ctryTimeLineData;
						}else if(trativeLevel =="州省"){
							timeTineData = stateTimeLineData;
						}else{
							timeTineData = cityTimeLineData;
						}
			    		initEventTimeLineChart(timeTineData[key],timeType);
			    	});
					//渲染数据
			    	var timeTineData;
					if(trativeLevel =="国家"){
						timeTineData = ctryTimeLineData;
					}else if(trativeLevel =="州省"){
						timeTineData = stateTimeLineData;
					}else{
						timeTineData = cityTimeLineData;
					}
					initEventTimeLineChart(timeTineData[key],timeType);
					
				}else{
					initEventTimeLineChart([]);
				}
				
			})
    		
    		//初始化时间线数据,默认国家展示
    		$(".country").click();
    		
	    }
	 	 //省州城市字体样式切换
	    $('.Province').click(function(){
	    	$('.city').css("background-color","#024a73");
	    	$('.city1').css("color","#FFF");
	    	$('.Province').css("background-color","#00aeff");
	    	$('.Province1').css("color","#FFF");
	    	$('.country').css("background-color","#024a73");
	    	$('.country1').css("color","#FFF");
	    })
	    $('.city').click(function(){
	    	$('.city').css("background-color","#00aeff");
	    	$('.city1').css("color","#FFF");
	    	$('.Province').css("background-color","#024a73");
	    	$('.Province1').css("color","#FFF");
	    	$('.country').css("background-color","#024a73");
	    	$('.country1').css("color","#FFF");
	    })
	    $('.country').click(function(){
	    	$('.city').css("background-color","#024a73");
	    	$('.city1').css("color","#FFF");
	    	$('.Province').css("background-color","#024a73");
	    	$('.Province1').css("color","#FFF");
	    	$('.country').css("background-color","#00aeff");
	    	$('.country1').css("color","#FFF");
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
	    $('.li_1').hover(function(){
	    	$('.li_1').css("background","#024a73")
	    })
	    
	</script>
	
	
</html>