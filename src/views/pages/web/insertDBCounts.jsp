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
<title>数据管理-入库量统计</title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/style.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/sec2.css">
<!--人工查询 -->
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath %>/static//lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath %>/static/css/combo.select.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/perfect-scrollbar.css"/>
<link rel="shortcut icon" type="image/x-icon" href="<%=basePath %>/static/Visualization/base/ico.png"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/base/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/base/base.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/base/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/css/event_result.css"/>
<script src="<%=basePath%>/static/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>/static/lib/jquery.pagination.js"></script>
<script src="<%=basePath%>/static/js/config/config.js"></script>
<!-- 两种皮肤切换 -->
<c:if test="${bgFlag == null or bgFlag == 1}">
	<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.min.css"/>
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
	.circle{
		width:150px;
		height:150px;
		border:1px solid #ccc;
		border-radius:50%;
		background-color:#ccc;
		float: left;
    	margin-left: 15%;
    	margin-top: 47px;
	}
	.dbName{
		margin-left: 25%;
	    margin-top: 26%;
	    font-size: 25px;
	}
	.dbCounts{
	    text-align: center;
	    margin-top: 5%;
	    font-size: 18px;
	}
	.mg_b{
		margin-bottom: 20px;
	}
	.dateInput{
	    width: 120px;
	    padding: 0px 27px;
	    margin: -2px 4px;
	    height: 20px;
	    line-height: 20px;
	    border: 1px solid #ccc;
	    border-radius: 1px;
	    color: #1d2334;
	}
	.condtion_div{
	    margin-top: 10px;
    	margin-left: 90px;
	}
	.intpu_radio{
	    margin-left: 4px!important;
    	margin-top: 0px!important;
    	vertical-align:middle;
	}
	.selectDB{
	    margin-top: -3px;
	    width: 46px;
	    height: 23px;
	    line-height: 24px;
	    background: #287fcb;
	    text-align: center;
	    color: #fff;
	    cursor: pointer;
	    border-radius: 2px;
	}
	.index_bottom {
		background: url(<%=basePath %>/static/images/beij.png) no-repeat;
		background-size:  100%;	
	}
	.show {
		height: 825px;
		background: url(<%=basePath %>/static/images/beij.png) no-repeat;
		background-size:  100%;	
		margin-top: -27px;
	}
	.outBox {
		    height: 86%;
		    width: 96%;
		    
		    position: relative;
		    margin: 15px 0 0 2%;
	}
	.inBox {
		height: 45%;
		width: 100%;
		position: absolute;
		border: 1px solid #54628a;	
	    background-color: #1b233499;	
	}
	.inBox1 {
		    height: 61%;
		    width: 100%;
		    position: absolute;
		    border: 1px solid #54628a;
		    top: 47%;
	        background-color: #1b233499;
	}
	
	.inBox_0 {
		height: 14%;
	    width: 14%;
	    position: absolute;
	    top: 0px;
	    left: 42%;
		
		background: url(<%=basePath %>/static/images/short_111.png) no-repeat;
	}
	.inBox1_0 {
		height: 13%;
	    width: 15%;
	    position: absolute;
	    top: 0px;
	    left: 42%;
		
		background: url(<%=basePath %>/static/images/long_111.png)no-repeat;
	}
	
	.span_0 {
		color: #FFF;
		font-size: 19px;
		font-family: SimSun;
		font-weight: bold;
		position: absolute;
		top: 5px;
		left: 29%;
	}
	.span1_0 {
		color: #FFF;
		font-size: 19px;
		font-family: SimSun;
		font-weight: bold;
		position: absolute;
		top: 5px;
		left: 19.5%;
	}
	.middle_box {
		margin: 37px 0 0 3%;
		height: 31px;
		width: 15%;		
		position: relative;		
	}
	
	.data1 {
		height: 30px;
		width: 33%;
		border: 1px solid #00bde5;
		transform: skew(20deg);
		border-radius: 4px;
		position: absolute;		
		cursor: pointer;
		background: #00aeff;
	}
	.data1_1 {
		position: absolute;
		transform: skew(-20deg);
		color: #FFF;
		left: 22%;
		top: 6px;
	}
	.dataSn {
		height: 30px;
		width: 33%;
		border: 1px solid #00bde5;
		transform: skew(20deg);
		border-radius: 4px;
		left: 32%;
		position: absolute;
		cursor: pointer;
		background: #024a73;
	}
	.data2_1 {
		position: absolute;
		transform: skew(-20deg);
		color: #FFF;
		left: 22%;
		top: 6px;
	}
	.data3 {
		height: 30px;
		width: 33%;
		border: 1px solid #00bde5;
		transform: skew(20deg);
		border-radius: 4px;
		left: 64%;
		position: absolute;
		cursor: pointer;
		background: #024a73;
	}
	.data3_1 {
		position: absolute;
		transform: skew(-20deg);
		color: #FFF;
		left: 22%;
		top: 6px;
	}
	.inBox_1 {
		height: 55%;
		width: 100%;	
		position: absolute;
		top: 100px;
	}
	.news {
		    height: 79%;
		    width: 21%;	    
		    position: absolute;
		    left: 12%;
		    top: 19px;
		background: url(<%=basePath %>/static/images/kuangk_111.png)no-repeat;
	}
	.picture {
		    height: 79%;
		    width: 22%;		   
		    position: absolute;
		    left: 38.4%;
		    top: 19px;
		background: url(<%=basePath %>/static/images/kuangk_111.png)no-repeat;
	}
	.things {
		    height: 78%;
		    width: 21%;		   
		    position: absolute;
		    left: 65.5%;
		    top: 22px;
		background: url(<%=basePath %>/static/images/kuangk_111.png)no-repeat;
	}
	.inBox1_1 {
		width: 100%;
		height: 85%;
		position: absolute;
		top: 62px;
	}
	.timeYmd {
		width: 14%;
		height: 9%;
		position: absolute;
		top: 21px;
		left: 85%;
		color: #fff;
	}
	.dateSe {
		width: 26%;
	    height: 8%;
	    
	    position: absolute;
	    top: 21px;
	    left: 2%;
	}
	.dateSe input {
		/* width: 30%; */
		height: 30px;
		margin-left: 7px;
		border: 1px solid #54628a;
		background: #101628;
		border-radius: 5px;
		color:#fff;
	}
	.start {
		color: #cedde4;
	}
	.ending {
		color: #cedde4;
		margin-left: 30px;
	}
	.riLi {
		height: 20px;
		width: 20px;
		position:absolute;
		background: url(<%=basePath %>/static/images/rili_111.png)no-repeat;
		left: 92%;
		top: 10px;
		cursor: pointer;
	}
	.riLi1 {
		height: 20px;
		width: 20px;
		position:absolute;
		background: url(<%=basePath %>/static/images/rili_111.png)no-repeat;
		left: 38%;
		top: 10px;
		cursor: pointer;
	}
	.beijing {
		height: 56px;
		width: 71px;		
		position:absolute;
		background: url(<%=basePath %>/static/images/news_111.png)no-repeat;
		left: 12%;
		top: 40px;
	}
	.beijing1 {
		height: 56px;
		width: 71px;		
		position:absolute;
		background: url(<%=basePath %>/static/images/map_111.png)no-repeat;
		left: 12%;
		top: 40px;
	}
	.beijing2 {
		height: 56px;
		width: 71px;		
		position:absolute;
		background: url(<%=basePath %>/static/images/map_110.png)no-repeat;
		left: 12%;
		top: 40px;
	}
	.newHouse {
		
		position:absolute;
		left: 41%;
		top: 29px;
		color: #FFF;
	}
	.num {
	    position: absolute;
	    left: 33%;
	    top: 56px;
	    color: red;
	    font-size: 28px;
	}
	.num1 {
	    position: absolute;
	    left: 39%;
	    top: 56px;
	    color: yellow;
	    font-size: 33px;
	}
	.num2 {
	    position: absolute;
	    left: 39%;
	    top: 56px;
	    color: green;
	    font-size: 33px;
	}
	.million {		
	    position: absolute;
	    left: 85%;
	    top: 56px;
	    color: #677742;	  
	    font-size: 27px;  
	}
	.million1 {		
	    position: absolute;
	    left: 70%;
	    top: 59px;
	    color: #677742;	 
	    font-size: 27px;   
	}
	.content {
		width: 100%;
		height: 70%;
		position: absolute;
		top: 40px;
		border: 1px solid pink;
	}
	.dateInput{
	    width: 120px;
	    padding: 0px 27px;
	    margin: -2px 4px;
	    height: 20px;
	    line-height: 20px;
	    border: 1px solid #ccc;
	    border-radius: 1px;
	    color: #1d2334;
	}
	.ecircle {
	    width: 15px;
	    height: 15px;
	    border: 1px solid rgba(0,193,222,1);
	    border-radius: 50%;
	    display: inline-block;
        margin-bottom: -2px;
    	margin-left: 2px;
	}
	.ecircleon {
	    background: rgba(0,193,222,1);
	}
	.datepicker.dropdown-menu {
    position: absolute;
    top: 100%;
    left: 0;
    z-index: 1000;
    float: left;
    display: none;
    min-width: 160px;
    list-style: none;
    background-color: #1b2334!important;
    border: 1px solid #ccc;
    border: 1px solid rgba(0,0,0,.2);
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
    -webkit-box-shadow: 0 5px 10px rgba(0,0,0,.2);
    -moz-box-shadow: 0 5px 10px rgba(0,0,0,.2);
    box-shadow: 0 5px 10px rgba(0,0,0,.2);
    -webkit-background-clip: padding-box;
    -moz-background-clip: padding;
    background-clip: padding-box;
    color: #1173e3;
    font-size: 13px;
    line-height: 20px;
}
	</style>
