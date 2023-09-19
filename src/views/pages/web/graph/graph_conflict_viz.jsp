<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<link rel="shortcut icon" type="image/x-icon" href="<%=basePath%>/static/Visualization/base/ico.png"/>
<link rel="stylesheet" href="<%=basePath%>/static/css/style.css">
<title> 图谱国家冲突分析 </title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="shortcut icon" type="image/x-icon" href="<%=basePath %>/static/Visualization/base/ico.png"/>
<link rel="stylesheet" href="<%=basePath %>/static/css/style.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/sec2.css">
<!--人工查询 -->
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath %>/static//lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath %>/static/css/combo.select.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/perfect-scrollbar.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/base/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/base/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/base/base.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/css/event_result.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/js/amcharts/export/export.css"/>
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
	<style type="text/css">
		.ques{
        	left: -39px;
        }
	</style>
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


   <%-- <link rel="stylesheet" href="<%=basePath %>/static/Visualization/css/conflict_viz.css" type="text/css" /> --%>
 

</head>
<body>
      <!-- 事件描述 -->
    <div class="index_top clearfix">
		<h3 class="fl title">图谱库分析 > 国家冲突分析</h3>
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
		<!-- 显示图 -->
		<input type="hidden" id="moduleCode" value="${moduleCode}">
		<div class="data show">
			<div class="row">
				<div class="col-md-12 mg_t">
	                <div class="col-md-12 map-text">
	                    <h3 class="tx-c mapText_heat">国家冲突规模热点图
	                    	<div  class="help" onmouseover="showChartInfo(1,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
	                    </h3>
	                </div>
	                <div class="bor">
	                    <div id="heatmap" class="ammap myAmchartMap" ></div>
	                    <div style="position: absolute;z-index: 99;right:24px;top: 34%">
	                        <div class="btn-group btn-group-vertical">
                                <button type="button" class="btn btn-default" onclick="countsHeatMap('AFFECT')" id="AFFECT_ctry_heat">影响</button>
                                 <button type="button" class="btn btn-default"  onclick="countsHeatMap('ARREST')" id="ARREST_ctry_heat">逮捕</button>
                                 <button type="button" class="btn btn-default"  onclick="countsHeatMap('KIDNAP')" id="KIDNAP_ctry_heat">绑架</button>
                                 <button type="button" class="btn btn-default"  onclick="countsHeatMap('KILL')" id="KILL_ctry_heat">杀害</button>
                                 <button type="button" class="btn btn-default"  onclick="countsHeatMap('PROTEST')" id="PROTEST_ctry_heat">抗议</button>
                                 <button type="button" class="btn btn-default"  onclick="countsHeatMap('SEIZE')" id="SEIZE_ctry_heat">扣押</button>
                                 <button type="button" class="btn btn-default"  onclick="countsHeatMap('WOUND')" id="WOUND_ctry_heat">伤害</button>
                       	 	</div>
	                    </div>
	                </div>
		        </div>
	        </div>
	        
	        <div class="row">
				<div class="col-md-12 mg_t">
		                <div class="col-md-12 map-text">
		                    <h3 class="tx-c mapText_heat">州省冲突规模热点图
		                    	<div  class="help" onmouseover="showChartInfo(2,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
		                    </h3>
		                </div>
		                <div class="bor">
		                    <div id="stateSandian" class="ammap myAmchartMap" ></div>
		                    <div style="position: absolute;z-index: 99;right:24px;top: 34%">
		                        <div class="btn-group btn-group-vertical">
	                                <button type="button" class="btn btn-default" onclick="countsSandian('AFFECT_state')" id="AFFECT_state_sandian">影响</button>
									<button type="button" class="btn btn-default"  onclick="countsSandian('ARREST_state')" id="ARREST_state_sandian">逮捕</button>
									<button type="button" class="btn btn-default"  onclick="countsSandian('KIDNAP_state')" id="KIDNAP_state_sandian">绑架</button>
									<button type="button" class="btn btn-default"  onclick="countsSandian('KILL_state')" id="KILL_state_sandian">杀害</button>
									<button type="button" class="btn btn-default"  onclick="countsSandian('PROTEST_state')" id="PROTEST_state_sandian">抗议</button>
									<button type="button" class="btn btn-default"  onclick="countsSandian('SEIZE_state')" id="SEIZE_state_sandian">扣押</button>
									<button type="button" class="btn btn-default"  onclick="countsSandian('WOUND_state')" id="WOUND_state_sandian">伤害</button>
	                       	 	</div>
		                    </div>
		                    <div class="heatTl" id="stateHEAT">
			                    <div>
		                        	<span>0</span>
		                        	<img src="<%=basePath %>/static/images/heatTl.png">
		                        	<span id="maxStateValue">0</span>
		                        </div>
		                    </div>
		                </div>
		        </div>
	        </div>
	        
	        <div class="row">
				<div class="col-md-12 mg_t">
		                <div class="col-md-12 map-text">
		                    <h3 class="tx-c mapText_heat">城市冲突规模热点图
		                    	<div  class="help" onmouseover="showChartInfo(3,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
		                    </h3>
		                </div>
		                <div class="bor">
		                    <div id="citySandian" class="ammap myAmchartMap" ></div>
		                    <div style="position: absolute;z-index: 99;right:24px;top: 34%">
		                        <div class="btn-group btn-group-vertical">
	                                <button type="button" class="btn btn-default" onclick="countsSandianCity('AFFECT')" id="AFFECT_city_sandian">影响</button>
										<button type="button" class="btn btn-default"  onclick="countsSandianCity('ARREST')" id="ARREST_city_sandian">逮捕</button>
										<button type="button" class="btn btn-default"  onclick="countsSandianCity('KIDNAP')" id="KIDNAP_city_sandian">绑架</button>
										<button type="button" class="btn btn-default"  onclick="countsSandianCity('KILL')" id="KILL_city_sandian">杀害</button>
										<button type="button" class="btn btn-default"  onclick="countsSandianCity('PROTEST')" id="PROTEST_city_sandian">抗议</button>
										<button type="button" class="btn btn-default"  onclick="countsSandianCity('SEIZE')" id="SEIZE_city_sandian">扣押</button>
										<button type="button" class="btn btn-default"  onclick="countsSandianCity('WOUND')" id="WOUND_city_sandian">伤害</button>
	                       	 	</div>
		                    </div>
		                    <div class="heatTl" id="cityHEAT">
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
					<div class="col-md-12 mg_b mg_t">
						<div id="chart-content">
							<div class="col-md-6 bor w50l">
								<h3>冲突类型事件数统计
									<div  class="help" onmouseover="showChartInfo(4,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
								</h3>
								<div id="type_pie_chart" class="amcharts twoCharts" ></div>
							</div>
							<div class="col-md-6 bor w50r">
								<h3 >国家冲突数量统计
									<div  class="help" onmouseover="showChartInfo(5,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
								</h3>
								<div id="code_pie_chart" class="amcharts twoCharts" ></div>
								<div id="countryCountPie" style="position: absolute;z-index: 99;right:8px;top: 30%">
			                        <div class="btn-group btn-group-vertical">
	                                	<button type="button" class="btn btn-default" onclick="countsPIE('AFFECT')"  id="AFFECT_ctry_pie">影响</button>
				                        <button type="button" class="btn btn-default" onclick="countsPIE('ARREST')"  id="ARREST_ctry_pie">逮捕</button>
				                        <button type="button" class="btn btn-default" onclick="countsPIE('KIDNAP')"  id="KIDNAP_ctry_pie">绑架</button>
				                        <button type="button" class="btn btn-default" onclick="countsPIE('KILL')"    id="KILL_ctry_pie">杀害</button>
				                        <button type="button" class="btn btn-default" onclick="countsPIE('PROTEST')" id="PROTEST_ctry_pie">抗议</button>
				                        <button type="button" class="btn btn-default" onclick="countsPIE('SEIZE')"   id="SEIZE_ctry_pie">扣押</button>
				                        <button type="button" class="btn btn-default" onclick="countsPIE('WOUND')"   id="WOUND_ctry_pie">伤害</button>
		                       	 	</div>
		                    	</div>
							</div>
							
							<!-- <div class="col-md-6 w50r mg_t " style="border: 1px solid #CCCCCC;height:500px;border-radius:3px;margin-bottom:70px;">
				                <h3 >国家冲突规模数统计</h3>
				                <div class="col-md-12">
					               	<div class="col-md-5" id="code_pie_chart_text" style="width:13%; position:absolute; right:10px; top:10px;">
					                    <div class="btn-group">
					                        <button type="button" class="btn btn-default" onclick="countsPIE('AFFECT')"  id="AFFECT_ctry_pie" style="border-top-right-radius: 3px;border-bottom-right-radius: 0px;border-bottom-left-radius: 0px;border-bottom: none;margin-left:-1px;">影响</button>
					                        <button type="button" class="btn btn-default" onclick="countsPIE('ARREST')"  id="ARREST_ctry_pie" style="border-top: none;">逮捕</button>
					                        <button type="button" class="btn btn-default" onclick="countsPIE('KIDNAP')"  id="KIDNAP_ctry_pie"  style="border-top:none;border-bottom:none;">绑架</button>
					                        <button type="button" class="btn btn-default" onclick="countsPIE('KILL')"    id="KILL_ctry_pie"    style="border-bottom-right-radius:0px;">杀害</button>
					                        <button type="button" class="btn btn-default" onclick="countsPIE('PROTEST')" id="PROTEST_ctry_pie" style="border-top:none;border-bottom:none;margin-left:-1px;border-top-left-radius: 0px;border-bottom-left-radius: 0px;">抗议</button>
					                        <button type="button" class="btn btn-default" onclick="countsPIE('SEIZE')"   id="SEIZE_ctry_pie"   style="border-bottom:none;margin-left:-1px;border-top-left-radius: 0px;border-bottom-left-radius: 0px;">扣押</button>
					                        <button type="button" class="btn btn-default" onclick="countsPIE('WOUND')"   id="WOUND_ctry_pie"   style=" border-bottom-right-radius: 3px;border-bottom-left-radius: 4px; border-top-right-radius: 0px;">伤害</button>
						                </div>
					               	</div>
					                <div class="col-md-7" style="width:90%;">
					                    <div id="code_pie_chart" style="height:444px;"></div>
					                </div>
					            </div>
	            			 </div>
							 -->
						</div>
					</div>
			</div>
	        
	        
    	<%-- <div class="container show-graph" style="width: 100%;">
	    	<!-- <div class="col-md-12"  style="border: 1px solid #CCCCCC;height:500px;border-radius:3px;margin-top:15px;">
	             <div class="col-md-12 map-text">
	             	<h3 class="tx-c map-mg-b">国家冲突规模热点图</h3>
	             </div>
	             <div class="col-md-12">
	                 <div class="row">
	                     <div class="col-md-12">
	                         <div id="button_type" style="width:5%;">
	                             <div class="btn-group btn-group-vertical">
	                                 <button type="button" class="btn btn-default" onclick="countsHeatMap('AFFECT')" id="AFFECT_ctry_heat">影响</button>
	                                 <button type="button" class="btn btn-default"  onclick="countsHeatMap('ARREST')" id="ARREST_ctry_heat">逮捕</button>
	                                 <button type="button" class="btn btn-default"  onclick="countsHeatMap('KIDNAP')" id="KIDNAP_ctry_heat">绑架</button>
	                                 <button type="button" class="btn btn-default"  onclick="countsHeatMap('KILL')" id="KILL_ctry_heat">杀害</button>
	                                 <button type="button" class="btn btn-default"  onclick="countsHeatMap('PROTEST')" id="PROTEST_ctry_heat">抗议</button>
	                                 <button type="button" class="btn btn-default"  onclick="countsHeatMap('SEIZE')" id="SEIZE_ctry_heat">扣押</button>
	                                 <button type="button" class="btn btn-default"  onclick="countsHeatMap('WOUND')" id="WOUND_ctry_heat">伤害</button>
	                             </div>
	                         </div>
	                         <div id="heatmap" class="ammap" style="width:95%;"></div>
	                     </div>
	                 </div>
	             </div>
	         </div> -->
         	<div class="col-md-12" style="border: 1px solid #CCCCCC;width:100%;border-radius:3px;margin-top:15px;height:488px">
                <div class="col-md-12 map-text">
                    <h3 class="tx-c map-mg-b">州省冲突规模热点图</h3>
                    <input type="hidden" id="moduleCode" value="${moduleCode}">
                </div>
                <div class="col-md-12" id="column_chart_text" >
                	<div class="row">
	                    <div class="col-md-12">
	                    	<div id="button_location" style="width:5%;">
	                        	 <div class="btn-group btn-group-vertical">
	                                <button type="button" class="btn btn-default" onclick="countsSandian('AFFECT_state')" id="AFFECT_state_sandian">影响</button>
									<button type="button" class="btn btn-default"  onclick="countsSandian('ARREST_state')" id="ARREST_state_sandian">逮捕</button>
									<button type="button" class="btn btn-default"  onclick="countsSandian('KIDNAP_state')" id="KIDNAP_state_sandian">绑架</button>
									<button type="button" class="btn btn-default"  onclick="countsSandian('KILL_state')" id="KILL_state_sandian">杀害</button>
									<button type="button" class="btn btn-default"  onclick="countsSandian('PROTEST_state')" id="PROTEST_state_sandian">抗议</button>
									<button type="button" class="btn btn-default"  onclick="countsSandian('SEIZE_state')" id="SEIZE_state_sandian">扣押</button>
									<button type="button" class="btn btn-default"  onclick="countsSandian('WOUND_state')" id="WOUND_state_sandian">伤害</button>
	                         	</div>
		                    </div>
                            <div id="stateSandian" class="ammap" style="width:95%;"></div>
	                    </div>
	                </div>
           		</div>
           	</div>
         	<div class="col-md-12" style="border: 1px solid #CCCCCC;width:100%;border-radius:3px;margin-top:15px;height:488px">
                <div class="col-md-12 map-text">
                    <h3 class="tx-c map-mg-b">城市冲突规模热点图</h3>
                    <input type="hidden" id="moduleCode" value="${moduleCode}">
                </div>
                <div class="col-md-12" id="column_chart_text" >
	                <div class="row">
		                <div class="col-md-12">
		                     <div id="button_location" style="width:5%;">
		                         <div class="btn-group btn-group-vertical">
		                                <button type="button" class="btn btn-default" onclick="countsSandianCity('AFFECT')" id="AFFECT_city_sandian">影响</button>
										<button type="button" class="btn btn-default"  onclick="countsSandianCity('ARREST')" id="ARREST_city_sandian">逮捕</button>
										<button type="button" class="btn btn-default"  onclick="countsSandianCity('KIDNAP')" id="KIDNAP_city_sandian">绑架</button>
										<button type="button" class="btn btn-default"  onclick="countsSandianCity('KILL')" id="KILL_city_sandian">杀害</button>
										<button type="button" class="btn btn-default"  onclick="countsSandianCity('PROTEST')" id="PROTEST_city_sandian">抗议</button>
										<button type="button" class="btn btn-default"  onclick="countsSandianCity('SEIZE')" id="SEIZE_city_sandian">扣押</button>
										<button type="button" class="btn btn-default"  onclick="countsSandianCity('WOUND')" id="WOUND_city_sandian">伤害</button>
		                       	 </div>
		                     </div>
                             <div id="citySandian" class="ammap" style="width:95%;"></div>
                        </div>
			        </div>
            	</div>
            </div>
	        <div class=" mg_t clearfix">
	        	<!-- <div class="col-md-6 w50l mg_t "  style="border: 1px solid #CCCCCC;height:500px;border-radius:3px;">
	                <h3 >冲突类型事件数统计</h3>
	             	<div class="col-md-7" style="width:100%;" >
	             		<div id="type_pie_chart" style="height:444px;"></div>
	             	</div>
	            </div> -->
	            <!-- <div class="col-md-6 w50r mg_t " style="border: 1px solid #CCCCCC;height:500px;border-radius:3px;margin-bottom:70px;">
	                <h3 >国家冲突规模数统计</h3>
	                <div class="col-md-12">
		               	<div class="col-md-5" id="code_pie_chart_text" style="width:13%; position:absolute; right:10px; top:10px;">
		                    <div class="btn-group">
		                        <button type="button" class="btn btn-default" onclick="countsPIE('AFFECT')"  id="AFFECT_ctry_pie" style="border-top-right-radius: 3px;border-bottom-right-radius: 0px;border-bottom-left-radius: 0px;border-bottom: none;margin-left:-1px;">影响</button>
		                        <button type="button" class="btn btn-default" onclick="countsPIE('ARREST')"  id="ARREST_ctry_pie" style="border-top: none;">逮捕</button>
		                        <button type="button" class="btn btn-default" onclick="countsPIE('KIDNAP')"  id="KIDNAP_ctry_pie"  style="border-top:none;border-bottom:none;">绑架</button>
		                        <button type="button" class="btn btn-default" onclick="countsPIE('KILL')"    id="KILL_ctry_pie"    style="border-bottom-right-radius:0px;">杀害</button>
		                        <button type="button" class="btn btn-default" onclick="countsPIE('PROTEST')" id="PROTEST_ctry_pie" style="border-top:none;border-bottom:none;margin-left:-1px;border-top-left-radius: 0px;border-bottom-left-radius: 0px;">抗议</button>
		                        <button type="button" class="btn btn-default" onclick="countsPIE('SEIZE')"   id="SEIZE_ctry_pie"   style="border-bottom:none;margin-left:-1px;border-top-left-radius: 0px;border-bottom-left-radius: 0px;">扣押</button>
		                        <button type="button" class="btn btn-default" onclick="countsPIE('WOUND')"   id="WOUND_ctry_pie"   style=" border-bottom-right-radius: 3px;border-bottom-left-radius: 4px; border-top-right-radius: 0px;">伤害</button>
			                </div>
		               	</div>
		                <div class="col-md-7" style="width:90%;">
		                    <div id="code_pie_chart" style="height:444px;"></div>
		                </div>
		            </div>
	             </div> -->
	   		</div>
	    </div> --%>
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
						<td><!-- <img class="gq" src=".<%=basePath %>/images/gq.png" alt="挂起"> --></td>
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
    	<jsp:include page="graph_tab2.jsp"></jsp:include>
		<jsp:include page="../updateUserPassword.jsp"/>
	</div> 
	<!-- 页面底部收缩结束 -->
