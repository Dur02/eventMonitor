<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图谱库分析-人物分析</title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/style.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath%>/static/lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/perfect-scrollbar.css" />
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
<style>
	.index_bottom {
		background: url(<%=basePath %>/static/images/beij.png) no-repeat;
		background-size: 100%;
		position: relative;			
	}
	.show {
		position: relative;	
	}
	.left_top {
		width: 31.6%;
		height: 215px;
		border: 1px solid #4c5367;
		position: absolute;
		left: 1%;
		top: 18.4px;
		/* background: #1d2235;
		opacity: 0.8; */
		background-color: rgba(29,34,53,0.7);
	}
	
	 .left_bottom_min {
		width: 31.6%;
		height: 65.5%;
		border: 1px solid #4c5367;
		position: absolute;
		left: 1%;
		top: 250.4px;
		background-color: rgba(29,34,53,0.7);
	}
	.left_bottom_max {
		z-index: 99999;
	    width: 90%;
	    height: 733px;
	    position: absolute;
	    left: 4%;
	    top: 61.4px;
	    background-color: rgba(29,34,53,1);
        border-radius: 10px;
        border: 1px solid #1c80b9;
	}
	.right_top {
		width: 65.3%;
	    height: 385px;
	    border: 1px solid #4c5367;
	    position: absolute;
	    right: 1%;
	    top: 18.4px;
	    background-color: rgba(29,34,53,0.7);
	}
	.right_bottom {
		width: 65.3%;
	    height: 385px;
	    border: 1px solid #4c5367;
	    position: absolute;
	    right: 1%;
	    bottom: 33.4px;
	   background-color: rgba(29,34,53,0.7);
	}
	.left_top1 {
		width: 39%;
		height: 30px;
		position: absolute;
		left: 30%;
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
	    right: 50%;
	    top: 65px;
	    padding: 18px;
        text-align: center;
	}
	.left_top3 {
		/* width: 148px;
		height: 100px;
		position: absolute;
		left: 58%;
		top: 65px;
		padding: 18px; */
	    height: 100px;
	    position: absolute;
	    left: 47%;
	    top: 65px;
	    padding: 18px;
	    text-align: center;
	}
	.span {
		color: white;
	}
	.span_0 {
		position: absolute;
		left: 36%;
		top: 5px;
		color: white;
		font-size: 14px;
		font-family: SimSun;
		font-weight: bold;
	}
	.span_1 {
		color: #01b9d5;
		font-size: 35px;
	}
	.span_2 {
		color: #dea200;
		font-size: 35px;
	}
	.span_3_min {
		position: absolute;
		left: 40%;
		top: 5px;
		color: white;
		font-size: 14px;
		font-family: SimSun;
		font-weight: bold;
	}
	.span_3_max {
	    position: absolute;
	    left: 14%;
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
	.left_bottom1_min {
		width: 39%;
		height: 30px;
		position: absolute;
		left: 30%;
		background: url(<%=basePath %>/static/images/bg_duan.png) no-repeat;
	}
	
	.left_bottom1_max{
		width: 39%;
	    height: 30px;
	    position: absolute;
	    left: 44%;
	    background: url(/monitorsystem/static/images/bg_duan.png) no-repeat;
	}
	
	.left_bottom2_min {
	    height: 496px;
	    margin: 2% 0 0 0%;
	    overflow: hidden;
	}
	/* 关系图-筛选条件 */
	.relation_query{
		text-align: center;
	    color: white;
	    font-size: 14px;
	}
	
	.relation_input{
		text-align: center;
	    width: 75px;
	    padding: 0px 8px;
	    height: 20px;
	    line-height: 20px;
	    background: url(../images/inp_bg.png) repeat-x;
	    border: 1px solid #49567a;
	    border-radius: 1px;
	    color: #fff;
	}
	
	.left_bottom2_max {
	    height: 650px;
	    margin: 3% 0 0 0%;
	    overflow: hidden;
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
		width: 103px;
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
	    height: 85%;
	    position: absolute;
	    top: 15%;
	    /* border: 1px solid pink; */
	}
	.right_bottom1 {
		width: 21%;
		height: 31px;
		background: url(<%=basePath %>/static/images/bg_chang.png) no-repeat;
		position: absolute;
		left: 40%;
	}
	.span_7 {
		position: absolute;
		left: 36.8%;
		top: 5px;
		color: white;
		font-size: 14px;
		font-family: SimSun;
		font-weight: bold;
	}
	.right_bottom2 {
		width: 100%;
	    height: 88%;
	    position: absolute;
	    top: 9%;
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
	.outBoxAnalysis {
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
	.out_3_analysis {
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
	.out_4_analysis {
		width: 1.6%;
		cursor: pointer;
	    height: 5%;
		position: absolute;
		right: 0.5%;
    	top: 2%;
    	background: url(<%=basePath %>/static/images/bg_guanbi.png) no-repeat;		
	}
	.out_5 {
	    width: 15%;
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
		.pull_down_analysis {
        	position: absolute;
        	width: 25.0%;
        	height: 5%;
        	left: 1%;
        	top: 4.5%;
        	border: 1px solid #1f5175;
        	border-radiud: 3px;	
        }
		
         ul{
            list-style: none;           
        }                  
        .li_1 {
            background: #122D51;
            position: relative;
            width: 100%;
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
        .li_1_analysis {
            background: #122D51;
            position: relative;
            width: 100%;
            height: 23px;
            cursor: pointer;
            color: #d0cbcb;
            padding-left: 10px;
            line-height: 1;
            padding-top: 6px
        }
        .li_1_analysis a {
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
         .drop-down_analysis{
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
            width: 100%;          
            display: none;
            z-index: 10;
            
            /*position: absolute;*/
        }    
        .drop-down-content_analysis{
        	position: absolute;
        	top:23px;
        	height: 100px;
            padding: 0;
            width: 100%;          
            display: none;
            z-index: 10;
            
            /*position: absolute;*/
        }                
        .triangle_1 {
            background-color: #00aeff;
            position: absolute;
            float:right;
    		top: -19px;
            width: 14px;
            height: 14px;
            cursor: pointer;
        }
        .triangle_1_analysis {
            background-color: #00aeff;
            position: absolute;
            float:right;
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
        .title_T_analysis {
        	margin-left: 10px;
       	    color: #dad3d3;
		    height: 10px;
		    line-height: 20px;
        }
        .drop-down-content li:hover {
            background-color: #00aeff;
        }
        .drop-down-content_analysis li:hover {
            background-color: #00aeff;
        }
        
        .out_1 {
			width: 40%;
			height: 32px;
			position: absolute;
			left: 43%;
			background: url(<%=basePath %>/static/images/bg_title.png) no-repeat;
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
		/*去扩大*/
		.toMax{
		    float: right;
		    margin-right: 19px;
		    margin-top: 10px;
		    cursor: pointer;
			width: 22px;
			height: 22px;
			background: url(<%=basePath %>/static/images/toMax.png) no-repeat;		
		}
		/*去缩小*/
		.toMin{
		    float: right;
		    margin-right: 19px;
		    margin-top: 10px;
		    cursor: pointer;
			width: 22px;
			height: 22px;
			background: url(<%=basePath %>/static/images/toMin.png) no-repeat;		
		}
		.gxt_tooltip{
				position: fixed;
				background: #fff;
				border: 1px solid #d0d0d0;
				box-shadow: 0 0 1px #fff;
				padding: 10px;
				border-radius: 3px;
				z-index: 99998999999;
				display: none;
				font-size: 24px;
		}
		/*关联图线上的字体*/
		textPath {
			font-size: 30px!important;
		}
		/*关联图节点的的字体*/
		.nodetext{
			font-size:30px!important;
		}
		/* circle{
			display: none!important;
		} */
		
		.detail_analysis {
		    width: 90px;
		    height: 30px;
		    border: 1px solid #1069be;
		    position: absolute;
		    right: 3%;
		    top: 10px;
		    background-color: #0c306d;
		    padding: 5px 0 0 8px;
		    cursor: pointer
		}
		.detail_analysis_span {
		    color: #02e5e4;
		    position: absolute;
		    left: 32px;
		    top: 6px;
		}
</style>
</head>
<body>
	<!-- 关联图鼠标移入节点的div -->
	<div class="gxt_tooltip"></div>
	<div class="index_top clearfix">
		<h3 class="fl title">图谱库分析 >人物分析</h3>
		<input type="hidden" id="moduleCode" value="${moduleCode}">
	</div>
	<div class="index_bottom">
		<!-- 显示图 -->
		<div class="zeZhao"></div>
		<div class="data show" >
			<div class="outBox">
				<div class="out_1">
					<span class="span_8">时间线分析</span>
				</div>
				<!--  下拉框 <div class="out_2">  out_2盒子去掉了  css代码 和 juery代码  都有注释  你看下 -->
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
						<!--  <select id="selectBox">
						    <option value="中国">国家：中国 事件数：17250 稳定总值：4333.5 平均情感值：2.3 </option>
						    <option value="日本">国家：日本 事件数：17250 稳定总值：4333.5 平均情感值：2.3 </option>
						    <option value="美国">国家：美国 事件数：17250 稳定总值：4333.5 平均情感值：2.3 </option>
						 </select> -->
					</div>
				<!-- </div> -->
				<div class="out_3" id="orgTimeLineChart"></div>
				<div class="out_4"></div>
				<div class="out_5">
					<div class="time">
						<span>时间粒度：</span>
						<span class="circle" val="3"></span><span>年</span><span class="circle" val="2"></span><span>月</span><span class="circle" val="4" id="weekCondtion"></span><span>周</span><span class="circle circleon" val="1" id="dayCondtion"></span><span>日</span>
					</div>
				</div>
			</div>
			<div class="outBoxAnalysis">
				<div class="out_1">
					<span class="span_8">分析详情</span>
				</div>
				<div class="pull_down_analysis">
					<ul class="nav">  
					    <li class="drop-down">		
					       <span class="title_T_analysis"></span>			                
					          <li class="triangle_1">
					             <span class="triangle_2"></span>
					          </li>
						<ul style="height:200px;overflow:auto" class="drop-down-content_analysis">
						</ul>
					    </li>    
					</ul>
				</div>
				<div class="out_3_analysis" id="orgTimeLineChart_analysis"></div>
				<div class="out_4_analysis"></div>
			</div>
			
	        <div class="left_top">
	        	<div class="left_top1">
	        		<span class="span_0">总体概况</span>
	        	</div>
	        	<div class="left_top2">
	        		<div class="left_top21">
	        			<span class="span span_1" id="geci"></span>
	        			<span class="span">个次</span>
	        		</div>
	        		<div class="left_top22 span">
	        			人物(权重)
	        		</div>
	        	</div>
	        	<div class="left_top3">
	        		<div class="left_top21">
	        			<span class="span span_2" id="quchong"></span>
	        			<span class="span">个</span>
	        		</div>
	        		<div class="left_top22 span">
	        			人物(去重)
	        		</div>
	        	</div>
	        	<div class="left_top4"></div>
	        </div>
	        <div class="left_bottom left_bottom_min">
	        	<div class="left_bottom1 left_bottom1_min"><span class="span_3 span_3_min">关系图</span></div>
	        	<div id="toMaxMin" class="toMax"></div>
	        	<div class="left_bottom2 left_bottom2_min" id="relationshipChart"><span></span></div> 
	        	<div class="relation_query">
	        	最小关系数：<input class="relation_input" type="text" id="minRelationNum"/>
	        	&nbsp;&nbsp;&nbsp;&nbsp;
	        	最大关系数：<input  class="relation_input" type="text" id="maxRelationNum"/>
	        	<input class="filterBtn" type="button" style="margin-left: 18px; width: 44px; height: 22px;line-height: 22px;text-align: center; background: #177be2;" value="筛选"/>
	        	</div>    	
	        </div>
	        <div class="right_top">
	        	<div class="right_top1">
	        		<span class="span_4">人物统计</span>
	        	</div>
	        	<div class="right_top2">
	        		<span class="span_5"></span>
	        		<span class="span_6">时间线分析</span>
	        	</div>
	        	<div class="right_top3" id="orgStaChart"></div>
	        </div>
	        <div class="right_bottom">
	        	<div class="right_bottom1">
	        		<span class="span_7">人物分析</span>
	        	</div>
	        	<div class="detail_analysis">
	        		<span class="span_5"></span>
	        		<span class="detail_analysis_span">详情分析</span>
	        	</div>
	        	<div class="right_bottom2" id="timeOrgChart"></div>
	        </div>
	   	</div>
		<!-- 页面底部收缩 -->
		<jsp:include page="graph_tab2.jsp"></jsp:include>
		<!-- 页面底部收缩结束 -->
	</div>
	<jsp:include page="../updateUserPassword.jsp"/>
</body>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/jquery-1.11.1.min.js"></script>
<script src="<%=basePath%>/static/lib/jquery.pagination.js"></script>
<script src="<%=basePath%>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath%>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath%>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath%>/static/js/perfect-scrollbar.js"></script>
<script src="<%=basePath%>/static/js/sec2.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/base.js"></script>
<script src="<%=basePath%>/static/js/config/config.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/echarts.js"></script>
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
<!-- 多选框样式以及js -->
<link rel="stylesheet" href="<%=basePath %>/static/css/hsCheckData.css"/>
<script type="text/javascript" src="<%=basePath%>/static/js/hsCheckData.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/customUtils.js"></script>
<!-- d3关联图 -->
<script type="text/javascript" src="<%=basePath%>/static/js/d3_relation/d3.v3.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/d3_relation/customRelation.js"></script>
<script type="text/javascript">
	$(function(){
		//处理配置
		handleConfigs();
		//控制Tone字段的显示问题
		gkgToneIsShow();
	});
	//加载 配置对应的结果数据
	function render(configId){
	   startLoad();
		var resultcode = 'ALL';
		$.ajax({
			url:'<%=basePath%>/search/graph_person_timeline_viz/'+configId,
			type: 'POST',
			dataType:"json",
			success:function(data){
				if(data=="-1"){
					endLoad();
					win.alertEx("加载失败");
				}
				//将结果数据进行渲染展示
				renderData(data);
				endLoad();
				//左侧菜单栏 扩大缩小后重新渲染图表
				window.onresize=function (){
					renderData(data);
		        }
			},
			error:function(obj){
				win.alertEx("加载数据失败");
				endLoad();
			}
		});
	}
	//定义全局变量
	var key;
	var timeType;
	//将结果数据（配置结果数据、即时查询结果数据）进行渲染展示
	function renderData(data){
		
		$(".dayCondtion1").click();
		//关闭弹出框
		$('.out_4').click();
		//将扩大后的关系图，关闭
		toMin();
		
		//将关系图的div清空
		$("#relationshipChart").empty();
		
		//人物关系数据
		//var relationData = [{"key1":"孟晚舟","key2":"特懒不","value":2},{"key1":"孟晚舟","key2":"华为","value":2222},{"key1":"孟晚舟","key2":"任正飞","value":2222}];
		var relationData = data.relationData;
		//人物统计数据
		//var organStatisData = [{"key":"孟晚舟","value":66666},{"key":"华为","value":2222},{"key":"任正飞","value":2222},{"key":"特懒不","value":2222}];
		var organStatisData = data.organStatisData;
		//人物时间线数据
		/* var organTimeLineData = {
								"孟晚舟":[{"date":"20180102","value":2222},{"date":"20180103","value":22},{"date":"20180104","value":222}],
								"华为":[{"date":"20180102","value":1111},{"date":"20180103","value":11},{"date":"20180104","value":111}],
								"任正飞":[{"date":"20180102","value":333},{"date":"20180103","value":3333},{"date":"20180104","value":22233}]
								} */
		organTimeLineData = data.organTimeLineData;
		//人物分析数据
		//var orgAnalyDataTimeData = [{"date":20180101,"orgCount":222,"orgValue":111111},{"date":20180102,"orgCount":111,"orgValue":111111},{"date":20180103,"orgCount":11,"orgValue":1111}];
		var orgAnalyDataTimeData = data.orgAnalyDataTimeData;
		//人物分析中人物个数、权重值Top3对应的详细值
		/* var orgAnalyDetils = {
							"20180102":[{"key":"人物1","value":222},{"key":"人物2","value":22},{"key":"人物3","value":223}],
							"20180103":[{"key":"人物1","value":222},{"key":"人物2","value":22},{"key":"人物3","value":223}]
							}; */
		var orgAnalyDetils = data.orgAnalyDetils;		
		//top3 人物个数、权重值 6个点：
		//var orgCountTop3 = [{"date":20180101,"value":222},{"date":20180102,"value":111},{"date":20180103,"value":11}];
		var orgCountTop3 = data.orgCountTop3;
		//var orgValueTop3 = [{"date":20180101,"value":111},{"date":20180102,"value":111},{"date":20180103,"value":11}];
		var orgValueTop3 = data.orgValueTop3;
		//关系节点
		var orgRelationData = data.orgRelationData;
		
		
		//无关系时提示
		if(orgRelationData.length == 0 || orgRelationData.length == 0){
			$("#relationshipChart").html('<span style="font-size: 14px; color: #c1bdbd; margin-left: 45%;">无数据<span>');
		}
		
		//渲染总体概况
		$("#geci").text(numAddUnit(data.allStatisNum));
		$("#quchong").text(numAddUnit(data.allOrgNum));
		
		//渲染echarts关系图已停用
		//initRelationshipChart(relationData,organStatisData);
		//将节点数组封装成nodeData;
		var nodeData ={};
		//var organStatisData = [{"key":"united states","value":7399},{"key":"associated press","value":4245},{"key":"twitter","value":4023}]
		for(var i = 0;i<orgRelationData.length;i++){
			var key = orgRelationData[i].key;
			var value = orgRelationData[i].value;
			nodeData[key] = value;
		}
			
		// 请求数据，绘制图表
		/* var relationData = [{
			"key1": "foreign affairs",
			"key2": "sustainable development technology canada",
			"value": 5
		}, {
			"key1": "pte ltd",
			"key2": "saudi international",
			"value": 2
		}];  */
		//调用关系图的方法
		//连接线值的最大最小值
	    var maxLinkValue = 0;
	    var minLinkValue = 1000;
	    //节点集合
		var nodes = [];
	    for(var i = 0,j = relationData.length; i < j; i ++) {
	        var item = relationData[i];
	        if(nodes.indexOf(item.key1) == -1) {
	            nodes.push(item.key1);
	        }
	        if(nodes.indexOf(item.key2) == -1) {
	            nodes.push(item.key2);
	        }
			//计算关系数的最大值和最小值
	        if(item.value > maxLinkValue) {
	            maxLinkValue = item.value;
	        }
			if( item.value <= minLinkValue){
            	minLinkValue =  item.value;
	        }
	    }
	    if(relationData.length == 0){
	    	minLinkValue = 0;
	    }
		//将关系数的最大值和最小值赋给页面
		$("#minRelationNum").val(minLinkValue);
		$("#maxRelationNum").val(maxLinkValue);
		initRelation(nodeData,relationData,'relationshipChart',0.1,0.5,0.5,nodes,maxLinkValue,minLinkValue);  
		
		//渲染人物统计图
		initOrganizeStatistics(organStatisData);
		//渲染下拉框数据
		$(".drop-down-content").empty();
		var num = organStatisData.length > 10 ? 10 :organStatisData.length;
		for(var i=0;i<num;i++){
			$('.drop-down-content').append(' <li value="'+organStatisData[i].key+'" class="li_1 li">人物：'+organStatisData[i].key+'    人物（权重）：'+organStatisData[i].value+'</li>');
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
			//渲染人物时间线图
			key =  $(this).attr("value");
			initOrgTimeLineChart(organTimeLineData[key],1);
			
    	});
		//时间粒度切换
		$('.circle').on('click',function(){
			$(this).addClass('circleon').siblings('.circle').removeClass('circleon');
			//将timeType的值付给全局变量
			timeType = $(this).attr("val");
			//渲染数据
			initOrgTimeLineChart(organTimeLineData[key],timeType);
				
		});
		
		//详情下拉框
		$(".drop-down-content_analysis").empty();
		for(var i = 0,j = orgValueTop3.length;i < j;i++){
			$('.drop-down-content_analysis').append(' <li  data-date="'+orgValueTop3[i].date+'" data-type="value" class="li_1_analysis li">人物（权重）：'+orgValueTop3[i].value +'&nbsp;&nbsp;&nbsp;    时间：'+orgValueTop3[i].date+'</li>');
		}
		for(var i = 0,j = orgCountTop3.length;i < j;i++){
			$('.drop-down-content_analysis').append(' <li data-date="'+orgCountTop3[i].date+'" data-type="count" class="li_1_analysis li">人物（去重）：'+orgCountTop3[i].value +'&nbsp;&nbsp;&nbsp;    时间：'+orgCountTop3[i].date+'</li>');
		}
		//下拉框点击
		$(".li_1_analysis").on('click',function(){
			$(".title_T_analysis").text($(this).text());
			setTimeout(function() {
				$('.drop-down-content_analysis').css("display","none");
	         }, 10);			
			//渲染人物时间线图
			var dataDate =  $(this).attr("data-date");
			var dataType = $(this).attr("data-type");
			if(dataType == "count") {
				initOrgTimeLineChartAnalysis(orgAnalyDetils[dataDate]);
			} else {
				initOrgTimeLineChartAnalysis(orgAnalyDetils[dataDate]);
			}
    	});
		
		//渲染人物分析
		initTimeOrgChart(orgAnalyDataTimeData,orgCountTop3,orgValueTop3,orgAnalyDetils);
	} 
	
	//扩大缩小的关闭
	$("#toMaxMin").click(function(){
		if($(this).hasClass("toMax")){
			$('.zeZhao').css('display','block');
			$(".left_bottom").removeClass("left_bottom_min");
			$(".left_bottom").addClass("left_bottom_max");
			$(".left_bottom1").removeClass("left_bottom1_min");
			$(".left_bottom1").addClass("left_bottom1_max");
			$(".left_bottom2").removeClass("left_bottom2_min");
			$(".left_bottom2").addClass("left_bottom2_max");
			$(".span_3").removeClass("span_3_min");
			$(".span_3").addClass("span_3_max");
			//将关联图的svg设置为扩大后的宽高
			$("svg").height($(".left_bottom2").height());
			$("svg").width($(".left_bottom2").width());
			$("rect").height($(".left_bottom2").height());
			$("rect").width($(".left_bottom2").width());
			//切换扩大缩小的图标
			$("#toMaxMin").removeClass("toMax");
			$("#toMaxMin").addClass("toMin");
		}else{
			toMin();
		}
	})
	
	//将关系图缩小的方法
	function toMin(){
		$('.zeZhao').css('display','none');
		$(".left_bottom").removeClass("left_bottom_max");
		$(".left_bottom").addClass("left_bottom_min");
		$(".left_bottom1").removeClass("left_bottom1_max");
		$(".left_bottom1").addClass("left_bottom1_min");
		$(".left_bottom2").removeClass("left_bottom2_max");
		$(".left_bottom2").addClass("left_bottom2_min");
		//将关联图的svg设置为扩大后的宽高
		$(".span_3").removeClass("span_3_max");
		$(".span_3").addClass("span_3_min");
		$("rect").height($(".left_bottom2").height());
		$("rect").width($(".left_bottom2").width());
		//切换扩大缩小的图标
		$("#toMaxMin").removeClass("toMin");
		$("#toMaxMin").addClass("toMax");
		$(".container").attr("transform","translate(272,261)scale(0.1)");
	}
	
	$('.right_top2').click(function(){
		$('.outBox').css('display','block');
		$('.zeZhao').css('display','block')
		//点击时间线时，第一个li点击
		$(".li_1").first().click();
		
	});
	$('.out_4').click(function(){
		$('.outBox').css('display','none');
		$('.zeZhao').css('display','none');
	})
	
	$('.detail_analysis').click(function(){
		$('.outBoxAnalysis').css('display','block');
		$('.zeZhao').css('display','block')
		//点击时间线时，第一个li点击
		$(".li_1_analysis").first().click();
		
	});
	$('.out_4_analysis').click(function(){
		$('.outBoxAnalysis').css('display','none');
		$('.zeZhao').css('display','none');
	})
	
	
	
	////时间线数据力度切换方法
	function packDataType(len,dateArray,valueArray,data){
		 var date_new={};
         for(var i=0;i<data.length;i++){
         	//截取日期到月
         	var key=data[i].date;
         	var dateValue=key.substring(0,len);
         	if(len==2){
         		dateValue = getWeekNum(key+"");
         	}
         	if(date_new[dateValue]!=undefined){
         		var nnn = date_new[dateValue];
         		date_new[dateValue] = nnn + data[i].value;
         	}else{
            	date_new[dateValue] = data[i].value;
         	}
         }
         for(var obj in date_new){
        	 dateArray.push(obj);
        	 valueArray.push(date_new[obj].toFixed(3));
		 }
	}
	
	//渲染 人物时间线图
	function initOrgTimeLineChart(data,timeType){
		var dateArray = [];
		var valueArray = [];
		if(timeType == 1){
			for(var i=0;i<data.length;i++){
				dateArray.push(data[i].date);
				valueArray.push(data[i].value);
			}
		}else{
    		if(timeType == 2){//月
    			packDataType(6,dateArray,valueArray,data);
    		}else if(timeType == 3){//年
    			packDataType(4,dateArray,valueArray,data);
    		}else if(timeType == 4){//周
    			packDataType(2,dateArray,valueArray,data);
    		}
		}
		
		option = {
				backgroundColor: '#1b233482',
		        tooltip: {
		            trigger: 'axis',
		            formatter: "{b} : {c}",
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
		        grid:{
					left:80,
					right:80
				},
				xAxis: {
					
					boundaryGap: false,
					axisLine: { //坐标轴轴线相关设置。数学上的x轴
						 show: true,
						 lineStyle: {
							 color: '#606985',
							 width:3
						 },
					 },
					 
					 axisLabel: { //坐标轴刻度标签的相关设置
						 textStyle: {
							 color: 'white',
						 },
					 },
					data: dateArray,
				},
				yAxis: [{
					type: 'value',
					splitLine: {
						 show: true,
						 lineStyle: {
							 color: '#233e64',
							 width:2
						 }
					 },
					 axisLine: {
					     show: true,
					     lineStyle: {
							 color: '#606985',
							 width:3
						 },
					 },
					 axisLabel: {
					 	 margin:20,
						 textStyle: {
							 color: 'white',
							 
						 },
					 }
					
				}],
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
				series: [{
					name: '',
					type: 'line',
					smooth: true, //是否平滑曲线显示
					symbolSize:1,//曲线图上显示点
					lineStyle: {
						normal: {
							color: "#3deaff"   // 线条颜色
						}
					},
					areaStyle: {
		                normal: {
		                 //线性渐变，前4个参数分别是x0,y0,x2,y2(范围0~1);相当于图形包围盒中的百分比。如果最后一个参数是‘true’，则该四个值是绝对像素位置。
		                   color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
							   { offset: 0,  color: 'rgba(61,234,255, 0.9)'}, 
							   { offset: 0.7,  color: 'rgba(61,234,255, 0)'}
						   ], false),

		                 shadowColor: 'rgba(53,142,215, 0.9)', //阴影颜色
		                 shadowBlur: 20 //shadowBlur设图形阴影的模糊大小。配合shadowColor,shadowOffsetX/Y, 设置图形的阴影效果。
		             }
		         },
					data: valueArray
				}]
		};
		
		echarts.init(document.getElementById('orgTimeLineChart')).setOption(option);
	}
	//渲染 人物详情分析图
	function initOrgTimeLineChartAnalysis(data){		
		var orgArray = [];
		var valueArray = [];
		for(var i in data){
			orgArray.push(data[i].key);
			valueArray.push(data[i].value);
		}
		
		option = {
			    color:['#3398db'],
				tooltip:{
					formater:"{b}"
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
				grid:{
					left:80,
					right:80,
				},
				dataZoom: [
			          {
			              start: 0,
			              end:5
			          },
			          {
			              type: 'slider',
			            textStyle:{
			        		color:"#fff"
			        	}
			              
			          }
			      ],
				xAxis: {
			        type: 'category',
			        data: orgArray,
			        axisLine:{
			            lineStyle:{
			                 color: '#606985', //坐标轴线线的颜色，
			                 width:2
			            }
			            
			        }, axisLabel: {
			            margin: 10,
			            textStyle: {
			                color:'white',
			                fontSize: 14
			            }
			        },
			        splitLine: {
			            show:false
			        }
			    },
			    yAxis: {
			    	name:'',
			    	nameTextStyle: {
						            color: '#fff',
						            fontSize: 16
						        },
			        type: 'value',
			        axisLine:{
			            lineStyle:{
			                 color: '#606985', //坐标轴线线的颜色，
			                 width:2
			            }
			            
			        }, axisLabel: {
			            margin: 10,
			            textStyle: {
			                color:'white',
			                fontSize: 14
			            }
			        },splitLine: {
			            show:false
			        }
			    },
			    series: [{
			    	name:'数量',
			        data: valueArray,
			        type: 'bar',
			        barWidth:'30'
			    }],
			    label: {
			      normal: {
			          show: true,
			          position: 'top',
			          textStyle: {
			            color: '#fff'
			          }
			      }
			   }
			};	
		echarts.init(document.getElementById('orgTimeLineChart_analysis')).setOption(option);
	}
	//渲染 时间人物分析图
	//人物分析数据、人物个数Top3的集合、人物个人物（权重）Top3的集合、人物详情信息集合
    function initTimeOrgChart(orgAnalyDataTimeData,orgCountTop3,orgValueTop3,orgAnalyDetils){
		
		var dateArray = [];
		var orgCountArray = [];
		var orgValueArray = [];
		for(var i=0;i<orgAnalyDataTimeData.length;i++){
			dateArray.push(orgAnalyDataTimeData[i].date);
			orgCountArray.push(orgAnalyDataTimeData[i].orgCount);
			orgValueArray.push(orgAnalyDataTimeData[i].orgValue);
		}
		
		
		
		var orgCountPointArray = [];
		for(var i in orgCountTop3){
			orgCountPointArray.push({coord:[orgCountTop3[i].date,orgCountTop3[i].value]});
		}
		var orgValuePointArray = [];
		for(var i in orgValueTop3){
			orgValuePointArray.push({coord:[orgValueTop3[i].date,orgValueTop3[i].value]});
		} 
		
		//var orgCountPointArray = [{coord:['20180201','220']}, {coord:['20180202','182']} ];
		//var orgValuePointArray = [{coord:['20180201','111']}, {coord:['20180202','222']} ];
		
		option = {
			    tooltip: {
			        trigger: 'axis',
			        enterable: true,
			        formatter: function(params) {
			        	return '';
			        	<%-- var tooltipHtml = '';
			        	var date = params[0].name;
			        	if(params.length >1){
			        		if(orgAnalyDetils[date] != undefined){
					        	 tooltipHtml+='<div style="width: 388px;height: 336px;background: url(<%=basePath %>/static/images/kuang1.png);position: relative;">'
								            +'<div style="position: absolute;left: 27px;top: 11px;">'
								            +'<span style="color: white;">'+date+'</span>'
								            +'</div>'
								            +'<div style="position: absolute;left: 32px;top: 38px;width: 300px;">'
								            +'<span style="display: inline-block;width: 20px;height: 11px;background: #ded011;border-radius: 3px"></span>'
								            +'<span style="color: #11c0dd;margin-left: 5px;">人物（去重）</span>'
								            +'<span style="color: white;float: right">'+params[0].value+'</span>'
								            +'</div>'
								            +'<div style="position: absolute;left: 31px;top: 67px;width: 300px;">'
								            +'<span style="display: inline-block;width: 20px;height: 11px;background: #32b7e9;border-radius: 3px"></span>'
								            +'<span style="color: #11c0dd;margin-left: 5px;">人物（权重）</span>'
								            +'<span style="color: white;float: right">'+params[1].value+'</span>'
								            +'</div>'
								            +'<div id="orgDetilChart" style="width: 388px;height: 252px;position: absolute;top: 83px;"></div>'
								            +'</div>';
								  //渲染图表
								  setTimeout(function() {
									  initOrgDetil(orgAnalyDetils[date]);
						          }, 10);
								          
				        	}else{
				        		tooltipHtml+='时间：'+params[0].name+'<br/>人物（去重）：'+params[0].value+'个<br/> 数 量：'+params[1].value+'个次';
				        	}
			        	}else{
			        		if(orgAnalyDetils[date] != undefined){
					        	 tooltipHtml+='<div style="width: 388px;height: 336px;background: url(<%=basePath %>/static/images/kuang1.png);position: relative;">'
								            +'<div style="position: absolute;left: 27px;top: 11px;">'
								            +'<span style="color: white;">'+date+'</span>'
								            +'</div>'
								            +'<div style="position: absolute;left: 32px;top: 38px;width: 300px;">'
								            +'<span style="display: inline-block;width: 20px;height: 11px;background: #ded011;border-radius: 3px"></span>'
								            +'<span style="color: #11c0dd;margin-left: 5px;">'+params[0].seriesName+'</span>'
								            +'<span style="color: white;float: right">'+params[0].value+'</span>'
								            +'</div>'
								            +'<div id="orgDetilChart" style="width: 388px;height: 252px;position: absolute;top: 83px;"></div>'
								            +'</div>';
								  //渲染图表
								  setTimeout(function() {
									  initOrgDetil(orgAnalyDetils[date]);
						          }, 10);
								          
				        	}else{
				        		tooltipHtml+='时间：'+params[0].name+'<br/>人物（去重）：'+params[0].value+'个<br/> 数 量：'+params[0].value+'个次';
				        	}
			        	}
			        	
			        	return tooltipHtml; --%>
			        }
			    },
			    grid:{
					left:80,
					right:80
				},
			    legend: {
			        icon: 'rect',
			        color:['red','yellow'],
			        data: ['人物（去重）', '人物（权重）'],
			        textStyle: {
			            fontSize: 14,
			            color: 'white'
			        }
			       
			    },
			    xAxis: [{
			        type: 'category',
			        boundaryGap: false,
			        axisLine: {
			            lineStyle: {
			                color: '#606985', //坐标轴线线的颜色，
			                width:2
			            }
			        },
			        axisLabel: {
			            margin: 10,
			            textStyle: {
			                color:'white',
			                fontSize: 14
			            }
			        },
			        data: dateArray
			    }],
			    yAxis: [{
			        type: 'value',
			        name: '人物（去重）',
			        nameTextStyle: {
						            color: '#fff',
						            fontSize: 16
						        },
			        axisTick: {
			            show: false
			        },
			        axisLine: {
			            lineStyle: {
			                color: '#606985', //坐标轴线线的颜色，
			                width:2
			            }
			        },
			        axisLabel: {
			            margin: 10,
			            textStyle: {
			                color:'white',
			                fontSize: 14
			            }
			        },
			        splitLine: {
			            show:false
			        }
			    },{
			        type: 'value',
			        name: '人物（权重）',
			        nameTextStyle: {
						            color: '#fff',
						            fontSize: 16
						        },
			        axisTick: {
			            show: false
			        },
			        axisLine: {
			            lineStyle: {
			                color: '#606985', //坐标轴线线的颜色，
			                width:2
			            }
			        },
			        axisLabel: {
			            margin: 10,
			            textStyle: {
			            	color: 'white',
			                fontSize: 14
			            }
			        },
			        splitLine: {
			            show:false
			        }
			    }],
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
			    series: [{
			        name: '人物（去重）',
			        type: 'line',
			        smooth: true,
			        symbol: 'circle',
			        symbolSize: 5,
			        showSymbol: false,
			        markPoint: {
			            label:{
			                    show:true,
			                    formatter:'{c}'
			            }, 
			            data: orgCountPointArray,
			            animationDelay: 3000,
			            animationDuration: 1000
			        },
			        yAxisIndex: 0,
			        lineStyle: {
			            normal: {
			                width: 3
			            }
			        },
			        areaStyle: {
			            normal: {
			                color: new echarts.graphic.LinearGradient(0, 0, 1, 0, [{
			                    offset: 0,
			                    color: 'rgba(230, 216, 26, 0.7)'
			                }, {
			                    offset: 0.8,
			                    color: 'rgba(226, 219, 115, 0.7)'
			                }], false),
			                shadowColor: 'rgba(226, 219, 115, 0.1)',
			                shadowBlur: 10
			            }
			        },
			       itemStyle: {
			                normal: {
			                    color: new echarts.graphic.LinearGradient(0, 0, 1, 0, [{
			                        offset: 0,
			                        color: '#c5a811'
			                    }, {
			                        offset: 1,
			                        color: '#c5a811'
			                    }])
			                },
			                emphasis: {
			                color: 'rgb(0,196,132)',
			                borderColor: 'rgba(0,196,132,0.2)',
			                extraCssText: 'box-shadow: 8px 8px 8px rgba(0, 0, 0, 1);',
			                borderWidth: 10
			            }
			            },
			        data: orgCountArray
			    }, {
			        name: '人物（权重）',
			        type: 'line',
			        smooth: true,
			        symbol: 'circle',
			        symbolSize: 5,
			        showSymbol: false,
			        markPoint: {
			            data: orgValuePointArray,
			            animationDelay: 3000,
			            animationDuration: 1000
			        },
			        yAxisIndex: 1,
			        lineStyle: {
			            normal: {
			                width: 3
			            }
			        },
			        areaStyle: {
			            normal: {
			                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
			                    offset: 0,
			                    color: 'rgba(170,227,255, 0.5)'
			                }, {
			                    offset: 0.8,
			                    color: 'rgba(0,138,204, 0)'
			                }], false),
			                shadowColor: 'rgba(0, 0, 0, 0.1)',
			                shadowBlur: 10
			            },
			        },
			       itemStyle: {
			                normal: {
			                    color: new echarts.graphic.LinearGradient(0, 0, 1, 0, [{
			                        offset: 0,
			                        color: '#32B7E9'
			                    }, {
			                        offset: 1,
			                        color: '#32B7E9'
			                    }])
			                },
			                emphasis: {
			                color: 'rgb(99,250,235)',
			                borderColor: 'rgba(99,250,235,0.2)',
			                extraCssText: 'box-shadow: 8px 8px 8px rgba(0, 0, 0, 1);',
			                borderWidth: 10
			            }
			            },
			        data: orgValueArray
			    }  ]
			};
		echarts.init(document.getElementById('timeOrgChart')).setOption(option);
	}
	
	
	//渲染人物统计图
	function initOrganizeStatistics(data){
		var keyArray = [];
		var valueArray = [];
		for(var i=0;i<data.length;i++){
			keyArray.push(data[i].key);
			valueArray.push(data[i].value);
		}
		
		option = {
				tooltip: {
			        trigger: 'axis',
			        formatter: function(params) {
			            return params[0].name+" : " + params[0].value
			        }
			    },
			    dataZoom: [
			      		        {
		      		        	  start: 0,
			      		           end: 20,
			      		        },
			      		        {
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
			        data: keyArray,
			        axisLine: {
			            lineStyle: {
			                color: '#f9f9f9',
			                width:1
			            }
			        },
			        axisLabel: {
			        	textStyle: {
			                color: "#f9f9f9", //X轴文字颜色
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
			                color: '#f9f9f9',
			                width:1
			            }
			        },
			        axisLabel: {
			        	textStyle: {
			                color: "#f9f9f9", //X轴文字颜色
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
			        data: valueArray
			    }]
			};
		    echarts.init(document.getElementById('orgStaChart')).setOption(option);
	}
	
	//渲染人物分析-鼠标移入时的效果
	function initOrgDetil(data){
		//alert(JSON.stringify(data));
		
		//var orgArray = ['人物1', '人物2','人物3','人物4','人物5','人物6','人物7'];
		//var valueArray = [80, 80, 79, 80, 82, 83, 82];
		var orgArray = [];
		var valueArray = [];
		for(var i in data){
			orgArray.push(data[i].key);
			valueArray.push(data[i].value);
		}
		
		option = {
			    color:['#3398db'],
				tooltip:{
					formater:"{b}"
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
				grid:{
					left:80,
				},
				dataZoom: [
			          {
			              start: 0,
			              end:5
			          },
			          {
			              type: 'slider',
			            textStyle:{
			        		color:"#fff"
			        	}
			              
			          }
			      ],
				xAxis: {
			        type: 'category',
			        data: orgArray,
			        axisLine:{
			            lineStyle:{
			                 color: '#606985', //坐标轴线线的颜色，
			                 width:2
			            }
			            
			        }, axisLabel: {
			            margin: 10,
			            textStyle: {
			                color:'white',
			                fontSize: 14
			            }
			        },
			        splitLine: {
			            show:false
			        }
			    },
			    yAxis: {
			    	name:'',
			    	nameTextStyle: {
						            color: '#fff',
						            fontSize: 16
						        },
			        type: 'value',
			        axisLine:{
			            lineStyle:{
			                 color: '#606985', //坐标轴线线的颜色，
			                 width:2
			            }
			            
			        }, axisLabel: {
			            margin: 10,
			            textStyle: {
			                color:'white',
			                fontSize: 14
			            }
			        },splitLine: {
			            show:false
			        }
			    },
			    series: [{
			        data: valueArray,
			        type: 'bar',
			        barWidth:'30'
			    }],
			    label: {
			      normal: {
			          show: true,
			          position: 'top',
			          textStyle: {
			            color: '#fff'
			          }
			      }
			   }
			};
			echarts.init(document.getElementById('orgDetilChart')).setOption(option);
	}
	
	//渲染关系图   echart关系图，已经停用
	function initRelationshipChart(relationData,organStatisData){
		
		var dataStyleArry = [
		                        {
		                            normal: {
		                                borderColor: '#04f2a7',
		                                borderWidth: 4,
		                                shadowBlur: 10,
		                                shadowColor: '#04f2a7',
		                                color: '#001c43',
		                            }
		                        },{
		                            normal: {
		                                borderColor: '#82dffe',
		                                borderWidth: 4,
		                                shadowBlur: 10,
		                                shadowColor: '#04f2a7',
		                                color: '#001c43',
		                            }
		                        }, {
		                            normal: {
		                                borderColor: '#82dffe',
		                                borderWidth: 4,
		                                shadowBlur: 10,
		                                shadowColor: '#04f2a7',
		                                color: '#001c43',
		                            }
		                        }
		                 ];
		//圈大小的数组(根据最大值和最小值计算对应粗细)
		var minSymbolSize = 20;
		var maxSymbolSize = 100;
		//连接线的样式
		var lineColor = {type: 'linear', x: 0,y: 0, x2: 0,  y2: 1, colorStops: [{offset: 0, color: '#df6f30' }, {offset: 1, color: '#915034' }],globalCoord: false };
		//连接线的粗细(根据最大值和最小值计算对应粗细)
		var minLineWidth = 1;
		var maxLineWidth = 20;
		
		//处理圈数据
		var size = organStatisData.length;
		
		var avgDataStyleIndex = Math.floor(size/4); 
		var symbolData = [];
		var maxOrg;
		var avgSymbolValue;
		if(size>0){
			avgSymbolValue =Math.floor(organStatisData[0].value/100);
		}
		for(var i=0;i<size;i++){
			//计算圈的样式
			if(i>=0 && i<= avgDataStyleIndex){
				styleIndex = 0;
			}else if(i>=avgDataStyleIndex && i<=avgDataStyleIndex*2){
				styleIndex = 1;
			}else if(i>=avgDataStyleIndex*2 && i<= avgDataStyleIndex*3){
				styleIndex = 2;
			}else{
				styleIndex = 3;
			}
			
			//计算圈的大小
			var symbolSize = Math.floor(organStatisData[i].value/avgSymbolValue);
			if(symbolSize < 20){
				symbolSize = 20;
			}
			symbolData.push({"name":organStatisData[i].key,"value":organStatisData[i].value,"symbolSize":symbolSize,"itemStyle":dataStyleArry[styleIndex]});
		}
		
		
		/*
		静态数据
		var symbolData =  [
             {
                 name: '毛发',
                 symbolSize: 100,
                 itemStyle: dataStyleArry[0]
             },
             {
                 name: '刀',
                 symbolSize: 70,
                 itemStyle: dataStyleArry[1],

             },
             {
                 name: '指纹',
                 symbolSize: 70,
                 itemStyle:dataStyleArry[2] ,

             },
             {
                 name: '张三',
                 symbolSize: 70,
                 itemStyle: dataStyleArry[0],

             },
             {
                 name: '李四',
                 symbolSize: 70,
                 itemStyle:dataStyleArry[1] ,

             },
             {
                 name: '张三2',
                 symbolSize: 70,
                 itemStyle: dataStyleArry[2],

             },
             {
                 name: '无名尸',
                 itemStyle:dataStyleArry[0]} ,
             {
                 name: '赖子',
                 itemStyle: dataStyleArry[1],
                 symbolSize: 70,

             },
             {
                 name: '王五',
                 itemStyle: dataStyleArry[2],
                 symbolSize: 70,
             },
             {
                 name: '刘大',
                 itemStyle: dataStyleArry[0],
                 symbolSize: 70,
             }]; */
        //处理关系图数据
        //获取平均值
        var relationDataLength = relationData.length;
        var avgRelationVlue;
        if(relationDataLength>0){
    		var list = new Array();
            for(var i in relationData){
            	list.push(relationData[i].value);
            }
            list.sort(function(num1,num2){
           		 return num1-num2;
            })
            avgRelationVlue = list[relationDataLength-1];
            //avgRelationVlue =Math.ceil(list[relationDataLength-1]/relationDataLength);
        }
        
        //封装数据
        var lineData = [];
        for(var i in relationData){
        	var lineWidth =Math.ceil(20/avgRelationVlue*relationData[i].value);
        	lineData.push({source: relationData[i].key1,target: relationData[i].key2, value: relationData[i].value,label: { normal: { show: false } },lineStyle: { normal: {width:lineWidth,color: lineColor}}});
        }
		/* 静态数据
		var lineData = [
	            		{
	                        source: '毛发',
	                        target: '刀',
	                        value: '100',
	                        lineStyle: {
	                            normal: {
	                                width:1,
	                                color: lineColor
	                            }
	                        }

	                    },
	                    {
	                        source: '毛发',
	                        target: '指纹',
	                        value: '1000',
	                        lineStyle: {
	                            normal: {
	                                color: lineColor
	                            }
	                        },
	                    },
	                    {
	                        source: '毛发',
	                        target: '张三',
	                        value: '522',
	                        lineStyle: {
	                            normal: {
	                                color: lineColor
	                            }
	                        },
	                    },
	                    {
	                        source: '毛发',
	                        target: '李四',
	                        value: '565',
	                        lineStyle: {
	                            normal: {
	                                color: lineColor
	                            }
	                        }
	                    },
	                    {
	                        source: '毛发',
	                        target: '张三'
	                    },
	                    {
	                        source: '刀',
	                        target: '张三2',
	                        value: '898',
	                        lineStyle: {
	                            normal: {
	                                color: lineColor
	                            }
	                        }
	                    },
	                    {
	                        source: '刀',
	                        target: '无名尸',
	                        value: '898',
	                        lineStyle: {
	                            normal: {
	                                color: lineColor
	                            }
	                        }

	                    },
	                    {
	                        source: '李四',
	                        target: '赖子',
	                        value: '897',
	                        lineStyle: {
	                            normal: {
	                                color: lineColor
	                            }
	                        }
	                    },
	                    {
	                        source: '李四',
	                        target: '王五',
	                        value: '985',
	                        lineStyle: {
	                            normal: {
	                                color: lineColor
	                            }
	                        },
	                    },
	                    {
	                        source: '王五',
	                        target: '刘大',
	                        value: '654',
	                        lineStyle: {
	                            normal: {
	                                color: lineColor
	                            }
	                        },
	                    }
	                ]; */
		option = {
		        tooltip: {
		        	 trigger: 'item',
				        formatter: function(params) {
				        	return params.name+" : "+params.value;
				        }
		        },
		        animationDurationUpdate: 1500,
		        animationEasingUpdate: 'quinticInOut',
		        series: [
		            {
		                type: 'graph',
		                layout: 'force',
		               focusNodeAdjacency: true,
		                force:{
		                    repulsion:1000,
		                    edgeLength:50
		                },
		                symbolSize: 50,
		                roam: true,
		                label: {
		                    normal: {
		                        show: false
		                    }
		                },
		                edgeSymbolSize: [4, 10],
		                edgeLabel: {
		                    normal: {
		                        show:true,
		                        textStyle: {
		                            fontSize: 13
		                        },
		                        formatter: "{c}"
		                    }
		                },

		                data: symbolData,
		                links: lineData,
		                lineStyle: {
		                    normal: {
		                        opacity: 0.9,
		                        width: 5,
		                        curveness: 0
		                    }
		                }
		                
		            }
		        ]
		    }
		echarts.init(document.getElementById('relationshipChart')).setOption(option);
	}
	
	//事件分析-下拉框
    let flag = true;  
    $('.pull_down').click(function(){    	  	    	
    	if(flag = !flag){
    		$('.drop-down-content').css("display","block");
    	}else {
    		$('.drop-down-content').css("display","none");
    	}
    })
    
    let flag_analysis = true;
    $('.pull_down_analysis').click(function(){    	  	    	
    	if(flag_analysis = !flag_analysis){
    		$('.drop-down-content_analysis').css("display","block");
    	}else {
    		$('.drop-down-content_analysis').css("display","none");
    	}
    })
    
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
    </script>
</html>