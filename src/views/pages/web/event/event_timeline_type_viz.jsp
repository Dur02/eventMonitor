<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>类型时间演化</title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/style.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath%>/static/lib/pagination.css" />
<!--人工查询 -->
<link rel="stylesheet" href="<%=basePath%>/static/css/combo.select.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/perfect-scrollbar.css" />
<link rel="shortcut icon" type="image/x-icon" href="<%=basePath%>/static/Visualization/base/ico.png" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/base.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/css/event_result.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/js/amcharts/export/export.css"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/leaflet.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/dvf.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/example.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/ui.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/situationalmap.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/export.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window_zs.css"/><!-- 弹出提示框样式 -->
<script src="<%=basePath%>/static/js/jquery-1.9.1.min.js"></script>
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
<style type="text/css">
    .index_bottom{
		background-image: url(<%=basePath%>/static/css/img/bg_new.png);
		background-repeat: no-repeat;
		background-size: 100% 100%;
		position: relative;
		overflow: hidden;
	}
	.country_sort {
	    width: 16%;
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
    margin: -2.2% 2% 0 0;
    cursor: pointer;
    font-family: SimSun;
    font-weight: 400;
    color: rgb(234, 235, 237);
}
.float_right_buttom {
    display: flex;
    height: 38px;
    align-items: center;
    float: right;
    margin: -2.2% 12% 0 0;
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
    margin-left: 38%;
}
.lboTime{
     height:360px;
    width: 30%;
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
    left: 148%!important;
    top: 2px;
}
.timeRange{
	width: 240px;
    height: 24px;
    position: absolute;
    top: 158px;
    left: -57%;
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
</style>
</head>
<body>
	<div class="index_top clearfix">
		<h3 class="fl title">事件库分析 > 类型时间演化</h3>
		<input type="hidden" id="moduleCode" value="${moduleCode}">
	</div>
	<div class="index_bottom" style="padding:0;padding-top:36px; height: 98.8% !important;">
		<div class="data show">
			<div class="row" style="margin-top: 10px!important">
			<div class="col-md-12 mg_t mg_b">
	                <div class="col-md-12 bor" style="height: 365px;">
	                	<div class="col-md-12">
	                			<h3 class="country_sort"><span>大类时间线展示</span> 
	                			<%-- <div  class="help" onmouseenter="showChartInfo(2,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div> --%>
	                		</h3>
	                		<div class="float_right">
							<span>时间粒度：</span>
							<span class="circle" value="3"></span><span>年</span><span class="circle" value="2"></span><span>月</span><span class="circle" value="4" id="week"></span><span>周</span><span class="circle circleon" value="1" id="day"></span><span>日</span>
						</div>
	                    </div>
	                    <div id="quadclass_graph"  style="margin-top:32px;height: 315px;width: 100%;"></div>
	                </div>
	            </div>
	            <div class="col-md-12">
	                <div class="col-md-12 bor" style="margin-top: -64px; height: 410px;">
	               	<h3 class="country_sort"><span>根类时间演化展示</span> 
	               		<%-- <div  class="help" onmouseenter="showChartInfo(1,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div> --%>
	               	</h3>
	                    <div class="col-md-7">
	                 <div class="lboTime">
	                
	            	 <input type="text" id="four_date_range" class="timeRange" >
	                 <div class="timeout" id="date">
	                  
	                 </div>
	                 <div>
	                    <img alt="" src="<%=basePath%>/static/images/play.png"style="margin-top: 85px;"id="style_start" onclick="styleStart()">
	                    <img alt="" src="<%=basePath%>/static/images/stop.png"style="margin-top: 85px;display: none;"id="style_stop">                 
	                 </div>       
	                 </div>   
	                        <div id="eventroot_graph" style="height: 400px;width:70%; margin-top:-571px;margin-left: 266px;">
	                        </div>
	                    </div>
	                    <div class="col-md-5">	
	                        <div class="row" style="margin-top:-34px!important">
	                        	<div id="btn-group" class="btn-group fr" style="width:140px;">
                                     <input type="button" class="btns borcolor" id="carousel" value="轮播图">
                                     <input type="button" class="btns"  value="折线图">
                                </div>
                                
	                        	<!-- <input class="fr" type="text" id="four_date_range" readonly style="width:240px;text-align:center; line-height:35px;"> -->
	                        </div>
		                    <div id="listsh" style="border-top:1px solid #d6d6d6; border-left:1px solid #d6d6d6; margin-top:31px; margin-left: -50px; border-radius:3px;">
		                        <div class="row row_b_b">
	                                <div class="col-md-3 key" id= "gksm"></div>
	                                <div class="col-md-3 val" id="eventroot_1"></div>
	                                <div class="col-md-3 key" id= "shangsu"></div>
	                                <div class="col-md-3 val" id="eventroot_2"></div>
	                            </div>
		                        <div class="row row_b_b">
		                        	 <div class="col-md-3 key" id= "hzyx"></div>
                                	 <div class="col-md-3 val" id="eventroot_3"></div>
	                                 <div class="col-md-3 key" id= "zixun"></div>
	                                 <div class="col-md-3 val" id="eventroot_4"></div>
		                        </div>
		                        <div class="row row_b_b">
		                       		 <div class="col-md-3 key" id= "wjhz"></div>
                                	 <div class="col-md-3 val" id="eventroot_5"></div>
	                                 <div class="col-md-3 key" id= "wzhz"></div>
	                                 <div class="col-md-3 val" id="eventroot_6"></div>
		                        </div>
		                        <div class="row row_b_b">
		                        	<div class="col-md-3 key" id= "tgyz"></div>
                                	 <div class="col-md-3 val" id="eventroot_7"></div>
	                                 <div class="col-md-3 key" id= "touxiang"></div>
	                                 <div class="col-md-3 val" id="eventroot_8"></div>
		                            <!-- <div class="col-md-6">
		                                <div class="col-md-8 talign_r"><span id= "tgyz"></span></div>
		                                <div class="col-md-4">
		                                    <input type="text" id="eventroot_7" style="width:60px; border: 0px;">
		                                </div>
		                            </div>
		                            <div class="col-md-6">
		                                <div class="col-md-8 talign_r"><span id= "touxiang"></span></div>
		                                <div class="col-md-4">
		                                    <input type="text" id="eventroot_8" style="width:60px; border: 0px;">
		                                </div>
		                            </div> -->
		                        </div>
		                        <div class="row row_b_b">
		                        	<div class="col-md-3 key" id= "yanjiu"></div>
                                	 <div class="col-md-3 val" id="eventroot_9"></div>
	                                 <div class="col-md-3 key" id= "xuqiu"></div>
	                                 <div class="col-md-3 val" id="eventroot_10"></div>
		                            <!-- <div class="col-md-6">
		                                <div class="col-md-8 talign_r"><span id= "yanjiu"></span></div>
		                                <div class="col-md-4">
		                                    <input type="text" id="eventroot_9" style="width:60px; border: 0px;">
		                                </div>
		                            </div>
		                            <div class="col-md-6">
		                                <div class="col-md-8 talign_r"><span id= "xuqiu"></span></div>
		                                <div class="col-md-4">
		                                    <input type="text" id="eventroot_10" style="width:60px; border: 0px;">
		                                </div>
		                            </div> -->
		                        </div>
		                        <div class="row row_b_b">
		                        	<div class="col-md-3 key" id= "fandui"></div>
                                	 <div class="col-md-3 val" id="eventroot_11"></div>
	                                 <div class="col-md-3 key" id= "jujue"></div>
	                                 <div class="col-md-3 val" id="eventroot_12"></div>
		                            <!-- <div class="col-md-6">
		                                <div class="col-md-8 talign_r"><span id= "fandui"></span></div>
		                                <div class="col-md-4">
		                                    <input type="text" id="eventroot_11" style="width:60px; border: 0px;">
		                                </div>
		                            </div>
		                            <div class="col-md-6">
		                                <div class="col-md-8 talign_r"><span id= "jujue"></span></div>
		                                <div class="col-md-4">
		                                    <input type="text" id="eventroot_12" style="width:60px; border: 0px;">
		                                </div>
		                            </div> -->
		                        </div>
		                        <div class="row row_b_b">
		                        	<div class="col-md-3 key" id= "weixie"></div>
                                	 <div class="col-md-3 val" id="eventroot_13"></div>
	                                 <div class="col-md-3 key" id= "kangyi"></div>
	                                 <div class="col-md-3 val" id="eventroot_14"></div>
		                             <!-- <div class="col-md-6">
		                                <div class="col-md-8 talign_r"><span id= "weixie"></span></div>
		                                <div class="col-md-4">
		                                    <input type="text" id="eventroot_13" style="width:60px; border: 0px;">
		                                </div>
		                            </div>
		                            <div class="col-md-6">
		                                <div class="col-md-8 talign_r"><span id= "kangyi"></span></div>
		                                <div class="col-md-4">
		                                    <input type="text" id="eventroot_14" style="width:60px; border: 0px;">
		                                </div>
		                            </div> -->
		                        </div>
		                        <div class="row row_b_b">
		                        	<div class="col-md-3 key" id= "libs"></div>
                                	 <div class="col-md-3 val" id="eventroot_15"></div>
	                                 <div class="col-md-3 key" id= "jslx"></div>
	                                 <div class="col-md-3 val" id="eventroot_16"></div>
		                            <!-- <div class="col-md-6">
		                                <div class="col-md-8 talign_r"><span id= "libs"></span></div>
		                                <div class="col-md-4">
		                                    <input type="text" id="eventroot_15" style="width:60px; border: 0px;">
		                                </div>
		                            </div>
		                            <div class="col-md-6">
		                                <div class="col-md-8 talign_r"><span id= "jslx"></span></div>
		                                <div class="col-md-4">
		                                    <input type="text" id="eventroot_16" style="width:60px; border: 0px;">
		                                </div>
		                            </div> -->
		                        </div>
		                        <div class="row row_b_b">
		                        	<div class="col-md-3 key" id= "qiangpo"></div>
                                	 <div class="col-md-3 val" id="eventroot_17"></div>
	                                 <div class="col-md-3 key" id= "tuji"></div>
	                                 <div class="col-md-3 val" id="eventroot_18"></div>
		                            <!-- <div class="col-md-6">
		                                <div class="col-md-8 talign_r"><span id= "qiangpo"></span></div>
		                                <div class="col-md-4">
		                                    <input type="text" id="eventroot_17" style="width:60px; border: 0px;">
		                                </div>
		                            </div>
		                            <div class="col-md-6">
		                                <div class="col-md-8 talign_r"><span id= "tuji"></span></div>
		                                <div class="col-md-4">
		                                    <input type="text" id="eventroot_18" style="width:60px; border: 0px;">
		                                </div>
		                            </div> -->
		                        </div>
		                        <div class="row row_b_b">
		                        	<div class="col-md-3 key" id= "zhandou"></div>
                                	 <div class="col-md-3 val" id="eventroot_19"></div>
	                                 <div class="col-md-3 key" id= "dgmbl"></div>
	                                 <div class="col-md-3 val" id="eventroot_20"></div>
		                            <!-- <div class="col-md-6">
		                                <div class="col-md-8 talign_r"><span id= "zhandou"></span></div>
		                                <div class="col-md-4">
		                                    <input type="text" id="eventroot_19" style="width:60px; border: 0px;">
		                                </div>
		                            </div>
		                            <div class="col-md-6">
		                                <div class="col-md-8 talign_r"><span id= "dgmbl"></span></div>
		                                <div class="col-md-4">
		                                    <input type="text" id="eventroot_20" style="width:60px; border: 0px;">
		                                </div>
		                            </div> -->
		                        </div>
		                    </div>
	                    </div>
	                    <div class="float_right_buttom" id="timeline" style="display: none;">
							<span>时间粒度：</span>
							<span class="ecircle" value="3"></span><span>年</span><span class="ecircle" value="2"></span><span>月</span><span class="ecircle" value="4" id="week"></span><span>周</span><span class="ecircle ecircleon" value="1" id="allday"></span><span>日</span>
						</div>
	                    <div id="linshow" style="height:86%;width:100%;display: none;margin-top: 12px;"></div>
	                </div>
	            </div>
        		
        	</div>
		</div>
		<jsp:include page="event_tab1.jsp"></jsp:include>
	</div>
	<jsp:include page="../updateUserPassword.jsp"/>
</body>
<!-- 人工查询日期 -->
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
<script src="<%=basePath%>/static/Visualization/js/amcharts/export/export.js" type="text/javascript"></script> 
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/echarts.js"></script>--%>
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/echarts.js"></script>
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
<script src="<%=basePath%>/static/js/config/config.js"></script>
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<script type="text/javascript">
        var selectVal="1";
        var selecteVal="1";
        var date_data;
        var quadclass_data;//折线图全量数据
        var eventroot_data;//雷达图数据
        var maxrootvalue;//雷达图最大值
        var sjbmname;//所有名称
        var allEventroot_data;
        var allDate_data;
        $(function(){
        	$(".bizhong").show();
        	//切换轮播图、折线图
        	$('.btns').on('click',function(){
    			$(this).addClass('borcolor').siblings('.btns').removeClass('borcolor');
    		    var btnValue=$(this).attr('value');
    		    if(btnValue=="轮播图"){
    		    	$("#linshow").hide();
    		    	$(".col-md-7").show();
    		    	$("#listsh").show();
    		    	$("#timeline").hide();
    		    	$("#btn-group").removeClass("lineButton");
    		    }
    		    if(btnValue=="折线图"){
    		    	//startLoad();
    		    	$("#style_stop").click();
    		    	//$("#btn-group").removeClass("btn-group");
    		    	$("#btn-group").addClass("lineButton");
    		    	$(".col-md-7").hide();
    		    	$("#listsh").hide();
    		    	$("#timeline").show();
    		    	$("#linshow").show();
    		    	$("#allday").click();
    		    	//linshow(allEventroot_data,allDate_data,sjbmname);
    		    	//endLoad();
    		    }
        	})
        	//切换大类时间线数据（年月周日）提出的公共方法     参数为截取的位数，注意周力度的数据比较特殊，需要特殊处理一下
        	function packDataQuadClassType(len){
        		var date_news={};
                for(var i=0;i<quadclass_data.length;i++){
                	//比较每一个全量数据的日期是否包含截取到月的
            		var date_str=quadclass_data[i].date;
                	var q1 = quadclass_data[i]["Material Conflict(利益冲突)"];
                	var q2 = quadclass_data[i]["Material Cooperation(利益合作)"];
                	var q3 = quadclass_data[i]["Verbal Conflict(口头冲突)"];
                	var q4 = quadclass_data[i]["Verbal Cooperation(口头合作)"];
            		var data_string=date_str+"";
            		var date_class=data_string.substring(0,len);
            		if(len==2){
            			date_class = getWeekNum(data_string);
            		}
            		if(date_news[date_class] != undefined){
            			var Conflict= date_news[date_class]["Material Conflict(利益冲突)"];//利益冲突
                       	var Cooperation= date_news[date_class]["Material Cooperation(利益合作)"];//利益合作
                       	var Verbal= date_news[date_class]["Verbal Conflict(口头冲突)"];//口头冲突
                       	var Verbal_Cooperation= date_news[date_class]["Verbal Cooperation(口头合作)"];//口头合作
                       	
                       	date_news[date_class]["Material Conflict(利益冲突)"] = q1 + Conflict;
            			date_news[date_class]["Material Cooperation(利益合作)"] = q2 + Cooperation;
            			date_news[date_class]["Verbal Conflict(口头冲突)"] = q3 + Verbal;
            			date_news[date_class]["Verbal Cooperation(口头合作)"] = q4 + Verbal_Cooperation;
                       	
            		}else{
            			var date_new = {};
            			date_new["Material Conflict(利益冲突)"] = q1;
            			date_new["Material Cooperation(利益合作)"] = q2;
            			date_new["Verbal Conflict(口头冲突)"] = q3;
            			date_new["Verbal Cooperation(口头合作)"] = q4;
            			date_news[date_class] = date_new;
            		}
                }
                var date_value=[];
                var quadclass_value=[];
                for(var obj in date_news){
                	var date_new = date_news[obj];
                	date_value.push(obj);
                	var d1={
               			"Material Conflict(利益冲突)":date_new["Material Conflict(利益冲突)"].toFixed(3),	
               			"Material Cooperation(利益合作)":date_new["Material Cooperation(利益合作)"].toFixed(3),
               			"Verbal Conflict(口头冲突)":date_new["Verbal Conflict(口头冲突)"].toFixed(3),
               			"Verbal Cooperation(口头合作)":date_new["Verbal Cooperation(口头合作)"].toFixed(3),
               			date:obj
                	}
                	quadclass_value.push(d1);
                }
                showBarLine(date_value,quadclass_value,sjbmname);
        	}
        	
        	//大类时间线展示点击切换年月日
        	$('.circle').on('click',function(){
    			$(this).addClass('circleon').siblings('.circle').removeClass('circleon');
    			selectVal=$(this).attr('value');
    			if(selectVal=="1"){
    				showBarLine(allDate_data,quadclass_data,sjbmname);
    			}
    			if(selectVal=="2"){
    				//月
    				packDataQuadClassType(6);
                }
    			if(selectVal=="3"){
    				//年
    				packDataQuadClassType(4);
                }
    			if(selectVal=="4"){
    				//周
    				packDataQuadClassType(2);
                }
    		})
    		
    		//切换根类时间线数据（年月周日）提出的公共方法     参数为截取的位数，注意周力度的数据比较特殊，需要特殊处理一下
        	function packDataEventClassType(len){
        		var date_news = {};
        		for(var i=0;i<allEventroot_data.length;i++){
        			var e1 =  allEventroot_data[i]["MAKE PUBLIC STATEMENT(公开声明)"];
        			var e2 =  allEventroot_data[i]["APPEAL(呼吁)"];
        			var e3 =  allEventroot_data[i]["EXPRESS INTENT TO COOPERATE(表达合作意愿)"];
        			var e4 =  allEventroot_data[i]["CONSULT(磋商)"];
        			var e5 =  allEventroot_data[i]["ENGAGE IN DIPLOMATIC COOPERATION(开展外交合作)"];
        			var e6 =  allEventroot_data[i]["ENGAGE IN MATERIAL COOPERATION(开展实质合作)"];
        			var e7 =  allEventroot_data[i]["PROVIDE AID(提供援助)"];
        			var e8 =  allEventroot_data[i]["YIELD(屈服)"];
        			var e9 =  allEventroot_data[i]["INVESTIGATE(调查)"];
        			var e10 = allEventroot_data[i]["DEMAND(要求)"];
        			var e11 = allEventroot_data[i]["DISAPPROVE(反对)"];
        			var e12 = allEventroot_data[i]["REJECT(拒绝)"];
        			var e13 = allEventroot_data[i]["THREATEN(威胁)"];
        			var e14 = allEventroot_data[i]["PROTEST(抗议)"];
        			var e15 = allEventroot_data[i]["EXHIBIT FORCE POSTURE(展示军事姿态)"];
        			var e16 = allEventroot_data[i]["REDUCE RELATIONS(降低关系)"];
        			var e17 = allEventroot_data[i]["COERCE(强迫)"];
        			var e18 = allEventroot_data[i]["ASSAULT(袭击)"];
        			var e19 = allEventroot_data[i]["FIGHT(战斗)"];
        			var e20 = allEventroot_data[i]["USE UNCONVENTIONAL MASS VIOLENCE(非常规大规模暴力)"];
	
        			var date_str=allEventroot_data[i].date;
            		var data_string=date_str+"";
            		var date_class=data_string.substring(0,len);
            		if(len==2){
            			date_class = getWeekNum(data_string);
            		}
            		if(date_news[date_class] != undefined){
            			var ee1 =  date_news[date_class]["MAKE PUBLIC STATEMENT(公开声明)"];
            			var ee2 =  date_news[date_class]["APPEAL(呼吁)"];
            			var ee3 =  date_news[date_class]["EXPRESS INTENT TO COOPERATE(表达合作意愿)"];
            			var ee4 =  date_news[date_class]["CONSULT(磋商)"];
            			var ee5 =  date_news[date_class]["ENGAGE IN DIPLOMATIC COOPERATION(开展外交合作)"];
            			var ee6 =  date_news[date_class]["ENGAGE IN MATERIAL COOPERATION(开展实质合作)"];
            			var ee7 =  date_news[date_class]["PROVIDE AID(提供援助)"];
            			var ee8 =  date_news[date_class]["YIELD(屈服)"];
            			var ee9 =  date_news[date_class]["INVESTIGATE(调查)"];
            			var ee10 = date_news[date_class]["DEMAND(要求)"];
            			var ee11 = date_news[date_class]["DISAPPROVE(反对)"];
            			var ee12 = date_news[date_class]["REJECT(拒绝)"];
            			var ee13 = date_news[date_class]["THREATEN(威胁)"];
            			var ee14 = date_news[date_class]["PROTEST(抗议)"];
            			var ee15 = date_news[date_class]["EXHIBIT FORCE POSTURE(展示军事姿态)"];
            			var ee16 = date_news[date_class]["REDUCE RELATIONS(降低关系)"];
            			var ee17 = date_news[date_class]["COERCE(强迫)"];
            			var ee18 = date_news[date_class]["ASSAULT(袭击)"];
            			var ee19 = date_news[date_class]["FIGHT(战斗)"];
            			var ee20 = date_news[date_class]["USE UNCONVENTIONAL MASS VIOLENCE(非常规大规模暴力)"];
            			
            			date_news[date_class]["MAKE PUBLIC STATEMENT(公开声明)"] = e1+ee1;                
            			date_news[date_class]["APPEAL(呼吁)"] = e2+ee2;                                 
            			date_news[date_class]["EXPRESS INTENT TO COOPERATE(表达合作意愿)"] = e3+ee3;        
            			date_news[date_class]["CONSULT(磋商)"] = e4+ee4;                                
            			date_news[date_class]["ENGAGE IN DIPLOMATIC COOPERATION(开展外交合作)"] = e5+ee5;   
            			date_news[date_class]["ENGAGE IN MATERIAL COOPERATION(开展实质合作)"] = e6+ee6;     
            			date_news[date_class]["PROVIDE AID(提供援助)"] = e7+ee7;                          
            			date_news[date_class]["YIELD(屈服)"] = e8+ee8;                                 
            			date_news[date_class]["INVESTIGATE(调查)"] = e9+ee9;                            
            			date_news[date_class]["DEMAND(要求)"] = e10+ee10;                                
            			date_news[date_class]["DISAPPROVE(反对)"] = e11+ee11;                            
            			date_news[date_class]["REJECT(拒绝)"] = e12+ee12;                                 
            			date_news[date_class]["THREATEN(威胁)"] = e13+ee13;                              
            			date_news[date_class]["PROTEST(抗议)"] = e14+ee14;                               
            			date_news[date_class]["EXHIBIT FORCE POSTURE(展示军事姿态)"] = e15+ee15;             
            			date_news[date_class]["REDUCE RELATIONS(降低关系)"] = e16+ee16;                     
            			date_news[date_class]["COERCE(强迫)"] = e17+ee17;                                 
            			date_news[date_class]["ASSAULT(袭击)"] = e18+ee18;                                
            			date_news[date_class]["FIGHT(战斗)"] = e19+ee19;                                 
            			date_news[date_class]["USE UNCONVENTIONAL MASS VIOLENCE(非常规大规模暴力)"] = e20+ee20; 
            		}else{
            			var date_new = {};
            			date_new["MAKE PUBLIC STATEMENT(公开声明)"] = e1;
            			date_new["APPEAL(呼吁)"] = e2;
            			date_new["EXPRESS INTENT TO COOPERATE(表达合作意愿)"] = e3;
            			date_new["CONSULT(磋商)"] = e4;
            			date_new["ENGAGE IN DIPLOMATIC COOPERATION(开展外交合作)"] = e5;
            			date_new["ENGAGE IN MATERIAL COOPERATION(开展实质合作)"] = e6;
            			date_new["PROVIDE AID(提供援助)"] = e7;
            			date_new["YIELD(屈服)"] = e8;
            			date_new["INVESTIGATE(调查)"] = e9;
            			date_new["DEMAND(要求)"] = e10;
            			date_new["DISAPPROVE(反对)"] = e11;
            			date_new["REJECT(拒绝)"] = e12;
            			date_new["THREATEN(威胁)"] = e13;
            			date_new["PROTEST(抗议)"] = e14;
            			date_new["EXHIBIT FORCE POSTURE(展示军事姿态)"] = e15;
            			date_new["REDUCE RELATIONS(降低关系)"] = e16;
            			date_new["COERCE(强迫)"] = e17;
            			date_new["ASSAULT(袭击)"] = e18;
            			date_new["FIGHT(战斗)"] = e19;
            			date_new["USE UNCONVENTIONAL MASS VIOLENCE(非常规大规模暴力)"] = e19;
            			date_news[date_class] = date_new;
            		}
        		}
        		var date_value=[];
                var quadclass_value=[];
                for(var obj in date_news){
                	var date_new = date_news[obj];
                	date_value.push(obj);
                	var d1={
               			"MAKE PUBLIC STATEMENT(公开声明)":date_new["MAKE PUBLIC STATEMENT(公开声明)"].toFixed(3),
               			"APPEAL(呼吁)":date_new["APPEAL(呼吁)"].toFixed(3),	
               			"EXPRESS INTENT TO COOPERATE(表达合作意愿)":date_new["EXPRESS INTENT TO COOPERATE(表达合作意愿)"].toFixed(3),
               			"CONSULT(磋商)":date_new["CONSULT(磋商)"].toFixed(3),
               			"ENGAGE IN DIPLOMATIC COOPERATION(开展外交合作)":date_new["ENGAGE IN DIPLOMATIC COOPERATION(开展外交合作)"].toFixed(3),
               			"ENGAGE IN MATERIAL COOPERATION(开展实质合作)":date_new["ENGAGE IN MATERIAL COOPERATION(开展实质合作)"].toFixed(3),
               			"PROVIDE AID(提供援助)":date_new["PROVIDE AID(提供援助)"].toFixed(3),
               			"YIELD(屈服)":date_new["YIELD(屈服)"].toFixed(3),
               			"INVESTIGATE(调查)":date_new["INVESTIGATE(调查)"].toFixed(3),
               			"DEMAND(要求)":date_new["DEMAND(要求)"].toFixed(3),
               			"DISAPPROVE(反对)":date_new["DISAPPROVE(反对)"].toFixed(3),
               			"REJECT(拒绝)":date_new["REJECT(拒绝)"].toFixed(3),
               			"THREATEN(威胁)":date_new["THREATEN(威胁)"].toFixed(3),
               			"PROTEST(抗议)":date_new["PROTEST(抗议)"].toFixed(3),
               			"EXHIBIT FORCE POSTURE(展示军事姿态)":date_new["EXHIBIT FORCE POSTURE(展示军事姿态)"].toFixed(3),
               			"REDUCE RELATIONS(降低关系)":date_new["REDUCE RELATIONS(降低关系)"].toFixed(3),
               			"COERCE(强迫)":date_new["COERCE(强迫)"].toFixed(3),
               			"ASSAULT(袭击)":date_new["ASSAULT(袭击)"].toFixed(3),
               			"FIGHT(战斗)":date_new["FIGHT(战斗)"].toFixed(3),
               			"USE UNCONVENTIONAL MASS VIOLENCE(非常规大规模暴力)":date_new["USE UNCONVENTIONAL MASS VIOLENCE(非常规大规模暴力)"].toFixed(3),
               			date:obj
                	}
                	quadclass_value.push(d1);
                }
                linshow(quadclass_value,date_value,sjbmname);
        	}
    		
    		//根类
    		$('.ecircle').on('click',function(){
    			$(this).addClass('ecircleon').siblings('.ecircle').removeClass('ecircleon');
    			selecteVal=$(this).attr('value');
    			if(selecteVal=="1"){
    				 linshow(allEventroot_data,allDate_data,sjbmname);
    			}
    			if(selecteVal=="2"){
    				//月
    				packDataEventClassType(6);
                }
    			if(selecteVal=="3"){
    				//年
    				packDataEventClassType(4);
                }
    			if(selecteVal=="4"){
    				//年
    				packDataEventClassType(2);
                }
    		})
    		
        	//处理配置
    		handleConfigs();
    		//美化滚动条
    		glorifyComboSelect();
    	});
        var timeArray = [];
        var date_data;
        var len;
        //事件类型渲染图表
        function render(configId){
        	startLoad();
			$.ajax({
				url:'<%=basePath%>/search/event_timeline_type_viz/'+configId,
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
        function renderData(data){
        	
        	var showstr,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20;
        	for(var i=0;i<timeArray.length;i++){
				clearInterval(timeArray[i]);
			}
        	//演化按钮的样式
        	if($("#style_start").hasClass("act")){
        		$("#style_start").removeClass("act");
        	}
        	
			date_data =data.date_data;
            quadclass_data = data.quadclass_data;
            eventroot_data = data.eventroot_data;
            maxrootvalue = data.maxrootvalue;
            allEventroot_data = data.allEventroot_data;
            allDate_data =data.allDate_data;
            sjbmname = data.name;
            //清除点击切换配置轮播范围
            $("#date").empty();
            $("#style_start").show();
        	$("#style_stop").hide();
       		$("#style_start").removeClass("act");
            clearInterval(timeDataPlay);
            //点击切换配置默认轮播图显示
            $("#carousel").click();
            //默认日粒度显示
            $("#day").click();
            $('#gksm').html(sjbmname[4].substring(sjbmname[4].indexOf("(") + 1,sjbmname[4].indexOf(")")));
            $('#shangsu').html(sjbmname[5].substring(sjbmname[5].indexOf("(") + 1,sjbmname[5].indexOf(")")));
            $('#hzyx').html(sjbmname[6].substring(sjbmname[6].indexOf("(") + 1,sjbmname[6].indexOf(")")));
            $('#zixun').html(sjbmname[7].substring(sjbmname[7].indexOf("(") + 1,sjbmname[7].indexOf(")")));
            $('#wjhz').html(sjbmname[8].substring(sjbmname[8].indexOf("(") + 1,sjbmname[8].indexOf(")")));
            $('#wzhz').html(sjbmname[9].substring(sjbmname[9].indexOf("(") + 1,sjbmname[9].indexOf(")")));
            $('#tgyz').html(sjbmname[10].substring(sjbmname[10].indexOf("(") + 1,sjbmname[10].indexOf(")")));
            $('#touxiang').html(sjbmname[11].substring(sjbmname[11].indexOf("(") + 1,sjbmname[11].indexOf(")")));
            $('#yanjiu').html(sjbmname[12].substring(sjbmname[12].indexOf("(") + 1,sjbmname[12].indexOf(")")));
            $('#xuqiu').html(sjbmname[13].substring(sjbmname[13].indexOf("(") + 1,sjbmname[13].indexOf(")")));
            $('#fandui').html(sjbmname[14].substring(sjbmname[14].indexOf("(") + 1,sjbmname[14].indexOf(")")));
            $('#jujue').html(sjbmname[15].substring(sjbmname[15].indexOf("(") + 1,sjbmname[15].indexOf(")")));
            $('#weixie').html(sjbmname[16].substring(sjbmname[16].indexOf("(") + 1,sjbmname[16].indexOf(")")));
            $('#kangyi').html(sjbmname[17].substring(sjbmname[17].indexOf("(") + 1,sjbmname[17].indexOf(")")));
            $('#libs').html(sjbmname[18].substring(sjbmname[18].indexOf("(") + 1,sjbmname[18].indexOf(")")));
            $('#jslx').html(sjbmname[19].substring(sjbmname[19].indexOf("(") + 1,sjbmname[19].indexOf(")")));
            $('#qiangpo').html(sjbmname[20].substring(sjbmname[20].indexOf("(") + 1,sjbmname[20].indexOf(")")));
            $('#tuji').html(sjbmname[21].substring(sjbmname[21].indexOf("(") + 1,sjbmname[21].indexOf(")")));
            $('#zhandou').html(sjbmname[22].substring(sjbmname[22].indexOf("(") + 1,sjbmname[22].indexOf(")")));
            $('#dgmbl').html(sjbmname[23].substring(sjbmname[23].indexOf("(") + 1,sjbmname[23].indexOf(")")));
            var date = date_data[0];
            var dateStr = date+"";
			var dateSplit = String(dateStr).split('');
            if(!date==""||!date==null||!date==undefined){
            	$('#style_start').attr("disabled",false);
            	if(dateSplit.length==8){
            		for(var i=0;i<dateSplit.length;i++){
            				$("#date").append( "<img src=<%=basePath%>/static/images/"+dateSplit[i]+".png>");
            		}
            	}else if(dateSplit.length==6){
            		for(var i=0;i<dateSplit.length;i++){
        				$("#date").append( "<img  src=<%=basePath %>/static/images/"+dateSplit[i]+".png>");
        		}
            	}else{
            		for(var i=0;i<dateSplit.length;i++){
        				$("#date").append( "<img  src=<%=basePath %>/static/images/"+dateSplit[i]+".png>");
        		}
            	}
			}else{
				$('#style_start').attr("disabled",true);
				$("#date").val("");
			}
            for(var k=1;k<=20;k++){
                $("#eventroot_"+(k).toString()).html(getDataByDate(date,eventroot_data)[k-1]);
                if(k==1){
                	a1 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==2){
                	a2 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==3){
                	a3 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==4){
                	a4 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==5){
                	a5 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==6){
                	a6 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==7){
                	a7 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==8){
                	a8 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==9){
                	a9 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==10){
                	a10 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==11){
                	a11 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==12){
                	a12 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==13){
                	a13 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==14){
                	a14 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==15){
                	a15 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==16){
                	a16 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==17){
                	a17 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==18){
                	a18 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==19){
                	a19 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==20){
                	a20 = getDataByDate(date,eventroot_data)[k-1];
                }
            }
            showstr = "MAKE PUBLIC STATEMENT(公开声明):" + a1 
			+ "<br />APPEAL(呼吁):" + a2
			+ "<br />EXPRESS INTENT TO COOPERATE(表达合作意愿):" + a3
			+ "<br />CONSULT(磋商):" + a4
			+ "<br />ENGAGE IN DIPLOMATIC COOPERATION(开展外交合作):" + a5
			+ "<br />ENGAGE IN MATERIAL COOPERATION(开展实质合作):" + a6
			+ "<br />PROVIDE AID(提供援助):" + a7
			+ "<br />YIELD(屈服):" + a8
			+ "<br />INVESTIGATE(调查):" + a9
			+ "<br />DEMAND(要求):" + a10
			+ "<br />DISAPPROVE(反对):" + a11
			+ "<br />REJECT(拒绝):" + a12
			+ "<br />THREATEN(威胁):" + a13
			+ "<br />PROTEST(抗议):" + a14
			+ "<br />EXHIBIT FORCE POSTURE(展示军事姿态):" + a15
			+ "<br />REDUCE RELATIONS(降低关系):" + a16
			+ "<br />COERCE(强迫):" + a17
			+ "<br />ASSAULT(袭击):" + a18
			+ "<br />FIGHT(战斗):" + a19
			+ "<br />USE UNCONVENTIONAL MASS VIOLENCE(非常规大规模暴力):" + a20;
            var data_chart = echarts.init(document.getElementById('eventroot_graph'));
            var data_option = {
        		normal:{
    			        "top": 200,
    			        "left": 300,
    			        "width": 500,
    			        "height": 400,
    			        "zIndex": 6,
    			        "backgroundColor": ""
    			},
    			"color": "rgba(245, 166, 35, 1)",
    			"tooltip": {
			        "show": true,
			        "trigger": "item"
			    },
                radar: {
                	"center": ["50%", "50%"],
			        "radius": "70%",
			        "startAngle": 90,
			        "splitNumber": 4,
			        "shape": "circle",
			        "splitArea": {
			            "areaStyle": {
			                "color": ["transparent"]
			            }
			        },
			        "axisLabel": {
			            "show": false,
			            "fontSize": 18,
			            "color": "#fff",
			            "fontStyle": "normal",
			            "fontWeight": "normal"
			        },
			        "axisLine": {
			            "show": true,
			            "lineStyle": {
			                "color": "grey"//
			            }
			        },
			        "splitLine": {
			            "show": true,
			            "lineStyle": {
			                "color": "grey"//
			            }
			        },
			        name: {                             // (圆外的标签)雷达图每个指示器名称的配置项。
			            formatter: '{value}',
			            textStyle: {
			                fontSize: 15,
			                color: 'rgba(245, 166, 35, 1)'
			            }
			        },
                    indicator: [
                    			{ name: sjbmname[4].substring(sjbmname[4].indexOf("(") + 1,sjbmname[4].indexOf(")")), max: maxrootvalue[0],color:'red'},
                                { name: sjbmname[5].substring(sjbmname[5].indexOf("(") + 1,sjbmname[5].indexOf(")")), max: maxrootvalue[0],color:"red"},
                                { name: sjbmname[6].substring(sjbmname[6].indexOf("(") + 1,sjbmname[6].indexOf(")")), max: maxrootvalue[0],"color":"red"},
                                { name: sjbmname[7].substring(sjbmname[7].indexOf("(") + 1,sjbmname[7].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                { name: sjbmname[8].substring(sjbmname[8].indexOf("(") + 1,sjbmname[8].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                { name: sjbmname[9].substring(sjbmname[9].indexOf("(") + 1,sjbmname[9].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                { name: sjbmname[10].substring(sjbmname[10].indexOf("(") + 1,sjbmname[10].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                { name: sjbmname[11].substring(sjbmname[11].indexOf("(") + 1,sjbmname[11].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                { name: sjbmname[12].substring(sjbmname[12].indexOf("(") + 1,sjbmname[12].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                { name: sjbmname[13].substring(sjbmname[13].indexOf("(") + 1,sjbmname[13].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                { name: sjbmname[14].substring(sjbmname[14].indexOf("(") + 1,sjbmname[14].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                { name: sjbmname[15].substring(sjbmname[15].indexOf("(") + 1,sjbmname[15].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                { name: sjbmname[16].substring(sjbmname[16].indexOf("(") + 1,sjbmname[16].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                { name: sjbmname[17].substring(sjbmname[17].indexOf("(") + 1,sjbmname[17].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                { name: sjbmname[18].substring(sjbmname[18].indexOf("(") + 1,sjbmname[18].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                { name: sjbmname[19].substring(sjbmname[19].indexOf("(") + 1,sjbmname[19].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                { name: sjbmname[20].substring(sjbmname[20].indexOf("(") + 1,sjbmname[20].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                { name: sjbmname[21].substring(sjbmname[21].indexOf("(") + 1,sjbmname[21].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                { name: sjbmname[22].substring(sjbmname[22].indexOf("(") + 1,sjbmname[22].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                { name: sjbmname[23].substring(sjbmname[23].indexOf("(") + 1,sjbmname[23].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"}
                    			]
                },
                name: {
                    textStyle: {
                      color: '#5B5B5B'
                    }
                },
                series: [{
                    name: '基类数据',
                    type: 'radar',
                    "symbol": "circle",
			        "symbolSize": 10,
			        "areaStyle": {
			            "normal": {
			                "color": "rgba(245, 166, 35, 0.4)"
			            }
			        },
			        itemStyle:{
			            color:'rgba(245, 166, 35, 1)',
			            borderColor:'rgba(245, 166, 35, 0.3)',
			            borderWidth:10,
			        },
                    tooltip: {
                        trigger: 'item',
                        formatter: showstr
                    },
                    "lineStyle": {
			            "normal": {
			                "type": "dashed",
			                
			                "color": "rgba(245, 166, 35, 1)",
			                "width": 2
			            }
			        },
                    data : [
                        {
                            value : getDataByDate(date,eventroot_data),
                            name : '基类数据'
                        }
                    ]
                }]
            };
            data_chart.setOption(data_option);
            len = date_data.length;
            var pos = 1;
            var endtime;
            var timeDataPlay;
            var starttime = date_data[0];
            var endtime = date_data[len-1];
            if(!starttime==""||!starttime==null||!starttime==undefined){
            	if(starttime.length==8){
            		document.getElementById("four_date_range").value = "轮播范围:" + starttime.slice(0,4)+"年"+starttime.slice(4,6)+"月"+starttime.slice(6,8)+"日-" + endtime.slice(0,4)+"年"+endtime.slice(4,6)+"月"+endtime.slice(6,8)+"日";
            	}else if(starttime.length==6){
            		document.getElementById("four_date_range").value = "轮播范围:" + starttime.slice(0,4)+"年"+starttime.slice(4,6)+"月-" + endtime.slice(0,4)+"年"+endtime.slice(4,6)+"月";
            	}else{
            		document.getElementById("four_date_range").value = "轮播范围:" + starttime.slice(0,4)+"年-" + endtime.slice(0,4)+"年";
            	}	
            }else{
            	$("#four_date_range").val("");
            }
        }
        function getDataByCat(cat,data){
            var len = data.length;
            var ret=[];
            for(var i =0 ;i<len;i++)
            {
                ret[i] = data[i][cat];
            }
            return ret;
        }
        function getDataByDate(date,data){
            var len = data.length;
            var ret=[];
            for(var i=0;i<20;i++){
            	ret[i] = 0;
            }
            for(var i =0 ;i<len;i++)
            {
                if (data[i].date == date){
                	if(typeof(data[i]['MAKE PUBLIC STATEMENT(公开声明)'])=="undefined"){
                		 ret[0] = 0;
                	}else{
                		ret[0] = data[i]['MAKE PUBLIC STATEMENT(公开声明)'];
                	}
                	if(typeof(data[i]['APPEAL(呼吁)'])=="undefined"){
                		 ret[1] = 0;
                	}else{
                		ret[1] = data[i]['APPEAL(呼吁)'];
                	}
                	if(typeof(data[i]['EXPRESS INTENT TO COOPERATE(表达合作意愿)'])=="undefined"){
                		 ret[2] = 0;
                	}else{
                		ret[2] = data[i]['EXPRESS INTENT TO COOPERATE(表达合作意愿)'];
                	}
                	if(typeof(data[i]['CONSULT(磋商)'])=="undefined"){
                		 ret[3] = 0;
                	}else{
                		ret[3] = data[i]['CONSULT(磋商)'];
                	}
                	if(typeof(data[i]['ENGAGE IN DIPLOMATIC COOPERATION(开展外交合作)'])=="undefined"){
                		 ret[4] = 0;
                	}else{
                		ret[4] = data[i]['ENGAGE IN DIPLOMATIC COOPERATION(开展外交合作)'];
                	}
                	if(typeof(data[i]['ENGAGE IN MATERIAL COOPERATION(开展实质合作)'])=="undefined"){
                		 ret[5] = 0;
                	}else{
                		ret[5] = data[i]['ENGAGE IN MATERIAL COOPERATION(开展实质合作)'];
                	}
                	if(typeof(data[i]['PROVIDE AID(提供援助)'])=="undefined"){
                		 ret[6] = 0;
                	}else{
                		ret[6] = data[i]['PROVIDE AID(提供援助)'];
                	}
                	if(typeof(data[i]['YIELD(屈服)'])=="undefined"){
                		 ret[7] = 0;
                	}else{
                		ret[7] = data[i]['YIELD(屈服)'];
                	}
                	if(typeof(data[i]['INVESTIGATE(调查)'])=="undefined"){
                		 ret[8] = 0;
                	}else{
                		ret[8] = data[i]['INVESTIGATE(调查)'];
                	}
                	if(typeof(data[i]['DEMAND(要求)'])=="undefined"){
                		 ret[9] = 0;
                	}else{
                		ret[9] = data[i]['DEMAND(要求)'];
                	}
                	if(typeof(data[i]['DISAPPROVE(反对)'])=="undefined"){
                		 ret[10] = 0;
                	}else{
                		ret[10] = data[i]['DISAPPROVE(反对)'];
                	}
                	if(typeof(data[i]['REJECT(拒绝)'])=="undefined"){
                		 ret[11] = 0;
                	}else{
                		ret[11] = data[i]['REJECT(拒绝)'];
                	}
                	if(typeof(data[i]['THREATEN(威胁)'])=="undefined"){
                		 ret[12] = 0;
                	}else{
                		ret[12] = data[i]['THREATEN(威胁)'];
                	}
                	if(typeof(data[i]['PROTEST(抗议)'])=="undefined"){
                		 ret[13] = 0;
                	}else{
                		ret[13] = data[i]['PROTEST(抗议)'];
                	}
                	if(typeof(data[i]['EXHIBIT FORCE POSTURE(展示军事姿态)'])=="undefined"){
                		 ret[14] = 0;
                	}else{
                		ret[14] = data[i]['EXHIBIT FORCE POSTURE(展示军事姿态)'];
                	}
                	if(typeof(data[i]['REDUCE RELATIONS(降低关系)'])=="undefined"){
                		 ret[15] = 0;
                	}else{
                		ret[15] = data[i]['REDUCE RELATIONS(降低关系)'];
                	}
                	if(typeof(data[i]['COERCE(强迫)'])=="undefined"){
                		 ret[16] = 0;
                	}else{
                		ret[16] = data[i]['COERCE(强迫)'];
                	}
                	if(typeof(data[i]['ASSAULT(袭击)'])=="undefined"){
                		 ret[17] = 0;
                	}else{
                		ret[17] = data[i]['ASSAULT(袭击)'];
                	}
                	if(typeof(data[i]['FIGHT(战斗)'])=="undefined"){
                		 ret[18] = 0;
                	}else{
                		ret[18] = data[i]['FIGHT(战斗)'];
                	}
                	if(typeof(data[i]['USE UNCONVENTIONAL MASS VIOLENCE(非常规大规模暴力)'])=="undefined"){
                		 ret[19] = 0;
                	}else{
                		ret[19] = data[i]['USE UNCONVENTIONAL MASS VIOLENCE(非常规大规模暴力)'];
                	}
                }
            }
            return ret;
        }
        function styleStart(){
        	var showstr,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20;
        	$("#style_start").hide();
        	$("#style_stop").show();
        	if(date_data.length > 1){
        		if(!$("#style_start").hasClass("act")){
	        		$("#style_start").addClass("act");
	        	}else{
	           		return;
	           	}
	        	var pos = 0;
                 timeDataPlay = setInterval(function(){
	                if(pos==len) {// 到了最后一个则又重复执行
	                    pos = 0;
	                } else {
                        var date = date_data[pos];
                        var dateStr = date+"";
            			var dateSplit = String(dateStr).split('');
                        if(!date==""||!date==null||!date==undefined){
                        	$('#style_start').attr("disabled",false);
                        	$("#date").empty();
                        	if(dateSplit.length==8){
                        		for(var i=0;i<dateSplit.length;i++){
                        				$("#date").append( "<img src=<%=basePath%>/static/images/"+dateSplit[i]+".png>");
                        		}
                        	}else if(dateSplit.length==6){
                        		for(var i=0;i<dateSplit.length;i++){
                    				$("#date").append( "<img  src=<%=basePath %>/static/images/"+dateSplit[i]+".png>");
                    		}
                        	}else{
                        		for(var i=0;i<dateSplit.length;i++){
                    				$("#date").append( "<img  src=<%=basePath %>/static/images/"+dateSplit[i]+".png>");
                    		}
                        	}
                        }	
                        for(var k=1;k<=20;k++){
                            $("#eventroot_"+(k).toString()).html(getDataByDate(date,eventroot_data)[k-1]);
                            if(k==1){
                            	a1 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==2){
                            	a2 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==3){
                            	a3 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==4){
                            	a4 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==5){
                            	a5 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==6){
                            	a6 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==7){
                            	a7 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==8){
                            	a8 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==9){
                            	a9 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==10){
                            	a10 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==11){
                            	a11 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==12){
                            	a12 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==13){
                            	a13 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==14){
                            	a14 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==15){
                            	a15 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==16){
                            	a16 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==17){
                            	a17 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==18){
                            	a18 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==19){
                            	a19 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==20){
                            	a20 = getDataByDate(date,eventroot_data)[k-1];
                            }
                        }
                        showstr = "MAKE PUBLIC STATEMENT(公开声明):" + a1 
        				+ "<br />APPEAL(呼吁):" + a2
        				+ "<br />EXPRESS INTENT TO COOPERATE(表达合作意愿):" + a3
        				+ "<br />CONSULT(磋商):" + a4
        				+ "<br />ENGAGE IN DIPLOMATIC COOPERATION(开展外交合作):" + a5
        				+ "<br />ENGAGE IN MATERIAL COOPERATION(开展实质合作):" + a6
        				+ "<br />PROVIDE AID(提供援助):" + a7
        				+ "<br />YIELD(屈服):" + a8
        				+ "<br />INVESTIGATE(调查):" + a9
        				+ "<br />DEMAND(要求):" + a10
        				+ "<br />DISAPPROVE(反对):" + a11
        				+ "<br />REJECT(拒绝):" + a12
        				+ "<br />THREATEN(威胁):" + a13
        				+ "<br />PROTEST(抗议):" + a14
        				+ "<br />EXHIBIT FORCE POSTURE(展示军事姿态):" + a15
        				+ "<br />REDUCE RELATIONS(降低关系):" + a16
        				+ "<br />COERCE(强迫):" + a17
        				+ "<br />ASSAULT(袭击):" + a18
        				+ "<br />FIGHT(战斗):" + a19
        				+ "<br />USE UNCONVENTIONAL MASS VIOLENCE(非常规大规模暴力):" + a20;
                        pos++;
                        var data_chart = echarts.init(document.getElementById('eventroot_graph'));
                        var data_option = {
                        		normal:{
                			        "top": 200,
                			        "left": 300,
                			        "width": 500,
                			        "height": 400,
                			        "zIndex": 6,
                			        "backgroundColor": ""
                			},
                			"color": "rgba(245, 166, 35, 1)",
                			"tooltip": {
            			        "show": true,
            			        "trigger": "item"
            			    },
                            radar: {
                            	"center": ["50%", "50%"],
            			        "radius": "70%",
            			        "startAngle": 90,
            			        "splitNumber": 4,
            			        "shape": "circle",
            			        "splitArea": {
            			            "areaStyle": {
            			                "color": ["transparent"]
            			            }
            			        },
            			        "axisLabel": {
            			            "show": false,
            			            "fontSize": 18,
            			            "color": "#fff",
            			            "fontStyle": "normal",
            			            "fontWeight": "normal"
            			        },
            			        "axisLine": {
            			            "show": true,
            			            "lineStyle": {
            			                "color": "grey"//
            			            }
            			        },
            			        "splitLine": {
            			            "show": true,
            			            "lineStyle": {
            			                "color": "grey"//
            			            }
            			        },
            			        name: {                             // (圆外的标签)雷达图每个指示器名称的配置项。
            			            formatter: '{value}',
            			            textStyle: {
            			                fontSize: 15,
            			                color: 'rgba(245, 166, 35, 1)'
            			            }
            			        },
                                indicator: [
                                			{ name: sjbmname[4].substring(sjbmname[4].indexOf("(") + 1,sjbmname[4].indexOf(")")), max: maxrootvalue[0],color:'rgba(245, 166, 35, 1)'},
                                            { name: sjbmname[5].substring(sjbmname[5].indexOf("(") + 1,sjbmname[5].indexOf(")")), max: maxrootvalue[0],color:"rgba(245, 166, 35, 1)"},
                                            { name: sjbmname[6].substring(sjbmname[6].indexOf("(") + 1,sjbmname[6].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                            { name: sjbmname[7].substring(sjbmname[7].indexOf("(") + 1,sjbmname[7].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                            { name: sjbmname[8].substring(sjbmname[8].indexOf("(") + 1,sjbmname[8].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                            { name: sjbmname[9].substring(sjbmname[9].indexOf("(") + 1,sjbmname[9].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                            { name: sjbmname[10].substring(sjbmname[10].indexOf("(") + 1,sjbmname[10].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                            { name: sjbmname[11].substring(sjbmname[11].indexOf("(") + 1,sjbmname[11].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                            { name: sjbmname[12].substring(sjbmname[12].indexOf("(") + 1,sjbmname[12].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                            { name: sjbmname[13].substring(sjbmname[13].indexOf("(") + 1,sjbmname[13].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                            { name: sjbmname[14].substring(sjbmname[14].indexOf("(") + 1,sjbmname[14].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                            { name: sjbmname[15].substring(sjbmname[15].indexOf("(") + 1,sjbmname[15].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                            { name: sjbmname[16].substring(sjbmname[16].indexOf("(") + 1,sjbmname[16].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                            { name: sjbmname[17].substring(sjbmname[17].indexOf("(") + 1,sjbmname[17].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                            { name: sjbmname[18].substring(sjbmname[18].indexOf("(") + 1,sjbmname[18].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                            { name: sjbmname[19].substring(sjbmname[19].indexOf("(") + 1,sjbmname[19].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                            { name: sjbmname[20].substring(sjbmname[20].indexOf("(") + 1,sjbmname[20].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                            { name: sjbmname[21].substring(sjbmname[21].indexOf("(") + 1,sjbmname[21].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                            { name: sjbmname[22].substring(sjbmname[22].indexOf("(") + 1,sjbmname[22].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"},
                                            { name: sjbmname[23].substring(sjbmname[23].indexOf("(") + 1,sjbmname[23].indexOf(")")), max: maxrootvalue[0],"color":"rgba(245, 166, 35, 1)"}
                                			]
                            },
                            name: {
                                textStyle: {
                                  color: '#5B5B5B'
                                }
                            },
                            series: [{
                                name: '基类数据',
                                type: 'radar',
                                "symbol": "circle",
            			        "symbolSize": 10,
            			        "areaStyle": {
            			            "normal": {
            			                "color": "rgba(245, 166, 35, 0.4)"
            			            }
            			        },
            			        itemStyle:{
            			            color:'rgba(245, 166, 35, 1)',
            			            borderColor:'rgba(245, 166, 35, 0.3)',
            			            borderWidth:10,
            			        },
                                tooltip: {
                                    trigger: 'item',
                                    formatter: showstr
                                },
                                "lineStyle": {
            			            "normal": {
            			                "type": "dashed",
            			                
            			                "color": "rgba(245, 166, 35, 1)",
            			                "width": 2
            			            }
            			        },
                                data : [
                                    {
                                        value : getDataByDate(date,eventroot_data),
                                        name : '基类数据'
                                    }
                                ]
                            }]
                        };
                        data_chart.setOption(data_option);
                    }
                },1000);// 每1秒执行一次
                timeArray.push(timeDataPlay);
            $("#style_stop").click(function(){
            	$("#style_start").show();
            	$("#style_stop").hide();
           		$("#style_start").removeClass("act");
                clearInterval(timeDataPlay);
            });
        	}
        }
        //折线图
        function showBarLine(date_data,quadclass_data,sjbmname){
        	  var timeline_chart = echarts.init(document.getElementById('quadclass_graph'));
              var timeline_option = {
            		backgroundColor: '#1b233482',
              		toolbox: {
          		        feature: {
          		            dataZoom: {
          		                yAxisIndex: 'none'
          		            },
          		            restore: {},
          		            saveAsImage: {},
          		            dataView: {},
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
      			    tooltip: {
      		            trigger: 'item',
      		            axisPointer: {
      		            	type: 'cross'
      		        	}
      		     	},
              	    legend: {
      			        textStyle: {
      			            color: '#fff',
      			            fontSize: '12'
      			        },
              	    	//selectedMode:false,
              	    	data:[sjbmname[0],sjbmname[1],sjbmname[2],sjbmname[3]]
              	    },
              	  grid: {
	      		        left: '1%',
	      		        right: '1%',
	      		        top: '10%',
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
              	            data: date_data
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
                                    name:sjbmname[0],
                                    type:'line',
                                    data:getDataByCat(sjbmname[0],quadclass_data),
                                    smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                    symbolSize: 5,
                                    symbol: 'circle',
                                    itemStyle: {
                			            normal: {
                			            	color:'#1a9bfc',
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
                                },
                                {
                                    name:sjbmname[1],
                                    type:'line',
                                    data:getDataByCat(sjbmname[1],quadclass_data),
                                    smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                    symbolSize: 5,
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
                                },
                                {
                                    name:sjbmname[2],
                                    type:'line',
                                    data:getDataByCat(sjbmname[2],quadclass_data),
                                    smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                    symbolSize:8,
                                    symbol: 'circle',
                                    itemStyle: {
                			            normal: {
                			            	color:'#7049f0',
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
                                },
                                {
                                    name:sjbmname[3],
                                    type:'line',
                                    data:getDataByCat(sjbmname[3],quadclass_data),
                                    smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                    symbolSize: 5,
                                    symbol: 'circle',
                                    itemStyle: {
                			            normal: {
                			            	color:'#fa704d',
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
                                }
                            ]
              	};
              timeline_chart.setOption(timeline_option);
              //调节echarts图表自适应
              window.onresize=function (){
            	  timeline_chart.resize();
              }
        }
        //折线图
        function linshow(allEventroot_data,allDate_data,sjbmname){
        	var line_chart = echarts.init(document.getElementById('linshow'));
            var line_option = {
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
      		            trigger: 'item',
      		            axisPointer: {
      		            	type: 'cross'
      		        	}
      		     	},
            	    legend: {
    			        textStyle: {
    			            color: '#fff',
    			            fontSize: '12'
    			        },
    			        //type: 'scroll',
				        //orient: 'vertical',
				        //x:'right',
				        //right:0,
				        //top: 0, //注意
				        //pagemode: true,
				        width:"80%",
				        height:"20%",
            	    	//selectedMode:false,
            	    	data:[sjbmname[4],sjbmname[5],sjbmname[6],sjbmname[7],sjbmname[8],sjbmname[9],sjbmname[10],sjbmname[11],sjbmname[12],sjbmname[13],sjbmname[14],sjbmname[15],sjbmname[16],sjbmname[17],sjbmname[18],sjbmname[19],sjbmname[20],sjbmname[21],sjbmname[22],sjbmname[23]]
            	    },
            	    grid: {
	      		        left: '1%',
	      		        right: '1%',
	      		        bottom: '15%',
	      		        top: '18%',
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
        			                color: '#fff',
        			                fontWeight: 'normal',
        			                fontSize: '12',
        			            },
        			        },
            	            data: allDate_data
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
         			                color: '#fff',
         			                fontWeight: 'normal',
         			                fontSize: '12',
         			            },
         			            formatter: '{value}',
         			        },
            	        }
            	    ],
            	    series:  [
                              {
                                  name:sjbmname[4],
                                  symbol: 'circle',
                                  type:'line',
                                  data:getDataByCat(sjbmname[4],allEventroot_data),
                                  smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                  //symbolSize: 3,
                              },
                              {
                                  name:sjbmname[5],
                                  type:'line',
                                  symbol: 'circle',
                                  data:getDataByCat(sjbmname[5],allEventroot_data),
                                  smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                  //symbolSize: 3,
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
                              },
                              {
                                  name:sjbmname[6],
                                  type:'line',
                                  data:getDataByCat(sjbmname[6],allEventroot_data),
                                  smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                  //symbolSize:0,
                                  symbol: 'circle',
                                  itemStyle: {
              			            normal: {
              			            	color:'#7049f0',
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
                              },
                              {
                                  name:sjbmname[7],
                                  type:'line',
                                  data:getDataByCat(sjbmname[7],allEventroot_data),
                                  smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                  //symbolSize: 3,
                                  symbol: 'circle',
                                  itemStyle: {
              			            normal: {
              			            	color:'#fa704d',
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
                              },
                              {
                                  name:sjbmname[8],
                                  type:'line',
                                  data:getDataByCat(sjbmname[8],allEventroot_data),
                                  smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                  //symbolSize: 3,
                                  symbol: 'circle',
                                  itemStyle: {
              			            normal: {
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
                              },
                              {
                                  name:sjbmname[9],
                                  type:'line',
                                  data:getDataByCat(sjbmname[9],allEventroot_data),
                                  smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                  //symbolSize: 3,
                                  symbol: 'circle',
                                  itemStyle: {
              			            normal: {
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
                              },
                              {
                                  name:sjbmname[10],
                                  type:'line',
                                  data:getDataByCat(sjbmname[10],allEventroot_data),
                                  smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                  //symbolSize: 3,
                                  symbol: 'circle',
                                  itemStyle: {
              			            normal: {
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
                              },
                              {
                                  name:sjbmname[11],
                                  type:'line',
                                  data:getDataByCat(sjbmname[11],allEventroot_data),
                                  smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                  //symbolSize: 3,
                                  symbol: 'circle',
                                  itemStyle: {
              			            normal: {
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
                              },
                              {
                                  name:sjbmname[12],
                                  type:'line',
                                  data:getDataByCat(sjbmname[12],allEventroot_data),
                                  smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                  //symbolSize: 3,
                                  symbol: 'circle',
                                  itemStyle: {
              			            normal: {
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
                              },
                              {
                                  name:sjbmname[13],
                                  type:'line',
                                  data:getDataByCat(sjbmname[13],allEventroot_data),
                                  smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                  //symbolSize: 3,
                                  symbol: 'circle',
                                  itemStyle: {
              			            normal: {
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
                              },
                              {
                                  name:sjbmname[14],
                                  type:'line',
                                  data:getDataByCat(sjbmname[14],allEventroot_data),
                                  smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                  //symbolSize: 3,
                                  symbol: 'circle',
                                  itemStyle: {
              			            normal: {
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
                              },
                              {
                                  name:sjbmname[15],
                                  type:'line',
                                  data:getDataByCat(sjbmname[15],allEventroot_data),
                                  smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                  //symbolSize: 3,
                                  symbol: 'circle',
                                  itemStyle: {
              			            normal: {
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
                              },
                              {
                                  name:sjbmname[16],
                                  type:'line',
                                  data:getDataByCat(sjbmname[16],allEventroot_data),
                                  smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                  //symbolSize: 3,
                                  symbol: 'circle',
                                  itemStyle: {
              			            normal: {
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
                              },
                              {
                                  name:sjbmname[17],
                                  type:'line',
                                  data:getDataByCat(sjbmname[17],allEventroot_data),
                                  smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                  //symbolSize: 3,
                                  symbol: 'circle',
                                  itemStyle: {
              			            normal: {
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
                              },
                              {
                                  name:sjbmname[18],
                                  type:'line',
                                  data:getDataByCat(sjbmname[18],allEventroot_data),
                                  smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                  //symbolSize: 3,
                                  symbol: 'circle',
                                  itemStyle: {
              			            normal: {
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
                              },
                              {
                                  name:sjbmname[19],
                                  type:'line',
                                  data:getDataByCat(sjbmname[19],allEventroot_data),
                                  smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                  //symbolSize: 3,
                                  symbol: 'circle',
                                  itemStyle: {
              			            normal: {
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
                              },
                              {
                                  name:sjbmname[20],
                                  type:'line',
                                  data:getDataByCat(sjbmname[20],allEventroot_data),
                                  smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                  //symbolSize: 3,
                                  symbol: 'circle',
                                  itemStyle: {
              			            normal: {
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
                              },
                              {
                                  name:sjbmname[21],
                                  type:'line',
                                  data:getDataByCat(sjbmname[21],allEventroot_data),
                                  smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                  //symbolSize: 3,
                                  symbol: 'circle',
                                  itemStyle: {
              			            normal: {
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
                              },
                              {
                                  name:sjbmname[22],
                                  type:'line',
                                  data:getDataByCat(sjbmname[22],allEventroot_data),
                                  smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                  //symbolSize: 3,
                                  symbol: 'circle',
                                  itemStyle: {
              			            normal: {
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
                              },
                              {
                                  name:sjbmname[23],
                                  type:'line',
                                  data:getDataByCat(sjbmname[23],allEventroot_data),
                                  smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                  //symbolSize: 3,
                                  symbol: 'circle',
                                  itemStyle: {
              			            normal: {
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
                              }
                          ]
            	};
            line_chart.setOption(line_option);
            //调节echarts图表自适应
            window.onresize=function (){
            	line_chart.resize();
            }	
        }
        
        
        
	</script>
</body>
</html>