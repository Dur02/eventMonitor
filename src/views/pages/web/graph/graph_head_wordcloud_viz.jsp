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
<title>人物头像标签云</title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="shortcut icon" type="image/x-icon" href="<%=basePath%>/static/Visualization/base/ico.png" />
<link rel="stylesheet" href="<%=basePath %>/static/css/combo.select.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/perfect-scrollbar.css"/>
<link rel="stylesheet" href="<%=basePath%>/static/css/style.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath%>/static/lib/pagination.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/base.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/css/event_result.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/js/amcharts/export/export.css" />
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
<script src="<%=basePath %>/static/js/jquery-1.9.1.min.js"></script>
<body>
	<div class="index_top clearfix">
		<h3 class="fl title">图谱库分析 > 人物头像标签云</h3>
	</div>
	<div class="index_bottom">
		<input type="hidden" id="moduleCode" value="${moduleCode}">
		<!-- 显示图 -->
		<div class="data show">
		
			<div class="row" >
				<div class="col-md-12 mg_t">
					<div class="col-md-12 bor">
						<h3 class="tx-c">头像标签云-<span id="leader_tx" style="border:0px;font-size:14px;"></span>
								<div  class="help" onmouseover="showChartInfo(5,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
						</h3>
						<div class="amcharts oneColumChart" style="text-align: center;">
							<img src="" id="head_img0" alt="" style="width: 37%; height: 88%;">
						</div>
					</div>
				</div>
			</div>
			
			<%-- <div class="row">
	         	 <div class="col-md-12 mg_t ">
		            <div class="col-md-10 bor w50l" style="height:445px;border: 1px solid #CCCCCC;margin: 0px 0px 0px 0;width:49.5%; float:left; border-radius:3px;">
						<h3 class="tx-c">组织-<span id="leader_o" style="border:0px;font-size:14px;"></span>
							<select class="selectCounts" id="selectZZ">
							</select>
							<div  class="help" onmouseover="showChartInfo(1,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
						</h3>
						<div class="col-md-7"style="width:100%;">
							<div id="org_pie_chart_0" class="amcharts"></div>
						</div>
		            </div>
		            <div class="col-md-10 bor w50r" style="height:445px;border: 1px solid #CCCCCC;margin: 0px 0px 0px 0; border-radius:3px;width:49.5%; float:right;">
		               <div class="col-md-5 chart-text" id="theme_pie_chart_text_0" style="opacity:1;margin-top:10px; width:60%;margin-left:-15px;">
							<h3 class="tx-c">主题-<span id="leader_zt" style="border:0px;font-size:14px;"></span>
	                        	<select class="selectCounts" id="selectZT">
								</select>	
								<div  class="help" onmouseover="showChartInfo(2,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>		
							</h3>
						</div>
						<div class="col-md-7"style="width:100%;">
							<div id="theme_pie_chart_0" class="amcharts"></div>
						</div>
		             </div>
	             </div>
        	 </div> --%>
		
		<%-- <input type="hidden" id="moduleCode" value="${moduleCode}">
			<div class="" style="margin-top:-10px;">
				<div class="row" id="o_0">
				<div class="col-md-12 mg_t ">
					<div class="col-md-10 bor w50l" style="width:100%;border: 1px solid #CCCCCC;width:49.5%; float:left;height:450px;border-radius:3px;">
						<div class="col-md-5 chart-text" id="org_pie_chart_text_0" style="opacity:1;margin-top:10px; width:60%;margin-left:-15px;">
							<span style="font-size:14px;color:black;">组织-<span id="leader_o" style="border:0px;font-size:14px;"></span>
								<select class="selectCounts" id="selectZZ">
								</select>
							</span>
						</div>
						<div class="col-md-7"style="width:100%;">
							<div id="org_pie_chart_0" class="amcharts"></div>
						</div>
					</div>
					<div class="col-md-10 bor w50r" style="width:100%;border: 1px solid #CCCCCC;width:49.5%; float:right;height:450px;border-radius:3px;">
						<div class="col-md-5 chart-text" id="theme_pie_chart_text_0" style="opacity:1;margin-top:10px; width:60%;margin-left:-15px;">
							<span style="font-size:14px;color:black;">主题-<span id="leader_zt" style="border:0px;font-size:14px;"></span>
	                        	<select class="selectCounts" id="selectZT">
								</select>			
							</span>
						</div>
						<div class="col-md-7"style="width:100%;">
							<div id="theme_pie_chart_0" class="amcharts"></div>
						</div>
					</div>
				</div>
			</div> --%>
			
			
			<div class="row" >
				<div class="col-md-12 mg_t">
					<div class="col-md-12 bor">
						<h3 class="tx-c">人物-<span id="leader_rw" style="border:0px;font-size:14px;"></span>		
							<select class="selectCounts" id="selectCountry">
							</select>
							<div  class="help" onmouseover="showChartInfo(3,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
						</h3>
						<div id="person_column_chart_0" class="amcharts oneColumChart"></div>
					</div>
				</div>
			</div>
			<%-- <div class="row" id="p_0" >
				<div class="col-md-12 mg_t ">
				<div class="col-md-10" style="border: 1px solid #CCCCCC;border-radius:3px;width:100%;">
				<div class="col-md-5 chart-text" id="person_column_chart_text_0"  style="opacity:1;margin-top:10px;width: 100%; text-align: center; ">
						<h3 class="tx-c">人物-<span id="leader_rw" style="border:0px;font-size:14px;"></span>		
							<select class="selectCounts" id="selectCountry">
							</select>
							<div  class="help" onmouseover="showChartInfo(3,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
						</h3>
					</div>
					<div class="col-md-7" style="width:100%;">
						<div id="person_column_chart_0" class="amcharts"></div>
					</div>
				</div>
				</div>
			</div> --%>
			
			<div class="row" >
				<div class="col-md-12 mg_t">
					<div class="col-md-12 bor">
						<h3 class="tx-c">地理-<span id="leader_dl" style="border:0px;font-size:14px;"></span>
							<select class="selectCounts" id="selectDL"></select>
							<div  class="help" onmouseover="showChartInfo(4,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
						</h3>
						<div id="location_column_chart_0" class="amcharts oneColumChart"></div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 mg_t mg_b">
					<div id="chart-content">
						<div class="col-md-6 bor w50l">
							<h3 class="tx-l">组织-<span id="leader_o" style="border:0px;font-size:14px;"></span>
								<select class="selectCounts" id="selectZZ"></select>
								<div  class="help" onmouseover="showChartInfo(1,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
							</h3>
							<div id="org_pie_chart_0" class="amcharts twoCharts"></div>
						</div>
						<div class="col-md-6 bor w50r">
							<h3 class="tx-l">主题-<span id="leader_zt" style="border:0px;font-size:14px;"></span>
	                        	<select class="selectCounts" id="selectZT">
								</select>	
								<div  class="help" onmouseover="showChartInfo(2,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>		
							</h3>
							<div id="theme_pie_chart_0" class="amcharts twoCharts">
							</div>
						</div>
					</div>
				</div>
			</div>
			<%-- <div class="row" id="l_0" >
				<div class="col-md-12 mg_t ">
					<div class="col-md-10" style="border: 1px solid #CCCCCC;border-radius:3px;width:100%;">
							<h3 class="tx-c">地理-<span id="leader_dl" style="border:0px;font-size:14px;"></span>
								<select class="selectCounts" id="selectDL">
								</select>
								<div  class="help" onmouseover="showChartInfo(4,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
							</h3>
						<div class="col-md-7" style="width:100%;">
							<div id="location_column_chart_0" class="amcharts"></div>
						</div>
					</div>
				</div>
			</div> --%>
			<%-- <div class="row" id="h_0" >
				<div class="col-md-12 mg_t ">
					<div class="col-md-10" style="border: 1px solid #CCCCCC;border-radius:3px;width:100%;height:340px;margin-bottom:70px;">
							<h3 class="tx-c">头像标签云-<span id="leader_tx" style="border:0px;font-size:14px;"></span>
								<div  class="help" onmouseover="showChartInfo(5,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
							</h3>
							<div class="col-md-12" style="text-align: center;top:10px; height: 293px;">
							<img src="" id="head_img0" alt="error:no head img!" style="max-width: 100%; max-height: 100%;">
						</div>
					</div>
					</div>
				</div> --%>
			</div>
		</div>
		<!-- 显示表格结束 -->
		<!-- 页面底部收缩 -->
		<div class="tab">
			<%-- <span class="ul_xl"></span>
			<ul id="tab_ul" class="tab_ul clearfix">
				<c:forEach items="${typeList }" var="t" varStatus="indx">
					<c:if test="${indx.index eq 0 }">
						<li class="active mgl-30" onclick="render(${t.configId});">${t.configName }
							<span></span>
						</li>
					</c:if>
					<c:if test="${indx.index ne 0 }">
						<li class="" onclick="render(${t.configId});">${t.configName }<span></span></li>
					</c:if>
				</c:forEach>
				<c:if test="${sessionScope.LOGINUSER.roleId  != 3 }">
				<li class="manual">即时查询</li>
				</c:if>
			</ul> --%>
			<div class="change_box">
			<span class="ul_xl"></span>
			<span class="prev_btn none"></span>
			<span class="next_btn none"></span>
			<div class="tab_ul_box">
				<ul id="tab_ul" class="tab_ul clearfix">
				<c:forEach items="${typeList }" var = "t" varStatus="indx">
					<c:if test="${indx.index eq 0 }">
						<li class="active mgl-30" onclick="render(${t.configId});">${t.configName }</li>
					</c:if>
					<c:if test="${indx.index ne 0 }">
						<li class=""  onclick="render(${t.configId});">${t.configName }</li>
					</c:if>
				</c:forEach>
				</ul>
			</div>
			<c:if test="${sessionScope.LOGINUSER.roleId  != 3 }">
				<p class="manual">即时查询</p>
			</c:if>
		</div>
					<div class="tab_div">
						<c:forEach items="${typeList }" var="t" varStatus="indx">
							<c:if test="${indx.index eq 0 }">
								<div class="tab_down show">
							</c:if>
							<c:if test="${indx.index ne 0 }">
								<div class="tab_down">
							</c:if>
							<ul class="tab_down_info">
								<li class="clearfix">
									<div class="td1 fl">
										<p class="time_png fl"></p>
										<b>日期属性：</b>
									</div>
									 <c:forEach items="${t.dateInfo }" var="tt">
										<div class='add_date clearfix'>
											<div class='clearfix' style="margin-left: 140px;">
												<div class="fl">
													<span class="beg_time fl">开始时间</span>
												</div>
												<div class='td3_2 fl'>
													<label class='lab2' for=''><input class='inp_selc'
														name='stDates' type='text' readonly value='${tt.stDate}' /></label>
												</div>
												<div class='fl width18'></div>
												<div class="fl">
													<span class="end_time fl">结束时间</span>
												</div>
												<div class='td3_2 fl'>
													<label class='lab2' for=''><input class='inp_selc'
														name='edDates' type='text' readonly value='${tt.edDate}' /></label>
												</div>
											</div>
										</div>
									</c:forEach>
								</li>
								
								<li class="clearfix">
									<div class="td1 fl"><p class="weight_png2 fl"></p><b>人物信息：</b></div>
									<div class="fl"><span class="beg_time fl">人物名单</span></div>
									<div class="fl width138 clearfix" style="margin-left:8px;">
										<div class="td3 fl">
											<span class="span_huixian">
												${t.leaderName }
											</span>
										</div>
									</div>
									<div class="fl" style="margin-left: 10px;margin-left: 10px;margin-right: 5px;"><span  style="margin-top: 1px;" class="fl">关键字 :</span></div>
									<div class="radio_box">
										<input class="condition_info_graph_ids2 fl" style="width: 400px;" type="text" value="${t.leaderKeyWord }" />
									</div>
								</li>
								<!-- 情感值 -->
								<li class="clearfix">
									<div class="td1 fl"><p class="tone_png fl"></p><b class="sjsx">情感值：</b></div>
									<div class="radio_box " id="toone" >
										<!-- 回显平均情感值的复选框以及对应的起始值和结束值 -->
										<label for="avgtone" style="float: left;padding-right: 37px;">
											<c:set value="false" var="flag_avgTone"></c:set>
											<c:set value="" var="qs_avgTone"></c:set>
											<c:set value="" var="js_avgTone"></c:set>
											<c:forEach items="${t.gkgToneConfigInfo }" var="tone">
												<c:if test="${tone.sxID==1}">
													<c:set value="true" var="flag_avgTone"></c:set>
													<c:set value="${tone.qsSXZ}" var="qs_avgTone"></c:set>
													<c:set value="${tone.jsSXZ}" var="js_avgTone"></c:set>
												</c:if>
											</c:forEach>
											<input onclick="return false;" class="radioAndCheckboxByFont_css" type="checkbox" <c:if test="${flag_avgTone == true}">checked="checked"</c:if> />平均情感
										</label>
										<c:if test="${flag_avgTone == true}">
											<label  style="float: left;padding-right: 15px;" class="avg" >
												<input style="width:50px;" class="condition_info_tone fl"   type="text" value="${qs_avgTone }" />
												<span class="fl">—</span>
												<input style="width:50px;" class="condition_info_tone fl"   type="text" value="${js_avgTone }"  />
											</label>
										</c:if>
										
										<!-- 回显正向情感词比例的复选框 -->
										<label for="Positive" style="float: left;padding-right: 15px;">
											<c:set value="false" var="flag_Positive"></c:set>
											<c:forEach items="${t.gkgToneConfigInfo }" var="tone">
												<c:if test="${tone.sxID==2}">
													<c:set value="true" var="flag_Positive"></c:set>
													<c:set value="${tone.qsSXZ}" var="qs_Positive"></c:set>
													<c:set value="${tone.jsSXZ}" var="js_Positive"></c:set>
												</c:if>
											</c:forEach>
											<input onclick="return false;" type="checkbox" class="radioAndCheckboxByFont_css" <c:if test="${flag_Positive == true}">checked="checked"</c:if> />正向情感词比例
										</label>
										<c:if test="${flag_Positive == true}">
											<label  style="float: left;padding-right: 15px;" class="avg" >
												<input style="width:50px;" class="condition_info_tone fl"   type="text" value="${qs_Positive }" />
												<span class="fl">—</span>
												<input style="width:50px;" class="condition_info_tone fl"   type="text" value="${js_Positive }"  />
											</label>
										</c:if>
									</div>
								</li>
								<li class="clearfix">
									<div class="radio_box " id="toone2" >	
										<!-- 回显负情感词比例的复选框 -->
										<label for="Negative" style="float: left;padding-left: 139px;height: 20px;padding-right: 13px;">
											<c:set value="false" var="flag_Negative"></c:set>
											<c:forEach items="${t.gkgToneConfigInfo }" var="tone">
												<c:if test="${tone.sxID==3}">
													<c:set value="true" var="flag_Negative"></c:set>
													<c:set value="${tone.qsSXZ}" var="qs_Negative"></c:set>
													<c:set value="${tone.jsSXZ}" var="js_Negative"></c:set>
												</c:if>
											</c:forEach>
											<input onclick="return false;"  class="radioAndCheckboxByFont_css" type="checkbox" <c:if test="${flag_Negative == true}">checked="checked"</c:if> />负情感词比例
										</label>
										<c:if test="${flag_Negative == true}">
											<label  style="float: left;padding-right: 15px;" class="avg" >
												<input style="width:50px;" class="condition_info_tone fl"   type="text" value="${qs_Negative }" />
												<span class="fl">—</span>
												<input style="width:50px;" class="condition_info_tone fl"   type="text" value="${js_Negative }"  />
											</label>
										</c:if>
										<!-- 回显极性词比例的复选框 -->
										<label for="Polarity" style="float: left;padding-right: 41px;">
											<c:set value="false" var="flag_Polarity"></c:set>
											<c:forEach items="${t.gkgToneConfigInfo }" var="tone">
												<c:if test="${tone.sxID==4}">
													<c:set value="true" var="flag_Polarity"></c:set>
													<c:set value="${tone.qsSXZ}" var="qs_Polarity"></c:set>
													<c:set value="${tone.jsSXZ}" var="js_Polarity"></c:set>
												</c:if>
											</c:forEach>
											<input onclick="return false;" class="radioAndCheckboxByFont_css" type="checkbox" <c:if test="${flag_Polarity == true}">checked="checked"</c:if> />极性词比例
										</label>
										<c:if test="${flag_Polarity == true}">
											<label  style="float: left;padding-right: 15px;" class="avg" >
												<input style="width:50px;" class="condition_info_tone fl"   type="text" value="${qs_Polarity }" />
												<span class="fl">—</span>
												<input  style="width:50px;" class="condition_info_tone fl"   type="text" value="${js_Polarity }"  />
											</label>
										</c:if>
									</div>
								</li>
								<li class="clearfix">
									<div class="radio_box ">
										<!-- 回显活动词比例的复选框 -->
										<label for="Activitytone" style="float: left;padding-left: 139px;height: 20px;padding-right: 28px;">
											<c:set value="false" var="flag_Activitytone"></c:set>
											<c:forEach items="${t.gkgToneConfigInfo }" var="tone">
												<c:if test="${tone.sxID==5}">
													<c:set value="true" var="flag_Activitytone"></c:set>
													<c:set value="${tone.qsSXZ}" var="qs_Activitytone"></c:set>
													<c:set value="${tone.jsSXZ}" var="js_Activitytone"></c:set>
												</c:if>
											</c:forEach>
											<input onclick="return false;" class="radioAndCheckboxByFont_css" type="checkbox" <c:if test="${flag_Activitytone == true}">checked="checked"</c:if> />活动词比例
										</label>
										<c:if test="${flag_Activitytone == true}">
											<label  style="float: left;padding-right: 15px;" class="avg" >
												<input style="width:50px;" class="condition_info_tone fl"   type="text" value="${qs_Activitytone }" />
												<span class="fl">—</span>
												<input  style="width:50px;" class="condition_info_tone fl"   type="text" value="${js_Activitytone }"  />
											</label>
										</c:if>
										<!-- 回显代称比例的复选框 -->
										<label for="Grouptone" style="float: left;padding-right: 51px;">
											<c:set value="false" var="flag_Grouptone"></c:set>
											<c:forEach items="${t.gkgToneConfigInfo }" var="tone">
												<c:if test="${tone.sxID==6}">
													<c:set value="true" var="flag_Grouptone"></c:set>
													<c:set value="${tone.qsSXZ}" var="qs_Grouptone"></c:set>
													<c:set value="${tone.jsSXZ}" var="js_Grouptone"></c:set>
												</c:if>
											</c:forEach>
											<input onclick="return false;" class="radioAndCheckboxByFont_css" type="checkbox" <c:if test="${flag_Grouptone == true}">checked="checked"</c:if> />代称比例
										</label>
										<c:if test="${flag_Grouptone == true}">
											<label  style="float: left;padding-right: 15px;" class="avg" >
												<input style="width:50px;" class="condition_info_tone fl"   type="text" value="${qs_Grouptone }" />
												<span class="fl">—</span>
												<input style="width:50px;" class="condition_info_tone fl"   type="text" value="${js_Grouptone }"  />
											</label>
										</c:if>
									</div>
								</li>
								<li class="clearfix">
									<div class="td1 fl"><p class="ids_png fl"></p><b class="sjsx">ID集合：</b></div>
									<div class="gkg_tishi_tb10" >支持多个事件ID的精确查询,输入形式包括1.多个ID之间用","(英文)分割,如:256,257;2.两个ID之间用"-"分割,表示事件ID的范围</div>
									<div class="radio_box">
										<input class="condition_info_ids fl" type="text" value="${t.ids }"/>
									</div>
								</li>
								<li class="clearfix">
									<div class="td1 fl">
										<p class="weight_png fl"></p>
										<b>权重依据：</b>
									</div>
									<div class="td5 fl">
										<input type="radio" name="weightFlag${t.configId }"
											<c:if test="${t.weightFlag eq 1}"> checked="checked"</c:if>
											value="1"><label for="radio1">包含所选实体集的新闻报道数(1) </label>
									</div>
									<div class="td5 fl">
										<input type="radio" name="weightFlag${t.configId }"
											<c:if test="${t.weightFlag eq 2}"> checked="checked"</c:if>
											value="2"><label for="radio2"> 包含所选实体集的新闻报道数(NUMARTS)</label>
									</div>
								</li>
							</ul>
					</div>
					</c:forEach>
					<!-- 即时查询 -->
					<div class="tab_down people_tab_down">
					<form id="graphQueryForm" action="../config/renGongQuery" method="post">
					<input type="hidden" name="flid" id="RGFL">
					<input type="hidden" name="priority" value="1"/>
					<input type="hidden" name="configFlag" value="2"/>
					<input type="hidden" name="configCategoriesStr" id="modelType"/>
					<input type="hidden" name="gkgRemark" value="即时查询"/>
						<ul class="tab_down_info">
							<li class="clearfix">
								<div class="date_box clearfix">
									<div class="td1 fl">
										<p class="time_png fl"></p>
										<b>日期属性：</b>
									</div>
									<div style="position:absolute; left:140px; top:-20px">当前数据库时间范围：<span id="stDateSpan"></span>至<span id="edDateSpan"></span></div>
									<div class="width250 fl clearfix">
										<div class="fl"><span class="beg_time fl">开始时间</span></div>
										<div class="td3_2 fl">
											<label class="lab2" for=""><input class="inp_selc day1" id="gkgStDate" name="gkgStDate" type="text" readonly value="${curStDate[2]}"/></label>
										</div>
									</div>
									<div class="fl clearfix">
										<div class="fl"><span class="end_time fl">结束时间</span></div>
										<div class="td3_2 fl">
											<label class="lab2" for=""><input class="inp_selc day2" id="gkgEdDate" name="gkgEdDate" type="text" readonly value="${curEdDate[2]}"/></label>
										</div>
									</div>
								</div>
							</li>
							<li class="clearfix">
									<div class="td1 fl"><p class="weight_png2 fl"></p><b>人物信息：</b></div>
									<div class="fl"><span class="leader beg_time fl">人物名单</span></div>
											<input type="hidden" id="leaderhide" name="leaderNameIn"/>
											<div class="fl width138 clearfix" style="margin-left:8px;" id="insert_leader">
												<div class="dowebok8">
													<select name="leaderName" id="graph_leader" onchange="findLeaderKeyWordByName(this)">
														<option value="0" selected="selected"></option>
														<c:forEach items="${leaderList}" var="leaderinfo">
															<option value="${leaderinfo.leaderName}">${leaderinfo.leaderChName}</option>
														</c:forEach>
													</select>
												</div>
											</div>
									<div class="fl" style="margin-left: 10px;margin-left: 10px;margin-right: 5px;"><span class="fl" style="margin-top: 1px;">关键字 :</span></div>
									<div class="radio_box">
										<input class="condition_info_graph_ids2 fl" style="width: 400px;" type="text" id="leaderKeyWord" name="leaderKeyWord" onchange="validateKeyWords(this)"/>
										<span id="leaderKeywordSpan" style="position:relative;left:20px;width:40px;color: red"></span>
									</div>
							</li>
							<!-- 情感值 -->
							<li class="clearfix"  id="tone" >
								<div class="td1 fl"><p class="tone_png fl"></p><b class="sjsx">情感值：</b></div>
								<div class="radio_box " id="toone" >
									<label for="avgtone" style="float: left;padding-right: 37px;"><input class="radioAndCheckboxByFont_css" type="checkbox"  id="avgtone" name="sxIds" value="1"/> 平均情感</label>
									<label  style="display:none;float: left;padding-right: 15px;" class="avg" >
										<input  class="condition_info_tone fl" id="avgtone1"  type="text" value="-100" name ="qsSXZ" onblur="validate1()"/>
										<span class="fl">—</span>
										<input  class="condition_info_tone_tab fl" id="avgtone2"  type="text" value="100" name ="jsSXZ" onblur="validate11()" />
										<span id="spana" style="display:none;float: right;"><img src="<%=basePath %>/static/images/delete.png" style="margin-top: -2px;"></img></span>
									</label>
									
									<label for="Positive" style="float: left;padding-right: 15px;"><input class="radioAndCheckboxByFont_css" type="checkbox" id="Positive" name="sxIds" value="2" /> 正向情感词比例</label>
									<label style="display:none;float: left;padding-right: 15px;" class="pos">
										<input class="condition_info_tone fl" id="Positive1"  type="text" value="0" name ="qsSXZ" onblur="validate2()"/>
										<span class="fl">—</span>
										<input  class="condition_info_tone_tab fl" id="Positive2"  type="text" value="100" name ="jsSXZ"  onblur="validate22()"/>
										<span id="spanb" style="display:none;float: right;"><img src="<%=basePath %>/static/images/delete.png" style="margin-top: -2px;"></img></span>
									</label>
								</div>
							</li>
							<li class="clearfix"  id="tone1">
								<div class="radio_box " id="toone2" >	
									<label for="Negative" style="float: left;padding-left: 139px;height: 20px;padding-right: 13px;"><input class="radioAndCheckboxByFont_css" type="checkbox" id="Negative" name="sxIds" value="3" /> 负情感词比例</label>
									<label style="display:none;float: left;padding-right: 15px;" class="neg">
										<input  class="condition_info_tone fl" id="Negative1"  type="text" value="0" name ="qsSXZ" onblur="validate3()"/>
										<span class="fl">—</span>
										<input  class="condition_info_tone_tab fl" id="Negative2"  type="text" value="100" name ="jsSXZ"  onblur="validate33()"/>
										<span id="spanc" style="display:none;float: right;"><img src="<%=basePath %>/static/images/delete.png" style="margin-top: -2px;"></img></span>
									</label>
									<label for="Polarity" style="float: left;padding-right: 39px;"><input class="radioAndCheckboxByFont_css" type="checkbox" id="Polarity" name="sxIds" value="4" /> 极性词比例</label>
									<label style="display:none;float: left;padding-right: 23px;" class="pol">
										<input  class="condition_info_tone fl" id="Polarity1"  type="text" value="0" name ="qsSXZ" onblur="validate4()"/>
										<span class="fl">—</span>
										<input  class="condition_info_tone_tab fl" id="Polarity2"  type="text" value="100" name ="jsSXZ"  onblur="validate44()"/>
										<span id="spand" style="display:none;float: right;"><img src="<%=basePath %>/static/images/delete.png" style="margin-top: -2px;"></img></span>
									</label>
								</div>
							</li>
							<li class="clearfix"  id="tone2">
								<div class="radio_box " id="toone2" >
									<label for="Activitytone" style="float: left;padding-left: 139px;height: 20px;padding-right: 25px;"><input class="radioAndCheckboxByFont_css" type="checkbox" id="Activitytone" name="sxIds" value="5" /> 活动词比例</label>
									<label style="display:none;float: left;padding-right: 15px;" class="act">
										<input  class="condition_info_tone fl" id="Activitytone1"  type="text" value="0" name ="qsSXZ" onblur="validate5()"/>
										<span class="fl">—</span>
										<input  class="condition_info_tone_tab fl" id="Activitytone2"  type="text" value="100" name ="jsSXZ"  onblur="validate55()"/>
										<span id="spane" style="display:none;float: right;"><img src="<%=basePath %>/static/images/delete.png" style="margin-top: -2px;"></img></span>
									</label>
									<label for="Grouptone" style="float: left;padding-right: 51px;"><input class="radioAndCheckboxByFont_css" type="checkbox" id="Grouptone" name="sxIds" value="6" /> 代称比例</label>
									<label style="display:none;float: left;padding-right: 15px;" class="gro">
										<input  class="condition_info_tone fl" id="Grouptone1"  type="text" value="0" name ="qsSXZ" onblur="validate6()"/>
										<span class="fl">—</span>
										<input  class="condition_info_tone_tab fl" id="Grouptone2"  type="text" value="100" name ="jsSXZ"  onblur="validate66()"/>
										<span id="spanf" style="display:none;float: right;"><img src="<%=basePath %>/static/images/delete.png" style="margin-top: -2px;"></img></span>
									</label>
								</div>
							</li>
							<li class="clearfix" id="IDs">
								<div class="td1 fl"><p class="ids_png fl"></p><b class="sjsx">ID集合：</b></div>
								<div class="gkg_tishi_tb10" >您必须输入数字用“,”（英文）隔开，如：256,257；或者输入数字用“-”隔开,表示数据范围</div>
								<div class="radio_box">
									<input class="condition_info_ids fl" type="text" id="ids" name="ids" onblur="validateIDs()"/>
									<span id="IDspan" style=" position:relative;left:20px;width: 40px" name="IDspan" ></span>
								</div>
							</li>
							<li class="clearfix">
								<div class="td1 fl">
									<p class="weight_png fl"></p>
									<b>权重依据：</b>
								</div>
								<div class="td5 fl">
									<input type="radio" name="gkgWeightFlag" value="1"
										checked="checked"><label for="radio1"> 包含所选实体集的新闻报道数(1)</label>
								</div>
								<div class="td5 fl">
									<input type="radio" name="gkgWeightFlag" value="2"><label
										for="radio2"> 包含所选实体集的新闻报道数(NUMARTS)</label>
								</div>
							</li>
							<li class="clearfix">
								<div class="fr">
									<div style=" float:left; margin-right:10px; margin-top:4px; ">保存配置：<input class="artificial_radio" name="isSaveConfig" value="0" type="radio" onclick="$('#rgConfigName').show()">是<input class="artificial_radio" type="radio" name="isSaveConfig" value="1" checked onclick="$('#rgConfigName').hide()">否</div>
									<div style=" float:left; margin-right:10px; display: none; margin-top:4px; " id="rgConfigName">配置名称：<input class="default_input" style="padding: 1px 8px;" type="text" name="configName" id="configName"></div>
									<div style=" float:left;"><input class="submit2" type="button" onclick="gkgRGQuery()" value="提交"></div>
								</div>
							</li>
						</ul>
						</form>
					</div>
				</div>
			</div>
		</div>
			<jsp:include page="../updateUserPassword.jsp"/>
		<!-- 页面底部收缩结束 -->
