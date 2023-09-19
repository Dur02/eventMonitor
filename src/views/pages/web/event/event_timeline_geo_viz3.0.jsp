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
		    left: 2.5%;
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
		    left: 2.5%;
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
    		left: 57px;
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
            left: 474px;
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
							<span class="trapezoid1">事件时间线分析</span>
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
							<span class="circle" val="3"></span><span>年</span><span class="circle" val="2"></span><span>月</span><span class="circle circleon" val="1" id="dayCondtion"></span><span>日</span>
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
								alert("加载失败");
							}
							console.log("data"+JSON.stringify(data));
							renderData(data);
							endLoad();
						}
					});
		}
	    
		//渲染事件分析图表
	    function initEventAnalysisChart(eventAnalysisData){
			console.log(JSON.stringify("eventAnalysisData"+eventAnalysisData));
	    	//时间
	    	var xAxisData = [];
	    	//事件数
	    	var eventDate = [];
	    	var minEventValue = 0;
	    	var maxEventValue = 0;
	    	
	    	for(var i=0;i<eventAnalysisData.length;i++){
	    		xAxisData.push(eventAnalysisData[i].key);
	    		eventDate.push(eventAnalysisData[i].eventValue);
	    		//事件数最大值
	    		if(eventAnalysisData[i].eventValue>maxEventValue){
	    			maxEventValue  = eventAnalysisData[i].eventValue;
	    		}
	    	}
	    	
	    	
	    	/*echarts数据 
	    	var xAxisData = ['12月1日', '12月2日', '12月3日', '12月4日', '12月5日', '12月6日', '12月7日'];
			var eventDate = ['3803', '3703', '3303', '3663', '3503', '3903', '3403'];
			var avgToneData = ['1.1','1.2','1.5','1.6','2.2','1.2','1.1'];
			var sumScaleData = ['0.3', '0.4', '1', '1.2', '0.2', '0.2', '0.1']; */
			
			var XTypelist = ['事件数'];
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
				grid:{
					bottom:20,
					left:80,
					right:60
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
				 	show:false,
			        data: XTypelist,
			        textStyle: {
			            color: "white"
			        }
			    },
			
			    xAxis: {
			        data: xAxisData,
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
			    yAxis: [{
			            type: 'value',
			            name: '事件数',
			            min: minEventValue,
			            max: maxEventValue,
			            position: 'left',
			            axisLine: {
			                lineStyle: {
			                    color: '#0177d4'
			                }
			            },
			            axisLabel: {
			                color: 'white',
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
			            barWidth: 25,
			            itemStyle: lineStyle1,
			            label: labelstyle1,
			            data: eventDate
			        }
			    ]
			};
			var data_chart = echarts.init(document.getElementById('eventAnalysisChart'));
			data_chart.setOption(option);
	    }
	    
    	//js数组去重
    	Array.prototype.distinct = function(){
									 var arr = this,
									  result = [],
									  i,
									  j,
									  len = arr.length;
									 for(i = 0; i < len; i++){
									  for(j = i + 1; j < len; j++){
									   if(arr[i] === arr[j]){
									    j = ++i;
									   }
									  }
									  result.push(arr[i]);
									 }
									 return result;
								};
    	
	    //渲染事件分析时间线图表
	    function initEventTimeLineChart(eventTimeLineData,timeType){
	    	console.log("eventTimeLineData="+JSON.stringify(eventTimeLineData));
	    	//时间
	    	var timeDate = [];
	    	//事件数
	    	var eventDate = [];
	    	var minEventValue = 0;
	    	var maxEventValue = 0;
	    	
	    	if(eventTimeLineData.length>0){
	    		
	    		if(timeType != 1){//非日粒度
	    			//将日粒度数据去重
		    		for(var i=0;i<eventTimeLineData.length;i++){
		    			//根据时间粒度判断
			    		if(timeType == 2){//月
			    			timeDate.push(eventTimeLineData[i].date.substring(0,6));
			    		}else if(timeType == 3){//年
			    			timeDate.push(eventTimeLineData[i].date.substring(0,4));
			    		}
	    	    	}
		    		timeDate = timeDate.distinct();
		    		//根据去重数据对对应的数据进行累加处理
		    		for(var j =0;j<timeDate.length;j++){
		    			var tem_eventValue = 0;
		    			for(var i=0;i<eventTimeLineData.length;i++){
		    				
		    				if(timeType == 2){//月
		    					if(eventTimeLineData[i].date.substring(0,6)==timeDate[j]){
				    				tem_eventValue+= eventTimeLineData[i].eventValue;
				    			}
				    		}else if(timeType == 3){//年
				    			if(eventTimeLineData[i].date.substring(0,4)==timeDate[j]){
				    				tem_eventValue+= eventTimeLineData[i].eventValue;
				    			}
				    		}
			    			
		    	    	}
		    			
		    			eventDate.push(tem_eventValue);
		    			maxEventValue = Math.max.apply(null, eventDate);
		    		}
		    		
	    		}else{//处理日粒度数据
	    			for(var i=0;i<eventTimeLineData.length;i++){
	    	    		timeDate.push(eventTimeLineData[i].date);
	    	    		eventDate.push(eventTimeLineData[i].eventValue);
	    	    		//事件数最大值
	    	    		if(eventTimeLineData[i].eventValue>maxEventValue){
	    	    			maxEventValue  = eventTimeLineData[i].eventValue;
	    	    		}
	    	    	}
	    		}
	    		
	    	}
	    	/* console.log("timeDate"+JSON.stringify(timeDate));
			console.log("eventDate"+JSON.stringify(eventDate));
			console.log("avgToneData"+JSON.stringify(avgToneData));
			console.log("sumScaleData"+JSON.stringify(sumScaleData));  */
	    	
	    	/*
	    	echarts 数据
	    	var timeDate = ['12月1日', '12月2日', '12月3日', '12月4日', '12月5日', '12月6日', '12月7日'];
	    	var eventDate = ['3803', '3703', '3303', '3663', '3503', '3903', '3403'];
	    	var avgToneData = ['1.1','1.2','1.5','1.6','2.2','1.2','1.1'];
	    	var sumScaleData = ['0.3', '0.4', '1', '1.2', '0.2', '0.2', '0.1'];
	    	*/
	    	var XTypelist = ['事件数'];
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
				grid:{
					//bottom:200,
					left:80,
					right:60
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
			 legend: {
				 	show:false,
			        data: XTypelist,
			        textStyle: {
			            color: "white"
			        }
			    },
			
			    xAxis: {
			        data: timeDate,
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
			    yAxis: [{
			            type: 'value',
			            name: '事件数',
			            min: minEventValue,
			            max: maxEventValue,
			            position: 'left',
			            axisLine: {
			                lineStyle: {
			                    color: '#0177d4'
			                }
			            },
			            axisLabel: {
			                color: 'white',
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
			            itemStyle: lineStyle1,
			            label: labelstyle1,
			            data: eventDate
			        }
			    ]
			};
			var data_chart = echarts.init(document.getElementById('eventTimeLineChart'));
			data_chart.setOption(option);
	    }
	    //将结果数据（配置、即时查询）渲染图表
	    function renderData(data){
	    	
	    	$(window).resize(function() {
	    		renderData(data);
			});
	    	
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
	   								"countryData":[{"key":"中国dddddd","eventValue":3},{"key":"美国dddddd","eventValue":4},{"key":"日本","eventValue":2}],
	   								"stateData":[{"key":"河北","eventValue":1},{"key":"上海","eventValue":11},{"key":"河南","eventValue":2}],
	   								"cityData":[{"key":"田径","eventValue":1},{"key":"东京","eventValue":11},{"key":"北京","eventValue":2}]
	    							};  */
	    	
			//时间线结果数据(国家、州省、城市)
    		//无数据时
    		//var evTimeLineResultData = {};
    		//有数据时
	    	/* var ctryTimeLineData = {
    				"中国dddddd":[{"date":"20180101","eventValue":1},{"date":"20180202","eventValue":1},{"date":"20180203","eventValue":1}],
	    			"美国dddddd":[{"date":"20180101","eventValue":2},{"date":"20180102","eventValue":2}],
	    			"日本":[{"date":"20180101","eventValue":1},{"date":"20180102","eventValue":11}],
	    			"河北":[{"date":"20180101","eventValue":1},{"date":"20180102","eventValue":11}],
	    			"上海":[{"date":"20180101","eventValue":1},{"date":"20180102","eventValue":11}],
	    			"河南":[{"date":"20180101","eventValue":1},{"date":"20180102","eventValue":11}],
	    			"田径":[{"date":"20180101","eventValue":1},{"date":"20180102","eventValue":11}],
	    			"东京":[{"date":"20180101","eventValue":1},{"date":"20180102","eventValue":11}],
	    			"北京":[{"date":"20180101","eventValue":1},{"date":"20180102","eventValue":11}]
    				};
	    	var stateTimeLineData = {
    				"中国dddddd":[{"date":"20180101","eventValue":1},{"date":"20180202","eventValue":1},{"date":"20180203","eventValue":1}],
	    			"美国dddddd":[{"date":"20180101","eventValue":2},{"date":"20180102","eventValue":2}],
	    			"日本":[{"date":"20180101","eventValue":1},{"date":"20180102","eventValue":11}],
	    			"河北":[{"date":"20180101","eventValue":1},{"date":"20180102","eventValue":11}],
	    			"上海":[{"date":"20180101","eventValue":1},{"date":"20180102","eventValue":11}],
	    			"河南":[{"date":"20180101","eventValue":1},{"date":"20180102","eventValue":11}],
	    			"田径":[{"date":"20180101","eventValue":1},{"date":"20180102","eventValue":11}],
	    			"东京":[{"date":"20180101","eventValue":1},{"date":"20180102","eventValue":11}],
	    			"北京":[{"date":"20180101","eventValue":1},{"date":"20180102","eventValue":11}]
    				};
	    	var cityTimeLineData = {
    				"中国dddddd":[{"date":"20180101","eventValue":1},{"date":"20180202","eventValue":1},{"date":"20180203","eventValue":1}],
	    			"美国dddddd":[{"date":"20180101","eventValue":2},{"date":"20180102","eventValue":2}],
	    			"日本":[{"date":"20180101","eventValue":1},{"date":"20180102","eventValue":11}],
	    			"河北":[{"date":"20180101","eventValue":1},{"date":"20180102","eventValue":11}],
	    			"上海":[{"date":"20180101","eventValue":1},{"date":"20180102","eventValue":11}],
	    			"河南":[{"date":"20180101","eventValue":1},{"date":"20180102","eventValue":11}],
	    			"田径":[{"date":"20180101","eventValue":1},{"date":"20180102","eventValue":11}],
	    			"东京":[{"date":"20180101","eventValue":1},{"date":"20180102","eventValue":11}],
	    			"北京":[{"date":"20180101","eventValue":1},{"date":"20180102","eventValue":11}]
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
				//根据国家/州省/城市寻找对应的时间线数据
				var timeTineData;
				if(trativeLevel =="国家"){
					timeTineData = ctryTimeLineData;
				}else if(trativeLevel =="州省"){
					timeTineData = stateTimeLineData;
				}else{
					timeTineData = cityTimeLineData;
				}
				console.log("timeTineData[key]"+timeTineData[key]);
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
					eventAnalysisData = evAnalyResultData.countryData ;
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
		    	$(".trapezoid1").text("事件时间线分析");
				if(eventAnalysisData.length>0){
					for(var i =0;i<eventAnalysisData.length;i++){
						if(i==0){
							key = eventAnalysisData[i].key;
							$(".trapezoid1").text((key.length>6?key.substring(0,6)+".":key)+"-事件时间线分析");	
							$(".title_T").text(trativeLevel+'：'+eventAnalysisData[i].key+' 事件数：'+eventAnalysisData[i].eventValue);
						}
						//value='"+eventAnalysisData[i].key+"'>国家："+eventAnalysisData[i].key+" 事件数："+eventAnalysisData[i].eventValue+" 稳定总值："+eventAnalysisData[i].sumScale+" 事件数："+eventAnalysisData[i].eventValue+" 稳定总值："+eventAnalysisData[i].avgTone+"</option>");
			        	$('.drop-down-content').append('<li value="'+eventAnalysisData[i].key+'" class="li_1 li">'+trativeLevel+'：'+eventAnalysisData[i].key+' 事件数：'+eventAnalysisData[i].eventValue +'</li>');
			    	}
					//下拉框点击时间
			    	$(".li_1").on('click',function(){
			    		key = $(this).attr("value").trim();
			    		$(".trapezoid1").text((key.length>6?key.substring(0,6)+".":key)+"-事件时间线分析");	
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
					//key = "中国";
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