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
<title>地理时间演化</title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/style.css">
<!-- 人工查询日期 -->
<link rel="stylesheet"
	href="<%=basePath%>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="<%=basePath%>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath%>/static/lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/combo.select.css">
<link rel="stylesheet"
	href="<%=basePath%>/static/css/perfect-scrollbar.css" />
<link rel="stylesheet"
	href="<%=basePath%>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="<%=basePath%>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath%>/static/lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/combo.select.css">
<!--引入页面下边的条件查询的展示tab  -->
<link rel="stylesheet"
	href="<%=basePath%>/static/css/perfect-scrollbar.css" />
<!--引入页面下边的条件查询的展示tab  -->
<link rel="shortcut icon" type="image/x-icon"
	href="<%=basePath%>/static/Visualization/base/ico.png" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/static/Visualization/base/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/static/Visualization/base/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/static/Visualization/base/base.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/static/Visualization/css/event_result.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/static/Visualization/js/amcharts/export/export.css" />
<link rel="stylesheet"
	href="<%=basePath%>/static/Visualization/css/leaflet/leaflet.css"
	type="text/css" media="screen" />
<link rel="stylesheet"
	href="<%=basePath%>/static/Visualization/css/leaflet/dvf.css"
	type="text/css" media="screen" />
<link rel="stylesheet"
	href="<%=basePath%>/static/Visualization/css/leaflet/example.css"
	type="text/css" media="screen" />
<link rel="stylesheet"
	href="<%=basePath%>/static/Visualization/css/leaflet/ui.css"
	type="text/css" media="screen" />
<link rel="stylesheet"
	href="<%=basePath%>/static/Visualization/css/countrymap.css"
	type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window_zs.css"/><!-- 弹出提示框样式 -->
