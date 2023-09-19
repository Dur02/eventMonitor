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
<title>图谱时间线-主题 </title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="shortcut icon" type="image/x-icon" href="<%=basePath%>/static/Visualization/base/ico.png"/>
<link rel="stylesheet" href="<%=basePath%>/static/css/style.css">
<!--人工查询 -->
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath %>/static//lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath %>/static/css/combo.select.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/perfect-scrollbar.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/base.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/css/event_result.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/js/amcharts/export/export.css"/>
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
<body >
	<div class="index_top clearfix">
		<h3 class="fl title" style="">图谱库分析 > 主题时间线 </h3>
	</div>
	<div class="index_bottom">
		<!-- 显示图 -->
		<div class="data show">
			<input type="hidden" id="moduleCode" value="${moduleCode}">
			<div class="show-graph">	
				<div class="row"> 
			        <div class="col-md-12">
						<div class="col-md-12 mg_t bor">
		                    <div class="map-text">
		                        <h3>主题统计
		                        	<select class="selectCounts" id="selectThemes"></select>
		                        	<div  class="help" onmouseover="showChartInfo(1,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
		                        </h3>
		                    </div>
		                    <div id="pie_chart" class="amcharts oneColumChart"></div>
			             </div>
			        </div>	
	          	</div>			
	            <%-- <div class="row">
		            <div class="col-md-12 mg_t" >
			            <div class="col-md-10" style="width:100%;border: 1px solid #CCCCCC;border-radius:3px; float:left;height:437px">
			                <div class="col-md-12 map-text">
			                    <h3 class=tx-c >主题统计
			                    	<select class="selectCounts" style="margin-left:10px;" id="selectThemes"></select>
			                    	<div  class="help" onmouseover="showChartInfo(1,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
			                    </h3>
			                </div>
			                <div class="col-md-7" style="width:100%;">
			                    <div id="pie_chart" class="amcharts oneColumChart"></div>
			                </div>               
			            </div>
		            </div>
		        </div> --%>
		        
		        <div class="row"> 
			        <div class="col-md-12">
						<div class="col-md-12 mg_t mg_b bor">
		                    <div class="map-text">
		                        <h3>主题时间线 
		                    		<div  class="help" onmouseover="showChartInfo(2,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
		                        </h3>
		                    </div>
		                    <div style="margin-left: 3%;margin-right: 8%">
	                  				 <select id="select_theme"  class="form-control selectCounts"></select>
	               			</div>
		                    <div id="date_chart" class="amcharts oneColumChart" ></div>
			             </div>
			        </div>	
	    	 	</div>
		        
		        <%-- <div class="row">
	        		<div class="col-md-12 mg_t" style="margin-bottom:80px;">
	        			<div class="col-md-10  " style="height:455px;border: 1px solid #CCCCCC; border-radius:3px;width:100%; float:right;">
		                <div class="col-md-12 map-text">
		                    <h3 class="tx-c" >主题时间线 
		                    	<div  class="help" onmouseover="showChartInfo(2,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
		                    </h3>
		                </div>
		                <div style="margin-left: 4%;margin-right: 8%">
		                    <select id="select_theme" class="form-control selectCounts"></select>
		                </div>
		                <div id="date_chart" class="amcharts oneColumChart"></div>
		                </div>
		            </div>
		        </div> --%>
			</div>
		</div>
		<!-- 页面底部收缩 -->
		<jsp:include page="graph_tab2.jsp"></jsp:include>
	</div>
		<!-- 页面底部收缩结束 -->
		<jsp:include page="../updateUserPassword.jsp"/>
</body>
  <script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/jquery-1.11.1.min.js"></script>
  <!-- 人工查询功能的日期 -->
<script src="<%=basePath %>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-select.min.js"></script>
<script src="<%=basePath %>/static/js/jquery.combo.select.js"></script>
<script src="<%=basePath %>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath %>/static/js/perfect-scrollbar.js"></script>
<script src="<%=basePath %>/static/js/config/config.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/base.js"></script>
<script src="<%=basePath %>/static/js/config/config.js"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/amcharts.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/themes/light.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amchart_util.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/ammap.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/ammap_util.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/export/export.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/js/sec2.js"></script>
<script src="<%=basePath%>/static/lib/jquery.pagination.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/base.js"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/amcharts.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/themes/light.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amchart_util.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/ammap.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/ammap_util.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/export/export.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/serial.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/xy.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/pie.js" type="text/javascript"></script>
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
<script type="text/javascript">
	$(function(){
		/* //美化图表展示界面的右侧滚动条
		index_bottom_perfectScrollbar(); */
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
					url:'<%=basePath%>/search/graph_theme_timeline_viz/'+configId,
					type: 'POST',
					dataType:"json",
				success:function(data){
					console.log(JSON.stringify(data));
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
			var theme_dic = data.theme_count_left;
		 	var date_dic = data.temp_date_theme_count_right;
		 	var theme_dic_right = data.theme_count_right;
		 	if(theme_dic.length>0){
			$("#select_theme").empty();
		 		$("#selectThemes").show();
			 	$("#selectThemes").html(""); 
			 	var themesNum = theme_dic.length > 20 ? 20:theme_dic.length;
			 	/* if(themesNum==1){
					document.getElementById("selectThemes").options.add(new Option("1","1"));
				} */
				for(var i=2;i<=themesNum;i+=2){
					document.getElementById("selectThemes").options.add(new Option(i,i));
				}
				var countryOptionCount = $("#selectThemes option").map(function(){return $(this).val();}).get().join(", ");
				if(countryOptionCount.indexOf(8)!=-1){
					$("#selectThemes option[value='8']").attr("selected",true);
					process_dic_to_amchart(theme_dic,'pie_chart','pie_chart',8);
				}else{
					$("#selectThemes").hide();
					process_dic_to_amchart(theme_dic,'pie_chart','pie_chart',themesNum);
				}
			 	
			 	$("#selectThemes").change(function () {
		        	var changeValue = $("#selectThemes option:selected").val();
		        		process_dic_to_amchart(theme_dic,'pie_chart','pie_chart',changeValue);
		        });
		 	}else{
		 		$("#selectThemes").hide();
		 		$("#pie_chart").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
		 	}
		 	var dtlen=theme_dic_right.length;
		 	if(dtlen > 0){
		 		$("#select_theme").show();
		 		for (var j = 0; j < theme_dic_right.length; j++)
		        {             
		            var name=theme_dic_right[j].name_key.toString();
		            var number=(theme_dic_right[j].value).toString();
		            $("#select_theme").append("<option value='"+name+"'>主题："+name+" 总数："+number);
		        }
		        $("#select_theme").change(function() {process_dic_to_datechart(get_needed_date_dic(date_dic,$("#select_theme option:selected").val()),'date_chart')});
		        process_dic_to_datechart(get_needed_date_dic(date_dic,$("#select_theme option:first").val()),'date_chart');
		
		 	}else{
		 		$("#select_theme").hide();
	        	$("#date_chart").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
		 	}
		}
		 function get_needed_date_dic(date_dic,name)
		    {
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
    </script>
</html>