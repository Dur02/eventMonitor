<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>实体展示</title>
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
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/js/network/js/fancybox/jquery.fancybox.css"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/js/network/css/style.css" type="text/css" media="screen"/>
<link rel="stylesheet" media="screen and (max-height: 770px)" href="<%=basePath%>/static/Visualization/js/network/css/tablet.css"/>
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
		<h3 class="fl title" >图谱库分析 > 实体展示</h3>
	</div>
	<div class="index_bottom">
	<!-- 显示图 -->
	 <input type="hidden" id="moduleCode" value="${moduleCode}">
		 <div class="data show">
			 <div class="row">
					<div class="col-md-12 mg_t">
						<div id="chart-content">
							<div class="col-md-6 bor w50l">
								<h3 class="tx-l"><span id="stname" style="border:0px;font-size:14px;"></span>
									<select class="selectCounts" id="selectXGST">
									</select>
									<div  class="help" onmouseover="showChartInfo(1,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
								</h3>
								<div id="pie_chart_1" class="amcharts twoCharts"></div>
							</div>
							<div class="col-md-6 bor w50r">
								<h3 class="tx-l"><span id="stname2" style="border:0px;font-size:14px;"></span>
		                        	<select class="selectCounts" id="selectSTLX">
									</select>	
									<div  class="help" onmouseover="showChartInfo(2,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>		
								</h3>
								<div id="pie_chart_2" class="amcharts twoCharts">
								</div>
							</div>
						</div>
					</div>
				</div>
		 
		 
       	<!--< div class="row"  >
        <div class="col-md-12 mg_t">
            <div class="col-md-10" style="width:100%;border: 1px solid #CCCCCC;width:49.5%;border-radius:5px; float:left;height:437px">
                 <div class="col-md-5 chart-text" id="pie_chart_text_1" style="opacity:1;margin-top:0px;width: 50%;">
                <h3 id="stname" class="tx-l">
                	<select class="selectCounts" style="margin-left:-10px;" id="selectXGST">
                   	</select>
                </h3>
            </div>
            <div class="col-md-7" style="width:100%;">
                <div id="pie_chart_1" class="amcharts"></div>
            </div>
                </div>
			    <div class="col-md-10" style="width:100%;height:437px;border: 1px solid #CCCCCC;width:49.5%; float:right;border-radius:3px;">
                <div class="col-md-5 chart-text" id="pie_chart_text_2" style="opacity:1;margin-top:0px;width: 50%;">
                     <h3 id="stname2" class="tx-l">
                     	<select class="selectCounts" style="margin-left:-15px;" id="selectSTLX">
                   		</select>
                     </h3>
                </div>
                <div class="col-md-7" style="width:100%;">
                    <div id="pie_chart_2" class="amcharts"></div>
                </div>
                </div>
                </div>
        </div> -->
        <!-- <div class="row2" style="width:100%;height:660px;border: 1px solid #CCCCCC;width:100%; float:right;border-radius:3px;margin-bottom:70px;margin-top:15px;">
        <div class="container show-graph">
        <div class="row">
         <div class=" mg_t ">
            <div class="col-md-10" style="width:100%;text-align:center;margin-top:-13px;">
                <h1 style="font-size:14px; color:black;">实体网络分布 </h1>
            </div>
      </div>
        </div>
    </div>
    <div id="net_viz" class="container">
        <div id="mainpanel">
            <div class="col">
                <div id="maintitle">
                </div>
                <div id="title">
                </div>
                <div id="titletext"></div>
                <div id="legend">
                    <div class="box">
                        <dl>
                            <dt class="node"></dt>
                            <dd></dd>
                            <dt class="edge"></dt>
                            <dd></dd>
                            <dt class="colours"></dt>
                            <dd></dd>
                        </dl>
                    </div>
                </div>
                <div class="b1">
                    <form>
                        <div id="search" class="cf"><h2>搜索实体:</h2>
                            <input type="text" name="search" placeholder="输入实体名" class="empty"/>
                            <div class="state"></div>
                            <div class="results"></div>
                        </div>
                        <div class="cf" id="attributeselect"><h2>社区选择器:</h2>
                            <div class="select">点击选择</div>
                            <div class="list cf"></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div id="zoom">
            <div class="z fa fa-search-plus" rel="in"></div>
            <div class="z fa fa-search-minus" rel="out"></div>
            <div class="z fa fa-search" rel="center"></div>
        </div>
        <div id="attributepane">
            <div class="text">
                <div class="headertext">
                    <span>实体信息</span>
                </div>
                <div class="nodeattributes">
                    <div class="name"></div>
                    <div class="data"></div>
                    <div class="p">Connections:</div>
                    <div class="link">
                        <ul>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="sigma-parent">
            <div class="sigma-expand" id="sigma-canvas"></div>
        </div>
    </div>
    </div> -->
    </div>
    </div>
	<!-- 页面底部收缩 -->
		<jsp:include page="graph_tab3.jsp"></jsp:include>
	<!-- 页面底部收缩结束 -->
	<jsp:include page="../updateUserPassword.jsp"/>
