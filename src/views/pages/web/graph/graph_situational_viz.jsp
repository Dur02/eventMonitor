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
<title>国家态势感知</title>
<link rel="stylesheet" href="<%=basePath%>/static/css/style.css">
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<!-- 人工查询日期 -->
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath%>/static/lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/combo.select.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/perfect-scrollbar.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/base.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/css/event_result.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/js/amcharts/export/export.css" />
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/leaflet.css" type="text/css" media="screen" />
<link rel="stylesheet"	href="<%=basePath%>/static/Visualization/css/leaflet/dvf.css"	type="text/css" media="screen" />
<link rel="stylesheet"	href="<%=basePath%>/static/Visualization/css/leaflet/example.css"	type="text/css" media="screen" />
<link rel="stylesheet"	href="<%=basePath%>/static/Visualization/css/leaflet/ui.css"	type="text/css" media="screen" />
<link rel="stylesheet"	href="<%=basePath%>/static/Visualization/css/situationalmap.css"	type="text/css" media="screen" />
<link rel="stylesheet"	href="<%=basePath%>/static/Visualization/css/export.css" type="text/css" media="screen" />
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
<body>
	<div class="index_top clearfix">
		<h3 class="fl title">图谱库分析 > 国家态势感知</h3>
		<!-- <div class="title_r fr">
			<span class="export_img_2" title="图表切换"></span> <span
				class="info_img"></span>
			<ul class="info_box">
				<li><span>数据：</span>事件数据库</li>
				<li><span>描述：</span>反映一段时间内，某地发生的事件的对比情况</li>
				<li><span>输入：</span>对比信息，事件编码，阈值信息</li>
				<li><span>介绍：</span>ttajkasdasdfa asdfasdf
					asdfa啊发生的发生地阿打法的疯狂拉升地方案的发生发生的法律看见俺十分啊发生的发生地发沙发</li>
			</ul>
		</div> -->
	</div>
	<div class="index_bottom">
		<div class="data show">
		    <!-- 存放themes的多组日期数据 -->
			<div class="row" id="themesRow">
				<input type="hidden" id="moduleCode" value="${moduleCode}">
			</div>
			<!-- 存放locations的多组日期的数据 -->
			<div class="row" id="locationsRow" style="margin-bottom:70px!important;">
				
			</div>

		</div>
		<!-- 条件tab页 st -->
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
				<li class="manual">人工输入查询</li>
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
					<p class="manual">人工输入查询</p>
				</c:if>
			</div>
			<%-- <div class="tab_div">
				<!-- 预设点A -->
				<div class="tab">
			<span class="ul_xl"></span>
			<ul id="tab_ul" class="tab_ul clearfix">
				<c:forEach items="${typeList }" var="t" varStatus="indx">
					<c:if test="${indx.index eq 0 }">
						<li class="active mgl-30" onclick="render(${t.configId});">${t.configName }
							<b></b><span></span>
						</li>
					</c:if>
					<c:if test="${indx.index ne 0 }">
						<li class="" onclick="render(${t.configId});">${t.configName }<b></b><span></span></li>
					</c:if>
				</c:forEach>
				<c:if test="${sessionScope.LOGINUSER.roleId  != 3 }">
				<li class="manual">人工输入查询<b></b></li>
				</c:if>
			</ul> --%>

			<div class="tab_div">
				<!-- 预设点A -->
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
										<div class="fl"><span class="beg_time fl">开始时间</span></div>
										<div class='td3_2 fl'>
											<label class='lab2' for=''><input class='inp_selc'
												name='stDates' type='text' readonly value='${tt.stDate}' /></label>
										</div>
										<div class='fl width18'></div>
										<div class="fl"><span class="end_time fl">结束时间</span></div>
										<div class='td3_2 fl'>
											<label class='lab2' for=''><input class='inp_selc'
												name='edDates' type='text' readonly value='${tt.edDate}' /></label>
										</div>
									</div>
								</div>
							</c:forEach>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="threshold_png fl"></p><b>关键字搜索条件：</b></div>
							<div >您必须指定检索的关键词，用逗号隔开；在检索中，以下三个查询条件之间是“AND”关系</div>
							<div class="fl">
								<div class="condition fl">必须包含以下所有关键词</div>
								<input class="condition_info fl" type="text" readonly value='${t.necessaryKey}' />
							</div>
							<div class="fl  condition_box3">
								<div class="condition fl">不能包含以下关键词</div>
								<input class="condition_info fl" type="text" readonly value='${t.exclusiveKey}' />
							</div>
							<div class="fl condition_box2">
								<div class="condition fl">包含至少一个以下关键词</div>
								<input class="condition_info fl" type="text" readonly value='${t.atLeastOneKey}' />
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
									value="1"><label for="radio1"> 包含所选实体集的新闻报道数 (1)</label>
							</div>
							<div class="td5 fl">
								<input type="radio" name="weightFlag${t.configId }"
									<c:if test="${t.weightFlag eq 2}"> checked="checked"</c:if>
									value="2"><label for="radio2"> 包含所选实体集的新闻报道数(NUMARTS)</label>
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
								<label for="Negative" style="float: left;padding-left: 139px;height: 38px;padding-right: 13px;">
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
								<label for="Activitytone" style="float: left;padding-left: 139px;height: 38px;padding-right: 28px;">
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
							<div >您必须输入数字用“,”（英文）隔开，如：256,257；或者输入数字用“-”隔开,表示数据范围</div>
							<div class="radio_box">
								<input class="condition_info_ids fl" type="text" value="${t.ids }"/>
							</div>
						</li>
					</ul>
			</div>
			</c:forEach>
			<!-- 人工输入查询 -->
			<div class="tab_down people_tab_down">
			<form id="graphQueryForm" action="../config/renGongQuery" method="post">
			<input type="hidden" name="flid" id="RGFL">
			<input type="hidden" name="priority" value="1"/>
			<input type="hidden" name="configFlag" value="2"/>
			<input type="hidden" name="configCategoriesStr" id="modelType"/>
			<input type="hidden" name="gkgRemark" value="人工查询"/>
				<ul class="tab_down_info">
					<li class="clearfix" id="riqi">
						<div class="date_box clearfix">
							<div class="td1 fl"><p class="time_png fl"></p><b>日期属性：</b></div>
							<div style="position:absolute; left:140px; top:-20px">当前数据库时间范围：<span id="stDateSpan"></span>至<span id="edDateSpan"></span></div>
							<div id="time_be_box" class="clearfix">
								<div class="clearfix">
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
								    <div class="add_date_btn"></div>
								 </div>
							</div>
						</div>
					</li>
					<li class="clearfix">
							<div class="td1 fl"><p class="threshold_png fl"></p><b>关键字搜索条件：</b></div>
							<div >您必须指定检索的关键词，用逗号隔开；在检索中，以下三个查询条件之间是“AND”关系</div>
							<div class="fl">
								<div class="condition fl">必须包含以下所有关键词</div>
								<input class="condition_info fl" type="text" value="" name="necessaryKey"/>
							</div>
							<div class="fl condition_box2">
								<div class="condition fl">不能包含以下关键词</div>
								<input class="condition_info fl" type="text" value="" name="exclusiveKey"/>
							</div>
							<div class="fl  condition_box3">
								<div class="condition fl">包含至少一个以下关键词</div>
								<input class="condition_info fl" type="text" value="" name="atLeastOneKey"/>
							</div>
						</li>
						
						<li class="clearfix">
							<div class="td1 fl">
								<p class="weight_png fl"></p>
								<b>权重依据：</b>
							</div>
							<div class="td5 fl">
								<input type="radio" name="gkgWeightFlag" value="1" checked><label for="radio1"> 包含所选实体集的新闻报道数 (1) </label>
							</div>
							<div class="td5 fl">
								<input type="radio" name="gkgWeightFlag" value="2"><label for="radio2">  包含所选实体集的新闻报道数(NUMARTS)</label>
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
									<span id="spana" style="display:none;"></span>
								</label>
								
								<label for="Positive" style="float: left;padding-right: 15px;"><input class="radioAndCheckboxByFont_css" type="checkbox" id="Positive" name="sxIds" value="2" /> 正向情感词比例</label>
								<label style="display:none;float: left;padding-right: 15px;" class="pos">
									<input class="condition_info_tone fl" id="Positive1"  type="text" value="0" name ="qsSXZ" onblur="validate2()"/>
									<span class="fl">—</span>
									<input  class="condition_info_tone_tab fl" id="Positive2"  type="text" value="100" name ="jsSXZ"  onblur="validate22()"/>
									<span id="spanb" style="display:none;"></span>
								</label>
							</div>
						</li>
						<li class="clearfix"  id="tone1">
							<div class="radio_box " id="toone2" >	
								<label for="Negative" style="float: left;padding-left: 139px;height: 38px;padding-right: 13px;"><input class="radioAndCheckboxByFont_css" type="checkbox" id="Negative" name="sxIds" value="3" /> 负情感词比例</label>
								<label style="display:none;float: left;padding-right: 15px;" class="neg">
									<input  class="condition_info_tone fl" id="Negative1"  type="text" value="0" name ="qsSXZ" onblur="validate3()"/>
									<span class="fl">—</span>
									<input  class="condition_info_tone_tab fl" id="Negative2"  type="text" value="100" name ="jsSXZ"  onblur="validate33()"/>
									<span id="spanc" style="display:none;"></span>
								</label>
								<label for="Polarity" style="float: left;padding-right: 41px;"><input class="radioAndCheckboxByFont_css" type="checkbox" id="Polarity" name="sxIds" value="4" /> 极性词比例</label>
								<label style="display:none;float: left;padding-right: 23px;" class="pol">
									<input  class="condition_info_tone fl" id="Polarity1"  type="text" value="0" name ="qsSXZ" onblur="validate4()"/>
									<span class="fl">—</span>
									<input  class="condition_info_tone_tab fl" id="Polarity2"  type="text" value="100" name ="jsSXZ"  onblur="validate44()"/>
									<span id="spand" style="display:none;"></span>
								</label>
							</div>
						</li>
						<li class="clearfix"  id="tone2">
							<div class="radio_box " id="toone2" >
								<label for="Activitytone" style="float: left;padding-left: 139px;height: 38px;padding-right: 28px;"><input class="radioAndCheckboxByFont_css" type="checkbox" id="Activitytone" name="sxIds" value="5" /> 活动词比例</label>
								<label style="display:none;float: left;padding-right: 15px;" class="act">
									<input  class="condition_info_tone fl" id="Activitytone1"  type="text" value="0" name ="qsSXZ" onblur="validate5()"/>
									<span class="fl">—</span>
									<input  class="condition_info_tone_tab fl" id="Activitytone2"  type="text" value="100" name ="jsSXZ"  onblur="validate55()"/>
									<span id="spane" style="display:none;"></span>
								</label>
								<label for="Grouptone" style="float: left;padding-right: 51px;"><input class="radioAndCheckboxByFont_css" type="checkbox" id="Grouptone" name="sxIds" value="6" /> 代称比例</label>
								<label style="display:none;float: left;padding-right: 15px;" class="gro">
									<input  class="condition_info_tone fl" id="Grouptone1"  type="text" value="0" name ="qsSXZ" onblur="validate6()"/>
									<span class="fl">—</span>
									<input  class="condition_info_tone_tab fl" id="Grouptone2"  type="text" value="100" name ="jsSXZ"  onblur="validate66()"/>
									<span id="spanf" style="display:none;"></span>
								</label>
							</div>
						</li>
						<li class="clearfix" id="IDs">
							<div class="td1 fl"><p class="ids_png fl"></p><b class="sjsx">ID集合：</b></div>
							<div >您必须输入数字用“,”（英文）隔开，如：256,257；或者输入数字用“-”隔开,表示数据范围</div>
							<div class="radio_box">
								<input class="condition_info_ids fl" type="text" id="ids" name="ids" onblur="validateIDs()"/>
								<span id="IDspan" style=" position:relative;left:20px;width: 40px" name="IDspan" ></span>
							</div>
						</li>
					<li class="clearfix">
					    <div class="fr">
							<div style=" float:left; margin-right:10px;margin-top:4px;">保存配置：<input class="artificial_radio" name="isSaveConfig" value="0" type="radio" onclick="$('#rgConfigName').show()">是<input class="artificial_radio" type="radio" name="isSaveConfig" value="1" checked onclick="$('#rgConfigName').hide()">否</div>
							<div style=" float:left; margin-right:10px;display: none;margin-top:4px;" id="rgConfigName">配置名称：<input type="text" class="default_input" style="padding: 1px 8px;" name="configName" id="configName" onmouseout="yanzheng()"></div>
							<div style=" float:left;"><input class="submit2" type="button" onclick="gkgRGQuery()" value="提交"></div>
						</div>
					</li>
					</ul>
					</form>
				</div>
			</div>
			<jsp:include page="../updateUserPassword.jsp"/>
	</div>