</head>
<script src="<%=basePath%>/static/js/jquery-1.9.1.min.js"></script>
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
<body>
	<div class="index_top clearfix">
		<h3 class="fl title">事件库分析 > 地理时间演化展示</h3>
		<!-- <div class="title_r fr">
			<span class="export_img_2" title="图表切换"></span>
			<span class="info_img"></span>
			<ul class="info_box">
				<li><span>数据：</span>事件数据库</li>
				<li><span>描述：</span>反映一段时间内，某地发生的事件的对比情况</li>
				<li><span>输入：</span>对比信息，事件编码，阈值信息</li>
				<li><span>介绍：</span>ttajkasdasdfa asdfasdf asdfa啊发生的发生地阿打法的疯狂拉升地方案的发生发生的法律看见俺十分啊发生的发生地发沙发</li>
			</ul>
		</div> -->
	</div>
	<div class="index_bottom">
		<div class="data show">
				<div class="row">
					<div class="col-md-12 mg_t">
			                <div class="col-md-12 map-text">
			                	<input type="hidden" id="moduleCode" value="${moduleCode}">
			                    <h3 class="tx-c mapText_heat_time">国家<span class="one" style="font-size: 13px;">事件</span>热点图
			                    	<div  class="help" onmouseover="showChartInfo(1,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
			                    </h3>
			                    <input type="text" id="country_date" style="border:0px;text-align:center;"readonly="true">
			                	
			                </div>
			                <div class="bor">
			                    <div id="bubble_country" class="ammap myAmchartMap" ></div>
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
			        <div class="col-md-12">
						<div class="col-md-12 mg_t bor">
			                <div class="col-md-12">
			                    <div class="map-text">
			                        <h3>国家<span class="one" style="font-size: 13px;">事件</span>稳定统计
			                        	<select class="selectCounts" style="margin-left:10px;" id="selectCountry">
			                        	</select>
			                        	<div  class="help" onmouseover="showChartInfo(2,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
			                        </h3>
			                    </div>
			                    <div class="col-md-12">
			                        <div id="line_column_chart" class="amcharts oneColumChart"></div>
			                    </div>
			                </div>
			             </div>
			        </div>	
		        </div>
				<div class="row">
					<div class="col-md-12 mg_t">
		                <!-- <div class="col-md-12 bor">
			                <div class="map-text">
			                    <h3>国家<span class="one">事件</span>时间线 </h3>
			                </div>
			                <div style="margin-left: 5%;margin-right: 8%">
			                    <select id="select_country_1" class="form-control selectCounts">
			                    </select>
			                </div>
			                <div id="country_date_chart" class="amcharts" style="height: 366px;"></div>
			            </div> -->
			            <div class="col-md-12 bor">
		                    <div class="map-text">
		                        <h3>国家<span class="one" style="font-size: 13px;">事件</span>稳定时间线
		                        	<div  class="help" onmouseover="showChartInfo(3,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
		                        </h3>
		                    </div>
		                    <div class="newTuBiao" style="margin-left: 5%;margin-right: 8%">
		                        <select  id="select_country_2" class="form-control selectCounts">
		                        </select>
		                    </div>
		                    <div class="col-md-12">
		                        <div id="double_line_chart" class="amcharts oneColumChart" ></div>
		                    </div>
		                </div>
			        </div>
		        </div>
		        
        		<!--city-->
        		<div class="row">
					<div class="col-md-12 mg_t">
			                <div class="col-md-12 map-text">
			                    <h3 class="tx-c mapText_heat_time">城市<span class="one" style="font-size: 13px;">事件</span>热点图
			                    	<div  class="help" onmouseover="showChartInfo(4,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
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
        		<!-- <div class="row">
        			<div class="col-md-12">
			            <div class="col-md-12 mg_t bor">
			                <div class="map-text">
			                    <h3>城市<span class="one" style="font-size: 13px;">事件</span>热点图</h3>
			                    <input type="text" id="city_date" style="border:0px;text-align:center;">
			                	<input type="text" id="city_date_range" style="width:140px;text-align:center; position:absolute; right:98px;">
			                </div>
			                <div class="col-md-12">
			                    <div id="bubble_city" class="ammap" style="height:400px;"></div>
			                    <div style="position: absolute;z-index: 99;right:100px;top: 5px">
			                        <div class="btn-group">
			                            <buttun type="button" class="btn btn-default" id="city_start">开始</buttun>
			                            <buttun type="button" class="btn btn-default" id="city_stop">停止</buttun>
			                        </div>
			                    </div>
			                </div>
			            </div>
			        </div>
		        </div> -->
		        
		        <div class="row"> 
			        <div class="col-md-12">
						<div class="col-md-12 mg_t mg_b bor">
		                    <div class="map-text">
		                        <h3>城市事件统计
		                        	<select class="selectCounts" id="selectCity"></select>
		                        	<div  class="help" onmouseover="showChartInfo(5,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
		                        </h3>
		                    </div>
		                    <div id="pie_chart" class="amcharts oneColumChart"></div>
			             </div>
			        </div>	
	            </div>
		        <%-- <div class="row">
			        <div class="col-md-12 mg_b mg_t">
			            <div class="col-md-12  bor">
			            	<div class="fl" id="pie_chart_text">
			                    <h3>城市<span class="tx-c mapText_heat_time" style="font-size: 13px;">事件</span>统计
		                    		<select class="selectCounts" style="margin-left:10px;" id="selectCity">
		                        	</select>
		                        	<div  class="help" onmouseover="showChartInfo(5,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
			                    </h3>
			                </div>
			                <div class="col-md-12">
			                    <div id="pie_chart" class="amcharts oneColumChart"></div>
			                </div>
		                </div>
			        </div>    
		        </div> --%>
		</div>
		<%-- <div class="data2">
			<table class="table">
				<thead>
					<tr>
						<th>序号</th>
						<th>排序</th>
						<th>挂起</th>
						<th>事件名称</th>
						<th>事件分类</th>
						<th>创建人</th>
						<th>创建日期</th>
						<th>备注信息</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td><span class="sort sort1">1</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>2</td>
						<td><span class="sort sort2">2</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>3</td>
						<td><span class="sort sort3">3</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>3</td>
						<td><span class="sort sort7">4</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>5</td>
						<td><span class="sort sort7">5</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>6</td>
						<td><span class="sort sort7">6</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>7</td>
						<td><span class="sort sort7">7</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>8</td>
						<td><span class="sort sort7">8</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>9</td>
						<td><span class="sort sort7">9</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>10</td>
						<td><span class="sort">10</span></td>
						<td></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state2.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>11</td>
						<td><span class="sort sort10">11</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq2.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>12</td>
						<td><span class="sort">12</span></td>
						<td><!-- <img class="gq" src="../<%=basePath %>/static/images/gq.png" alt="挂起"> --></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state3.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
				</tbody>
			</table>
			<div id="Pagination" class="pagination"><!-- 这里显示分页 --></div>
			<div id="Searchresult">分页初始化完成后这里的内容会被替换。</div>
		</div>  --%>
	<!-- 条件tab页 st -->
	<jsp:include page="event_tab1.jsp"></jsp:include>
	</div>
	<jsp:include page="../updateUserPassword.jsp"/>