</body>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/jquery-1.11.1.min.js"></script>
<script src="<%=basePath%>/static/lib/jquery.pagination.js"></script>
<script src="<%=basePath%>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath%>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath%>/static/js/jquery.mousewheel.js"></script>
<%-- <script src="<%=basePath%>/static/js/perfect-scrollbar.js"></script> --%>
<script src="<%=basePath%>/static/js/sec2.js"></script>
<%-- <script src="<%=basePath%>/static/js/yuzhi.js"></script> --%>
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
<script src="<%=basePath%>/static/Visualization/js/jqcloud/jqcloud.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/d3.layout.cloud.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/d3.v3.min.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/serial.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/pie.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/js/config/config.js"></script>
<script src="<%=basePath%>/static/Visualization/js/network/js/sigma/sigma.min.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/network/js/sigma/sigma.parseJson.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/network/js/fancybox/jquery.fancybox.pack.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/network/js/main.js" type="text/javascript" language="javascript"></script>
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
		//处理配置
		handleConfigs();
		//美化滚动条
		/* glorifyComboSelect(); */
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
				url:'<%=basePath%>/search/graph_net_viz/'+configId,
				type: 'POST',
				dataType:"json",
				success:function(obj_result){
					if(obj_result=="-1"){
						endLoad();
						alert("加载失败");
					}
					renderData(obj_result);
					endLoad();
				}
			});
		}
		function renderData(obj_result){
			$("#sigma-canvas").empty();
			var node_dic = obj_result.node_dic;
			var a = obj_result.entity_type[0];
			var ina = a + "实体统计";
			var ina2 = a + "实体联系统计";
			$("#stname").text(ina);
			$("#stname2").text(ina2);
			 if(node_dic.length>0){
				 $("#selectXGST").show();
				 $("#selectXGST").html(""); 
		         $("#selectXGST option[value='8']").attr("selected",true);
		         var nodeNum = node_dic.length > 20 ? 20:node_dic.length;
		         /* if(nodeNum==1 && node_dic[0].value != 0){
						document.getElementById("selectXGST").options.add(new Option("1","1"));
				 } */
				for(var i=2;i<=nodeNum;i+=2){
					document.getElementById("selectXGST").options.add(new Option(i,i));
				}
				var countryOptionCount = $("#selectXGST option").map(function(){return $(this).val();}).get().join(", ");
				if(countryOptionCount.indexOf(8)!=-1){
					$("#selectXGST option[value='8']").attr("selected",true);
					process_dic_to_pie(node_dic,'pie_chart','pie_chart_1',8);
				}else{
					$("#selectXGST").hide();
					process_dic_to_pie(node_dic,'pie_chart','pie_chart_1',nodeNum);
				}
				
				 $("#selectXGST").change(function () {
		        	var changeValue = $("#selectXGST option:selected").val();
		        	process_dic_to_pie(node_dic,'pie_chart','pie_chart_1',changeValue);
		         });
			 }else{
				 $("#selectXGST").hide(); 
				 $("#pie_chart_1").html('<img alt="" class="tubiao2"  src="<%=basePath %>/static/images/tubiao2.png">');
			 }
			 var edge_dic = obj_result.edge_dic;
			 if(edge_dic.length>0){
				 $("#selectSTLX").show();
				 $("#selectSTLX").html(""); 
		         var edgeNum = edge_dic.length > 20 ? 20:edge_dic.length;
		        /*  if(edgeNum==1 && edge_dic[0].value != 0){
						document.getElementById("selectSTLX").options.add(new Option("1","1"));
					} */
				for(var i=2;i<=edgeNum;i+=2){
					document.getElementById("selectSTLX").options.add(new Option(i,i));
				}
				var countryOptionCount = $("#selectSTLX option").map(function(){return $(this).val();}).get().join(", ");
				if(countryOptionCount.indexOf(8)!=-1){
					$("#selectSTLX option[value='8']").attr("selected",true);
					process_dic_to_pie(edge_dic,'pie_chart','pie_chart_2');
				}else{
					$("#selectSTLX").hide();
					process_dic_to_pie(edge_dic,'pie_chart','pie_chart_2',edgeNum);
				}
				
				 $("#selectSTLX").change(function () {
		        	var changeValue = $("#selectSTLX option:selected").val();
		        	process_dic_to_pie(edge_dic,'pie_chart','pie_chart_2',changeValue);
		         });
			 }else{
				 $("#selectSTLX").hide();
				 $("#pie_chart_2").html('<img alt="" class="tubiao2"  src="<%=basePath %>/static/images/tubiao2.png">');
			 }
			 <%-- jQuery.getJSON(GetQueryStringParams("config", '<%=basePath%>/static/Visualization/js/network/js/config.json'), function (data, textStatus, jqXHR) {
		            config = data;
		            config.data = obj_result.network;
		            $(document).ready(setupGUI(config));
		        }); --%>
		}
    </script>
</html>