</body>
<%-- <script src="<%=basePath%>/static/lib/jquery.pagination.js"></script> --%>
<script src="<%=basePath %>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath %>/static/js/perfect-scrollbar.js"></script>
<script src="<%=basePath%>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-select.min.js"></script>
<script src="<%=basePath %>/static/js/jquery.combo.select.js"></script>
<script src="<%=basePath%>/static/js/sec2.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/base.js"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/amcharts.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/themes/light.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amchart_util.js" type="text/javascript"></script>
<!--    <script src="./static/Visualization/js/amcharts/ammap.js" type="text/javascript"></script>-->
<script src="<%=basePath%>/static/Visualization/js/ammap_util.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/export/export.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/serial.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/pie.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/radar.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/d3.v3.min.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/d3.layout.cloud.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/jqcloud/jqcloud.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/worldLow.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
<c:if test="${bgFlag == null or bgFlag == 1}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
</c:if>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/downLoad.js"></script>
<script src="<%=basePath %>/static/js/config/config.js"></script>
 <!-- 即时查询js -->
<script src="<%=basePath %>/static/Visualization/rgQuery.js"></script>
<!-- 计算显示图的高度 -->	
<script src="<%=basePath%>/static/js/chartHeight.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<script type="text/javascript">
	$(function(){
		/* //美化图表展示界面的右侧滚动条
		index_bottom_perfectScrollbar(); */
		//提示开始和结束时间赋值
		$("#edDateSpan").html('${maxDate[2] }');
		$("#stDateSpan").html('${minDate[2] }');
		//处理配置
		handleConfigs();
		//控制Tone字段的显示问题
		gkgToneIsShow();
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
	
	function render(configId){
		startLoad();
		var resultcode = 'ALL';
		$.ajax({
				url:'<%=basePath%>/search/graph_head_wordcloud_viz/'+configId,
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
		var leader_dic_data =data.leader_dic;
		var organization_count_data =data.result_organization;
		var theme_count_data = data.theme_dic;
		var person_count_data = data.result_person;
		var location_count_data = data.result_location;
		var image_path = data.Image_path;
		var len = leader_dic_data.length;
		
		if(organization_count_data.length>0){
			$("#selectZZ").show();
			$("#selectZZ").html("");
	        var orgNum = organization_count_data.length > 20 ? 20:organization_count_data.length;
	        
	        for(var j=2;j<=orgNum;j+=2){
	        	document.getElementById("selectZZ").options.add(new Option(j,j));
	        }
	        var	countryOptionCount = $("#selectZZ option").map(function(){return $(this).val();}).get().join(", ");
			if(orgNum >=8){
				$("#selectZZ option[value='8']").attr("selected",true);
				pie_chart2("org_pie_chart_0", organization_count_data.slice(0, 8));
			}else{
				$("#selectZZ").hide();
				pie_chart2("org_pie_chart_0", organization_count_data.slice(0, orgNum));
			}
			$("#selectZZ").change(function () {
	        	var changeValue = $("#selectZZ option:selected").val();
	        		pie_chart2("org_pie_chart_" + 0, organization_count_data.slice(0,changeValue));
	        });
		}else{
			$("#selectZZ").hide();
			$("#org_pie_chart_0").html('<img alt="" class="tubiao2"  src="<%=basePath %>/static/images/tubiao2.png">');
		}
		if(theme_count_data.length>0){
			$("#selectZT").show();
			$("#selectZT").html("");
	        var theNum = theme_count_data.length > 20 ? 20:theme_count_data.length;
	        for(var j=2;j<theNum;j+=2){
	        	document.getElementById("selectZT").options.add(new Option(j,j));
	        }
	        var	countryOptionCount = $("#selectZT option").map(function(){return $(this).val();}).get().join(", ");
			if(theNum>=8){
				$("#selectZT option[value='8']").attr("selected",true);
				pie_chart2("theme_pie_chart_0",theme_count_data.slice(0, 8));
			}else{
				$("#selectZT").hide();
				pie_chart2("theme_pie_chart_0",theme_count_data.slice(0, theNum));
			}
			$("#selectZT").change(function () {
	        	var changeValue = $("#selectZT option:selected").val();
	        		pie_chart2("theme_pie_chart_0", theme_count_data.slice(0,changeValue));
	        });
		}else{
			$("#selectZT").hide();
			$("#theme_pie_chart_0").html('<img alt="" class="tubiao2"  src="<%=basePath %>/static/images/tubiao2.png">');
		}
		if(person_count_data.length>0){
			$("#selectCountry").show();
			$("#selectCountry").html("");
	        var theNum = person_count_data.length > 20 ? 20:person_count_data.length;
	        for(var j=5;j<=theNum;j+=5){
	        	document.getElementById("selectCountry").options.add(new Option(j,j));
	        }
	        var	countryOptionCount = $("#selectCountry option").map(function(){return $(this).val();}).get().join(", ");
			if(countryOptionCount.indexOf(10)!=-1){
				$("#selectCountry option[value='10']").attr("selected",true);
				process_dic_to_amchart(person_count_data,'column_chart','person_column_chart_0');
			}else{
				$("#selectCountry").hide();
				process_dic_to_amchart(person_count_data,'column_chart','person_column_chart_0',theNum);
	        }
           
			$("#selectCountry").change(function () {
	        	var changeValue = $("#selectCountry option:selected").val();
	        	process_dic_to_amchart(person_count_data,'column_chart','person_column_chart_0',changeValue);
	        });
		}else{
			$("#selectCountry").hide();
			$("#person_column_chart_0").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
		}
		if(location_count_data.length>0){
			$("#selectDL").show();
			$("#selectDL").html("");
	        var theNum = location_count_data.length > 20 ? 20:location_count_data.length;
	        for(var j=5;j<=theNum;j+=5){
	        	document.getElementById("selectDL").options.add(new Option(j,j));
	        }
	        var	countryOptionCount = $("#selectDL option").map(function(){return $(this).val();}).get().join(", ");
			if(countryOptionCount.indexOf(10)!=-1){
				$("#selectDL option[value='10']").attr("selected",true);
				process_dic_to_amchart(location_count_data,'column_chart','location_column_chart_0');
			}else{
				$("#selectDL").hide();
				process_dic_to_amchart(location_count_data,'column_chart','location_column_chart_0',theNum);
			}
	       /*  column_chart("location_column_chart_" + i, {
				category: "key",
				value: "value"
			}, location_count_data[0].slice(0, 10)); */
			$("#selectDL").change(function () {
	        	var changeValue = $("#selectDL option:selected").val();
	        	process_dic_to_amchart(location_count_data,'column_chart','location_column_chart_0',changeValue);
	        		/* column_chart("location_column_chart_" + 0, {
						category: "key",
						value: "value"
					}, location_count_data[0].slice(0,changeValue)); */
	        });
		}else{
			$("#selectDL").hide();
			$("#location_column_chart_0").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
		}
		$("#leader_o").html(leader_dic_data[0]);
		$("#leader_rw").html(leader_dic_data[0]);
		$("#leader_zt").html(leader_dic_data[0]);
		$("#leader_dl").html(leader_dic_data[0]);
		$("#leader_tx").html(leader_dic_data[0]);
		//获取头像标签云图片
		document.getElementById("head_img0").src = "<%=basePath%>/search/getHeaderImage?imagePath="+image_path; 
	}
</script>
</html>