<body>
	<div class="index_top clearfix">
		<h3 class="fl title"> 数据管理 > 入库量统计 </h3>
	</div>
	<div class="index_bottom">
		<div class="data show">
		<!-- 数据源 -->
		<div class="middle_box">			
			<div class="data1" id="oK">
			<span class="data1_1">数据源一</span>
			</div>
			<div class="dataSn">
			<span class="data2_1">数据源二</span>
			</div>
			<div class="data3">
			<span class="data3_1" >数据源三</span>			
			</div>
		</div>
		<input type="hidden" id="dataSourceType" value="1">
	        <!-- 补充内容 -->
	    	<div class = "outBox">
	    	<!-- 上 -->
	    		<div class = "inBox">
	    			<div class = "inBox_0">
	    				<span class = "span_0">入库总量</span>
	    			</div>
	    			<div class = "inBox_1">
	    				<div class = "news">
	    					<div class = "beijing"></div>
	    					<span class = "newHouse">新闻库</span>
	    					<span class = "num"></span>
	    				</div>
	    				<div class = "picture">
	    					<div class = "beijing1"></div>
	    					<span class = "newHouse">图谱库</span>
	    					<span class = "num1"></span>
	    				</div>
	    				<div class = "things">
	    					<div class = "beijing2"></div>
	    					<span class = "newHouse">事件库</span>
	    					<span class = "num2"></span>
	    				</div>
	    			</div>	    				    			
	    		</div>
	    		<!-- 下 -->
	    		<div class = "inBox1">
	    			<div class = "inBox1_0">
	    				<span class = "span1_0">入库量时间线</span>
	    			</div>
	    			<div class = "inBox1_1" id="timeline_charts">
	    				
	    			</div>
	    			<div class= "dateSe">
	    				<!-- <div class = "riLi"><input class="day1" style="display: none"/></div>
	    				<div class = "riLi1"></div> -->
	    				<span class = "start">开始时间 : </span><span><input class="dateInput inp_selc day1"  id="stDate" name="stDate" value="${stDate}" type="text" readonly/></span>
	    				<span class = "ending">结束时间 : </span><span><input class="dateInput inp_selc day2"  id="edDate" name="edDate" value="${maxDate[2]}" type="text" readonly/></span>
	    			</div>
	    			<div class = "timeYmd">
	    			    <span>时间粒度：</span>
						<span class="ecircle" value="3"></span><span>年</span><span class="ecircle" value="2"></span><span>月</span><span class="ecircle ecircleon" value="1" id="day"></span><span>日</span>
	    			</div>
	    		</div>
	    	</div>
        </div>
	</div>
	<jsp:include page="updateUserPassword.jsp"/>
