<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<title>新闻库分析-新闻分析</title>
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

<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window_zs.css"/><!-- 弹出提示框样式 -->
<link rel="stylesheet" href="<%=basePath%>/static/layui/css/layui.css">
<script type="text/javascript" src="<%=basePath%>/static/js/jquery-2.0.3.min.js"></script>
<script src="<%=basePath %>/static/js/config/config.js"></script>
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
	.index_bottom {
		background: url(<%=basePath %>/static/images/beij.png) no-repeat;
		background-size:  100%;	
	}
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
	/*  .table .layui-table-header .layui-table th{
		background: #344063!important;
		color:#616161;
   }  */
    .layui-table-cell .laytable-cell-1-0-0 span{
    	color:#fff;
   }
   .layui-table-cell {
    height: 28px;
    line-height: 28px;
    padding: 0 15px;
    text-align: center;
    position: relative;
    box-sizing: border-box;
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
  .layui-table-body::-webkit-scrollbar-track{
    background: #1b2334!important;
    border-radius:1px!important;
 }
 .layui-table-body::-webkit-scrollbar-thumb{
    background: #666!important;
    border-radius:1px!important;
 }
 .layui-table  tr:hover{
  	background:#1b2334!important;
  }
  .layui-laypage a,.layui-laypage span{
 	background:#1d2334 !important;
 	color:#fff !important;
 	border:1px solid #aaaaee !important;
 	border-radius:3px;
 	margin:0 4px !important;
 	height:20px !important;
 	line-height:20px !important;
 } 
 .layui-laypage-em{
 	background:#1d2334 !important;
 }
 .layui-laypage-limits,.layui-laypage-btn,.layui-laypage-skip input{
 	background:#1d2334 !important;
 	color:#fff;
 	height:20px !important;
 	line-height:20px !important;
 }
 .layui-laypage select{
 	border-color:#aaaaee !important ;
 }
 .layui-laypage-limits{
 	border:none !important;
 }
.layui-laypage-limits select{
	background:#1d2334 !important;
	color:#fff;
	padding:0 !important;
}
.layui-box .layui-laypage-skip{
	border:none !important;
}
.layui-laypage input,.layui-laypage button{
	border-color:#aaaaee !important;
}
.layui-table-tool-panel {
  background:#1d2334 !important;
  border:1px solid #1b2334;
}
.layui-table-page {
    text-align: right!important;
    border-top: 1px;
    bottom: 0px;
}
.layui-form-checkbox[lay-skin=primary] span {
   color: #eee;
}
.layui-table-tool-panel li:hover{
  	background:#666!important;
  }
  .layui-table-box{
      position: relative;
    overflow-y: auto;
      height: 292px!important;
  }
  .layui-table-body {
    position: relative;
    overflow: auto;
    margin-right: -1px;
    margin-bottom: -1px;
    height: 250px;
}
 .layui-table-box::-webkit-scrollbar {
    width: 10px;
    height: 10px;
    /*background-color: #ddd;*/
}
 .layui-table tbody tr:hover, .layui-table thead tr, .layui-table-click, .layui-table-header, .layui-table-hover, .layui-table-mend, .layui-table-patch, .layui-table-tool, .layui-table-total, .layui-table-total tr, .layui-table[lay-even] tr:nth-child(1n) {
    background-color: #344063!important; 
}	
.layui-table td, .layui-table th, .layui-table-col-set, .layui-table-fixed-r, .layui-table-grid-down, .layui-table-header, .layui-table-page, .layui-table-tips-main, .layui-table-tool, .layui-table-total, .layui-table-view, .layui-table[lay-skin=line], .layui-table[lay-skin=row] {
    border-width: 1px;
    border-style: solid;
    border-color: #1b2334;
} 
	.left_top {
        width: 49%;
	    height: 398px;
	    border: 1px solid #4c5367;
	    position: absolute;
	    background-color: rgba(29,34,53,0.7);
	    left:10px;
	    top:46px;
	}
	.left_bottom {
        width: 49%;
	    height: 398px;
	    border: 1px solid #4c5367;
	    position: absolute;
	    bottom: 46px;
	    background-color: rgba(29,34,53,0.7);
	    left:10px;
	}
	.right_top{
		width: 49%;
	    height: 398px;
	    border: 1px solid #4c5367;
	    position: absolute;
	    right: 10px;
	    background-color: rgba(29,34,53,0.7);
	    top:46px;
	}
	.right_bottom {
        width: 49%;
	    height: 398px;
	    border: 1px solid #4c5367;
	    position: absolute;
	    right: 10px;
	    bottom: 46px;
	    background-color: rgba(29,34,53,0.7);
	}
	.right_bottom1 {
		width: 46%;
		height: 31px;
		background: url(<%=basePath %>/static/images/bg_chang.png) no-repeat;
		position: absolute;
		left: 40%;
		margin-top: -1px;
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
	    height: 89%;
	    position: absolute;
	    top: 7%;
	}
	.right_bottom8 {
	    width: 100%;
	    height: 89%;
	    position: absolute;
	    top: 7%;
	}
	.right_bottom3 {
	    width: 100%;
	    height: 89%;
	    position: absolute;
	    top: 8%;
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
	
	 .ecircle{
		width:15px;
		height:15px;
		border:1px solid rgba(0,193,222,1);
		border-radius:50%;
		display:inline-block;
	 	margin:0 2px -2px 2px;
	 	cursor: pointer;
	}
	.ecircleon{
		background:rgba(0,193,222,1); 
	}
	
   .right_bottom1 .time{
	    float: right;
	    margin-top: 17px;
	    margin-right: -42px;
   }
   
   
   /*实体切换*/
   .country {
    	display: inline-block;
    	height: 26px;
    	width: 73px;
    	transform: skew(20deg);
    	border-radius: 3px;
    	border: 1px solid #00aeff;
    	background-color: #00aeff;
    	cursor: pointer;
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
     .middle_box {
		position: absolute;
	    width: 30%;
	    height: 3.14%;
	    left: 2%;
	    top: 3.7%;
	    color: white;
	    z-index: 999;
	}
	/*聚类分析-表格*/
	.table_box{
		width: 100%;
		height: 90%;
	}
	.table_page{
		width: 100%;
		height: 10%;
	}
	.table_bt:hover{
		color: red;
	}
	.table_bt{
		cursor: pointer;
	}
	.event_desc{
	    text-overflow: ellipsis;
	    white-space: nowrap;
	    overflow: hidden;
	    width: 70%;
	}
	/*遮罩*/
	.zeZhao {
		width: 100%;
		height: 100%;
		background: black;
		opacity: 0.4;
		display: none;
		position: absolute;
		top: 0;
		left: 0;
		z-index: 1000;
	}
	/*弹出框*/
	.outBox {
		width: 86%;
	    height: 58%;
	    border: 1px solid #1c80b9;
	    position: absolute;
	    left: 7%;
	    top: 20%;
	    display: none;	
	    z-index: 1001;
	    background: #1d2235;
	    overflow:hidden;
	    border-radius: 10px;
	}
	.out_1 {
		width: 40%;
		height: 32px;
		position: absolute;
		left: 43%;
		background: url(<%=basePath %>/static/images/bg_title.png) no-repeat;
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
	.span_8 {
		position: absolute;
		left: 9.8%;
		top: 5px;
		color: white;
		font-size: 14px;
		font-family: SimSun;
		font-weight: bold;
	}
	/*弹出框-新闻*/
	.content_box{
	    height: 470px;
   		margin-top: 35px;
		overflow-x: hidden;
        overflow-y: auto;
   		
	}
	.news_content {
		margin: 32px 35px 0;
		border-bottom: 1px solid #4b546e;
	}
	
	.news_content:last-child {
		border: none;
	}
	
	.news_content h5 {
		width: 400px;
		color: #287fcb;
		font-size: 14px;
		text-decoration: underline;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		font-family: "microsoft yahei";
		cursor: pointer;
	}
	
	.news_content h5 span {
		color: #ff000a;
	}
	
	.news_content .and {
		margin: 12px 0;
		color:#d8cfcf;
	}
	
	.news_content .and .url {
		color: #2b7c32;
	}
	
	.news_content .and .time {
		color: #bdcae6;
	}
	
	.news_content p {
	    max-height: 71px;
	    color: #aabcef;
	    overflow-y: auto;
	    height: 50px;
	}
	
	
	 /*滚动条样式*/
        .news_content p::-webkit-scrollbar {/*滚动条整体样式*/
            width: 8px;     /*高宽分别对应横竖滚动条的尺寸*/
            height: 8px;
        }
        .news_content p::-webkit-scrollbar-thumb {/*滚动条里面小方块*/
            border-radius: 5px;
            -webkit-box-shadow: inset 0 0 5px rgba(0,0,0,0.2);
            background: rgba(0,0,0,0.2);
        }
        .news_content p::-webkit-scrollbar-track {/*滚动条里面轨道*/
            -webkit-box-shadow: inset 0 0 5px rgba(0,0,0,0.2);
            border-radius: 0;
            background: rgba(0,0,0,0.1);
        }
        
	    /*滚动条样式*/
        .content_box::-webkit-scrollbar {/*滚动条整体样式*/
            width: 8px;     /*高宽分别对应横竖滚动条的尺寸*/
            height: 8px;
        }
        .content_box::-webkit-scrollbar-thumb {/*滚动条里面小方块*/
            border-radius: 5px;
            -webkit-box-shadow: inset 0 0 5px rgba(0,0,0,0.2);
            background: rgba(0,0,0,0.2);
        }
        .content_box::-webkit-scrollbar-track {/*滚动条里面轨道*/
            -webkit-box-shadow: inset 0 0 5px rgba(0,0,0,0.2);
            border-radius: 0;
            background: rgba(0,0,0,0.1);
        }
        
         /*列表超出框样式*/
        .layui-table-tips-main {
		    margin: -44px 0 0 -1px;
		    max-height: 150px;
		    padding: 8px 15px;
		    font-size: 14px;
		    overflow-y: auto;
		    background-color: #1b2334;
		    color: #fff;
		}
		
		
		 /*滚动条样式*/
        .layui-table-tips-main::-webkit-scrollbar {/*滚动条整体样式*/
            width: 8px;     /*高宽分别对应横竖滚动条的尺寸*/
            height: 8px;
        }
        .layui-table-tips-main::-webkit-scrollbar-thumb {/*滚动条里面小方块*/
            border-radius: 5px;
            -webkit-box-shadow: inset 0 0 5px rgba(0,0,0,0.2);
            background: rgba(0,0,0,0.2);
        }
        .layui-table-tips-main::-webkit-scrollbar-track {/*滚动条里面轨道*/
            -webkit-box-shadow: inset 0 0 5px rgba(0,0,0,0.2);
            border-radius: 0;
            background: rgba(0,0,0,0.1);
        }
</style>
</head>
<body>
    <div class="index_top clearfix">
		<h3 class="fl title">新闻库分析 >新闻分析</h3>
	</div>
	<div class="index_bottom">
	<input type="hidden" id="moduleCode" value="${moduleCode}">
	
	<!-- 遮罩 -->
	<div class="zeZhao"></div>
	<!-- 显示图 -->
	<div class="data show">
		<!-- 弹出框 -->
		<div class="outBox" id="outBox">
			<div class="out_1">
				<span class="span_8">聚类详情</span>
			</div>
			<div class="out_4"></div>
			<div class="content_box flow-default" id="LAY_demo1">
				
			</div>
		</div>

		<div class="left_top">
        	<div class="right_bottom1">
        		<span class="span_7" id="staticsRanks">新闻时间线</span>
        		<!-- 时间粒度切换 -->
        		<div class="time">
					<span>时间粒度：</span>
					<span class="circle" value="3"></span><span>年</span><span class="circle" value="2"></span><span>月</span><span class="circle" value="4" id="weekCondtion"></span><span>周</span><span class="circle circleon" value="1" id="dayCondtion"></span><span>日</span>
				</div>
        	</div>
        	<div class="right_bottom3" id="newstimeline"></div>
        </div>
        
        <div class="left_bottom">
        	<div class="middle_box">
				<span class="country astleve">
				<span class="country1 astleve">人物</span>
				</span>
				<span class="Province astleve">
				<span class="Province1" >组织</span>
				</span>
				<span class="city astleve">
				<span class="city1" >地点</span>			
				</span>
			</div>
        	<div class="right_bottom1">
        		<span class="span_7">实体分析</span>
        	</div>
        	<div class="right_bottom2" id="wordkey"></div>
        </div>
        <div class="right_top">
        	<div class="right_bottom1">
        		<span class="span_7" >情感时间线</span>
        		<!-- 时间粒度切换 -->
        		<div class="time">
					<span>时间粒度：</span>
					<span class="ecircle" value="3"></span><span>年</span><span class="ecircle" value="2"></span><span>月</span><span class="ecircle" value="4" id="weekCondtions"></span><span>周</span><span class="ecircle ecircleon" value="1" id="dayCondtions"></span><span>日</span>
				</div>
        	</div>
        	<div class="right_bottom3" id="toneEventLine"></div>
        </div>
        <div class="right_bottom">
        	<div class="right_bottom1">
        		<span class="span_7" >聚类分析</span>
        	</div>
        	<div class="right_bottom2">
        		<!-- 表格 -->
        		<div class="table_box">
        			<table class="layui-table" id="dataTable" lay-filter="dataTable">
						
					</table>
        		</div>
        		<!-- 分页 -->
        	</div>
        </div>
	</div>
	<!-- 页面底部收缩 -->
	<jsp:include page="news_tab1.jsp"></jsp:include>
	</div>
	<!-- 修改密码 -->
	<jsp:include page="../updateUserPassword.jsp"/>
</body>
    
<!-- 人工查询功能的日期 -->
<script src="<%=basePath%>/static/layui/layui.js"></script>
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
<script type="text/javascript" src="<%=basePath%>/static/Visualization/downLoad.js"></script>
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<script type="text/javascript" src="<%=basePath%>/static/js/echarts.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/chartUtil/echarts.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/echarts-wordcloud.min.js"></script>
<script type="text/javascript">
    $(function(){
    	//处理配置
		handleConfigs();
		//美化滚动条
		glorifyComboSelect();
    });
    
    //定义全局的配置ID,获取配置信息中的数据源信息（关联配置的用拼接表名、新闻配置产生的用对应的数据源）
	var render_pzid;
    //渲染图表
    function render(configId){
    	render_pzid = configId;
		startLoad();
		$.ajax({
			url:'<%=basePath %>/search/news_analysis_viz/'+configId,
			type: 'POST',
			dataType:"json",
			success:function(data){
				if(data == "-1"){
					endLoad();
					win.alertEx("获取结果信息数据失败");
				}else{
					renderData(data);
					endLoad();
				}
			}
		});
	}
    
    //渲染图表
    var personData=[];
    var orgData=[];
    var placeData=[];
    var newsTimeLine=[];
    var toneTimeLine=[];
	function renderData(data){
		clusterList = data.clusterList;
		newsTimeLine = data.newsTimeLine;
		toneTimeLine = data.toneTimeLine;
		personData = data.personData;
		orgData = data.orgData;
		placeData = data.placeData;
    	showNewsTimeLine(newsTimeLine);
    	showToneTimeLine(toneTimeLine);
    	$('.country').click();
    	showClusterList(clusterList);
	}
    //聚类分析列表
    function showClusterList(data){
    	layui.use('table',function(){
			var table = layui.table;
			//var element=layui.element;
			table.render({
				elem:'#dataTable',
				cols:[[
				    {type:'numbers','align':'center',width:60,title:'序号'},
					{field:'eventDescription','align':'center',title:'事件描述'},
					{field:'numberNews','align':'center',width:100,title:'涉及新闻数'},
					{fixed: 'right', 'align':'center',title:'操作',width:120, toolbar: '#barDemo'}
				     ]],
	       		data:data,
	       		page:true,
	       		limit:6,
	       		done:function(res){
	       			//element.init();
	       			/* hideDiv(num); */
	       		}
			})
			
		});
    }
    layui.use('table', function(){
    	  var table = layui.table;
    	  var layer = layui.layer;
    	  //监听工具条
    	  table.on('tool(dataTable)', function(obj){
    	     var data = obj.data;
    	     if(obj.event === 'del'){
    	    	 layer.alert('下载行：<br>'+ JSON.stringify(data))
    	    } else if(obj.event === 'edit'){
    	    	var data = obj.data;
    	    	var ids=data.ids;
    	    	$('.outBox').css('display','block');
    			$('.zeZhao').css('display','block');
    			 $("#LAY_demo1").empty();
    		    layui.use('flow', function () {
    		    	 var page = 3;
    		         var $ = layui.jquery; //不用额外加载jQuery，flow模块本身是有依赖jQuery的，直接用即可。
    		         var flow = layui.flow;
    		         flow.load({
    		             elem: '#LAY_demo1', //指定列表容器
    		             scrollElem: '#LAY_demo1',
    		             done: function (page,next) {
    		                 //通过ids集合访问后台数据
    		                 var idsList = ids.split(",");
    		                 var pageNum = idsList.length%10 > 0 ? idsList.length/10+1 : idsList.length/10;
    		                 var idsListContion = "";
    		                 for(var i=(page-1)*10;i<page*10;i++){
    		                	 //idsListContion.push(idsList[i]+"");
    		                	 idsListContion += idsList[i]+",";
    		                 }
    		                $.ajax({
    		         			url:'<%=basePath%>/twoQueryData/flowNewAnalysisData',
    		         			type: 'POST',
    		         			data:{"idsListContion":idsListContion,"pzid":render_pzid}, 
    		         			dataType:"json",
    		         			success:function(data){
    		         				if(data.msg=="success"){
										var newsList = data.resultData;
										var lis = [];
										for(var i=0; i<newsList.length; i++){
		    		            			var news_html ='<div class="news_content">'+    
		    		                            '<h5 onclick="detail(\''+newsList[i].o_url+'\')">'+((page-1)*10+i+1)+'. '+newsList[i].s_title+'</h5>'+
		    		                            '<div class="and">网站：'+
		    		                                '<span class="url">'+newsList[i].i_sn+'</span> 发布时间：<span class="time">'+packTime(newsList[i].o_gt)+'</span>'+
		    		                            '</div>'+
		    		                            '<p>'+newsList[i].s_cont+'</p>'+
		    		                       	'</div>';
		    		            			lis.push(news_html);	
		    		            		}
    		         					//执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
    		         		        	//pageNum为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
    		         					next(lis.join(''), page < pageNum);
    		         				}else{
    		         					win.alertEx("加载聚类分析详情失败");
    		         				}
    		         				
    		         			}
    		         		});
    		                 
    		                 
    		       		 }
    		         });
    		     });
    	    }
    	  });
    });
    //新窗口打开连接
	function detail(obj){
        window.open(obj);
    }
    //格式化时间戳
    function packTime(dateTime){
		var date = new Date(dateTime);	
		Y = date.getFullYear();
		M = date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1;
		D = date.getDate < 10 ? '0'+date.getDate() : date.getDate();
		h = date.getHours() < 10 ? '0'+date.getHours() : date.getHours();
		m = date.getMinutes() < 10 ? '0'+date.getMinutes() : date.getMinutes();
		s = date.getSeconds() < 10 ? '0'+date.getSeconds() : date.getSeconds();
		return Y+"-"+M+"-"+D+" "+h+":"+m+":"+s;
    }
    //新闻时间线
    function showNewsTimeLine(data){
    	   var data1=[];
	    	var data2=[];
	    	var maxIndex=0;
	    	var minIndex=0;
	    	for(var i=0;i<data.length;i++){
	    		var time=data[i].name;
	    		var value_tem =data[i].value;
				if(value_tem > maxIndex){
					maxIndex=value_tem;
				}
	    		data1.push(time);
	    		data2.push(value_tem);
	    	}
	    	var myChart= echarts.init(document.getElementById('newstimeline'));
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
	    				top: '15%',
	    				left: '10%',
	    				right: '5%',
	    				bottom: '18%',
	    				//containLabel: true,
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
	    	myChart.setOption(option);
		 	window.onresize=function (){
			    myChart.resize();
	        }
    }
  	//组装数据
	function getDataByCat(cat,data){
        var len = data.length;
        var ret=[];
        for(var i =0 ;i<len;i++)
        {
            ret[i] = data[i][cat];
        }
        return ret;
    }
  	//情感时间线折线图
    function showToneTimeLine(data_dic){
    	var data_date=[];
		for(var i=0;i<data_dic.length;i++){
			var time = data_dic[i].key;
			data_date.push(time);
		}
		var myChart = echarts.init(document.getElementById('toneEventLine'));
		var	legendData=["正向情感均值","负向情感均值"];
		var option = {
				backgroundColor: '#1b233482',
          		toolbox: {
      		        feature: {
      		            dataZoom: {
      		                yAxisIndex: 'none'
      		            },
      		            restore: {},
      		            saveAsImage: {},
    		            dataView: {}
      		        },
      		        top:20
      		    }, 
      		    color:["#51D368","#e32f46"],
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
  			        trigger: "axis",
  			        axisPointer: { // 坐标轴指示器，坐标轴触发有效
  			            type: 'line', // 默认为直线，可选为：'line' | 'shadow'
  			        },
  			        //formatter: '{b}<br />{a0}: {c0}<br />{a1}: {c1}<br />',
  			        backgroundColor: 'rgba(0,0,0,0.7)', // 背景
  			        padding: [8, 10], //内边距
  			        extraCssText: 'box-shadow: 0 0 3px rgba(255, 255, 255, 0.4);', //添加阴影
  			    },
          	    legend: {
  			        textStyle: {
  			            color: '#fff',
  			            fontSize: '12'
  			        },
          	    	//selectedMode:false,
          	    	data:legendData
          	    },
          	    grid: {
	   		        left: '5%',
	   		        right: '5%',
	   		        bottom: '15%',
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
	          	            data: data_date
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
	                                name:legendData[0],
	                                type:'line',
	                                data:getDataByCat("forword_value",data_dic),
	                                smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
	                                symbolSize:10,
	                                symbol: 'circle',
	                                itemStyle: {
	            			            normal: {
	            			            	color:'#51D368',
	            			                lineStyle: {
	            			                	color:'#51D368',
	            			                    width: 1,
	            			                    type: 'solid' //'dotted'虚线 'solid'实线
	            			                },
	            			                barBorderRadius: 0,
	            			                label: {
	            			                    show: false,
	            			                },
	            			                borderWidth: 2,
	            			                borderColor:'#51D368'
	            			            }
	            			        },
	                            },
	                            {
	                                name:legendData[1],
	                                type:'line',
	                                data:getDataByCat("negative_value",data_dic),
	                                smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
	                                symbolSize: 10,
	                                symbol: 'circle',
	                                itemStyle: {
	            			            normal: {
	            			            	color:'#e32f46',
	            			                lineStyle: {
	            			                	color:'#e32f46',
	            			                    width: 1,
	            			                    type: 'solid' //'dotted'虚线 'solid'实线
	            			                },
	            			                barBorderRadius: 0,
	            			                label: {
	            			                    show: false,
	            			                },
	            			                borderWidth: 2,
	            			                borderColor:'#e32f46'
	            			            }
	            			        },
	                            }
	                        ]
		          	};	
			  myChart.setOption(option);
	          //调节echarts图表自适应
	          window.onresize=function (){
	        	  myChart.resize();
	          }
    }
  	//词云
  	function showWordCloud(data){
  		var myChart= echarts.init(document.getElementById('wordkey'));
		var option = {
		    title: {
		        show:false,
		        text: '热点分析'
		    },
		    //backgroundColor: '#178bd4',
		    tooltip: {
		        show: true,
		        textStyle:{
		        	fontSize:'18'
		        }
		    },
		    series: [{
		        type: 'wordCloud',
		        sizeRange: [25,70],
		        rotationRange: [-45, 90],
		        textPadding: 0,
		        autoSize: {
		            enable: true,
		            minSize: 20
		        },
		        textStyle: {
		            normal: {
		                color: function() {
		                    return 'rgb(' + [
		                        Math.round(Math.random() * 255),
		                        Math.round(Math.random() * 255),
		                        Math.round(Math.random() * 255)
		                    ].join(',') + ')';
		                }
		            },
		            emphasis: {
		                shadowBlur: 10,
		                shadowColor: '#333'
		            }
		        },
		        data: data
		    }]
		    
		    
		};
		myChart.setOption(option); 
		window.onresize = function(){
			myChart.resize();
		}
  	}
	///时间线数据力度切换方法
	function packDataType(date_data,len){
		 var date_new={};
         for(var i=0;i<date_data.length;i++){
         	//截取日期到月
         	var key=date_data[i].name;
         	var dateValue=key.substring(0,len);
         	if(len==2){
         		dateValue = getWeekNum(key+"");
         	}
         	if(date_new[dateValue]!=undefined){
         		var nnn = date_new[dateValue];
         		date_new[dateValue] = nnn + date_data[i].value;
         	}else{
            	date_new[dateValue] = date_data[i].value;
         	}
         }
         var quadclass_value=[];
         for(var obj in date_new){
     		var d1={
   				name:obj,
     			value:parseInt(date_new[obj].toFixed(2))
   	      	}	
     		quadclass_value.push(d1);
		 }
         showNewsTimeLine(quadclass_value);
	}
    //新闻时间粒度切换
	$('.circle').on('click',function(){
		$(this).addClass('circleon').siblings('.circle').removeClass('circleon');
		var selectVal=$(this).attr('value');
		if(selectVal=="1"){
			showNewsTimeLine(newsTimeLine);
		}
		if(selectVal=="2"){
			packDataType(newsTimeLine,6);
        }
		if(selectVal=="3"){
			packDataType(newsTimeLine,4);
        }
		if(selectVal=="4"){
			packDataType(newsTimeLine,2);
        }
	})
	function packDataByType(quadclass_data,len){
	   var date_news={};
       for(var i=0;i<quadclass_data.length;i++){
          	//比较每一个全量数据的日期是否包含截取到月的
      		var date_str=quadclass_data[i].key;
          	var forword_value = quadclass_data[i]["forword_value"];
          	var negative_value = quadclass_data[i]["negative_value"];
      		var data_string=date_str+"";
      		var date_class=data_string.substring(0,len);
      		if(len==2){
      			date_class = getWeekNum(data_string);
      		}
      		if(date_news[date_class] != undefined){
              	var forword_value1 = date_news[date_class]["forword_value"];
              	var negative_value1 = date_news[date_class]["negative_value"];
      			date_news[date_class]["forword_value"] = forword_value1 + forword_value;
      			date_news[date_class]["negative_value"] = negative_value1 + negative_value;
      			
      		}else{
      			var date_new = {};
      			date_new["forword_value"] = forword_value;
      			date_new["negative_value"] = negative_value;
      			date_news[date_class] = date_new;
      		}
       }
       var quadclass_value=[];
       for(var obj in date_news){
      		var date_new = date_news[obj];
          	var d1={
       			key:obj,
       			forword_value:date_new["forword_value"].toFixed(2),
       			negative_value:date_new["negative_value"].toFixed(2)
        	}
          	quadclass_value.push(d1);
       }
       showToneTimeLine(quadclass_value);
	}
	//情感时间粒度切换
	$('.ecircle').on('click',function(){
		$(this).addClass('ecircleon').siblings('.ecircle').removeClass('ecircleon');
		var selectVal=$(this).attr('value');
		if(selectVal=="1"){
			showToneTimeLine(toneTimeLine);
		}
		if(selectVal=="2"){
			packDataByType(toneTimeLine,6);
        }
		if(selectVal=="3"){
			packDataByType(toneTimeLine,4);
        }
		if(selectVal=="4"){
			packDataByType(toneTimeLine,2);
        }
	})
	
	
	//实体切换
    $('.Province').click(function(){
    	$('.city').css("background-color","#024a73");
    	$('.city1').css("color","#FFF");
    	$('.Province').css("background-color","#00aeff");
    	$('.Province1').css("color","#FFF");
    	$('.country').css("background-color","#024a73");
    	$('.country1').css("color","#FFF");
    	showWordCloud(orgData);
    })
    $('.city').click(function(){
    	$('.city').css("background-color","#00aeff");
    	$('.city1').css("color","#FFF");
    	$('.Province').css("background-color","#024a73");
    	$('.Province1').css("color","#FFF");
    	$('.country').css("background-color","#024a73");
    	$('.country1').css("color","#FFF");
    	showWordCloud(placeData);
    })
    $('.country').click(function(){
    	$('.city').css("background-color","#024a73");
    	$('.city1').css("color","#FFF");
    	$('.Province').css("background-color","#024a73");
    	$('.Province1').css("color","#FFF");
    	$('.country').css("background-color","#00aeff");
    	$('.country1').css("color","#FFF");
    	showWordCloud(personData);
    })
    //弹出框
    $('.pop_bt').click(function(){
		$('.outBox').css('display','block');
		$('.zeZhao').css('display','block')
	});
    //关闭弹出框
	$('.out_4').click(function(){
		$('.outBox').css('display','none');
		$('.zeZhao').css('display','none');
		//<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">下载</a>
	})
    </script>
    <script type="text/html" id="barDemo">
  		<a class="layui-btn layui-btn-xs" lay-event="edit">详情</a>
	</script>
</html>