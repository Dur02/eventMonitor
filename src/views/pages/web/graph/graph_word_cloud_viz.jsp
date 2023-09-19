<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图谱实体标签云展示</title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="shortcut icon" type="image/x-icon" href="<%=basePath%>/static/Visualization/base/ico.png"/>
<link rel="stylesheet" href="<%=basePath%>/static/css/style.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath%>/static/lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/perfect-scrollbar.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/js/jqcloud/jqcloud.css"/>
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
<body >
	<div class="index_top clearfix">
		<h3 class="fl title" >图谱库分析 > 标签云</h3>
	</div>
	<div class="index_bottom">
	<!-- 显示图 -->
	<input type="hidden" id="moduleCode" value="${moduleCode}">
	<div class="data show">
		<%-- <div class="container show-graph" style="width: 100%;">
	        <div class="row">
	        	<div class="col-md-10 mg_t" style="width:100%;border: 1px solid #CCCCCC;height:450px;border-radius:3px;">
		            <div class="col-md-12 map-text">
		                <h3 class="tx-c" style="font-size:14px;">
		                	<span id= "stname2" style="border:0px;font-size:14px;"></span>相关实体词云 
		                	<div  class="help" onmouseover="showChartInfo(2,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
		                </h3>
		            </div>
		            <div id="word_cloud" class="mmap" style="width:800px;height:400px; margin:0 auto;"></div>
		    	</div>
	    	</div>
	    </div> --%>
	    
	    <div class="row"> 
	        <div class="col-md-12">
				<div class="col-md-12 mg_t bor">
                    <div class="map-text">
                        <h3>相关实体词云 
		                   	<div  class="help" onmouseover="showChartInfo(1,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
                        </h3>
                    </div>
                    <div id="word_cloud" class="mmap oneColumChart"></div>
	             </div>
	        </div>	
       	</div>	
	    
	    <div class="row"> 
	        <div class="col-md-12">
				<div class="col-md-12 mg_t mg_b bor">
                    <div class="map-text">
                        <h3>主题统计
                        	<select class="selectCounts" id="selectXGST"></select>
		                   	<div  class="help" onmouseover="showChartInfo(2,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
                        </h3>
                    </div>
                    <div id="pie_chart" class="amcharts oneColumChart"></div>
	             </div>
	        </div>	
       	</div>	
	    
		<%-- <div class="row">
        	<div class="col-md-12 mg_t mg_b">
	            <div class="col-md-10" style="width:100%;border: 1px solid #CCCCCC;float:left;height:395px;border-radius:3px;">
		            <div class="col-md-12 map-text" id="pie_chart_text">
		                <h3 class="tx-c" style="font-size:14px;">
		                	<span id= "stname" style="border:0px;font-size:14px;"></span>实体统计
		                	<select class="selectCounts" style="margin-left:10px;" id="selectXGST">
		                   	</select>
		                   	<div  class="help" onmouseover="showChartInfo(1,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
		                </h3>          
		            </div>
	              	<div class="col-md-7" style="width:100%;">
	                	<div id="pie_chart" class="amcharts"></div>
	            	</div>
	            </div>
	          </div>
        </div> --%>
    </div>
	<!-- 显示表格结束 -->
	<!-- 页面底部收缩 -->
		<jsp:include page="graph_tab3.jsp"></jsp:include>
	</div>
	<!-- 页面底部收缩结束 -->
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
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/leaflet.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/tile.stamen.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/geohash.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/underscore-min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/moment.min.js" ></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/leaflet-dvf.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/leaflet.dvf.experimental.js"></script>
<script src="<%=basePath%>/static/Visualization/datamap/d3.min.js"></script>
<script src="<%=basePath%>/static/Visualization/js/jqcloud/jqcloud.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/d3.layout.cloud.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/d3.v3.min.js" type="text/javascript"></script>
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
		var word_cloud = null;
		function render(configId){
			startLoad();
			$.ajax({
				url:'<%=basePath%>/search/graph_word_cloud_viz/'+configId,
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
		function renderData(data){
			var word_count = data.word_count;
			$("#word_cloud").html("");
			var a = data.entity_type;
			$("#stname").html(a);
			$("#stname2").html(a);
			if(word_count.length>0){
				$("#selectXGST").show();
				$("#selectXGST").html(""); 
		        var wordNum = word_count.length > 20 ? 20:word_count.length;
		        if(wordNum==1 && word_count[0].value != 0){
					document.getElementById("selectXGST").options.add(new Option("1","1"));
				}
		        for(var i=2;i<=wordNum;i+=2){
		        	document.getElementById("selectXGST").options.add(new Option(i,i));
		        }
		        var wordOptionCount = $("#selectXGST option").map(function(){return $(this).val();}).get().join(", ");
				if(wordOptionCount.indexOf(8)!=-1){
					$("#selectXGST option[value='8']").attr("selected",true);
					process_dic_to_pie(word_count,'pie_chart','pie_chart',8);
				}else{
					$("#selectXGST").hide();
					process_dic_to_pie(word_count,'pie_chart','pie_chart',wordNum);
				}
		        $("#selectXGST").change(function () {
		        	var changeValue = $("#selectXGST option:selected").val();
		        	process_dic_to_pie(word_count,'pie_chart','pie_chart',changeValue);
		        });
			}else{
				$("#selectXGST").hide();
				$("#pie_chart").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
				$("#word_cloud").html('<img alt="" style="width: 280px;margin-left: 32.5%;margin-top: 7%;"  src="<%=basePath %>/static/images/tubiao2.png">');
			}
	        var value_list=[];
	        if(word_count.length >0){
	        	len=word_count.length;
	        	for (var i = 0; i < len; i++)
		        {
	        		var textst;
	        		if(word_count[i].key.indexOf("(") > -1){
	        			textst = word_count[i].key.substring(0, word_count[i].key.indexOf("("));
	        		}else{
	        			textst = word_count[i].key;
	        		}
		        	value_list.push({text:textst,weight:word_count[i].value});
		        }
	        }
	        if (word_cloud == null) {
	        	word_cloud = $('#word_cloud').jQCloud(value_list,{
			          classPattern: null,
			          colors: ["#1abc9c", "#9b59b6", "#3498db", "#27ae60", "#34495e", "#f39c12", "#e74c3c", "#998418", "#448E4D"],
			          fontSize: {from: 0.1,to: 0.02}
			        });
	        } else {
	        	word_cloud.data('jqcloud').update(value_list);
	        }
		}
    </script>
</html>