</body>
<!-- 人工查询日期 -->
<script src="<%=basePath %>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-select.min.js"></script>
<script src="<%=basePath %>/static/js/jquery.combo.select.js"></script>
<script src="<%=basePath %>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath %>/static/js/perfect-scrollbar.js"></script>
<script src="<%=basePath %>/static/js/sec2.js"></script>
<%-- <script type="text/javascript" src="<%=basePath %>/static/Visualization/base/js/jquery-1.11.1.min.js"></script> --%>
<script type="text/javascript" src="<%=basePath %>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/Visualization/base/base.js"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/amcharts.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/themes/light.js" type="text/javascript"></script>
<%-- <script src="<%=basePath %>/static/Visualization/js/amcharts/export.min.js" type="text/javascript"></script>
 --%><script src="<%=basePath %>/static/Visualization/js/amchart_util.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/ammap.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/ammap_util.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/export/export.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/serial.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/xy.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/pie.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/radar.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/worldLow.js" type="text/javascript"></script>
<!-- 人工查询js -->
<script src="<%=basePath %>/static/Visualization/rgQuery.js"></script>

<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
<c:if test="${bgFlag == null or bgFlag == 1}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
</c:if>

<script type="text/javascript" src="<%=basePath%>/static/Visualization/downLoad.js"></script>
<!-- 计算显示图的高度 -->	
<script src="<%=basePath%>/static/js/chartHeight.js"" type="text/javascript"></script>
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<script type="text/javascript">
	$(function(){
		/* //美化图表展示界面的右侧滚动条
		index_bottom_perfectScrollbar(); */
		//处理配置
		handleConfigs();
		//美化滚动条
		glorifyComboSelect();
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

	////////////////////////////////////////////////////////////////////////////
		// 控制选择年月日
		$(".date").on("click",function(){
			$(this).addClass("active_span").siblings().removeClass("active_span");
		});
		$(".date:eq(5)").on("click",function(){
			$('#dateType').val(3);
			$(".lab1,.lab2").css("display","none");
			$(".lab0").css("display","inline-block");

			$('.year1').datepicker({
				format: 'yyyy', 
				weekStart: 0,
				autoclose: true, 
				orientation:" top auto",
				startView: 2, 
				maxViewMode: 2,
				minViewMode:2,
				forceParse: false, 
				language: 'zh-CN',
				startDate: '${minDate[0]}',
				endDate : '${maxDate[0]}',
			}).on('changeDate',function(e){  
				if($(this).val() > $('.year2').val()){
					$('.year2').val($(this).val());
				}
			    var startTime = e.date;  
			    $('.year2').datepicker('setStartDate',startTime);  
			}); 
			$('.year2').datepicker({
				format: 'yyyy', 
				weekStart: 0,
				autoclose: true, 
				orientation:" top auto",
				startView: 2, 
				maxViewMode: 2,
				minViewMode:2,
				forceParse: false, 
				language: 'zh-CN',
				startDate: '${minDate[0]}',
				endDate : '${maxDate[0]}'
			}).on('changeDate',function(e){ 
				if($(this).val() < $('.year1').val()){
					$('.year1').val($(this).val());
				}
			    var endTime = e.date;  
			    $('.year').datepicker('setEndDate',endTime);  
			}); 
		});
		$(".date:eq(6)").on("click",function(){
			$('#dateType').val(2);
			$(".lab0").css("display","none");
			$(".lab1").css("display","inline-block");
			$(".lab2").css("display","none");

			$('.month1').datepicker({
				format: 'yyyy-mm', 
				weekStart: 0, 
				autoclose: true, 
				orientation:" top auto",
				startView: 1, 
				maxViewMode: 2,
				minViewMode:1,
				forceParse: false, 
				language: 'zh-CN',
				startDate: '${minDate[1]}',
				endDate: '${maxDate[1]}'
			}).on('changeDate',function(e){ 
				if($(this).val() > $('.month2').val()){
					$('.month2').val($(this).val());
				}
			    var startTime = e.date;  
			    $('.month2').datepicker('setStartDate',startTime);  
			});

			$('.month2').datepicker({
				format: 'yyyy-mm', 
				weekStart: 0, 
				autoclose: true, 
				orientation:" top auto",
				startView: 1, 
				maxViewMode: 2,
				minViewMode:1,
				forceParse: false, 
				language: 'zh-CN',
				startDate: '${minDate[1]}',
				endDate: '${maxDate[1]}'
			}).on('changeDate',function(e){  
				if($(this).val() < $('.month1').val()){
					$('.month1').val($(this).val());
				}
			    var endTime = e.date;  
			    $('.month1').datepicker('setEndDate',endTime);  
			});
		});
		$(".date:eq(7)").on("click",function(){
			$('#dateType').val(1);
			$(".lab0").css("display","none");
			$(".lab1").css("display","none");
			$(".lab2").css("display","inline-block");

			$('.day').datepicker({
				format: 'yyyy-mm-dd', 
				weekStart: 0,
				autoclose: true, 
				orientation:" top auto",
				startView: 0,
				maxViewMode: 2,
				minViewMode:0,
				forceParse: false, 
				language: 'zh-CN',
			});
			$('.day').datepicker('setStartDate','2014-12-01');
		});
	});
	var timeArray = [];
    //事件地理时间渲染图表
	function render(configId){
		startLoad();
			 var resultcode = 'ALL';
				$.ajax({
					url:'<%=basePath %>/search/event_timeline_geo_viz/'+configId,
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
    	//演化按钮的样式
    	if($("#country_start").hasClass("act")){
    		$("#country_start").removeClass("act");
    	}
    	if($("#city_start").hasClass("act")){
    		$("#city_start").removeClass("act");
    	}
    	for(var i=0;i<timeArray.length;i++){
			clearInterval(timeArray[i]);
		}
		//$("#select_country_1").html("");
		$("#select_country_2").html("");
		//$("#select_city").html("");
        var country_dic = data.country_dic;
        var totalWeight =  data.totalWeight;
        if(totalWeight.length>0){
        	if(totalWeight[0]==1){
       		    $(".one").text("事件");
        	}
        	if(totalWeight[0]==2){
        		$(".one").text("文章数");
        	}
        	if(totalWeight[0]==3){
        		$(".one").text("信源数");
        	}
        	if(totalWeight[0]==4){
        		$(".one").text("事件(去重)");
        	}
        	
        }
        if(country_dic.length>0){
        	$("#selectCountry").show();
	        $("#selectCountry").html(""); 
	        var countryNum = country_dic.length > 20 ? 20:country_dic.length;
	        /* if(countryNum<5){
	        	for(var i=1;i<=countryNum;i++){
					document.getElementById("selectCountry").options.add(new Option(i,i));
	        	}
	        } */
	        for(var i=5;i<=countryNum;i+=5){
	        	document.getElementById("selectCountry").options.add(new Option(i,i));
	        }
	        var	countryOptionCount = $("#selectCountry option").map(function(){return $(this).val();}).get().join(", ");
			if(countryOptionCount.indexOf(10)!=-1){
				$("#selectCountry option[value='10']").attr("selected",true);
				process_dic_to_line_column_chart(country_dic,'line_column_chart',0,totalWeight[0]);//柱状图加折线图（组合）
			}else{
				$("#selectCountry").hide();
				process_dic_to_line_column_chart(country_dic,'line_column_chart',countryNum,totalWeight[0]);//柱状图加折线图（组合）
			}
	        
	        $("#selectCountry").change(function () {
	        	var changeValue = $("#selectCountry option:selected").val();
	        	process_dic_to_line_column_chart(country_dic,'line_column_chart',changeValue,totalWeight[0]);//柱状图加折线图（组合）
	        });
        }else{
        	$("#selectCountry").hide();
        	$("#line_column_chart").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
        }
        
        var country_timeline_dic = data.country_timeline_dic;
        maxValue = data.maxValue;
        var dtlen = country_dic.length;
        for (var i = 0; i < dtlen; i++)
        {
            var name=country_dic[i].name_key.toString();
            var number=(country_dic[i].value).toString();
            var scale=(country_dic[i].scale_value).toString();
            if(totalWeight[0]==1)
	    		{
            	 //$("#select_country_1").append("<option value='"+name+"'>国家："+name+"   事件总数："+number + "</option>");
                 $("#select_country_2").append("<option value='"+name+"'>国家："+name+"   事件总数："+number+"    稳定性："+scale+"</option>");
	    		}
    		
		    if(totalWeight[0]==2){
		    	 //$("#select_country_1").append("<option value='"+name+"'>国家："+name+"     文章总数："+number + "</option>");
	             $("#select_country_2").append("<option value='"+name+"'>国家："+name+"  文章总数："+number+"    稳定性："+scale+"</option>");
		    	}
	    	if(totalWeight[0]==3){
	    		//$("#select_country_1").append("<option value='"+name+"'>国家："+name+"   信源总数："+number + "</option>");
	            $("#select_country_2").append("<option value='"+name+"'>国家："+name+"   信源总数："+number+"    稳定性："+scale+"</option>");
	    	}
	    	if(totalWeight[0]==4){
	    		//$("#select_country_1").append("<option value='"+name+"'>国家："+name+"   事件(去重)总数："+number + "</option>");
	            $("#select_country_2").append("<option value='"+name+"'>国家："+name+"   事件(去重)总数："+number+"    稳定性："+scale+"</option>");
	    	}
            
        }
        
        /* $("#select_country_1").change(function() {process_dic_to_datechart(get_needed_date_dic(country_timeline_dic,$("#select_country_1").val()),'country_date_chart')});
        process_dic_to_datechart(get_needed_date_dic(country_timeline_dic,$("#select_country_1 option:first").val()),'country_date_chart'); */
		
        if(country_timeline_dic!=""){
        	$("#country_start").attr("disabled",false);
        	$(".newTuBiao").show();
	        $("#select_country_2").change(function() { process_dic_to_double_line_chart(country_timeline_dic,$("#select_country_2").val(),'double_line_chart',totalWeight[0]);});
	        process_dic_to_double_line_chart(country_timeline_dic,$("#select_country_2 option:first").val(),'double_line_chart',totalWeight[0]);
	        
	        
	        country_data = groupByDate1(country_timeline_dic);
	        len1 = country_data.count;///
	        var date = country_data.seq[0];
	        var dateTwo = country_data.seq[len1-1];
	        if(date.length==4){
		        document.getElementById("country_date").value = date.slice(0,4)+"年";
		        document.getElementById("country_date_range").value = "轮播范围："+date.slice(0,4)+"年"+"-"+dateTwo.slice(0,4)+"年";
	        }
	        if(date.length==6){
		        document.getElementById("country_date").value = date.slice(0,4)+"年"+date.slice(4,6)+"月";
		        document.getElementById("country_date_range").value = "轮播范围："+date.slice(0,4)+"年"+date.slice(4,6)+"月"+"-"+dateTwo.slice(0,4)+"年"+dateTwo.slice(4,6)+"月";
	        }
	        if(date.length==8){
		        document.getElementById("country_date").value = date.slice(0,4)+"年"+date.slice(4,6)+"月"+date.slice(6,8)+"日";
		        document.getElementById("country_date_range").value = "轮播范围："+date.slice(0,4)+"年"+date.slice(4,6)+"月"+date.slice(6,8)+"日"+"-"+dateTwo.slice(0,4)+"年"+dateTwo.slice(4,6)+"月"+dateTwo.slice(6,8)+"日";
	        }
	        process_dic_to_heatmap(country_data.get(0), 'bubble_country',maxValue);
	       
        }else{
        	process_dic_to_bubblemap(country_timeline_dic,'bubble_country');//国家
        	$("#country_start").attr("disabled",true);
        	$("#country_date").val("");
        	$("#country_date_range").val("");
        	$(".newTuBiao").hide();
        	$("#double_line_chart").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
        }
        /////////city/////////
        var city_dic = data.city_dic;
        if(city_dic.length>0){
        	$("#selectCity").show(); 
	        $("#selectCity").html(""); 
	        var cityNum = city_dic.length > 20 ? 20:city_dic.length;
	        /* if(cityNum==1){
				document.getElementById("selectCity").options.add(new Option("1","1"));
			} */
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
        	$("#pie_chart").html('<img alt="" class="tubiao2"  src="<%=basePath %>/static/images/tubiao2.png">');
        }
        var city_timeline_dic = data.city_timeline_dic;
        /* var dtlen2 = city_dic.length;
        for (var i = 0; i < dtlen2; i++)
        {
            var name=city_dic[i].name_key.toString();
            var number=(city_dic[i].value).toString();
            if(totalWeight[0]==1)
    		{
            	$("#select_city").append("<option value='"+name+"'>城市："+name+"   事件总数："+number + "</option>");
    		}
    		
    	if(totalWeight[0]==2){
    		   $("#select_city").append("<option value='"+name+"'>城市："+name+"   文章总数："+number + "</option>");
    	}
    	if(totalWeight[0]==3){
    		   $("#select_city").append("<option value='"+name+"'>城市："+name+"   信源总数："+number + "</option>");
    	}
    	if(totalWeight[0]==4){
    		  $("#select_city").append("<option value='"+name+"'>城市："+name+"   事件(去重)总数："+number + "</option>");
    	}
            
        }
        $("#select_city").change(function() {process_dic_to_datechart(get_needed_date_dic(city_timeline_dic,$("#select_city").val()),'city_date_chart')});
        process_dic_to_datechart(get_needed_date_dic(city_timeline_dic,$("#select_city option:first").val()),'city_date_chart');
        */ 
        maxCityValue = data.maxCityValue;
        $("#maxCityValue").html(maxCityValue);
        if(city_timeline_dic!=""){
        	$(".heatTl").show();
        	$("#city_start").attr("disabled",false);
	        city_data = groupByDate2(city_timeline_dic);
	        var date2 = city_data.seq[0];
	        len3 = city_data.count;///
	        var dateTwo2 = city_data.seq[len3-1];
	        if(date2.length==4){
		        document.getElementById("city_date").value = date2.slice(0,4)+"年";
		        document.getElementById("city_date_range").value = "轮播范围："+date2.slice(0,4)+"年"+"-"+dateTwo2.slice(0,4)+"年";
	        }
	        if(date2.length==6){
		        document.getElementById("city_date").value = date2.slice(0,4)+"年"+date2.slice(4,6)+"月";
		        document.getElementById("city_date_range").value = "轮播范围："+date2.slice(0,4)+"年"+date2.slice(4,6)+"月"+"-"+dateTwo2.slice(0,4)+"年"+dateTwo2.slice(4,6)+"月";
	        }
	        if(date2.length==8){
		        document.getElementById("city_date").value = date2.slice(0,4)+"年"+date2.slice(4,6)+"月"+date2.slice(6,8)+"日";
		        document.getElementById("city_date_range").value = "轮播范围："+date2.slice(0,4)+"年"+date2.slice(4,6)+"月"+date2.slice(6,8)+"日"+"-"+dateTwo2.slice(0,4)+"年"+dateTwo2.slice(4,6)+"月"+dateTwo2.slice(6,8)+"日";
	        }
	        process_dic_to_bubblemap3(city_data.get(0), 'bubble_city',maxCityValue);
	        
        }else{
        	$(".heatTl").hide();
        	$("#city_start").attr("disabled",true);
        	$("#city_date").val("");
        	$("#city_date_range").val("");
        	process_dic_to_bubblemap(city_timeline_dic,'bubble_city',maxCityValue);//城市
        }
		
    }
///////success函数中每次调用的方法
    function get_needed_date_dic(date_dic,name) {
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
    function groupByDate1(data) {
        var ret = {values: {}, seq:[]};
        var minValue, maxValue;
        data.forEach(function(e) {
            var c = {
                key: e.key,
                name_key: e.name_key,
                color: e.scale_value > 0 ? 'green' : 'red',
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
                color: e.value > maxCityValue/4*3 ? 'red' : (e.value > maxCityValue/4*2 ? '#ff4500' : (e.value > maxCityValue/4*1 ? 'green' : 'limegreen')),
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
    function buttonOnclick(){
    	$(".btn-default").click(function(){
    		$(".btn-default")
    	})
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
       	     	process_dic_to_heatmap(country_data.get(pos1), 'bubble_country',maxValue);
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