</body>
<!-- 人工查询功能的日期 -->
<script src="<%=basePath %>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-select.min.js"></script>
<script src="<%=basePath %>/static/js/jquery.combo.select.js"></script>
<script src="<%=basePath %>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath %>/static/js/perfect-scrollbar.js"></script>
<script src="<%=basePath %>/static/js/sec2.js"></script>

<script type="text/javascript" src="<%=basePath %>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/Visualization/base/base.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/echarts.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
<c:if test="${bgFlag == null or bgFlag == 1}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
</c:if>
 <!-- 人工查询js -->
<script type="text/javascript" src="<%=basePath%>/static/Visualization/downLoad.js"></script>
<script src="<%=basePath%>/static/js/map-tileLayer.js"	type="text/javascript"></script>
<!-- 计算显示图的高度 -->	
<script src="<%=basePath%>/static/js/chartHeight.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/customUtils.js"></script>
<script type="text/javascript">
	var selectVal;
	//数字每三位加逗号的最简单方法
	function toThousands(num) {
	     var result = [ ], counter = 0;
	     num = (num || 0).toString().split('');
	     for (var i = num.length - 1; i >= 0; i--) {
	         counter++;
	         result.unshift(num[i]);
	         if (!(counter % 3) && i != 0) { result.unshift(','); }
	     }
	     return result.join('');
	 }
	$(function(){
		
		//selectDbCountsData()
		//美化滚动条
		glorifyComboSelect();
		// 选择年月日
		//$("#day").click();
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
		    var ty = $("#dataSourceType").val();
			selectDbCountsData(ty);
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
		    var ty = $("#dataSourceType").val();
			selectDbCountsData(ty);
		}); 
		$('.ecircle').on('click',function(){
			$(this).addClass('ecircleon').siblings('.ecircle').removeClass('ecircleon');
			selectVal=$(this).attr('value');
			var ty = $("#dataSourceType").val();
			selectDbCountsData(ty);
		})
		$('#oK').click();
	});
	
	
	//按钮样式改变
	$('#oK').click(function(){
		$('#oK').css("background","#00aeff")
		$('.dataSn').css("background","#024a73")
		$('.data3').css("background","#024a73")
		showDbCountsData(1);
		$("#dataSourceType").val(1);
	})
	$('.dataSn').click(function(){
		$('#oK').css("background","#024a73")
		$('.dataSn').css("background","#00aeff")
		$('.data3').css("background","#024a73")
		showDbCountsData(2);
		$("#dataSourceType").val(2);
	})
	$('.data3').click(function(){
		$('#oK').css("background","#024a73")
		$('.dataSn').css("background","#024a73")
		$('.data3').css("background","#00aeff")
		showDbCountsData(3);
		$("#dataSourceType").val(3);
	})
	//切换数据源获取三个库的总条数
	function showDbCountsData(ty){
		if(ty==1){
			$(".num").html(numAddUnit(${dbCountsVo.news1Total})+"条");
			$(".num1").html(numAddUnit(${dbCountsVo.gkg1Total})+"条");
			$(".num2").html(numAddUnit(${dbCountsVo.event1Total})+"条");
		}else if(ty==2){
			$(".num").html(numAddUnit(${dbCountsVo.news2Total})+"条");
			$(".num1").html(numAddUnit(${dbCountsVo.gkg2Total})+"条");
			$(".num2").html(numAddUnit(${dbCountsVo.event2Total})+"条");
		}else{
			$(".num").html(numAddUnit(${dbCountsVo.news3Total})+"条");
			$(".num1").html(numAddUnit(${dbCountsVo.gkg3Total})+"条");
			$(".num2").html(numAddUnit(${dbCountsVo.event3Total})+"条");
		}
		//重置时间插件的时间范围 注意：必须放置setDate之前
		$('.day1').datepicker('setStartDate','${minDate[2]}'); 
		$('.day1').datepicker('setEndDate','${maxDate[2]}'); 
		$('.day2').datepicker('setStartDate','${minDate[2]}');
		$('.day2').datepicker('setEndDate','${maxDate[2]}');
		//将时间范围的最大值、最小值放在开始时间和结束时间
		$('.day1').datepicker('setDate','${stDate}'); 
		$('.day2').datepicker('setDate','${maxDate[2]}');
		$("#stDate").val('${stDate}');
		$("#edDate").val('${maxDate[2]}');
		selectDbCountsData(ty);
	}
	
	
	function selectDbCountsData(ty){
		var stData=$("#stDate").val();
		var edData=$("#edDate").val();
		var zsType=$(".ecircleon").attr('value');
		startLoad();
		$.ajax({
			url:'../dataStatistics/selectDbCountsByDate',
			type: 'POST',
			dataType:"json",
			data:{"stDate":stData,"edDate":edData,"zsType":zsType,"dataSourceType":ty},
			success:function(data){
				var dateData = eval('(' + data.dateData + ')');
				var newsData =eval('(' + data.newsData + ')');
				var gkgData =eval('(' + data.gkgData + ')');
				var eventData =eval('(' + data.eventData + ')');
				showTimeLine(dateData,newsData,gkgData,eventData);
		        endLoad();
			}
		});
	}
	
	function showTimeLine(dateData,newsData,gkgData,eventData){
		var timeline_chart = echarts.init(document.getElementById('timeline_charts'));
		var timeline_chart_option = {
			    //backgroundColor: '#394056',
			    tooltip: {
			        trigger: 'axis',
			        axisPointer: {
			            lineStyle: {
			                color: '#57617B'
			            }
			        }
			    },
			    legend: {
			        icon: 'rect',
			        itemWidth: 14,
			        itemHeight: 5,
			        itemGap: 13,
			        data: ['新闻库', '图谱库', '事件库'],
			        right: '45%',
			        textStyle: {
			            fontSize: 12,
			            color: '#F1F1F3'
			        }
			    },
			    dataZoom: [
			        {
			            show: true,
			            realtime: true,
			            start: 0,
			            end: 100
			        }
			    ],
			    grid: {
			        left: '3%',
			        right: '4%',
			        bottom: '12%',
			        top:"7%",
			        containLabel: true
			    },
			    xAxis: [{
			        type: 'category',
			        boundaryGap: false,
			        axisLine: {
			            lineStyle: {
			                color: '#fff'
			            }
			        },
			        data:dateData
			    }],
			    yAxis: [{
			        type: 'value',
			        name: '',
			        axisTick: {
			            show: false
			        },
			        axisLine: {
			            lineStyle: {
			                color: '#fff'
			            }
			        },
			        axisLabel: {
			            margin: 10,
			            textStyle: {
			                fontSize: 14
			            }
			        },
			        splitLine: {
			        	show:true,
			            lineStyle: {
			                color: '#57617B'
			            }
			        }
			    }],
			    series: [{
			        name: '新闻库',
			        type: 'line',
			        smooth: true,
			        symbol: 'circle',
			        symbolSize: 5,
			        showSymbol: false,
			        lineStyle: {
			            normal: {
			                width: 1
			            }
			        },
			        areaStyle: {
			            normal: {
			                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
			                    offset: 0,
			                    color: 'rgba(137, 189, 27, 0.3)'
			                }, {
			                    offset: 0.8,
			                    color: 'rgba(137, 189, 27, 0)'
			                }], false),
			                shadowColor: 'rgba(0, 0, 0, 0.1)',
			                shadowBlur: 10
			            }
			        },
			        itemStyle: {
			            normal: {
			                color: 'rgb(137,189,27)',
			                borderColor: 'rgba(137,189,2,0.27)',
			                borderWidth: 12

			            }
			        },
			        data: newsData
			    }, {
			        name: '图谱库',
			        type: 'line',
			        smooth: true,
			        symbol: 'circle',
			        symbolSize: 5,
			        showSymbol: false,
			        lineStyle: {
			            normal: {
			                width: 1
			            }
			        },
			        areaStyle: {
			            normal: {
			                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
			                    offset: 0,
			                    color: 'rgba(0, 136, 212, 0.3)'
			                }, {
			                    offset: 0.8,
			                    color: 'rgba(0, 136, 212, 0)'
			                }], false),
			                shadowColor: 'rgba(0, 0, 0, 0.1)',
			                shadowBlur: 10
			            }
			        },
			        itemStyle: {
			            normal: {
			                color: 'rgb(0,136,212)',
			                borderColor: 'rgba(0,136,212,0.2)',
			                borderWidth: 12

			            }
			        },
			        data: gkgData
			    }, {
			        name: '事件库',
			        type: 'line',
			        smooth: true,
			        symbol: 'circle',
			        symbolSize: 5,
			        showSymbol: false,
			        lineStyle: {
			            normal: {
			                width: 1
			            }
			        },
			        areaStyle: {
			            normal: {
			                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
			                    offset: 0,
			                    color: 'rgba(219, 50, 51, 0.3)'
			                }, {
			                    offset: 0.8,
			                    color: 'rgba(219, 50, 51, 0)'
			                }], false),
			                shadowColor: 'rgba(0, 0, 0, 0.1)',
			                shadowBlur: 10
			            }
			        },
			        itemStyle: {
			            normal: {

			                color: 'rgb(219,50,51)',
			                borderColor: 'rgba(219,50,51,0.2)',
			                borderWidth: 12
			            }
			        },
			        data: eventData
			    }, ]
			};
		
		timeline_chart.setOption(timeline_chart_option);
        //调节echarts图表自适应
        window.onresize=function (){
        	timeline_chart.resize();
        }
	}
</script>
</html>