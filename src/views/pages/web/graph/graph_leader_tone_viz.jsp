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
<title>人物监测</title>
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
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/js/amcharts/export/export.css"/>
<link rel="stylesheet" href="<%=basePath%>/static/layui/css/layui.css">
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
    height: 54px;
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
    margin-left: 106px;
}
.lboTime{
     height:360px;
    width: 30%;
    margin-left:-26px;
}
.btn-group.btns {
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
   background-color: rgba(0,136,204,1);
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
    margin-left: 5%;
}
.close_echarts {
    width: 20px;
    height: 20px;
    color: #fff;
    font-size: 18px;
    float: right;
    margin: -30px 20px 0 0;
    background: url(<%=basePath%>/static/images/del_date.png)  no-repeat;
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
  
 .layui-table-body {
    height: 704px;
    position: relative;
    overflow-y: auto;
    margin-right: -1px;
    margin-bottom: -1px;
}
 .layui-table-body::-webkit-scrollbar {
    width: 10px;
    height: 10px;
   /*  background-color: #ddd; */
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
.layui-table-header .layui-table-cell{
	height:28px;
}

.laytable-cell-1-0-2 {
    height: 29px;
}
.laytable-cell-1-0-3 {
    height: 29px;
}
.laytable-cell-1-0-3 {
    height: 29px;
}
.laytable-cell-1-0-4 {
    height: 29px;
}
.laytable-cell-1-0-6 {
    height: 29px;
}
.laytable-cell-1-0-7 {
    height: 29px;
}
.laytable-cell-1-0-8 {
    height: 29px;
}
.laytable-cell-1-0-0 {
    height: 29px;
}


.laytable-cell-2-0-2 {
    height: 29px;
}
.laytable-cell-2-0-3 {
    height: 29px;
}
.laytable-cell-2-0-5 {
    height: 29px;
}
.laytable-cell-2-0-4 {
    height: 29px;
}
.laytable-cell-2-0-6 {
    height: 29px;
}
.laytable-cell-2-0-7 {
    height: 29px;
}
.laytable-cell-2-0-8 {
    height: 29px;
}
.laytable-cell-2-0-0 {
    height: 29px;
}


.layui-table td, .layui-table th, .layui-table-col-set, .layui-table-fixed-r, .layui-table-grid-down, .layui-table-header, .layui-table-page, .layui-table-tips-main, .layui-table-tool, .layui-table-total, .layui-table-view, .layui-table[lay-skin=line], .layui-table[lay-skin=row] {
    border-width: 1px;
    border-style: solid;
    border-color: #9E9E9E;
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
		display:none;
		background-color:rgba(0,0,0,0.5);
}
.table {
    width: 100%;
    margin-top: -16px;
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
         color: #f7f7f7;
         /* placeholder字体大小  */
         font-size: 12px;
         /* placeholder位置  */
         text-align: right;
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
.col-md-12 {
    width: 100%;
    z-index: 100;
}
</style>
<body class="peizhi_bg">
	<div class="index_top pos_fix">
		<h3 class="fl title">态势监测 > 人物监测</h3>
		<input type="hidden" id="moduleCode" value="${moduleCode}">
	</div>
	<div class="index_bottom">
		<div class="table_box">
			<ul class="table_ul mgl-30 clearfix">
				<li><input type="text" id="s_configName" placeholder="请输入想要查询的人物名称"/></li>
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
						<div class="country_sort">
							<span id="leaderName"></span><span class="seven"></span>
						</div>
						<div class="clearfloat" style="clear:both"></div>
						<div class="close_echarts"></div>
					    </div>
	                	<div class="float_right">
							<span>时间粒度：</span>
							<span class="circle" value="3"></span><span>年</span><span class="circle" value="2"></span><span>月</span><span class="circle" value="4" id="week"></span><span>周</span><span class="circle circleon" value="1" id="day"></span><span>日</span>
						</div>
	                 </div>
	                    <div id="quadclass_graph"  style="margin-top:20px;height: 315px;width: 100%;"></div>
				</div>
		
		
		 <!-- <div class="col-md-12 bor" style="height: 365px;display: none;" >
	                	
	     </div> -->
	<!-- 条件tab页 st -->
	<jsp:include page="graph_tab1.jsp"></jsp:include>
	</div>
	<jsp:include page="../updateUserPassword.jsp"/>
</body>    
<script src="<%=basePath %>/static/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>/static/layui/layui.js"></script>
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
<script src="<%=basePath %>/static/Visualization/js/amcharts/amcharts.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/themes/light.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amchart_util.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/ammap.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/ammap_util.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/export/export.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/serial.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/echarts.js"></script>
<script src="<%=basePath%>/static/js/config/config.js"></script>
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
var tableData;
var dateList=[];
var allDateData;
function showMask(){
    $("#mask").css("height",$(document).height());
    $("#mask").css("width",$(document).width());
    $("#mask").show();
}
//隐藏遮罩层
function hideMask(){
    $("#mask").hide();
}
	$(function(){
		 //处理配置
		   handleConfigs();
	       //美化滚动条
	       glorifyComboSelect();
	       
	       function packDataByType(quadclass_data,len){
	    	   var date_news={};
	            for(var i=0;i<quadclass_data.length;i++){
	               	//比较每一个全量数据的日期是否包含截取到月的
	           		var date_str=quadclass_data[i].date;
	               	var avgTone = quadclass_data[i]["avgTone"];
	               	var fuTone = quadclass_data[i]["fuTone"];
	               	var zhengTone = quadclass_data[i]["zhengTone"];
	           		var data_string=date_str+"";
	           		var date_class=data_string.substring(0,len);
	           		if(len==2){
	           			date_class = getWeekNum(data_string);
	           		}
	           		if(date_news[date_class] != undefined){
	                   	var avgTone1 = date_news[date_class]["avgTone"];
	                   	var fuTone1 = date_news[date_class]["fuTone"];
	                   	var zhengTone1 = date_news[date_class]["zhengTone"];
	           			date_news[date_class]["avgTone"] = avgTone1 + avgTone;
	           			date_news[date_class]["fuTone"] = fuTone1 + fuTone;
	           			date_news[date_class]["zhengTone"] = zhengTone1 + zhengTone;
	           			
	           		}else{
	           			var date_new = {};
	           			date_new["avgTone"] = avgTone;
	           			date_new["fuTone"] = fuTone;
	           			date_new["zhengTone"] = zhengTone;
	           			date_news[date_class] = date_new;
	           		}
	            }
	            var date_value=[];
	            var quadclass_value=[];
	            for(var obj in date_news){
	           		var date_new = date_news[obj];
	               	date_value.push(obj);
	               	var d1={
	         			"avgTone":date_new["avgTone"].toFixed(3),
	         			"fuTone":date_new["fuTone"].toFixed(3),
	         			"zhengTone":date_new["zhengTone"].toFixed(3),
	           			date:obj
	               	}
	               	quadclass_value.push(d1);
	            }
	            showline(quadclass_value,date_value);
	       }
	       //切换年月日
	       $('.circle').on('click',function(){
	    	   $(this).addClass('circleon').siblings('.circle').removeClass('circleon');
	    	   selectVal=$(this).attr('value');
   			if(selectVal=="1"){
				  var dataYvalue=allDateData;
				  showline(dataYvalue,dateList);
   			}
   			if(selectVal=="2"){
   			 	var dataYvalue=allDateData;
   			 	packDataByType(dataYvalue,6);
            }
   			if(selectVal=="3"){
   			 	var dataYvalue=allDateData;
   			 	packDataByType(dataYvalue,4);
            }
   			if(selectVal=="4"){
   			 	var dataYvalue=allDateData;
   			 	packDataByType(dataYvalue,2);
            }
	       })
	       $('.close_echarts').on('click',function(){
	    	   $("#mask").hide();
			$(this).parent().parent().parent().toggle()
		})
	})
	//渲染图表（graph_leader_tone_viz修改为对应的模块）
		var configid=0;
		function render(configId){
			configid=configId;
			var resultcode = 'ALL';
			startLoad();
			$.ajax({
				url:'<%=basePath%>/search/graph_leader_tone_viz/'+configId,
				type: 'POST',
				dataType:"json",
				success:function(data){
					//console.log(data);
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
			 $("#line").css("display","none");
			 hideMask();
			 tableData=data.tableData;//表格数据
			 //dateList=data.dateList;//折线图X轴时间数组
			 //allDateData=data.allDateData;//折线图Y轴全数据
			//var data=[{"headImg":"Akihito","name":"李克强","country":"china","bxbh":"总理","bnbh":"贪污","zsbh":"国务院","avgTone":1234},{"headImg":"Akihito","name":"李克强","country":"china","bxbh":"总理","bnbh":"贪污","zsbh":"国务院","avgTone":-2234},{"headImg":"Akihito","name":"李克强","country":"china","bxbh":"总理","bnbh":"贪污","zsbh":"国务院","avgTone":-1024}]
			showData(tableData);
			//showline(data);
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
		function showData(data){
			//console.log(data);
			layui.use('table',function(){
				var table = layui.table;
				var element=layui.element;
				table.render({
					elem:'#dataTable',
					cols:[[
					    {type:'numbers','align':'center',width:40,title:'序号'},
						{field:'key','align':'center',width:87,title:'头像',templet:"#head"},
						{field:'name','align':'center',width:300,title:'名称'},
						{field:'country','align':'center',width:200,title:'国籍'},
						{field:'tone','align':'center',title:'情感热度',sort:true},
						{field:'avgValue','align':'center',title:'情感均值',sort:true},
						{field:'SD','align':'center',title:'情感波动',sort:true},
						{field:'median','align':'center',title:'情感中间数',sort:true},
						{field:'dateValue','align':'center',title:'情感天数',sort:true}
					     ]],
		       		data:data,
		       		//page:false,
		       		limit:data.length,
		       		done:function(res){
		       			element.init();
		       			/* hideDiv(num); */
		       		}
				})
				
			});
		}
		var lineData;
		 layui.use('table',function(){
			var table = layui.table;
			 var element = layui.element;
			table.on('row(dataTable)', function(obj){
				startLoad();
			    $("#mask").show();
				  //console.log(obj.tr) //得到当前行元素对象
				  //console.log(obj.data) //得到当前行数据
				  $("#day").addClass('circleon').siblings('.circle').removeClass('circleon');
				  $("#leaderName").html(obj.data.key+"—"+"情感时间线");
				  $("#line").css("display","block");
				  lineData=obj.data;
				  var keyData=lineData.key;
				  //var dataYvalue=allDateData[keyData];
				  $.ajax({
						url:'<%=basePath%>/twoQueryData/getLeaderToneDataByCondtion/',
						type: 'POST',
						data:{"leaderName":keyData,"configId":configid},
						dataType:"json",
						success:function(data){
							dateList = data.dateList;
							allDateData = data.allDateData;
							showline(allDateData,dateList);
							endLoad();
						}
					});  
				  
				});
			table.on('sort(dataTable)', function(obj){
				  //console.log(obj.tr) //得到当前行元素对象
				  element.init(); //得到当前行数据
				
				});
			}) 
		layui.use('element', function(){
              var element = layui.element;
         });
		 //进度条
		function nTone(d){
			 var length=tableData.length;
			 var max= tableData[0].tone;
			 var min= tableData[length-1].tone;
			 var maxScale=(Math.abs(d.tone))/max*100;
			 var minScale=(Math.abs(d.tone))/Math.abs(min)*100;
			 //var bi=50;
			 if(d.tone>0){
				 div="<div class='layui-progress layui-progress-big'><div class='layui-progress-bar layui-bg-green' lay-percent='"+maxScale+"%'></div></div>"
				 
			 }else{
				 div="<div class='layui-progress layui-progress-big'><div class='layui-progress-bar layui-bg-red' lay-percent='"+minScale+"%'></div></div>"
			 }
			  return  div;
		 }	
		//折线图
        function showline(dataYvalue,dateList){
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
        		            dataView: {}
          		        }
          		    }, 
          		  	dataZoom: {
       		            type: 'slider',
          		        textStyle:{
        		        		color:"#fff"
        		        	},
       		        	showDataShadow :false
          		        },
          		    tooltip: {
      			        trigger: "axis",
      			        axisPointer: { // 坐标轴指示器，坐标轴触发有效
      			            type: 'line', // 默认为直线，可选为：'line' | 'shadow'
      			        },
      			        formatter: '{b}<br />{a0}: {c0}<br />{a1}: {c1}<br />{a2}: {c2}<br />',
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
              	    	data:["平均情感值","正向情感值","负向情感值"]
              	    },
	              	  grid: {
	      		        left: '3%',
	      		        right: '3%',
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
          			                color: '#fff'
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
          			                color: '#bac0c0',
          			                fontWeight: 'normal',
          			                fontSize: '12',
          			            },
          			        },
              	            data: dateList
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
           			                color: '#fff',
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
           			                color: '#bac0c0',
           			                fontWeight: 'normal',
           			                fontSize: '12',
           			            },
           			            formatter: '{value}',
           			        },
              	        }
              	    ],
              	    series:  [
                                {
                                    name:"平均情感值",
                                    type:'line',
                                    data:getDataByCat("avgTone",dataYvalue),
                                    smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                    symbolSize: 0,
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
                                    name:"负向情感值",
                                    type:'line',
                                    data:getDataByCat("fuTone",dataYvalue),
                                    smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                    symbolSize: 0,
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
                                    name:"正向情感值",
                                    type:'line',
                                    data:getDataByCat("zhengTone",dataYvalue),
                                    smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                    symbolSize:0,
                                    symbol: 'circle',
                                    itemStyle: {
                			            normal: {
                			            	color:'#009688',
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
		//查询
        function cx(){
			//获取查询条件
			var dataTable=[];
			var lname = $("#s_configName").val();
			for(var i=0;i<tableData.length;i++){
				if(tableData[i].name.indexOf(lname)>-1){
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
<img  src="<%=basePath %>/leader/imagePath?imagePath={{d.leaderImg}}" height="50px" width="50px">
</script>
</html>