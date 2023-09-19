<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<title>图谱-counts分析 </title>
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
<link rel="stylesheet" href="<%=basePath %>/static/css/event_heat.css"/><!--z专属样式  -->
<link rel="stylesheet" href="<%=basePath %>/static/css/event_heat_one.css"/><!--z专属样式  -->
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
<style type="text/css">
	.dev {
	    padding-left: 11px;
	    padding-right: 29px;
	    height: 32px;
	    position: absolute;
	    border: 1px solid #04c;
	    color: #f5e7e5;
	    background-color: #191717;
	    display: none;
	    padding-top: 7px;
	}
	.detailDev {
	      font-size: 14px;
    }
	.index_bottom {
		background: url(<%=basePath %>/static/images/beij.png) no-repeat;
		background-size: 100%;
		position: relative;			
	}
	.show {
		position: relative;	
	}
	.left_top {
	    width: 22.6%;
	    height: 94%;
	    border: 1px solid #4c5367;
	    position: absolute;
	    left: 1%;
	    top: 10px;
	    background-color: rgba(29,34,53,0.7)
	}
	.right_top {
		width: 74%;
	    height: 303px;
	    position: absolute;
	    right: 1%;
	    top: 14px;
        border: 1px solid #4c5367;
    	border-bottom: 0px;
	}
	.right_bottom {
        width: 74%;
	    height: 460px;
	    border: 1px solid #4c5367;
	    position: absolute;
	    right: 1%;
	    bottom: 43.4px;
	    background-color: rgba(29,34,53,0.7);
	}
	.left_top1 {
	    width: 56%;
	    height: 30px;
	    position: absolute;
	    left: 23%;
	    background: url(/monitorsystem/static/images/bg_duan.png) no-repeat;
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
	.left_top4 {
		width: 1px;
		height: 50px;
		background-color: #4c5367;
		position: absolute;
		left: 49%;
		top: 94px;
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
	.right_top3 {
	    width: 100%;
	    height: 85%;
	    position: absolute;
	    top: 15%;
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
		left: 22.8%;
		top: 5px;
		color: white;
		font-size: 14px;
		font-family: SimSun;
		font-weight: bold;
	}
	.right_bottom2 {
		width: 100%;
	    height: 92%;
	    position: absolute;
	    top: 8%;
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
	.out_44 {
		    width: 24px;
		    cursor: pointer;
		    height: 24px;
		    position: absolute;
		    right: -0.5%;
		    top: 4px;
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
		/*类型分析*/
		.type_chart{
			border: 1px solid red;
		    height: 95%;
		    margin-top: 42px;
		}
		/*地域分布*/
		.box1_inbox{
		    vertical-align: middle;
		    height: 257px;
		    width: 364px;
		    float: left;
		    margin-left: 4%;
		    cursor: pointer;
		}		   
		.box1_inbox_act{
			 background: url(<%=basePath %>/static/images/counts_box1_act.png) no-repeat;
		}
		.box1_inbox_notact{
			 background: url(<%=basePath %>/static/images/counts_box1_notact.png) no-repeat;
		}
		
		.box_tab1{
            margin-top: 14px;
		    height: 122px;
		    width: 40px;
		    height: 40px;
		    margin-left: 36.5%;
		    float: left;
		}
		
		.box_tab1_ctry{
			 background: url(/monitorsystem/static/images/counts_ctry.png) no-repeat;
		}
		.box_tab1_state{
			 background: url(/monitorsystem/static/images/counts_state.png) no-repeat;
		}
		.box_tab1_city{
			 background: url(/monitorsystem/static/images/counts_city.png) no-repeat;
		}
		
		
		.tab_title{
	        float: left;
		    font-size: 26px;
		    color: white;
		    margin-left: 8px;
		    margin-top: 12px;
		}
		
		.data_span{
			font-weight: bold;
		    text-align: center;
		    padding-right: 10px;
		    font-size: 27px;
		    white-space: nowrap;
		    display: inline-block;
		    width: 100%;
		    /* overflow: hidden; */
		    text-overflow: ellipsis;
		}
		.data_div{
		    height: 173px;
		    width: 100%;
		    margin-top: 69px;
		}
		
		.title_span{
		    padding-right: 10px;
			padding-top: 14px;
		    width: 33.3%;
		    height: 171px;
		    text-align: center;
		    font-size: 18px;
    		color: white;
    		float: left;
		}
		.data_span{
			text-align:center;
			padding-right:16px;
		    font-size: 27px;
		    white-space: nowrap;
		    display: inline-block;
		    width: 94%;
		   /*  overflow: hidden; */
		    text-overflow: ellipsis;
		}
		.unit_span{
	        font-size: 10px;
		    color: white;
		    display: block;
		    font-size: 10px;
		    color: white;
		    float: left;
		    float: right;
		    margin-top: -20px;
		}
		.data_span_div{
		    margin-top: 33px;
		}
		/*时间线分析*/
		.right_top2 {
			width: 8%;
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
		.sh_rig_con {
		    height: 100%!impoetant;
		}
		.qq{
	        cursor: pointer;
		    overflow: hidden;
		    white-space: nowrap;
		    text-overflow: ellipsis;
		}
</style>
</head>
<body>
    <!-- 事件描述 -->
    <div class="index_top clearfix">
		<h3 class="fl title" >图谱库分析 > counts分析</h3>
		<input type="hidden" id="moduleCode" value="${moduleCode}">
	</div>
	<div class="index_bottom">
		<!-- 遮罩 -->
		<div class="zeZhao"></div>
		<!-- 显示图 -->
		<div class="data show">
			<!-- 弹出框 -->
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
	        	<div class="sh_rig_con">
						<div class="country_sort">
							<span id="local">类型分析</span><span class="seven"></span>
						</div>
				
					<table class="coun_table1">
						<thead>
							<tr>
								<td>序号</td><td id="county">类型</td>
								<td style="margin-left: -15px;">数量<img style="" value="1" id="paixu" onclick="paixu()" src="../../static/images/dowm.png"/></td>
								<td style="margin-left: -17px;">规模数<img style="" value="1" id="paixuNumber" onclick="paixuNumber()" src="../../static/images/dowm.png"/></td>
								<td>时间线</td>
							</tr>
						</thead>
					</table>
					<div class="over" id="over">
						<table class="coun_table" id="tableData">
							<tbody>
							<!-- 真实数据可参考国家关系 的packTable()方法 -->
							<!-- <tr><td><span class="red_span">1</span></td><td title="斯里兰卡-中国" class="qq">中国</td><td>19.272</td></tr>
							<tr><td><span class="orange_span">2</span></td><td title="斯里兰卡-中国" class="qq">中国</td><td>19.272</td></tr>
							<tr><td><span class="green_span">3</span></td><td title="斯里兰卡-中国" class="qq">中国</td><td>19.272</td></tr>
							<tr><td><span >4</span></td><td title="斯里兰卡-中国" class="qq">中国</td><td>19.272</td></tr> -->
							</tbody>
						</table>
						<div id="dev" class="dev">
						
						     <div class="out_44"></div>
						     <span id="detail" class="detailDev"></span>
						</div>
					</div>
				</div>
	        </div>
	        <div class="right_top">
	        	<div class="right_top1">
	        		<span class="span_4">地域分布</span>
	        	</div>
	        	<div class="right_top3">
	        		<div class="box1_inbox box1_inbox_act" value="1" id="box1_inbox">
	    				<div>
	    					<div class="box_tab1 box_tab1_ctry"></div>
	    					<div class="tab_title">国家</div>
	    				</div>
	    				<div class="data_div">
	    					<div class="title_span">国家数
    							<div class="data_span_div">
			    					<span class="data_span" title="" id="countryValue"></span>
			    					<span class="unit_span">个</span>
    							</div>
	    					</div>
	    					<div class="title_span">数量
    							<div class="data_span_div">
			    					<span class="data_span" title="" id="countryNumber"></span>
			    					<span class="unit_span">个次</span>
    							</div>
	    					</div>
	    					<div class="title_span">规模数
    							<div class="data_span_div">
			    					<span class="data_span" title="" id="countrycount"></span>
			    					<span class="unit_span" id="ctryCntUnit"></span>
    							</div>
	    					</div>
	    				</div>
	    			</div>
	    			
	    			<div class="box1_inbox box1_inbox_notact" value="2">
	    				<div>
	    					<div class="box_tab1 box_tab1_state"></div>
	    					<div class="tab_title">州省</div>
	    				</div>
	    				<div class="data_div">
	    					<div class="title_span">州省数
    							<div class="data_span_div">
			    					<span class="data_span" title="" id="stateValue"></span>
			    					<span class="unit_span">个</span>
    							</div>
	    					</div>
	    					<div class="title_span">数量
    							<div class="data_span_div">
			    					<span class="data_span" title="" id="stateNumber"></span>
			    					<span class="unit_span">个次</span>
    							</div>
	    					</div>
	    					<div class="title_span">规模数
    							<div class="data_span_div">
			    					<span class="data_span" title="" id="statecount"></span>
			    					<span class="unit_span" id="stateCntUnit"></span>
    							</div>
	    					</div>
	    				</div>
	    			</div>
	    			<div class="box1_inbox box1_inbox_notact" value="3">
	    				<div>
	    					<div class="box_tab1 box_tab1_city"></div>
	    					<div class="tab_title">城市</div>
	    				</div>
	    				<div class="data_div">
	    					<div class="title_span">城市数
    							<div class="data_span_div">
			    					<span class="data_span" title="" id="cityValue"></span>
			    					<span class="unit_span">个</span>
    							</div>
	    					</div>
	    					<div class="title_span">数量
    							<div class="data_span_div">
			    					<span class="data_span" title="" id="cityNumber"></span>
			    					<span class="unit_span">个次</span>
    							</div>
	    					</div>
	    					<div class="title_span">规模数
    							<div class="data_span_div">
			    					<span class="data_span" title="" id="citycount"></span>
			    					<span class="unit_span" id="cityCntUnit"></span>
    							</div>
	    					</div>
	    				</div>
	    			</div>
	        	
	        	</div>
	        </div>
	        <div class="right_bottom">
	        	<div class="right_bottom1">
	        		<span class="span_7" id="staticsRanks">地域排行</span>
	        	</div>
	        	 <div class="right_top2">
		        		<span class="span_5"></span>
		        		<span class="span_6">时间线分析</span>
	        	</div> 
	        	<div class="right_bottom2" id="territoryRank"></div>
	        </div>
			
			
    	</div>
    <jsp:include page="graph_tab2.jsp"></jsp:include>
    <jsp:include page="../updateUserPassword.jsp"/>
   </div>
</body>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/echarts.js"></script>
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
<script src="<%=basePath %>/static/js/config/config.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script><!-- 看到这 -->
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
<link rel="stylesheet" href="<%=basePath %>/static/css/hsCheckData.css"/>
<script type="text/javascript" src="<%=basePath%>/static/js/hsCheckData.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/customUtils.js"></script>
<script type="text/javascript">
    $(function(){
    	//处理配置
		handleConfigs();
		//控制Tone字段的显示问题
		gkgToneIsShow();
		//美化滚动条
		glorifyComboSelect();
    });
    function render(configId){
    	startLoad();
    	var resultcode = 'ALL';
    	$.ajax({
    		url:'<%=basePath%>/search/graph_conflict_timeline_viz/'+configId,
    		type: 'POST',
    		dataType:"json",
    		success:function(data){
    			if(data=="-1"){
					endLoad();
					win.alertEx("加载失败");
				}
    			renderData(data);
    			endLoad();
   			}
    	});
    }
    
    //获取字符串中数字
    function findNumByStr(str){
    	if(str !='' && str != undefined){
    		return str+''.replace(/[^0-9]/ig,""); 
    	}else{
    		return str;
    	}
    	
    }
    //获取字符串中的单位
    function findUnit(str){
    	if(str !='' && str != undefined){
    		return str+''.split(str+''.replace(/[^0-9]/ig,"")).length == 2?str+''.split(str+''.replace(/[^0-9]/ig,""))[1]:'';
    	}else{
    		return '';
    	}
    }
    
    var typeData;
    var countryRanks;
    var stateData;
    var stateRanks;
    var cityData;
    var cityRanks;
    var timeLineType;
    function renderData(data){
    	
    	//将弹出框进行关闭
    	$(".out_4").click();
    	
    	//国家
    	var tabCountry=data.tabCountry;
    	countryValue=tabCountry.countryValue;
    	countryNumber=tabCountry.countryNumber;
    	countrycount=tabCountry.countryCount;
    	typeData=data.typeData;
    	timeLineType=data.timeLineType;
    	countryRanks=data.countryRanks;
    	timeLineCountry=data.timeLineCountry;
    	$("#countryValue").html(numAddUnit(countryValue,1));
    	$("#countryNumber").html(numAddUnit(countryNumber,1));
    	//将规模数中的万、百万等单位单做单位展示
    	$("#countrycount").html(findNumByStr(numAddUnit(countrycount,0)));
    	$("#ctryCntUnit").html(findUnit(numAddUnit(countrycount,0)));
    	
    	$("#countryValue").attr("title",numAddUnit(countryValue,1));
    	$("#countryNumber").attr("title",numAddUnit(countryNumber,1));
    	$("#countrycount").attr("title",numAddUnit(countrycount,0));
    	//州省
    	var tabState=data.tabState;
    	var stateValue=tabState.stateValue;
    	var stateNumber=tabState.stateNumber;
    	var statecount=tabState.stateCount;
    	stateRanks=data.stateRanks;
    	timeLineState=data.timeLineState;
    	$("#stateValue").html(numAddUnit(stateValue,1));
    	$("#stateNumber").html(numAddUnit(stateNumber,1));
    	//将规模数中的万、百万等单位单做单位展示
    	$("#statecount").html(findNumByStr(numAddUnit(statecount,0)));
    	$("#stateCntUnit").html(findUnit(numAddUnit(statecount,0)));
    	
    	$("#stateValue").attr("title",numAddUnit(stateValue,1));
    	$("#stateNumber").attr("title",numAddUnit(stateNumber,1));
    	$("#statecount").attr("title",numAddUnit(statecount,0));
    	//城市
    	var tabCity=data.tabCity;
    	var cityValue=tabCity.cityValue;
    	var cityNumber=tabCity.cityNumber;
    	var citycount=tabCity.cityCount;
    	cityRanks=data.cityRanks;
    	timeLineCity=data.timeLineCity;
    	$("#cityValue").html(numAddUnit(cityValue,1));
    	$("#cityNumber").html(numAddUnit(cityNumber,1));
    	//将规模数中的万、百万等单位单做单位展示
    	$("#citycount").html(findNumByStr(numAddUnit(citycount,0)));
    	$("#cityCntUnit").html(findUnit(numAddUnit(citycount,0)));
    	
    	$("#cityValue").attr("title",numAddUnit(cityValue,1));
    	$("#cityNumber").attr("title",numAddUnit(cityNumber,1));
    	$("#citycount").attr("title",numAddUnit(citycount,0));
    	$("#box1_inbox").click();
    	//右侧列表
		showList(typeData);
    }
    var clickValue;
    var keys;
    var type="";
    var barName="";
    var clickKey="";
  	//国家、州省、城市切换
    $(".box1_inbox").on('click',function(){
    	$(".box1_inbox").removeClass("box1_inbox_act");
    	$(".box1_inbox").addClass("box1_inbox_notact");
    	$(this).removeClass("box1_inbox_notact");
    	$(this).addClass("box1_inbox_act");
    	clickValue=$(this).attr('value');
    	clickKey=clickValue;
    	if(clickValue==1){
    		countryRank(countryRanks);
    		$("#staticsRanks").html("国家地域排行");
    		$(".drop-down-content").empty();
    		var num = countryRanks.length > 10 ?10:countryRanks.length;
    		for(var i=0;i<num;i++){
    			$('.drop-down-content').append(' <li value="'+countryRanks[i].name+'" class="li_1 li">国家：'+countryRanks[i].name+'&nbsp;&nbsp;&nbsp;&nbsp;    数量：'+countryRanks[i].number+'&nbsp;&nbsp;&nbsp;&nbsp;    规模：'+countryRanks[i].count+'</li>');
    		}
    	}
    	if(clickValue==2){
    		countryRank(stateRanks);
    		$(".drop-down-content").empty();
    		$("#staticsRanks").html("州省地域排行");
    		var num = stateRanks.length > 10 ?10:stateRanks.length;
    		for(var i=0;i<num;i++){
    			$('.drop-down-content').append(' <li value="'+stateRanks[i].name+'" class="li_1 li">州省：'+stateRanks[i].name+'&nbsp;&nbsp;&nbsp;&nbsp;    数量：'+stateRanks[i].number+'&nbsp;&nbsp;&nbsp;&nbsp;    规模：'+stateRanks[i].count+'</li>');
    		}
    	}
    	if(clickValue==3){
    		$("#staticsRanks").html("城市地域排行");
    		countryRank(cityRanks);
    		$(".drop-down-content").empty();
    		var num = cityRanks.length > 10 ?10:cityRanks.length;
    		for(var i=0;i<num;i++){
    			$('.drop-down-content').append(' <li value="'+cityRanks[i].name+'" class="li_1 li">城市：'+cityRanks[i].name+'&nbsp;&nbsp;&nbsp;&nbsp;    数量：'+cityRanks[i].number+'&nbsp;&nbsp;&nbsp;&nbsp;    规模：'+cityRanks[i].count+'</li>');
    		}
    	}
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
    		//点击地域国家下拉框把地域的值赋给变量
    		clickValue=clickKey;
    		if(clickValue==1){
    			showTimeLine(timeLineCountry[keys])
        	}
    		if(clickValue==2){
    			showTimeLine(timeLineState[keys])
        	}
    		if(clickValue==3){
    			showTimeLine(timeLineCity[keys])
        	}
    		//initOrgTimeLineChart(organTimeLineData[key],1);
    		
       	}); 
    })
    //时间线分析-弹出框
    $('.right_top2').click(function(){
		$('.outBox').css('display','block');
		$('.zeZhao').css('display','block');
		$('.pull_down').css('display','block');
		//点击地域把地域的值赋给变量
		clickValue=clickKey;
		if(clickValue==1){
	 		timeLineData=countryRanks;
	 	}
	 	if(clickValue==2){
	 		timeLineData=stateRanks;
	 	}
	 	if(clickValue==3){
	 		timeLineData=cityRanks;
	 	}
		$(".li_1").first().click();		
		
	});
    //关闭弹出框
	$('.out_4').click(function(){
		$('.outBox').css('display','none');
		$('.zeZhao').css('display','none');
	})
	 //关闭tr弹出框
	$('.out_44').click(function(){
		$('.dev').css('display','none');
		//$('.zeZhao').css('display','none');
	})
	//事件分析-下拉框
    let flag = true;  
    $('.pull_down').click(function(){
    	if(flag = !flag){
    		$('.drop-down-content').css("display","block");
    	}else {
    		$('.drop-down-content').css("display","none");
    	}
    })
    //时间线数据力度切换方法
    function packDataType(data,len){
    	var date_news = {};
    	for(var i=0;i<data.length;i++){
			var date_str=data[i].key;
    		var date_clas=date_str+"";
    		var date_class=date_clas.substring(0,len);
    		if(len==2){
    			date_class = getWeekNum(date_clas);
    		}
    		var q1 = data[i].value;
        	var q2 = data[i].count;
    		if(date_news[date_class] != undefined){
    			var q11 = date_news[date_class].value;
            	var q22 = date_news[date_class].count;
            	date_news[date_class].value = q1 + q11;
            	date_news[date_class].count = q2 + q22;
    		}else{
    			var date_new = {};
    			date_new.value = q1;
    			date_new.count = q2;
    			date_news[date_class] = date_new;
    		}
        }
        var quadclass_value=[];
        for(var obj in date_news){
        	var date_new = date_news[obj];
        	var d1={
       			key:obj,
       			value:date_new.value.toFixed(3),
       			count:date_new.count.toFixed(3)
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
		if(clickValue==0){
			 lineEventData = timeLineType[type];
   		}
		if(clickValue==1){
			 lineEventData = timeLineCountry[keys];
    	}
		if(clickValue==2){
			 lineEventData =timeLineState[keys];
    	}
		if(clickValue==3){
			 lineEventData =timeLineCity[keys];
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
	//右侧列表
	function showList(data){
	    if(data==undefined){
	    	var data=[];
	    }
		var trs = "";
		var index = 1;
		for(var i=0;i<data.length;i++){
			if(i==0){
				trs+="<tr><td><span class='red_span'>"+index+"</span></td>";
			}else if(i==1){
				trs+="<tr><td><span class='orange_span'>"+index+"</span></td>";
			}else if(i==2){
				trs+="<tr><td><span class='green_span'>"+index+"</span></td>";
			}else{
				trs+="<tr><td><span>"+index+"</span></td>";
			}
			trs+="<td title='"+data[i].name+"' class='qq' onclick='showTrlist(\""+data[i].name+"\")' >"+data[i].name+"</td>";
			trs+="<td title='"+data[i].number+"' class='qq' onclick='showTrlist(\""+data[i].number+"\")' >"+data[i].number+"</td>";
			trs+="<td title='"+data[i].count+"' class='qq' onclick='showTrlist(\""+data[i].count+"\")'  >"+data[i].count+"</td>";
			if(i<10){
				trs+="<td onclick='listShow(\""+data[i].name+"\")'><img src='/monitorsystem/static/images/IconAnalytics.png'/></td></tr>";
			}else{
				trs+="<td onclick='listShowNo(\""+data[i].name+"\")'><img src='/monitorsystem/static/images/IconAnalytics_bl.png'/></td></tr>";
			}
			
			index++;
		}
		$("#tableData tbody").html(trs);
	}
    
    function showTrlist(name){
   	 	var e = window.event || arguments.callee.caller.arguments[0];
   	 	var targetX = e.clientX;
   	 	var targetY = e.clientY;
   	 	var tableX = $('#over').offset().left;
   	 	var tableY = $('#over').offset().top;
   	 	var sorollTop = $('#over').scrollTop()
   	 	var w = $('#over tr td').eq(0).width()
    	$("#dev").show();
   	 	$('#dev').css({left: w + 'px',top : targetY - tableY + sorollTop + 'px'})
    	$("#detail").html(name);
    }
    
    function paixu(){
    	var pxvalue=$("#paixu").attr("value");
    	if(pxvalue==1){
    		$("#paixu").attr("src","../../static/images/up.png")
    		var dataList=typeData;
        	var trs = "";
    		var index = 1;
    		for(var i=dataList.length-1;i>-1;i--){
    			type=dataList[i].name;
    			if(i==dataList.length-1){
    				trs+="<tr><td><span class='red_span'>"+index+"</span></td>";
    			}else if(i==dataList.length-2){
    				trs+="<tr><td><span class='orange_span'>"+index+"</span></td>";
    			}else if(i==dataList.length-3){
    				trs+="<tr><td><span class='green_span'>"+index+"</span></td>";
    			}else{
    				trs+="<tr><td><span>"+index+"</span></td>";
    			}
    			trs+="<td title='"+dataList[i].name+"' class='qq' class='qq' onclick='showTrlist(\""+dataList[i].name+"\")'>"+dataList[i].name+"</td>";
    			trs+="<td title='"+dataList[i].number+"' class='qq' class='qq' onclick='showTrlist(\""+dataList[i].number+"\")'>"+dataList[i].number+"</td>";
    			trs+="<td title='"+dataList[i].count+"' class='qq' class='qq' onclick='showTrlist(\""+dataList[i].count+"\")'>"+dataList[i].count+"</td>";
    			if(i<10){
    				trs+="<td onclick='listShow(\""+type+"\")'><img src='/monitorsystem/static/images/IconAnalytics.png'/></td></tr>";
    			}else{
    				trs+="<td onclick='listShowNo(\""+type+"\")'><img src='/monitorsystem/static/images/IconAnalytics_bl.png'/></td></tr>";
    			}
    			
    			index++;
    		}
    		$("#tableData tbody").html(trs);
    		$("#paixu").attr("value","2");
    	}else if(pxvalue==2){
    		$("#paixu").attr("src","../../static/images/dowm.png")
    		showList(typeData);
    		$("#paixu").attr("value","1");
    	}
    	
    	
    }
   
    function paixuNumber(){
    	var pxvalue=$("#paixuNumber").attr("value");
    	if(pxvalue==1){
    		$("#paixuNumber").attr("src","../../static/images/up.png")
    		var dataList=typeData;
    		for (var j = 0; j < dataList.length - 1; j++) {
                for (var i = 0; i < dataList.length-1-j; i++) {
                    if (dataList[i].count < dataList[i + 1].count) {
                        var temp = dataList[i + 1].count;
                        dataList[i + 1].count = dataList[i].count;
                        dataList[i].count = temp;
                    }
                }
            }
        	var trs = "";
    		var index = 1;
    		for(var i=dataList.length-1;i>-1;i--){
    			type=dataList[i].name;
    			if(i==dataList.length-1){
    				trs+="<tr><td><span class='red_span'>"+index+"</span></td>";
    			}else if(i==dataList.length-2){
    				trs+="<tr><td><span class='orange_span'>"+index+"</span></td>";
    			}else if(i==dataList.length-3){
    				trs+="<tr><td><span class='green_span'>"+index+"</span></td>";
    			}else{
    				trs+="<tr><td><span>"+index+"</span></td>";
    			}
    			trs+="<td title='"+dataList[i].name+"' class='qq' onclick='showTrlist(\""+dataList[i].name+"\")' >"+dataList[i].name+"</td>";
    			trs+="<td title='"+dataList[i].number+"' class='qq' onclick='showTrlist(\""+dataList[i].number+"\")' >"+dataList[i].number+"</td>";
    			trs+="<td title='"+dataList[i].count+"' class='qq' onclick='showTrlist(\""+dataList[i].count+"\")' >"+dataList[i].count+"</td>";
    			if(i<10){
    				trs+="<td onclick='listShow(\""+type+"\")'><img src='/monitorsystem/static/images/IconAnalytics.png'/></td></tr>";
    			}else{
    				trs+="<td onclick='listShowNo(\""+type+"\")'><img src='/monitorsystem/static/images/IconAnalytics_bl.png'/></td></tr>";
    			}
    			
    			index++;
    		}
    		$("#tableData tbody").html(trs);
    		$("#paixuNumber").attr("value","2");
    	}else if(pxvalue==2){
    		$("#paixuNumber").attr("src","../../static/images/dowm.png")
    		showList(typeData);
    		$("#paixuNumber").attr("value","1");
    	}
    	
    	
    }
    
    function listShow(types){
    	$('.outBox').css('display','block');
		$('.zeZhao').css('display','block');
		$('.pull_down').css('display','none');
		$(".circleon").removeClass("circleon");
		$("#dayCondtion").addClass("circleon");
		//渲染组织时间线图
		//keys =  $(this).attr("value");
		type=types;
	    showTimeLine(timeLineType[type])
	    //点击类型把类型的值赋给变量
	    clickValue=0;
    }
    function listShowNo(type){
    	win.alertEx("暂无"+type+"的时间线数据");
    }
    
    //国家地域排行
    function countryRank(countryRanks){
    	var myChart= echarts.init(document.getElementById('territoryRank'));
    	var data1=[];
    	var data2=[];
    	var data3=[];
    	var maxIndex=0;
    	var maxCount = 0;
    	for(var i=0;i<countryRanks.length;i++){
    		var number=countryRanks[i].number*1;
    		var name=countryRanks[i].name;
    		var count=countryRanks[i].count*1;
    		if(maxIndex<number){
    			maxIndex=number;
    		}
    		
    		if(maxCount<count){
    			maxCount=count;
    		}
    		
    		data1.push(name);
    		data2.push(count);
    		data3.push(number);
    	}
    	option = {
    	    tooltip : {
    	        trigger: 'axis'
    	    },
    	     dataZoom: [
		        {
	        	  start: 0,
		          end: 20,
		        },
		        {
		        	start: 0,
			          end: 20,
		          type: 'slider',
		          textStyle:{
	       		  color:"#fff"
       			  }
		        }
    		],
    		grid: {
				top: '15%',
				left: '1%',
				right: '1%',
				bottom: '10%',
				containLabel: true,
			},
    	   /*  toolbox: {
    	        feature: {
    	            dataZoom: {
    	                yAxisIndex: 'none'
    	            } //放缩功能
    	        }
    	    }, */
    	    calculable : true,
    	    legend: {
    	        data:['数量','规模数'],
    	        top:30,
    	        textStyle:{
    	        	color:"#fff"
    	        }
    	    },
    	    xAxis : [
    	        {
    	            type : 'category',
    	            data : data1,
    	            axisLine: {
    				            lineStyle: {
    				                color: '#606985',
    				                width:2
    				            }
    				        },
    				        axisLabel: {
    				        	textStyle: {
    		    	                color: 'white',
    		    	                fontSize: 14
    		    	            }
    				        },
    	            axisTick: {
    	                alignWithLabel: true, //刻度线和标签对齐
    	                interval:0   //间隔
    	            },
    	            splitLine: {
    	                show: false, //网格线开关
    	            },
    	            
    	        },
    	       
    	    ],
    	    yAxis : [
    	        {
    	            type : 'value',
    	            name : '数量:(个次)',
    	            nameTextStyle:{
    	            	color:"#fff"
    	            },
    	            max:maxIndex,
    	            // axisLabel : {
    	            //     formatter: '{value} ml'
    	            // },
    	            splitLine: { // 分隔线
    	                show: false, // 默认显示，属性show控制显示与否

    	            },
    	            axisLine: {
    				            lineStyle: {
    				                color: '#606985',
    				                width:2
    				            }
    				        },
    		        axisLabel: {
    		        	textStyle: {
        	                color: 'white',
        	                fontSize: 14
        	            }
    		        },
    	            axisTick: {
    	                show: true  //坐标轴刻度线是否显示
    	            },
    	            splitLine: {
    	                show: false, //网格线开关
    	            }
    	        },
    	        {
    	            type : 'value',
    	            name : '规模数',
    	            nameTextStyle:{
    	            	color:"#fff"
    	            },
    	            max:maxCount,
    	            // axisLabel : {
    	            //     formatter: '{value} °C'
    	            // }, 
    	            splitLine: { // 分隔线
    	                show: false, // 默认显示，属性show控制显示与否

    	            },
    	           axisLine: {
    				            lineStyle: {
    				                color: '#606985',
    				                width:2
    				            }
    				        },
    				        axisLabel: {
    				        	textStyle: {
    		    	                color: 'white',
    		    	                fontSize: 14
    		    	            }
    				        },
    	            axisTick: {
    	                show: true
    	            },
    	            splitLine: {
    	                show: false,
    	            }
    	        }
    	    ],
    	    series : [

    	        {
    	            name:'数量',
    	            type:'bar',
    	            data:data3,
    	            itemStyle: {
    	                normal: {
    	                    //barBorderRadius: 15,
    	                    color: new echarts.graphic.LinearGradient(
    	                        0, 0, 0, 1, [{
    	                                offset: 0,
    	                                color: '#3FC6F5'
    	                            },
    	                            {
    	                                offset: 1,
    	                                color: '#3FC6F5'
    	                            }
    	                        ]
    	                    )
    	                }
    	            }
    	            
    	        },
    	        {
    	            name:'规模数',
    	            type:'bar',
    	            yAxisIndex: 1,
    	            data:data2,
    	            itemStyle: {
    	                normal: {
    	                    color: '#E8872F'
    	                },
    	            },
    	        }
    	      
    	       
    	    ]
    	};
    	myChart.setOption(option);
	 	window.onresize=function (){
		    myChart.resize();
        }
	 	var ranksData=[];
	 	if(clickValue==1){
	 		ranksData=timeLineCountry;
	 	}
	 	if(clickValue==2){
	 		ranksData=timeLineState;
	 	}
	 	if(clickValue==3){
	 		ranksData=timeLineCity;
	 	}
	 	
	 /* 	myChart.on('click', function (params){
			barName=params.name;
			if(ranksData[barName]==undefined){
				alert("暂无该时间线数据！！")
			}else{
				$('.outBox').css('display','block');
				$('.zeZhao').css('display','block')
				$(".circleon").removeClass("circleon");
				$("#dayCondtion").addClass("circleon");
				//渲染组织时间线图
				//keys =  $(this).attr("value");
			    showTimeLine(ranksData[barName])	
						
			}
			
		}) */
			
    }
    //时间线
    function showTimeLine(data){
    	var data1=[];
    	var data2=[];
    	var data3=[];
    	var maxVlaue=0;
    	var minVlaue=0;
    	var minCount = 0;
    	var maxCount = 0;
    	for(var i=0;i<data.length;i++){
    		var time=data[i].key;
    		var value=data[i].value*1;
    		var count=data[i].count*1;
    		//获取value值的最大值、最小值
			if(maxVlaue<value){
				maxVlaue=value;
			}
			if(minVlaue>value){
				minVlaue=value;
			}
			//获取规模数的最大值、最小值
			if(maxCount<count){
				maxCount=count;
			}
			if(minCount>count){
				minCount=count;
			}
    		data1.push(time);
    		data2.push(value);
    		data3.push(count);
    	}
    	var myChart= echarts.init(document.getElementById('timeLine'));
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
    		         trigger: 'axis'
    		      },
    		      legend: {
    					show:true,
    					data:['数量','规模数'],
    					textStyle:{
    			        	color:"#fff"
    			        },
    			        icon: 'circle'
    			  },
    		      grid: {
    					top: '15%',
    					left: '1%',
    					right: '2%',
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
    		      xAxis: [
    		            {
    		                type: 'category',
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
    		   				 splitLine: {
    		   					 show: false
    		   				},
    		                boundaryGap: false,
    		                data: data1
    		            }
    		        ],
    		        yAxis: [
    		            {
    		                name: '数量:(个次)',
    		                nameTextStyle:{
    			            	color:"#fff"
    			            },
    		                type: 'value',
    		                min:minVlaue,
    		   				max:maxVlaue,
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
    		   				 splitLine: {
    		   					 show: false
    		   				 }
    		            },
    		            {
    		                name: '规模数',
    		                nameTextStyle:{
    			            	color:"#fff"
    			            },
    		                type: 'value',
    		                min:minCount,
    		   				max:maxCount,
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
    		   				splitLine: {
    		   				   show: false
    		   				}
    		            }
    		        ],
    		        series: [
    		            {
    		                name: '数量',
    		                type: 'line',
    		                smooth: true,
    		                itemStyle: {
    		                    normal: {
    		                        color: '#229aff'
    		                    }
    		                },
    						lineStyle: {
    							normal: {
    								color: "#229aff"   // 线条颜色
    							}
    						},
    		                data: data2
    		            },
    		            {
    		                name: '规模数',
    		                type: 'line',
    		                yAxisIndex: 1,
    		                smooth: true,
    		                itemStyle: {
    		                    normal: {
    		                        color: '#E8872F'
    		                    }
    		                },
    						lineStyle: {
    							normal: {
    								color: "#E8872F"   // 线条颜色
    							}
    						},
    		                data: data3
    		            }
    		        ]
   		};
    	myChart.setOption(option);
	 	window.onresize=function (){
		    myChart.resize();
        }
    }
    </script>
</html>