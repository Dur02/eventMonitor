<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<title>图谱时间线-地理  </title>
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
    <!-- 事件描述 -->
    <div class="index_top clearfix">
		<h3 class="fl title" >图谱库分析 >地理时间线</h3>
	</div>
	<div class="index_bottom">
		<input type="hidden" id="moduleCode" value="${moduleCode}">
		<!-- 显示图 -->
		<div class="data show">
			<div class="row"> 
		        <div class="col-md-12">
					<div class="col-md-12 mg_t bor">
		                <div class="col-md-12">
		                    <div class="map-text">
		                        <h3>国家事件统计
		                        	<select class="selectCounts" style="margin-left:10px;" id="selectCountry"></select>
		                        	<div  class="help" onmouseover="showChartInfo(1,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
		                        </h3>
		                    </div>
		                    <div class="col-md-12">
		                        <div id="column_chart" class="amcharts oneColumChart"></div>
		                    </div>
		                </div>
		             </div>
		        </div>	
	        </div>
	        
	        <div class="row"> 
		        <div class="col-md-12">
					<div class="col-md-12 mg_t bor">
	                    <div class="map-text">
	                        <h3>国家事件时间线
	                        	<div  class="help" onmouseover="showChartInfo(2,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
	                        </h3>
	                    </div>
	                    <div style="margin-left: 3%;margin-right: 8%">
                  				 <select class="selectCounts form-control" style="margin-left:10px;" id="select_country_1" ></select>
               			</div>
	                    <div id="country_date_chart" class="amcharts oneColumChart"></div>
		             </div>
		        </div>	
	        </div>
	        
	        <div class="row"> 
		        <div class="col-md-12">
					<div class="col-md-12 mg_t bor">
	                    <div class="map-text">
	                        <h3>城市事件时间线
	                        	<div  class="help" onmouseover="showChartInfo(3,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
	                        </h3>
	                    </div>
	                    <div style="margin-left: 3%;margin-right: 8%">
                  				 <select class="selectCounts form-control" style="margin-left:10px;" id="select_city" ></select>
               			</div>
	                    <div id="city_date_chart" class="amcharts oneColumChart"></div>
		             </div>
		        </div>	
	        </div>
	        
	        <div class="row">
				<div class="col-md-12 mg_t">
		                <div class="col-md-12 map-text">
		                    <h3 class="tx-c mapText_heat_time">国家事件热点图
		                    	<div  class="help" onmouseover="showChartInfo(4,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
		                    </h3>
		                    <input type="text" id="country_date" style="border:0px;text-align:center;"readonly="true">
		                </div>
		                <div class="bor">
		                    <div id="bubble_country" class="ammap myleafletjsMap" ></div>
		                    <div style="position: absolute;z-index: 99;right:22px;top: 50px;margin-top: -43px;">
	                    		<div id="btn-group" class="btn-group fr" style="width:110px; margin-left:20px;">
                                     <input type="button" class="borcolor btn" onclick="countryStart()" id="country_start" value="开始">
                                     <input type="button" class="borcolor btn" id="country_stop" value="停止">
                                </div>
	                        	<input class="fr" type="text" id="country_date_range" readonly style="width:260px;text-align:center; line-height:35px;">
		                    </div>
		                </div>
		        </div>
		    </div>
	        <div class="row">
				<div class="col-md-12 mg_t">
	                <div class="col-md-12 map-text">
	                    <h3 class="tx-c mapText_heat_time">城市事件热点图
	                    	<div  class="help" onmouseover="showChartInfo(5,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
	                    </h3>
	                    <input type="text" id="city_date" style="border:0px;text-align:center;"readonly="true">
	                </div>
	                <div class="bor">
	                    <div id="bubble_city" class="ammap myleafletjsMap"></div>
	                    <div style="position: absolute;z-index: 99;right:22px;top: 50px;margin-top: -43px;">
	                    	<div id="btn-group" class="btn-group fr" style="width:110px; margin-left:20px;">
                                 <input type="button" class="borcolor btn" onclick="cityStart()" id="city_start" value="开始">
                                 <input type="button" class="borcolor btn" id="city_stop" value="停止">
                            </div>
                       		<input class="fr" type="text" id="city_date_range" readonly style="width:260px;text-align:center; line-height:35px;">
	                    </div>
	                    <div class="heatTl">
		                    <div>
	                        	<span>0</span>
	                        	<img src="<%=basePath %>/static/images/heatTl.png">
	                        	<span id="maxCityValue">0</span>
	                        </div>
	                    </div>
	                </div>
		        </div>
		      </div>
		      
		      
        	  <div class="row"> 
			        <div class="col-md-12">
						<div class="col-md-12 mg_t mg_b bor">
		                    <div class="map-text">
		                        <h3>城市事件统计
		                        	<select class="selectCounts" id="selectCity"></select>
		                        	<div  class="help" onmouseover="showChartInfo(6,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
		                        </h3>
		                    </div>
		                    <div id="pie_chart" class="amcharts oneColumChart"></div>
			             </div>
			        </div>	
	          </div>
    	<!-- <div class="container show-graph" style="width: 100%;"> -->
       	<%-- <div class="row" >
				<input type="hidden" id="moduleCode" value="${moduleCode}">
                <div class="col-md-10" style="width:100%;border: 1px solid #CCCCCC;margin: 5px -8px 0px 0; border-radius:3px;">
                <!--    <h3 class="headline first-child"><span class="fa fa-bar-chart"></span></h3>-->
                    <div class="col-md-12 map-text" style="text-align: center;width: 100%;">
                        <h1 style="font-size:14px;">国家事件统计
                        	<select class="selectCounts" style="margin-left:10px;" id="selectCountry">
                        	</select>
                        </h1>
                    </div>
                    <div class="col-md-12">
                        <div id="column_chart" class="amcharts"></div>
                    </div>
                </div>
        </div> --%>
        <!-- <div class="row">
            <div class="col-md-10" style="width:100%;border: 1px solid #CCCCCC;margin: 15px -8px 0px 0; border-radius:3px;height:437px;">
               <h3 class="headline first-child"><span class="fa fa-globe"></span></h3>
                <div class="col-md-12 map-text">
                    <h1 style="font-size:14px;">国家事件时间线 </h1>
                </div>
                <div style="margin-left: 3%;margin-right: 8%">
                    <select class="selectCounts form-control" style="margin-left:10px;" id="select_country_1" class="form-control"></select>
                </div>
                <div id="country_date_chart" class="amcharts" style="height: 365px;"></div>
            </div>
        </div> -->
        <!-- <div class="row">
            <div class="col-md-10" style="width:100%;border: 1px solid #CCCCCC;margin: 15px -8px 0px 0; border-radius:3px;height:437px;">
                <div class="col-md-12 map-text">
                   <h1 style="font-size:14px;">城市事件时间线  </h1>
                </div>
                <div style="margin-left: 3%;margin-right: 8%">
                   <select class="selectCounts form-control" style="margin-left:10px;" id="select_city" class="form-control"></select>
                </div>
                <div id="city_date_chart" class="amcharts" style="height: 365px;"></div>
            </div>
        </div> -->
        <!-- <div class="row">
            <div class="col-md-12 bor " style="border: 1px solid #CCCCCC;margin: 15px -8px 0px 0;border-radius:3px;">
                <div class="col-md-12 map-text">
                    <h1 style="font-size:14px;float:center;margin-left:-15px;">国家事件热点图</h1>
                    <input type="text" value="时间" id="country_date" style="border: 0px;margin-top: -6px;margin-left: 25px;">
                </div>
                <div class="col-md-12">
                    <div id="bubble_country" class="ammap"></div>
                    <div style="position: absolute;z-index: 99;right:100px;top: 5px">
                        <input type="text" id="country_date_range" style="width:140px;text-align:center; position:absolute; right:-15px;">
                        <div class="btn-group" style="margin-top: 18px;">
                            <button type="button" class="btn btn-default" id="country_start">开始</button>
                            <button type="button" class="btn btn-default" id="country_stop">停止</button>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
        
        <!-- <div class="row">
			<div class="col-md-12 mg_t">
	                <div class="col-md-12 map-text">
	                    <h3>城市事件热点图</h3>
	                     <input type="text" id="city_date" style="border:0px;text-align:center;">
	                </div>
	                <div class="bor">
	                    <div id="bubble_city" class="ammap" style="height:400px;"></div>
	                    <div style="position: absolute;z-index: 99;right:100px;top: 50px">
	                    	<input type="text" id="city_date_range" style="width:140px;text-align:center; position:absolute; right:-15px;">
	                        <div class="btn-group" style="margin-top: 18px;">
	                            <buttun type="button" class="btn btn-default" id="city_start">开始</buttun>
	                            <buttun type="button" class="btn btn-default" id="city_stop">停止</buttun>
	                        </div>
	                    </div>
	                </div>
	        </div>
        </div> -->
        
        
        
        <!-- <div class="row">
        	<div class="col-md-10 bor" style="border: 1px solid #CCCCCC;margin: 15px -8px 0px 0;width:100%;border-radius:3px;">
                <div class="col-md-12 map-text">
                    <h1 style="font-size:14px;float:center;margin-left:-15px;">城市事件热点图</h1>
                    <input type="text" value="时间" id="city_date" style="border: 0px;margin-top: -6px;margin-left: 25px;">
                </div>
                <div class="col-md-12">
                    <div id="bubble_city" class="ammap"></div>
                    <div style="position: absolute;z-index: 99;right:100px;top: 5px">
                    <input type="text" id="city_date_range" style="width:140px;text-align:center; position:absolute; right:-15px;">
                        <div class="btn-group" style="margin-top: 18px;">
                            <button type="button" class="btn btn-default" id="city_start">开始</button>
                            <button type="button" class="btn btn-default" id="city_stop">停止</button>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
            <!-- <div class="row">
	            <div class="col-md-10  " style="border: 1px solid #CCCCCC;margin: 15px -8px 0px 0;width:100%; float:left; border-radius:3px;height:401px;">
	                <div class="col-md-12 map-text"style="opacity:1;">
	                    <h1 class="zz1" style="font-size:14px;">城市事件统计
	                    <select class="selectCounts" id="selectCity">
	                    </select>
	                    </h1>           
	                </div>
	                <div class="col-md-7" style="width:100%;">
	                    <div id="pie_chart" class="amcharts"></div>
	                </div>
	            </div>
        	</div> -->
        <!-- <div class="row">
        	<div class="col-md-10 bor " style="border: 1px solid #CCCCCC;margin: 15px 0px 0px 0; border-radius:5px;width:100%; float:right;margin-bottom:80px;">
                    <div class="col-md-12 map-text">
                        <h1 style="font-size:14px;float:center;margin-left:-15px;">国家事件时间线</h1>
                    </div>
                    <div style="margin-left: 2%;margin-right: 3%">
                        <select id="select_country_2" class="form-control selectCounts">
                        </select>
                    </div>
                    <div class="col-md-12" >
                        <div id="double_line_chart" class="amcharts" style="height:360px;"></div>
                    </div>
            </div>
        </div> -->
    <!-- </div> -->
    </div>
    <jsp:include page="graph_tab2.jsp"></jsp:include>
    <jsp:include page="../updateUserPassword.jsp"/>
   </div>
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
<script src="<%=basePath %>/static/js/config/config.js"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/serial.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/xy.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/pie.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/radar.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/worldLow.js" type="text/javascript"></script>
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
    	// 控制选择年月日
    	$(".date").on("click",function(){
    		$(this).addClass("active_span").siblings().removeClass("active_span");
    	});
    });
    var country_timeline_dic;
    var country_dic;
    var timeArray = [];
    var len;
    var len2;
    var maxValue;
    function render(configId){
    	startLoad();
    	var resultcode = 'ALL';
    	$.ajax({
    		url:'<%=basePath%>/search/graph_country_timeline_viz/'+configId,
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
    	if($("#country_start").hasClass("act")){
    		$("#country_start").removeClass("act");
    	}
    	if($("#city_start").hasClass("act")){
    		$("#city_start").removeClass("act");
    	}
    	for(var j = 0;j<timeArray.length;j++){
			clearInterval(timeArray[j]);
		}
    country_dic = data.country_dic;
    $("#select_country_1").html(""); 
    //$("#select_country_2").html(""); 
    $("#select_city").html(""); 
    if(country_dic.length>0){
    	$("#selectCountry").show(); 
	    $("#selectCountry").html(""); 
	    var countryNum = country_dic.length > 20 ? 20:country_dic.length;
	    if(countryNum==1 && country_dic[0].value != 0){
			document.getElementById("selectCountry").options.add(new Option("1","1"));
		}
        for(var i=5;i<=countryNum;i+=5){
        	document.getElementById("selectCountry").options.add(new Option(i,i));
        }
        var	countryOptionCount = $("#selectCountry option").map(function(){return $(this).val();}).get().join(", ");
		if(countryOptionCount.indexOf(10)!=-1){
			$("#selectCountry option[value='10']").attr("selected",true);
			process_dic_to_amchart(country_dic,'column_chart','column_chart',10);
		}else{
			$("#selectCountry").hide(); 
			process_dic_to_amchart(country_dic,'column_chart','column_chart',countryNum);
		}
		
	   	//process_dic_to_country_line_column_chart2(country_dic,'line_column_chart');
	    $("#selectCountry").change(function () {
        	var changeValue = $("#selectCountry option:selected").val();
        	 process_dic_to_amchart(country_dic,'column_chart','column_chart',changeValue);
       		//process_dic_to_country_line_column_chart2(country_dic,'line_column_chart',changeValue);
        });
    }else{
    	$("#selectCountry").hide();
    	$("#line_column_chart").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
    }
    country_timeline_dic = data.country_timeline_dic;
    maxValue = data.max;
    maxValue = 9999999;
    var country_line_dic = data.country_line_dic;
   	var dtlen = country_dic.length>20?20:country_dic.length;
   	if(dtlen > 0){
   		$("#select_country_1").show();
   		//$("#select_country_2").show();
   		$("#selectCountry").show();
   		for (var i = 0; i < dtlen; i++)
        {
            var name=country_dic[i].name_key.toString();
            var chname = country_dic[i].ch_name.toString();
            var number=(country_dic[i].value).toString();
            $("#select_country_1").append("<option value='"+name+"'>国家："+chname+"   事件总数："+number + "</option>");
            //$("#select_country_2").append("<option value='"+name+"'>国家："+chname+"   事件总数："+number +"</option>");
        }
	     if(country_line_dic.length >= 1 && country_line_dic[0].value > 0){
	     	$("#select_country_1").change(function() {process_dic_to_datechart(get_needed_date_dic(country_line_dic,$("#select_country_1").val()),'country_date_chart')});
	         process_dic_to_datechart(get_needed_date_dic(country_line_dic,$("#select_country_1 option:first").val()),'country_date_chart');
	         //$("#select_country_2").change(function() { process_dic_to_country_double_line_chart2(country_line_dic,$("#select_country_2").val(),'double_line_chart'); });
	         //process_dic_to_country_double_line_chart2(country_line_dic,$("#select_country_2 option:first").val(),'double_line_chart');
	     }
   	}else{
   		$("#select_country_1").hide();
   		//$("#select_country_2").hide();
   		$("#selectCountry").hide();
   		$("#column_chart").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
    	$("#country_date_chart").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
   		<%-- $("#double_line_chart").html('<img alt="" style="width: 28%;margin-left: 35%;margin-top: 6%;"  src="<%=basePath %>/static/images/tubiao.jpg">'); --%>
    }
	if(country_timeline_dic.length > 0){
		$("#country_start").attr("disabled",false);
		country_data = groupByDate1(country_timeline_dic);
	    var lendate = country_data.count;///
	    var date = country_data.seq[0];
	   	var dateEnd = country_data.seq[lendate-1];
	   	if(!date==""||!date==null||!date==undefined){
	   		if(date.length == 4){
	   			document.getElementById("country_date").value = date.slice(0,4)+"年";
	   	        document.getElementById("country_date_range").value = "轮播范围："+date.slice(0,4)+"年"+"-" + dateEnd.slice(0,4)+"年";
	   		}else if(date.length == 6){
	   			document.getElementById("country_date").value = date.slice(0,4)+"年"+date.slice(4,6)+"月";
	   	        document.getElementById("country_date_range").value = "轮播范围："+date.slice(0,4)+"年"+date.slice(4,6)+"月"+"-" + dateEnd.slice(0,4)+"年"+dateEnd.slice(4,6)+"月";
	   		}else if(date.length == 8){
	   			document.getElementById("country_date").value = date.slice(0,4)+"年"+date.slice(4,6)+"月"+date.slice(6,8)+"日";
	   	        document.getElementById("country_date_range").value = "轮播范围："+date.slice(0,4)+"年"+date.slice(4,6)+"月"+date.slice(6,8)+"日"+"-" + dateEnd.slice(0,4)+"年"+dateEnd.slice(4,6)+"月"+dateEnd.slice(6,8)+"日";
	   		}
	   	}
	    process_dic_to_heatmap(country_data.get(0), 'bubble_country', maxValue);
    	len1 = country_data.count;///
   	}else{
   		$("#country_start").attr("disabled",true);
   		$("#country_date").val("");
    	$("#country_date_range").val("");
    	process_dic_to_heatmap(country_timeline_dic, 'bubble_country');
   	}
    ///**************************city city city*******************///
    var city_line_dic = data.city_line_dic;
    var city_dic = data.city_dic;
    if(city_dic.length>0){
    	$("#selectCity").show();
	    $("#selectCity").html("");
	    var cityNum = city_dic.length > 20 ? 20:city_dic.length;
	    if(cityNum==1 && city_dic[0].value != 0){
			document.getElementById("selectCity").options.add(new Option("1","1"));
		}
        for(var i=2;i<=cityNum;i+=2){
        	document.getElementById("selectCity").options.add(new Option(i,i));
        }
        var	countryOptionCount = $("#selectCity option").map(function(){return $(this).val();}).get().join(", ");
		if(countryOptionCount.indexOf(8)!=-1){
			$("#selectCity option[value='8']").attr("selected",true);
			process_dic_to_amchart(city_dic,'pie_chart','pie_chart',8);
		}else{
			$("#selectCity").hide();
			process_dic_to_amchart(city_dic,'pie_chart','pie_chart',cityNum);
		}
	    
        $("#selectCity").change(function () {
        	var changeValue = $("#selectCity option:selected").val();
       		process_dic_to_amchart(city_dic,'pie_chart','pie_chart',changeValue);
        });
    }else{
    	$("#selectCity").hide();
    	$("#pie_chart").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
    }
    var city_timeline_dic = data.city_timeline_dic;
        var dtlen2 = city_dic.length > 20?20:city_dic.length;
        if(dtlen2 > 0){
        	$("#select_city").show();
        	for (var i = 0; i < dtlen2; i++)
            {
                var name=city_dic[i].name_key.toString();
                var number=(city_dic[i].value).toString();
                $("#select_city").append("<option value='"+name+"'>城市："+name+"   事件总数："+number + "</option>");
            }
        	$("#select_city").change(function() {process_dic_to_datechart(get_needed_date_dic(city_line_dic,$("#select_city").val()),'city_date_chart')});
    	    process_dic_to_datechart(get_needed_date_dic(city_line_dic,$("#select_city option:first").val()),'city_date_chart');
        }else{
        	$("#select_city").hide();
        	$("#city_date_chart").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
        }
        maxCityValue = data.maxCityValue;
        $("#maxCityValue").html(maxCityValue);
        if(city_timeline_dic.length > 0){
        	$(".heatTl").show();
        	$("#city_start").attr("disabled",false);
        	city_data = groupByDate2(city_timeline_dic);
    	    var date2 = city_data.seq[0];
    	    var lendate2 = city_data.count;///
    	   	var dateEnd2 = city_data.seq[lendate2-1];
    	    if(!date2==""||!date2==null||!date2==undefined){
    	    	if(date2.length == 4){
    	   			document.getElementById("city_date").value = date2.slice(0,4)+"年";
    	   	        document.getElementById("city_date_range").value = "轮播范围："+date2.slice(0,4)+"年"+"-" + dateEnd2.slice(0,4)+"年";
    	   		}else if(date2.length == 6){
    	   			document.getElementById("city_date").value = date2.slice(0,4)+"年"+date2.slice(4,6)+"月";
    	   	        document.getElementById("city_date_range").value = "轮播范围："+date2.slice(0,4)+"年"+date2.slice(4,6)+"月"+"-" + dateEnd2.slice(0,4)+"年"+dateEnd2.slice(4,6)+"月";
    	   		}else if(date2.length == 8){
    	   			document.getElementById("city_date").value = date2.slice(0,4)+"年"+date2.slice(4,6)+"月"+date2.slice(6,8)+"日";
    	   	        document.getElementById("city_date_range").value = "轮播范围："+date2.slice(0,4)+"年"+date2.slice(4,6)+"月"+date2.slice(6,8)+"日"+"-" + dateEnd2.slice(0,4)+"年"+dateEnd2.slice(4,6)+"月"+dateEnd2.slice(6,8)+"日";
    	   		}
    	    }
    	    process_dic_to_bubblemap3(city_data.get(0), 'bubble_city',maxCityValue);
    	    len3 = city_data.count;///
        }else{
        	$(".heatTl").hide();
        	$("#city_start").attr("disabled",true);
       		$("#city_date").val("");
        	$("#city_date_range").val("");
        	process_dic_to_bubblemap3(city_timeline_dic, 'bubble_city');
        }
    function get_needed_date_dic(date_dic,name) {
    	 if(!date_dic==""||!date_dic==null||!date_dic==undefined){ 
    		 var len=date_dic.length;
    	        var res=[];
    	        for (var i = 0; i < len; i++)
    	        {
    	            if(date_dic[i].name_key==name){
    	                res.push({"key":date_dic[i].date,"value":date_dic[i].value});
    	            }
    	        }
    	        return res;
    	    }
    }
    function groupByDate1(data) {
        var ret = {values: {}, seq:[]};
        var minValue, maxValue;
        data.forEach(function(e) {
            var c = {
                key: e.key,
                name_key: e.ch_key,
                color: e.value > 0 ? 'green' : 'red',
                value: e.value
            };
            minValue = minValue ? e.value : Math.min(minValue, e.value);
            maxValue = maxValue ? e.value : Math.max(maxValue, e.value);
            if (!(e.date in ret.values)) {
                ret.values[e.date] = [];
                ret.seq.push(e.date);
            }
            ret.values[e.date].push(c);
        });
        ret.seq.sort();
        ret.count = ret.seq.length;
        ret.get = function(idx) {
            return this.values[this.seq[idx]];
        };
        ret.minValue = minValue;
        ret.maxValue = maxValue;
        return ret;
    }
    function groupByDate2(data) {
        var ret = {values: {}, seq:[]};
        var minValue, maxValue;
        data.forEach(function(e) {
            var c = {
                lat: e.lat,
                long: e.long,
                key: e.name_key,
                color: e.value > 2000 ? 'red' : (e.value > 1000 ? '#ff4500' : (e.value > 100 ? 'green' : (e.value > 0 ? 'green' : '#ffffff'))),
                value: e.value
            };
            minValue = minValue ? e.value : Math.min(minValue, e.value);
            maxValue = maxValue ? e.value : Math.max(maxValue, e.value);
            if (!(e.date in ret.values)) {
                ret.values[e.date] = [];
                ret.seq.push(e.date);
            }
            ret.values[e.date].push(c);
        });
        ret.seq.sort();
        ret.count = ret.seq.length;
        ret.get = function(idx) {
            return this.values[this.seq[idx]];
        };
        ret.minValue = minValue;
        ret.maxValue = maxValue;
        return ret;
    }
    }
    function countryStart(){
    	///国家地图演化的js
    	var pos1 = 0;
       	if(!$("#country_start").hasClass("act")){
       		$("#country_start").addClass("act");
       	}else{
       		return;
       	}
           countryPlay = setInterval(function(){
               if(pos1==len1){// 到了最后一个则又重复执行
                   pos1 = 0;
               }
               else{
                   var date1 = country_data.seq[pos1];
                   if(date1.length==4){
       	        	document.getElementById("country_date").value = date1.slice(0,4)+"年";
       	        }
       	        if(date1.length==6){
       	        	document.getElementById("country_date").value = date1.slice(0,4)+"年"+date1.slice(4,6)+"月";
       	        }
       	        if(date1.length==8){
       		        document.getElementById("country_date").value = date1.slice(0,4)+"年"+date1.slice(4,6)+"月"+date1.slice(6,8)+"日";
       	        }
       	     	process_dic_to_heatmap(country_data.get(pos1), 'bubble_country');
                   pos1++;
               }
           },1000);// 每1秒执行一次
           timeArray.push(countryPlay);
        $('#country_stop').click(function() {
            clearInterval(countryPlay);
       		$("#country_start").removeClass("act");
        });
    }
    
    function cityStart(){
    	//城市地图演化的js
        var pos3 = 0;
        	if(!$("#city_start").hasClass("act")){
        		$("#city_start").addClass("act");
        	}else{
           		return;
           	}
            cityPlay = setInterval(function(){
                if(pos3==len3){// 到了最后一个则又重复执行
                    pos3 = 0;
                }
                else{
                    var date3 = city_data.seq[pos3];
                    if(date3.length==4){
        	        	document.getElementById("city_date").value = date3.slice(0,4)+"年";
        	        }
        	        if(date3.length==6){
        	        	document.getElementById("city_date").value = date3.slice(0,4)+"年"+date3.slice(4,6)+"月";
        	        }
        	        if(date3.length==8){
        		        document.getElementById("city_date").value = date3.slice(0,4)+"年"+date3.slice(4,6)+"月"+date3.slice(6,8)+"日";
        	        }
        	        process_dic_to_bubblemap3(city_data.get(pos3), 'bubble_city',maxCityValue);
                    pos3++;
                }
            },1000);// 每1秒执行一次
            timeArray.push(cityPlay);
        $('#city_stop').click(function() {
            clearInterval(cityPlay);
       		$("#city_start").removeClass("act");
        });
    }
    
    </script>
</html>