<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<title>图谱展示</title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="shortcut icon" type="image/x-icon" href="<%=basePath%>/static/Visualization/base/ico.png"/>
<link rel="stylesheet" href="<%=basePath%>/static/css/style.css">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/jquery-1.11.1.min.js"></script>
<!--人工查询 -->
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/css/bootstrap.min.css"/>
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath %>/static//lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath %>/static/css/combo.select.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/perfect-scrollbar.css"/>
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window_zs.css"/><!-- 弹出提示框样式 -->
<script src="<%=basePath %>/static/js/config/config.js"></script>
<script src="<%=basePath%>/static/layui/layui.js"></script>
<link rel="stylesheet" href="<%=basePath%>/static/layui/css/layui.css">
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
		
	.layui-table-tool{
	    background-color: #344063!important;  
	    border: 1px solid #666!important; 
	}
	.layui-table-tool .layui-inline[lay-event] {
	    background-color: #00c1de!important; 
	    border: 0px solid #ccc;
	}
	.layui-table-tool .layui-inline[lay-event] {
	    background-color: #00c1de!important; 
	    border: 0px solid #ccc;
	}
	.layui-form-checkbox[lay-skin=primary] span {
	   color: #eee!important;
	}

      svg.wordCloud {
    	width: 1000px;
    	height: 500px;
      }
	  svg.wordCloud g {
		transform: translate(500px, 250px);
		-moz-transform: translate(500px, 250px);
		-webkit-transform: translate(350px, 250px);
	  }
	 .layui-table-page{
	 	text-align: right!important;
 	    padding: 16px 7px 0!important;
	 } 
	 .layui-laypage .layui-laypage-curr .layui-laypage-em{
	    background-color: #26B!important;
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
	  /*   border-style:solid; */
	    border-color: #666!important;
	    position: fixed!important;
	    bottom: 52px;
	}
	.layui-table-tool-panel li:hover{
	  	background:#666!important;
	  }
	 .layui-table-box{
	      position: relative!important;
	      height: 95%;
	  }
	  .layui-table-body {
	    position: relative;
	    overflow: auto;
	    margin-right: -1px;
	    margin-bottom: -1px;
	    height: 680px;
	}
	.layui-table-page, .layui-table-total{
		    border-width: 0px 0 0!important;
	}
	.layui-table th {
	    text-align: left;
	    font-weight: 800!important;
	}
	.index_bottom{
		overflow: hidden;
	}
	/* 弹出框样式 */
	.window-panel .content{
		color: black;
	}
	.tabs{
		height: 96%;
	}
	.layui-table-view{
		height: 95%;
	}
</style>
</head>
<body style="background:#101010;">
	<!-- 事件描述 -->
    <div class="index_top clearfix">
		<h3 class="fl title">图谱库分析 > 图谱展示</h3>
	</div>
	<div class="index_bottom">
		<div class="event_main" style="margin-top: -15px;height: 96%;">
		<input type="hidden" id="moduleCode" value="${moduleCode}">
        <!-- <div class="event_option">
            <ul class="fl eve">
                <li class="active" onclick="reloadTable('1')">图谱库一</li>
                <li onclick="reloadTable('2')">图谱库二</li>
                <li onclick="reloadTable('3')">图谱库三</li>
            </ul>
            <button class="fr" style="cursor: pointer;" onclick="ExportData()">导出</button>
        </div> -->
        <div class="table tabs">
            <%-- <table class="layui-table" id="dataTable" lay-data="{url:'${pageContext.request.contextPath}/dataManage/queryGraphData',request: {pageName:'pageIndex',limitName:'pageSize'},response: {countName:'total'},method:'post', page: true,limit:15,where:{'dataType':1},done:function(res){endLoad();hideDiv(res.allTotal);}}">
                <thead>
                    <!-- <tr>
                        <th lay-data="{field:'',align:'center'}" colspan="13">事件行为属性</th>
                        <th lay-data="{field:'',align:'center'}" colspan="15">事件发起者属性</th>
                        <th lay-data="{field:'', align: 'center'}" colspan="15">事件接收者属性</th>
                        <th lay-data="{field:'', align: 'center'}" colspan="6">事件属性</th>
                        <th lay-data="{field:'',align:'center'}" colspan="2">其他</th>
                    </tr> -->
                    <tr>
                        <th lay-data="{type:'numbers','align':'center',width:60}">序号</th>
                        <th lay-data="{field:'DATE',width:100}">日期</th>
                        <th lay-data="{field:'NUMARTS',width:80}">报道数</th>
                        <th lay-data="{field:'COUNTS',width:170}">冲突列表</th>
                        <th lay-data="{field:'THEMES',width:170}">主题列表</th>
                        <th lay-data="{field:'LOCATIONS',width:170}">地理位置</th>
                        <th lay-data="{field:'PERSONS',width:170}">人名集</th>
                        <th lay-data="{field:'ORGANIZATIONS',width:170}">组织集</th>
                        <th lay-data="{field:'CAMEOEVENTIDS',width:170}">ID列表</th>
                        <th lay-data="{field:'SOURCES',width:170}">事件源域名</th>
                        <th lay-data="{field:'SOURCEURLS',width:100}">源URL地址</th>
                    </tr>
                </thead>
            </table> --%>
            <table class="layui-table" id="dataTable"></table>
        </div>
    </div>
    <input type="hidden" value="1" id="dataType">
    <jsp:include page="./graph_tab2.jsp"></jsp:include>
	</div>
	<jsp:include page="../updateUserPassword.jsp"/>
