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
<title>数据管理-中间表管理</title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/style.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/sec2.css">
<!--人工查询 -->
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath %>/static//lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath %>/static/css/combo.select.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/perfect-scrollbar.css"/>
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window.css"/><!-- 弹出提示框样式 -->
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
	.newFuxuankuang{vertical-align:middle;}
	.index_bottom {
		background: url(<%=basePath %>/static/images/beij.png) no-repeat;
		background-size:  100%;	
	}
	.combo-dropdown li{float:left; width:100%;}
	.show {
		height: 825px;
		background: url(<%=basePath %>/static/images/beij.png) no-repeat;
		background-size:  100%;	
		margin-top: -27px;
	}
	.outBox {
	   height: 91%;
	    width: 96%;
	    position: relative;
	    margin: 37px 0 0 2%;
	}
	.inBox {
		height: 33%;
		width: 100%;
		position: absolute;
		/* border: 1px solid red;	 */
	    margin-top: 10px;
	}
	#inBox{
	    overflow-x: scroll;
	    height:230px;
	}
	.inBox1 {
		    height: 75%;
		    width: 100%;
		    position: absolute;
		    border: 1px solid #54628a;
		    top: 34%;
	        background-color: #1b233499;
	}
	.boxTab{
	    margin-left: 11px;
	    float: left;
	    border: 1px solid #495065;
	    background-color: #2B3554;
	    width: 16%;
	    height: 216px;
	    border: 1px solid #54628a;
	    border-radius:3px
	}
	.title_box{
	    height: 43px;
   		font-size: 18px;
	    color: #DBDDE0;
	    padding-left: 18%;
	    padding-top: 7px;
	}
	.line_box{
	    margin: 0 auto;
	    border: 0.3px solid #353F5C;
	    width: 80%;
	}
	.content_box{
    	height: 82%;
    	padding-bottom: 5px
	}
	.content_detail{
        opacity: 0.9;
	    margin-top: 0px;
	    width: 245px;
	    height: 50px;
	    background-color: #CEEBFF;
	    color: #59646b;
	    padding-left: 14px;
	    padding-top: 1px;
	    padding-top: 6px;
	    z-index: 999;
	    display: none; 
	    position: relative;
        padding-right: 5px;
    	left: -37px;
	}
	
	.hoverImg{
		cursor: pointer;
	}
	.subtitles_box{
		width: 100%;
	    height: 20%;
	}
	.subtitle{
        color: #DBDDE0;
	    width: 40%;
	    height: 100%;
	    font-size: 15px;
	    padding-top: 2%;
	    text-align: center;
	    float: left;
	    margin-left: 14px;
	}
	.data_box{
		height: 100%;
	    float: left;
	    padding-left: 24px;
	}
	.data_span{
        display: inline;
	    height: 100%;
	    font-size: 24px;
	    cursor: pointer;
	}
	.unit_span{
		color: #DBDDE0;
	}
	
	.lack_detail{
        top: -130px;
    	left: -3px;
	    position: relative;
	    opacity: 0.9;
	    background-color: #122D51;
	    width: 92px;
	    max-height: 100px;
	    border: 1px solid #48557d;
	    border-radius: 7px;
	    overflow: auto;
	    display: none;
	}
	.lack_detail ul li{
		color: white;
	    line-height: 26px;
	    padding-left: 15px;
	}
	
	/*滚动条*/
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
	  background-color:#424242;
	}
			
	::-webkit-scrollbar-thumb
	{
	  border-radius: 10px;
	  -webkit-box-shadow: inset 0 0 8px #014076;
	  background-color:#2b3554;
	}
	
	.table_ul li input{
	    padding: 1px 8px
	}
	
	
	/*表格样式微调*/
	.table>thead>tr>th, .table>tbody>tr>th, .table>tfoot>tr>th, .table>thead>tr>td, .table>tbody>tr>td, .table>tfoot>tr>td {
		border-top: 0px;
	}
	.custom_style{
		border-bottom: 0px!important;
	}
	
	/*弹出框*/
	
	.check_z {
	    float: right;
	    margin-top: 0px!important;
	    margin-right: 0px!important;
	}
	
	.popup_h3 {
	    color: white;
        padding-top: 8px;
	    margin-top: -3px;
    }
	
	.date_box{
	    width: 118%;
	    margin-left: -50px;
	    height: 28px;
	    vertical-align: middle;
	    margin-top: 18px
	}
	.type_box{
	    width: 118%;
	    margin-left: -50px;
	    height: 89px;
	    margin-top: 18px;
	}
	.date_title{
	    float: left;
	    text-align: center;
	    width: 92px;
	}
	.date_input{
	    width: 167px;
	    float: left;
        color: #1b2334;
	}
	.date_prompt{
	    float: left;
	    width: 55px;
	    color: red;
	    line-height: 20px;
	    display: none;
	}
	.pop_input{
	    padding: 2px 8px;
	    background: url(<%=basePath %>/static/images/inp_bg.png) repeat-x;
	    border-radius: 1px;
	    color: #fff;
	}
	.checkbox_box{
		margin-bottom: 5px;
	}
	.popup {
    	width: 362px;
    }
    
    .popup_t {
    	width: 362px;
    }
    .popup_b {
    	height: 44px;
   	    padding-right: 125px;
    }
    .checkbox_cenert{
   	    margin-bottom: 6px!important;
    }
    .date_prompt1 {
	    width: 65px;
	    color: red;
	    line-height: 20px;
	    display: none;
        float: right;
	}
	.pagination{
		margin-top:0px;
	}
	
	/* 表格滚动条 */
	.table thead tr {
		 display:block; 
	}
	.table tbody {
		display: block;
		height: 435px;
		overflow: auto;
	}
	/* 弹出框样式 */
	.window-panel h3 {
	    margin: 7px;
        font-weight: 900;
    	font-size: 16px;
    }
    .window-panel .title {
    	width: 100%;
   	}
