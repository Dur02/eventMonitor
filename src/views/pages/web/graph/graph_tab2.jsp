<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<link rel="stylesheet" href="<%=basePath %>/static/css/eventConfig.css"/>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/jquery-1.11.1.min.js"></script>
<style type="text/css">
	.hoverImg{
	    margin-top: 3px;
   	 	margin-left: 14px;
	}
	/* 美化滚动条 */
	.tab_div{
		overflow: auto;
	}
   .tab_div::-webkit-scrollbar {
       width: 10px;
       height: 10px;
       background-color: #1b2334;
   }
	.tab_div::-webkit-scrollbar-thumb {
       background-color: #1d2334!important;
       border-radius: 10px!important;
	}

   .tab_div::-webkit-scrollbar-thumb:hover {
    	background-color: #777!important;
   }
   .tab_div::-webkit-scrollbar-track {
	    background: #1b2334;
	    box-shadow: inset 0 0 6px #333!important;
	    border-radius: 10px!important;
	}
</style>
<!--图谱下方的配置展示  （日期、关键字）模块  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="tab">
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
			
			<div class="tab_div">
				<!-- 预设点A -->
				<c:forEach items="${typeList }" var="t" varStatus="indx">
					<c:if test="${indx.index eq 0 }">
						<div class="tab_down show">
					</c:if>
					<c:if test="${indx.index ne 0 }">
						<div class="tab_down">
					</c:if>
					<div class="high_search_con" style="margin-top: 30px;">
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
								<div>
								<!-- 根据是否高级查询回显页面 -->
				       		 	<c:if test="${t.customQuery !='' && t.customQuery != null }" >
									<div class="high_search" style="margin-top: -40px;background:#0087fd" >高级查询</div>
								</c:if>
								<c:if test="${t.customQuery == null ||t.customQuery == '' }" >
									<div class="high_search" style="margin-top: -40px;"  >高级查询</div>
								</c:if>
					       		 </div>
							</li>
							<!-- 数据源 -->
							<!-- 根据是否为二次回溯显示或隐藏数据源 -->
			       		 	<c:if test="${t.relationId == undefined || t.relationId == null }" >
			       		 		<li class="clearfix">
									<div class="td1 fl"><p class="weight_png fl"></p><b>数据源：</b></div>
									<div class="td5_event fl"><input class="dataSourceType1" type="radio" onclick="return false" <c:if test="${t.dataSourceType eq 1}"> checked="checked"</c:if> value="1"><label for="radio1"> 数据源一</label></div>
									<div class="td5_event fl"><input class="dataSourceType2" type="radio" onclick="return false" <c:if test="${t.dataSourceType eq 2}"> checked="checked"</c:if> value="2"><label for="radio2"> 数据源二</label></div>
									<div class="td5_event fl"><input class="dataSourceType3" type="radio" onclick="return false" <c:if test="${t.dataSourceType eq 3}"> checked="checked"</c:if> value="3"><label for="radio3"> 数据源三</label></div>
								</li>
			       		 	</c:if>
							<!-- 权重依据 -->
							<li class="clearfix quanzhong">
								<div class="td1 fl">
									<p class="event_property_png  fl"></p>
									<b>权重依据：</b>
								</div>
								<div class="td5 fl">
									<input type="radio" onclick="return false" name="weightFlag${t.configId }"
										<c:if test="${t.weightFlag eq 1}"> checked="checked"</c:if>
										value="1"><label for="radio1"> 包含所选实体集的新闻报道数 (1)</label>
								</div>
								<div class="td5 fl">
									<input type="radio" onclick="return false" name="weightFlag${t.configId }"
										<c:if test="${t.weightFlag eq 2}"> checked="checked"</c:if>
										value="2"><label for="radio2"> 包含所选实体集的新闻报道数(NUMARTS)</label>
								</div>
							</li>
							<!-- 统计依据 -->
							<li class="clearfix bizhong" style="display:none;">
								<div class="td1 fl"><p class="tjyj_png fl"></p><b>统计依据：</b></div>
								<div class="td5_event fl"><input  type="radio" onclick="return false" name="valueWeight${t.configId }" <c:if test="${t.staticbasic eq 1}"> checked="checked"</c:if> value="1"><label for="radio1"> 比重</label></div>
								<div class="td5_event fl"><input  type="radio" onclick="return false" name="valueWeight${t.configId }" <c:if test="${t.staticbasic eq 2}"> checked="checked"</c:if> value="2"><label for="radio2"> 数量</label></div>
							</li>
							<!-- 根据是否高级查询回显页面 -->
							<c:if test="${t.customQuery !='' && t.customQuery != null }" >
								<div class="ulli" style="display: none!important;">
							</c:if>
							<c:if test="${t.customQuery == null ||t.customQuery == '' }" >
								<div class="ulli" >
							</c:if>
							<li class="clearfix">
								<div class="td1 fl"><p class="threshold_png fl"></p><b class="sjsx">COUNTS搜索：</b></div>
								<!-- <div class="gkg_tishi_tb">逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如  (A && B && !D)||C </div> -->
								<input class="condition_info_ids fl" type="text" readonly value='${t.gkgAllCondition.countsKeyWord}' />
								<div style="padding: 2px;margin-left: 10px;float: left;"><input type="checkbox" onclick="return false;" style="vertical-align: middle;margin: 0 0 0 0;" value="0" <c:if test="${t.gkgAllCondition.countsIsBig eq 0}"> checked</c:if>>区分大小写</div>
								<img class="hoverImg" src="<%=basePath %>/static/images/detail.png">
								<span style="margin-left: 9px;display: none;">逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如  (A && B && !D)||C </span>
							</li> 
							<li class="clearfix">
								<div class="td1 fl"><p class="threshold_them_png fl"></p><b class="sjsx">主题搜索：</b></div>
								<input class="condition_info_ids fl" type="text" readonly value='${t.gkgAllCondition.themesKeyWord}' />
								<div style="padding: 2px;margin-left: 10px;float: left;"><input type="checkbox" onclick="return false;" style="vertical-align: middle;margin: 0 0 0 0;" value="0" <c:if test="${t.gkgAllCondition.themesIsBig eq 0}"> checked</c:if>>区分大小写</div>
								<img class="hoverImg" src="<%=basePath %>/static/images/detail.png">
								<span style="margin-left: 9px;display: none;">逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如  (A && B && !D)||C </span>
							</li> 
						   <li class="clearfix">
						   		<div class="td1 fl"><p class="threshold_geo_png fl"></p><b class="sjsx">地理搜索：</b></div>
								<input class="condition_info_ids fl" type="text" readonly value='${t.gkgAllCondition.locationsKeyWord}' />
								<div style="padding: 2px;margin-left: 10px;float: left;"><input type="checkbox" onclick="return false;" style="vertical-align: middle;margin: 0 0 0 0;" value="0" <c:if test="${t.gkgAllCondition.locationsIsBig eq 0}"> checked</c:if>>区分大小写</div>
								<img class="hoverImg" src="<%=basePath %>/static/images/detail.png">
								<span style="margin-left: 9px;display: none;">逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如  (A && B && !D)||C </span>
							</li> 
						   <li class="clearfix">
						   		<div class="td1 fl"><p class="threshold_person_png fl"></p><b class="sjsx">人物搜索：</b></div>
								<input class="condition_info_ids fl" type="text" readonly value='${t.gkgAllCondition.personsKeyWord}' />
								<div style="padding: 2px;margin-left: 10px;float: left;"><input type="checkbox" onclick="return false;" style="vertical-align: middle;margin: 0 0 0 0;" value="0" <c:if test="${t.gkgAllCondition.personsIsBig eq 0}"> checked</c:if>>区分大小写</div>
								<img class="hoverImg" src="<%=basePath %>/static/images/detail.png">
								<span style="margin-left: 9px;display: none;">逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如  (A && B && !D)||C </span>
							</li> 
						   <li class="clearfix">
						   		<div class="td1 fl"><p class="threshold_org_png fl"></p><b class="sjsx">组织搜索：</b></div>
								<input class="condition_info_ids fl" type="text" readonly value='${t.gkgAllCondition.organizationsKeyWord}' />
								<div style="padding: 2px;margin-left: 10px;float: left;"><input type="checkbox" onclick="return false;" style="vertical-align: middle;margin: 0 0 0 0;" value="0" <c:if test="${t.gkgAllCondition.organizationsIsBig eq 0}"> checked</c:if>>区分大小写</div>
								<img class="hoverImg" src="<%=basePath %>/static/images/detail.png">
								<span style="margin-left: 9px;display: none;">逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如  (A && B && !D)||C </span>
							</li> 
						   <li class="clearfix">
						   		<div class="td1 fl"><p class="threshold_web_png fl"></p><b class="sjsx">网站新闻搜索：</b></div>
								<input class="condition_info_ids fl webCountryText" style="width:150px;" type="text" readonly value='${t.gkgAllCondition.webCountry}' />
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
											<span class="fl ljX">—</span>
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
											<span class="fl ljX">—</span>
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
											<span class="fl ljX">—</span>
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
											<span class="fl ljX">—</span>
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
											<span class="fl ljX">—</span>
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
											<span class="fl ljX">—</span>
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
							<!-- 权重范围 -->
							<li class="clearfix baodaoshu" style="display:none;  margin-top: 5px">
								<div class="td1 fl"><p class="event_property_png  fl"></p><b>权重值：</b></div>
								<div  class="fl" style="width: 30%;    margin-top: 6px;">
									<b class="sjsx">报道数：</b>
									<input class="condition_info_ids" style="width:42px;" type="text" value="${t.stNUMARTS }"/><span>—</span><input class="condition_info_ids" style="width:42px;" type="text" value="${t.edNUMARTS }"/>
								</div>
							</li>
							<!-- 自定义查询 -->
							<%-- <li class="clearfix">
								<div class="td1 fl"><p class="weight_png fl"></p><b>高级查询：</b></div>
								<div class="clearfix fl homeNotShow">
									<div class="fl" style="float: left;">
										<input class="condition_info_graph_ids2 fl" style="width: 500px;margin-top: 5px;" type="text" id="customQuery" name="customQuery" value="${t.customQuery }"/>
									</div>
								</div>
							</li> --%>
							
							</div>
						</ul>
						<!-- 根据是否高级查询回显页面 -->
						<c:if test="${t.customQuery !='' && t.customQuery != null }" >
							<div class="test_triangle_border property_case" style="display: block!important;">
						</c:if>
						<c:if test="${t.customQuery == null ||t.customQuery == '' }" >
							<div class="test_triangle_border property_case" style="display: none!important;">
						</c:if>
				        <div class="popup1 case_con">
				            <span class="tri"><em></em></span>
				            <div class="case_top">
								<img src="<%=basePath%>/static/images/propertyCase.png"><span>属性案例</span>
							</div>
							<table>
								<tr>
									<td><font class="sbFont">NUMARTS :</font> 10</td>
								</tr>
								<tr>
									<td><font class="sbFont">PERSONS :</font> michael jones;greg suhr</td>
								</tr>
								<tr>
									<td><font class="sbFont">ORGANIZATIONS :</font> bmw;san francisco police</td>
								</tr>
								<tr>
									<td><font class="sbFont">TONE :</font> -9.00473933649289,1.4218009478673,10.4265402843602,11.8483412322275,23.696682464455,0</td>
								</tr>
								<tr>
									<td><font class="sbFont">COUNTS :</font> ARREST#2#Police#3#San Francisco, California, United States#US#USCA#37.7749#-122.419#277593;CRISISLEX_CRISISLEXREC#2#Police#3#San Francisco, California, United States#US#USCA#37.7749#-122.419#277593;</td>
								</tr>
								<tr>
									<td><font class="sbFont">THEMES :</font> TRIAL;CRIME_COMMON_ROBBERY;WB_678_DIGITAL_GOVERNMENT;WB_694_BROADCAST_AND_MEDIA;WB_133_INFORMATION_AND_COMMUNICATION_TECHNOLOGIES;ARREST;SOC_GENERALCRIME;CRISISLEX_C07_SAFETY;SECURITY_SERVICES;TAX_FNCACT;TAX_FNCACT_POLICE;MEDIA_MSM;TAX_FNCACT_CAMERAMAN;GENERAL_HEALTH;MEDICAL;CRISISLEX_C03_WELLBEING_HEALTH;ORGANIZED_CRIME;WB_2433_CONFLICT_AND_VIOLENCE;WB_2452_GANGS;WB_2432_FRAGILITY_CONFLICT_AND_VIOLENCE;WB_2445_NON_STATE_SECURITY_ACTORS;TAX_ETHNICITY;TAX_ETHNICITY_BLACK;MANMADE_DISASTER_IMPLIED;TAX_FNCACT_CHIEF;TAX_FNCACT_POLICE_CHIEF;TAX_WEAPONS;TAX_WEAPONS_FIREARMS;CRISISLEX_CRISISLEXREC;</td>
								</tr>
								<tr>
									<td><font class="sbFont">LOCATIONS :</font> 3#Fremont, California, United States#US#USCA#35.1916#-117.577#252893;3#San Francisco Bay, California, United States#US#USCA#37.7083#-122.28#1654951;3#Oakland, California, United States#US#USCA#37.8044#-122.271#277566;3#San Francisco, California, United States#US#USCA#37.7749#-122.419#277593</td>
								</tr>
								<tr>
									<td><font class="sbFont">CAMEOEVENTIDS :</font> 457361300,457318809,457391080,457391081,457361300,457318809,457391080,457391081,457361300,457318809,457391080,457391081,457361300,457318809,457391080,457391081,457361300,457318809,457391080,457391081,457361300,457318809,457391080,457391081,457361300,457318809,457391080,457391081,457361300,457318809,457391080,457391081</td>
								</tr>
								<tr>
									<td><font class="sbFont">SOURCEURLS :</font> http://wnct.com/ap/suspect-arrested-in-robbery-of-news-crews-broadcasting-live/<UDIV>http://wbay.com/ap/suspect-arrested-in-robbery-of-news-crews-broadcasting-live/<UDIV>http://counton2.com/ap/suspect-arrested-in-robbery-of-news-crews-broadcasting-live/<UDIV>http://koin.com/ap/suspect-arrested-in-robbery-of-news-crews-broadcasting-live/<UDIV>http://klfy.com/ap/suspect-arrested-in-robbery-of-news-crews-broadcasting-live/<UDIV>http://wlfi.com/ap/suspect-arrested-in-robbery-of-news-crews-broadcasting-live/<UDIV>http://wjbf.com/ap/suspect-arrested-in-robbery-of-news-crews-broadcasting-live/<UDIV>http://wbtw.com/ap/suspect-arrested-in-robbery-of-news-crews-broadcasting-live/</td>
								</tr>
							</table>
							<div class="gjcx_al_box">
								<table class="gjcx_al_tb">
									<tr>
										<td><font class="sbFont">关键字提示 :</font> 并 and,或 or,等于 =,不等于 !=,大于等于 >=,小于等于 <=,模糊匹配 like,模糊不匹配  not like,范围查询 in,不在范围查询 not in</td>
									</tr> 
									<tr>
										<td><font class="sbFont">案例SQL :</font> NUMARTS != 2 and PERSONS like '%keqiang%' and (ORGANIZATIONS not like '%police%' or COUNTS like '%ARREST%')</td>
									</tr>
								</table>
							</div>
							<textarea class="texthtml" name="customQuery" readonly>${t.customQuery}</textarea>
				        </div>
				    </div>
				    </div>
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
			<div class="high_search_con" style="margin-top: 30px;">
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
									<label class="lab2" for=""><input class="inp_selc day1" id="gkgStDate" name="gkgStDate" type="text" readonly/></label>
								</div>
							</div>
							<div class="fl clearfix">
								<div class="fl"><span class="end_time fl">结束时间</span></div>
								<div class="td3_2 fl">
									<label class="lab2" for=""><input class="inp_selc day2" id="gkgEdDate" name="gkgEdDate" type="text" readonly/></label>
								</div>
							</div>
							<div class="high_search high_search_js">高级查询</div>
						</div>
					</li>
					<!-- 数据源 -->
					<li class="clearfix"><!-- style="height:31px;" -->
						<div class="td1 fl"><p class="weight_png fl"></p><b>数据源：</b></div>
						<div class="td5_event fl"><input class="dataSourceType" id="radios1" type="radio" name="dataSourceType" checked="checked" value="1"><label for="radios1"> 数据源一</label></div>
						<div class="td5_event fl"><input class="dataSourceType" id="radios2" type="radio" name="dataSourceType" value="2"><label for="radios2"> 数据源二</label></div>
						<div class="td5_event fl"><input class="dataSourceType" id="radios3" type="radio" name="dataSourceType" value="3"><label for="radios3"> 数据源三</label></div>
					</li>
					<!-- 权重依据 -->
					<li class="clearfix quanzhong">
						<div class="td1 fl">
							<p class="event_property_png fl"></p>
							<b>权重依据：</b>
						</div>
						<div class="td5 fl">
							<input type="radio" id="radio1" name="gkgWeightFlag" value="1" checked><label for="radio1"> 包含所选实体集的新闻报道数 (1) </label>
						</div>
						<div class="td5 fl">
							<input type="radio" id="radio2" name="gkgWeightFlag" value="2"><label for="radio2">  包含所选实体集的新闻报道数(NUMARTS)</label>
						</div>
					</li>
					<li class="clearfix bizhong" style="display: none;">
							<div class="td1 fl"><p class="tjyj_png fl"></p><b>统计依据：</b></div>
							<div class="td5_event fl"><input id="tjradio1" type="radio" name="valueWeight" checked="checked" value="1"><label for="tjradio1"> 比重</label></div>
							<div class="td5_event fl"><input id="tjradio2" type="radio" name="valueWeight" value="2"><label for="tjradio2"> 数量</label></div>
					</li>
					
					<div class="ulli ulli_js" >
						<li class="clearfix">
							<!-- 关键字搜索 -->
							<div class="td1 fl"><p class="threshold_png fl"></p><b class="sjsx">COUNTS搜索：</b></div>
							<!-- <div class="gkg_tishi_tb10">逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如  (A && B && !D)||C </div> -->
							<div class="radio_box">
								<input class="condition_info_ids fl" type="text" id="countsKeyWord" name="countsKeyWord" onchange="validateKeyWordsRG(this)"/>
								<span class="gkgKeyWordSpan" style="position:relative;left:20px;width:40px;color: red"></span>
								<div style="padding: 3px;margin-left: 10px;float: left;"><input type="checkbox" style="vertical-align: middle;margin: 0 0 0 0;" value="0" checked name="countsIsBig">区分大小写</div>
								<img class="hoverImg" src="<%=basePath %>/static/images/detail.png">
								<span style="margin-left: 9px;display: none;">逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如  (A && B && !D)||C </span>
							</div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="threshold_them_png fl"></p><b class="sjsx">主题搜索：</b></div>
							<div class="radio_box">
								<input class="condition_info_ids fl" type="text" id="themesKeyWord" name="themesKeyWord" onchange="validateKeyWordsRG(this)"/>
								<span class="gkgKeyWordSpan" style="position:relative;left:20px;width:40px;color: red"></span>
								<div style="padding: 3px;margin-left: 10px;float: left;"><input type="checkbox" style="vertical-align: middle;margin: 0 0 0 0;" value="0" checked name="themesIsBig">区分大小写</div>
								<img class="hoverImg" src="<%=basePath %>/static/images/detail.png">
								<span style="margin-left: 9px;display: none;">逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如  (A && B && !D)||C </span>
							</div>
						</li> 
						<li class="clearfix">
							<div class="td1 fl"><p class="threshold_geo_png fl"></p><b class="sjsx">地理搜索：</b></div>
							<div class="radio_box">
								<input class="condition_info_ids fl" type="text" id="locationsKeyWord" name="locationsKeyWord" onchange="validateKeyWordsRG(this)"/>
								<span class="gkgKeyWordSpan" style="position:relative;left:20px;width:40px;color: red"></span>
								<div style="padding: 3px;margin-left: 10px;float: left;"><input type="checkbox" style="vertical-align: middle;margin: 0 0 0 0;" value="0" checked name="locationsIsBig">区分大小写</div>
								<img class="hoverImg" src="<%=basePath %>/static/images/detail.png">
								<span style="margin-left: 9px;display: none;">逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如  (A && B && !D)||C </span>
							</div>
						</li> 
						<li class="clearfix">
							<div class="td1 fl"><p class="threshold_person_png fl"></p><b class="sjsx">人物搜索：</b></div>
							<div class="radio_box">
								<input class="condition_info_ids fl" type="text" id="personsKeyWord" name="personsKeyWord" onchange="validateKeyWordsRG(this)"/>
								<span class="gkgKeyWordSpan" style="position:relative;left:20px;width:40px;color: red"></span>
								<div style="padding: 3px;margin-left: 10px;float: left;"><input type="checkbox" style="vertical-align: middle;margin: 0 0 0 0;" value="0" checked name="personsIsBig">区分大小写</div>
								<img class="hoverImg" src="<%=basePath %>/static/images/detail.png">
								<span style="margin-left: 9px;display: none;">逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如  (A && B && !D)||C </span>
							</div>
						</li> 
						<li class="clearfix">
							<div class="td1 fl"><p class="threshold_org_png fl"></p><b class="sjsx">组织搜索：</b></div>
							<div class="radio_box">
								<input class="condition_info_ids fl" type="text" id="organizationsKeyWord" name="organizationsKeyWord" onchange="validateKeyWordsRG(this)"/>
								<span class="gkgKeyWordSpan" style="position:relative;left:20px;width:40px;color: red"></span>
								<div style="padding: 3px;margin-left: 10px;float: left;"><input type="checkbox" style="vertical-align: middle;margin: 0 0 0 0;" value="0" checked name="organizationsIsBig">区分大小写</div>
								<img class="hoverImg" src="<%=basePath %>/static/images/detail.png">
								<span style="margin-left: 9px;display: none;">逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如  (A && B && !D)||C </span>
							</div>
						</li> 
						<li class="clearfix">
							<div class="td1 fl"><p class="threshold_web_png fl"></p><b class="sjsx">网站新闻搜索：</b></div>
							<div><!-- 这个空div不能删除，必须保留 -->
								<div id="webCountry" class="checkBoxSelect" style="width: 150px;"></div>
								<input type="hidden" id="webCountry1" name="webCountry"/>
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
							<div class="gkg_tishi_tb10" >支持多个事件ID的精确查询,输入形式包括1.多个ID之间用","(英文)分割,如:256,257;2.两个ID之间用"-"分割,表示事件ID的范围</div>
							<div class="radio_box">
								<input class="condition_info_ids fl" type="text" id="ids" name="ids" onblur="validateIDs()"/>
								<span id="IDspan" style=" position:relative;left:20px;width: 40px" name="IDspan" ></span>
							</div>
						</li>
						<!-- 权重范围 -->
						<li class="clearfix baodaoshu" style="display:none;  margin-top: 5px">
							<div class="td1 fl"><p class="event_property_png  fl"></p><b>权重值：</b></div>
							<div  class="fl" style="width: 30%;    margin-top: 6px;">
								<b class="sjsx">报道数：</b>
								<input class="condition_info_ids" style="width:42px;" type="text" id="stNUMARTS" name="stNUMARTS"/><span>—</span><input class="condition_info_ids" style="width:42px;" type="text" id="edNUMARTS" name="edNUMARTS"/>
							</div>
						</li>
						<!-- 自定义查询 -->
						<!-- <li class="clearfix">
							<div class="td1 fl"><p class="weight_png fl"></p><b>高级查询：</b></div>
							<div class="clearfix fl homeNotShow">
								<div class="fl" style="float: left;">
									<input class="condition_info_graph_ids2 fl" style="width: 500px;margin-top: 5px;" type="text" id="customQuery" name="customQuery"/>
								</div>
							</div>
						</li> -->
						
					<li class="clearfix">
					    <div class="fr">
							<div style=" float:left; margin-right:10px; margin-top:4px;">保存配置：<input class="artificial_radio oldRadio" name="isSaveConfig" value="0" type="radio" onclick="$('#rgConfigName').show()">是<input class="artificial_radio oldRadio" type="radio" name="isSaveConfig" value="1" checked onclick="$('#rgConfigName').hide()">否</div>
							<div style=" float:left; margin-right:10px;display: none; margin-top:4px;" id="rgConfigName">配置名称：<input type="text" class="default_input" style="padding: 1px 8px;" name="configName" id="configName"></div>
							<div style=" float:left;"><input class="submit2" type="button" onclick="gkgRGQuery(1)" value="提交"></div>
						</div>
					</li>
					</div>
					</ul>
					<div class="test_triangle_border property_case property_case_js">
					        <div class="popup1 case_con">
					            <span class="tri"><em></em></span>
					            <div class="case_top">
									<img src="<%=basePath%>/static/images/propertyCase.png"><span>属性案例</span>
								</div>
								<table>
									<tr>
										<td><font class="sbFont">NUMARTS :</font> 10</td>
									</tr>
									<tr>
										<td><font class="sbFont">PERSONS :</font> michael jones;greg suhr</td>
									</tr>
									<tr>
										<td><font class="sbFont">ORGANIZATIONS :</font> bmw;san francisco police</td>
									</tr>
									<tr>
										<td><font class="sbFont">TONE :</font> -9.00473933649289,1.4218009478673,10.4265402843602,11.8483412322275,23.696682464455,0</td>
									</tr>
									<tr>
										<td><font class="sbFont">COUNTS :</font> ARREST#2#Police#3#San Francisco, California, United States#US#USCA#37.7749#-122.419#277593;CRISISLEX_CRISISLEXREC#2#Police#3#San Francisco, California, United States#US#USCA#37.7749#-122.419#277593;</td>
									</tr>
									<tr>
										<td><font class="sbFont">THEMES :</font> TRIAL;CRIME_COMMON_ROBBERY;WB_678_DIGITAL_GOVERNMENT;WB_694_BROADCAST_AND_MEDIA;WB_133_INFORMATION_AND_COMMUNICATION_TECHNOLOGIES;ARREST;SOC_GENERALCRIME;CRISISLEX_C07_SAFETY;SECURITY_SERVICES;TAX_FNCACT;TAX_FNCACT_POLICE;MEDIA_MSM;TAX_FNCACT_CAMERAMAN;GENERAL_HEALTH;MEDICAL;CRISISLEX_C03_WELLBEING_HEALTH;ORGANIZED_CRIME;WB_2433_CONFLICT_AND_VIOLENCE;WB_2452_GANGS;WB_2432_FRAGILITY_CONFLICT_AND_VIOLENCE;WB_2445_NON_STATE_SECURITY_ACTORS;TAX_ETHNICITY;TAX_ETHNICITY_BLACK;MANMADE_DISASTER_IMPLIED;TAX_FNCACT_CHIEF;TAX_FNCACT_POLICE_CHIEF;TAX_WEAPONS;TAX_WEAPONS_FIREARMS;CRISISLEX_CRISISLEXREC;</td>
									</tr>
									<tr>
										<td><font class="sbFont">LOCATIONS :</font> 3#Fremont, California, United States#US#USCA#35.1916#-117.577#252893;3#San Francisco Bay, California, United States#US#USCA#37.7083#-122.28#1654951;3#Oakland, California, United States#US#USCA#37.8044#-122.271#277566;3#San Francisco, California, United States#US#USCA#37.7749#-122.419#277593</td>
									</tr>
									<tr>
										<td><font class="sbFont">CAMEOEVENTIDS :</font> 457361300,457318809,457391080,457391081,457361300,457318809,457391080,457391081,457361300,457318809,457391080,457391081,457361300,457318809,457391080,457391081,457361300,457318809,457391080,457391081,457361300,457318809,457391080,457391081,457361300,457318809,457391080,457391081,457361300,457318809,457391080,457391081</td>
									</tr>
									<tr>
										<td><font class="sbFont">SOURCEURLS :</font> http://wnct.com/ap/suspect-arrested-in-robbery-of-news-crews-broadcasting-live/<UDIV>http://wbay.com/ap/suspect-arrested-in-robbery-of-news-crews-broadcasting-live/<UDIV>http://counton2.com/ap/suspect-arrested-in-robbery-of-news-crews-broadcasting-live/<UDIV>http://koin.com/ap/suspect-arrested-in-robbery-of-news-crews-broadcasting-live/<UDIV>http://klfy.com/ap/suspect-arrested-in-robbery-of-news-crews-broadcasting-live/<UDIV>http://wlfi.com/ap/suspect-arrested-in-robbery-of-news-crews-broadcasting-live/<UDIV>http://wjbf.com/ap/suspect-arrested-in-robbery-of-news-crews-broadcasting-live/<UDIV>http://wbtw.com/ap/suspect-arrested-in-robbery-of-news-crews-broadcasting-live/</td>
									</tr>
								</table>
								<div class="gjcx_al_box">
									<table class="gjcx_al_tb">
										<tr>
											<td><font class="sbFont">关键字提示 :</font> 并 and,或 or,等于 =,不等于 !=,大于等于 >=,小于等于 <=,模糊匹配 like,模糊不匹配  not like,范围查询 in,不在范围查询 not in</td>
										</tr> 
										<tr>
											<td><font class="sbFont">案例SQL :</font> NUMARTS != 2 and PERSONS like '%keqiang%' and (ORGANIZATIONS not like '%police%' or COUNTS like '%ARREST%')</td>
										</tr>
									</table>
								</div>
								<textarea class="texthtml" id="customQuery" name="customQuery"></textarea>
								<div class="fr" style="margin-top: 6px;color:rgb(189, 202, 230);">
									<div style=" float:left; margin-right:10px; margin-top:4px;">保存配置：<input class="artificial_radio newRadio" name="isSaveConfig2" value="0" type="radio" onclick="$('#rgConfigName2').show()">是<input class="artificial_radio newRadio" type="radio" name="isSaveConfig2" value="1" checked onclick="$('#rgConfigName2').hide()">否</div>
									<div style=" float:left; margin-right:10px;display: none; margin-top:4px;" id="rgConfigName2">配置名称：<input type="text" class="default_input" style="padding: 1px 8px;" name="configName2" id="configName2"></div>
									<div style=" float:left;"><input class="submit2" type="button" onclick="gkgRGQuery(2)" value="提交"></div>
								</div>
								<!-- <div class="sub" onclick="gkgSub(2);">提交</div><div class="clearfloat"></div>  -->
					        </div>
					    </div>
					    </div>
					</form>
				</div>
			</div>
	</div>
	</div>