</body>
<script type="text/javascript" src="<%=basePath %>/static/Visualization/base/js/jquery-1.11.1.min.js"></script>
 <!-- 人工查询功能的日期 -->
<script src="<%=basePath %>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-select.min.js"></script>
<script src="<%=basePath %>/static/js/jquery.combo.select.js"></script>
<script src="<%=basePath %>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath %>/static/js/perfect-scrollbar.js"></script>
<script src="<%=basePath %>/static/js/config/config.js"></script>
<script src="<%=basePath %>/static/js/sec2.js"></script>
<script src="<%=basePath %>/static/lib/jquery.pagination.js"></script>
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
<script src="<%=basePath %>/static/Visualization/js/amcharts/worldLow.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/datamap/d3.min.js"></script>
<script src="<%=basePath %>/static/Visualization/datamap/topojson.js"></script>
<script src="<%=basePath %>/static/Visualization/datamap/datamaps.world.min.js"></script>  
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
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<script type="text/javascript">
    $(function(){
    	/* //美化图表展示界面的右侧滚动条
		index_bottom_perfectScrollbar(); */
    	//处理配置
		handleConfigs();
		//美化滚动条
		glorifyComboSelect();
		gkgToneIsShow();
    	////////////////////////////////////////////////////////////////////////////
    	// 控制选择年月日
    	$(".date").on("click",function(){
    		$(this).addClass("active_span").siblings().removeClass("active_span");
    	});
    });
    var index = 0;
    
    function render(configId){
    	startLoad();
    	/* var resultcode = 'resultcode';
    	var resultcode1 = 'resultcode1';
    	var resultcode2 = 'resultcode2';
    	var aa = ',';
    	resultcodes = resultcode+aa+resultcode1+aa+resultcode2;
    	var dt = {
    			resultcodes: resultcodes
    		}; */
    	$.ajax({
    		url:'<%=basePath%>/search/graph_conflict_viz/'+configId,
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
    	//州省冲突规模散点图数据
    	AFFECT_state = data.AFFECT_state;
    	ARREST_state = data.ARREST_state;
    	KIDNAP_state = data.KIDNAP_state;
    	KILL_state = data.KILL_state;
    	PROTEST_state = data.PROTEST_state;
    	SEIZE_state = data.SEIZE_state;
    	WOUND_state = data.WOUND_state;
	    //城市冲突规模散点图数据
    	AFFECT_city = data.AFFECT_city;
    	ARREST_city = data.ARREST_city;
    	KIDNAP_city = data.KIDNAP_city;
    	KILL_city = data.KILL_city;
    	PROTEST_city = data.PROTEST_city;
    	SEIZE_city = data.SEIZE_city;
    	WOUND_city = data.WOUND_city;
    	//国家冲突规模以及国家事件数
    	country_counts = data.country_counts;
    	console.log(JSON.stringify(country_counts));
    	//国家冲突事件数
    	var type_count = data.type_count;
    	function testValue(data) {
    		var Index = 0;
    		data.forEach(function(e) {
	            if(e.value==0){
	            	Index++;
	            }
	        });
    		return Index;
    	}
    	if(testValue(type_count)!=7){
    		pie_chart_new('type_pie_chart',{category:'name_key',value:'value'},type_count.slice(0,8),0);
    	}else{
    		$("#type_pie_chart").html('<img alt="" class="tubiao2"  src="<%=basePath %>/static/images/tubiao2.png">');
    	}
		//加载国家热点图
		$("#AFFECT_ctry_heat").click();
		$("#AFFECT_ctry_heat").css("background-color","#e6e6e6").css("border","1px solid #adadad");
		//加载国家饼状图
		$("#AFFECT_ctry_pie").click();
		//加载州省散点图
		$("#AFFECT_state_sandian").click();
		$("#AFFECT_state_sandian").css("background-color","#e6e6e6").css("border","1px solid #adadad");
		//加载城市散点
		$("#AFFECT_city_sandian").click();
		$("#AFFECT_city_sandian").css("background-color","#e6e6e6").css("border","1px solid #adadad");
		//加载国家冲突规模数统计
		$("#AFFECT_ctry_pie").click();
		$("#AFFECT_ctry_pie").css("background-color","#e6e6e6").css("border","1px solid #adadad");
    }
    
    //加载国家饼状图的方法
    function countsPIE(countsType){
    	
    	if(countsType != "AFFECT"){
    		$("#AFFECT_ctry_pie").css("background-color","#fff").css("border","1px solid #cccccc");
    	}else{
    		$("#AFFECT_ctry_pie").css("background-color","#e6e6e6").css("border","1px solid #adadad");
    	}
    	if(country_counts.AFFECT.length==0
   			&&country_counts.ARREST.length==0
   			&&country_counts.KIDNAP.length==0
   			&&country_counts.KILL.length==0
   			&&country_counts.PROTEST.length==0
   			&&country_counts.SEIZE.length==0
   			&&country_counts.WOUND.length==0){
    		$("#countryCountPie").hide();
    		$("#code_pie_chart").html('<img alt="" class="tubiao2"  src="<%=basePath %>/static/images/tubiao2.png">');
    	}else{
    		$("#countryCountPie").show();
	    	for(var key in country_counts){
	    		if(countsType==key){
	    			pie_chart_new('code_pie_chart',{category:'name_key',value:'counts'},country_counts[key].slice(0,8));
	    			break;
	    		}
	    	}
    	}
    }
    
    //加载国家热点图的方法
    function countsHeatMap(countsType){
    	
    	if(countsType != "AFFECT"){
    		$("#AFFECT_ctry_heat").css("background-color","#fff").css("border","1px solid #cccccc");
    	}else{
    		$("#AFFECT_ctry_heat").css("background-color","#e6e6e6").css("border","1px solid #adadad");
    	}
    	
    	for(var key in country_counts){
    		if(countsType==key){
    			process_dic_to_heatmap(country_counts[key],'heatmap');
    			break;
    		}
    	}
    	
    }
    

    //加载城市的散点图
    function countsSandianCity(countsType){
    	
    	if(countsType != "AFFECT"){
    		$("#AFFECT_city_sandian").css("background-color","#fff").css("border","1px solid #cccccc");
    	}else{
    		$("#AFFECT_city_sandian").css("background-color","#e6e6e6").css("border","1px solid #adadad");
    	}
    	
    	if(countsType=='AFFECT'){
    		//process_dic_to_sandian(AFFECT_city,"citySandian");
    		if(AFFECT_city.length>0){
	    		process_dic_to_bubblemap(groupByDate2(AFFECT_city,AFFECT_city[0].value), 'citySandian');
    			$("#maxCityValue").html(AFFECT_city[0].value);
    			$("#cityHEAT").show();
    		}else{
    			$("#cityHEAT").hide();
    			process_dic_to_bubblemap(groupByDate2(AFFECT_city), 'citySandian');
    		}
    	}else if(countsType=='ARREST'){
    		//process_dic_to_sandian(ARREST_city,"citySandian");
    		if(ARREST_city.length>0){
	    		process_dic_to_bubblemap(groupByDate2(ARREST_city,ARREST_city[0].value), 'citySandian');
    			$("#maxCityValue").html(ARREST_city[0].value);
    			$("#cityHEAT").show();
    		}else{
	    		process_dic_to_bubblemap(groupByDate2(ARREST_city), 'citySandian');
    			$("#cityHEAT").hide();
    		}
    	}else if(countsType=='KIDNAP'){
    		//process_dic_to_sandian(KIDNAP_city,"citySandian");
    		if(KIDNAP_city.length>0){
	    		process_dic_to_bubblemap(groupByDate2(KIDNAP_city,KIDNAP_city[0].value), 'citySandian');
    			$("#maxCityValue").html(KIDNAP_city[0].value);
    			$("#cityHEAT").show();
    		}else{
	    		process_dic_to_bubblemap(groupByDate2(KIDNAP_city), 'citySandian');
    			$("#cityHEAT").hide();
    		}
    	}else if(countsType=='KILL'){
    		//process_dic_to_sandian(KILL_city,"citySandian");
    		if(KILL_city.length>0){
	    		process_dic_to_bubblemap(groupByDate2(KILL_city,KILL_city[0].value), 'citySandian');
    			$("#maxCityValue").html(KILL_city[0].value);
    			$("#cityHEAT").show();
    		}else{
	    		process_dic_to_bubblemap(groupByDate2(KILL_city), 'citySandian');
    			$("#cityHEAT").hide();
    		}
    	}else if(countsType=='PROTEST'){
    		//process_dic_to_sandian(PROTEST_city,"citySandian");
    		if(PROTEST_city.length>0){
	    		process_dic_to_bubblemap(groupByDate2(PROTEST_city,PROTEST_city[0].value), 'citySandian');
    			$("#maxCityValue").html(PROTEST_city[0].value);
    			$("#cityHEAT").show();
    		}else{
	    		process_dic_to_bubblemap(groupByDate2(PROTEST_city), 'citySandian');
    			$("#cityHEAT").hide();
    		}
    	}else if(countsType=='SEIZE'){
    		//process_dic_to_sandian(SEIZE_city,"citySandian");
    		if(SEIZE_city.length>0){
	    		process_dic_to_bubblemap(groupByDate2(SEIZE_city,SEIZE_city[0].value), 'citySandian');
    			$("#maxCityValue").html(SEIZE_city[0].value);
    			$("#cityHEAT").show();
    		}else{
	    		process_dic_to_bubblemap(groupByDate2(SEIZE_city), 'citySandian');
    			$("#cityHEAT").hide();
    		}
    	}else{
    		//process_dic_to_sandian(WOUND_city,"citySandian");
    		if(WOUND_city.length>0){
	    		process_dic_to_bubblemap(groupByDate2(WOUND_city,WOUND_city[0].value), 'citySandian');
    			$("#maxCityValue").html(WOUND_city[0].value);
    			$("#cityHEAT").show();
    		}else{
	    		process_dic_to_bubblemap(groupByDate2(WOUND_city), 'citySandian');
    			$("#cityHEAT").hide();
    		}
    	}
    }
    //加载州省的散点图
    function countsSandian(countsType){
    	if(countsType != "AFFECT_state"){
    		$("#AFFECT_state_sandian").css("background-color","#fff").css("border","1px solid #cccccc");
    	}else{
    		$("#AFFECT_state_sandian").css("background-color","#e6e6e6").css("border","1px solid #adadad");
    	}
    	
    	if(countsType=='AFFECT_state'){
    		//process_dic_to_sandian(AFFECT_state,"stateSandian")
    		if(AFFECT_state.length>0){
	    		process_dic_to_bubblemap(groupByDate2(AFFECT_state,AFFECT_state[0].value), 'stateSandian');
    			$("#maxStateValue").html(AFFECT_state[0].value);
    			$("#stateHEAT").show();
    		}else{
	    		process_dic_to_bubblemap(groupByDate2(AFFECT_state), 'stateSandian');
    			$("#stateHEAT").hide();
    		}
    	}else if(countsType=='ARREST_state'){
    		//process_dic_to_sandian(ARREST_state,"stateSandian")
    		if(ARREST_state.length>0){
	    		process_dic_to_bubblemap(groupByDate2(ARREST_state,ARREST_state[0].value), 'stateSandian');
    			$("#maxStateValue").html(ARREST_state[0].value);
    			$("#stateHEAT").show();
    		}else{
	    		process_dic_to_bubblemap(groupByDate2(ARREST_state), 'stateSandian');
    			$("#stateHEAT").hide();
    		}
    	}else if(countsType=='KIDNAP_state'){
    		//process_dic_to_sandian(KIDNAP_state,"stateSandian")
    		if(KIDNAP_state.length>0){
	    		process_dic_to_bubblemap(groupByDate2(KIDNAP_state,KIDNAP_state[0].value), 'stateSandian');
    			$("#maxStateValue").html(KIDNAP_state[0].value);
    			$("#stateHEAT").show();
    		}else{
	    		process_dic_to_bubblemap(groupByDate2(KIDNAP_state), 'stateSandian');
    			$("#stateHEAT").hide();
    		}
    	}else if(countsType=='KILL_state'){
    		//process_dic_to_sandian(KILL_state,"stateSandian")
    		if(KILL_state.length>0){
	    		process_dic_to_bubblemap(groupByDate2(KILL_state,KILL_state[0].value), 'stateSandian');
    			$("#maxStateValue").html(KILL_state[0].value);
    			$("#stateHEAT").show();
    		}else{
	    		process_dic_to_bubblemap(groupByDate2(KILL_state), 'stateSandian');
    			$("#stateHEAT").hide();
    		}
    	}else if(countsType=='PROTEST_state'){
    		//process_dic_to_sandian(PROTEST_stat,"stateSandian")
    		if(PROTEST_state.length>0){
	    		process_dic_to_bubblemap(groupByDate2(PROTEST_state,PROTEST_state[0].value), 'stateSandian');
    			$("#maxStateValue").html(PROTEST_state[0].value);
    			$("#stateHEAT").show();
    		}else{
	    		process_dic_to_bubblemap(groupByDate2(PROTEST_state), 'stateSandian');
    			$("#stateHEAT").hide();
    		}
    		process_dic_to_bubblemap(groupByDate2(PROTEST_state), 'stateSandian');
    	}else if(countsType=='SEIZE_state'){
    		//process_dic_to_sandian(SEIZE_state,"stateSandian")
    		if(SEIZE_state.length>0){
	    		process_dic_to_bubblemap(groupByDate2(SEIZE_state,SEIZE_state[0].value), 'stateSandian');
    			$("#maxStateValue").html(SEIZE_state[0].value);
    			$("#stateHEAT").show();
    		}else{
	    		process_dic_to_bubblemap(groupByDate2(SEIZE_state), 'stateSandian');
    			$("#stateHEAT").hide();
    		}
    	}else{
    		//process_dic_to_sandian(WOUND_state,"stateSandian")
    		if(WOUND_state.length>0){
	    		process_dic_to_bubblemap(groupByDate2(WOUND_state,WOUND_state[0].value), 'stateSandian');
    			$("#maxStateValue").html(WOUND_state[0].value);
    			$("#stateHEAT").show();
    		}else{
	    		process_dic_to_bubblemap(groupByDate2(WOUND_state), 'stateSandian');
    			$("#stateHEAT").hide();
    		}
    	}
    }
    //散点图
    function process_dic_to_sandian(data,chartID){
    	var maxValue = 0;
    	var minValue = 0;
    		var index = 0;
    		for(var i in data){
    			index++;
    		}
    		if(index>0){
    			maxValue = data[0].value;
    			minValue = data[index-1].value;
    		}
    		
    			var b_map={
			      "type": "map",
			      "theme": "light",
			      "path": "<%=basePath%>/static/Visualization/js/amcharts/",
			      "titles": [],
			      "dataProvider": {
			        mapVar: AmCharts.maps.worldLow,
					images: data
			      },
			      "imagesSettings":{
			        balloonText:"<span style='font-size:14px;'><b>[[title]]</b>: [[value]]</span>"
			      },
			      "areasSettings": {
			        unlistedAreasColor: "#000000",
					unlistedAreasAlpha: 0.1
			      },
				  "valueLegend": {
					right: 10,
					minValue: minValue,
					maxValue: maxValue
					},
					"export": {
				        "enabled": true,
				        "position": "top-right",
				       "libs": {
				      "path":  "<%=basePath%>/static/Visualization/js/amcharts/export/libs/"
				    }
				  }
				}
			AmCharts.makeChart(chartID,b_map);
		}
    
    //加载热点国家数据
    function bubble_map(map_id,bubble_data){
        var bubble_map = new Datamap({
           element: document.getElementById(map_id),
           projection: 'mercator',
           geographyConfig: {
             popupOnHover: true,
             highlightOnHover: true
           },
           bubblesConfig: {
             borderWidth: 1,
             borderOpacity: 1,
             borderColor: '#FFFFFF'
           },
           fills: {
               defaultFill: '#ABDDA4',
               country:"#ff4500",
               state:"#428bca",
               city:"orange"
           }
         });
         bubble_map.bubbles([]);
         bubble_map.bubbles(bubble_data, {
             popupTemplate: function (geo, data) {
                 return '<div class="hoverinfo"><strong>发生地名:' + data.name + "<br/>" + '规模大小: ' + data.yield + "<br/>" + '信息描述: ' + data.significance+'</strong>'
             }
     });
     }
    function groupByDate2(data,numValue) {
        var ret = [];
        var minValue,maxValue;
        if(data.length>0){
	        data.forEach(function(e) {
	            var c = {
	                lat: e.latitude,
	                long: e.longitude,
	                key: e.title,
	                color: e.value > numValue/4*3 ? 'red' : (e.value > numValue/4*2 ? '#ff4500' : (e.value > numValue/4*1 ? 'green' : 'limegreen')),
	                value: e.value
	            };
	            minValue = minValue ? e.value : Math.min(minValue, e.value);
	            maxValue = maxValue ? e.value : Math.max(maxValue, e.value);
	            ret.push(c);
	        });
	        ret.minValue = minValue;
	        ret.maxValue = maxValue;
        }
        return ret;
    }
    function pie_chart_new(domId,fild,data) {
    	AmCharts.makeChart( domId, {
    		  "type": "pie",
    		  "theme": "light",
    		  "dataProvider": data,
    		  "titleField": fild.category||"key",
    		  "valueField": fild.value||"value",
    		  "labelRadius": 5,

    		  "radius": "38%",
    		  "innerRadius": "50%",
    		  "labelText": "[[name_key]]",
    		  "export": {
    		    "enabled": true,
    		    "libs": {
                    "path": getBasePath()+"/static/Visualization/js/amcharts/export/libs/"
                }
    		  }
    	
    		} );
    }
    </script>
</html>