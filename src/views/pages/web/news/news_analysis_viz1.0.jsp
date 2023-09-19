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
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/js/amcharts/export/export.css"/>
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window_zs.css"/><!-- 弹出提示框样式 -->
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
		<h3 class="fl title">新闻库分析 >新闻分析</h3>
	</div>
	<div class="index_bottom">
	<input type="hidden" id="moduleCode" value="${moduleCode}">
	<!-- 显示图 -->
	<div class="data show">
	<div style="width: 100%;">
        <div class="row">
        	<div class="col-md-12 mg_t">
	            <div class="col-md-10" style="width:100%;border: 1px solid #CCCCCC;margin: 0px -8px 0 0;border-radius:3px;">
	                <div class="col-md-5" id="column_chart_text" style="text-align: center;width: 100%;">
	                    <h3 class="tx-c">新闻时间线
	                      	<div  class="help" onmouseover="showChartInfo(1,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
	                    </h3>
	                </div>
	                <div class="col-md-7" style="width:100%;">
	                    <div id="newsTimeLineChart" class="amcharts oneColumChart"></div>
	                </div>
	            </div>
        	</div>
        </div>
        
        <div class="row">
        	<div class="col-md-12 mg_t">
	            <div class="col-md-10" style="width:100%;border: 1px solid #CCCCCC;margin: 0px -8px 0 0;border-radius:3px;">
	                <div class="col-md-5" id="column_chart_text" style="text-align: center;width: 100%;">
	                    <h3 class="tx-c">网站新闻量排行
	                    	<select class="selectCounts" style="margin-left:10px;" id="selectCountry"></select>
	                      	<div  class="help" onmouseover="showChartInfo(2,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
	                    </h3>
	                </div>
	                <div class="col-md-7" style="width:100%;">
	                    <div id="websiteNewsCountChart" class="amcharts oneColumChart"></div>
	                </div>
	            </div>
        	</div>
        </div>

		<div class="row"> 
	        <div class="col-md-12">
				<div class="col-md-12 mg_t bor">
                    <div class="map-text">
                        <h3>网站新闻时间线
                        	<div  class="help" onmouseover="showChartInfo(3,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
                        </h3>
                    </div>
                    <div style="margin-left: 3%;margin-right: 8%">
               			 <select id="select_websiteTopN"   class="form-control selectCounts"></select>
            		</div>
                    <div id="websiteTimeLineChart" class="amcharts oneColumChart" ></div>
	             </div>
	        </div>	
	     </div>
	     
        <div class="row">
        	<div class="col-md-12 mg_t mg_b">
	            <div class="col-md-10" style="width:100%;border: 1px solid #CCCCCC;margin: 0px -8px 0 0;border-radius:3px;">
	                <div class="col-md-5" id="column_chart_text" style="text-align: center;width: 100%;">
	                    <h3 class="tx-c">网站地域分布
	                      	<div  class="help" onmouseover="showChartInfo(4,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
	                    </h3>
	                </div>
	                <div class="col-md-7" style="width:100%;">
	                    <div id="websiteMap" class="amcharts oneColumChart"></div>
	                </div>
	            </div>
        	</div>
        </div>
    </div>
	</div>
		<!-- 显示表格结束 -->
		<!-- 页面底部收缩 -->
		<jsp:include page="news_tab1.jsp"></jsp:include>
	</div>
		<jsp:include page="../updateUserPassword.jsp"/>
	<!-- 页面底部收缩结束 -->
</body>
    
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/jquery-1.11.1.min.js"></script>
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

<script src="<%=basePath%>/static/Visualization/js/amcharts/amcharts.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/themes/light.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amchart_util.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/ammap.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/ammap_util.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/export/export.js" type="text/javascript"></script>