</body>
<!-- 人工查询日期 -->
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/jquery-1.11.1.min.js"></script>
<script src="<%=basePath%>/static/lib/jquery.pagination.js"></script>
<script src="<%=basePath%>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath%>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath%>/static/js/bootstrap-select.min.js"></script>
<script src="<%=basePath%>/static/js/jquery.combo.select.js"></script>
<script src="<%=basePath%>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath%>/static/js/perfect-scrollbar.js"></script>
<script src="<%=basePath%>/static/js/sec2.js"></script>
<script type="text/javascript"	src="<%=basePath%>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript"	src="<%=basePath%>/static/Visualization/base/base.js"></script>

<script	src="<%=basePath%>/static/Visualization/js/amcharts/amcharts.js"	type="text/javascript"></script>
<script	src="<%=basePath%>/static/Visualization/js/amcharts/themes/light.js"	type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amchart_util.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/ammap.js"	type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/ammap_util.js"	type="text/javascript"></script>
<script	src="<%=basePath%>/static/Visualization/js/amcharts/export/export.js"	type="text/javascript"></script>
<script src="<%=basePath %>/static/js/config/config.js"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/serial.js"	type="text/javascript"></script>
<script src="<%=basePath%>/static/js/map-tileLayer.js"	type="text/javascript"></script>
<script src="<%=basePath %>/static/js/config/config.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
<c:if test="${bgFlag == null or bgFlag == 1}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
</c:if>
<!-- 人工查询js -->
<script src="<%=basePath %>/static/Visualization/rgQuery.js"></script>
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
		//提示开始和结束时间赋值
		$("#edDateSpan").html('${maxDate[2] }');
		$("#stDateSpan").html('${minDate[2] }');
		$('.tab select').comboSelect();
		$(".add_date_btn").show();
		data_html ="<div class='addGkg clearfix' style='margin-left:140px; margin-top:10px;'>"+
			"<div class='width250 fl clearfix' id='appendData1'>"+
            "<div class='fl'><span class='beg_time fl'>开始时间</span></div>"+
                "<div class='td3_2 fl'>"+
                "<label class='lab2'><input class='inp_selc day1' id='gkgStDate' name='gkgStDate' type='text' readonly value='${curStDate[2]}'/></label>"+
            	"</div>"+
        "</div>"+
        "<div class='fl clearfix'>"+
                "<div class='fl'><span class='end_time fl'>结束时间</span></div>"+
                "<div class='td3_2 fl'>"+
                    "<label class='lab2'><input class='inp_selc day2' id='gkgEdDate' name='gkgEdDate' type='text' readonly value='${curEdDate[2]}'/></label>"+
                "</div>"+
        "</div>"+
        "<div class='del_date_btn'></div>"+
     "</div>";
		// 下拉框 每一个下拉框对应一个ID，然后调用perfectScrollbar美化滚动条
		$(".add_date_btn").on("click",function(){
	    	$("#time_be_box").append(data_html);
	    	
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
	    $(".date_box").on("click",".del_date_btn",function(){
	    	$(this).parent().remove();
	    });
		
	    
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
	
	
    //事件信息渲染图表
	function render(configId){
		var resultcode = 'ALL';
		startLoad();
		$.ajax({
			url:'<%=basePath%>/search/graph_situational_viz/'+configId,
			type: 'POST',
			dataType:"json",
			async:false,
			success:function(data){
				renderData(data);
				endLoad();
			},error:function(data){
				endLoad();
				win.alertEx("加载失败");
			}
		});
    }
    function renderData(data){
        var theme_data = data.theme_dic;
        var location_data = data.location_dic;
        var date_data = data.date_data;
        //显示表格
        $("#ThemesPrev").html("");
        $("#ThemesLast").html("");
        $("#LocationsPrev").html("");
        $("#LocationsLast").html("");
        if(theme_data!=""){
    		for(var j=0;j<theme_data.length;j++){
    			var newThemesTable = "<div class='col-md-12'>"+
    			"<div id='chart-content'>"+
    				"<div class='col-md-12'>"+
    					"<div class='panel panel-primary filterable'>"+
    						"<div class='panel-heading'>"+
    							"<h3 class='panel-title'>主题&nbsp;&nbsp;&nbsp;&nbsp;"+date_data[j]+"</h3>"+
    							"<div class='pull-right'>"+
    								"<button class='btn btn-default btn-xs btn-filter'>"+
    									"<span class='fa fa-filter'></span> Filter"+
    								"</button>"+
    							"</div>"+
    						"</div>"+
    						"<div class='col-md-6'>"+
    							"<table class='table table2' id='Theme"+j+"'>"+
    								"<thead>"+
    									"<tr class='filters'>"+
    										"<th><input type='text' class='form-control' placeholder='Name' disabled></th>"+
    										"<th><input type='text' class='form-control' placeholder='Value' disabled></th>"+
    									"</tr>"+
    								"</thead>"+
    								"<tbody>"+
    									"<tr></tr>"+
    								"</tbody>"+
    							"</table>"+
    						"</div>"+
    						"<div class='col-md-6'>"+
    							"<table class='table table2' id='Themes"+j+"'>"+
    								"<thead>"+
    									"<tr class='filters'>"+
    										"<th><input type='text' class='form-control' placeholder='Name' disabled></th>"+
    										"<th><input type='text' class='form-control' placeholder='Value' disabled></th>"+
    									"</tr>"+
    								"</thead>"+
    								"<tbody>"+
    									"<tr></tr>"+
    								"</tbody>"+
    							"</table>"+
    						"</div>"+
    					"</div>"+
    				"</div>"+
    			"</div>"+
    		"</div>";
				$("#themesRow").append(newThemesTable);
    			for(var i=0;i<15;i++){
 	                addRow("Theme"+j,theme_data[j][i].key, theme_data[j][i].value)/* 需要添加两个参数 */
 	            }
				for(var i=15;i<theme_data[j].length;i++){
 	               addRow2("Themes"+j,theme_data[j][i].key, theme_data[j][i].value)
 	            }
    		}
   }
        if(location_data!=""){
    		for(var j=0;j<location_data.length;j++){
    			var newLocationsTable = "<div class='col-md-12'>"+
    			"<div id='chart-content'>"+
    				"<div class='col-md-12'>"+
    					"<div class='panel panel-primary filterable'>"+
    						"<div class='panel-heading'>"+
    							"<h3 class='panel-title'>发生地&nbsp;&nbsp;&nbsp;&nbsp;"+date_data[j]+"</h3>"+
    							"<div class='pull-right'>"+
    								"<button class='btn btn-default btn-xs btn-filter'>"+
    									"<span class='fa fa-filter'></span> Filter"+
    								"</button>"+
    							"</div>"+
    						"</div>"+
    						"<div class='col-md-6'>"+
    							"<table class='table table2' id='Location"+j+"'>"+
    								"<thead>"+
    									"<tr class='filters'>"+
    										"<th><input type='text' class='form-control' placeholder='Name' disabled></th>"+
    										"<th><input type='text' class='form-control' placeholder='Value' disabled></th>"+
    									"</tr>"+
    								"</thead>"+
    								"<tbody>"+
    									"<tr></tr>"+
    								"</tbody>"+
    							"</table>"+
    						"</div>"+
    						"<div class='col-md-6'>"+
    							"<table class='table table2' id='Locations"+j+"'>"+
    								"<thead>"+
    									"<tr class='filters'>"+
    										"<th><input type='text' class='form-control' placeholder='Name' disabled></th>"+
    										"<th><input type='text' class='form-control' placeholder='Value' disabled></th>"+
    									"</tr>"+
    								"</thead>"+
    								"<tbody>"+
    									"<tr></tr>"+
    								"</tbody>"+
    							"</table>"+
    						"</div>"+
    					"</div>"+
    				"</div>"+
    			"</div>"+
    		"</div>";
				$("#locationsRow").append(newLocationsTable);
    			for(var i=0;i<15;i++){
 	                addRow("Location"+j,location_data[j][i].key, location_data[j][i].value)/* 需要添加两个参数 */
 	            }
				for(var i=15;i<theme_data[j].length;i++){
 	               addRow2("Locations"+j,location_data[j][i].key, location_data[j][i].value)
 	            }
    		}
   }
       

        $('.filterable .btn-filter').click(function(){
            var $panel = $(this).parents('.filterable'),
            $filters = $panel.find('.filters input'),
            $tbody = $panel.find('.table tbody');
            if ($filters.prop('disabled') == true) {
                $filters.prop('disabled', false);
                $filters.first().focus();
            } else {
                $filters.val('').prop('disabled', false);//bug
                $tbody.find('.no-result').remove();
                $tbody.find('tr').show();
            }
        });

        $('.filterable .filters input').keyup(function(e){
            var code = e.keyCode || e.which;
            if (code == '9') return;
            var $input = $(this),
            inputContent = $input.val().toLowerCase(),
            $panel = $input.parents('.filterable'),
            column = $panel.find('.filters th').index($input.parents('th')),
            $table = $panel.find('.table'),
            $rows = $table.find('tbody tr');
            var $filteredRows = $rows.filter(function(){
                var value = $(this).find('td').eq(column).text().toLowerCase();
                return value.indexOf(inputContent) === -1;
            });
            $table.find('tbody .no-result').remove();
            $rows.show();
            $filteredRows.hide();
            if ($filteredRows.length === $rows.length) {
                $table.find('tbody').prepend($('<tr class="no-result text-center"><td colspan="'+ $table.find('.filters th').length +'">No result found</td></tr>'));
            }
        });
        function addRow(id,text1,text2){
            var table = document.getElementById(id);
            var newRow = table.insertRow(); //创建新行
            var newCell1 = newRow.insertCell(); //创建新单元格
            newCell1.innerHTML = text1; //单元格内的内容
            var newCell2 = newRow.insertCell(); //创建新单元格
            newCell2.innerHTML = text2; //单元格内的内容
            
         }
		function addRow2(id,text1,text2){
            var table = document.getElementById(id);
            var newRow = table.insertRow(); //创建新行
            var newCell1 = newRow.insertCell(); //创建新单元格
            newCell1.innerHTML = text1; //单元格内的内容
            var newCell2 = newRow.insertCell(); //创建新单元格
            newCell2.innerHTML = text2; //单元格内的内容
         }  
    }
	</script>
</html>