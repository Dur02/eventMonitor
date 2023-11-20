<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>事件时间线</title>
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
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/jquery-1.11.1.min.js"></script>
<script src="<%=basePath%>/static/js/config/config.js"></script>
<script src="<%=basePath%>/static/lib/jquery.pagination.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/echarts.js"></script>
<style>
	svg.wordCloud {
    width: 1000px;
    height: 500px;
	}
	svg.wordCloud g {
    transform: translate(500px, 250px);
    -moz-transform: translate(500px, 250px);
    -webkit-transform: translate(350px, 250px);
	}
	.index_bottomw{
		background-image: url(<%=basePath%>/static/css/img/bg_new.png);
		background-repeat: no-repeat;
		background-size: 100% 100%;
		position: relative;
		overflow: hidden;
		height: calc(100% - 31px);
    	width: 100%;
	}
	.bov {
    	border-radius: 3px;
    }
    .column_line{
    	height: 358px;
	    overflow: hidden;
	    width: 100%;
	    text-align: left;
	    margin-top: -38px;
	    /* border: 1px solid #1b2334; */
    }
    .column{
    	height:314px;
	    overflow: hidden;
	    width: 100%;
	    text-align: left;
	    margin-top: -38px;
    }
    .country_sort {
	    width: 11%;
	    height: 38px;
	    background: url(../../static/images/zhengjian.png) no-repeat center
	     center;
	    background-size: 100% 100%;
	    margin: 0 auto;
	    text-align: center;
	    /* margin-top:10px; */
	    line-height: 38px;
	}
   .country_sort span:nth-child(1) {
	    /* min-width: 118px; */
	    height: 14px;
	    font-size: 14px;
	    font-family: SimSun;
	    font-weight: bold;
	    color: rgba(255, 255, 255, 1);
	    line-height: 38px;
	    margin: 0 42px 0 33px;
	}
    .float_right {
        width: 190px;
	    display: flex;
	    height: 38px;
	    align-items: center;
	    float: right;
	    margin: -2.2% 3% 0 0;
	    cursor: pointer;
	    font-family: SimSun;
	    font-weight: 400;
	    color: rgb(234, 235, 237);
	}
	.circle {
	    width: 15px;
	    height: 15px;
	    border: 1px solid rgba(0,193,222,1);
	    border-radius: 50%;
	    display: inline-block;
	    margin: 0 2px 0 2px;
		}
	.circleon {
	    background: rgba(0,193,222,1);
	}
	.col_wai{
	    height:409px;
	    overflow: hidden;
	    width: 100%;
	    text-align: left;
	    margin-top:10px;
	    margin-bottom:10px;
	    background-color:#1b233482;
	    border: 1px solid #1b2334;
	}
	.col_nei{
	    height:362px;
	    overflow: hidden;
	    width: 100%;
	    text-align: left;
	    background-color:#1b233482;
	    border: 1px solid #1b2334;
	}
	/*
		热力图扩大后显示区域
	*/
	.maxBox{
	    top: 8%;
	    position: absolute;
	    border: 1px solid #1c80b9;
	    width: 96%;
	    height: 85%;
	    left: 2%;
	    right: 8%;
	    z-index: 99;
        border-radius: 11px;
    	background-color: #0e1529;
    	display: none;
	}
	/* 遮罩 */
	.zeZhao {
		width: 100%;
		height: 100%;
		background: black;
		opacity: 0.8;
		display: none;
		position: absolute;
		top: 0;
		left: 0;
		z-index: 10;
	}
	#hotCharts_max{
    	width: 100%;
    	height: 93%;
	}
	/*去扩大*/
	.toMax{
        position: absolute;
	    cursor: pointer;
	    width: 22px;
	    height: 22px;
	    background: url(/monitorsystem/static/images/toMax.png) no-repeat;
	    top: 8px;
	    right: 26px;		
	}
	/*去缩小*/
	.toMin{
        position: absolute;
	    margin-right: 19px;
	    margin-top: 10px;
	    cursor: pointer;
	    width: 22px;
	    height: 22px;
	    background: url(/monitorsystem/static/images/toMin.png) no-repeat;
	    top: -2px;
	    right: -1px;	
	}
