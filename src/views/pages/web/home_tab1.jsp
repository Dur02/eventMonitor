<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	String basePath = request.getContextPath();
%>
</head>
<!-- 提供事件模块的大部分使用，包含有全部的查询条件 (日期、角色属性、事件属性、权重) -->
<script src="<%=basePath%>/static/js/jquery-1.9.1.min.js"></script>
<body>
<div class="tab">
		<span class="ul_xl"></span>
		<ul id="tab_ul" class="tab_ul clearfix">
		<c:forEach items="${typeList }" var = "t" varStatus="indx">
			<c:if test="${indx.index eq 0 }">
				<li id="${t.configId}" class="active mgl-30" onclick="render(${t.configId});">${t.configName }  <span></span></li>
			</c:if>
			<c:if test="${indx.index ne 0 }">
				<li class="" onclick="render(${t.configId});">${t.configName }<span></span></li>
			</c:if>
		</c:forEach>
		<c:if test="${sessionScope.LOGINUSER.roleId  != 3 }">
			<li class="manual">人工输入查询</li>
		</c:if>
		</ul>
		<div class="tab_div">
		<!-- 遍历配置集合 -->
		<c:forEach items="${typeList }" var = "t" varStatus="indx">
			<c:if test="${indx.index eq 0 }" >
				<div class="tab_down show" >
			</c:if>
			<c:if test="${indx.index ne 0 }">
				<div class="tab_down" >
			</c:if>
				<ul class="tab_down_info">
					<li class="clearfix">
					   <div class="td1 fl"><p class="time_png fl"></p><b>日期属性：</b></div>
				      	 <c:forEach  items="${t.dateInfo }" var = "tt">
				       		 <div class='add_date clearfix'>
		                         <div class='clearfix' style="margin-left:140px;">
		                             <div class='td2 fl b_e_date'>起止日期</div>
		                             <div class='td3_2 fl'>
		                                 <label class='lab2' for=''><input class='inp_selc' name='stDates' type='text' readonly value='${tt.stDate}'/></label>
		                             </div>
		                             <div class='fl width18'></div>
		                             <div class='td3_2 fl'>
		                                 <label class='lab2' for=''><input class='inp_selc' name='edDates' type='text' readonly value='${tt.edDate}'/></label>
		                             </div>
		                        </div>
		                     </div>
			       		 </c:forEach>
					</li>
					<li class="clearfix zindex99">
							<div class="td1 fl"><p class="people_png fl"></p><b>角色属性：</b></div>
							<div class="width544 fl clearfix">
								<div  class="td2_2 fl"><span class="span1">角色1</span></div>
								<div class="clearfix event_condtion4_two">
									<!-- "国家"角色属性值 -->
									<div class="fl guojiatb">国家编码</div>
									<div class="fl width138 clearfix">
										<div class="td3 fl">
												<span class="span_huixian">
													<c:forEach items="${countryCodeList}" var="countryCode">
														 <c:forEach items="${t.actorInfo }"  var="m">
															${countryCode.code==m.attrValue?m.roleFlag==1?m.attrId==1?countryCode.chName:'':'':''}
														</c:forEach>  
													</c:forEach>
												</span>
										</div>
									</div>
									
									
									<!-- "组织名"角色属性 -->
									<div class="fl bianmatb">组织</div>
									<div class="fl width138 clearfix">
										<div class="td3 fl">
												<span class="span_huixian">
													<c:forEach items="${knownGroupCodeList}" var="knownGroupCode">
														 <c:forEach items="${t.actorInfo }"  var="m">
															${knownGroupCode.code==m.attrValue?m.roleFlag==1?m.attrId==2?knownGroupCode.chName:'':'':''}
														</c:forEach>  
													</c:forEach>
												</span>
										</div>
									</div>
									
									<!-- "宗教1"角色属性 -->
									<div class="fl bianmatb">宗教1</div>
									<div class="fl width138 clearfix">
										<div class="td3 fl">
												<span class="span_huixian">
													<c:forEach items="${religionCodeList}" var="religionCode">
														 <c:forEach items="${t.actorInfo }"  var="m">
															${religionCode.code==m.attrValue?m.roleFlag==1?m.attrId==3?religionCode.chName:'':'':''}
														</c:forEach>  
													</c:forEach>
												</span>
										</div>
									</div>
									
									<!-- "宗教2"角色属性 -->
									<div class="fl bianmatb">宗教2</div>
									<div class="fl width138 clearfix">
										<div class="td3 fl">
												<span class="span_huixian">
													<c:forEach items="${religionCodeList}" var="religionCode">
														 <c:forEach items="${t.actorInfo }"  var="m">
															${religionCode.code==m.attrValue?m.roleFlag==1?m.attrId==4?religionCode.chName:'':'':''}
														</c:forEach>  
													</c:forEach>
												</span>
											</div>
									</div>
									
								</div>
								<div class="clearfix event_condtion4_one">
									<!-- "种族"角色属性 -->
									<div class="fl bianmatb">种族</div>
									<div class="fl width138 clearfix">
										<div class="td3 fl">
												<span class="span_huixian">
													<c:forEach items="${ethnicCodeList}" var="ethnicCode">
														 <c:forEach items="${t.actorInfo }"  var="m">
															${ethnicCode.code==m.attrValue?m.roleFlag==1?m.attrId==5?ethnicCode.chName:'':'':''}
														</c:forEach>  
													</c:forEach>
												</span>
											</div>
									</div>
									
									
									<!-- "种类1"角色属性 -->
									<div class="fl bianmatb">种类1</div>
									<div class="fl width138 clearfix">
										<div class="td3 fl">
												<span class="span_huixian">
													<c:forEach items="${typeCodeList}" var="typeCode">
														 <c:forEach items="${t.actorInfo }"  var="m">
															${typeCode.code==m.attrValue?m.roleFlag==1?m.attrId==6?typeCode.chName:'':'':''}
														</c:forEach>  
													</c:forEach>
												</span>
											</div>
									</div>
									
									
									<!-- "种类2"角色属性 -->
									<div class="fl bianmatb">种类2</div>
									<div class="fl width138 clearfix">
										<div class="td3 fl">
												<span class="span_huixian">
													<c:forEach items="${typeCodeList}" var="typeCode">
														 <c:forEach items="${t.actorInfo }"  var="m">
															${typeCode.code==m.attrValue?m.roleFlag==1?m.attrId==7?typeCode.chName:'':'':''}
														</c:forEach>  
													</c:forEach>
												</span>
											</div>
									</div>
									
									
									<!-- "种类3"角色属性 -->
									<div class="fl bianmatb">种类3</div>
									<div class="fl width138 clearfix">
										<div class="td3 fl">
												<span class="span_huixian">
													<c:forEach items="${typeCodeList}" var="typeCode">
														 <c:forEach items="${t.actorInfo }"  var="m">
															${typeCode.code==m.attrValue?m.roleFlag==1?m.attrId==8?typeCode.chName:'':'':''}
														</c:forEach>  
													</c:forEach>
												</span>
											</div>
									</div>
							</div>
							<div class="clearfix event_condtion4_one">
									<!-- 角色1地理位置-国家-->
									<div class="fl guojiatb">国家</div>
									<div class="fl width138 clearfix">
										<div class="td3 fl">
											<span class="span_huixian">
												<c:forEach items="${countryList}" var="country">
													 <c:forEach items="${t.actorInfo }"  var="m">
														${country.fipsbm==m.attrValue?m.roleFlag==1?m.attrId==9?country.zwmc:'':'':''}
													</c:forEach>  
												</c:forEach>
											</span>
										</div>
									</div>
									<!-- 角色1地理位置-省份-->
									<div class="fl guojiatb">省份</div>
									<div class="fl width138 clearfix">
										<div class="td3 fl">
											<span class="span_huixian">
												<c:forEach items="${provinceCodeList}" var="province">
													 <c:forEach items="${t.actorInfo }"  var="m">
														${province.code==m.attrValue?m.roleFlag==1?m.attrId==10?province.chName:'':'':''}
													</c:forEach>  
												</c:forEach>
											</span>
										</div>
									</div>
							</div>	
							<div class="width544 fl clearfix">
								<div class="clearfix event_condtion4_three">
									<div class="td2_2 fl"><span class="span1">角色2</span></div>
										<!-- "国家"角色属性值 -->
										<div class="fl guojiatb">国家编码</div>
										<div class="fl width138 clearfix">
											<div class="td3 fl">
												<span class="span_huixian">
													<c:forEach items="${countryCodeList}" var="countryCode">
														 <c:forEach items="${t.actorInfo }"  var="m">
															${countryCode.code==m.attrValue?m.roleFlag==2?m.attrId==1?countryCode.chName:'':'':''}
														</c:forEach>  
													</c:forEach>
												</span>
											</div>
										</div>
										
										<!-- "组织名"角色属性 -->
										<div class="fl bianmatb">组织</div>
										<div class="fl width138 clearfix">
											<div class="td3 fl">
												<span class="span_huixian">
													<c:forEach items="${knownGroupCodeList}" var="knownGroupCode">
														 <c:forEach items="${t.actorInfo }"  var="m">
															${knownGroupCode.code==m.attrValue?m.roleFlag==2?m.attrId==2?knownGroupCode.chName:'':'':''}
														</c:forEach>  
													</c:forEach>
												</span>
											</div>
										</div>
										
										
										<!-- "宗教1"角色属性 -->
										<div class="fl bianmatb">宗教1</div>
										<div class="fl width138 clearfix">
											<div class="td3 fl">
												<span class="span_huixian">
													<c:forEach items="${religionCodeList}" var="religionCode">
														 <c:forEach items="${t.actorInfo }"  var="m">
															${religionCode.code==m.attrValue?m.roleFlag==2?m.attrId==3?religionCode.chName:'':'':''}
														</c:forEach>  
													</c:forEach>
												</span>
											</div>
										</div>
										
										
										<!-- "宗教2"角色属性 -->
										<div class="fl bianmatb">宗教2</div>
										<div class="fl width138 clearfix">
											<div class="td3 fl">
												<span class="span_huixian">
													<c:forEach items="${religionCodeList}" var="religionCode">
														 <c:forEach items="${t.actorInfo }"  var="m">
															${religionCode.code==m.attrValue?m.roleFlag==2?m.attrId==4?religionCode.chName:'':'':''}
														</c:forEach>  
													</c:forEach>
												</span>
											</div>
										</div>
										
								    </div>		
									<div class="clearfix event_condtion4_one">
										<!-- "种族"角色属性 -->
										<div class="fl bianmatb">种族</div>
										<div class="fl width138 clearfix">
											<div class="td3 fl">
												<span class="span_huixian">
													<c:forEach items="${ethnicCodeList}" var="ethnicCode">
														 <c:forEach items="${t.actorInfo }"  var="m">
															${ethnicCode.code==m.attrValue?m.roleFlag==2?m.attrId==5?ethnicCode.chName:'':'':''}
														</c:forEach>  
													</c:forEach>
												</span>
											</div>
										</div>
										
										
										
										<!-- "种类1"角色属性 -->
										<div class="fl bianmatb">种类1</div>
										<div class="fl width138 clearfix">
											<div class="td3 fl">
												<span class="span_huixian">
													<c:forEach items="${typeCodeList}" var="typeCode">
														 <c:forEach items="${t.actorInfo }"  var="m">
															${typeCode.code==m.attrValue?m.roleFlag==2?m.attrId==6?typeCode.chName:'':'':''}
														</c:forEach>  
													</c:forEach>
												</span>
											</div>
										</div>
										
										
										
										<!-- "种类2"角色属性 -->
										<div class="fl bianmatb">种类2</div>
										<div class="fl width138 clearfix">
											<div class="td3 fl">
												<span class="span_huixian">
													<c:forEach items="${typeCodeList}" var="typeCode">
														 <c:forEach items="${t.actorInfo }"  var="m">
															${typeCode.code==m.attrValue?m.roleFlag==2?m.attrId==7?typeCode.chName:'':'':''}
														</c:forEach>  
													</c:forEach>
												</span>
											</div>
										</div>
										
										
										
										<!-- "种类3"角色属性 -->
										<div class="fl bianmatb">种类3</div>
										<div class="fl width138 clearfix">
											<div class="td3 fl">
												<span class="span_huixian">
													<c:forEach items="${typeCodeList}" var="typeCode">
														 <c:forEach items="${t.actorInfo }"  var="m">
															${typeCode.code==m.attrValue?m.roleFlag==2?m.attrId==8?typeCode.chName:'':'':''}
														</c:forEach>  
													</c:forEach>
												</span>
											</div>
										</div>
									</div>	
									<div class="clearfix event_condtion4_one">
									<!-- 角色2地理位置-国家-->
									<div class="fl guojiatb">国家</div>
									<div class="fl width138 clearfix">
										<div class="td3 fl">
											<span class="span_huixian">
												<c:forEach items="${countryList}" var="country">
													 <c:forEach items="${t.actorInfo }"  var="m">
														${country.fipsbm==m.attrValue?m.roleFlag==2?m.attrId==9?country.zwmc:'':'':''}
													</c:forEach>  
												</c:forEach>
											</span>
										</div>
									</div>
									<!-- 角色2地理位置-省份-->
									<div class="fl guojiatb">省份</div>
									<div class="fl width138 clearfix">
										<div class="td3 fl">
											<span class="span_huixian">
												<c:forEach items="${provinceCodeList}" var="province">
													 <c:forEach items="${t.actorInfo }"  var="m">
														${province.code==m.attrValue?m.roleFlag==2?m.attrId==10?province.chName:'':'':''}
													</c:forEach>  
												</c:forEach>
											</span>
										</div>
									</div>
							</div>	
							    </div>
							</div>
						</li>
					<li class="clearfix" id="eventProperty">
							<div class="td1 fl"><p class="event_property_png fl"></p><b>事件属性：</b></div>
							<div class="width544 fl clearfix">
								<div  class="td2_2 fl"><span class="span1">类型</span></div>
								<div class="clearfix event_condtion4_two">
									<!--大类-->
									<div class="fl guojiatb">大类</div>
									<div class="fl width138 clearfix">
										<div class="td3 fl">
												<span class="span_huixian">
													<c:forEach items="${quadClassList}" var="quadClass">
														 <c:forEach items="${t.eventInfo }"  var="m">
															${m.attrId==1?quadClass.code==m.attrValue?quadClass.chName:'':'' } 
														</c:forEach>  
													</c:forEach>
												</span>
										</div>
									</div>
									<input type="hidden" name="eventAttrs" value="1"/>
									
									<!-- 根类 -->
									<div class="fl bianmatb">根类</div>
									<div class="fl width138 clearfix">
										<div class="td3 fl">
											<span class="span_huixian">
												<c:forEach items="${rootEventList}" var="rootEvent">
													 <c:forEach items="${t.eventInfo }"  var="m">
														${m.attrId==2?rootEvent.code==m.attrValue?rootEvent.chName:'':'' } 
													</c:forEach>  
												</c:forEach>
											</span>
										</div> 
									</div>
									
									<!-- 基类 -->
									<div class="fl bianmatb">基类</div>
									<div class="fl width138 clearfix">
										<div class="td3 fl">
											<span class="span_huixian">
												<c:forEach items="${baseEventList}" var="baseEvent">
													 <c:forEach items="${t.eventInfo }"  var="m">
														${m.attrId==3?baseEvent.code==m.attrValue?baseEvent.chName:'':'' } 
													</c:forEach>  
												</c:forEach>
											</span>
										</div>
									</div>
									
									<!-- 全事件 -->
									<div class="fl bianmatb">全事件</div>
									<div class="fl width138 clearfix">
										<div class="td3 fl">
											<span class="span_huixian">
												<c:forEach items="${eventList}" var="event">
													 <c:forEach items="${t.eventInfo }"  var="m">
														${m.attrId==4?event.code==m.attrValue?event.chName:'':'' } 
													</c:forEach>  
												</c:forEach>
											</span>
										</div>
									</div>
								</div>
							<!-- 发生地 -->
							<div class="width544 fl clearfix">
								<div class="clearfix event_condtion4_three">
									<div class="td2_2 fl"><span class="span1">发生地</span></div>
										<!-- 发生地国家 -->
										<div class="fl guojiatb">国家</div>
										<div class="fl width138 clearfix">
											<div class="td3 fl">
												<span class="span_huixian">
													<c:forEach items="${countryList}" var="country">
														 <c:forEach items="${t.eventInfo }"  var="m">
															${m.attrId==5?country.fipsbm==m.attrValue?country.zwmc:'':'' } 
														</c:forEach>  
													</c:forEach>
												</span>
											</div>
										</div>
										
										<!-- 发生地省份 6-->
										<div class="fl bianmatb">省份</div>
										<div class="fl width138 clearfix">
											<div class="td3 fl">
												<span class="span_huixian">
													<c:forEach items="${provinceCodeList}" var="province">
														 <c:forEach items="${t.eventInfo }"  var="m">
															${m.attrId==6?province.code==m.attrValue?province.chName:'':'' } 
														</c:forEach>  
													</c:forEach>
												</span>
											</div>
										</div>
										
										<!-- 是否为根类 7-->
										<div class="fl bianmatb" style="width: 100px;">是否根类</div>
										<div class="width272 fl clearfix">
											<div class="fl width138" style="width: 80px;">
												<div class="td3 fl">
													<span class="span_huixian" style="width: 75px;">
														<c:forEach items="${t.eventInfo }"  var="m">
															${m.attrId==7?m.attrValue==1?'是':m.attrValue==0?'否':'':'' }
														</c:forEach> 
													</span>
												</div>
											</div>
											
										</div>
								    </div>		
							    </div>
							    <!-- 其他 -->
							    <div class="width544 fl clearfix">
									<div class="clearfix event_condtion4_three" >
										<div class="td2_2 fl"><span class="span1">其他</span></div>
										<div class="fl bianmatb">源URL</div>
										<div class="fl width138 clearfix">
											<div class="td3 fl">
												<span class="span_huixian">
													<c:forEach items="${t.eventInfo }"  var="m">
														${m.attrId==8?m.attrValue:''} 
													</c:forEach> 
												</span>
											</div>
										</div>
										
										<div class="fl bianmatb">情感值</div>
										<div class="fl width138 clearfix">
											<div class="fl width138">
												<span class="default_span fl">
													<c:forEach items="${t.eventInfo }"  var="m">
														${m.attrId==9?m.attrValue:''} 
													</c:forEach> 
												</span>
												<span class="fl">—</span>
												<span class="default_span fl">
													<c:forEach items="${t.eventInfo }"  var="m">
														${m.attrId==10?m.attrValue:''} 
													</c:forEach> 
												</span>
											</div>
										</div>
										
										<div class="fl bianmatb">影响度</div>
										<div class="fl width138 clearfix">
											<div class="fl width138">
												<span class="default_span fl">
													<c:forEach items="${t.eventInfo }"  var="m">
														${m.attrId==11?m.attrValue:''} 
													</c:forEach> 
												</span>
												<span class="fl">—</span>
												<span class="default_span fl">
													<c:forEach items="${t.eventInfo }"  var="m">
														${m.attrId==12?m.attrValue:''} 
													</c:forEach> 
												</span>
											</div>
										</div>
							    	</div>
								</div>
							</div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="weight_png fl"></p><b>权重依据：</b></div>
							<div class="td5_event fl"><input  type="radio" name="weightFlag${t.configId }" <c:if test="${t.weightFlag eq 1}"> checked="checked"</c:if>  value="1"><label for="radio1"> 事件数 </label></div>
							<div class="td5_event fl"><input  type="radio" name="weightFlag${t.configId }" <c:if test="${t.weightFlag eq 2}"> checked="checked"</c:if> value="2"><label for="radio2"> 文章数 </label></div>
							<div class="td5_event fl"><input  type="radio" name="weightFlag${t.configId }" <c:if test="${t.weightFlag eq 3}"> checked="checked"</c:if> value="3"><label for="radio2"> 信源数 </label></div>
							<div class="td5_event fl"><input  type="radio" name="weightFlag${t.configId }" <c:if test="${t.weightFlag eq 4}"> checked="checked"</c:if> value="4"><label for="radio2"> 事件数(去重) </label></div>
						</li>
				</ul>
				</div>
		      </c:forEach>
		      <!-- 人工输入查询 -->
				<div class="tab_down">
				<form id="eventQueryForm" action="../config/renGongQuery" method="post">
				<input type="hidden" name="flid" id="RGFL">
				<input type="hidden" name="priority" value="1"/>
				<input type="hidden" name="configFlag" value="1"/>
				<input type="hidden" name="configCategoriesStr" id="modelType"/>
				<input type="hidden" name="remark" value="人工查询"/>
					<ul class="tab_down_info">
						<li class="clearfix">
							<div class="date_box clearfix">
								<div class="td1 fl">
									<p class="time_png fl"></p>
									<b>日期属性：</b>
								</div>
								<div class="clearfix">
									<div class="td2 fl b_e_date">起止日期</div>
									<div class="td3_2 fl">
										<label class="lab2" for=""><input class="inp_selc day1" name="stDates" type="text" readonly value="${curStDate[2]}"/></label>
									</div>
									<div class="fl width18"></div>
									<div class="td3_2 fl">
										<label class="lab2" for=""><input class="inp_selc day2" name="edDates" type="text" readonly value="${curEdDate[2]}"/></label>
									</div>
									<div class="add_date_btn"></div>
								</div>
							</div>
						</li>
						<li class="clearfix zindex99">
							<div class="td1 fl"><p class="people_png fl"></p><b>角色属性：</b></div>
							<div class="width544 fl clearfix">
								<div  class="td2_2 fl"><span class="span1">角色1</span></div>
								<div class="clearfix event_condtion4_two">
									<!-- "国家"角色属性值 -->
									<div class="fl guojiatb">国家编码</div>
									<div class="fl width138 clearfix">
										<div class="dowebok1">
											<select name="actor1AttrValues" id="actor1Cty">
												<option value="0" >请选择</option>
												<c:forEach items="${countryCodeList}" var="countryCode">
													<option value="${countryCode.code}">${countryCode.chName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<input type="hidden" name="actor1Attrs" value="1"/>
									
									
									<!-- "组织名"角色属性 -->
									<div class="fl bianmatb">组织</div>
									<div class="fl width138 clearfix">
										<div class="dowebok2">
											<select name="actor1AttrValues" id="actor1Code">
												<option value="0" selected="selected">请选择</option>
												<c:forEach items="${knownGroupCodeList}" var="knownGroupCode">
													<option value="${knownGroupCode.code}">${knownGroupCode.chName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<input type="hidden" name="actor1Attrs" value="2" />
									
									
									
									<!-- "宗教1"角色属性 -->
									<div class="fl bianmatb">宗教1</div>
									<div class="fl width138 clearfix">
										<div class="dowebok4">
											<select name="actor1AttrValues" id="actor1Code">
												<option value="0" selected="selected">请选择</option>
												<c:forEach items="${religionCodeList}" var="religionCode">
													<option value="${religionCode.code}">${religionCode.chName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<input type="hidden" name="actor1Attrs" value="3" />
									
									<!-- "宗教2"角色属性 -->
									<div class="fl bianmatb">宗教2</div>
									<div class="fl width138 clearfix">
										<div class="dowebok5">
											<select name="actor1AttrValues" id="actor1Code">
												<option value="0" selected="selected">请选择</option>
												<c:forEach items="${religionCodeList}" var="religionCode">
													<option value="${religionCode.code}">${religionCode.chName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<input type="hidden" name="actor1Attrs" value="4" />
									
									
								</div>
								<div class="clearfix event_condtion4_one">
									<!-- "种族"角色属性 -->
									<div class="fl bianmatb">种族</div>
									<div class="fl width138 clearfix">
										<div class="dowebok3">
											<select name="actor1AttrValues" id="actor1Code">
												<option value="0" selected="selected">请选择</option>
												<c:forEach items="${ethnicCodeList}" var="ethnicCode">
													<option value="${ethnicCode.code}">${ethnicCode.chName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<input type="hidden" name="actor1Attrs" value="5" />
									
									
									<!-- "种类1"角色属性 -->
									<div class="fl bianmatb">种类1</div>
									<div class="fl width138 clearfix">
										<div class="dowebok6">
											<select name="actor1AttrValues" id="actor1Code">
												<option value="0" selected="selected">请选择</option>
												<c:forEach items="${typeCodeList}" var="typeCode">
													<option value="${typeCode.code}">${typeCode.chName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<input type="hidden" name="actor1Attrs" value="6" />
									
									
									
									<!-- "种类2"角色属性 -->
									<div class="fl bianmatb">种类2</div>
									<div class="fl width138 clearfix">
										<div class="dowebok7">
											<select name="actor1AttrValues" id="actor1Code">
												<option value="0" selected="selected">请选择</option>
												<c:forEach items="${typeCodeList}" var="typeCode">
													<option value="${typeCode.code}">${typeCode.chName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<input type="hidden" name="actor1Attrs" value="7" />
									
									
									<!-- "种类3"角色属性 -->
									<div class="fl bianmatb">种类3</div>
									<div class="fl width138 clearfix">
										<div class="dowebok8">
											<select name="actor1AttrValues" id="actor1Code">
												<option value="0" selected="selected">请选择</option>
												<c:forEach items="${typeCodeList}" var="typeCode">
													<option value="${typeCode.code}">${typeCode.chName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<input type="hidden" name="actor1Attrs" value="8" />
							</div>
							<div class="clearfix event_condtion4_one">
									<!-- 角色1地理位置-国家-->
									<div class="fl guojiatb">国家</div>
										<div class="fl width138 clearfix">
											<div class="dowebok23">
												<input type="hidden" name="actor1Attrs" value="9"/>
												<select name="actor1AttrValues" id="actor1CountryGeoCode" onchange="actor1ChangeCountry(this.options[this.options.selectedIndex].value)">
													<option value="0">请选择</option>
													<c:forEach items="${countryList}" var="country">
														<option value="${country.fipsbm}">${country.zwmc}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									<!-- 角色1地理位置-省份-->
									<div class="fl guojiatb">省份</div>
									<div class="fl width138 clearfix">
										<input type="hidden" name="actor1Attrs" value="10" />
										<div class="dowebok24">
											<select id="actor1Province" name="actor1AttrValues">
												<option value="0" selected="selected">请选择</option>
											</select>
										</div>
									</div>
							</div>	
							<div class="width544 fl clearfix">
								<div class="clearfix event_condtion4_three" >
									<div class="td2_2 fl"><span class="span1">角色2</span></div>
										<!-- "国家"角色属性值 -->
										<div class="fl guojiatb">国家编码</div>
										<div class="fl width138 clearfix">
											<div class="dowebok9">
												<select name="actor2AttrValues" id="actor1Cty">
													<option value="0" >请选择</option>
													<c:forEach items="${countryCodeList}" var="countryCode">
														<option value="${countryCode.code}">${countryCode.chName}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<input type="hidden" name="actor2Attrs" value="1"/>
										
										
										<!-- "组织名"角色属性 -->
										<div class="fl bianmatb">组织</div>
										<div class="fl width138 clearfix">
											<div class="dowebok10">
												<select name="actor2AttrValues" id="actor1Code">
													<option value="0" selected="selected">请选择</option>
													<c:forEach items="${knownGroupCodeList}" var="knownGroupCode">
														<option value="${knownGroupCode.code}">${knownGroupCode.chName}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<input type="hidden" name="actor2Attrs" value="2" />
										
										
										<!-- "宗教1"角色属性 -->
										<div class="fl bianmatb">宗教1</div>
										<div class="fl width138 clearfix">
											<div class="dowebok12">
												<select name="actor2AttrValues" id="actor1Code">
													<option value="0" selected="selected">请选择</option>
													<c:forEach items="${religionCodeList}" var="religionCode">
														<option value="${religionCode.code}">${religionCode.chName}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<input type="hidden" name="actor2Attrs" value="4" />
										
										
										<!-- "宗教2"角色属性 -->
										<div class="fl bianmatb">宗教2</div>
										<div class="fl width138 clearfix">
											<div class="dowebok13">
												<select name="actor2AttrValues" id="actor1Code">
													<option value="0" selected="selected">请选择</option>
													<c:forEach items="${religionCodeList}" var="religionCode">
														<option value="${religionCode.code}">${religionCode.chName}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<input type="hidden" name="actor2Attrs" value="5" />
										
								    </div>		
									<div class="clearfix event_condtion4_one">
										<!-- "种族"角色属性 -->
										<div class="fl bianmatb">种族</div>
										<div class="fl width138 clearfix">
											<div class="dowebok11">
												<select name="actor2AttrValues" id="actor1Code">
													<option value="0" selected="selected">请选择</option>
													<c:forEach items="${ethnicCodeList}" var="ethnicCode">
														<option value="${ethnicCode.code}">${ethnicCode.chName}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<input type="hidden" name="actor2Attrs" value="3" />
										
										
										<!-- "种类1"角色属性 -->
										<div class="fl bianmatb">种类1</div>
										<div class="fl width138 clearfix">
											<div class="dowebok14">
												<select name="actor2AttrValues" id="actor1Code">
													<option value="0" selected="selected">请选择</option>
													<c:forEach items="${typeCodeList}" var="typeCode">
														<option value="${typeCode.code}">${typeCode.chName}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<input type="hidden" name="actor2Attrs" value="6" />
									
										
										
										<!-- "种类2"角色属性 -->
										<div class="fl bianmatb">种类2</div>
										<div class="fl width138 clearfix">
											<div class="dowebok15">
												<select name="actor2AttrValues" id="actor1Code">
													<option value="0" selected="selected">请选择</option>
													<c:forEach items="${typeCodeList}" var="typeCode">
														<option value="${typeCode.code}">${typeCode.chName}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<input type="hidden" name="actor2Attrs" value="7" />
										
										<!-- "种类3"角色属性 -->
										<div class="fl bianmatb">种类3</div>
										<div class="fl width138 clearfix">
											<div class="dowebok16">
												<select name="actor2AttrValues" id="actor1Code">
													<option value="0" selected="selected">请选择</option>
													<c:forEach items="${typeCodeList}" var="typeCode">
														<option value="${typeCode.code}">${typeCode.chName}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<input type="hidden" name="actor2Attrs" value="8" />
										
									</div>	
									<div class="clearfix event_condtion4_one">
										<!-- 角色2地理位置-国家-->
										<div class="fl guojiatb">国家</div>
											<div class="fl width138 clearfix">
												<div class="dowebok25">
													<input type="hidden" name="actor2Attrs" value="9"/>
													<select name="actor2AttrValues" id="actor2CountryGeoCode" onchange="actor2ChangeCountry(this.options[this.options.selectedIndex].value)">
														<option value="0">请选择</option>
														<c:forEach items="${countryList}" var="country">
															<option value="${country.fipsbm}">${country.zwmc}</option>
														</c:forEach>
													</select>
												</div>
											</div>
										<!-- 角色2地理位置-省份-->
										<div class="fl guojiatb">省份</div>
										<div class="fl width138 clearfix">
											<input type="hidden" name="actor2Attrs" value="10" />
											<div class="dowebok26">
												<select id="actor2Province" name="actor2AttrValues">
													<option value="0" selected="selected">请选择</option>
												</select>
											</div>
										</div>
									</div>	
							    </div>
							</div>
						</li>
						<li class="clearfix" id="eventProperty">
							<div class="td1 fl"><p class="event_property_png fl"></p><b>事件属性：</b></div>
							<div class="width544 fl clearfix">
								<div  class="td2_2 fl"><span class="span1">类型</span></div>
								<div class="clearfix event_condtion4_two">
									<!-- 大类-->
									<div class="fl guojiatb">大类</div>
									<div class="fl width138 clearfix">
										<div class="dowebok17">
											<select name="eventAttrValues" id="eventAttr1">
												<option value="0" >请选择</option>
												<c:forEach items="${quadClassList}" var="quadClass">
													<option value="${quadClass.code}">${quadClass.chName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<input type="hidden" name="eventAttrs" value="1"/>
									
									<!-- 根类 -->
									<div class="fl bianmatb">根类</div>
									<div class="fl width138 clearfix">
										<div class="dowebok18">
											<select name="eventAttrValues" id="eventAttr2">
												<option value="0">请选择</option>
												<c:forEach items="${rootEventList}" var="root">
													<option value="${root.code}">${root.chName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<input type="hidden" name="eventAttrs" value="2" />
									
									<!-- 基类 -->
									<div class="fl bianmatb">基类</div>
									<div class="fl width138 clearfix">
										<div class="dowebok19">
											<select name="eventAttrValues" id="eventAttr2">
												<option value="0">请选择</option>
												<c:forEach items="${baseEventList}" var="base">
													<option value="${base.code}">${base.chName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<input type="hidden" name="eventAttrs" value="3" />
									
									
									<!-- 全事件 -->
									<div class="fl bianmatb">全事件</div>
									<div class="fl width138 clearfix">
										<div class="dowebok20">
											<select name="eventAttrValues" id="eventAttr2">
												<option value="0">请选择</option>
												<c:forEach items="${eventList}" var="event">
													<option value="${event.code}">${event.chName}</option>
												</c:forEach>
										</select>
										</div>
									</div>
									<input type="hidden" name="eventAttrs" value="4" />
									
									
								</div>
							<!-- 发生地 -->
							<div class="width544 fl clearfix">
								<div class="clearfix event_condtion4_three">
									<div class="td2_2 fl"><span class="span1">发生地</span></div>
										<!-- 发生地国家 -->
										<div class="fl guojiatb">国家</div>
										<div class="fl width138 clearfix">
											<div class="dowebok21">
												<select name="eventAttrValues" id="eventAttr3" onchange="changeCountry(this.options[this.options.selectedIndex].value)">
													<option value="0" selected="selected">请选择</option>
													<c:forEach items="${countryList}" var="country">
														<option value="${country.fipsbm}">${country.zwmc}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<input type="hidden" name="eventAttrs" value="5"/>
										
										<!-- 发生地省份 -->
										<div class="fl bianmatb">省份</div>
										<div class="fl width138 clearfix">
											<div class="dowebok22">
												<select name="eventAttrValues" id="eventAttr6">
													<option value="0" selected="selected">请选择</option>
												</select>
											</div>
										</div>
										<input type="hidden" name="eventAttrs" value="6" />
										
										<!-- 是否为根类 -->
										<div class="fl bianmatb" style="width: 100px;">是否根类</div>
										<div class="width272 fl clearfix">
											<div class="fl width138" style="width: 80px;">
												<div class="dowebok19 sec_gen">
													<input type="hidden" name="eventAttrs" value="7" />
													<select name="eventAttrValues">
														<option value="-1" selected="selected">请选择</option>
														<option value="1" >是</option>
														<option value="0" >否</option>
													</select>
												</div>
											</div>
										</div>
								    </div>		
							    </div>
							    <!-- 其他 -->
							    <div class="width544 fl clearfix">
									<div class="clearfix event_condtion4_three" >
										<div class="td2_2 fl"><span class="span1">其他</span></div>
										<!-- 源URL -->
										<div class="fl bianmatb">源URL</div>
										<div class="fl width138 clearfix">
											<div class="fl width138">
												<input type="hidden" name="eventAttrs" value="8" />
												<input class="default_input"style="width:137px;padding:0px 8px;"  type="text" name="eventAttrValues" />
											</div>
										</div>
										
										<div class="fl bianmatb">情感值</div>
										<div class="fl width138 clearfix">
											<div class="fl width138">
												<input type="hidden" name="eventAttrs" value="9" />
												<input style="width:60px;padding:0px 8px;" class="default_input fl" type="text" value="-10" name ="eventAttrValues" />
												<span class="fl">—</span>
												<input type="hidden" name="eventAttrs" value="10" />
												<input style="width:60px;padding:0px 8px;" class="default_input fl" type="text" value="10" name ="eventAttrValues" />
											</div>
										</div>
										
										
										<div class="fl bianmatb">影响度</div>
										<div class="fl width138 clearfix">
											<div class="fl width138">
												<input type="hidden" name="eventAttrs" value="11" />
												<input style="width:60px;padding:0px 8px;" class="default_input fl" type="text" value="-10" name ="eventAttrValues" />
												<span class="fl">—</span>
												<input type="hidden" name="eventAttrs" value="12" />
												<input style="width:60px;padding:0px 8px;" class="default_input fl" type="text" value="10" name ="eventAttrValues" />
											</div>
										</div>	
							    	</div>
								</div>
							</div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="weight_png fl"></p><b>权重依据：</b></div>
							<div class="td5_event fl"><input id="radio1" type="radio" name="weightFlag" checked="checked" value="1"><label for="radio1"> 事件数</label></div>
							<div class="td5_event fl"><input id="radio2" type="radio" name="weightFlag" value="2"><label for="radio2"> 文章数</label></div>
							<div class="td5_event fl"><input id="radio3" type="radio" name="weightFlag" value="3"><label for="radio3"> 信源数</label></div>
							<div class="td5_event fl"><input id="radio4" type="radio" name="weightFlag" value="4"><label for="radio4"> 事件数(去重)</label></div>
						</li>
						<li>
						<div class="fr">
								<div style=" float:left; margin-right:10px">保存配置：<input class="artificial_radio" name="isSaveConfig" value="0" type="radio" onclick="$('#rgConfigName').show()">是<input class="artificial_radio" type="radio" name="isSaveConfig" value="1" checked onclick="$('#rgConfigName').hide()">否</div>
								<div style=" float:left; margin-right:10px;display: none;" id="rgConfigName">配置名称：<input class="default_input" style="padding: 1px 8px;" type="text" name="configName"></div>
								<div style=" float:left;"><input class="submit2" type="button" onclick="eventRGQuery()" value="提交"></div>
						</div>
						</li>
					</ul>
					</form>
				</div>
			</div>
</body>
<script type="text/javascript">
$(function(){
	// 选择年月日
	$('.day1').datepicker({
		format: 'yyyy-mm-dd', 
		weekStart: 0,
		autoclose: true, 
		orientation:"auto",
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
		orientation:"auto",
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
})
</script>
</html>