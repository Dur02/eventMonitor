<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>国家状态展示</title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/css/bootstrap.min.css"/>
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath%>/static/lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/perfect-scrollbar.css" />
<link rel="shortcut icon" type="image/x-icon" href="<%=basePath%>/static/Visualization/base/ico.png"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/base.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/css/event_result.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/js/amcharts/export/export.css"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/worldmap.css" type="text/css" />
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
		    transform: translate(200px, 150px);
		    -moz-transform: translate(200px, 150px);
		    -webkit-transform: translate(200px, 150px);
	    }

    </style>
</head>
<body>
	<div class="index_top clearfix">
		<h3 class="fl title">图谱库分析 > 国家状态展示</h3>
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
	<!-- 显示图 -->
	<div class="index_bottom">
		<input type="hidden" id="moduleCode" value="${moduleCode}">
		<div class="data show">
			<div style="margin-left: 46%;margin-bottom: -5px;">
				<h3 style="margin-bottom: 3px;">国家情感值展示
					<div  class="help" onmouseover="showChartInfo(1,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
				</h3>
			</div>
			<div class="container-fluid">
	        <!--introduction-->
	        <!--map content-->
           <!--map-->
            <div class="col-md-12 bor" style="margin-top:5px; background:#ccc;">
                <!--click information-->
                <!-- 暂时先注释掉的内容 -->
                <!-- <div id="country_display">
                    <div style="margin-top: -20px">
                        <h3 style="background-color: #e3e3e3;">&nbsp;<i class="fa fa-globe">&nbsp;<strong>国家信息</strong></i></h3>
                        <div class="country_content">
                            <img id="flag" src="" alt="no match flag" style="width:90%">
                            <input  type="text" id="en_name" style="border:0px;width: 100%;" readonly="true"/>
                        </div>
                    </div>
                    <div>
                        <h3 style="background-color: #e3e3e3;">&nbsp;<i class="fa fa-heartbeat">&nbsp;<strong>国家状态</strong></i></h3>
                        <div class="country_content">
                            <input type="text" id="date" style="border:0px;width: 100%" readonly="true"/>
                            <input type="text" id="state" style="border:0px;width: 100%" readonly="true"/>
                            <input type="text" id="tone" style="border:0px;width: 100%" readonly="true"/>
                        </div>
                    </div>

                    <div>
                        <h3 style="background-color: #e3e3e3;">&nbsp;<i class="fa fa-newspaper-o">&nbsp;<strong>国家新闻</strong></i></h3>
                        <div class="country_content">
                            <input type="text" id="affect" style="border:0px;width: 100%" readonly="true"/>
                            <input type="text" id="arrest" style="border:0px;width: 100%" readonly="true"/>
                            <input type="text" id="kidnap" style="border:0px;width: 100%" readonly="true"/>
                            <input type="text" id="kill" style="border:0px;width: 100%" readonly="true"/>
                            <input type="text" id="protest" style="border:0px;width: 100%" readonly="true"/>
                            <input type="text" id="seize" style="border:0px;width: 100%" readonly="true"/>
                            <input type="text" id="wound" style="border:0px;width: 100%" readonly="true"/>
                            <input type="text" id="all" style="border:0px;width: 100%" readonly="true"/>
                        </div>
                    </div>
                </div> -->
                <!--color-->
                <div id="color_display" >
                    <div class="">
                        <div class="row" >
	                          <div style="margin-left: 5px; margin-right: 5px">
	                            <div class="col-md-12">
	                                <h4 style="color:#1d2334;" class="center">国家情感值范围</h4>
	                            </div>
	                            <div class="col-md-12">
	                                <div class="col-md-2" style="background: #fe3737;height: 6px;"></div>
	                                <div class="col-md-2" style="background: #ffc000;height: 6px;"></div>
	                                <div class="col-md-4" style="background: gray;height: 6px;"></div>
	                                <div class="col-md-2" style="background: #0bde06;height: 6px;"></div>
	                                <div class="col-md-2" style="background: #004eff;height: 6px;"></div>
	                            </div>
	                            <div class="col-md-12">
	                                <div class="col-md-4" ><h4 style="color:#1d2334; font-size:12px; text-align:left;">LOWEST</h4></div>
	                                <div class="col-md-4" ><h4 style="color:#1d2334; font-size:12px;" class="center">UNCOVERED</h4></div>
	                                <div class="col-md-4" ><h4 style="color:#1d2334; font-size:12px;" class="right">HIGHEST</h4></div>
	                            </div>
		                      </div>
                        </div>
                    </div>
                    <!--end color-->
                </div>
                <div id="button_display" >
                    <div class="btn-group btn-group-vertical" style="margin-top: 15px;margin-left: 15px;">
                        <button type="button" class="btn btn-default" id="zoom_out">+</button>
                        <button type="button" class="btn btn-default" id="zoom_in">-</button>
                    </div>
                </div>
                <div id="map_display" class="myleafletjsMap" style="width:80%; background:#ccc;margin-left: 137px;"></div>
            </div>
            <!--end map-->
	        <!--graph charts-->
	        <div class="row" id="charts_area">
	         <div class=" clearfix" style="margin-left: -14px; width: 102%;">
	            <div class="col-md-12 mg_b" style="margin-top: 7px;">
	                <div id="chart-content">
	                    <div class="col-md-6"  style="border: 1px solid #CCCCCC;border-radius:3px;width:100%;" >
	                        <h3 style="text-align:center;margin-bottom: -5px;">国家情感线
	                        <div  class="help" onmouseover="showChartInfo(2,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
	                        </h3>
	                        <div id="graph_tone_text" style="font-size: 19px;text-align:center;margin-bottom: -10px;"></div>
	                        <div id="graph_tone" class="amcharts"></div>
	                    </div>
	                    
	                    <!-- <div class="col-md-6" style="border: 1px solid #CCCCCC;border-radius:3px;width:100%;margin-top:15px;margin-bottom:70px;">
	                     <div class="btn-group" style="float:right;width: 5%;margin-top: 55px;" >
	                                <button type="button" class="btn btn-default" id="AFFECT_display" style="border-top-right-radius: 4px;border-bottom-left-radius: 0px;">影响</button>
	                                <button type="button" class="btn btn-default" id="ARREST_display" style="border-top: none;border-bottom: none;">逮捕</button>
	                                <button type="button" class="btn btn-default" id="KIDNAP_display">绑架</button>
	                                <button type="button" class="btn btn-default" id="KILL_display"style="border-top: none;border-bottom: none;">杀害</button>
	                                <button type="button" class="btn btn-default" id="PROTEST_display">抗议</button>
	                                <button type="button" class="btn btn-default" id="SEIZE_display"style="border-top: none;border-bottom: none;">扣押</button>
	                                <button type="button" class="btn btn-default" id="WOUND_display">伤害</button>
	                                <button type="button" class="btn btn-default" id="ALL_display" style="border-bottom-left-radius: 4px;border-top-right-radius: 0px;border-top: none;">所有</button>
	                            </div>
	                        <div id="button_content" style="margin-top:10px;">                           
	                        </div>
	                        <h3 id="graph_conflict_text" style="text-align:center;margin-bottom: -10px;">国家冲突规模(月)</h3>
	                        <div id="graph_conflict" class="amcharts" style="width:95%;"></div>
	                    </div> -->
	                </div>
	            </div>
	            </div>
	        </div>
	    </div>
	    <div>
	        <a class="scroll-top"><span class="fa fa-angle-up"></span></a>
	    </div>
	 </div>
	 <!-- 显示图结束 -->  	
	<!-- 显示表格 -->
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
						<td><img class="gq" src="<%=basePath%>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath%>/static/images/set.png"/>
							<img class="del" src="<%=basePath%>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>2</td>
						<td><span class="sort sort2">2</span></td>
						<td><img class="gq" src="<%=basePath%>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath%>/static/images/set.png"/>
							<img class="del" src="<%=basePath%>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>3</td>
						<td><span class="sort sort3">3</span></td>
						<td><img class="gq" src="<%=basePath%>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath%>/static/images/set.png"/>
							<img class="del" src="<%=basePath%>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>3</td>
						<td><span class="sort sort7">4</span></td>
						<td><img class="gq" src="<%=basePath%>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath%>/static/images/set.png"/>
							<img class="del" src="<%=basePath%>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>5</td>
						<td><span class="sort sort7">5</span></td>
						<td><img class="gq" src="<%=basePath%>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath%>/static/images/set.png"/>
							<img class="del" src="<%=basePath%>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>6</td>
						<td><span class="sort sort7">6</span></td>
						<td><img class="gq" src="<%=basePath%>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath%>/static/images/set.png"/>
							<img class="del" src="<%=basePath%>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>7</td>
						<td><span class="sort sort7">7</span></td>
						<td><img class="gq" src="<%=basePath%>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath%>/static/images/set.png"/>
							<img class="del" src="<%=basePath%>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>8</td>
						<td><span class="sort sort7">8</span></td>
						<td><img class="gq" src="<%=basePath%>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath%>/static/images/set.png"/>
							<img class="del" src="<%=basePath%>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>9</td>
						<td><span class="sort sort7">9</span></td>
						<td><img class="gq" src="<%=basePath%>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath%>/static/images/set.png"/>
							<img class="del" src="<%=basePath%>/static/images/del.png"/>
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
						<td><img src="<%=basePath%>/static/images/state2.png"/></td>
						<td>
							<img class="set" src="<%=basePath%>/static/images/set.png"/>
							<img class="del" src="<%=basePath%>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>11</td>
						<td><span class="sort sort10">11</span></td>
						<td><img class="gq" src="<%=basePath%>/static/images/gq2.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath%>/static/images/set.png"/>
							<img class="del" src="<%=basePath%>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>12</td>
						<td><span class="sort">12</span></td>
						<td><!-- <img class="gq" src="../images/gq.png" alt="挂起"> --></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state3.png"/></td>
						<td>
							<img class="set" src="<%=basePath%>/static/images/set.png"/>
							<img class="del" src="<%=basePath%>/static/images/del.png"/>
						</td>
					</tr>
				</tbody>
			</table>
			<div id="Pagination" class="pagination"><!-- 这里显示分页 --></div>
			<div id="Searchresult">分页初始化完成后这里的内容会被替换。</div>
		</div> --%>
	<!-- 显示表格结束 -->
	<!-- 页面底部收缩 -->
		<jsp:include page="graph_tab1.jsp"></jsp:include>
	<!-- 页面底部收缩结束 -->
		<jsp:include page="../updateUserPassword.jsp"/>
	</div>