</style>
</head>
<body>
	<div class="index_top clearfix">
		<h3 class="fl title">事件库分析 > 事件时间线</h3>
	</div>
	<div class="index_bottomw">
		<!-- 遮罩 -->
		<div class="zeZhao"></div>
		<!-- 显示图 -->
		<div class="data show" >
			<input type="hidden" id="moduleCode" value="${moduleCode}">
			<div class="maxBox">
                   <h3 class="country_sort"><span>事件时间线分析</span> 
               		</h3>
               		<div class="float_right">
						<span>时间粒度：</span>
						<span class="circle circle_hot_max" value="2"></span><span>月</span><span class="circle circle_hot_max" value="4" id="week"></span><span>周</span><span class="circle circle_hot_max circleon" value="1" id="hot_day_max"></span><span>日</span>
				    </div>
				    <div class="toMin"></div>
                	<div id="hotCharts_max" ></div>
			</div>
			<div class="row" style="margin-top: 12px!important">
				<div class="col-md-12">
		            <div class="col-md-12 bov" style="margin-top: 35px;">
		                <div class="col_wai">
		                    <h3 class="country_sort"><span>事件时间线展示</span> 
	                			<%-- <div  class="help" onmouseenter="showChartInfo(2,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div> --%>
	                		</h3>
	                		<div class="float_right">
								<span>时间粒度：</span>
								<span class="circle circle_timeLine" value="3"></span><span>年</span><span class="circle circle_timeLine" value="2"></span><span>月</span><span class="circle circle_timeLine" value="4" id="week"></span><span>周</span><span class="circle circleon circle_timeLine" value="1" id="day"></span><span>日</span>
						    </div>
						    <div id="column_chart" class="column_line"></div>
		                </div>
		                
		                    
		               
		            </div>
		        </div>
	        </div>
           	<div class="row">
	            <div class="col-md-12">
		            <div class="col-md-12 bov" >
		                 <div class="col_nei">
		                   <h3 class="country_sort"><span>事件时间线分析</span> 
	                			<%-- <div  class="help" onmouseenter="showChartInfo(2,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div> --%>
	                		</h3>
	                		<div class="float_right">
								<span>时间粒度：</span>
								<span class="circle circle_hot" value="2"></span><span>月</span><span class="circle circle_hot" value="4" id="week"></span><span>周</span><span class="circle circle_hot circleon" value="1" id="hot_day"></span><span>日</span>
						    </div>
						    <div class="toMax"></div>
		                	<div id="hotCharts" class="column"></div>
		                </div>
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
<script src="<%=basePath%>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath%>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath%>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath%>/static/js/perfect-scrollbar.js"></script>
<script src="<%=basePath%>/static/js/sec2.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/base.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/timeline/echarts.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/timeline/echarts-gl.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/timeline/bmap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/timeline/dataTool.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/timeline/world.js"></script>
 <script src="<%=basePath%>/static/Visualization/js/amcharts/amcharts.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/themes/light.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amchart_util.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/ammap.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/ammap_util.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/export/export.js" type="text/javascript"></script> 
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/leaflet-src.js"></script>
<script type="text/javascript"
src="<%=basePath%>/static/Visualization/js/leaflet/leaflet.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/tile.stamen.js"></script>
<script type="text/javascript"
src="<%=basePath%>/static/Visualization/js/leaflet/geohash.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/underscore-min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/moment.min.js" ></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/leaflet-dvf.js"></script>
<script type="text/javascript"
src="<%=basePath%>/static/Visualization/js/leaflet/leaflet.dvf.experimental.js"></script>
<script src="<%=basePath%>/static/Visualization/datamap/d3.min.js"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/serial.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/pie.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/xy.js" type="text/javascript"></script>
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
<script src="<%=basePath%>/static/js/jquery.combo.select.js"></script>
<script src="<%=basePath%>/static/js/perfect-scrollbar.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/downLoad.js"></script>	
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<script type="text/javascript">
    var date_data;
	$(function(){
		/* //美化图表展示界面的右侧滚动条
		index_bottom_perfectScrollbar(); */
		$(".bizhong").show();
		//处理配置
		handleConfigs();
		//控制Tone字段的显示问题
		//美化滚动条
		glorifyComboSelect();
		gkgToneIsShow();
	});
	
	////时间线数据力度切换方法
	function packDataType(len){
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
         		date_new[dateValue] = nnn + date_data[i].value*1;
         	}else{
            	date_new[dateValue] = date_data[i].value*1;
         	}
         }
         var quadclass_value=[];
         for(var obj in date_new){
        	var y = String(date_new[obj]).indexOf(".") + 1;
     		var d1={
     			key:obj,
     			value:y>0?date_new[obj].toFixed(2):date_new[obj]
   	      	}	
     		quadclass_value.push(d1);
		 }
         showline(quadclass_value);
	}
	//年月日选中点击事件
	$('.circle_timeLine').on('click',function(){
		$(this).addClass('circleon').siblings('.circle').removeClass('circleon');
		selectVal=$(this).attr('value');
		if(selectVal=="1"){
			showline(date_data);
		}
		if(selectVal=="2"){
			packDataType(6);
           }
		if(selectVal=="3"){
			packDataType(4);
           }
		if(selectVal=="4"){
			packDataType(2);
        }
	})
	//给热力图的时间粒度绑定点击事件
	$('.circle_hot').on('click',function(){
		$(this).addClass('circleon').siblings('.circle').removeClass('circleon');
		selectVal=$(this).attr('value');
		showhot(date_data,selectVal,'hotCharts','14%','3%','3%','20%');
	})
	
	//给扩大后的热力图的时间粒度绑定点击事件
	$('.circle_hot_max').on('click',function(){
		$(this).addClass('circleon').siblings('.circle').removeClass('circleon');
		selectVal=$(this).attr('value');
		showhot_max(date_data,selectVal,'hotCharts_max','5%','3%','3%','10%');
	})
	
	
	var myChart;
	var timeline_chart;
	var myChart_max;
	
	function render(configId){
		startLoad();
		var resultcode = 'ALL';
		$.ajax({
			url:'<%=basePath%>/search/event_timeline_viz/'+configId,
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
		        	 myChart.resize();
		        	 timeline_chart.resize();
		        	 myChart_max.resize();
		        }
			}
		});
	}
	
		function renderData(data){
			date_data=data.date_data;
			showline(date_data);
			//默认日粒度热力图数据显示
             $("#hot_day").click();
            //默认日粒度显示
            $("#day").click();
            //将遮罩关闭
            $(".toMin").click();
		}
		//扩大缩小的关闭
		$(".toMax").click(function(){
			$('.maxBox').css('display','block');
			$('.zeZhao').css('display','block');
			$("#hot_day_max").click();
		})
		$(".toMin").click(function(){
			$('.maxBox').css('display','none');
			$('.zeZhao').css('display','none');
			
		})
		//折线图
		function showline(date_data){
			var xtimeline=[];
			var ytimeline=[];
			var maxIndex=0;
			for(var i=0;i<date_data.length;i++){
				if(maxIndex<(date_data[i].value*1)){
					maxIndex = (date_data[i].value*1);
				}
				xtimeline.push(date_data[i].key);
				ytimeline.push(date_data[i].value);
			}
			timeline_chart = echarts.init(document.getElementById('column_chart'));
			//var datas = [96.3, 96.4, 97.5, 95.6, 98.1, 94.8, 89.6, 94.1, 80.1, 52.4, 75.8, 94.7];
			var timeline_option = {
			    backgroundColor: '#0e1428',
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
			    title: {
			        text: '',
			        textStyle: {
			            fontWeight: 'normal',
			            fontSize: 12,
			            color: '#F1F1F3'
			        },
			        left: '6%'
			    },
			    tooltip: {
			        trigger: 'axis',
			        axisPointer: {
			            lineStyle: {
			                color: '#57617B'
			            }
			        },
			        formatter: '{b0}: {c0}'
			    },
			    legend: {
			        icon: 'rect',
			        itemWidth: 14,
			        itemHeight: 5,
			        itemGap: 13,
			        data: [''],
			        right: '4%',
			        textStyle: {
			            fontSize: 12,
			            color: '#F1F1F3'
			        }
			    },
			    grid: {
			        left: '2%',
			        right: '3%',
			        bottom: '12%',
			        top: '14%',
			        containLabel: true
			    },
			    xAxis: [{
			        type: 'category',
			        boundaryGap: false,
			        axisLine: {
			            lineStyle: {
			            	 color: '#F1F1F3'
			            }
			        },
			        data: xtimeline,
			        axisLabel: {
			            //interval: 5,
			            //rotate: 40,
			            textStyle: {
			                fontSize: 12
			            }
			        },
			    }],
			    yAxis: [{
			        type: 'value',
			        max: maxIndex,
			        min:0,
			        axisTick: {
			            show: false
			        },
			        axisLine: {
			            lineStyle: {
			            	 color: '#F1F1F3'
			            }
			        },
			        axisLabel: {
			            textStyle: {
			                fontSize: 12
			            }
			        },
			        splitLine: {
			            show:false
			        }
			    }],
			    series: [{
			        name: '事件数',
			        type: 'line',
			        smooth: true,
			        lineStyle: {
			            normal: {
			                width: 2
			            }
			        },
			        areaStyle: {
			            normal: {
			                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
			                    offset: 0.8,
			                    color: 'rgba(82, 191, 255, 0.3)'
			                }, {
			                    offset: 1,
			                    color: 'rgba(82, 191, 255, 0)'
			                }], false),
			                shadowColor: 'rgba(228, 139, 76, 0.1)',
			                shadowBlur: 10
			            }
			        },
			        symbolSize: 4,
			        itemStyle: {
			            normal: {
			                color: 'rgb(82, 191, 255)',
			                borderColor: '#e48b4c'
			            },
			        },
			        data: ytimeline,
			    }]
			};
			 timeline_chart.clear();
			 timeline_chart.setOption(timeline_option);
		}
		
		/*
		  渲染扩大后的热力图（注意：复制多份是为了解决，左侧菜单栏扩大缩小后重新渲染echarts
		 dateType:1：日、2：月、4：周
		*/
		function showhot_max(date_data,dateType,echartID,grid_top,grid_left,grid_right,grid_bottom){
			
			if(date_data.length > 0 && dateType==2){//月
				date_data = packDate(date_data,6);
			}else if(date_data.length > 0 && dateType==4){//周
				date_data = packDate(date_data,2);
			}
			
			//先遍历X轴取出每个日期
    	    var date_new=[];
    	    //最大值
     	    var maxValue=0;
            for(var i=0;i<date_data.length;i++){
            	//截取日期到月
            	var key=date_data[i].key;
            	var dateValue=key.substring(0,4);
            	 if(maxValue<(date_data[i].value*1)){
      			    maxValue = (date_data[i].value*1);
  				}
            	date_new.push(dateValue);
            }
            //将年份的数组去重,并形成新的数组,此数组用于纵坐标的值
            var axisnums=[];
            for (var i = 0; i < date_new.length; i++) {
          	     if(axisnums.indexOf(date_new[i])==-1){
          	    	axisnums.push(date_new[i]);
          	     }
          	}
            
            //去重只剩下到月的日期组成新数组
            var axisdata=[];
            if(dateType == 1){//日粒度
           		for(var i=1;i<13;i++){
	           		var xdata="";
	           		if(i==2){
	           			for(var j=1;j<30;j++){
	           				xdata=i+"-"+j;     
	           				axisdata.push(xdata);
	           			}
	           		}else if(i==1||i==3||i==5||i==7||i==8||i==10||i==12){
						for(var j=1;j<32;j++){
							xdata=i+"-"+j;  
							axisdata.push(xdata);
						           			}
	           		}else{
	           			for(var j=1;j<31;j++){
	           				xdata=i+"-"+j; 
	           				axisdata.push(xdata);
	           			}
	           		}
	           	}
           	}else if(dateType == 2){//月粒度
           		axisdata = [1,2,3,4,5,6,7,8,9,10,11,12];
           	}else if(dateType == 4){//周粒度
           		axisdata = [1,2,3,4,5,6,7,8,9,10,
           					11,12,13,14,15,16,17,18,19,20,
           					21,22,23,24,25,26,27,28,29,30,
           					31,32,33,34,35,36,37,38,39,40,
           					41,42,43,44,45,46,47,48,49,50,
           					51,52,53
           					];
           	}
           	//x/y/值
           	var data=[];
            //获取zeo在在x轴数组中对应的的索引值
           	var index;
			for(var i=0;i<date_data.length;i++){
           		var ydata=date_data[i].key;//年月日/年月/年周
           		var dataHb=ydata.substring(0,4);//年
           		var zeo="";
           		if(dateType == 1){//日粒度
           			//每一个小数组
	           		var dataYz=ydata.substring(4,8);//月日
	           		var fst=dataYz.substr(0,1);//月第一位
	           		var sec=dataYz.substr(1,1);//月第二位
	           		var thi=dataYz.substr(2,1);//日第一位
	           		var fiv=dataYz.substr(3,4);//日第二位
	           		
	           		if(fst=="0"&&thi=="0"){//02 04 -->2-4
	           			zeo=sec+"-"+fiv;
	           		}else if(fst=="0"&&thi!="0"){//01 12 --> 1-12
	           			zeo=sec+"-"+thi+fiv;
	           		}else if(fst!="0"&&thi=="0"){//12 08 --> 12-8
	           			zeo=fst+sec+"-"+fiv;
	           		}else if(fst!="0"&&thi!="0"){//12 11 -->12-11
	           			zeo=fst+sec+"-"+thi+fiv;
	           		}
	           		index = axisdata.indexOf(zeo);//获取zeo在在x轴数组中对应的的索引值
           		}else if(dateType == 2){//月
           			var month = ydata.substring(4,6);//月份
           			//将0去掉
           			month = month.replace(/\b(0+)/gi,"");
           			//根据月份值获取对应的索引
           			index = axisdata.indexOf(parseInt(month));
           		}else if(dateType == 4){
           			var week = ydata.split("-")[1];//周
           			index = axisdata.indexOf(parseInt(week));
           		}
           		//封装三维数组
           		for(var j=0;j<axisnums.length;j++){
           			var schildVal=[];
           			if(dataHb==axisnums[j]){
           				schildVal.push(index,j,date_data[i].value);
               			data.push(schildVal);
           			}
           		}
           	}
			//var axisnums = ['2017', '2018'];，
			//var axisdata = ['1-1','1-2','1-3','1-4','1-5','1-6','1-7','1-8','1-9','1-10','1-11','1-12','1-13','1-14','1-15','1-16','1-17','1-18','1-19','1-20','1-21','1-22','1-23','1-24','1-25','1-26','1-27','1-28','1-29','1-30','2-1','2-2','2-3','2-4','2-5','2-6','2-7','2-8','2-9','2-10','2-11','2-12','2-13','2-14','2-15','2-16','2-17','2-18','2-19','2-20','2-21','2-22','2-23','2-24','2-25','2-26','2-27','2-28','2-29','2-30'];
		    //var data = [ [ 0, 0, 5 ], [ 1, 0, 1 ], [ 2, 0, 0 ], [ 3, 0, 0 ], [ 4, 0, 0 ], [ 5, 0, 0 ], [ 6, 0, 0 ], [ 7, 0, 0 ], [ 8, 0, 0 ], [ 9, 0, 0 ], [ 10, 0, 0 ], [ 11, 0, 2 ], [ 12, 0, 4 ], [ 13, 0, 1 ], [ 14, 0, 1 ], [ 15, 0, 3 ], [ 16, 0, 4 ], [ 17, 0, 6 ], [ 18, 0, 4 ], [ 19, 0, 4 ], [ 20, 0, 3 ], [ 21, 0, 3 ], [ 22, 0, 2 ], [ 23, 0, 5 ], [ 24, 0, 5 ], [ 25, 0, 5 ], [ 26, 0, 5 ], [ 27, 0, 5 ], [ 28, 0, 5 ], [ 29, 0, 5 ], [ 30, 0, 5 ], [ 31, 0, 5 ], [ 32, 0, 5 ], [ 33, 0, 5 ], [ 34, 0, 5 ], [ 35, 0, 5 ], [ 36, 0, 5 ], [ 37, 0, 5 ], [ 38, 0, 5 ], [ 39, 0, 5 ], [ 40, 0, 5 ], [ 41, 0, 5 ], [ 42, 0, 5 ], [ 43, 0, 5 ], [ 44, 0, 5 ], [ 45, 0, 5 ], [ 46, 0, 5 ], [ 47, 0, 5 ], [ 48, 0, 5 ], [ 49, 0, 5 ], [ 50, 0, 5 ], [ 51, 0, 5 ], [ 52, 0, 5 ], [ 53, 0, 5 ], [ 54, 0, 5 ], [ 55, 0, 5 ], [ 56, 0, 5 ], [ 57, 0, 5 ], [ 58, 0, 5 ], [ 59, 0, 5 ], [ 60, 0, 5 ], [ 0, 1, 7 ], [ 1, 1, 0 ], [ 2, 1, 0 ], [ 3, 1, 0 ], [ 4, 1, 0 ], [ 5, 1, 0 ], [ 6, 1, 0 ], [ 7, 1, 0 ], [ 8, 1, 0 ], [ 9, 1, 0 ], [ 10, 1, 5 ], [ 11, 1, 2 ], [ 12, 1, 2 ], [ 13, 1, 6 ], [ 14, 1, 9 ], [ 15, 1, 11 ], [ 16, 1, 6 ], [ 17, 1, 7 ], [ 18, 1, 8 ], [ 19, 1, 12 ], [ 20, 1, 5 ], [ 21, 1, 5 ], [ 22, 1, 7 ], [ 23, 1, 2 ], [ 24, 1, 5 ], [ 25, 1, 5 ], [ 26, 1, 5 ], [ 27, 1, 5 ], [ 28, 1, 5 ], [ 29, 1, 5 ], [ 30, 1, 5 ], [ 31, 0, 5 ], [ 32, 0, 5 ], [ 33, 0, 5 ], [ 34, 0, 5 ], [ 35, 0, 5 ], [ 36, 0, 5 ], [ 37, 0, 5 ], [ 38, 0, 5 ], [ 39, 0, 5 ], [ 40, 0, 5 ], [ 41, 0, 5 ], [ 42, 0, 5 ], [ 43, 0, 5 ], [ 44, 0, 5 ], [ 45, 0, 5 ], [ 46, 0, 5 ], [ 47, 0, 5 ], [ 48, 0, 5 ], [ 49, 0, 5 ], [ 50, 0, 5 ], [ 51, 0, 5 ], [ 52, 0, 5 ], [ 53, 0, 5 ], [ 54, 0, 5 ], [ 55, 0, 5 ], [ 56, 0, 5 ], [ 57, 0, 5 ], [ 58, 0, 5 ], [ 59, 0, 5 ], [ 60, 0, 5 ] ];
			option = {
					backgroundColor: '#0e1529',
					tooltip: {
						show: true,
						formatter: function (params) {
					             return axisnums[params.value[1]] +'-'+ axisdata[params.value[0]]+" : "  +params.value[2] ;
					        }
					},
					toolbox: {
        		        feature: {
        		            saveAsImage: {}
        		        }
        		    }, 
					geo: [{
						map:'world',
						zoom: 1,
						roam: true,
						show:false,
						id:'geo1',
						itemStyle:{
							areaColor:'rgb(0,0,0,0)'
						},
						height:'100%',
						width:'100%'
					}],
					grid: {
						show: true,
						top:grid_top,
						left:grid_left,
						right:grid_right,
						bottom:grid_bottom,
						borderColor:'rgb(0,0,0,0)'
					}, 
					calculable: true,
					animation: false,
					xAxis: {
						type: 'category',
						axisTick:{
							interval:0
						},
						axisLine: {
				            lineStyle: {
				            	 color: '#F1F1F3'
				            }
				        },
						data:axisdata
					},
					yAxis: {
						type: 'category',
						axisLine: {
				            lineStyle: {
				            	 color: '#F1F1F3'
				            }
				        },
						data:axisnums
					},
					series: [
						{
							id:'test',
							name: "fs",
							type: 'heatmap',
							coordinateSystem: 'cartesian2d',
							data: data,
							gridIndex:0,
							gradientColors: ['blue', 'cyan', 'lime', 'yellow', 'red'],
							blurSize: 10,
							pointSize: 10,
							itemStyle: {
								show:true,
								color:'rgb(0,0,0,0)'
							}
						},
					]
				};
			    myChart_max = echarts.init(document.getElementById(echartID));
				myChart_max.clear();
				myChart_max.setOption(option);
				function convertToPx(dataitem){
					var newxy = myChart_max.convertToPixel({seriesId:'test'},dataitem);
					return newxy
				}
			
				function convertToGeo(dataitem){
					var pointobj = myChart_max.convertFromPixel({geoId:'geo1'},convertToPx(dataitem));
					var point = [pointobj[0],pointobj[1]];
					return point;
				}
				/*
				  将横向、纵向滚动条对应的数据封装为热力图所需数据
				*/
				function convertData(data,x_start,x_end,y_start,y_end){
					var convertedData = [];
					//横坐标对应的索引值范围
					x_start = Math.ceil(x_start);
					x_end = Math.ceil(x_end);
					//纵坐标对应的索引值范围
					y_start = Math.ceil(y_start);
					y_end = Math.ceil(y_end);
					
					for(var i = 0;i<data.length;i++){
					    
					    if (data[i][0] >= x_start && data[i][0] < x_end &&
					        data[i][1] >= y_start && data[i][1] < y_end){//将数组中所有符合规范的数据筛选出来
		    				var geoCoord = convertToGeo([data[i][0],data[i][1]]);
		    				geoCoord.push(data[i][2]);
		    				convertedData.push(geoCoord);
					    }
					    
					}
					return convertedData;
				}
				//默认将全部的数据转换为热力图数据
				var x_start = 0;
			    var x_end = axisdata.length
			    var y_start = 0;
			    var y_end = axisnums.length;
				var cusdata = convertData(data,x_start,x_end,y_start,y_end);
				//定时任务将echarts热力图数据重新渲染
			    setTimeout(function() {
					myChart_max.setOption({
						series: [
								{
									name: 'testheatmap',
									type: 'heatmap',
									id:'testheatmap',
									coordinateSystem: 'geo',
									seriesIndex:1,
									geoIndex: 0,
									data: cusdata,
									blurSize: 10,
									pointSize: 8
								},
							],
						visualMap: {
							show: false,
							min: 0,
					        max: maxValue,
							top: 'bottom',
							seriesIndex: 1,
							calculable: true,
							inRange: {
								//color: ["#e8192f","#d6664d","#B9044E","#f0ba2e","#d3ce2b","#169A7f","#0b6573","#1BB3c8"]
								color: ['blue', 'cyan', 'lime', 'yellow', 'red']
							}
						},
						dataZoom:[ 
						    {
					            xAxisIndex: 0,
					            filterMode: 'empty'
					        },
					        {
					            yAxisIndex: 0,
					            filterMode: 'empty'
					        }, 
					        {
					            id: 'dataZoomX',
					            type: 'slider',
					            xAxisIndex: [0],
					            filterMode: 'empty',
					            textStyle:{
					            	color:'white'
					            }
					        },
					        {
					            id: 'dataZoomY',
					            type: 'slider',
					            yAxisIndex: [0],
					            filterMode: 'empty',
					            textStyle:{
					            	color:'white'
					            }
					        }]
						});
				}, 500);
			//监听滚动条的事件
			myChart_max.on('dataZoom',function(params) {
			    if(params.dataZoomId== 'dataZoomX'){//"横坐标"
	                x_start = (axisdata.length)*params.start/100;
	                x_end = (axisdata.length)*params.end/100;
	            }else{ //"纵坐标"
	                y_start = (axisnums.length)*params.start/100;
	                y_end = (axisnums.length)*params.end/100;
	            }
	            cusdata = convertData(data,x_start,x_end,y_start,y_end);
			    myChart_max.setOption({
						series: [
							{
								name: 'testheatmap',
								type: 'heatmap',
								id:'testheatmap',
								coordinateSystem: 'geo',
								seriesIndex:1,
								geoIndex: 0,
								data: cusdata,
								blurSize: 10,
								pointSize: 8
							}
						],
				});
			})		
		}
		/*
		 渲染热力图
		 dateType:1：日、2：月、4：周
		*/
		function showhot(date_data,dateType,echartID,grid_top,grid_left,grid_right,grid_bottom){
			
			if(date_data.length > 0 && dateType==2){//月
				date_data = packDate(date_data,6);
			}else if(date_data.length > 0 && dateType==4){//周
				date_data = packDate(date_data,2);
			}
			
			//先遍历X轴取出每个日期
   	    var date_new=[];
   	    //最大值
    	    var maxValue=0;
           for(var i=0;i<date_data.length;i++){
           	//截取日期到月
           	var key=date_data[i].key;
           	var dateValue=key.substring(0,4);
           	 if(maxValue<(date_data[i].value*1)){
     			    maxValue = (date_data[i].value*1);
 				}
           	date_new.push(dateValue);
           }
           //将年份的数组去重,并形成新的数组,此数组用于纵坐标的值
           var axisnums=[];
           for (var i = 0; i < date_new.length; i++) {
         	     if(axisnums.indexOf(date_new[i])==-1){
         	    	axisnums.push(date_new[i]);
         	     }
         	}
           
           //去重只剩下到月的日期组成新数组
           var axisdata=[];
           if(dateType == 1){//日粒度
          		for(var i=1;i<13;i++){
	           		var xdata="";
	           		if(i==2){
	           			for(var j=1;j<30;j++){
	           				xdata=i+"-"+j;     
	           				axisdata.push(xdata);
	           			}
	           		}else if(i==1||i==3||i==5||i==7||i==8||i==10||i==12){
						for(var j=1;j<32;j++){
							xdata=i+"-"+j;  
							axisdata.push(xdata);
						           			}
	           		}else{
	           			for(var j=1;j<31;j++){
	           				xdata=i+"-"+j; 
	           				axisdata.push(xdata);
	           			}
	           		}
	           	}
          	}else if(dateType == 2){//月粒度
          		axisdata = [1,2,3,4,5,6,7,8,9,10,11,12];
          	}else if(dateType == 4){//周粒度
          		axisdata = [1,2,3,4,5,6,7,8,9,10,
          					11,12,13,14,15,16,17,18,19,20,
          					21,22,23,24,25,26,27,28,29,30,
          					31,32,33,34,35,36,37,38,39,40,
          					41,42,43,44,45,46,47,48,49,50,
          					51,52,53
          					];
          	}
          	//x/y/值
          	var data=[];
           //获取zeo在在x轴数组中对应的的索引值
          	var index;
			for(var i=0;i<date_data.length;i++){
          		var ydata=date_data[i].key;//年月日/年月/年周
          		var dataHb=ydata.substring(0,4);//年
          		var zeo="";
          		if(dateType == 1){//日粒度
          			//每一个小数组
	           		var dataYz=ydata.substring(4,8);//月日
	           		var fst=dataYz.substr(0,1);//月第一位
	           		var sec=dataYz.substr(1,1);//月第二位
	           		var thi=dataYz.substr(2,1);//日第一位
	           		var fiv=dataYz.substr(3,4);//日第二位
	           		
	           		if(fst=="0"&&thi=="0"){//02 04 -->2-4
	           			zeo=sec+"-"+fiv;
	           		}else if(fst=="0"&&thi!="0"){//01 12 --> 1-12
	           			zeo=sec+"-"+thi+fiv;
	           		}else if(fst!="0"&&thi=="0"){//12 08 --> 12-8
	           			zeo=fst+sec+"-"+fiv;
	           		}else if(fst!="0"&&thi!="0"){//12 11 -->12-11
	           			zeo=fst+sec+"-"+thi+fiv;
	           		}
	           		index = axisdata.indexOf(zeo);//获取zeo在在x轴数组中对应的的索引值
          		}else if(dateType == 2){//月
          			var month = ydata.substring(4,6);//月份
          			//将0去掉
          			month = month.replace(/\b(0+)/gi,"");
          			//根据月份值获取对应的索引
          			index = axisdata.indexOf(parseInt(month));
          		}else if(dateType == 4){
          			var week = ydata.split("-")[1];//周
          			index = axisdata.indexOf(parseInt(week));
          		}
          		//封装三维数组
          		for(var j=0;j<axisnums.length;j++){
          			var schildVal=[];
          			if(dataHb==axisnums[j]){
          				schildVal.push(index,j,date_data[i].value);
              			data.push(schildVal);
          			}
          		}
          	}
			//var axisnums = ['2017', '2018'];，
			//var axisdata = ['1-1','1-2','1-3','1-4','1-5','1-6','1-7','1-8','1-9','1-10','1-11','1-12','1-13','1-14','1-15','1-16','1-17','1-18','1-19','1-20','1-21','1-22','1-23','1-24','1-25','1-26','1-27','1-28','1-29','1-30','2-1','2-2','2-3','2-4','2-5','2-6','2-7','2-8','2-9','2-10','2-11','2-12','2-13','2-14','2-15','2-16','2-17','2-18','2-19','2-20','2-21','2-22','2-23','2-24','2-25','2-26','2-27','2-28','2-29','2-30'];
		    //var data = [ [ 0, 0, 5 ], [ 1, 0, 1 ], [ 2, 0, 0 ], [ 3, 0, 0 ], [ 4, 0, 0 ], [ 5, 0, 0 ], [ 6, 0, 0 ], [ 7, 0, 0 ], [ 8, 0, 0 ], [ 9, 0, 0 ], [ 10, 0, 0 ], [ 11, 0, 2 ], [ 12, 0, 4 ], [ 13, 0, 1 ], [ 14, 0, 1 ], [ 15, 0, 3 ], [ 16, 0, 4 ], [ 17, 0, 6 ], [ 18, 0, 4 ], [ 19, 0, 4 ], [ 20, 0, 3 ], [ 21, 0, 3 ], [ 22, 0, 2 ], [ 23, 0, 5 ], [ 24, 0, 5 ], [ 25, 0, 5 ], [ 26, 0, 5 ], [ 27, 0, 5 ], [ 28, 0, 5 ], [ 29, 0, 5 ], [ 30, 0, 5 ], [ 31, 0, 5 ], [ 32, 0, 5 ], [ 33, 0, 5 ], [ 34, 0, 5 ], [ 35, 0, 5 ], [ 36, 0, 5 ], [ 37, 0, 5 ], [ 38, 0, 5 ], [ 39, 0, 5 ], [ 40, 0, 5 ], [ 41, 0, 5 ], [ 42, 0, 5 ], [ 43, 0, 5 ], [ 44, 0, 5 ], [ 45, 0, 5 ], [ 46, 0, 5 ], [ 47, 0, 5 ], [ 48, 0, 5 ], [ 49, 0, 5 ], [ 50, 0, 5 ], [ 51, 0, 5 ], [ 52, 0, 5 ], [ 53, 0, 5 ], [ 54, 0, 5 ], [ 55, 0, 5 ], [ 56, 0, 5 ], [ 57, 0, 5 ], [ 58, 0, 5 ], [ 59, 0, 5 ], [ 60, 0, 5 ], [ 0, 1, 7 ], [ 1, 1, 0 ], [ 2, 1, 0 ], [ 3, 1, 0 ], [ 4, 1, 0 ], [ 5, 1, 0 ], [ 6, 1, 0 ], [ 7, 1, 0 ], [ 8, 1, 0 ], [ 9, 1, 0 ], [ 10, 1, 5 ], [ 11, 1, 2 ], [ 12, 1, 2 ], [ 13, 1, 6 ], [ 14, 1, 9 ], [ 15, 1, 11 ], [ 16, 1, 6 ], [ 17, 1, 7 ], [ 18, 1, 8 ], [ 19, 1, 12 ], [ 20, 1, 5 ], [ 21, 1, 5 ], [ 22, 1, 7 ], [ 23, 1, 2 ], [ 24, 1, 5 ], [ 25, 1, 5 ], [ 26, 1, 5 ], [ 27, 1, 5 ], [ 28, 1, 5 ], [ 29, 1, 5 ], [ 30, 1, 5 ], [ 31, 0, 5 ], [ 32, 0, 5 ], [ 33, 0, 5 ], [ 34, 0, 5 ], [ 35, 0, 5 ], [ 36, 0, 5 ], [ 37, 0, 5 ], [ 38, 0, 5 ], [ 39, 0, 5 ], [ 40, 0, 5 ], [ 41, 0, 5 ], [ 42, 0, 5 ], [ 43, 0, 5 ], [ 44, 0, 5 ], [ 45, 0, 5 ], [ 46, 0, 5 ], [ 47, 0, 5 ], [ 48, 0, 5 ], [ 49, 0, 5 ], [ 50, 0, 5 ], [ 51, 0, 5 ], [ 52, 0, 5 ], [ 53, 0, 5 ], [ 54, 0, 5 ], [ 55, 0, 5 ], [ 56, 0, 5 ], [ 57, 0, 5 ], [ 58, 0, 5 ], [ 59, 0, 5 ], [ 60, 0, 5 ] ];
			option = {
					backgroundColor: '#0e1529',
					tooltip: {
						show: true,
						formatter: function (params) {
					             return axisnums[params.value[1]] +'-'+ axisdata[params.value[0]]+" : "  +params.value[2] ;
					        }
					},
					toolbox: {
       		        feature: {
       		            saveAsImage: {}
       		        }
       		    },
					geo: [{
						map:'world',
						zoom: 1,
						roam: true,
						show:false,
						id:'geo1',
						itemStyle:{
							areaColor:'rgb(0,0,0,0)'
						},
						height:'100%',
						width:'100%'
					}],
					grid: {
						show: true,
						top:grid_top,
						left:grid_left,
						right:grid_right,
						bottom:grid_bottom,
						borderColor:'rgb(0,0,0,0)'
					}, 
					calculable: true,
					animation: false,
					xAxis: {
						type: 'category',
						axisTick:{
							interval:0
						},
						axisLine: {
				            lineStyle: {
				            	 color: '#F1F1F3'
				            }
				        },
						data:axisdata
					},
					yAxis: {
						type: 'category',
						axisLine: {
				            lineStyle: {
				            	 color: '#F1F1F3'
				            }
				        },
						data:axisnums
					},
					series: [
						{
							id:'test',
							name: "fs",
							type: 'heatmap',
							coordinateSystem: 'cartesian2d',
							data: data,
							gridIndex:0,
							gradientColors: ['blue', 'cyan', 'lime', 'yellow', 'red'],
							blurSize: 10,
							pointSize: 10,
							itemStyle: {
								show:true,
								color:'rgb(0,0,0,0)'
							}
						},
					]
				};
			    myChart = echarts.init(document.getElementById(echartID));
				myChart.clear();
				myChart.setOption(option);
				function convertToPx(dataitem){
					var newxy = myChart.convertToPixel({seriesId:'test'},dataitem);
					return newxy
				}
			
				function convertToGeo(dataitem){
					var pointobj = myChart.convertFromPixel({geoId:'geo1'},convertToPx(dataitem));
					var point = [pointobj[0],pointobj[1]];
					return point;
				}
				/*
				  将横向、纵向滚动条对应的数据封装为热力图所需数据
				*/
				function convertData(data,x_start,x_end,y_start,y_end){
					var convertedData = [];
					//横坐标对应的索引值范围
					x_start = Math.ceil(x_start);
					x_end = Math.ceil(x_end);
					//纵坐标对应的索引值范围
					y_start = Math.ceil(y_start);
					y_end = Math.ceil(y_end);
					
					for(var i = 0;i<data.length;i++){
					    
					    if (data[i][0] >= x_start && data[i][0] < x_end &&
					        data[i][1] >= y_start && data[i][1] < y_end){//将数组中所有符合规范的数据筛选出来
		    				var geoCoord = convertToGeo([data[i][0],data[i][1]]);
		    				geoCoord.push(data[i][2]);
		    				convertedData.push(geoCoord);
					    }
					    
					}
					return convertedData;
				}
				//默认将全部的数据转换为热力图数据
				var x_start = 0;
			    var x_end = axisdata.length
			    var y_start = 0;
			    var y_end = axisnums.length;
				var cusdata = convertData(data,x_start,x_end,y_start,y_end);
				//定时任务将echarts热力图数据重新渲染
			    setTimeout(function() {
					myChart.setOption({
						series: [
								{
									name: 'testheatmap',
									type: 'heatmap',
									id:'testheatmap',
									coordinateSystem: 'geo',
									seriesIndex:1,
									geoIndex: 0,
									data: cusdata,
									blurSize: 10,
									pointSize: 8
								},
							],
						visualMap: {
							show: false,
							min: 0,
					        max: maxValue,
							top: 'bottom',
							seriesIndex: 1,
							calculable: true,
							inRange: {
								//color: ["#e8192f","#d6664d","#B9044E","#f0ba2e","#d3ce2b","#169A7f","#0b6573","#1BB3c8"]
								color: ['blue', 'cyan', 'lime', 'yellow', 'red']
							}
						},
						dataZoom:[ 
						    {
					            xAxisIndex: 0,
					            filterMode: 'empty'
					        },
					        {
					            yAxisIndex: 0,
					            filterMode: 'empty'
					        }, 
					        {
					            id: 'dataZoomX',
					            type: 'slider',
					            xAxisIndex: [0],
					            filterMode: 'empty',
					            textStyle:{
					            	color:'white'
					            }
					        },
					        {
					            id: 'dataZoomY',
					            type: 'slider',
					            yAxisIndex: [0],
					            filterMode: 'empty',
					            textStyle:{
					            	color:'white'
					            }
					        }]
						});
				}, 500);
			//监听滚动条的事件
			myChart.on('dataZoom',function(params) {
			    if(params.dataZoomId== 'dataZoomX'){//"横坐标"
	                x_start = (axisdata.length)*params.start/100;
	                x_end = (axisdata.length)*params.end/100;
	            }else{ //"纵坐标"
	                y_start = (axisnums.length)*params.start/100;
	                y_end = (axisnums.length)*params.end/100;
	            }
	            cusdata = convertData(data,x_start,x_end,y_start,y_end);
			    myChart.setOption({
						series: [
							{
								name: 'testheatmap',
								type: 'heatmap',
								id:'testheatmap',
								coordinateSystem: 'geo',
								seriesIndex:1,
								geoIndex: 0,
								data: cusdata,
								blurSize: 10,
								pointSize: 8
							}
						],
				});
			})		
		}
    </script>
</html>