</style>
<body style="overflow: hidden;">
	<div class="index_top clearfix">
		<h3 class="fl title"> 数据管理 > 中间表管理  </h3>
	</div>
	<div class="index_bottom">
		<div class="data show">
	    	<div class = "outBox">
	    		<div class = "inBox">
	    		<div id = "inBox">
	    		<div class="scrollInBox" id = "scrollInBox">
	    			<!-- 事件-国家类型统计 -->
    				<div class="boxTab">
    					<div class="title_box">
    						事件-国家类型统计
    						<img class="hoverImg"  src="<%=basePath %>/static/images/detail.png">
    						<div class="content_detail">统计每日事件库中事件发生地国家的4大类、20根类的数量</div>
    					</div>
    					<div class="line_box"></div>
    					<div class="content_box">
    						<div class="subtitles_box">
    							<div class="subtitle">应监测天数：</div>
    							<div class="data_box">
    								<span class="data_span" style="color: #29CA9B;" name="ectTime">-</span>
    								<span class="unit_span">天</span>
    							</div>
    						</div>
    						<div class="subtitles_box">
    							<div class="subtitle">实际统计天数：</div>
    							<div class="data_box">
    								<span class="data_span" style="color: #01BFDC;" id="countTypeSum">-</span>
    								<span class="unit_span">天</span>
    							</div>
    						</div>
    						<div class="subtitles_box">
    							<div class="subtitle">统计异常：</div>
    							<div class="data_box">
    								<span class="data_span" style="color: #ED2225;" id="countTypeInfo">-</span>
    								<span class="unit_span">天</span>
    							</div>
    						</div>
    						<div class="subtitles_box">
    							<div class="subtitle">统计中：</div>
    							<div class="data_box">
    								<span class="data_span" style="color: #E68B26;" id="countTypeIng">0</span>
    								<span class="unit_span">天</span>
    							</div>
    						</div>
    						<div class="subtitles_box">
    							<div class="subtitle">缺失统计：</div>
    							<div class="data_box lack_data_span">
    								<span class="data_span" style="color: #f18888;text-decoration:underline" id="countryTypeMiss"></span><span class="unit_span">天</span>
    								<div class="lack_detail">
	    								<ul id="countryTypeMis">
	    								</ul>
    								</div>
    							</div>
    							
    						</div>
    					</div>
    				</div>
    				<!-- 事件-国家类型比重统计 -->
    					<div class="boxTab">
    					<div class="title_box">
    						事件-国家类型比重统计
    						<img class="hoverImg"  src="<%=basePath %>/static/images/detail.png">
    						<div class="content_detail">统计每日事件库中事件发生地国家的4大类、20根类的比重</div>
    					</div>
    					<div class="line_box"></div>
    					<div class="content_box">
    						<div class="subtitles_box">
    							<div class="subtitle">应监测天数：</div>
    							<div class="data_box">
    								<span class="data_span" style="color: #29CA9B;" name="ectTime">-</span>
    								<span class="unit_span">天</span>
    							</div>
    						</div>
    						<div class="subtitles_box">
    							<div class="subtitle">实际统计天数：</div>
    							<div class="data_box">
    								<span class="data_span" style="color: #01BFDC;" id="proTypeSum">-</span>
    								<span class="unit_span">天</span>
    							</div>
    						</div>
    						<div class="subtitles_box">
    							<div class="subtitle">统计异常：</div>
    							<div class="data_box">
    								<span class="data_span" style="color: #ED2225;" id="proTypeInfo">-</span>
    								<span class="unit_span">天</span>
    							</div>
    						</div>
    						<div class="subtitles_box">
    							<div class="subtitle">统计中：</div>
    							<div class="data_box">
    								<span class="data_span" style="color: #E68B26;" id="proTypeIng">-</span>
    								<span class="unit_span">天</span>
    							</div>
    						</div>
    						<div class="subtitles_box">
    							<div class="subtitle">缺失统计：</div>
    							<div class="data_box lack_data_span">
    								<span class="data_span" style="color: #f18888;text-decoration:underline" id="proTypeMiss"></span><span class="unit_span">天</span>
    								<div class="lack_detail">
	    								<ul id="proTypeMis">
	    								</ul>
    								</div>
    							</div>
    							
    						</div>
    					</div>
    				</div>
    				<!-- 事件-国家稳定统计 -->
    				<div class="boxTab">
    					<div class="title_box">
    						事件-国家稳定统计
    						<img class="hoverImg"  src="<%=basePath %>/static/images/detail.png">
    						<div class="content_detail">统计每日事件库中事件发生地国家的平均稳定值、稳定总值.</div>
    					</div>
    					<div class="line_box"></div>
    					<div class="content_box">
    						<div class="subtitles_box">
    							<div class="subtitle">应监测天数：</div>
    							<div class="data_box">
    								<span class="data_span" style="color: #29CA9B;" name="ectTime">-</span>
    								<span class="unit_span">天</span>
    							</div>
    						</div>
    						<div class="subtitles_box">
    							<div class="subtitle">实际统计天数：</div>
    							<div class="data_box">
    								<span class="data_span" style="color: #01BFDC;"id="countStaSum">-</span>
    								<span class="unit_span">天</span>
    							</div>
    						</div>
    						<div class="subtitles_box">
    							<div class="subtitle">统计异常：</div>
    							<div class="data_box">
    								<span class="data_span" style="color: #ED2225;" id="countStaInfo">-</span>
    								<span class="unit_span">天</span>
    							</div>
    						</div>
    						<div class="subtitles_box">
    							<div class="subtitle">统计中：</div>
    							<div class="data_box">
    								<span class="data_span" style="color: #E68B26;" id="countStaIng">-</span>
    								<span class="unit_span">天</span>
    							</div>
    						</div>
    						<div class="subtitles_box">
    							<div class="subtitle">缺失统计：</div>
    							<div class="data_box lack_data_span">
    								<span class="data_span" style="color: #f18888;text-decoration:underline" id="countryStaMiss"></span><span class="unit_span">天</span>
    								<div class="lack_detail">
	    								<ul id="countryStaMis">
	    								</ul>
    								</div>
    							</div>
    						</div>
    					</div>
    				</div>
    				
    				<!-- 事件-国家情感统计 -->
    				<div class="boxTab">
    					<div class="title_box">
    						事件-国家情感统计
    						<img class="hoverImg"  src="<%=basePath %>/static/images/detail.png">
    						<div class="content_detail">统计每日事件库中事件参与角色一国家的平均情感值、情感总值.</div>
    					</div>
    					<div class="line_box"></div>
    					<div class="content_box">
    						<div class="subtitles_box">
    							<div class="subtitle">应监测天数：</div>
    							<div class="data_box">
    								<span class="data_span" style="color: #29CA9B;" name="ectTime">-</span>
    								<span class="unit_span">天</span>
    							</div>
    						</div>
    						<div class="subtitles_box">
    							<div class="subtitle">实际统计天数：</div>
    							<div class="data_box">
    								<span class="data_span" style="color: #01BFDC;" id="countToneSum">-</span>
    								<span class="unit_span">天</span>
    							</div>
    						</div>
    						<div class="subtitles_box">
    							<div class="subtitle">统计异常：</div>
    							<div class="data_box">
    								<span class="data_span" style="color: #ED2225;" id="countToneInfo">-</span>
    								<span class="unit_span">天</span>
    							</div>
    						</div>
    						<div class="subtitles_box">
    							<div class="subtitle">统计中：</div>
    							<div class="data_box">
    								<span class="data_span" style="color: #E68B26;" id="countToneIng">-</span>
    								<span class="unit_span">天</span>
    							</div>
    						</div>
    						<div class="subtitles_box">
    							<div class="subtitle">缺失统计：</div>
    							<div class="data_box lack_data_span">
    								<span class="data_span" style="color: #f18888;text-decoration:underline" id="countryToneMiss"></span><span class="unit_span">天</span>
    								<div class="lack_detail">
	    								<ul id="countryToneMis">
	    									
	    								</ul>
    								</div>
    							</div>
    						</div>
    					</div>
    				</div>
    				<!-- 事件-事件数统计（4个权重） -->
    				<div class="boxTab">
    					<div class="title_box">
    						事件-事件数统计
    						<img style="margin-left: 27px;cursor: pointer;position: relative;left: 17px;" title="再统计" onclick="againStatis()"  src="<%=basePath %>/static/images/again.png">
    						<img style="position: relative; left: -45px;" class="hoverImg"  src="<%=basePath %>/static/images/detail.png">
    						<div class="content_detail">  统计每日事件库中的事件数（4个权重值）注意：点击右侧进行再统计功能</div>
    					</div>
    					<div class="line_box"></div>
    					<div class="content_box">
    						<div class="subtitles_box">
    							<div class="subtitle">应监测天数：</div>
    							<div class="data_box">
    								<span class="data_span" style="color: #29CA9B;" name="ectTime">-</span>
    								<span class="unit_span">天</span>
    							</div>
    						</div>
    						<div class="subtitles_box">
    							<div class="subtitle">实际统计天数：</div>
    							<div class="data_box">
    								<span class="data_span" style="color: #01BFDC;" id="eventSum">-</span>
    								<span class="unit_span">天</span>
    							</div>
    						</div>
    						<div class="subtitles_box">
    							<div class="subtitle">统计异常：</div>
    							<div class="data_box">
    								<span class="data_span" style="color: #ED2225;" id="dateInfo">-</span>
    								<span class="unit_span">天</span>
    							</div>
    						</div>
    						<div class="subtitles_box">
    							<div class="subtitle">统计中：</div>
    							<div class="data_box">
    								<span class="data_span" style="color: #E68B26;">-</span>
    								<span class="unit_span">天</span>
    							</div>
    						</div>
    						<div class="subtitles_box">
    							<div class="subtitle">缺失统计：</div>
    							<div class="data_box lack_data_span">
    								<span class="data_span" style="color: #f18888;text-decoration:underline" id="staticsMs"></span><span class="unit_span">天</span>
    								<div class="lack_detail">
	    								<ul id="eventMiss">
	    								</ul>
    								</div>
    							</div>
    						</div>
    					</div>
    				</div>
    				<!-- 图谱-人物情感统计 -->
    				<div class="boxTab">
    					<div class="title_box">
    						图谱-人物情感统计
    						<img class="hoverImg"  src="<%=basePath %>/static/images/detail.png">
    						<div class="content_detail">统计每日图谱库中人物（人物配置列表）的正向情感值、负向情感值、平均情感值</div>
    					</div>
    					<div class="line_box"></div>
    					<div class="content_box">
    						<div class="subtitles_box">
    							<div class="subtitle">应监测天数：</div>
    							<div class="data_box">
    								<span class="data_span" style="color: #29CA9B;" id="tptime">-</span>
    								<span class="unit_span">天</span>
    							</div>
    						</div>
    						<div class="subtitles_box">
    							<div class="subtitle">实际统计天数：</div>
    							<div class="data_box">
    								<span class="data_span" style="color: #01BFDC;" id="actorToneSum">-</span>
    								<span class="unit_span">天</span>
    							</div>
    						</div>
    						<div class="subtitles_box">
    							<div class="subtitle">统计异常：</div>
    							<div class="data_box">
    								<span class="data_span" style="color: #ED2225;" id="actorToneInfo">-</span>
    								<span class="unit_span">天</span>
    							</div>
    						</div>
    						<div class="subtitles_box">
    							<div class="subtitle">统计中：</div>
    							<div class="data_box">
    								<span class="data_span" style="color: #E68B26;" id="actorToneIng">-</span>
    								<span class="unit_span">天</span>
    							</div>
    						</div>
    						<div class="subtitles_box">
    							<div class="subtitle">缺失统计：</div>
    							<div class="data_box lack_data_span">
    								<span class="data_span" style="color: #f18888;text-decoration:underline" id="actorToneMiss"></span><span class="unit_span">天</span>
    								<div class="lack_detail">
	    								<ul id="actorToneMis">
	    								</ul>
    								</div>
    							</div>
    						</div>
    					</div>
    				</div>
    				<!-- 源数据-入库量统计 -->
    				<div class="boxTab">
    					<div class="title_box">
    						源数据-入库量统计
    						<img class="hoverImg"  src="<%=basePath %>/static/images/detail.png">
    						<div class="content_detail">统计每日事件库、图谱库、新闻库的入库量</div>
    					</div>
    					<div class="line_box"></div>
    					<div class="content_box">
    						<div class="subtitles_box">
    							<div class="subtitle">应监测天数：</div>
    							<div class="data_box">
    								<span class="data_span" style="color: #29CA9B;" id="datasourthTime">-</span>
    								<span class="unit_span">天</span>
    							</div>
    						</div>
    						<div class="subtitles_box">
    							<div class="subtitle">实际统计天数：</div>
    							<div class="data_box">
    								<span class="data_span" style="color: #01BFDC;" id="stockSum">-</span>
    								<span class="unit_span">天</span>
    							</div>
    						</div>
    						<div class="subtitles_box">
    							<div class="subtitle">统计异常：</div>
    							<div class="data_box">
    								<span class="data_span" style="color: #ED2225;" id="stockInfo">-</span>
    								<span class="unit_span">天</span>
    							</div>
    						</div>
    						<div class="subtitles_box">
    							<div class="subtitle">统计中：</div>
    							<div class="data_box">
    								<span class="data_span" style="color: #E68B26;" id="stockIng">-</span>
    								<span class="unit_span">天</span>
    							</div>
    						</div>
    						<div class="subtitles_box">
    							<div class="subtitle">缺失统计：</div>
    							<div class="data_box lack_data_span">
    								<span class="data_span" style="color: #f18888;text-decoration:underline" id="stockMiss"></span><span class="unit_span">天</span>
    								<div class="lack_detail">
	    								<ul id="stockMis">
	    								</ul>
    								</div>
    							</div>
    						</div>
    					</div>
    				</div>
    				</div>
    			</div>   				    			
	    		</div>
	    		<!--列表 -->
	    		<div class = "inBox1">
	    			<div class="table_box">
						<div style="margin-left: 40px;">
							<ul class="table_ul mgl-30 clearfix">
								<li>开始时间：<input class="inp_selc day1" name="stDates"  type="text" readonly  id="stDates"/></li>
								<li>结束时间：<input class="inp_selc day2" name="edDates"  type="text" readonly  id="edDates"/></li>
								<li>
									<div style="float: left; line-height: 20px;">中间表类型：</div>
									<div class="fl clearfix" style="float: left; height: 20px;">
										<div class="dowebok0">
											<select id="tableType" name="tableType">
												<option value="" selected="selected">全部</option>
												<option value="2" >事件-国家类型统计</option>
												<option value="11" >事件-国家类型比重统计</option>
												<option value="3" >事件-国家稳定统计</option>
												<option value="4" >事件-国家情感统计</option>
												<option value="6" >图谱-人物情感统计</option>
												<option value="10" >源数据-入库量统计</option>
											</select>
										</div>
									</div>
								</li>
								<li >
									<div style="float: left; line-height: 20px;">执行状态：</div>
									<div class="fl clearfix" style="float: left; height: 20px;">
										<div style=" width: 80px; display: inline-block;">
											<select id="status" name="status">
												<option value="" selected="selected">全部</option>
												<option value="0" >排队中 </option>
												<option value="1" >执行完成 </option>
												<option value="2" >执行失败   </option>
												<!-- <option value="4" >统计中</option> -->
												<!-- <option value="3" >执行完成 </option> -->
											</select>
										</div>
									</div>
								</li>
								<li><input class="seach_btn" onclick="cx()" type="button" value="查询" ></li>
								<li><input class="addbutton" onclick="addPZ()"  type="button"  value="新增配置" ></li>
								<li><input class="addbutton"  type="button" onclick="delAll()"  value="批量删除" ></li>
								<li><input class="addbutton"  type="button" onclick="delStatics()" value="批量再统计" ></li>
							</ul>
						
						</div>
						<div style="height: 485px;">
							<table class="table">
							<thead>
								<tr>
									<th style="width: 2.5%"  class="custom_style"><input id="newAllcheck" style=" vertical-align: middle; margin-bottom: 6px;" class="checkbox_checkbox_cenert" type="checkbox"/>全选 </th>
									<th style="width: 2.5%" class="custom_style">序号</th>
									<th style="width: 5%" class="custom_style">中间表类型</th>
									<th style="width: 5%" class="custom_style">统计日期</th>
									<th style="width: 5%" class="custom_style">执行状态</th>
									<th style="width: 5%" class="custom_style">执行次数</th>
									<th style="width: 5%" class="custom_style">耗时（秒）</th>
									<th style="width: 5%" class="custom_style">源数据记录数(条)</th>
									<th style="width: 5%" class="custom_style">处理数据记录数(条)</th>
									<th style="width: 5%" class="custom_style">最终数据积累数(条)</th>
									<th style="width: 5%" class="custom_style">操作</th>
								</tr>
							</thead>
							<tbody>
							
							</tbody>
						</table>
						
						</div>
						<!-- 分页 -->
						<div id="Pagination" class="pagination"><!-- 这里显示分页 --></div>
						
					</div>
	    		</div>
	    	</div>
        </div>
	</div>
	
	
	
	<div id="shadow" class="shadow"></div>
	<!-- 事件分类选择弹出层 -->
	<div class="popup">
		<div class="popup_t">
			<h3 class="popup_h3 fl">新增配置</h3>
			<label class="check_z" for=""><img onclick="closePoP()" src="<%=basePath %>/static/images/delete.png"></label>
		</div>
		<div class="popup_m">
			<div class="date_box">
				<div class="date_title">开始时间：</div>
				<div class="date_input"><input class="inp_selc day3" name="ksDates"  type="text" readonly  id="ksDates" style="padding-left: 7px;background: url(<%=basePath %>/static/images/inp_bg.png) repeat-x;border: 1px solid #49567a;border-radius: 1px;color: #fff;"/></div>
				<div class="date_prompt" id="pormpt1">*必填项</div>
			</div>
			<div class="date_box">
				<div class="date_title">结束时间：</div>
				<div class="date_input"><input class="inp_selc day4" name="jsDates"  type="text" readonly  id="jsDates" style="padding-left: 7px;background: url(<%=basePath %>/static/images/inp_bg.png) repeat-x;border: 1px solid #49567a;border-radius: 1px;color: #fff;"/></div>
				<div class="date_prompt" id="pormpt2">*必填项</div>
			</div>
			<div class="type_box">
				<div class="date_title">中间表类型：</div>
				<div style="float: left; width: 254px; margin-left: 92px;margin-top: -21px;" id="checkALL">
					<div class="checkbox_box">
						<input class="checkbox_cenert" type="checkbox" name="chechedStatics" value="2"/>事件-国家类型统计
						<input class="checkbox_cenert" type="checkbox" name="chechedStatics" value="3"/>事件-国家稳定统计
					</div>
					<div class="checkbox_box">
						<input class="checkbox_cenert" type="checkbox" name="chechedStatics" value="4"/>事件-国家情感统计
						<input class="checkbox_cenert" type="checkbox" name="chechedStatics" value="6"/>图谱-人物情感统计
					</div>
					<div class="checkbox_box">
						<input class="checkbox_cenert" type="checkbox" name="chechedStatics" value="10"/>源数据-入库量统计
						<input class="checkbox_cenert" type="checkbox" name="chechedStatics" value="11"/>事件-国家类型比重统计
						<span class="date_prompt1" id="pormpt3">*至少选一项</span>
					</div>
				</div>
			</div>
		</div>
		<div class="popup_b">
			<p class="fr" style=" margin-top: 5px">
				<span class="save" onclick="tijiao()">提交</span>
				<span onclick="closePoP()" class="cancel">取消</span>
			</p>
		</div>
	</div>
	<input type="hidden" id="pageIndexNew" value="0"/>
	
	
	<%-- <jsp:include page="updateUserPassword.jsp"/> --%>
