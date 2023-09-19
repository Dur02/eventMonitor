<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图谱—网站分析</title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/style.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath%>/static/lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/combo.select.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/perfect-scrollbar.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/base.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/css/event_result.css"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/leaflet.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/dvf.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/example.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/ui.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/actormap.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window_zs.css"/><!-- 弹出提示框样式 -->
<script src="<%=basePath%>/static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/echarts.js"></script>
<script src="<%=basePath%>/static/lib/jquery.pagination.js"></script>
<script src="<%=basePath%>/static/js/config/config.js"></script>
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
		.index_top {
			border-bottom： 1px solid #7e7b7d;
		}
		.index_bottom {
			position: relative;	
			background: url(<%=basePath %>/static/images/beij.png) no-repeat;
			background-size: 100%;	
		}
		.left_box {
			position: absolute;
    		width: 17%;
    		height: 56.7%;
    		left: 2%;
    		border: #383e54 solid 1px;
    		top: 6.6%;
    		background-color: #1b2334;
		}
		.left_page1 {
		    width: 100%;
    		height: 100%;
			position: absolute;
			color: white;	
			display: block;
		}
		.left_page2 {
			width: 17%;
    		height: 56.7%;
			position: absolute;
			width: 100%;
			height: 100%;
			color: white;
			display: none;
			margin-top: 43px;			
		}
		.right_page1 {
			position: obsolute;
			width: 100%;
			height: 100%;
			color: white;	
			display: block;	
		}	
		.right_page2 {
			position: absolute;
			width: 100%;
			height: 100%;
			color: white;
			display: none;	
			margin-top: 43px;		
		}
		.bottomL_page1 {
			position: absolute;
			width: 100%;
			height: 83%;
			color: white;
			display: block;
			margin-top: 15px;
		}
		.bottomL_page2 {
			position: absolute;
			width: 100%;
			height: 100%;
			color: white;
			display: none;
			margin-top: 43px;
		}
		.bottomM_page1 {
			position: absolute;
			width: 100%;
			height: 100%;
			color: white;
			display: block;
			margin-top: 43px;
		}
		.bottomM_page2 {
			position: absolute;
			width: 100%;
			height: 100%;
			color: white;
			display: none;
			margin-top: 43px;
		}
		.bottomR_page1 {
			position: absolute;
			width: 100%;
			height: 100%;
			color: white;
			display: block;
			margin-top: 43px;
		}
		.bottomR_page2 {
			position: absolute;
			width: 100%;
			height: 100%;
			color: white;
			display: none;
			margin-top: 43px;
		}
		.right_box {
			position: absolute;
			width: 17%;
			height: 56.7%;
			right: 2%;
			border: #383e54 solid 1px;
			top: 6.6%;
			background-color: #1b2334;
		}
		.left_bottom1 {
			position: absolute;
			width: 47.5%;
			height: 28%;
			left: 2%;
			border: #383e54 solid 1px;
			bottom: 60px;
			background-color: #1b2334;			
		}
		.left_bottom2 {
			position: absolute;
			width: 47.5%;
			height: 28%;
			right: 2%;
			border: #383e54 solid 1px;
			bottom: 60px;
			background-color: #1b2334;
		}
		.left_bottom3 {
			position: absolute;
			width: 30.6%;
			height: 22%;
			left: 67.2%;
			border: #383e54 solid 1px;
			bottom: 60px;
			background-color: #1b2334;
		}
		.middle_box {
			position: absolute;
			width: 18.3%;
			height: 3.14%;
			left: 20.9%;
			top: 6.6%;
			color: white;
		}
		.middle_box1 {
			position: absolute;
			width: 13.6%;
    		height: 4.7%;
			left: 43%;
			top: 37px;
			color: white;
			border: #383e54 solid 0px;
			background: url(<%=basePath %>/static/images/ti_1.png) no-repeat;
		}
		.active {
		 	background: url(<%=basePath %>/static/images/faguang11.png) no-repeat;
		}
		.active1 {
		 	background: url(<%=basePath %>/static/images/faguang22.png) no-repeat;
		}
		.role {
			    display: inline-block;
		   	 	width: 49.9%;
		    	height: 8.7%;
		    	color: white;
		    	background-color: #091d31;
		    	float: left;
		    	text-align: center;
		    	line-height: 43.6px;
		    	cursor: pointer;
		    	font-size: 14px;
		    	font-family: SimSun;
		    	font-weight: bold;
		}
		.role_1 {
			display: inline-block;
			width: 50%;
			height: 22%;
			color: white;
			background-color: #091d31;
			float: left;
			text-align: center;
			line-height: 38.6px;
			cursor: pointer;
			font-size: 14px;
   		 	font-family: SimSun;
    		font-weight: bold;
		}		
		.middle_map {
			position: absolute;
		    left: 44.3%;
		    top: 17.3%;
		    width: 13%;
			height: 16%;
			display: none;
		}
		.middle_map img {
			width: 100%;
			height: 100%;			
		}
		.dis_none {
			width: 55.5%;
			height: 56%;
			margin-left: 22.3%;
			margin-top: 4.9%;		
		}
		.dis_block {
			width: 59.1%;
    		height: 53.4%;
    		top: 11.6%;
    		left: 20.5%;
			position: absolute;
			display: block;
		}
		.dis_block1 {
			width: 55.1%;
    		height: 59.4%;
    		top: 8%;
    		left: 22.5%;
			position: absolute;
			display: block;
		}
		.top_echart {
			width: 100%;
    		height: 60%;
    		top: 26%;
			position: absolute;
			display: block;
		}
		.rank {
			width: 55%;
			height: 28.5%;
			background-color: #091d31;
			position: absolute;
			bottom: 32.6%;
			border: 1px solid #383e54;
			display: none;
		}
        .world {
        	display: inline-block;
        	height: 26px;
        	width: 73px;
        	transform: skew(20deg);
        	border-radius: 3px;
        	border: 1px solid #00aeff;
        	background-color: #024a73;
        	margin-right: 7px;
       	    cursor: pointer;
        }
        .world1 {
        	display: inline-block;
        	margin-left: 25px;
        	margin-top: 3px;
        	transform: skew(-20deg);
        }
         .country {
        	display: inline-block;
        	height: 26px;
        	width: 73px;
        	transform: skew(20deg);
        	border-radius: 3px;
        	/* display:none; */
        	border: 1px solid #00aeff;
        	background-color: #00aeff;
        }
        .country1 {
        	display: inline-block;
        	margin-left: 25px;
        	margin-top: 3px;
        	transform: skew(-20deg);
        }
        .Province {
        	display: inline-block;
        	height: 26px;
        	width: 73px;
        	transform: skew(20deg);
        	border-radius: 3px;
        	/* display:none; */
        	border: 1.3px solid #00aeff;
        	background-color: #1683c1;
        	cursor: pointer;
        	margin-left: -7px;
        }
        .Province1 {
        	display: inline-block;
        	margin-left: 25px;
        	margin-top: 3px;
        	transform: skew(-20deg);
        	color: #28e0f7;
        }
        .trapezoid {
        	font-size: 14px;
   	 		font-family: SimSun;
    		font-weight: bold;
    		position: absolute;
    		left: 75px;
    		top: 10px;	
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
        	/* display: none; */
        }
        .city1 {
        	display: inline-block;
        	margin-left: 25px;
        	margin-top: 3px;
        	transform: skew(-20deg);       	
        }
        #change {
        	position: absolute;
        	left: 700px;
    		top: 100px;      	
        }
        .rank_top {
        	width: 214px;
        	height: 33px;
        	background: url(<%=basePath %>/static/images/faguang3.png) no-repeat;
        	position: absolute;
        	margin-left: 390px;
        }
        .rank_top1 {
        	position: absolute;
        	left: 66px;
    		top: 6px;
    		color: #FFF;

        }
        .nodata_image{
	    top: 46%;
	    left: 50%;
	    position: absolute;
	    margin-top: -290px;
	    margin-left: -190px;
	    height: 231px;
	}
	.bottom_echart {
	    width: 60%;
	    margin: 0 auto;
	    height: 70%;
	    border: 1px solid rgba(82, 89, 113, 1);
	    background: #20263A;
	    position: absolute;
	    bottom: 20.8%;
    	left: 20%;
	    z-index: 999999;
	}   
   
   .country_sort {
    width: 26%;
    height: 38px;
    background: url(../../static/images/zhengjian.png) no-repeat center center;
    background-size: 100% 100%;
    margin: 0 auto;
    text-align: center;
    line-height: 38px;
    color: #fff;
}
.close_echart {
    width: 20px;
    height: 20px;
    color: #fff;
    font-size: 18px;
    float: right;
    background: url(../../static/images/del_date.png) no-repeat;
    margin-top: -19px;
    margin-right: 10px;
    background-size: 20px 20px;
    cursor: pointer;
}
 .country_sort {
     width: 45%;
     height: 27px;
     background: url(../../static/images/zhengjian.png) no-repeat center center;
     background-size: 100% 100%;
     margin: 0 auto;
     text-align: center;
    line-height: 27px;
    color: #fff;
}
.country_sort1 {
     width: 15%;
     height: 27px;
     background: url(../../static/images/zhengjian.png) no-repeat center center;
     background-size: 100% 100%;
     margin: 0 auto;
     text-align: center;
    line-height: 27px;
    color: #fff;
}
  .seven {
    width: 14px;
    height: 14px;
    display: inline-block;
    margin-left: 10px;
    background: url(../../static/images/ques.png) no-repeat;
    position: relative;
    top: 2px;
    cursor: pointer;
}  
 .seven {
    width: 14px;
    height: 14px;
    display: inline-block;
    margin-left: 10px;
    background: url(../../static/images/ques.png) no-repeat;
    position: relative;
    top: 2px;
    cursor: pointer;
}