</body>


<!-- 人工查询功能的日期 -->
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/base.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-select.min.js"></script>
<script src="<%=basePath %>/static/js/jquery.combo.select.js"></script>
<script src="<%=basePath %>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath %>/static/js/perfect-scrollbar.js"></script>
<script src="<%=basePath%>/static/js/sec2.js"></script>
<script src="<%=basePath%>/static/lib/jquery.pagination.js"></script>
<script src="<%=basePath%>/static/layui/layui.js"></script>
<link rel="stylesheet" href="<%=basePath%>/static/layui/css/layui.css">
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
<c:if test="${bgFlag == null or bgFlag == 1}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
</c:if>
<!-- 计算显示图的高度 -->	
<script src="<%=basePath%>/static/js/chartHeight.js" type="text/javascript"></script>
<!-- 人工查询js -->
<script src="<%=basePath %>/static/Visualization/rgQuery.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/downLoad.js"></script>
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<link rel="stylesheet" href="<%=basePath %>/static/css/event2.css"/>
<link rel="stylesheet" href="<%=basePath %>/static/css/event_show2.css"/>
<!-- 多选框样式以及js -->
<link rel="stylesheet" href="<%=basePath %>/static/css/hsCheckData.css"/>
<script type="text/javascript" src="<%=basePath%>/static/js/hsCheckData.js"></script>
<script type="text/javascript">
	$(function(){
		
		$(".quanzhong").hide();
		$(".baodaoshu").show();
		//处理配置
		handleConfigs();
		//控制Tone字段的显示问题
		gkgToneIsShow();
		//美化滚动条
		glorifyComboSelect();
	});
	
	function render(configId){
    	startLoad();
    	$.ajax({
    		url:'<%=basePath%>/search/graph_show_viz/'+configId,
    		type: 'POST',
    		dataType:"json",
    		success:function(data){
    			if(data=="-1"){
					endLoad();
					win.alertEx("加载失败");
				}
    			showTable(data.graphData,data.graphAllNum);
    			endLoad();
    		}
    	});
    }
	//这个方法是即时查询统一调用的方法名称
	function renderData(data){
		var da = data.graphInfoData;
		var num = data.allTotal;
		showTable(da,num);
	}
	function showTable(data,num){
		layui.use('table',function(){
			var table = layui.table;
			table.render({
				elem:'#dataTable',
				toolbar:true,
				defaultToolbar:['filter'],
				cols:[[
						{type:'numbers','align':'center',width:60,title:'序号',fixed:'true'},
						{field:'DATE','align':'center',width:100,title:'日期',fixed:'true'},
						{field:'NUMARTS','align':'center',width:80,title:'报道数',fixed:'true'},
						{field:'COUNTS','align':'center',width:170,title:'冲突列表',fixed:'true'},
						{field:'THEMES','align':'center',width:170,title:'主题列表',fixed:'true'},
						{field:'LOCATIONS','align':'center',width:170,title:'地理位置',fixed:'true'},
						{field:'PERSONS','align':'center',width:170,title:'人名集',fixed:'true'},
						{field:'TONE','align':'center',width:170,title:'情感值',fixed:'true'},
						{field:'ORGANIZATIONS','align':'center',width:170,title:'组织集',fixed:'true'},
						{field:'CAMEOEVENTIDS','align':'center',width:170,title:'ID列表',fixed:'true'},
						{field:'SOURCES','align':'center',width:170,title:'事件源域名',fixed:'true'},
						{field:'SOURCEURLS','align':'center',title:'源URL地址',fixed:'true'},
				       ]],
	       		data:data,
	       		page:true,
	       		limit:30,
	       		done:function(res){
	       			hideDiv(num);
	       		}
			})
		});
	}
	
	function hideDiv(obj){
		$(".layui-laypage-count").hide();
		$(".layui-laypage-limits").hide();
		var html = '<span style="padding:0 4px; border:1px solid #e6e6e6;">共'+obj+'条</span>';
		$('.layui-laypage').append(html);
	}
	//导出数据
	function ExportData(){
		startLoad();
		var contions = packData();
		$.ajax({
			url:'${pageContext.request.contextPath}/dataManage/creatGraphFile',
			type:'post',
			data:contions,
			dataType:'json',
			success:function(result){
				var fileName = result.fileName;
				var obj = {};
				obj.fileName = fileName;
				var str = JSON.stringify(obj);
				window.location.href="${pageContext.request.contextPath}/dataManage/exportGraphData?param="+encodeURI(encodeURI(str));
				endLoad();
			}
			
		});
	}
	//切换数据库操作
	function reloadTable(obj){
		var contions = {};
		if(obj==1){//数据库一
			contions.dataType = 1;
			$("#dataType").val(1);
		}else if(obj==2){//数据库二
			contions.dataType = 2;
			$("#dataType").val(2);
		}else{//数据库三
			contions.dataType = 3;
			$("#dataType").val(3);
		}
		layui.use('table',function(){
			startLoad();
        	var table = layui.table;
        	table.reload('dataTable',{
        		method:'post',
        		where:contions,
        		page:{curr:1},
        		done:function(res){
        			hideDiv(res.allTotal);
        			endLoad();
        		}
        	});
        });
	}
	function packData(){//包装条件数据
		var contions = {};//查询条件
		var dataType = $("#dataType").val();//数据源
		contions.dataType = dataType;
		var stDate = $("#stDate").val();
		var edDate = $("#edDate").val();
		var counts = $("#counts").val();
		var themes = $("#themes").val();
		var locations = $("#locations").val();
		var persons = $("#persons").val();
		var organizations = $("#organizations").val();
		var sources = $("#sources").val();
		var sourceurls = $("#sourceurls").val();
		var stNUMARTS = $("#stNUMARTS").val();
		var edNUMARTS = $("#edNUMARTS").val();
		if(stDate!=""){
			stDate = stDate.split("-")[0]+stDate.split("-")[1]+stDate.split("-")[2];
		}
		if(edDate!=""){
			edDate = edDate.split("-")[0]+edDate.split("-")[1]+edDate.split("-")[2];
		}
		contions.stDate = stDate*1;
		contions.edDate = edDate*1;
		contions.COUNTS = counts;
		contions.THEMES = themes;
		contions.LOCATIONS = locations;
		contions.PERSONS = persons;
		contions.ORGANIZATIONS = organizations;
		contions.SOURCES = sources;
		contions.SOURCEURLS = sourceurls;
		contions.stNUMARTS = stNUMARTS*1;
		contions.edNUMARTS = edNUMARTS*1;
		return contions;
	}
	//条件查询
	function queryData(){
		var contions = packData();
		layui.use('table',function(){
			startLoad();
        	var table = layui.table;
        	table.reload('dataTable',{
        		method:'post',
        		where:contions,
        		page:{curr:1},
        		done:function(res){
        			hideDiv(res.allTotal);
        			endLoad();
        		}
        	});
        });
		
	}
    </script>
</html>