</body>
<script type="text/javascript" src="<%=basePath%>/static/js/config/config.js"></script>
<script type="text/javascript">
	//即时查询-高级查询切换功能
	$('.high_search_js').on('click',function(){
		$('.ulli_js').toggle();
		$('.property_case_js').toggle();
		if($('.property_case_js').css('display') == "block"){
			$(this).css('background','#0087fd')
		}else{
			$(this).css('background','none')
		}
	})
//鼠标移入时显示信息
$(".hoverImg").hover(function () {
    $(this).next().show();
}, function () {
	$(this).next().hide();
})
$(function(){
	//虚拟字段下拉复选框获取值
	$('#webCountry').hsCheckData({
		isShowCheckBox: true,
		data: ${webCountryCode}
	});
	
	//对于网络国家虚拟字段的特殊处理
	var jj = $(".webCountryText").val();
	if(jj!=undefined){
		var kk = jj.substring(0,jj.indexOf("&"));
		$(".webCountryText").val(kk);
		$(".webCountryText").attr("title",kk);
	}
	
	
	//配置页面取默认的最大日期和最小日期
	configDate = ${configDate};
	configMaxDate = configDate.maxDate1;
	configMaxDate = configMaxDate.substring(0,4)+"-"+configMaxDate.substring(4,6)+"-"+configMaxDate.substring(6,8);
	configMinDate = configDate.minDate1;
	configMinDate = configMinDate.substring(0,4)+"-"+configMinDate.substring(4,6)+"-"+configMinDate.substring(6,8);
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
		startDate: configMinDate,
		endDate : configMaxDate
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
		startDate: configMinDate,
		endDate : configMaxDate
	}).on('changeDate',function(e){  
			if($(this).val() < $('.day1').val()){
				$('.day1').val($(this).val());
			}
		    var endTime = e.date;  
		    $('.day1').datepicker('setEndDate',endTime);  
		});
	selectYearMonthDay();
});
function selectYearMonthDay(){
	//提示开始和结束时间赋值
	$("#edDateSpan").html(configMaxDate);
	$("#stDateSpan").html(configMinDate);
	
	//重置时间插件的时间范围 注意：必须放置setDate之前
	$('.day1').datepicker('setStartDate',configMinDate); 
	$('.day2').datepicker('setEndDate',configMaxDate);
	//将时间范围的最大值、最小值放在开始时间和结束时间
	$('.day1').datepicker('setDate',configMinDate); 
	$('.day2').datepicker('setDate',configMaxDate);	
	$("#gkgStDate").val(configMinDate);
	$("#gkgEdDate").val(configMaxDate);
}
</script>
</html>