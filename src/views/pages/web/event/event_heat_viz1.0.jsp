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
<title>事件热点展示</title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/style.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/sec2.css">
<!--人工查询 -->
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath %>/static//lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath %>/static/css/combo.select.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/perfect-scrollbar.css"/>
<link rel="shortcut icon" type="image/x-icon" href="<%=basePath %>/static/Visualization/base/ico.png"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/base/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/base/base.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/base/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/css/event_result.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/js/amcharts/export/export.css"/>
<link rel="stylesheet" href="<%=basePath %>/static/Visualization/css/leaflet/leaflet.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath %>/static/Visualization/css/leaflet/dvf.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath %>/static/Visualization/css/leaflet/example.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath %>/static/Visualization/css/leaflet/ui.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath %>/static/Visualization/css/heatmap.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath %>/static/Visualization/css/conflict_viz.css" type="text/css" />
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window_zs.css"/><!-- 弹出提示框样式 -->
<script src="<%=basePath%>/static/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>/static/lib/jquery.pagination.js"></script>
<%-- 
<script src="<%=basePath %>/static/js/layui/layui.js"></script>
 --%>
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
		<h3 class="fl title">事件库分析 > 热点展示</h3>
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
		<!--热点事件图表dom  -->
		<div class="data show">
			<input type="hidden" id="moduleCode" value="${moduleCode}">
	        <div class="row heatRow">
	        	<div class="col-md-12 mg_t">
	        		<h3 class="tx-c mapText">热力图展示
	        			<div  class="help" onmouseover="showChartInfo(1,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
	        		</h3>
		            <div class="bor">
		                <div id="map" class="myleafletjsMap"></div>
		                <div id="info">
		                    <div class="col-md-12 text-center black">
		                        <h4>Heat Range</h4>
		                    </div>
		                    <div class="col-md-12">
		                        <div class="col-md-2" style="background: mediumpurple;height: 5px;"></div>
		                        <div class="col-md-2" style="background: limegreen;height: 5px;"></div>
		                        <div class="col-md-4" style="background: orange;height: 5px;"></div>
		                        <div class="col-md-2" style="background: orangered;height: 5px;"></div>
		                        <div class="col-md-2" style="background: red;height: 5px;"></div>
		                    </div>
		                    <div class="col-md-12">
		                        <div class="col-md-6 text-left black"><h6>Low</h6></div>
		                        <div class="col-md-6 text-right black"><h6>High</h6></div>
		                    </div>
		                </div>
		            </div>
	            </div>
	        </div>
	        <!-- <div class="row">
	        	<div class="col-md-12 mg_t">
		        	<div class="col-md-12 bor">	
	                   <h3 class="tx-c">热点国家展示
	                   	<select class="selectCounts" style="margin-left:10px;" id="selectCountry"></select> 
	                   </h3>
	                   <div id="graph_country" class="amcharts"></div>
	                 </div>
	        	</div>
	        </div> -->
	        
	        <div class="row" >
				<div class="col-md-12 mg_t mg_b">
		                <div class="col-md-12 map-text">
		                    <h3 class="tx-c mapText_heat">热点地理展示
		                    	<div  class="help" onmouseover="showChartInfo(2,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
		                    </h3>
		                </div>
		                <div class="bor">
		                    <div id="heatAddress" class="ammap myAmchartMap" ></div>
		                    <div style="position: absolute;z-index: 99;right:25px;top: 43%">
		                        <div class="btn-group btn-group-vertical">
	                                <button type="button" class="btn btn-default" onclick="heatAddress('country')" id="country">国家</button>
									<button type="button" class="btn btn-default"  onclick="heatAddress('state')" id=state>州省</button>
									<button type="button" class="btn btn-default"  onclick="heatAddress('city')" id="city">城市</button>
	                       	 	</div>
		                    </div>
		                    <%-- <div class="heatTl">
			                    <div>
		                        	<span id="heatMinVlaue"></span>
		                        	<img src="<%=basePath %>/static/images/heatTl2.png">
		                        	<span id="heatMaxVlaue"></span>
		                        </div>
		                    </div> --%>
		                </div>
		        </div>
	        </div>
	        
	        <!-- <div class="col-md-12 mg_b">
		        <div class="" style="border: 1px solid #CCCCCC;width:100%;border-radius:3px;margin-top:15px;height:488px">
	                <div class="col-md-12 map-text">
	                    <h3 class="tx-c">热点地理展示</h3>
	                </div>
	                <div class="col-md-12" id="column_chart_text" >
		                <div class="row">
			                <div class="col-md-12">
			                     <div id="button_location" style="width:5%;position: absolute;z-index: 99;right:100px;top: 5px;">
			                         <div class="btn-group btn-group-vertical">
			                                <button type="button" class="btn btn-default" onclick="heatAddress('country')" id="country">国家</button>
											<button type="button" class="btn btn-default"  onclick="heatAddress('state')" id=state>州省</button>
											<button type="button" class="btn btn-default"  onclick="heatAddress('city')" id="city">城市</button>
			                       	 </div>
			                     </div>
	                             <div id="heatAddress" class="ammap" ></div>
	                        </div>
				        </div>
	            	</div>
	            </div>
	        </div> -->
	       <!--  <div class="row">
	        	<div class="col-md-12 mg_t mg_b">
		        	<div class="col-md-12 bor">	
	                   <h3 class="tx-c">热点国家展示
	                   	<select class="selectCounts" style="margin-left:10px;" id="selectCountry"></select> 
	                   </h3>
	                   <div id="graph_country" class="amcharts"></div>
	                 </div>
	        	</div>
	        </div>  -->
	        
            <!-- <div class="col-md-12 mg_b mg_t">
                <div id="chart-content">
                    <div class="col-md-6 bor">
                        <h3 id="graph_country_text">热点国家展示
	                        <select class="selectCounts" style="margin-left:10px;" id="selectCountry">
	                       	</select> 
                        </h3>
                        <div id="graph_country" class="amcharts"></div>
                    </div>
                </div>
            </div> -->
        </div>
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
<!-- 人工查询功能的日期 -->
<script src="<%=basePath %>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-select.min.js"></script>
<script src="<%=basePath %>/static/js/jquery.combo.select.js"></script>
<script src="<%=basePath %>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath %>/static/js/perfect-scrollbar.js"></script>
<script src="<%=basePath %>/static/js/sec2.js"></script>
<%-- <script src="<%=basePath %>/static/js/yuzhi.js"></script> --%>

