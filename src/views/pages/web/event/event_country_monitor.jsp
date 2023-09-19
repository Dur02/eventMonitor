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
<title>态势监测-国家事件监测</title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/style.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath %>/static/lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/combo.select.css">
<link rel="stylesheet"	href="<%=basePath%>/static/css/perfect-scrollbar.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/base/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/base/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/base/base.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/css/event_result.css"/>
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window_zs.css"/><!-- 弹出提示框样式 -->
<!-- 两种皮肤切换 -->
<script src="<%=basePath %>/static/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath %>/static/js/config/config.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
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
<style>
.layui-table-page{
	 	text-align: right!important;
	} 
	.layui-laypage .layui-laypage-curr .layui-laypage-em{
	    background-color: #26B!important;
	}
	.layui-table-tool{
	    background-color: #344063!important;  
	    border: 1px solid #666!important; 
	}
	.layui-table-tool .layui-inline[lay-event] {
	    background-color: #00c1de!important; 
	    border: 0px solid #ccc;
	}
	.layui-table-header{
	    background-color: #344063!important; 
	}
	.table .layui-table-header .layui-table th{
		background: #344063!important;
		color:#616161;
   }
    .layui-table-cell .laytable-cell-1-0-0 span{
    	color:#fff;
   }
  .layui-table tbody tr{
    	background-color: #1b2334;
   }
   .layui-table tbody tr:nth-child(2n) {
   		background-color: #1b2334!important;
   }
   .layui-table tbody td{
    	border: 1px solid #666!important;
    	color: #fff!important;
   }
   .layui-table thead tr th {
    	border: 1px solid #666 !important;
    	color: #fff!important;
  }
 
   .layui-table-cell {
    height: 54px!important;
    line-height: 28px;
    padding: 0 15px;
    position: relative;
    box-sizing: border-box;
}   
.layui-table tr {
   height: 39px!important;
}
 .headerImage{  
        cursor: pointer;  
        transition: all 0.6s;  
   }  
   .headerImage:HOVER{  
       transform: scale(5);  
   }
   .mton{
        border: 1px solid green;
        height: 10px;
        width: 100%;
        background-color: green;
        margin-top: 20px;
   }
   .mtona{
        border: 1px solid red;
        height: 10px;
        width: 100%;
        background-color: red;
        margin-top: 20px;
   } 
   .index_bottom{
		background-image: url(<%=basePath%>/static/css/img/bg_new.png);
		background-repeat: no-repeat;
		background-size: 100% 100%;
		position: relative;
		overflow: hidden;
	}
	.country_sort {
    width: 26%;
    height: 38px;
    background: url(../../static/images/zhengjian.png) no-repeat center
     center;
    background-size: 100% 100%;
    margin: 0 auto;
    text-align: center;
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
.key {
    background: #336177ab!important;
    text-align: center;
    border-right: 1px solid #49567a;
    color: #fff!important;
}
.val {
    background: #1d2334!important;
    text-align: center;
    border-right: 1px solid #49567a;
    color: #fff!important;
}
.row_b_b {
    line-height: 32px!important;
    border-bottom: 1px solid #d2d7df;
}
.float_right {
    display: flex;
    height: 38px;
    align-items: center;
    float: right;
    margin: -2.2% 4% 0 0;
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
.ecircle {
    width: 15px;
    height: 15px;
    border: 1px solid rgba(0,193,222,1);
    border-radius: 50%;
    display: inline-block;
    margin: 0 2px 0 2px;
}
.ecircleon {
    background: rgba(0,193,222,1);
}
.timeout{
    height: 50px;
    width: 250px;
    margin-top:190px;
    margin-left: 106px;
}
.lboTime{
     height:360px;
    width: 30%;
    margin-left:-26px;
}

.btn-group .btns {
    display: inline-block;
    margin-bottom: 0px;
    color:#fff
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    cursor: pointer;
    user-select: none;
    background-color:#083ca547;
    color:#fff;
    padding: 6px 12px;
    border-width: 1px;
    border-style: solid;
    border-color: transparent;
    border-image: initial;
    border-radius: 4px;
}
.borcolor{
   background-color: rgba(0,136,204,1) !important;
   color: #fff;
}


.lineButton{
	width: 140px;
    left: 961px!important;
    top: 2px;
}
.timeRange{
	width: 240px;
    height: 24px;
    position: absolute;
    top: 158px;
    left: -595px;
    right: 0;
    margin: auto;
    text-align: left;
    background-color: #070c20;
    color: #999;
}
.bor {
    border: 1px solid #1d2334 !important;
    border-radius: 3px;
    background-color: #1d233430;
}
.bottom_echart {
    width: 90.4%;
    margin: 0 auto;
    height: 41%;
    border: 1px solid #285f8e;
    background: #20263A;
    position: absolute;
    bottom: 30%;
    margin-left:82px;
    z-index: 1000;
}
.close_echarts {
    width: 20px;
    height: 20px;
    color: #fff;
    font-size: 18px;
    float: right;
    margin: -32px 0px 0 0;
    background: url(<%=basePath%>/static/images/bg_guanbi.png)  no-repeat;
    background-size: 20px 20px;
    cursor: pointer;
}
.layui-bg-red {
    background-color: #c51414!important;
}
.layui-table-tool-panel li:hover{
  	background:#666!important;
  }
  .layui-table-view .layui-table {
    position: relative;
    margin: 0;
}
  
.layui-table-tool .layui-inline[lay-event] {
	    background-color: #00c1de!important; 
	    border: 0px solid #ccc;
	}

.layui-table-body::-webkit-scrollbar-track {
    box-shadow: inset 0 0 6px #333!important;
    border-radius: 10px!important;
}
.layui-table-header .layui-table-cell{
	height:28px!important;
}

.laytable-cell-1-0-2 {
    height: 29px!important;
}
.laytable-cell-1-0-3 {
    height: 29px!important;
}
.laytable-cell-1-0-5 {
    height: 29px!important;
}
.laytable-cell-1-0-4 {
    height: 29px!important;
}
.laytable-cell-1-0-6 {
    height: 29px!important;
}
.laytable-cell-1-0-7 {
    height: 29px!important;
}
.laytable-cell-1-0-8 {
    height: 29px!important;
}
.laytable-cell-1-0-9 {
    height: 29px!important;
}
.laytable-cell-1-0-10 {
    height: 29px!important;
}
.laytable-cell-1-0-11 {
    height: 29px!important;
}
.laytable-cell-1-0-12 {
    height: 29px!important;
}
.laytable-cell-1-0-13 {
    height: 29px!important;
}
.laytable-cell-1-0-0 {
    height: 29px!important;
}
.laytable-cell-1-0-14 {
    height: 29px!important;
}
.laytable-cell-1-0-15 {
    height: 29px!important;
}
.laytable-cell-1-0-16 {
    height: 29px!important;
}
.laytable-cell-1-0-17 {
    height: 29px!important;
}
.laytable-cell-1-0-18 {
    height: 29px!important;
}
.laytable-cell-1-0-19 {
    height: 29px!important;
}
.laytable-cell-1-0-20 {
    height: 29px!important;
}
.laytable-cell-1-0-21 {
    height: 29px!important;
}
.laytable-cell-1-0-22 {
    height: 29px!important;
}
.laytable-cell-1-0-23 {
    height: 29px!important;
}
.laytable-cell-1-0-24 {
    height: 29px!important;
}
.laytable-cell-1-0-25 {
    height: 29px!important;
}
.laytable-cell-1-0-26 {
    height: 29px!important;
}
.laytable-cell-1-0-27 {
    height: 29px!important;
}
.laytable-cell-1-0-28 {
    height: 29px!important;
}
.laytable-cell-1-0-29 {
    height: 29px!important;
}
.laytable-cell-1-0-30 {
    height: 29px!important;
}

/*
 * 模糊查询后居中
*/
.laytable-cell-2-0-2 {
    height: 29px!important;
}
.laytable-cell-2-0-3 {
    height: 29px!important;
}
.laytable-cell-2-0-5 {
    height: 29px!important;
}
.laytable-cell-2-0-4 {
    height: 29px!important;
}
.laytable-cell-2-0-6 {
    height: 29px!important;
}
.laytable-cell-2-0-7 {
    height: 29px!important;
}
.laytable-cell-2-0-8 {
    height: 29px!important;
}
.laytable-cell-2-0-9 {
    height: 29px!important;
}
.laytable-cell-2-0-10 {
    height: 29px!important;
}
.laytable-cell-2-0-11 {
    height: 29px!important;
}
.laytable-cell-2-0-12 {
    height: 29px!important;
}
.laytable-cell-2-0-13 {
    height: 29px!important;
}
.laytable-cell-2-0-14 {
    height: 29px!important;
}
.laytable-cell-2-0-15 {
    height: 29px!important;
}
.laytable-cell-2-0-16 {
    height: 29px!important;
}
.laytable-cell-2-0-17 {
    height: 29px!important;
}
.laytable-cell-2-0-18 {
    height: 29px!important;
}
.laytable-cell-2-0-19 {
    height: 29px!important;
}
.laytable-cell-2-0-20 {
    height: 29px!important;
}
.laytable-cell-2-0-21 {
    height: 29px!important;
}
.laytable-cell-2-0-22 {
    height: 29px!important;
}
.laytable-cell-2-0-23 {
    height: 29px!important;
}
.laytable-cell-2-0-24 {
    height: 29px!important;
}
.laytable-cell-2-0-25 {
    height: 29px!important;
}
.laytable-cell-2-0-26 {
    height: 29px!important;
}
.laytable-cell-2-0-27 {
    height: 29px!important;
}
.laytable-cell-2-0-28 {
    height: 29px!important;
}
.laytable-cell-2-0-29 {
    height: 29px!important;
}
.laytable-cell-2-0-30 {
    height: 29px!important;
}
.layui-table td, .layui-table th, .layui-table-col-set, .layui-table-fixed-r, .layui-table-grid-down, .layui-table-header, .layui-table-page, .layui-table-tips-main, .layui-table-tool, .layui-table-total, .layui-table-view, .layui-table[lay-skin=line], .layui-table[lay-skin=row] {
    border-width: 1px;
    border-style: solid;
    border-color: #666!important;
}
/* 滚动条  */
.layui-table-body {
    position: relative;
    overflow: auto;
    margin-right: -1px;
    margin-bottom: -1px;
    height: 668px;
}
/* 美化滚动条  */
 .layui-table-body::-webkit-scrollbar {
    width: 10px;
    height: 10px;
    background-color: #1b2334;
}
.layui-table-body::-webkit-scrollbar-thumb {
    background-color: #333!important;
    border-radius: 10px!important;
}

.layui-table-body::-webkit-scrollbar-thumb:hover {
    background-color: #777!important;
}

.layui-table-body::-webkit-scrollbar-track {
    box-shadow: inset 0 0 6px #333!important;
    border-radius: 10px!important;
}
 /* 半透明的遮罩层 */
.mask {
  width:100%;
		height:calc(100% - 40px);
		position:fixed;
		top:0;
		bottom:0;
		left:0;
		right:0;
		z-index:999;
		display:none;
		background-color:rgba(0,0,0,0.5);
}
.table {
    width: 100%;
    margin-top: -6px;
    border-collapse: collapse;
}
.table_ul {
    padding-top: 5px;
}
.table_ul li input {
    padding: 2px 8px;
    background: none;
    border: 1px solid #19378c;
    border-radius: 1px;
    color: #fff;
    height: 32px;
    background-color: #030a22;
}
.table_ul li {
    margin-right:0px!important;
    float: left;
    color: rgb(189, 202, 230);
}
.layui-table tbody tr:hover, .layui-table thead tr, .layui-table-click, .layui-table-header, .layui-table-hover, .layui-table-mend, .layui-table-patch, .layui-table-tool, .layui-table-total, .layui-table-total tr, .layui-table[lay-even] tr:nth-child(even) {
    background-color: #333!important;
}
 input::-webkit-input-placeholder {
          /* placeholder颜色  */
         color: #fff;
         /* placeholder字体大小  */
         font-size: 12px;
         /* placeholder位置  */
         text-align: right;
     }
 .fm{
    margin-left: 40px;
    margin-top: 10px;
    float: left;
    z-index: 100;
 }
 .table_ul li .seach_btns {
    padding: 4px 8px 4px 10px;
    width: 60px;
    background: #287fcb no-repeat 8px 6px;
    background-image: none;
    background-position-x: 8px;
    background-position-y: 6px;
    background-size: initial;
    background-repeat-x: no-repeat;
    background-repeat-y: no-repeat;
    background-attachment: initial;
    background-origin: initial;
    background-clip: initial;
    background-color: rgb(40, 127, 203);
    border: none;
    border-radius: 2px;
    cursor: pointer;
} 
.layui-table-tool-panel {
    position: absolute;
    top: 29px;
    left: -1px;
    padding: 5px 0;
    min-width: 150px;
    min-height: 40px;
    border: 1px solid #d2d2d2;
    text-align: left;
    overflow-y: auto;
    background-color: #1b2334!important;
    box-shadow: 0 2px 4px rgba(0,0,0,.12);
}
.layui-form-checkbox[lay-skin=primary] span {
    padding-left: 0;
    padding-right: 15px;
    line-height: 18px;
    background: 0 0;
    color: #fff!important;
}
.col-md-12 {
    width: 100%;
    z-index: 100!important;
}
</style>
<body class="peizhi_bg">
	<div class="index_top clearfix">
		<h3 class="fl title">态势监测 > 国家事件监测</h3>
		<input type="hidden" id="moduleCode" value="${moduleCode}">
	</div>
	<div class="index_bottom">
		<div class="table_box">
			<ul class="table_ul mgl-30 clearfix">
				<li><input type="text" id="s_configName" placeholder="请输入想要查询的国家名称"/></li>
				<li><input class="seach_btns" type="button" value="查询" onclick="cx()" ></li>
			</ul>
			<div class="table tabs">
             <table class="layui-table" id="dataTable" lay-filter="dataTable"></table>
            </div>
		</div>
		<div id="mask" class="mask"></div>
		<div class="bottom_echart" style="display: none"id="line">
					<div class="col-md-12">
	                	<div class="bot">
		                	<div id="btn-group" class="btn-group fm" style="width:170px;">
	                                     <input type="button" class="btns borcolor" id="carousel" value="大类分析">
	                                     <input type="button" class="btns"  value="根类分析">
	                         </div>
							<div class="country_sort">
								<span id="leaderName"></span><span class="seven"></span>
							</div>
							<div class="clearfloat" style="clear:both"></div>
							<div class="close_echarts"></div>
							<div class="float_right">
							<span>时间粒度：</span>
							<span class="circle" value="3"></span><span>年</span><span class="circle" value="2"></span><span>月</span><span class="circle" value="4" id="week"></span><span>周</span><span class="circle circleon" value="1" id="day"></span><span>日</span>
						</div>
					    </div>
	                </div>
	                <div id="quadclass_graph"  style="margin-top:20px;height: 315px;width: 100%;"></div>
	                <div id="eventroot"  style="margin-top:20px;height: 315px;width: 100%;display: none;"></div>
		</div>
	<!-- 条件tab页 st -->
	<jsp:include page="event_tab2.jsp"></jsp:include>
	</div>
	<jsp:include page="../updateUserPassword.jsp"/>
</body>
<script src="<%=basePath %>/static/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>/static/layui/layui.js"></script>
<link rel="stylesheet" href="<%=basePath%>/static/layui/css/layui.css">
<script src="<%=basePath %>/static/lib/jquery.pagination.js"></script>
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
<script src="<%=basePath %>/static/js/config/config.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
<c:if test="${bgFlag == null or bgFlag == 1}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
</c:if>
<!-- 人工查询js -->
<script src="<%=basePath %>/static/Visualization/rgQuery.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/downLoad.js"></script>
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<script type="text/javascript">
	var btnValue;
	var DateList = [];
	var allData = [];
	$(function(){
        //处理配置
		handleConfigs();
        //美化滚动条
    	glorifyComboSelect();
		//切换轮播图、折线图
    	$('.btns').on('click',function(){
			$(this).addClass('borcolor').siblings('.btns').removeClass('borcolor');
		    btnValue=$(this).attr('value');
		    if(btnValue=="大类分析"){
		    	//var layerIndex = layer.load(1); //添加laoding,0-2两种方式
		    	startLoad();
		    	$("#quadclass_graph").show();
		    	$("#eventroot").hide();
		    	 $("#day").addClass('circleon').siblings('.circle').removeClass('circleon');
		    	var countryCode=lineData.countryCode;//得到国家编码
		    	var flag=1;
				 $.ajax({
					url:'<%=basePath%>/twoQueryData/getEventTypeDataByCondtion/',
					type: 'POST',
					data:{"countryCode":countryCode,"flag":flag,"configId":configid},
					dataType:"json",
					success:function(data){
						 DateList = data.DateList;
						 allData = data.allData;
						 showline(DateList,allData);
						 //layer.close(layerIndex);
						 endLoad();
					}
				});  
		    }
		    if(btnValue=="根类分析"){
		    	startLoad();
		    	//var layerIndex = layer.load(1); //添加laoding,0-2两种方式
		    	$("#quadclass_graph").hide();
		    	$("#eventroot").show();
		    	$("#day").addClass('circleon').siblings('.circle').removeClass('circleon');
		    	var countryCode=lineData.countryCode;//得到国家编码
		    	var flag=2;
				 $.ajax({
					url:'<%=basePath%>/twoQueryData/getEventTypeDataByCondtion/',
					type: 'POST',
					data:{"countryCode":countryCode,"flag":flag,"configId":configid},
					dataType:"json",
					success:function(data){
						 DateList = data.DateList;
						 allData = data.allData;
						 linshow(DateList,allData);
						 //layer.close(layerIndex);
						 endLoad();
					}
				});  
		    }
    	})	
    	//切换大类时间线数据（年月周日）提出的公共方法     参数为截取的位数，注意周力度的数据比较特殊，需要特殊处理一下
       	function packDataQuadClassType(quadclass_data,len){
       		var date_news={};
            for(var i=0;i<quadclass_data.length;i++){
               	//比较每一个全量数据的日期是否包含截取到月的
           		var date_str=quadclass_data[i].date;
               	var q1 = quadclass_data[i]["利益冲突"];
               	var q2 = quadclass_data[i]["利益合作"];
               	var q3 = quadclass_data[i]["口头冲突"];
               	var q4 = quadclass_data[i]["口头合作"];
               	var allScale = quadclass_data[i]["allScale"];
               	var avgScale = quadclass_data[i]["avgScale"];
               	var allTone = quadclass_data[i]["allTone"];
               	var avgTone = quadclass_data[i]["avgTone"];
           		var data_string=date_str+"";
           		var date_class=data_string.substring(0,len);
           		if(len==2){
           			date_class = getWeekNum(data_string);
           		}
           		if(date_news[date_class] != undefined){
           			var Conflict= date_news[date_class]["利益冲突"];//利益冲突
                   	var Cooperation= date_news[date_class]["利益合作"];//利益合作
                   	var Verbal= date_news[date_class]["口头冲突"];//口头冲突
                   	var Verbal_Cooperation= date_news[date_class]["口头合作"];//口头合作
                   	var allScale1 = date_news[date_class]["allScale"];
                   	var avgScale1 = date_news[date_class]["avgScale"];
                   	var allTone1 = date_news[date_class]["allTone"];
                   	var avgTone1 = date_news[date_class]["avgTone"];
                   	date_news[date_class]["利益冲突"] = q1 + Conflict;
           			date_news[date_class]["利益合作"] = q2 + Cooperation;
           			date_news[date_class]["口头冲突"] = q3 + Verbal;
           			date_news[date_class]["口头合作"] = q4 + Verbal_Cooperation;
           			date_news[date_class]["allScale"] = allScale1 + allScale;
           			date_news[date_class]["avgScale"] = avgScale1 + avgScale;
           			date_news[date_class]["allTone"] = allTone1 + allTone;
           			date_news[date_class]["avgTone"] = avgTone1 + avgTone;
           			
           		}else{
           			var date_new = {};
           			date_new["利益冲突"] = q1;
           			date_new["利益合作"] = q2;
           			date_new["口头冲突"] = q3;
           			date_new["口头合作"] = q4;
           			date_new["allScale"] = allScale;
           			date_new["avgScale"] = avgScale;
           			date_new["allTone"] = allTone;
           			date_new["avgTone"] = avgTone;
           			date_news[date_class] = date_new;
           		}
            }
            var date_value=[];
            var quadclass_value=[];
            for(var obj in date_news){
           		var date_new = date_news[obj];
               	date_value.push(obj);
               	var d1={
           			"利益冲突":date_new["利益冲突"].toFixed(3),	
           			"利益合作":date_new["利益合作"].toFixed(3),
           			"口头冲突":date_new["口头冲突"].toFixed(3),
           			"口头合作":date_new["口头合作"].toFixed(3),
           			"allScale":date_new["allScale"].toFixed(3),
         			"avgScale":date_new["avgScale"].toFixed(3),
         			"allTone":date_new["allTone"].toFixed(3),
         			"avgTone":date_new["avgTone"].toFixed(3),
           			date:obj
               	}
               	quadclass_value.push(d1);
            }
            showline(date_value,quadclass_value);
       	}
    	//切换根类时间线数据（年月周日）提出的公共方法     参数为截取的位数，注意周力度的数据比较特殊，需要特殊处理一下
    	function packDataEventClassType(allEventroot_data,len){
    		var date_news = {};
    		for(var i=0;i<allEventroot_data.length;i++){
    			var e1 =  allEventroot_data[i]["公开声明"];
    			var e2 =  allEventroot_data[i]["呼吁"];
    			var e3 =  allEventroot_data[i]["表达合作意愿"];
    			var e4 =  allEventroot_data[i]["磋商"];
    			var e5 =  allEventroot_data[i]["开展外交合作"];
    			var e6 =  allEventroot_data[i]["开展实质合作"];
    			var e7 =  allEventroot_data[i]["提供援助"];
    			var e8 =  allEventroot_data[i]["屈服"];
    			var e9 =  allEventroot_data[i]["调查"];
    			var e10 = allEventroot_data[i]["要求"];
    			var e11 = allEventroot_data[i]["反对"];
    			var e12 = allEventroot_data[i]["拒绝"];
    			var e13 = allEventroot_data[i]["威胁"];
    			var e14 = allEventroot_data[i]["抗议"];
    			var e15 = allEventroot_data[i]["展示军事姿态"];
    			var e16 = allEventroot_data[i]["降低关系"];
    			var e17 = allEventroot_data[i]["强迫"];
    			var e18 = allEventroot_data[i]["袭击"];
    			var e19 = allEventroot_data[i]["战斗"];
    			var e20 = allEventroot_data[i]["非常规大规模暴力"];
    			var allScale = allEventroot_data[i]["allScale"];
               	var avgScale = allEventroot_data[i]["avgScale"];
               	var allTone = allEventroot_data[i]["allTone"];
               	var avgTone = allEventroot_data[i]["avgTone"];
    			var date_str=allEventroot_data[i].date;
        		var data_string=date_str+"";
        		var date_class=data_string.substring(0,len);
        		if(len==2){
        			date_class = getWeekNum(data_string);
        		}
        		if(date_news[date_class] != undefined){
        			var ee1 =  date_news[date_class]["公开声明"];
        			var ee2 =  date_news[date_class]["呼吁"];
        			var ee3 =  date_news[date_class]["表达合作意愿"];
        			var ee4 =  date_news[date_class]["磋商"];
        			var ee5 =  date_news[date_class]["开展外交合作"];
        			var ee6 =  date_news[date_class]["开展实质合作"];
        			var ee7 =  date_news[date_class]["提供援助"];
        			var ee8 =  date_news[date_class]["屈服"];
        			var ee9 =  date_news[date_class]["调查"];
        			var ee10 = date_news[date_class]["要求"];
        			var ee11 = date_news[date_class]["反对"];
        			var ee12 = date_news[date_class]["拒绝"];
        			var ee13 = date_news[date_class]["威胁"];
        			var ee14 = date_news[date_class]["抗议"];
        			var ee15 = date_news[date_class]["展示军事姿态"];
        			var ee16 = date_news[date_class]["降低关系"];
        			var ee17 = date_news[date_class]["强迫"];
        			var ee18 = date_news[date_class]["袭击"];
        			var ee19 = date_news[date_class]["战斗"];
        			var ee20 = date_news[date_class]["非常规大规模暴力"];
        			var allScale1 = date_news[date_class]["allScale"];
                   	var avgScale1 = date_news[date_class]["avgScale"];
                   	var allTone1 = date_news[date_class]["allTone"];
                   	var avgTone1 = date_news[date_class]["avgTone"];
        			date_news[date_class]["公开声明"] = e1+ee1;                
        			date_news[date_class]["呼吁"] = e2+ee2;                                 
        			date_news[date_class]["表达合作意愿"] = e3+ee3;        
        			date_news[date_class]["磋商"] = e4+ee4;                                
        			date_news[date_class]["开展外交合作"] = e5+ee5;   
        			date_news[date_class]["开展实质合作"] = e6+ee6;     
        			date_news[date_class]["提供援助"] = e7+ee7;                          
        			date_news[date_class]["屈服"] = e8+ee8;                                 
        			date_news[date_class]["调查"] = e9+ee9;                            
        			date_news[date_class]["要求"] = e10+ee10;                                
        			date_news[date_class]["反对"] = e11+ee11;                            
        			date_news[date_class]["拒绝"] = e12+ee12;                                 
        			date_news[date_class]["威胁"] = e13+ee13;                              
        			date_news[date_class]["抗议"] = e14+ee14;                               
        			date_news[date_class]["展示军事姿态"] = e15+ee15;             
        			date_news[date_class]["降低关系"] = e16+ee16;                     
        			date_news[date_class]["强迫"] = e17+ee17;                                 
        			date_news[date_class]["袭击"] = e18+ee18;                                
        			date_news[date_class]["战斗"] = e19+ee19;                                 
        			date_news[date_class]["非常规大规模暴力"] = e20+ee20; 
        			date_news[date_class]["allScale"] = allScale1 + allScale;
           			date_news[date_class]["avgScale"] = avgScale1 + avgScale;
           			date_news[date_class]["allTone"] = allTone1 + allTone;
           			date_news[date_class]["avgTone"] = avgTone1 + avgTone;
        		}else{
        			var date_new = {};
        			date_new["公开声明"] = e1;
        			date_new["呼吁"] = e2;
        			date_new["表达合作意愿"] = e3;
        			date_new["磋商"] = e4;
        			date_new["开展外交合作"] = e5;
        			date_new["开展实质合作"] = e6;
        			date_new["提供援助"] = e7;
        			date_new["屈服"] = e8;
        			date_new["调查"] = e9;
        			date_new["要求"] = e10;
        			date_new["反对"] = e11;
        			date_new["拒绝"] = e12;
        			date_new["威胁"] = e13;
        			date_new["抗议"] = e14;
        			date_new["展示军事姿态"] = e15;
        			date_new["降低关系"] = e16;
        			date_new["强迫"] = e17;
        			date_new["袭击"] = e18;
        			date_new["战斗"] = e19;
        			date_new["非常规大规模暴力"] = e19;
        			date_new["allScale"] = allScale;
           			date_new["avgScale"] = avgScale;
           			date_new["allTone"] = allTone;
           			date_new["avgTone"] = avgTone;
        			date_news[date_class] = date_new;
        		}
    		}
    		var date_value=[];
            var quadclass_value=[];
            for(var obj in date_news){
            	var date_new = date_news[obj];
            	date_value.push(obj);
            	var d1={
           			"公开声明":date_new["公开声明"].toFixed(3),
           			"呼吁":date_new["呼吁"].toFixed(3),	
           			"表达合作意愿":date_new["表达合作意愿"].toFixed(3),
           			"磋商":date_new["磋商"].toFixed(3),
           			"开展外交合作":date_new["开展外交合作"].toFixed(3),
           			"开展实质合作":date_new["开展实质合作"].toFixed(3),
           			"提供援助":date_new["提供援助"].toFixed(3),
           			"屈服":date_new["屈服"].toFixed(3),
           			"调查":date_new["调查"].toFixed(3),
           			"要求":date_new["要求"].toFixed(3),
           			"反对":date_new["反对"].toFixed(3),
           			"拒绝":date_new["拒绝"].toFixed(3),
           			"威胁":date_new["威胁"].toFixed(3),
           			"抗议":date_new["抗议"].toFixed(3),
           			"展示军事姿态":date_new["展示军事姿态"].toFixed(3),
           			"降低关系":date_new["降低关系"].toFixed(3),
           			"强迫":date_new["强迫"].toFixed(3),
           			"袭击":date_new["袭击"].toFixed(3),
           			"战斗":date_new["战斗"].toFixed(3),
           			"非常规大规模暴力":date_new["非常规大规模暴力"].toFixed(3),
           			"allScale":date_new["allScale"].toFixed(3),
         			"avgScale":date_new["avgScale"].toFixed(3),
         			"allTone":date_new["allTone"].toFixed(3),
         			"avgTone":date_new["avgTone"].toFixed(3),
           			date:obj
            	}
            	quadclass_value.push(d1);
            }
            linshow(date_value,quadclass_value);
    	}
   	    $('.circle').on('click',function(){
    	   $(this).addClass('circleon').siblings('.circle').removeClass('circleon');
    	   var selectVal=$(this).attr('value');
	       if(btnValue=="大类分析"){
	    		var dateList=DateList;
	    		var dataYvalue=allData;
	    		if(selectVal=="1"){
				   showline(dateList,dataYvalue);
	   			}
	   			if(selectVal=="2"){
	   				packDataQuadClassType(dataYvalue,6);
                }
	   			if(selectVal=="3"){
	   				packDataQuadClassType(dataYvalue,4);
                }
	   			if(selectVal=="4"){
	   				packDataQuadClassType(dataYvalue,2);
                }
    	   }   
	       if(btnValue=="根类分析"){
	    		var dateList=DateList ;
	    		var dataYvalue=allData;
	    		if(selectVal=="1"){
				    linshow(dateList,dataYvalue);
	   			}
	   			if(selectVal=="2"){
	   				packDataEventClassType(dataYvalue,6);
                }
	   			if(selectVal=="3"){
	   				packDataEventClassType(dataYvalue,4);
                }
	   			if(selectVal=="4"){
	   				packDataEventClassType(dataYvalue,2);
                }
   		   }   
       })
	});
	//弹出框关闭按钮
	$('.close_echarts').on('click',function(){
 	   $("#mask").hide();
		$(this).parent().parent().parent().toggle()
	})
	var configid=0;
	function render(configId){
		configid=configId;
		startLoad();
		$.ajax({
			url:'<%=basePath%>/search/event_country_monitor/'+configId,
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
	
	var tableData=[];
	function renderData(data){
		tableData = data.tableData;
		showData(tableData);
		$("#day").addClass('circleon').siblings('.circle').removeClass('circleon');
		//$("#day").click();
	}
	//渲染表格
	function showData(tableData){
		layui.use('table',function(){
			var table = layui.table;
			var element=layui.element;
			table.render({
				elem:'#dataTable',
				toolbar:true,
				cols:[[
					 {type:'numbers','align':'center',width:40,title:'序号',fixed: 'left'},
					 {field:'countryCode','align':'center',width:87,title:'国旗',templet:"#head",fixed: 'left'},
					 {field:'countryName','align':'center',width:187,title:'国家名称',fixed: 'left'},
					 {field:'allScale','align':'center',width:170,title:'稳定总值',sort:true},
					 {field:'avgScale','align':'center',width:170,title:'稳定平均值',sort:true},
					 {field:'allTone','align':'center',width:170,title:'情感总值',sort:true},
					 {field:'avgTone','align':'center',width:170,title:'情感平均值',sort:true},
					 {field:'q1','align':'center',width:110,title:'口头合作',sort:true,templet:function(obj){return percentTodecmal(obj,'q1');}},
					 {field:'q2','align':'center',title:'利益合作',sort:true,templet:function(obj){return percentTodecmal(obj,'q2');}},
					 {field:'q3',width:100,title:'口头冲突',sort:true,templet:function(obj){return percentTodecmal(obj,'q3');}},
                     {field:'q4',width:100,title:'利益冲突',sort:true,templet:function(obj){return percentTodecmal(obj,'q4');}},
                     {field:'e1',width:100,title:'公开声明',sort:true,templet:function(obj){return percentTodecmal(obj,'e1');}},
                     {field:'e2',width:100,title:'呼吁',sort:true,templet:function(obj){return percentTodecmal(obj,'e2');}},
                     {field:'e3',width:100,title:'表达合作意愿',sort:true,templet:function(obj){return percentTodecmal(obj,'e3');}},
                     {field:'e4',width:100,title:'磋商',sort:true,templet:function(obj){return percentTodecmal(obj,'e4');}},
                     {field:'e5',width:100,title:'开展外交合作',sort:true,templet:function(obj){return percentTodecmal(obj,'e5');}},
                     {field:'e6',width:100,title:'开展实质合作',sort:true,templet:function(obj){return percentTodecmal(obj,'e6');}},
                     {field:'e7',width:100,title:'提供援助',sort:true,templet:function(obj){return percentTodecmal(obj,'e7');}},
                     {field:'e8',width:100,title:'屈服',sort:true,templet:function(obj){return percentTodecmal(obj,'e8');}},
                     {field:'e9',width:100,title:'调查',sort:true,templet:function(obj){return percentTodecmal(obj,'e9');}},
                     {field:'e10',width:100,title:'要求',sort:true,templet:function(obj){return percentTodecmal(obj,'e10');}},
                     {field:'e11',width:100,title:'反对',sort:true,templet:function(obj){return percentTodecmal(obj,'e11');}},
                     {field:'e12',width:100,title:'拒绝',sort:true,templet:function(obj){return percentTodecmal(obj,'e12');}},
                     {field:'e13',width:100,title:'威胁',sort:true,templet:function(obj){return percentTodecmal(obj,'e13');}},
                     {field:'e14',width:100,title:'抗议',sort:true,templet:function(obj){return percentTodecmal(obj,'e14');}},
                     {field:'e15',width:100,title:'展示军事姿态',sort:true,templet:function(obj){return percentTodecmal(obj,'e15');}},
                     {field:'e16',width:100,title:'降低关系',sort:true,templet:function(obj){return percentTodecmal(obj,'e16');}},
                     {field:'e17',width:100,title:'强迫',sort:true,templet:function(obj){return percentTodecmal(obj,'e17');}},
                     {field:'e18',width:100,title:'袭击',sort:true,templet:function(obj){return percentTodecmal(obj,'e18');}},
                     {field:'e19',width:100,title:'战斗',sort:true,templet:function(obj){return percentTodecmal(obj,'e19');}},
                     {field:'e20',width:100,title:'非常规大规模暴力',sort:true,templet:function(obj){return percentTodecmal(obj,'e20');}},
					  ]],
		       	 data:tableData,
		         page:false,
		       	 limit:tableData.length,
		       	done:function(res){
		       		//element.init();
		       		//hideDiv(num);
	       			var arr = document.getElementsByClassName("layui-inline");
	       			arr[2].parentNode.removeChild(arr[2])
	       			arr[1].parentNode.removeChild(arr[1])
		       	}
			})
				
		});
	}
	//截取小数点后三位	
	function percentTodecmal(obj,number){
		var numbers = obj[number];
		if(numbers==0){
			return numbers
		}else{
			var numberFix=numbers.toFixed(3);
			return numberFix;
		}
		
	}
	//点击行事件弹出框
	var lineData;
	layui.use('table',function(){
	var table = layui.table;
	var element = layui.element;
	//layer = layui.layer;
		table.on('row(dataTable)', function(obj){
			//var layerIndex = layer.load(1); //添加laoding,0-2两种方式
			$("#day").addClass('circleon').siblings('.circle').removeClass('circleon');
			startLoad();
			lineData=obj.data;//获取行数据
			var countryCode=lineData.countryCode;//得到国家编码
			var countryName=lineData.countryName;
			var countryNameStr=countryName.substring(0,countryName.indexOf("("));
			var flag=1;
			$("#mask").show();//遮罩层弹出
		    $("#leaderName").html(countryNameStr+"—"+"事件分析");//按国旗名字动态加载标题
			$("#line").css("display","block");//折线图显示
		  	$.ajax({
				url:'<%=basePath%>/twoQueryData/getEventTypeDataByCondtion/',
				type: 'POST',
				data:{"countryCode":countryCode,"flag":flag,"configId":configid},
				dataType:"json",
				success:function(data){
					btnValue = "大类分析";
					DateList = data.DateList;
					allData = data.allData;
					showline(DateList,allData);
					//layer.close(layerIndex);    //返回数据关闭loading
					endLoad();
				}
			});
			//$("#carousel").click();
			/* alert(countryCode);
			var data = {"DateList":["20180801","20180801","20180801","20180801","20180801"],"allData":[[222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111],[222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111],[222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111],[222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111],[222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111],[222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111],[222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111],[222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111,222,111]]};
			//var data={"DateList":[],"allData":[]};
			var DateList = data.DateList;
			var allData = data.allData;
			linshow(DateList,allData);	  */
		});
		table.on('sort(dataTable)', function(obj){
				  //console.log(obj.tr) //得到当前行元素对象
			element.init(); //得到当前行数据
				
		});
    })
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
    function showline(DateList,allData){
    	
    	//获取双y轴的最大值
    	var maxCountValue = 0;
		var maxToneScale = 0;
		for(var i=0;i<allData.length;i++ ){
			var tem = allData[i];
			var sumData = Math.abs(tem['口头合作']) + Math.abs(tem['利益合作'])+ Math.abs(tem['口头冲突'])+Math.abs(tem['利益冲突']);
			if(sumData>maxCountValue){
				maxCountValue = sumData;
			}
			if(Math.abs(tem['allScale'])>maxToneScale){
				maxToneScale = Math.abs(tem['allScale']);
			}
			if(Math.abs(tem['avgScale'])>maxToneScale){
				maxToneScale = Math.abs(tem['avgScale']);
			}
			if(Math.abs(tem['allTone'])>maxToneScale){
				maxToneScale = Math.abs(tem['allTone']);
			}
			if(Math.abs(tem['avgTone'])>maxToneScale){
				maxToneScale = Math.abs(tem['avgTone']);
			}
		}
    	
		var legName=['口头合作', '利益合作', '口头冲突', '利益冲突','稳定总值',"稳定均值","情感总值","情感均值"];	
	    var timeline_chart = echarts.init(document.getElementById('quadclass_graph'));
		var option = {
			backgroundColor: '#1b233482',
		    color: ['#90ee90', '#32cd32', '#ffb90f', '#ff8c00'],
		    tooltip: {
		        trigger: 'axis',
		        axisPointer: {
		            type: 'line'
		        }
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
		    legend: {
		    	 textStyle: {
			            color: '#fff',
			            fontSize: '12'
			        },
			        type: 'scroll',
		        data: legName
		    },
		    grid: {
		        left: '3%',
		        right: '3%',
		        bottom: '15%',
		        top: '20%',
		        containLabel: true,
		        z: 22
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
		    yAxis: [{
		        type: 'value',
		        name:'数量(比重)',
		        min:-(maxCountValue),
		        max:maxCountValue,
		        splitLine: {
		            show: false,
		          },
		         axisLine: {
		                lineStyle: {
		                    color: '#fff'
		                }
		            },
		            axisLabel: {
		                color: '#ffff',
		                formatter: '{value} '
		            }
		    },
		    {
		        type: 'value',
		        name:'情感/稳定',
		        min:-(maxToneScale),
		        max:maxToneScale,
		        splitLine: {
		            show: false,
		          },
		         axisLine: {
		                lineStyle: {
		                    color: '#fff'
		                }
		            },
		            axisLabel: {
		                color: '#ffff',
		                formatter: '{value} '
		            }
		    }
		    ],
		    xAxis: [{
		        type: 'category',
		        splitLine: {
		            show: false,
		          },
		         axisLine: {
		            lineStyle: {
		                color: '#fff'
		            }
		        },
		        axisLabel: {
		            show: true,
		             color: '#ffff',
		             fontSize:14
		        },
		        data:DateList
		    }],
		    series: [{
		            name: '口头合作',
		            type: 'bar',
		            stack: '总量',
		            barWidth: '16px',
		            data: getDataByCat(legName[0],allData),
		            // markArea: areaStyle
		        },
		        {
		            name: '利益合作',
		            type: 'bar',
		            stack: '总量',
		            data: getDataByCat(legName[1],allData),
		            // markArea: areaStyle
		        },
		        {
		            name: '口头冲突',
		            type: 'bar',
		            stack: '总量',
		            data:  getDataByCat(legName[2],allData),
		            // markArea: areaStyle
		        },
		        {
		            name: '利益冲突',
		            type: 'bar',
		            stack: '总量',
		            data:  getDataByCat(legName[3],allData),
		            // markArea: areaStyle
		        },
		        {
		           "name": "稳定总值",
		            "type": "line",
		            "stack": "总量",
		            symbolSize:10,
		            yAxisIndex: 1,
		            symbol:'circle',
		           smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
		                                    symbolSize: 0,
		                                    itemStyle: {
		                			            normal: {
		                			            	color:'#1a9bfc',
		                			                lineStyle: {
		                			                    width: 1,
		                			                    type: 'dotted' //'dotted'虚线 'solid'实线
		                			                },
		                			                barBorderRadius: 0,
		                			                label: {
		                			                    show: false,
		                			                }
		                			            }
		                			        },
		            "data": getDataByCat("allScale",allData)
		            // markArea: areaStyle
		        },
		        {
			           "name": "稳定均值",
			            "type": "line",
			            "stack": "总量",
			            symbolSize:10,
			            yAxisIndex: 1,
			            symbol:'circle',
			           smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
			                                    symbolSize: 0,
			                                    itemStyle: {
			                			            normal: {
			                			            	color:'#e32f46',
			                			                lineStyle: {
			                			                    width: 1,
			                			                    type: 'dotted' //'dotted'虚线 'solid'实线
			                			                },
			                			                barBorderRadius: 0,
			                			                label: {
			                			                    show: false,
			                			                }
			                			            }
			                			        },
			            "data":getDataByCat("avgScale",allData)
			            // markArea: areaStyle
			        },
			        {
				           "name": "情感总值",
				            "type": "line",
				            "stack": "总量",
				            symbolSize:10,
				            yAxisIndex: 1,
				            symbol:'circle',
				            smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                            symbolSize: 0,
                            itemStyle: {
        			            normal: {
        			            	color:'#7049f0',
        			                lineStyle: {
        			                    width: 1,
        			                    type: 'dotted' //'dotted'虚线 'solid'实线
        			                },
        			                barBorderRadius: 0,
        			                label: {
        			                    show: false,
        			                }
        			            }
        			        },
				            "data": getDataByCat("allTone",allData)
				            // markArea: areaStyle
				        },
				        {
					            "name": "情感均值",
					            "type": "line",
					            "stack": "总量",
					            symbolSize:10,
					            yAxisIndex: 1,
					            symbol:'circle',
					            smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                symbolSize: 0,
                                itemStyle: {
           			            normal: {
           			            	color:'#fa704d',
           			                lineStyle: {
           			                    width: 1,
           			                    type: 'dotted' //'dotted'虚线 'solid'实线
           			                },
           			                barBorderRadius: 0,
           			                label: {
           			                    show: false,
           			                }
           			            }
           			        },
					            "data": getDataByCat("avgTone",allData)
					            // markArea: areaStyle
					        }
		    ]
		};
		 timeline_chart.setOption(option);
         //调节echarts图表自适应
         window.onresize=function (){
         	timeline_chart.resize();
         }
	}
	//根类折线图
	function linshow(DateList,allData){
		 var legName=['公开声明', '呼吁','表达合作意愿', '磋商', '开展外交合作', '开展实质合作', '提供援助', '屈服', '调查', '要求','反对', '拒绝'
				        	, '威胁', '抗议', '展示军事姿态', '降低关系', '强迫', '袭击', '战斗', '非常规大规模暴力','稳定总值',"稳定均值","情感总值","情感均值"
				        	  ]; 
		 
		//获取双y轴的最大值
    	var maxCountValue = 0;
		var maxToneScale = 0;
		for(var i=0;i<allData.length;i++ ){
			var tem = allData[i];
			var sumData = Math.abs(tem['公开声明'])+Math.abs(tem['呼吁'])+Math.abs(tem['表达合作意愿'])+Math.abs(tem['磋商'])+Math.abs(tem['开展外交合作'])
						 +Math.abs(tem['开展实质合作'])+Math.abs(tem['提供援助'])+Math.abs(tem['屈服'])+Math.abs(tem['调查'])+Math.abs(tem['要求'])+Math.abs(tem['反对'])
						 +Math.abs(tem['拒绝'])+Math.abs(tem['威胁'])+Math.abs(tem['抗议'])+Math.abs(tem['展示军事姿态'])
			             +Math.abs(tem['降低关系'])+Math.abs(tem['强迫'])+Math.abs(tem['袭击'])+Math.abs(tem['战斗'])+Math.abs(tem['非常规大规模暴力']);
			if(sumData>maxCountValue){
				maxCountValue = sumData;
			}
			if(Math.abs(tem['allScale'])>maxToneScale){
				maxToneScale = Math.abs(tem['allScale']);
			}
			if(Math.abs(tem['avgScale'])>maxToneScale){
				maxToneScale = Math.abs(tem['avgScale']);
			}
			if(Math.abs(tem['allTone'])>maxToneScale){
				maxToneScale = Math.abs(tem['allTone']);
			}
			if(Math.abs(tem['avgTone'])>maxToneScale){
				maxToneScale = Math.abs(tem['avgTone']);
			}
		}
		
		 var barline_chart = echarts.init(document.getElementById('eventroot'));
			var option = {
				backgroundColor: '#1b233482',
			    color: ['#4162ff', '#c78b42', '#CD3F2A', '#ff6e72', '#9692ff'],
			    tooltip: {
			        /* trigger: 'axis',
			        axisPointer: {
			            type: 'line'
			        } */
			        trigger: 'item',
  		            axisPointer: {
  		            	type: 'cross'
  		        	}
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
			    legend: {
			    	 textStyle: {
				            color: '#fff',
				            fontSize: '12'
				        },
				        type: 'scroll',
				        width:"80%",
				        height:"20%",
			        data: legName
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
    		    grid: {
    		        left: '3%',
    		        right: '3%',
    		        bottom: '15%',
    		        top: '20%',
    		        containLabel: true,
    		        z: 22
    		    },
			    yAxis: [{
			        type: 'value',
			        name:'数量(比重)',
			        min:-(maxCountValue),
			        max:maxCountValue,
			        splitLine: {
			            show: false,
			          },
			         axisLine: {
			                lineStyle: {
			                    color: '#fff'
			                }
			            },
			            axisLabel: {
			                color: '#ffff',
			                formatter: '{value} '
			            }
			    },{
			        type: 'value',
			        name:'情感/稳定',
			        min:-(maxToneScale),
			        max:maxToneScale,
			        splitLine: {
			            show: false,
			          },
			         axisLine: {
			                lineStyle: {
			                    color: '#fff'
			                }
			            },
			            axisLabel: {
			                color: '#ffff',
			                formatter: '{value} '
			            }
			    }
			    ],
			    xAxis: [{
			        type: 'category',
			        splitLine: {
			            show: false,
			          },
			         axisLine: {
			            lineStyle: {
			                color: '#fff'
			            }
			        },
			        axisLabel: {
			            show: true,
			             color: '#ffff',
			             fontSize:14
			        },
			        data:DateList
			    }],
			    series: [{
			            name: '公开声明',
			            type: 'bar',
			            stack: '总量',
			            barWidth: '16px',
			            data: getDataByCat(legName[0],allData) ,
			            // markArea: areaStyle
			        },
			        {
			            name: '呼吁',
			            type: 'bar',
			            stack: '总量',
			            data:  getDataByCat(legName[1],allData),
			            // markArea: areaStyle
			        },
			        {
			            name: '表达合作意愿',
			            type: 'bar',
			            stack: '总量',
			            data:  getDataByCat(legName[2],allData),
			            // markArea: areaStyle
			        },
			        {
			            name: '磋商',
			            type: 'bar',
			            stack: '总量',
			            data:  getDataByCat(legName[3],allData),
			            // markArea: areaStyle
			        },
			        {
			            name: '开展外交合作',
			            type: 'bar',
			            stack: '总量',
			            data:  getDataByCat(legName[4],allData),
			            // markArea: areaStyle
			        },
			        {
			            name: '开展实质合作',
			            type: 'bar',
			            stack: '总量',
			            data:  getDataByCat(legName[5],allData),
			            // markArea: areaStyle
			        },
			        {
			            name: '提供援助',
			            type: 'bar',
			            stack: '总量',
			            data:  getDataByCat(legName[6],allData),
			            // markArea: areaStyle
			        },
			        {
			            name: '屈服',
			            type: 'bar',
			            stack: '总量',
			            data:  getDataByCat(legName[7],allData),
			            // markArea: areaStyle
			        },
			        {
			            name: '调查',
			            type: 'bar',
			            stack: '总量',
			            data:  getDataByCat(legName[8],allData),
			            // markArea: areaStyle
			        },
			        {
			            name: '要求',
			            type: 'bar',
			            stack: '总量',
			            data:  getDataByCat(legName[9],allData),
			            // markArea: areaStyle
			        },
			        {
			            name: '反对',
			            type: 'bar',
			            stack: '总量',
			            data:  getDataByCat(legName[10],allData),
			            // markArea: areaStyle
			        },
			        {
			            name: '拒绝',
			            type: 'bar',
			            stack: '总量',
			            data:  getDataByCat(legName[11],allData),
			            // markArea: areaStyle
			        },
			        {
			            name: '威胁',
			            type: 'bar',
			            stack: '总量',
			            data:  getDataByCat(legName[12],allData),
			            // markArea: areaStyle
			        },
			        {
			            name: '抗议',
			            type: 'bar',
			            stack: '总量',
			            data:  getDataByCat(legName[13],allData),
			            // markArea: areaStyle
			        },
			        {
			            name: '展示军事姿态',
			            type: 'bar',
			            stack: '总量',
			            data:  getDataByCat(legName[14],allData),
			            // markArea: areaStyle
			        },
			        {
			            name: '降低关系',
			            type: 'bar',
			            stack: '总量',
			            data:  getDataByCat(legName[15],allData),
			            // markArea: areaStyle
			        },
			        {
			            name: '强迫',
			            type: 'bar',
			            stack: '总量',
			            data:  getDataByCat(legName[16],allData),
			            // markArea: areaStyle
			        },
			        {
			            name: '袭击',
			            type: 'bar',
			            stack: '总量',
			            data:  getDataByCat(legName[17],allData),
			            // markArea: areaStyle
			        },
			        {
			            name: '战斗',
			            type: 'bar',
			            stack: '总量',
			            data:  getDataByCat(legName[18],allData),
			            // markArea: areaStyle
			        },
			        {
			            name: '非常规大规模暴力',
			            type: 'bar',
			            stack: '总量',
			            data:  getDataByCat(legName[19],allData),
			            // markArea: areaStyle
			        },
			        {
				           "name": "稳定总值",
				            "type": "line",
				            "stack": "总量",
				            symbolSize:10,
				            yAxisIndex: 1,
				            symbol:'circle',
				           smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
				                                    symbolSize: 0,
				                                    itemStyle: {
				                			            normal: {
				                			            	color:'#1a9bfc',
				                			                lineStyle: {
				                			                    width: 1,
				                			                    type: 'dotted' //'dotted'虚线 'solid'实线
				                			                },
				                			                barBorderRadius: 0,
				                			                label: {
				                			                    show: false,
				                			                }
				                			            }
				                			        },
				            "data": getDataByCat("allScale",allData)
				            // markArea: areaStyle
				        },
				        {
					           "name": "稳定均值",
					            "type": "line",
					            "stack": "总量",
					            symbolSize:10,
					            symbol:'circle',
					            yAxisIndex: 1,
					            smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                symbolSize: 0,
                                 itemStyle: {
             			            normal: {
             			            	color:'#e32f46',
             			                lineStyle: {
             			                    width: 1,
             			                    type: 'dotted' //'dotted'虚线 'solid'实线
             			                },
             			                barBorderRadius: 0,
             			                label: {
             			                    show: false,
             			                }
             			            }
             			        },
					            "data": getDataByCat("avgScale",allData)
					            // markArea: areaStyle
					        },
					        {
						           "name": "情感总值",
						            "type": "line",
						            "stack": "总量",
						            symbolSize:10,
						            symbol:'circle',
						            yAxisIndex: 1,
						            smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                    symbolSize: 0,
                                    itemStyle: {
                			            normal:{
                			            	color:'#7049f0',
                			                lineStyle: {
                			                    width: 1,
                			                    type: 'dotted' //'dotted'虚线 'solid'实线
                			                },
                			                barBorderRadius: 0,
                			                label: {
                			                    show: false,
                			                }
                			            }
                			        },
						            "data": getDataByCat("allTone",allData)
						            // markArea: areaStyle
						        },
						        {
							           "name": "情感均值",
							            "type": "line",
							            "stack": "总量",
							            symbolSize:10,
							            symbol:'circle',
							            yAxisIndex: 1,
							            smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
	                                    symbolSize: 0,
	                                    itemStyle: {
	                			            normal: {
	                			            	color:'#fa704d',
	                			                lineStyle: {
	                			                    width: 1,
	                			                    type: 'dotted' //'dotted'虚线 'solid'实线
	                			                },
	                			                barBorderRadius: 0,
	                			                label: {
	                			                    show: false,
	                			                }
	                			            }
	                			        },
							            "data":  getDataByCat("avgTone",allData)
							            // markArea: areaStyle
							        }
				    ]
				};
			barline_chart.setOption(option);
	         //调节echarts图表自适应
	         window.onresize=function (){
	        	 barline_chart.resize();
	         }
	} 
	//根据国家名称进行查询
	 function cx(){
			//获取查询条件
			var dataTable=[];
			var lname = $("#s_configName").val();
			for(var i=0;i<tableData.length;i++){
				if(tableData[i].countryName.indexOf(lname)>-1){
					dataTable.push(tableData[i]);
				}
			}
			showData(dataTable)
			/* var obj = {};
			obj.name =  ;
			//调用layui的table，reload方法
			layui.use('table',function(){
				var table = layui.table;
				table.reload('dataTable',{
					where:obj//参数值
				})
			}) 
			var newData = {};
			for(var b in countryTableData){
				if(b.indexOf(input)!=-1){
					newData[b]=countryTableData[b];
				}
			}
			packTable(newData);
			*/
		}
</script>
<script type="text/html" id="head">
<img  src="<%=basePath %>/static/Visualization/img/flags/{{d.jack}}.gif"" height="50px" width="50px">
</script>
</html>