.sex{
	cursor:pointer;
	display: flex;
    width: 19px;
    height: 14px;
    margin-top: 3px;
    background: url(/monitorsystem/static/images/IconAnalytics.png) no-repeat;
	margin-top: -17px;
    margin-left: 185px;
	}
.sex1{
	cursor:pointer;
	display: flex;
    width: 19px;
    height: 14px;
    margin-top: 3px;
    background: url(/monitorsystem/static/images/IconAnalytics.png) no-repeat;
	margin-top: -17px;
    margin-left: 185px;
	}	
	/*时间线分析*/
	.right_top2 {
		width: 12%;
		height: 30px;
		border: 1px solid #1069be;
		position: absolute;
		right: 3%;
		top: 10px;
		background-color: #0c306d;
		padding: 5px 0 0 8px;
		cursor: pointer;
	}
	.right_top3 {
		width: 12%;
		height: 30px;
		border: 1px solid #1069be;
		position: absolute;
		right: 3%;
		top: 10px;
		background-color: #0c306d;
		padding: 5px 0 0 8px;
		cursor: pointer;
	}
	.span_5 {
		display: inline-block;
		width: 19px;
		height: 14px;
		margin-top: 3px;
		margin-left:-70px;
		background: url(<%=basePath %>/static/images/IconAnalytics.png) no-repeat;	
	}
	.span_6 {
		color: #02e5e4;
		position: absolute;
		left: 32px;
    	top: 0px;
	}
	
	/*弹出框*/
	.popup {
		width: 86%;
	    height: 51%;
	    border: 1px solid #1c80b9;
	    position: absolute;
	    left: 16%;
	    top: 37%;
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
	    width:100%;
	    height: 391px;
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
		.btn-group, .btn-group-vertical {
		    position: relative;
		    display: inline-block;
		    vertical-align: middle;
		}
		.fr_btn-group {
		    float: left;
		}
		.borcolor {
		    background-color: rgba(0,136,204,1)!important;
		    color: #fff!important;
		}
		.btn-group .btns {
		    display: inline-block;
		    margin-bottom: 0px;
		    color: #fff font-size: 14px;
		    font-weight: 400;
		    line-height: 1.42857;
		    text-align: center;
		    white-space: nowrap;
		    vertical-align: middle;
		    cursor: pointer;
		    user-select: none;
		    background-color: #083ca547;
		    color: #fff;
		    padding: 6px 12px;
		    border-width: 1px;
		    border-style: solid;
		    border-color: transparent;
		    border-image: initial;
		    border-radius: 4px;
		}
		.country_bottom{
		    margin-left: 7%;
		    margin-top: 11px;
		    color: #fff;
		    font-size: 16px;
		    display: inline-block;
		}
		
	</style>
</head>
<body>
	<div class="index_top clearfix">
		<h3 class="fl title">图谱库分析 > 网站分析</h3>
		<input type="hidden" id="moduleCode" value="${moduleCode}">
	</div>
	<div class="index_bottom">
		<div class="zeZhao"></div>
		<div class="popup">
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
		<!-- 填充 -->
		<!-- 左侧 -->
		<div class="left_box">
			<div class="country_sort">
				<span id="rank">网站数地域排行</span><span class="sex" value="1"></span>
			</div>
			<div class="left_page1" id="countryActorOne"></div>
		</div>
		<!-- 中部 -->
		<div class="middle_box">
			<div id="btn-group" class="btn-group fr_btn-group" style="width:140px;">
                 <input type="button" class="btns borcolor" id="carousel" value="网站数">
                 <input type="button" class="btns"  value="报道数">
            </div>
		</div>
		<!-- <div class="middle_box1">
			<span class="trapezoid">			
			角色地理展示
			</span>
		</div> -->
		<!-- 中部隐藏部分 -->
		<div class="dis_block1" id="dis_block1" style="display: none">
			<div class="bottom_echart">
					<div class="bot" style="width: 100%;height:40px">
					    <div class="country_bottom" id="country_bottom"></div>
						<div class="clearfloat" style="clear:both"></div>
						<div class="close_echart" title="点击按钮关闭"></div>
					</div>
					<div class="bot" style="width: 100%;height:40px">
					    <div style="width: 100%;height:20px">
						     <div style="width:100%;height: 20px">
						        <img style="margin-left: 41px;" src="/monitorsystem/static/images//web.jpg"/><span style="    margin-left: 15px; color: #12acbf;font-size: 13px;">网站数</span><span style="    margin-left: 10px; color: #fff;">4个</span>
						     </div>
					    </div>
						<div style="width: 100%;height:20px;margin-top: 5px;margin-bottom: 5px;">
							<div style="width:100%;height: 20px">
						        <img style="margin-left: 41px;" src="/monitorsystem/static/images//web.jpg"/><span style="    margin-left: 15px; color: #12acbf;font-size: 13px;">报道数</span><span style="    margin-left: 10px; color: #fff;">4个次</span>
						     </div>
						</div>
					</div>
					<div style="width: 579px;height:259px;margin-top: 21px;" id="lineBar"></div>
		   </div>
		</div>
		
		<!-- 中部显示部分 -->
		<div class="dis_block"  id="word_echart">
		      
		</div>
		
		<!-- 右侧 -->
		<div class="right_box">
			<div class="country_sort">
				<span id="rank">报道数地域排行</span><span class="sex1" value="2"></span>
			</div>
			<div class="right_page1" id="typeActor1"></div>
		</div>
		<!-- 下部 -->
		<div class="left_bottom1">
			<div class="country_sort1">
				<span id="rank">域名统计分析</span>
				<div class="right_top2" value="3">
		        		<span class="span_5"></span>
		        		<span class="span_6">时间线分析</span>
		        </div>
			</div>
			
			<div class="bottomL_page1" id="organizationActor1"></div>
		</div>
		<div class="left_bottom2">
			<div class="country_sort1">
				<span id="rank">网站统计分析</span>
				<div class="right_top3" value="4">
		        		<span class="span_5"></span>
		        		<span class="span_6">时间线分析</span>
		        </div>
			</div>
			
			<div class="bottomL_page1" id="organizationActor2"></div>
		</div>
		
		<jsp:include page="graph_tab2.jsp"></jsp:include>
	</div>
	<jsp:include page="../updateUserPassword.jsp"/>
</body>

<script src="<%=basePath%>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath%>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath%>/static/js/bootstrap-select.min.js"></script>
<script src="<%=basePath%>/static/js/jquery.combo.select.js"></script>
<script src="<%=basePath%>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath%>/static/js/perfect-scrollbar.js"></script>
<script src="<%=basePath%>/static/js/sec2.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/base.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/echarts/map2/echarts.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/echarts/map2/world.js"></script>
<!-- 人工查询js -->
<script src="<%=basePath %>/static/Visualization/rgQuery.js"></script>
<c:if test="${bgFlag == null or bgFlag == 1}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
</c:if>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/downLoad.js"></script>	
<script src="<%=basePath%>/static/js/map-tileLayer.js"	type="text/javascript"></script>	
<!-- 计算显示图的高度 -->	
<script src="<%=basePath%>/static/js/chartHeight.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<link rel="stylesheet" href="<%=basePath %>/static/css/hsCheckData.css"/>
<script type="text/javascript" src="<%=basePath%>/static/js/hsCheckData.js"></script>
<script type="text/javascript">
	$(function(){
		
		$('.btns').on('click',function(){
			$(this).addClass('borcolor').siblings('.btns').removeClass('borcolor');
		    var btnValue=$(this).attr('value');
		    if(btnValue=="网站数"){
		    	 showMap("网站数",websiteRank);
		    }
		    if(btnValue=="报道数"){
		    	 showMap("报道数",reportsRank);
		    }
    	})
		
		//处理配置
		handleConfigs();
		//控制Tone字段的显示问题
		gkgToneIsShow();
		//美化滚动条
		glorifyComboSelect();
	});
		//定义全局的时间线myechart,用于echarts自适应
	    var myChart_timeLine;
		function render(configId){
			startLoad();
			$("#info-table").empty();
			$.ajax({
				url:'<%=basePath%>/search/graph_website_analysis_viz/'+configId,
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
						myChart_timeLine.resize();
					}
				}
			});
		}
		var keys;
		var websiteRank=[];//网站数
		var	timeLineWebsite;//网站数时间线
		var reportsRank=[];//报道数
		var timeLineReports;//报道数时间线
		var websiteStatistics=[];//网站统计分析
		var timeLineStatistics;//网站统计分析时间线
		var worldData =[];//网站数地图数据
		var sourUrl;
		var timeLineSours;
		function renderData(data){
			$("#carousel").addClass('borcolor').siblings('.btns').removeClass('borcolor');
			//弹出框关闭
			$(".out_4").click();
			sourUrl = data.sourUrl;
			timeLineSours = data.timeLineSours;
		    websiteRank=data.websiteRank;//网站数
			//websiteRank=[{"name":"中国","value":100},{"name":"美国","value":90},{"name":"以色列","value":85},{"name":"俄罗斯","value":90},{"name":"德国","value":60},{"name":"英国","value":80},{"name":"印度","value":70},{"name":"新加坡","value":30},{"name":"韩国","value":60},{"name":"日本","value":10}]
		    timeLineWebsite =data.timeLineWebsite;//网站数时间线
		  	/* timeLineWebsite={"中国":[{"key":"20180802","value":40},{"key":"20180803","value":90},{"key":"20180804","value":70},{"key":"20180805","value":30},{"key":"20180806","value":60},{"key":"20180807","value":80},{"key":"20180808","value":50}],
			         "美国":[{"key":"20180802","value":40},{"key":"20180803","value":90},{"key":"20180804","value":70},{"key":"20180805","value":30},{"key":"20180806","value":60},{"key":"20180807","value":80},{"key":"20180808","value":50}]
	                } */  	
		    reportsRank=data.reportsRank;//报道数
			//reportsRank=[{"name":"伊朗","value":100},{"name":"美国","value":90},{"name":"以色列","value":85},{"name":"俄罗斯","value":80},{"name":"德国","value":70},{"name":"英国","value":60},{"name":"印度","value":50},{"name":"新加坡","value":40},{"name":"韩国","value":30},{"name":"日本","value":10}]
		    timeLineReports =data.timeLineReports;//报道数时间线
		    /* timeLineReports={"伊朗":[{"key":"20180802","value":40},{"key":"20180803","value":90},{"key":"20180804","value":70},{"key":"20180805","value":30},{"key":"20180806","value":60},{"key":"20180807","value":80},{"key":"20180808","value":50}],
			         "美国":[{"key":"20180802","value":40},{"key":"20180803","value":90},{"key":"20180804","value":70},{"key":"20180805","value":30},{"key":"20180806","value":60},{"key":"20180807","value":80},{"key":"20180808","value":50}]
	                } */  	
		    websiteStatistics=data.websiteStatistics;//网站统计分析
		    /* websiteStatistics=[{"name":"sina","value":100},{"name":"alibaba","value":98},{"name":"tencent","value":80},{"name":"baidu","value":60},{"name":"sina","value":100},{"name":"sina","value":100},{"name":"sina","value":100},{"name":"sina","value":100},{"name":"sina","value":100},{"name":"sina","value":100},
		    	{"name":"sina","value":100},{"name":"sina","value":100},{"name":"sina","value":100},{"name":"sina","value":100},{"name":"sina","value":100},{"name":"sina","value":100},{"name":"sina","value":100},{"name":"sina","value":100},{"name":"sina","value":100},{"name":"sina","value":100},{"name":"sina","value":100}
		    	]; */
		    timeLineStatistics =data.timeLineStatistics;//网站统计分析时间线   
		    /* timeLineStatistics={"alibaba":[{"key":"20180802","value":40},{"key":"20180803","value":90},{"key":"20180804","value":70},{"key":"20180805","value":30},{"key":"20180806","value":60},{"key":"20180807","value":80},{"key":"20180808","value":50}],
			         "sina":[{"key":"20180802","value":40},{"key":"20180803","value":90},{"key":"20180804","value":70},{"key":"20180805","value":30},{"key":"20180806","value":60},{"key":"20180807","value":80},{"key":"20180808","value":50}]
             }  */
		  
		     worldData = data.worldData //世界地图数据
			 showMap("网站数",websiteRank);
		     websiteRankShow(websiteRank);	
			 reportsRankShow(reportsRank);
			 websiteStatisticsShow(websiteStatistics);
			 //countryStatisticsShow();
			 sourUrlShow(sourUrl);
			 
			 
			 //时间粒度切换
		    $('.circle').on('click',function(){
				$(this).addClass('circleon').siblings('.circle').removeClass('circleon');
				var selectVal=$(this).attr('value');
				var lineEventData=[];
				if(val==1){
					 lineEventData = timeLineWebsite[keys];
		    	}
				if(val==2){
					 lineEventData =timeLineReports[keys];
		    	}
				if(val==3){
					 lineEventData =timeLineStatistics[keys];
		    	}
				if(val==4){
					lineEventData =timeLineSours[keys];
				}
				if(selectVal=="1"){
					showTimeLine(lineEventData);
				}
				if(selectVal=="2"){
		    	    //先遍历X轴取出每个日期
		    	    var date_new={};
		            for(var i=0;i<lineEventData.length;i++){
		            	//截取日期到月
		            	var key=lineEventData[i].key;
		            	var dateValue=key.substring(0,6);
		            	if(date_new[dateValue]!=undefined){
		            		var nnn = date_new[dateValue];
		            		date_new[dateValue] = nnn + lineEventData[i].value;
		            	}else{
			            	date_new[dateValue] = lineEventData[i].value;
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
				if(selectVal=="3"){
		    	    //先遍历X轴取出每个日期
		    	    var date_new={};
		            for(var i=0;i<lineEventData.length;i++){
		            	//截取日期到月
		            	var key=lineEventData[i].key;
		            	var dateValue=key.substring(0,4);
		            	if(date_new[dateValue]!=undefined){
		            		var nnn = date_new[dateValue];
		            		date_new[dateValue] = nnn + lineEventData[i].value;
		            	}else{
			            	date_new[dateValue] = lineEventData[i].value;
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
				if(selectVal=="4"){
		    	    //先遍历X轴取出每个日期
		    	    var date_new={};
		            for(var i=0;i<lineEventData.length;i++){
		            	//截取日期到月
		            	var key=lineEventData[i].key;
		            	var dateValue=getWeekNum(key);//周的计算方法
		            	if(date_new[dateValue]!=undefined){
		            		var nnn = date_new[dateValue];
		            		date_new[dateValue] = nnn + lineEventData[i].value;
		            	}else{
			            	date_new[dateValue] = lineEventData[i].value;
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
		    })
		}
		var val = 0;
		$('.right_top2').click(function(){
			val=$(this).attr("value");
			$('.popup').css('display','block');
			$('.zeZhao').css('display','block')
			$(".drop-down-content").empty();
			//渲染网站数下拉框数据
			var num = websiteStatistics.length > 10 ? 10 : websiteStatistics.length;
			for(var i=0;i<num;i++){
				$('.drop-down-content').append(' <li value="'+websiteStatistics[i].name+'" class="li_1 li">域名：'+websiteStatistics[i].name+'    数量：'+websiteStatistics[i].value+'</li>');
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
				showTimeLine(timeLineStatistics[keys]);
				
	    	});
			//点击时间线时，第一个li点击
			$(".li_1").first().click();		
		});
		$('.right_top3').click(function(){
			val=$(this).attr("value");
			$('.popup').css('display','block');
			$('.zeZhao').css('display','block')
			$(".drop-down-content").empty();
			//渲染网站数下拉框数据
			var num = sourUrl.length > 10 ? 10 : sourUrl.length;
			for(var i=0;i<num;i++){
				$('.drop-down-content').append(' <li value="'+sourUrl[i].name+'" class="li_1 li">网站：'+sourUrl[i].name+'    数量：'+sourUrl[i].value+'</li>');
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
				showTimeLine(timeLineSours[keys])
				
	    	});
			//点击时间线时，第一个li点击
			$(".li_1").first().click();		
		});
		
		//网站数时间线点击事件
		$('.sex').click(function(){
			val=$(this).attr("value");
			$('.popup').css('display','block');
			$('.zeZhao').css('display','block')
			$(".drop-down-content").empty();
			//渲染网站数下拉框数据
			var num = websiteRank.length > 10 ? 10 : websiteRank.length;
			for(var i=0;i<num;i++){
				if(websiteRank[i].name_key!="其他"){
					$('.drop-down-content').append(' <li value="'+websiteRank[i].name_key+'" class="li_1 li">国家：'+websiteRank[i].name_key+'    数量：'+websiteRank[i].value+'</li>');
				}
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
				showTimeLine(timeLineWebsite[keys])
				
	    	});
			//点击时间线时，第一个li点击
			$(".li_1").first().click();
		});
		$('.sex1').click(function(){
			val=$(this).attr("value");
			$('.popup').css('display','block');
			$('.zeZhao').css('display','block')
			//渲染报道数下拉框数据
			$(".drop-down-content").empty();
			var num = reportsRank.length > 10 ? 10 : reportsRank.length;
			for(var i=0;i<num;i++){
				if(reportsRank[i].name_key!="其他"){
					$('.drop-down-content').append(' <li value="'+reportsRank[i].name_key+'" class="li_1 li">国家：'+reportsRank[i].name_key+'    数量：'+reportsRank[i].value+'</li>');
				}
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
				showTimeLine(timeLineReports[keys])
				
	    	});
			//点击时间线时，第一个li点击
			$(".li_1").first().click();		
		});
	    //关闭弹出框
		$('.close_echart').click(function(){
			$('.dis_block1').css('display','none');
			//$('.zeZhao').css('display','none');
		})
		//关闭弹出框
		$('.out_4').click(function(){
			$('.popup').css('display','none');
			$('.zeZhao').css('display','none');
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
	   
	    //网站数地域排行柱状图
	    function websiteRankShow(websiteRank){
	    	var namedata=[];
	    	var valdata=[];
	    	var webNum = websiteRank.length>10?10:websiteRank.length;
	    	for(var i=0;i<webNum;i++){
	    		var name=websiteRank[i].name_key;
	    		var value=websiteRank[i].value;
	    		namedata.push(name);
	    		valdata.push(value);
	    	}
	    	var myChart= echarts.init(document.getElementById('countryActorOne'));
	    	option = { 
				grid: {
		        left: '5%',
		        right: '5%',
		        bottom: '5%',
		        top: '2%',
		        containLabel: true,
		        z: 22
		        },
			    xAxis: {
			        show: false,
			    },
			    tooltip: {
			        show:true,
			        formatter:"{b}:{c}"
			    },
			    yAxis: [{
			        show: true,
			        data: namedata,
			        inverse: true,
			        axisLine: {
			            show: false,
			            lineStyle:{
			                 color: '#fff'
			            }
			           
			        },
			        splitLine: {
			            show: false
			        },
			        axisTick: {
			            show: false
			        },
			        axisLabel: {
			            color: '#fff',
			            rich: {
			                lg: {
			                    backgroundColor: '#339911',
			                    color: '#fff',
			                    padding: 5,
			                    align: 'center',
			                    width: 15,
			                    height: 15,
			                },
			            },
			            fontSize:16,
			            interval:0,
                        //rotate:0,
                        formatter: function(value) {
			                 var res = value;
			                 if(res.length >3) {
			                     res = res.substring(0, 2) + "..";
			                 }
			                 return res;
			                }
			        }


			    }, {
			        show: true,
			        inverse: true,
			        data: valdata,
			        axisLabel: {
			            textStyle: {
			                fontSize:12,
			                color: '#fff',
			            },
			        },
			        axisLine: {
			            show: false
			        },
			        splitLine: {
			            show: false
			        },
			        axisTick: {
			            show: false
			        },

			    }],
			    series: [{
			        name: '角色1国家展示',
			        type: 'bar',
			        yAxisIndex: 0,
			        data: valdata,
			        barWidth: 15,
			        barCategoryGap:80,
			        itemStyle: {
			        	normal: {
			                color: {
			                    type: 'linear',
			                    x: 0,
			                    y: 0,
			                    x2: 0,
			                    y2: 1,
			                    colorStops: [{
	                                offset: 0,
	                                color: '#0286ff'
	                            },
	                            {
	                                offset: 0.5,
	                                color: '#027eff'
	                            },
	                            {
	                                offset: 1,
	                                color: '#00feff'
	                            }],
			                    globalCoord: false // 缺省为 false
			                },
			                barBorderRadius: 15,
			            }
			        },
			        label: {
			            normal: {
			                show: false,
			                position: 'inside',
			                formatter: '{c}'
			            }
			        },
			    }]
			};
	    	myChart.setOption(option);
	    }
	  //报道数地域排行柱状图
	    function reportsRankShow(reportsRank){
	    	var namedata=[];
	    	var valdata=[];
	    	var repNum = reportsRank.length>10?10:reportsRank.length;
	    	for(var i=0;i<repNum;i++){
	    		var name=reportsRank[i].name_key;
	    		var value=reportsRank[i].value;
	    		namedata.push(name);
	    		valdata.push(value);
	    	}
	    	var myChart= echarts.init(document.getElementById('typeActor1'));
	    	/* var namedata=['美国','中国','澳大利亚','加拿大','俄罗斯','英国','印度','日本','土耳其','伊朗']
	    	var valdata=[100,98,90,88,85,80,75,70,66,61] */
	    	option = { 
					grid: {
			        left: '5%',
			        right: '5%',
			        bottom: '5%',
			        top: '2%',
			        containLabel: true,
			        z: 22
			        },
			        tooltip: {
				        show:true,
				        formatter:"{b}:{c}"
				    },
				    //backgroundColor:"#1b2334",
				    xAxis: {
				        show: false
				    },
				    yAxis: [{
				        show: true,
				        data: namedata,
				        inverse: true,
				        axisLine: {
				            show: false,
				            lineStyle:{
				                 color: '#fff'
				            }
				        },
				        splitLine: {
				            show: false
				        },
				        axisTick: {
				            show: false
				        },
				        axisLabel: {
				            color: '#fff',
				            rich: {
				                lg: {
				                    backgroundColor: '#339911',
				                    color: '#fff',
				                    padding: 5,
				                    align: 'center',
				                    width: 15,
				                    height: 15,
				                },
				            },
				            fontSize:16,
				            interval:0,
	                        //rotate:0,
	                        formatter: function(value) {
				                 var res = value;
				                 if(res.length >3) {
				                     res = res.substring(0, 2) + "..";
				                 }
				                 return res;
				                }
				        }


				    }, {
				        show: true,
				        inverse: true,
				        data: valdata,
				        axisLabel: {
				            textStyle: {
				                fontSize:12,
				                color: '#fff',
				            },
				        },
				        axisLine: {
				            show: false
				        },
				        splitLine: {
				            show: false
				        },
				        axisTick: {
				            show: false
				        },

				    }],
				    series: [{
				        name: '角色2类型展示',
				        type: 'bar',
				        data: valdata,
				        barWidth: '15px',
				        yAxisIndex: 0,
				        barCategoryGap:80,
				        itemStyle: {
				        	 normal: {
				                 barBorderRadius: [0, 0, 30, 0],
				                 //每个柱子的颜色即为colorList数组里的每一项,如果柱子数目多于colorList的长度，则柱子颜色循环使用该数组
				                 color: new echarts.graphic.LinearGradient(
				                     0, 0, 0, 1,
				                     [{
				                             offset: 0,
				                             color: '#4b71b9'
				                         },
				                         {
				                             offset: 0.5,
				                             color: '#46b5f6'
				                         },
				                         {
				                             offset: 1,
				                             color: '#46b5f6'
				                         }
				                     ]
				                 )
				             }
				        },
				        label: {
				            normal: {
				                show: false,
				                position: 'inside',
				                formatter: '{c}'
				            }
				        },
				    }]
				};

	    	myChart.setOption(option);
	    }
	  function sourUrlShow(data){
		  var nameSum=[];
		  var valueSum=[];
		  var maxIndex=0;
		  for(var i=0;i<data.length;i++){
    		var name=data[i].name;
    		var value=data[i].value;
    		if(maxIndex<value){
    			maxIndex=value
    		}
    		nameSum.push(name);
    		valueSum.push(value);
   		  } 
		  var myChart= echarts.init(document.getElementById('organizationActor2'));
		  option = {
	  			    backgroundColor:"#1b2334",
	  			    //color: ['#3398DB'],
	  			    tooltip: {
	  			        trigger: 'axis',
	  			        axisPointer: {
	  			            type: 'line',
	  			            lineStyle: {
	  			                opacity: 0
	  			            }
	  			        },
	  			        formatter: function(prams) {
	  			            if (prams[0].data ===0) {
	  			                return prams[0].name+"：0"
	  			            } else {
	  			                return prams[0].name+"：" + prams[0].data
	  			            }
	  			        }
	  			    },
	  			    legend: {
	  			        data: ['直接访问', '背景'],
	  			        show: false
	  			    },
	  				dataZoom: {
	         		            type: 'slider',
	            		        textStyle:{
	          		        		color:"#fff"
	          		        	},
	          		        	start:0,
	          		        	end:10,
	         		        	showDataShadow :false
	                },
	  			    grid: {
	  			        left: '2%',
	  			        right: '2%',
	  			        bottom: '20%',
	  			        top: '3%',
	  			        //height: '85%',
	  			        containLabel: true,
	  			        z: 22
	  			    },
	  			    xAxis: [{
	  			        type: 'category',
	  			        gridIndex: 0,
	  			        data: nameSum,
	  			        axisTick: {
	  			            alignWithLabel: true
	  			        },
	  			        axisLine: {
	  			            lineStyle: {
	  			                color: '#fff'
	  			            }
	  			        },
	  			        axisLabel: {
	  			            show: true,
	  			             color: 'rgb(170,170,170)',
	  			             fontSize:16,
	  			             interval:0,
	                           rotate:0,
	  			             formatter: function(value) {
	  			                 var res = value;
	  			                 if(res.length >7) {
	  			                     res = res.substring(0, 5) + "..";
	  			                 }
	  			                 return res;
	  			                }
	  			        }
	  			    }],
	  			    yAxis: [{
	  			            type: 'value',
	  			            gridIndex: 0,
	  			            splitLine: {
	  			                show: false
	  			            },
	  			            axisTick: {
	  			                show: false
	  			            },
	  			            min: 0,
	  			            max: maxIndex,
	  			            axisLine: {
	  			                lineStyle: {
	  			                    color: '#fff'
	  			                }
	  			            },
	  			            axisLabel: {
	  			                color: 'rgb(170,170,170)',
	  			                formatter: '{value}'
	  			            }
	  			    }],
	  			    series: [{
	  			            name: '事件数',
	  			            type: 'bar',
	  			            barWidth: '15%',
	  			            xAxisIndex: 0,
	  			            yAxisIndex: 0,
	  			            itemStyle: {
	  			                normal: {
	  			                    barBorderRadius: 30,
	  			                    color: new echarts.graphic.LinearGradient(
	  			                        0, 0, 0, 1, [{
	  				                        offset: 0,
	  				                        color: '#00d386' // 0% 处的颜色
	  				                    }, {
	  				                        offset: 1,
	  				                        color: '#0076fc' // 100% 处的颜色
	  				                    }
	  			                        ]
	  			                    )
	  			                }
	  			            },
	  			            data: valueSum,
	  			            zlevel: 11

	  			        }
	  			    ]
	  			};
		  myChart.setOption(option);
	  }
	  //域名统计分析
	  function websiteStatisticsShow(data){
		  var nameSum=[];
		  var valueSum=[];
		  var maxIndex=0;
		  for(var i=0;i<data.length;i++){
	    		var name=data[i].name;
	    		var value=data[i].value;
	    		if(maxIndex<value){
	    			maxIndex=value
	    		}
	    		nameSum.push(name);
	    		valueSum.push(value);
	    	}
		  var myChart= echarts.init(document.getElementById('organizationActor1'));
		  option = {
		  			    backgroundColor:"#1b2334",
		  			    //color: ['#3398DB'],
		  			    tooltip: {
		  			        trigger: 'axis',
		  			        axisPointer: {
		  			            type: 'line',
		  			            lineStyle: {
		  			                opacity: 0
		  			            }
		  			        },
		  			        formatter: function(prams) {
		  			            if (prams[0].data ===0) {
		  			                return prams[0].name+"：0"
		  			            } else {
		  			                return prams[0].name+"：" + prams[0].data
		  			            }
		  			        }
		  			    },
		  			    legend: {
		  			        data: ['直接访问', '背景'],
		  			        show: false
		  			    },
		  				dataZoom: {
		         		            type: 'slider',
		            		        textStyle:{
		          		        		color:"#fff"
		          		        	},
		          		        	start:0,
		          		        	end:10,
		         		        	showDataShadow :false
		                },
		  			    grid: {
		  			        left: '2%',
		  			        right: '2%',
		  			        bottom: '20%',
		  			        top: '3%',
		  			        //height: '85%',
		  			        containLabel: true,
		  			        z: 22
		  			    },
		  			    xAxis: [{
		  			        type: 'category',
		  			        gridIndex: 0,
		  			        data: nameSum,
		  			        axisTick: {
		  			            alignWithLabel: true
		  			        },
		  			        axisLine: {
		  			            lineStyle: {
		  			                color: '#fff'
		  			            }
		  			        },
		  			        axisLabel: {
		  			            show: true,
		  			             color: 'rgb(170,170,170)',
		  			             fontSize:16,
		  			             interval:0,
		                           rotate:0,
		  			             formatter: function(value) {
		  			                 var res = value;
		  			                 if(res.length >7) {
		  			                     res = res.substring(0, 5) + "..";
		  			                 }
		  			                 return res;
		  			                }
		  			        }
		  			    }],
		  			    yAxis: [{
		  			            type: 'value',
		  			            gridIndex: 0,
		  			            splitLine: {
		  			                show: false
		  			            },
		  			            axisTick: {
		  			                show: false
		  			            },
		  			            min: 0,
		  			            max: maxIndex,
		  			            axisLine: {
		  			                lineStyle: {
		  			                    color: '#fff'
		  			                }
		  			            },
		  			            axisLabel: {
		  			                color: 'rgb(170,170,170)',
		  			                formatter: '{value}'
		  			            }
		  			    }],
		  			    series: [{
		  			            name: '事件数',
		  			            type: 'bar',
		  			            barWidth: '15%',
		  			            xAxisIndex: 0,
		  			            yAxisIndex: 0,
		  			            itemStyle: {
		  			                normal: {
		  			                    barBorderRadius: 30,
		  			                    color: new echarts.graphic.LinearGradient(
		  			                        0, 0, 0, 1, [{
		  				                        offset: 0,
		  				                        color: '#00d386' // 0% 处的颜色
		  				                    }, {
		  				                        offset: 1,
		  				                        color: '#0076fc' // 100% 处的颜色
		  				                    }
		  			                        ]
		  			                    )
		  			                }
		  			            },
		  			            data: valueSum,
		  			            zlevel: 11

		  			        }
		  			    ]
		  			};
		  myChart.setOption(option);
	  }
	  //时间线
	   function showTimeLine(data){
		   var data1=[];
	    	var data2=[];
	    	var maxIndex=0;
	    	var minIndex=0;
	    	for(var i=0;i<data.length;i++){
	    		var time=data[i].key;
	    		var value=data[i].value*1;
				if(maxIndex<value){
					maxIndex=value
				}
				if(minIndex>value){
					minIndex=value
				}
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
	    				right: '1%',
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
	    				min:minIndex,
	    				max:maxIndex,
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
	   //世界地图
	   function showMap(flagName,data){
	   		var myChart = echarts.init(document.getElementById('word_echart'));
       		//世界地图option所需要数据
            var maxValue=0;
            for(var i=0;i<data.length;i++){
            	var value=data[i].value;
            	if(maxValue<value){
            		maxValue=value
            	}
            }
            option = {
           		tooltip: {
   			        trigger: 'item',
   			        formatter: function (params) {
   			        	var value = 0;
   			        	if(!isNaN(params.value)){
   			        		value = (params.value + '').split('.')
   			        	}
   			            return "国家"+":"+ params.name +'<br/>' + flagName + ' : ' + value;
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
                      max: maxValue,
  			          text:['高','低'],
                      realtime: false,
                      calculable: true,
                      textStyle :{
  			        	  color:"#fff"
  			          },
                      inRange: {
  		                color: ['#ffffbf', '#fee090', '#fdae61', '#f46d43', '#d73027', '#a50026']
  		              }
                 },
                 series: [
                     {
                         name: '',
                         type: 'map',
                         mapType: 'world',
                         roam: true,
                         zoom:1.2,
                         itemStyle: {
		                 	normal: {
		                       borderWidth: 1, // 区域边框宽度
		                       borderColor: 'rgba(37, 88, 184, 0.8)', // 区域边框颜色
		                       areaColor: '#cecec6f2' ,// 区域颜色,
		                     }
		                 },
                         data: data
                     }
                 ]
            }
            
            
			
		   myChart.setOption(option);
	}
	   
	   
    </script>
</html>