<script src="<%=basePath%>/static/Visualization/js/amcharts/serial.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/xy.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/pie.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/radar.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/worldLow.js" type="text/javascript"></script>
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
    	//处理配置
		handleConfigs();
		//美化滚动条
		glorifyComboSelect();
    });
    
    
    //渲染图表
    function render(configId){
		 startLoad();
			$.ajax({
				url:'<%=basePath %>/search/news_analysis_viz/'+configId,
				type: 'POST',
				dataType:"json",
				success:function(data){
					if(data == "-1"){
						endLoad();
						alert("获取结果信息数据失败");
					}else{
						renderData(data);
						endLoad();
					}
				}
		});
	}
    
    
    //新闻时间线
    function  initNewsTimeLineChart(newsTimeLineChartData){
    	if(newsTimeLineChartData.length==0){
    		$("#newsTimeLineChart").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
    	}else{
    		line_chart("newsTimeLineChart", {category: "key", value: "value"}, newsTimeLineChartData);
    	}
    }
    
    
    //初始化网站新闻时间线的下拉框
    function initwebsiteTopN (websiteNewsCountData,websiteTimeLineChartData){
    	
    	var websites = websiteNewsCountData.length;
    	if(websites > 0){
    		for(var i =0;i<websites;i++){
                var name=websiteNewsCountData[i].name_key.toString();
                var number=websiteNewsCountData[i].value.toString();
                $("#select_websiteTopN").append("<option value='"+name+"'>网站："+name+"   新闻数："+number + "</option>");
            }
        	//默认第一个选中的数据
        	initWebsiteTimeLineChart(websiteTimeLineChartData[$("#select_websiteTopN option:selected").val()]);
        	//下拉框值改变事件
        	$("#select_websiteTopN").change(function(){
        		initWebsiteTimeLineChart(websiteTimeLineChartData[$("#select_websiteTopN option:selected").val()]);
       		});
    	}else{
    		//清空下拉框
        	$("#select_websiteTopN").empty();
    		$("#websiteTimeLineChart").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
    	}
    }
    
    //网站新闻时间线
    function initWebsiteTimeLineChart(websiteTimeLineChartData){
    	if(websiteTimeLineChartData != undefined && websiteTimeLineChartData.length>=0 ){
    		process_dic_to_datechart(websiteTimeLineChartData,'websiteTimeLineChart')
    		
    	}else{
    		$("#websiteTimeLineChart").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
    	}
		
	}
    
    //网站地域分布
    function initwebsiteMap(websiteMapData){
    	process_dic_to_heatmap(websiteMapData,'websiteMap');
    }
    
  	//网站新闻量排行
    function initWebsiteNewsCountChart(websiteNewsCountData){
    	if(websiteNewsCountData.length>0){
			$("#selectCountry").show();
			$("#selectCountry").html(""); 
			var countryNum = websiteNewsCountData.length > 20 ? 20:websiteNewsCountData.length;
			for(var i=5;i<=countryNum;i+=5){
				document.getElementById("selectCountry").options.add(new Option(i,i));
			} 
			var	countryOptionCount = $("#selectCountry option").map(function(){return $(this).val();}).get().join(", ");
			if(countryOptionCount.indexOf(10)!=-1){
				$("#selectCountry option[value='10']").attr("selected",true);
				process_dic_to_amchart(websiteNewsCountData,'column_chart','websiteNewsCountChart',10);
			}else{
				$("#selectCountry").hide();
				process_dic_to_amchart(websiteNewsCountData,'column_chart','websiteNewsCountChart',countryNum);
			}
			
			$("#selectCountry").change(function () {
	        	var changeValue = $("#selectCountry option:selected").val();
        		column_chart('websiteNewsCountChart',{category:'name_key',value:'value'},websiteNewsCountData.slice(0,changeValue));
	        });
		}else{
			$("#selectCountry").hide();
        	$("#websiteNewsCountChart").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
		}
    }
    
    function render(configId){
    	startLoad();
    	var resultcode = 'ALL';
    	$.ajax({
    		url:'<%=basePath%>/search/news_analysis_viz/'+configId,
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
    
    //渲染图表
	function renderData(data){
		var news_time_line = data.news_time_line;
		var web_news_topn = data.web_news_topn;
		var web_news_time_line = data.web_news_time_line;
		var web_news_map = data.web_news_map;
		//新闻时间线
		initNewsTimeLineChart(news_time_line);
		//网站新闻量排行
		initWebsiteNewsCountChart(web_news_topn);
		//网站新闻时间线下拉框以及对应网站新闻时间线
		initwebsiteTopN(web_news_topn,web_news_time_line);
		//网站地域分布
		initwebsiteMap(web_news_map);
	}
    
    </script>
</html>