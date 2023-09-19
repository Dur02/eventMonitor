<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>国家时间线组织</title>
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
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/js/amcharts/export/export.css"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/leaflet.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/dvf.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/example.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/ui.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/actormap.css" type="text/css" media="screen"/>
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
	svg.wordCloud {
    width: 1000px;
    height: 500px;
	}
	svg.wordCloud g {
    transform: translate(500px, 250px);
    -moz-transform: translate(500px, 250px);
    -webkit-transform: translate(350px, 250px);
	}
</style>
</head>
<body>
	<div class="index_top clearfix">
		<h3 class="fl title">图谱库分析 >组织时间线</h3>
	</div>
	<div class="index_bottom">
		<input type="hidden" id="moduleCode" value="${moduleCode}">
		<!-- 显示图 -->
		<div class="data show" >
	        <div class="row" >
		        <div class="col-md-12 mg_t">
		            <div class="col-md-10 " style="border: 1px solid #CCCCCC;width:100%; float:left;border-radius:3px;">
		                 <div class="col-md-12 map-text">
		                    <h3 class="tx-c" >组织统计 
		                    	<select class="selectCounts" style="margin-left:10px;" id="selectZZ"></select>
		                    	<div  class="help" onmouseover="showChartInfo(1,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
		                    </h3>
		                 </div>
		                 <div class="col-md-12" style="width:100%;margin-top:20px;">
		                     <div id="column_chart" class="amcharts"></div>
		                 </div>
		            </div>
	          	</div>
	        </div>
           	<div class="row">
	            <div class="col-md-12 mg_t mg_b" >
		            <div class="col-md-10 " style="height:455px;border: 1px solid #CCCCCC; border-radius:3px;width:100%; float:right;">
		                <div class="col-md-12 map-text">
		                    <h3 class="tx-c" > 组织时间线 
		                    	<div  class="help" onmouseover="showChartInfo(2,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
		                    </h3>
		                </div>
		                <div style="margin-left: 5%;margin-right: 8%">
		                    <select id="select_organization" class="form-control"></select>
		                </div>
		                <div id="date_chart" class="amcharts" style="height:383px;"></div>
		            </div>
	            </div>
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
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/base.js"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/amcharts.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/themes/light.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amchart_util.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/ammap.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/ammap_util.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/export/export.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/leaflet-src.js"></script>
<script type="text/javascript"
src="<%=basePath%>/static/Visualization/js/leaflet/leaflet.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/tile.stamen.js"></script>
<script type="text/javascript"
src="<%=basePath%>/static/Visualization/js/leaflet/geohash.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/underscore-min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/moment.min.js" ></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/leaflet-dvf.js"></script>
<script type="text/javascript"
src="<%=basePath%>/static/Visualization/js/leaflet/leaflet.dvf.experimental.js"></script>
<script src="<%=basePath%>/static/Visualization/datamap/d3.min.js"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/serial.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/pie.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/js/config/config.js"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/xy.js" type="text/javascript"></script>
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
	$(function(){
		/* //美化图表展示界面的右侧滚动条
		index_bottom_perfectScrollbar(); */
		//处理配置
		handleConfigs();
		//控制Tone字段的显示问题
		gkgToneIsShow();
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
	});
	
		function render(configId){
			startLoad();
			var resultcode = 'ALL';
			$.ajax({
				url:'<%=basePath%>/search/graph_organization_timeline_viz/'+configId,
				type: 'POST',
				dataType:"json",
				success:function(data){
					if(data=="-1"){
						endLoad();
						alert("加载失败");
					}
					renderData(data);
					endLoad();
				}
			});
		}
		function renderData(data){
			var organization_dic=data.organization_dic;
			var date_organization_dic = data.date_organization_dic;
			if(organization_dic.length>0){
				$("#selectZZ").show();
				$("#selectZZ").html("");
		        for(var i=5;i<=organization_dic.length;i+=5){
		        	document.getElementById("selectZZ").options.add(new Option(i,i));
		        }
		        var	countryOptionCount = $("#selectZZ option").map(function(){return $(this).val();}).get().join(", ");
				if(countryOptionCount.indexOf(10)!=-1){
					$("#selectZZ option[value='10']").attr("selected",true);
				}
				//渲染柱状图
				if(organization_dic.length > 10){
					column_chart('column_chart',{category:"key",value:"value"},organization_dic.slice(0,10));	
				}else{
					$("#selectZZ").hide();
					column_chart('column_chart',{category:"key",value:"value"},organization_dic);	
				}
				$("#selectZZ").change(function () {
		        	var changeValue = $("#selectZZ option:selected").val();
		        		if(organization_dic.length > 10){
		        			column_chart('column_chart',{category:"key",value:"value"},organization_dic.slice(0,changeValue));
		        		}else{
		        			column_chart('column_chart',{category:"key",value:"value"},organization_dic(0,changeValue));
		        		}
		        });
			}else{
				$("#selectZZ").hide();
				$("#column_chart").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
			}
			var dtlen=organization_dic.length;
			if(dtlen > 0){
				$("#select_organization").empty();
				$("#select_organization").show();
		        for (var i = 0; i < dtlen; i++) 
		        {	
		            var name=organization_dic[i].name_key.toString();
		            var number=(organization_dic[i].value).toString();
		            $("#select_organization").append("<option value='"+name+"'>组织："+name+" 总数："+number);
		        }
		        $("#select_organization").change(function() {
		        process_dic_to_datechart(get_needed_date_dic(date_organization_dic,$("#select_organization option:selected").val()),'date_chart')});
		        process_dic_to_datechart(get_needed_date_dic(date_organization_dic,$("#select_organization option:first").val()),'date_chart');
			}else{
				$("#select_organization").hide();
				$("#date_chart").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
			}
			
		    function get_needed_date_dic(date_dic,name){
		        dtlen=date_dic.length;
		        var res=[];
		        for (var i = 0; i < dtlen; i++)
		        {
		            if(date_dic[i].key==name){
		                res.push({"key":date_dic[i].date,"value":date_dic[i].value});
		            }
		        }
		        return res;
		    }
		} 
    </script>
</html>