</body>
<!-- 人工查询功能的日期 -->
<script src="<%=basePath %>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-select.min.js"></script>
<script src="<%=basePath %>/static/js/jquery.combo.select.js"></script>
<script src="<%=basePath %>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath %>/static/js/perfect-scrollbar.js"></script>
<script src="<%=basePath %>/static/js/sec2.js"></script>
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<script type="text/javascript" src="<%=basePath %>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/Visualization/base/base.js"></script>
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
<script type="text/javascript">
	
	$(function(){
		
		// 下拉框 每一个下拉框对应一个ID，然后调用perfectScrollbar美化滚动条
		$('select').comboSelect();
		$(".dowebok0 ul").attr("id", "description0");
		showConfigList();
		//计算事件的应监测天数
		var curDate = new Date();//当前日期
		var date1="1979-01-01";//事件起始日期
		var preDate = new Date(curDate.getTime() - 24*60*60*1000); //前一天
	   　　var sdate = new Date(date1); 
	   　　var days = preDate.getTime() - sdate.getTime();//相减的毫秒 
	   　　var day = parseInt(days / (1000 * 60 * 60 * 24)+1); //换算的天数
	 	$('[name="ectTime"]').html(day);
		$('#datasourthTime').html(day);
	   //计算源数据的应监测天数
	 	var curDates = new Date();//当前日期
		var date3="2013-04-01";//事件起始日期
		var preDates = new Date(curDates.getTime() - 24*60*60*1000); //前一天
	   　　var sdates = new Date(date3); 
	   　　var days1 = preDates.getTime() - sdates.getTime();//相减的毫秒 
	   　　var day1 = parseInt(days1 / (1000 * 60 * 60 * 24)+1); //换算的天数
	 	$('#tptime').html(day1);
	    //统计除了缺失统计的其他数据
	    var type="2,3,4,6,10,11";
	  	$.ajax({
			url:'../modelManager/selectModelManagerStatic',
			type:'POST',
			data: {"type":type},
			success:function(result){
				var data=eval('(' + result + ')');
				//国家类型
				var countryTypeMap=data.countryTypeMap;//国家类型
				var countTypeInfo=countryTypeMap.countInfo//统计异常
				var countTypeIng=countryTypeMap.countIng//统计中
				var countTypeSum=countryTypeMap.countSum//总数据量
				$("#countTypeInfo").html(countTypeInfo)
				$("#countTypeIng").html(countTypeIng)
				$("#countTypeSum").html(countTypeSum)
                //国家稳定				
				var countryStaMap = data.countryStaMap;//国家稳定
				var countStaInfo=countryStaMap.countInfo//统计异常
				var countStaIng=countryStaMap.countIng//统计中
				var countStaSum=countryStaMap.countSum//总数据量
				$("#countStaInfo").html(countStaInfo)
				$("#countStaIng").html(countStaIng)
				$("#countStaSum").html(countStaSum)
				//国家情感
				var countryToneMap=data.countryToneMap;//国家情感
				var countToneInfo=countryToneMap.countInfo//统计异常
				var countToneIng=countryToneMap.countIng//统计中
				var countToneSum=countryToneMap.countSum//总数据量
				$("#countToneInfo").html(countToneInfo)
				$("#countToneIng").html(countToneIng)
				$("#countToneSum").html(countToneSum)
				//人物情感
				var actorToneMap=data.actorToneMap;//人物情感
				var actorToneInfo=actorToneMap.countInfo//统计异常
				var actorToneIng=actorToneMap.countIng//统计中
				var actorToneSum=actorToneMap.countSum//总数据量
				$("#actorToneInfo").html(actorToneInfo)
				$("#actorToneIng").html(actorToneIng)
				$("#actorToneSum").html(actorToneSum)
				//入库量统计
				var stockMap=data.stockMap;//入库量统计
				var stockInfo=stockMap.countInfo//统计异常
				var stockIng=stockMap.countIng//统计中
				var stockSum=stockMap.countSum//总数据量
				$("#stockInfo").html(stockInfo)
				$("#stockIng").html(stockIng)
				$("#stockSum").html(stockSum)
				//国家类型比重统计
				var proMap=data.proMap;//入库量统计
				var proInfo=proMap.countInfo//统计异常
				var proIng=proMap.countIng//统计中
				var proSum=proMap.countSum//总数据量
				$("#proTypeInfo").html(proInfo)
				$("#proTypeIng").html(proIng)
				$("#proTypeSum").html(proSum)
			}
		}); 
	  	//事件-事件数统计
	  	$.ajax({
			url:'../modelManager/modelManagerEventStatic',
			type:'POST',
			async:true,
			data: {day:day},
			success:function(result){
				var data=eval('(' + result + ')');
				var timeList=data.timeList//缺失数组
				var dateSize=data.dateSize;//统计异常
				var eventSum=data.eventSum;//总记录数
				/* 
				var dateInfo =day-dateSize;
				$("#dateInfo").html(dateInfo); 
				*/
				$("#eventSum").html(eventSum);
				var staticsMs= timeList.length;
				$("#staticsMs").html(staticsMs);
				 var lis="";
				if(timeList.length>180){
					for(var i=0;i<180;i++){
						lis+="<li>"+timeList[i]+"<li/>"
					} 
					$("#eventMiss").html(lis)
				}else{
					for(var i=0;i<timeList.length;i++){
						lis+="<li>"+timeList[i]+"<li/>"
					} 
					$("#eventMiss").html(lis)
				}
				
			}
		}); 
	  	
		//除了事件-事件数的缺失统计
	  	$.ajax({
			url:'../modelManager/modelManagerStatic',
			type:'POST',
			async:true,
			data: {"type":type},
			success:function(result){
				var data=eval('(' + result + ')');
				//国家类型
				var countryTypeMap=data.countryTypeMap;//国家类型
				var countryTypeMiss=countryTypeMap.length;
				$("#countryTypeMiss").html(countryTypeMiss)
				var lis="";
				if(countryTypeMap.length>180){
					for(var i=0;i<180;i++){
						lis+="<li>"+countryTypeMap[i]+"<li/>"
					} 
					$("#countryTypeMis").html(lis)
				}else{
					for(var i=0;i<countryTypeMap.length;i++){
						lis+="<li>"+countryTypeMap[i]+"<li/>"
					} 
					$("#countryTypeMis").html(lis)
				} 
				//国家类型比重
				var proTypeMap=data.proMap;//国家类型
				var proTypeMiss=proTypeMap.length;
				$("#proTypeMiss").html(proTypeMiss)
				var lis="";
				if(proTypeMap.length>180){
					for(var i=0;i<180;i++){
						lis+="<li>"+proTypeMap[i]+"<li/>"
					} 
					$("#proTypeMis").html(lis)
				}else{
					for(var i=0;i<proTypeMap.length;i++){
						lis+="<li>"+proTypeMap[i]+"<li/>"
					} 
					$("#proTypeMis").html(lis)
				} 
                //国家稳定	
				var countryStaMap = data.countryStaMap;//国家稳定
				var countryStaMiss=countryStaMap.length;
				$("#countryStaMiss").html(countryStaMiss)
				var clis=""
				if(countryStaMap.length>180){
					for(var i=0;i<180;i++){
						clis+="<li>"+countryStaMap[i]+"<li/>"
					} 
					$("#countryStaMis").html(clis)
				}else{
					for(var i=0;i<countryStaMap.length;i++){
						clis+="<li>"+countryStaMap[i]+"<li/>"
					} 
					$("#countryStaMis").html(clis)
				} 
				//国家情感
				var countryToneMap=data.countryToneMap;//国家情感
				var countryToneMiss=countryToneMap.length;
				$("#countryToneMiss").html(countryToneMiss)
				var tlis="";
				if(countryToneMap.length>180){
					for(var i=0;i<180;i++){
						tlis+="<li>"+countryToneMap[i]+"<li/>"
					} 
					$("#countryToneMis").html(tlis)
				}else{
					for(var i=0;i<countryToneMap.length;i++){
						tlis+="<li>"+countryToneMap[i]+"<li/>"
					} 
					$("#countryToneMis").html(tlis)
				} 
				//人物情感
				var actorToneMap=data.actorToneMap;//人物情感
				var actorToneMiss=actorToneMap.length;
				$("#actorToneMiss").html(actorToneMiss)
				var alis=""
				if(actorToneMap.length>180){
					for(var i=0;i<180;i++){
						alis+="<li>"+actorToneMap[i]+"<li/>"
					} 
					$("#actorToneMis").html(alis)
				}else{
					for(var i=0;i<actorToneMap.length;i++){
						alis+="<li>"+actorToneMap[i]+"<li/>"
					} 
					$("#actorToneMis").html(alis)
				} 
				//入库量统计
				var stockMap=data.stockMap;//入库量统计
				var stockMiss=stockMap.length;
				$("#stockMiss").html(stockMiss)
				var mlis=""
				if(stockMap.length>180){
					for(var i=0;i<180;i++){
						mlis+="<li>"+stockMap[i]+"<li/>"
					} 
					$("#stockMis").html(mlis)
				}else{
					for(var i=0;i<stockMap.length;i++){
						mlis+="<li>"+stockMap[i]+"<li/>"
					} 
					$("#stockMis").html(mlis)
				} 
			}
		}); 
	  	
	  	
	});
	
    
    //缺失数据显示
    $(".lack_data_span").hover(function () {
    	$(this).find(".lack_detail").show();
        //$(this).next().show();
    }, function () {
    	$(this).find(".lack_detail").hide();
    	//$(this).next().hide();
    })
	//源数据-入库量统计 的再统计功能,直接调用统计权重表的方法	
	function againStatis(){
		 /* if(confirm('确定要重新统计该中间表数据吗?')){
			startLoad();
			$.ajax({
				url:'../modelManager/againStatisticsAllweightFlag',
				type:'POST',
				dataType:'json',
				success:function(result){
					endLoad();
					if(result.msg=="success"){
						alert("《事件-事件数统计》 再统计成功");
					}else{
						alert("《事件-事件数统计》 再统计失败，请联系管理员");
					}
				}
			});
          }else{
          	alert("已取消");
          } */
          win.confirm('系统提示', '确定要重新统计该中间表数据吗?', function (r) {
 			 if(r){
 				startLoad();
 				$.ajax({
 					url:'../modelManager/againStatisticsAllweightFlag',
 					type:'POST',
 					dataType:'json',
 					success:function(result){
 						endLoad();
 						if(result.msg=="success"){
 							win.alertEx("《事件-事件数统计》 再统计成功");
 						}else{
 							win.alertEx("《事件-事件数统计》 再统计失败，请联系管理员");
 						}
 					}
 				});
 			 }else{
 				win.alertEx("已取消");
 	         }
 		})
	}
	//新增配置弹出框
	function addPZ(){
		var bodyScrH = document.body.scrollHeight;
		$(".shadow").height(bodyScrH);
		$(".shadow").css("display","block");
		$(".popup").css("display","block");
		$("#ksDates").val("");
		$("#jsDates").val("");
		$("#checkALL :checkbox").each(function(){
			if($(this).prop("checked") == true){
				$(this).prop("checked",false);
			}
		});
	}
	//取消
	function closePoP(){
		$(".shadow").css("display","none");
		$(".popup").css("display","none");
		$(".popup2").css("display","none");
	};
	//表格
	var rs = null;
	var pageSize = 0;
	var pageIndex = 0;
	function showConfigList(){
	    var stDates = $('#stDates').val();
	    var edDates = $('#edDates').val();
		var tableType = $('#tableType').val();
		var status = $('#status').val();
		var pageIndexNew = $('#pageIndexNew').val();
		var dt = {
				pageIndex:pageIndexNew,
		};
		if(stDates != null && stDates != ''){
			dt['stDates'] = stDates;
		}
		if(edDates != null && edDates != ''){
			dt['edDates'] = edDates;
		}
		if(tableType != null && tableType != ''){
			dt['tableType'] = tableType;
		}
		if(status != null && status != ''){
			dt['status'] = status;
		}
		$.ajax({
			url:'../modelManager/selectModelManagerList',
			type:'POST',
			data: dt,
			success:function(result){
				var data=eval('(' + result + ')');
				pageSize = data.pageSize;
				var totalRows = data.total;
				pageIndex = data.pageIndex;
				rs = data.data;
				$("#Pagination").pagination(totalRows, {
					callback: pageselectCallback,
					current_page: pageIndex,
					num_display_entries: 4, //主体页数
					items_per_page: pageSize, //每页显示1项
					num_edge_entries: 2 //边缘页数
				});
			}
		});
	}

	function pageselectCallback(pageIndex, jq){
		$("#pageIndexNew").val(pageIndex);
		initData(pageIndex);
	}

	function initData(pageIndex){
		var tbodys = '';
		var stDates = $('#stDates').val();
	    var edDates = $('#edDates').val();
		var tableType = $('#tableType').val();
		var status = $('#status').val();
		var pageIndexNew = $('#pageIndexNew').val();
		var dt = {
				pageIndex:pageIndexNew,
		};
		if(stDates != null && stDates != ''){
			dt['stDates'] = stDates;
		}
		if(edDates != null && edDates != ''){
			dt['edDates'] = edDates;
		}
		if(tableType != null && tableType != ''){
			dt['tableType'] = tableType;
		}
		if(status != null && status != ''){
			dt['status'] = status;
		}
		if(rs == null){
			$.ajax({
				url: '../modelManager/selectModelManagerList',
				type: 'POST',
				data: dt,
				success:function(result){
					var data=eval('(' + result + ')');
					tbodys = packageConfigData(data.data);
					$('.table tbody').html(tbodys);
				}
			});
		}else{
			tbodys = packageConfigData(rs);
			rs = null;
			$('.table tbody').html(tbodys);
		}
		return true;
	}

	function packageConfigData(rs){
		var pageIndex_current = $('#pageIndexNew').val();
		var pageSize = 20;//后代写死
		var tbody = '', trs = '';
		$.each(rs, function(i, item){
			trs += '<tr><td style="width: 2.5%"><input type="checkbox" class="newFuxuankuang" onclick="newFuxuankuang()" data='+item.tableType+' data-flid='+item.date+' ></td><td style="width: 2.5%">' + (pageIndex_current * pageSize + i + 1) + '</td>';
			if(item.tableType==2){
				trs += '<td style="width: 5%">'+" 事件-国家类型统计 "+'</td>';
			}else if(item.tableType==3){
				trs += '<td style="width: 5%">'+" 事件-国家稳定统计 "+'</td>';
			}else if(item.tableType==4){
				trs += '<td style="width: 5%">'+" 事件-国家情感统计 "+'</td>';
			}else if(item.tableType==6){
				trs += '<td style="width: 5%">'+" 图谱-人物情感统计 "+'</td>';
			}else if(item.tableType==10){
				trs += '<td style="width: 5%">'+" 源数据-入库量统计 "+'</td>';
			}else if(item.tableType==11){
					trs += '<td style="width: 5%">'+" 事件-国家类型比重统计 "+'</td>';
				}/* else{
				trs += '<td>'+"找不到相对应的中间表 "+'</td>';
			} */
			trs += '<td style="width: 5%">' + item.date + '</td>';
			if(item.status==0 && item.failCount < 5){
				trs += '<td style="width: 5%">'+" 排队中"+'</td>';
			}else if(item.status==1){
				trs += '<td style="width: 5%">'+"成功"+'</td>';
			}else if(item.status==0 && item.failCount >=5){
				trs += '<td style="width: 5%">'+"失败"+'</td>';
			}else if(item.status==4){
				/* trs += '<td style="width: 5%">统计中</td>'; */
				trs += '<td style="width: 5%">'+"成功"+'</td>';
			}
			trs += '<td style="width: 5%">' + item.failCount + '</td>';
			trs += '<td style="width: 5%"> ' + item.statisticsTime + '</td>';
			trs += '<td style="width: 5%">' + item.recordNum + '</td>';
			trs += '<td style="width: 5%">' + item.decomposeNum + '</td>';
			trs += '<td style="width: 5%">' + item.successNum + '</td>';
			trs += '<td style="width: 5%"><img title="再统计" class="set" src="<%=basePath %>/static/images/set.png" onclick="editUserConfig('+ item.date +',\''+ item.tableType +'\')"/><img title="删除" class="del" onclick="delUserConfig('+ item.date +',\''+ item.tableType +'\')" src="<%=basePath %>/static/images/del.png"/></td>';
			trs += '</tr>';
		});
		tbody += trs;
		return tbody;
	}
    //复选框
	function newFuxuankuang(){
		var chknum = $(".table tbody :checkbox").size();
		var chk = 0;
		$(".table tbody :checkbox").each(function(){
			if($(this).prop("checked") == true){
				chk++;
			}
		});
		if(chk == chknum){
			$("#newAllcheck").prop("checked",true);
		}else{
			$("#newAllcheck").prop("checked",false);
		}
	}
	$("#newAllcheck").on('click',function(){
		$(".table tbody :checkbox").each(function(){
			$(this).prop("checked",$("#newAllcheck").prop("checked"));
		});
		
	});
	
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
	
	// 选择年月日
	$('.day3').datepicker({
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
		    if($(this).val() > $('.day4').val()){
		    	$('.day4').val($(this).val());
		    }
		    var startTime = e.date; 
		    $('.day4').datepicker('setStartDate',startTime);  
		});

	$('.day4').datepicker({
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
			if($(this).val() < $('.day3').val()){
				$('.day3').val($(this).val());
			}
		    var endTime = e.date;  
		    $('.day3').datepicker('setEndDate',endTime);  
		}); 
	
	//查询
	function cx(){
		$('#pageIndexNew').val(0);
		showConfigList();
	}
	
	function tijiao(){
		var ksDates = $('#ksDates').val();
	    var jsDates = $('#jsDates').val();
	    var box = document.getElementsByName("chechedStatics");
		var objArray = box.length;
		var chestr="";
		
		for(var i=0;i<objArray;i++){
			if(box[i].checked == true){
				chestr+=box[i].value+",";
			} 
		} 
		var dt = {
				
		};
		if(ksDates != null && ksDates != ''){
			dt['stDates'] = ksDates;
		}
		if(jsDates != null && jsDates != ''){
			dt['edDates'] = jsDates;
		}
		if(tableType != null && tableType != ''){
			dt['tableTypes'] = chestr;
		}
		if(status != null && status != ''){
			dt['status'] = status;
		}
		if(ksDates==""||ksDates==undefined){
			$("#pormpt1").css("display","block");
		}
		if(jsDates==""||jsDates==undefined){
			$("#pormpt2").css("display","block");
		}
		
		if($('div input[type=checkbox]:checked').length==0){
			$("#pormpt3").css("display","block");
		}
		var lgh=$('div input[type=checkbox]:checked').length;
		
		if(ksDates!=""&&ksDates!=undefined&&jsDates!=""&&jsDates!=undefined&&lgh!=0){
			$.ajax({
				url:'../modelManager/addModelManager',
				type:'POST',
				data: dt,
				success:function(result){
					var resultStr=result.substring(0,1);
					if(resultStr=="s"){
						win.alertEx("中间表新增成功");
						window.location.reload(); 
					}
					if(resultStr=="e"){
						win.alertEx("中间表新增失败");
					}
					if(resultStr=="1"||resultStr=="2"){
						win.alertEx(result+"中间表已经有此日期的记录");
					}
				}
			})
			
		}
	}
	
	//删除
	function delUserConfig(date,tableType){
		/* if(confirm('确定要删除此条记录吗?')){
			var dt = {date:date,tableType:tableType};
    		$.ajax({
    			url: '../modelManager/dateleModelManager',
    			type: 'POST',
    			data: dt,
    			success: function(result){
    				var data=eval("("+result+")");
    				if(data.msg == 'ok'){
    					alert('删除成功');
    					window.location.reload(); 
    					$("#infodiv").css("display","none");
    				}else if(data.msg == 'error'){
    					alert('系统异常，请联系系统管理员');
    				}
    			}
    		});
          }else{
          	alert("已取消");
          } */
		win.confirm('系统提示', '确定要删除此条记录吗?', function (r) {
			 if(r){
				 var dt = {date:date,tableType:tableType};
		    		$.ajax({
		    			url: '../modelManager/dateleModelManager',
		    			type: 'POST',
		    			data: dt,
		    			success: function(result){
		    				var data=eval("("+result+")");
		    				if(data.msg == 'ok'){
		    					win.alertEx('删除成功');
		    					window.location.reload(); 
		    					$("#infodiv").css("display","none");
		    				}else if(data.msg == 'error'){
		    					win.alertEx('系统异常，请联系系统管理员');
		    				}
		    			}
		    		});
			 }else{
				 win.alertEx("已取消");
	         }
		})
	}
	
    //批量删除
    function delAll(){
    	var ids = "";
    	var dataFlid = "";
    	$(".table tbody :checkbox").each(function(){
    		if($(this).prop("checked") == true){
    			dataFlid += $(this).attr("data-flid")+",";
    			ids += $(this).attr("data")+",";
    		}
    	});
    	if(ids.length>0){
    		/* if(confirm('确定要删除选中的记录吗?')){
    			var dt = {ids:ids,flidIds:dataFlid};
   	    		$.ajax({
   	    			url: '../modelManager/dateleAllModelManager',
   	    			type: 'POST',
   	    			data: dt,
   	    			success: function(data){
   	    				if(data.msg == 'ok'){
   	    					alert('删除成功!');
   	    					window.location.reload();
   	    					$("#infodiv").css("display","none");
   	    				}else if(data.msg == 'error'){
   	    					alert('系统异常，请联系系统管理员');
   	    				}
   	    			}
   	    		});
    		}else{
              	alert("已取消");
            } */
    		win.confirm('系统提示', '确定要删除选中的记录吗?', function (r) {
	   			 if(r){
	   	        	var dt = {ids:ids,flidIds:dataFlid};
	   	        	$.ajax({
	   	    			url: '../modelManager/dateleAllModelManager',
	   	    			type: 'POST',
	   	    			data: dt,
	   	    			success: function(data){
	   	    				if(data.msg == 'ok'){
	   	    					win.alertEx('删除成功');
	   	    					window.location.reload();
	   	    					$("#infodiv").css("display","none");
	   	    				}else if(data.msg == 'error'){
	   	    					win.alertEx('系统异常，请联系系统管理员');
	   	    				}
	   	    			}
	   	    		});
	   			 }else{
	   				win.alertEx("已取消");
   		        }
	   		})
    	}else{
    		win.alertEx("请勾选需要删除的配置");
    	}
    }
    //再统计
    function editUserConfig(date,tableType){
    
    	/* if(confirm('确定要对此条记录再统计吗?')){
    		var dt = {date:date,tableType:tableType};
    		$.ajax({
    			url: '../modelManager/upModelManager',
    			type: 'POST',
    			data: dt,
    			success: function(result){
    				var data=eval("("+result+")");
    				if(data.msg == 'ok'){
    					alert("操作成功");
    					window.location.reload(); 
    					$("#infodiv").css("display","none");
    				}else if(data.msg == 'error'){
    					alert('系统异常，请联系系统管理员');
    				}
    			}
    		});
    	}else{
          	alert("已取消");
        } */
    	 
    	win.confirm('系统提示', '确定要对此条记录再统计吗?', function (r) {
			 if(r){
	        	var dt = {date:date,tableType:tableType};
	    		$.ajax({
	    			url: '../modelManager/upModelManager',
	    			type: 'POST',
	    			data: dt,
	    			success: function(result){
	    				var data=eval("("+result+")");
	    				if(data.msg == 'ok'){
	    					win.alertEx("操作成功");
	    					window.location.reload(); 
	    					$("#infodiv").css("display","none");
	    				}else if(data.msg == 'error'){
	    					win.alertEx('系统异常，请联系系统管理员');
	    				}
	    			}
	    		});
			 }else{
				 win.alertEx("已取消");
	         }
		})    
    }
    
    //批量再统计
    function delStatics(){
    	var ids = "";
    	var dataFlid = "";
    	$(".table tbody :checkbox").each(function(){
    		if($(this).prop("checked") == true){
    			dataFlid += $(this).attr("data-flid")+",";
    			ids += $(this).attr("data")+",";
    		}
    	});
    	if(ids.length>0){
    		/* if(confirm('确定要对选中记录再统计吗?')){
    			var dt = {ids:ids,flidIds:dataFlid};
   	    		$.ajax({
   	    			url: '../modelManager/upAllModelManager',
   	    			type: 'POST',
   	    			data: dt,
   	    			success: function(data){
   	    				if(data.msg == 'ok'){
   							alert('系统提示', '操作成功');
  	    					window.location.reload(); 
   	    					$("#infodiv").css("display","none");
   	    				}else if(data.msg == 'error'){
   	    					alert('系统异常，请联系系统管理员');
   	    				}
   	    			}
   	    		});
    		}else{
              	alert("已取消");
            } */
    		win.confirm('系统提示', '确定要对选中记录再统计吗?', function (r) {
	   			 if(r){
	   	        	var dt = {ids:ids,flidIds:dataFlid};
	   	        	$.ajax({
	   	    			url: '../modelManager/upAllModelManager',
	   	    			type: 'POST',
	   	    			data: dt,
	   	    			success: function(data){
	   	    				if(data.msg == 'ok'){
	   	    					win.alertEx('系统提示', '操作成功');
	  	    					window.location.reload(); 
	   	    					$("#infodiv").css("display","none");
	   	    				}else if(data.msg == 'error'){
	   	    					win.alertEx('系统异常，请联系系统管理员');
	   	    				}
	   	    			}
	   	    		});
	   			 }else{
	   				win.alertEx("已取消");
			     }
   			})
    	}else{
    		win.alertEx("请勾选需要删除的配置");
    	}
    }
  	//鼠标移入时显示信息
	$(".hoverImg").hover(function () {
	    $(this).next().show();
	}, function () {
		$(this).next().hide();
	});
	(function() {
		var inboxHeight = $("#inBox").width()
		console.log(inboxHeight)
		$('#inBox .boxTab').css('width',inboxHeight * 0.16 + 'px')
		$('#scrollInBox').css('width' ,inboxHeight / 6 * 7.5 + 'px')
	})()
</script>
</html>