<script type="text/javascript" src="<%=basePath %>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/Visualization/base/base.js"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/amcharts.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/themes/light.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amchart_util.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/ammap.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/ammap_util.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/export/export.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/serial.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/pie.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/radar.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/worldLow.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/leaflet/leaflet.js" type="text/javascript" ></script>
<script src="<%=basePath %>/static/Visualization/js/leaflet/heatmap.js"></script>
<script src="<%=basePath %>/static/Visualization/js/leaflet/leaflet-heatmap.js"></script>
<script src="<%=basePath %>/static/Visualization/js/leaflet/tile.stamen.js"></script>
<script src="<%=basePath %>/static/Visualization/datamap/d3.min.js"></script>
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
<script src="<%=basePath%>/static/js/map-tileLayer.js"	type="text/javascript"></script>
<!-- 计算显示图的高度 -->	
<script src="<%=basePath%>/static/js/chartHeight.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框js脚本 -->
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
	});
	//定义Map控件
	var map = L.map('map');
	//bounds
	var corner1 = L.latLng(-60, -180),
   	corner2 = L.latLng(90, 180),
   	bounds = L.latLngBounds(corner1, corner2); 
   	map.setMaxBounds(bounds);
	
	var baseLayer = getOSMBrightLayer();
	baseLayer.addTo(map);
	var cfg = {
			"radius": 2,
		    "maxOpacity": 0.8,
			"scaleRadius": true,
			"useLocalExtrema": true,
			latField: 'lat',
			lngField: 'lng',
			valueField: 'count'
	};
	
	//热力图层
	var heatmapLayer = new HeatmapOverlay(cfg);
	
	
	//根据配置pid获取数据并渲染图表
	function render(configId){
		 startLoad();
			$.ajax({
				url:'<%=basePath %>/search/event_heat_viz/'+configId,
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
	
	//渲染图表
	function renderData(data){
		country_data = data.country_dic;
		state_data = data.state_dic;
		city_data = data.city_dic;
		maxValue = data.sdMaxValue;
		var location_data = data.location_dic;
		//加载地理热力图数据
		//处理大地图中心位置
		if(location_data.data.length == 0){
			map.setView([ 37.8, 113.7], 4);
		}else{
			map.setView([location_data.data[0].lat,location_data.data[0].lng],4);
		}
		heatmapLayer.setData(location_data);
        map.addLayer(heatmapLayer);
        //热点位置展示（国家、州省、城市）
        $("#country").click();
	}
	
	//加载热点位置图
	function heatAddress(data){
		
		if(data=='country'){
			process_dic_to_bubblemap(country_data,'heatAddress',0,maxValue);//国家
			$("#country").css("background-color","#e6e6e6").css("border","1px solid #adadad");
			$("#state").css("background-color","#fff").css("border","1px solid #cccccc");
			$("#city").css("background-color","#fff").css("border","1px solid #cccccc");
		}else if(data=='state'){
			process_dic_to_bubblemap(state_data,'heatAddress',0,maxValue);//州省
			$("#state").css("background-color","#e6e6e6").css("border","1px solid #adadad");
			$("#country").css("background-color","#fff").css("border","1px solid #cccccc");
			$("#city").css("background-color","#fff").css("border","1px solid #cccccc");
		}else{
			process_dic_to_bubblemap(city_data,'heatAddress',0,maxValue);//城市
			$("#city").css("background-color","#e6e6e6").css("border","1px solid #adadad");
			$("#country").css("background-color","#fff").css("border","1px solid #cccccc");
			$("#state").css("background-color","#fff").css("border","1px solid #cccccc");
		}
	}
	
	
</script>
</html>