</body>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/static/js/sec2.js"></script>
<script src="<%=basePath%>/static/lib/jquery.pagination.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/base.js"></script>
<script src="<%=basePath%>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/amcharts.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/themes/light.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amchart_util.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/ammap.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/ammap_util.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/export/export.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/datamap/d3.min.js"></script>
<script src="<%=basePath%>/static/Visualization/datamap/topojson.js"></script>
<script src="<%=basePath%>/static/Visualization/datamap/datamaps.world.min.js"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/serial.js" type="text/javascript"></script>
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
<script src="<%=basePath %>/static/js/perfect-scrollbar.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/downLoad.js"></script>
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<script type="text/javascript">
	$(function(){
		
		//处理配置
		handleConfigs();
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
	
	//加载地图和图表
	var basic_choropleth = null;
	
	function render(configId){
		startLoad();
		var resultcode = 'ALL';
		$.ajax({
				url:'<%=basePath%>/search/graph_countryshow_viz/'+configId,
				type: 'POST',
				dataType:"json",
			    success:function(data_result){
				    	if(data_result=="-1"){
							endLoad();
							win.alertEx("加载失败");
						}
				    	renderData(data_result);
				    	endLoad();
						}
				});
	
		
	}
	function renderData(data_result){
		document.getElementById("charts_area").style.display = "none";
		
		//document.getElementById("country_display").style.visibility = "hidden";
        var data =data_result.country_data;
        var tone_data = data_result.country_tone_dic;
        /* var affect_data =data_result.country_affect_dic;
        var arrest_data =data_result.country_arrest_dic ;
        var kidnap_data =data_result.country_kidnap_dic;
        var kill_data = data_result.country_kill_dic;
        var protest_data =data_result.country_protest_dic;
        var seize_data = data_result.country_seize_dic;
        var wound_data = data_result.country_wound_dic;
        var all_data = data_result.country_all_dic; */
        
         if(basic_choropleth!=null){
        	 $("#map_display").empty();
         }
	    basic_choropleth = new Datamap({
        element: document.getElementById("map_display"),
        projection: 'mercator',
        geographyConfig: {
            popupOnHover: true,
            highlightBorderColor: '#bada55',
            popupTemplate: function (geography, data) {
                if (data) {
                    var path="<%=basePath%>/static/Visualization/img/flags/"+data.fips10.toLowerCase()+"-lgflag.gif"
                    return '<div class="hoverinfo" style="max-width: 300px;margin-left:50px"><img src='+path+' style="height:80px;width:150px" alt="no match flag"><br/><strong>' +"国家: "+ geography.properties.name + ' (' + data.ch_name + ') ' + '<br />' + '日期: ' + data.date + '<br/>' + '情感值: ' + data.tone + '</strong> </div>'
                }
                else
                    return '<div class="hoverinfo" style="max-width: 300px;"><strong>' + geography.properties.name + '</strong> <br />' + '无数据'+' </div>'
            },
            highlightBorderWidth: 6
        },
        fills: {
            'Visited': '#306596',
            'Positive': '#0bde06',
            'MuchPositive':'#004eff',
            'Negative': '#ffc000',
            'MuchNegative':'#fe3737',
            'defaultFill':'gray'
        },
        data: data,
        done: function (datamap) {
            datamap.svg.selectAll('.datamaps-subunit').on('click', function (geography) {
                var map_id = geography.id;
                var map_name = geography.properties.name;
                var ch_name;
                /* var fips10;
                var date;
                var state;
                var tone;
                var affect_sum;
                var arrest_sum;
                var kidnap_sum ;
                var kill_sum ;
                var protest_sum ;
                var seize_sum ;
                var wound_sum ;
                var all_sum; */
                for(var id in data )
                {
                    if(id==map_id)
                    	
                    {
                        ch_name = data[id].ch_name;
                        /* fips10 = data[id].fips10;
                        tone = data[id].tone;
                        date = data[id].date;
                        affect_sum = data[id].affect_sum;
                        arrest_sum = data[id].arrest_sum;
                        kidnap_sum = data[id].kidnap_sum;
                        kill_sum = data[id].kill_sum;
                        protest_sum = data[id].protest_sum;
                        seize_sum = data[id].seize_sum;
                        wound_sum = data[id].wound_sum;
                        all_sum = data[id].all_sum;
                        if(tone[0]=='-')
                            state = '消极';
                        else
                            state = '积极';
                        break; */
                    }
                }
                <%-- document.getElementById("flag").src = "<%=basePath%>/static/Visualization/img/flags/"+fips10.toLowerCase()+"-lgflag.gif";
                document.getElementById("en_name").value = map_name+' ('+ch_name+') ';
                document.getElementById("tone").value = '情感值: '+tone;
                document.getElementById("date").value = '日期: '+date;
                document.getElementById("state").value = '状态: '+state;
                document.getElementById("affect").value = '影响: '+affect_sum;
                document.getElementById("arrest").value = '逮捕: '+arrest_sum;
                document.getElementById("kidnap").value = '绑架: '+kidnap_sum;
                document.getElementById("kill").value = '杀害: '+kill_sum;
                document.getElementById("protest").value = '抗议: '+protest_sum;
                document.getElementById("seize").value = '扣押: '+seize_sum;
                document.getElementById("wound").value = '伤害: '+wound_sum;
                document.getElementById("all").value = '统计: '+all_sum;
                document.getElementById("country_display").style.visibility = "visible";--%>
                if(tone_data[map_id]!=undefined){
	                document.getElementById("charts_area").style.display = "block"; 
	                //graph
	                var nn = map_name+"("+ch_name+")";
	                $("#graph_tone_text").html(nn);
	                line_chart("graph_tone", {category: "key", value: "value", yTitle: map_name+"("+ch_name+")"}, tone_data[map_id]);
	                //向下展示滚轮
	                selectHeight();
                } 
                
                
                
                /* process_dic_to_datechart(all_data[map_id],"graph_conflict","graph_conflict_text");
                  
                d3.select('#AFFECT_display').on('click',function() {
                    process_dic_to_datechart(affect_data[map_id],"graph_conflict","graph_conflict_text");
                });
                d3.select('#ARREST_display').on('click',function() {
                    process_dic_to_datechart(arrest_data[map_id],"graph_conflict","graph_conflict_text");
                });
                d3.select('#KIDNAP_display').on('click',function() {
                    process_dic_to_datechart(kidnap_data[map_id],"graph_conflict","graph_conflict_text");
                });
                d3.select('#KILL_display').on('click',function() {
                    process_dic_to_datechart(kill_data[map_id],"graph_conflict","graph_conflict_text");
                });
                d3.select('#PROTEST_display').on('click',function() {
                    process_dic_to_datechart(protest_data[map_id],"graph_conflict","graph_conflict_text");
                });
                d3.select('#SEIZE_display').on('click',function() {
                    process_dic_to_datechart(seize_data[map_id],"graph_conflict","graph_conflict_text");
                });
                d3.select('#WOUND_display').on('click',function() {
                    process_dic_to_datechart(wound_data[map_id],"graph_conflict","graph_conflict_text");
                });
                d3.select('#ALL_display').on('click',function() {
                    process_dic_to_datechart(all_data[map_id],"graph_conflict","graph_conflict_text");
                }); */
                
            });
            var minScale=0.75;
            var maxScale=1.75;
            var svg = datamap.svg;
            var zoom = d3.behavior.zoom()
                    .scaleExtent([minScale, maxScale])
                    .on("zoom", zoomed);
            var g = svg.selectAll(".datamaps-subunit");
            function zoomed() {
                g.attr("transform","translate("+ d3.event.translate+")scale("+d3.event.scale+")");
                reset();
            }
            d3.select('#zoom_in').on('click',function(){
                if(zoom.scale()-0.25>=minScale){
                    zoom.scale(zoom.scale()-0.25);
                    zoom.translate([zoom.translate()[0]*(1+0.25),zoom.translate()[1]*(1+0.25)]);
                    g.attr("transform","translate("+ zoom.translate()+")scale("+zoom.scale()+")");
                    reset();
                }
                else{
                    zoom.translate([zoom.translate()[0]*(1+(zoom.scale()-minScale)),zoom.translate()[1]*(1+(zoom.scale()-minScale))]);
                    zoom.scale(minScale);
                    g.attr("transform","translate("+ zoom.translate()+")scale("+zoom.scale()+")");
                    reset();
                }
            });
            d3.select('#zoom_out').on('click',function(){
                if(zoom.scale()+0.25<=maxScale){
                    zoom.scale(zoom.scale()+0.25);
                    zoom.translate([zoom.translate()[0]*(1-0.25),zoom.translate()[1]*(1-0.25)]);//变换坐标，统一zoom和button缩放坐标
                    g.attr("transform","translate("+ zoom.translate()+")scale("+zoom.scale()+")");
                    reset();
                }
                else{
                    zoom.translate([zoom.translate()[0]*(1-(maxScale-zoom.scale())),zoom.translate()[1]*(1-(maxScale-zoom.scale()))]);
                    zoom.scale(maxScale);
                    g.attr("transform","translate("+ zoom.translate()+")scale("+zoom.scale()+")");
                    reset();
                }
            });
            function reset(){
                if(zoom.translate()[0]/zoom.scale()<-1900 || zoom.translate()[0]>1900||zoom.translate()[1]/zoom.scale()<-800 || zoom.translate()[1]>(420*zoom.scale()+642)){
                    //alert("超出边界！");
                    zoom.scale(zoom.scale());
                    zoom.translate([-920*zoom.scale()+817,100/zoom.scale()]);
                    g.attr("transform","translate("+ zoom.translate()+")scale("+zoom.scale()+")");
                }
            }
            svg.call(zoom);
        }
    });
	}
	function selectHeight(){
		$(window.parent.frames["mainhtml"].document).scrollTop(617);
	}
    </script>
</html>