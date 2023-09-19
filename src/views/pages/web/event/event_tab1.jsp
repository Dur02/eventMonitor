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
<link rel="stylesheet" href="<%=basePath %>/static/css/eventConfig.css"/>
<style>
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
<!-- 提供事件模块的大部分使用，包含有全部的查询条件 (日期、角色属性、事件属性、权重) -->
<script type="text/javascript" src="<%=basePath%>/static/js/config/newShowConfig.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/hsCheckData.js"></script>
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
		<c:if test="${typeList.size()>0 }">
			<input type="hidden" id="PZLength" value="${typeList.size()}"/>
		</c:if>
		<!-- 遍历配置集合 -->
		<c:forEach items="${typeList }" var = "t" varStatus="indx">
			<c:if test="${indx.index eq 0 }" >
				<div class="tab_down show" >
			</c:if>
			<c:if test="${indx.index ne 0 }">
				<div class="tab_down" >
			</c:if>
				<div class="high_search_con" style="margin-top: 30px;">
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
						<li class="clearfix"><!-- style="height:31px;" -->
							<div class="td1 fl"><p class="weight_png fl"></p><b>数据源：</b></div>
							<div class="td5_event fl"><input class="dataSourceType1" type="radio" onclick="return false" <c:if test="${t.dataSourceType eq 1}"> checked="checked"</c:if> value="1"><label for="radio1"> 数据源一</label></div>
							<div class="td5_event fl"><input class="dataSourceType2" type="radio" onclick="return false" <c:if test="${t.dataSourceType eq 2}"> checked="checked"</c:if> value="2"><label for="radio2"> 数据源二</label></div>
							<div class="td5_event fl"><input class="dataSourceType3" type="radio" onclick="return false" <c:if test="${t.dataSourceType eq 3}"> checked="checked"</c:if> value="3"><label for="radio3"> 数据源三</label></div>
						</li>
	       		 	</c:if>
					<!-- 权重依据 -->
					<li class="clearfix quanzhong">
						<div class="td1 fl"><p class="ids_png fl"></p><b>权重依据：</b></div>
						<div class="td5_event fl"><input  type="radio" onclick="return false" name="weightFlag${t.configId }" <c:if test="${t.weightFlag eq 1}"> checked="checked"</c:if>  value="1"><label for="radio1"> 事件数 </label></div>
						<div class="td5_event fl"><input  type="radio" onclick="return false" name="weightFlag${t.configId }" <c:if test="${t.weightFlag eq 2}"> checked="checked"</c:if> value="2"><label for="radio2"> 文章数 </label></div>
						<div class="td5_event fl"><input  type="radio" onclick="return false" name="weightFlag${t.configId }" <c:if test="${t.weightFlag eq 3}"> checked="checked"</c:if> value="3"><label for="radio2"> 信源数 </label></div>
						<div class="td5_event fl"><input  type="radio" onclick="return false" name="weightFlag${t.configId }" <c:if test="${t.weightFlag eq 4}"> checked="checked"</c:if> value="4"><label for="radio2"> 事件数(去重) </label></div>
					</li>
					<!-- 统计依据 -->
					<li class="clearfix bizhong" style="display:none;">
						<div class="td1 fl"><p class="tjyj_png fl"></p><b>统计依据：</b></div>
						<div class="td5_event fl"><input  type="radio" onclick="return false" name="valueWeight${t.configId }" <c:if test="${t.staticbasic eq 1}"> checked="checked"</c:if> value="1"><label for="radio1"> 比重</label></div>
						<div class="td5_event fl"><input  type="radio" onclick="return false" name="valueWeight${t.configId }" <c:if test="${t.staticbasic eq 2}"> checked="checked"</c:if> value="2"><label for="radio2"> 数量</label></div>
					</li>
					<!-- 国家关系展示模块附加参数 -->
					<li class="clearfix zindex99 countryRelation" style="display: none;">
						<div class="td1 fl"><p class="event_property_png fl" style="margin-top: 0 !important;"></p><b>参数设置：</b></div>
						<div class="fl clearfix">
							<div  class="td2_2 fl"><span class="span1">国家关系</span></div>
							<div class="fl">
								年参数一：<input style="width:38px;padding: 1px 5px !important;" readonly="readonly" class="default_input norm1" type="text" value="${t.countryRelationParameter.yearNorm1}"/>    年参数二：<input style="width:38px;padding: 1px 5px !important;" readonly="readonly" class="default_input norm2" type="text" value="${t.countryRelationParameter.yearNorm2}"/>
								月参数一：<input style="width:38px;padding: 1px 5px !important;" readonly="readonly" class="default_input norm1" type="text" value="${t.countryRelationParameter.monthNorm1}"/>    月参数二：<input style="width:38px;padding: 1px 5px !important;" readonly="readonly" class="default_input norm2" type="text" value="${t.countryRelationParameter.monthNorm2}"/>
								周参数一：<input style="width:38px;padding: 1px 5px !important;" readonly="readonly" class="default_input norm1" type="text" value="${t.countryRelationParameter.weekNorm1}"/>    周参数二：<input style="width:38px;padding: 1px 5px !important;" readonly="readonly" class="default_input norm2" type="text" value="${t.countryRelationParameter.weekNorm2}"/>
								天参数一：<input style="width:38px;padding: 1px 5px !important;" readonly="readonly" class="default_input norm1" type="text" value="${t.countryRelationParameter.dateNorm1}"/>    天参数二：<input style="width:38px;padding: 1px 5px !important;" readonly="readonly" class="default_input norm2" type="text" value="${t.countryRelationParameter.dateNorm2}"/>
							</div>
						</div>
					</li>
					<!-- 根据是否高级查询回显页面 -->
					<c:if test="${t.customQuery !='' && t.customQuery != null }" >
						<div class="ulli" style="display: none!important;">
					</c:if>
					<c:if test="${t.customQuery == null ||t.customQuery == '' }" >
						<div class="ulli" >
					</c:if>
					
					<li class="clearfix zindex99">
							<div class="td1 fl"><p class="people_png fl"></p><b>角色属性：</b></div>
							<div class=" fl clearfix">
								<div  class="td2_2 fl"><span class="span1">角色1</span></div>
								<div class="clearfix event_condtion4_two">
									<!-- "国家"角色属性值 -->
									<div class="fl guojiatb" style="width: 66px;margin-left: -10px;">国家(地区)</div>
									<div class="fl width138 clearfix">
										<div class="td3 fl">
											<span class="span_huixian ${indx.index}newJJ1">
												<c:forEach items="${t.actorInfo }"  var="m">
													${m.actor1Countrycode}
												</c:forEach>  
											</span>
										</div>
									</div>
									<!-- "组织名"角色属性 -->
									<div class="fl bianmatb"  style="width: 62px;">组织</div>
									<div class="fl width138 clearfix">
										<div class="td3 fl">
											<span class="span_huixian ${indx.index}newJJ2"> 
												<c:forEach items="${t.actorInfo }"  var="m">
													${m.organizationcodeactor1}
												</c:forEach>  
											</span>
										</div>
									</div>
									
									<!-- "宗教1"角色属性 -->
									<div class="fl bianmatb">宗教1</div>
									<div class="fl width138 clearfix">
										<div class="td3 fl">
											<span class="span_huixian ${indx.index}newJJ3">
												 <c:forEach items="${t.actorInfo }"  var="m">
													${m.religion1CodeActor1}
												</c:forEach>  
											</span>
										</div>
									</div>
									
									<!-- "宗教2"角色属性 -->
									<div class="fl bianmatb">宗教2</div>
									<div class="fl width138 clearfix">
										<div class="td3 fl">
											<span class="span_huixian ${indx.index}newJJ4">
												<c:forEach items="${t.actorInfo }"  var="m">
													${m.religion2CodeActor1}
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
											<span class="span_huixian ${indx.index}newJJ5">
												<c:forEach items="${t.actorInfo }"  var="m">
													${m.ethnicCodeactor1}
												</c:forEach>  
											</span>
										</div>
									</div>
									
									<!-- "种类1"角色属性 -->
									<div class="fl bianmatb"  style="width: 62px;">种类1</div>
									<div class="fl width138 clearfix">
										<div class="td3 fl">
											<span class="span_huixian ${indx.index}newJJ6">
												<c:forEach items="${t.actorInfo }"  var="m">
													${m.typeCode1actor1}
												</c:forEach>  
											</span>
										</div>
									</div>
									
									
									<!-- "种类2"角色属性 -->
									<div class="fl bianmatb">种类2</div>
									<div class="fl width138 clearfix">
										<div class="td3 fl">
											<span class="span_huixian ${indx.index}newJJ7">
												<c:forEach items="${t.actorInfo }"  var="m">
													${m.typeCode2actor1}
												</c:forEach>  
											</span>
										</div>
									</div>
									
									<!-- "种类3"角色属性 -->
									<div class="fl bianmatb">种类3</div>
									<div class="fl width138 clearfix">
										<div class="td3 fl">
											<span class="span_huixian ${indx.index}newJJ8">
												<c:forEach items="${t.actorInfo }"  var="m">
													${m.typeCode3actor1}
												</c:forEach>  
											</span>
										</div>
									</div>
							</div>
							<!-- 角色一地理种类下拉框 -->
							<div class="clearfix event_condtion4_one">
								
								<div class="fl bianmatb">地理类型</div>
									<div class="fl width138 clearfix">
										<div class="td3 fl">
											<span class="span_huixian">
												<c:forEach  items="${t.eventGeoDl }" var = "tt">
													${tt.actor1Geographictype==1?'国家(地区)':tt.actor1Geographictype==2?'州省':tt.actor1Geographictype==3?'城市':''}
												</c:forEach>
											</span>
										</div>
									</div>
									<div class="clearfix event_condtion4_one">
											<!-- 角色1地理位置-国家-->
											<div class="fl guojiatb" style="margin-top: -10px;width: 62px;" >国家/州省</div>
											<div class="fl width138 clearfix" style="margin-top: -9px;">
												<div class="td3 fl">
													<span class="span_huixian ${indx.index}newJJ9">
														<c:forEach items="${t.actorInfo }"  var="m">
															${m.geographyCountryactor1}
														</c:forEach>  
													</span>
												</div>
											</div>
									</div>
									<div class="tishi_tb">逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如  (A && B && !D)||C </div>
									<div style="margin-left: -7px;width: 63px;float: left;padding-top: 1px;">地理全称</div>
									<div class="radio_box">
										<span class="condition_info_graph_ids2 fl" style="width: 500px;margin-left: 3px;" id="eventKeyWordactor1" name="eventKeyWordactor1" >
											${t.eventKeyWords.keywordsactor1}
										</span>
									</div>
									<div style="margin-left: 10px;float: left;"><input type="checkbox" onclick="return false;" style="vertical-align: middle;margin: 0 0 0 0;" value="0" <c:if test="${t.eventKeyWords.eventKeyWordactor1IsBig eq 0}"> checked</c:if>>区分大小写</div>
							</div>
								
							<div class=" fl clearfix">
								<div class="clearfix event_condtion4_three">
									<div class="td2_2 fl"><span class="span1">角色2</span></div>
										<!-- "国家"角色属性值 -->
										<div class="fl guojiatb" style="width: 66px;margin-left: -10px;">国家(地区)</div>
										<div class="fl width138 clearfix">
											<div class="td3 fl">
												<span class="span_huixian ${indx.index}newJJ10">
													<c:forEach items="${t.actorInfo }"  var="m">
														${m.actor2Countrycode}
													</c:forEach>  
												</span>
											</div>
										</div>
										
										<!-- "组织名"角色属性 -->
										<div class="fl bianmatb"  style="width: 62px;">组织</div>
										<div class="fl width138 clearfix">
											<div class="td3 fl">
												<span class="span_huixian ${indx.index}newJJ11">
													<c:forEach items="${t.actorInfo }"  var="m">
														${m.organizationcodeactor2}
													</c:forEach>  
												</span>
											</div>
										</div>
										
										<!-- "宗教1"角色属性 -->
										<div class="fl bianmatb">宗教1</div>
										<div class="fl width138 clearfix">
											<div class="td3 fl">
												<span class="span_huixian ${indx.index}newJJ12">
													<c:forEach items="${t.actorInfo }"  var="m">
														${m.religion1CodeActor2}
													</c:forEach>  
												</span>
											</div>
										</div>
										
										
										<!-- "宗教2"角色属性 -->
										<div class="fl bianmatb">宗教2</div>
										<div class="fl width138 clearfix">
											<div class="td3 fl">
												<span class="span_huixian ${indx.index}newJJ13">
													<c:forEach items="${t.actorInfo }"  var="m">
														${m.religion2CodeActor2}
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
												<span class="span_huixian ${indx.index}newJJ14">
													<c:forEach items="${t.actorInfo }"  var="m">
														${m.ethnicCodeactor2}
													</c:forEach>  
												</span>
											</div>
										</div>
										<!-- "种类1"角色属性 -->
										<div class="fl bianmatb"  style="width: 62px;">种类1</div>
										<div class="fl width138 clearfix">
											<div class="td3 fl">
												<span class="span_huixian ${indx.index}newJJ15">
														<c:forEach items="${t.actorInfo }"  var="m">
															${m.typeCode1actor2}
														</c:forEach>  
												</span>
											</div>
										</div>
										<!-- "种类2"角色属性 -->
										<div class="fl bianmatb">种类2</div>
										<div class="fl width138 clearfix">
											<div class="td3 fl">
												<span class="span_huixian ${indx.index}newJJ16">
														<c:forEach items="${t.actorInfo }"  var="m">
															${m.typeCode2actor2}
														</c:forEach>  
												</span>
											</div>
										</div>
										
										<!-- "种类3"角色属性 -->
										<div class="fl bianmatb">种类3</div>
										<div class="fl width138 clearfix">
											<div class="td3 fl">
												<span class="span_huixian ${indx.index}newJJ17">
														<c:forEach items="${t.actorInfo }"  var="m">
															${m.typeCode3actor2}
														</c:forEach>  
												</span>
											</div>
										</div>
									</div>
									<!-- 角色二地理种类下拉框 -->
									<div class="clearfix event_condtion4_one">
										
										<div class="fl guojiatb">地理类型</div>
											<div class="fl width138 clearfix">
												<div class="td3 fl">
													<span class="span_huixian">
														<c:forEach  items="${t.eventGeoDl }" var = "tt">
															${tt.actor2Geographictype==1?'国家(地区)':tt.actor2Geographictype==2?'州省':tt.actor2Geographictype==3?'城市':''}
														</c:forEach>
													</span>
												</div>
											</div>
											<div class="clearfix event_condtion4_one">
													<!-- 角色2地理位置-国家-->
													<div class="fl guojiatb" style="margin-top: -10px;width: 62px;">国家/州省</div>
													<div class="fl width138 clearfix" style="margin-top: -9px;">
														<div class="td3 fl">
															<span class="span_huixian ${indx.index}newJJ18">
																	<c:forEach items="${t.actorInfo }"  var="m">
																		${m.geographyCountryactor2}
																	</c:forEach>  
															</span>
														</div>
													</div>
											</div>	
											<div class="tishi_tb" >逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如  (A && B && !D)||C  </div>
											<div style="margin-left: -7px;width: 63px;float: left;padding-top: 1px;">地理全称</div>
											<div class="radio_box">
												<span class="condition_info_graph_ids2 fl" style="width: 500px;margin-left: 3px;" id="eventKeyWordactor2" >
													${t.eventKeyWords.keywordsactor2}
												</span>
											</div>
											<div style="margin-left: 10px;float: left;"><input type="checkbox" onclick="return false;" style="vertical-align: middle;margin: 0 0 0 0;" value="0" <c:if test="${t.eventKeyWords.eventKeyWordactor2IsBig eq 0}"> checked</c:if>>区分大小写</div>
									</div>
									
							    </div>
							</div>
						</li>
					<li class="clearfix" id="eventProperty">
							<div class="td1 fl"><p class="event_property_png fl"></p><b class="sjsx">事件属性：</b></div>
							<div class=" fl clearfix">
								<div  class="td2_2 fl"><span class="span1">类型</span></div>
								<div class="clearfix event_condtion4_two">
									<!--大类-->
									<div class="fl guojiatb">大类</div>
									<div class="fl width138 clearfix">
										<div class="td3 fl">
												<span class="span_huixian ${indx.index}newJJ19">
													<c:forEach items="${t.eventInfo }"  var="m">
														${m.quadClassData} 
													</c:forEach>  
												</span>
										</div>
									</div>
									<input type="hidden" name="eventAttrs" value="1"/>
									
									<!-- 根类 -->
									<div class="fl bianmatb"  style="width: 62px;">根类</div>
									<div class="fl width138 clearfix">
										<div class="td3 fl">
											<span class="span_huixian ${indx.index}newJJ20">
													<c:forEach items="${t.eventInfo }"  var="m">
														${m.rootEventData} 
													</c:forEach>  
											</span>
										</div> 
									</div>
									
									<!-- 基类 -->
									<div class="fl bianmatb">基类</div>
									<div class="fl width138 clearfix">
										<div class="td3 fl">
											<span class="span_huixian ${indx.index}newJJ21">
													<c:forEach items="${t.eventInfo }"  var="m">
														${m.baseEventData} 
													</c:forEach>  
											</span>
										</div>
									</div>
									
									<!-- 全事件 -->
									<div class="fl bianmatb">子类</div>
									<div class="fl width138 clearfix">
										<div class="td3 fl">
											<span class="span_huixian ${indx.index}newJJ22">
													<c:forEach items="${t.eventInfo }"  var="m">
														${m.codeEventData} 
													</c:forEach>  
											</span>
										</div>
									</div>
								</div>
								<!-- 发生地 -->
								<div class="clearfix">
									<div class="clearfix event_condtion4_three">
										<div class="td2_2 fl"><span class="span1">发生地</span></div>
										<!-- 发生地国家 -->
										<div class="fl bianmatb">地理类型</div>
										<div class="fl width138 clearfix">
											<div class="td3 fl">
												<span class="span_huixian">
													<c:forEach  items="${t.eventGeoDl }" var = "tt">
														${tt.geographictype==1?'国家(地区)':tt.geographictype==2?'州省':tt.geographictype==3?'城市':''}
													</c:forEach>
												</span>
											</div>
										</div>
										<div class="fl guojiatb"  style="width: 62px;">国家/州省</div>
										<div class="fl width138 clearfix">
											<div class="td3 fl">
												<span class="span_huixian ${indx.index}newJJ23">
														<c:forEach items="${t.eventInfo }"  var="m">
															${m.geographyCountryactor} 
														</c:forEach>  
												</span>
											</div>
										</div>
										<div style="margin-bottom:2px;margin-top: 27px;margin-left: 143px;">逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如  (A && B && !D)||C  </div>
										<div style="float: left;margin-left: 88px;">地理全称</div>
										<div class="radio_box clearfix">
											<span class="condition_info_graph_ids2 fl" style="width: 500px;margin-left: 6px;" id="eventKeyWordactor" >
												${t.eventKeyWords.keywordsactor}
											</span>
									    	<div style="margin-left: 10px;float: left;"><input type="checkbox" onclick="return false;" style="vertical-align: middle;margin: 0 0 0 0;" value="0" <c:if test="${t.eventKeyWords.eventKeyWordactorIsBig eq 0}"> checked</c:if>>区分大小写</div>		
								    	</div>
							    </div>
							    <!-- 其他 -->
							    <div class=" fl clearfix">
									<div class="clearfix event_condtion4_three" >
										<div class="td2_2 fl"><span class="span1">其他</span></div>
										<div class="fl bianmatb">源URL</div>
										<div class="fl width138 clearfix">
											<div class="td3 fl">
												<span class="span_huixian">
													<c:forEach items="${t.eventInfo }"  var="m">
														${m.sourceUrl } 
													</c:forEach> 
												</span>
											</div>
										</div>
										
										<div class="fl bianmatb">情感值</div>
										<div class="fl width138 clearfix">
											<div class="fl width138">
												<span class="default_span fl ${indx.index}newNUM1">
													<c:forEach items="${t.eventInfo }"  var="m">
														${m.stavgTone}
													</c:forEach> 
												</span>
												<span class="fl ljX_1">—</span>
												<span class="default_span fl ${indx.index}newNUM2">
													<c:forEach items="${t.eventInfo }"  var="m">
														${m.edavgTone}
													</c:forEach> 
												</span>
											</div>
										</div>
										
										<div class="fl bianmatb">影响度</div>
										<div class="fl width138 clearfix">
											<div class="fl width138">
												<span class="default_span fl ${indx.index}newNUM3">
													<c:forEach items="${t.eventInfo }"  var="m">
														${m.stgoldsteinScale}
													</c:forEach> 
												</span>
												<span class="fl ljX_1">—</span>
												<span class="default_span fl ${indx.index}newNUM4">
													<c:forEach items="${t.eventInfo }"  var="m">
														${m.edgoldsteinScale}
													</c:forEach> 
												</span>
											</div>
										</div>
										<!-- 是否为根类 7-->
										<div class="fl bianmatb" style="width: 62px;">是否根类</div>
										<div class="width272 fl clearfix">
											<div class="fl width138" style="width: 80px;">
												<div class="td3 fl">
													<span class="span_huixian" style="width: 50px;">
														<c:forEach items="${t.eventInfo }"  var="m">
															${m.isRoot==1?'是':m.isRoot==0?'否':''}
														</c:forEach>
													</span>
												</div>
											</div>
											
										</div>
							    	</div>
								</div>
							</div>
						</li>
						<!-- 自定义查询 -->
						<%-- <li class="clearfix">
							<div class="td1 fl"><p class="weight_png fl"></p><b>高级查询：</b></div>
							<div class="clearfix fl event_condtion4_two homeNotShow">
								<div style="margin-left: -7px;width: 63px;float: left;padding-top: 4px;">自定义查询</div>
								<div class="fl" style="float: left;">
									<input class="condition_info_graph_ids2 fl" style="width: 500px;" type="text" id="customQuery" name="customQuery" value="${t.customQuery}"/>
								</div>
							</div>
						</li> --%>
						<li class="clearfix quanzhongkuang" style="display: none;">
							<div class="td1 fl"><p class="weight_png fl"></p><b>权重值：</b></div>
							<div class="td1 fl"><p></p><b> </b></div>
							<div class="fl bianmatb">事件数</div>
							<div class="fl clearfix">
								<div class="fl" style="width:149px !important;">
									<input style="width:42px;" class="default_input2 fl" type="text" name="stNumMentions" value="${t.stNumMentions}"/>
									<span class="fl ljX_1">—</span>
									<input style="width:42px;" class="default_input2 fl" type="text" name="edNumMentions" value="${t.edNumMentions}"/>
								</div>
							</div>
							<div class="fl bianmatb">文章数</div>
							<div class="fl clearfix">
								<div class="fl" style="width:149px !important;">
									<input style="width:42px;" class="default_input2 fl" type="text" name="stNumArticles" value="${t.stNumArticles}"/>
									<span class="fl ljX_1">—</span>
									<input style="width:42px;" class="default_input2 fl" type="text" name="edNumArticles" value="${t.edNumArticles}"/>
								</div>
							</div>
							<div class="fl bianmatb">信源数</div>
							<div class="fl clearfix">
								<div class="fl" style="width:149px !important;">
									<input style="width:42px;" class="default_input2 fl" type="text" name="stNumSources" value="${t.stNumSources}"/>
									<span class="fl ljX_1">—</span>
									<input style="width:42px;" class="default_input2 fl" type="text" name="edNumSources" value="${t.edNumSources}"/>
								</div>
							</div>
						</li>
					</div>
				</ul>
				</div>
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
									<td><font class="sbFont">GLOBALEVENTID</font> : 454094217</td>
									<td><font class="sbFont">DATEADDED :</font> 20181011</td>
									<td><font class="sbFont">Actor1Code :</font> CAN</td>
									<td><font class="sbFont">Actor1Name :</font> CANADIAN</td>
									<td><font class="sbFont">Actor1CountryCode :</font> CAN</td>
								</tr>
								<tr>
									<td><font class="sbFont">Actor1KnownGroupCode :</font> IRC</td>
									<td><font class="sbFont">Actor1EthnicCode :</font> kur</td>
									<td><font class="sbFont">Actor1Religion1Code :</font> CHR</td>
									<td><font class="sbFont">Actor1Religion2Code :</font> SUN</td>
									<td><font class="sbFont">Actor1Type1Code :</font> UAF</td>
								</tr>
								<tr>
									<td><font class="sbFont">Actor1Type2Code :</font> HRI</td>
									<td><font class="sbFont">Actor1Type3Code :</font> GOV</td>
									<td><font class="sbFont">Actor2Code :</font> GBRGOV</td>
									<td><font class="sbFont">Actor2Name :</font> UNITED KINGDOM</td>
									<td><font class="sbFont">Actor2CountryCode :</font> GBR</td>
								</tr>
								<tr>
									<td><font class="sbFont">Actor2KnownGroupCode :</font> IRC</td>
									<td><font class="sbFont">Actor2EthnicCode :</font> kur</td>
									<td><font class="sbFont">Actor2Religion1Code :</font> CHR</td>
									<td><font class="sbFont">Actor2Religion2Code :</font> SUN</td>
									<td><font class="sbFont">Actor2Type1Code :</font> UAF</td>
								</tr>
								<tr>
									<td><font class="sbFont">Actor2Type2Code :</font> HRI</td>
									<td><font class="sbFont">Actor2Type3Code :</font> GOV</td>
									<td><font class="sbFont">IsRootEvent :</font> 1</td>
									<td><font class="sbFont">EventCode :</font> 35</td>
									<td><font class="sbFont">EventBaseCode :</font> 12</td>
								</tr>
								<tr>
									<td><font class="sbFont">EventRootCode :</font> 13</td>
									<td><font class="sbFont">QuadClass :</font> 3</td>
									<td><font class="sbFont">GoldsteinScale :</font> -6.5</td>
									<td><font class="sbFont">NumMentions :</font> 23</td>
									<td><font class="sbFont">NumSources :</font> 33</td>
								</tr>
								<tr>
									<td><font class="sbFont">NumArticles :</font> 22</td>
									<td><font class="sbFont">AvgTone :</font> 0.55555555555555</td>
									<td><font class="sbFont">Actor1Geo_Type :</font> 3</td>
									<td><font class="sbFont">Actor1Geo_FullName :</font> Oakland Community College, Michigan, United S</td>
									<td><font class="sbFont">Actor1Geo_CountryCode :</font> US</td>
								</tr>
								<tr>
									<td><font class="sbFont">Actor1Geo_ADM1Code :</font> USMI</td>
									<td><font class="sbFont">Actor1Geo_Lat :</font> 42.4928000</td>
									<td><font class="sbFont">Actor1Geo_Long :</font> -83.3705000</td>
									<td><font class="sbFont">Actor1Geo_FeatureID :</font> 633876</td>
									<td><font class="sbFont">Actor2Geo_Type :</font> 3</td>
								</tr>
								<tr>
									<td><font class="sbFont">Actor2Geo_Type :</font> 3</td>
									<td><font class="sbFont">Actor2Geo_FullName :</font> Oakland Community College, Michigan, United S</td>
									<td><font class="sbFont">Actor2Geo_CountryCode :</font> US</td>
									<td><font class="sbFont">Actor2Geo_ADM1Code :</font> USMI</td>
									<td><font class="sbFont">Actor2Geo_Lat :</font> 42.4928000</td>
								</tr>
								<tr>
									<td><font class="sbFont">Actor2Geo_Long :</font> -83.3705000</td>
									<td><font class="sbFont">Actor2Geo_FeatureID :</font> 633876</td>
									<td><font class="sbFont">ActionGeo_Type :</font> 3</td>
									<td><font class="sbFont">ActionGeo_FullName :</font> Oakland Community College, Michigan, United S</td>
									<td><font class="sbFont">ActionGeo_CountryCode :</font> US</td>
								</tr>
								<tr>
									<td><font class="sbFont">ActionGeo_ADM1Code :</font> USMI</td>
									<td><font class="sbFont">ActionGeo_Lat :</font> 42.4928000</td>
									<td><font class="sbFont">ActionGeo_Long :</font> -83.3705000</td>
									<td><font class="sbFont">ActionGeo_FeatureID :</font> 633876</td>
									<td></td>
								</tr> 
								<tr>
									<td><font class="sbFont">SOURCEURL :</font> http://www.independent.ie/world-news/europe/calais-crisis-hits-fever-pitch-in-catandmouse-with-migrants-31419889.html</td>
								</tr> 
							</table>
							<div class="gjcx_al_box">
								<table class="gjcx_al_tb">
									<tr>
									<td><font class="sbFont">关键字提示 :</font> 并 and,或 or,等于 =,不等于 !=,大于等于 >=,小于等于 <=,模糊匹配 like,模糊不匹配  not like,范围查询 in,不在范围查询 not in</td>
									</tr> 
									<tr>
										<td><font class="sbFont">案例SQL :</font> (ActionGeo_FullName like '%china%' or ActionGeo_FullName not like '%white House%') or Actor1Code not in('CAN','CHN') and ActionGeo_Type in (3,4,5)</td>
									</tr>
								</table>
							</div>
							<textarea class="texthtml" name="customQuery" readonly>${t.customQuery}</textarea>
				        </div>
				    </div>
				</div>
		      </c:forEach>
		      <!-- 即时查询 -->
				<div class="tab_down people_tab_down w-position" style="position:relative; ">
				<form id="eventQueryForm" action="../config/renGongQuery" method="post">
				<input type="hidden" name="flid" id="RGFL">
				<input type="hidden" name="priority" value="1"/>
				<input type="hidden" name="configFlag" value="1"/>
				<input type="hidden" name="configCategoriesStr" id="modelType"/>
				<input type="hidden" name="remark" value="即时查询"/>
				<div class="high_search_con" style="margin-top: 30px;">
					<ul class="tab_down_info">
						<li class="clearfix">
							<div class="date_box clearfix">
								<div class="td1 fl">
									<p class="time_png fl"></p>
									<b>日期属性：</b>
								</div>
								<div style="position:absolute; left:226px; top:-20px">当前数据库时间范围：<span id="stDateSpan"></span>至<span id="edDateSpan"></span></div>
								<div class="clearfix">
									<div class="td2 fl b_e_date">起止日期</div>
									<div class="td3_2 fl">
										<label class="lab2" for=""><input class="inp_selc day1" name="stDates" id="stDates" type="text" readonly/></label>
									</div>
									<div class="fl width18"></div>
									<div class="td3_2 fl">
										<label class="lab2" for=""><input class="inp_selc day2" name="edDates" id="edDates" type="text" readonly/></label>
									</div>
									<div class="add_date_btn"></div>
								</div>
								<div class="high_search high_search_js" style="margin-top: -40px;">高级查询</div>
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
							<div class="td1 fl"><p class="ids_png fl"></p><b>权重依据：</b></div>
							<div class="td5_event fl"><input id="radio1" type="radio" name="weightFlag" checked="checked" value="1"><label for="radio1"> 事件数</label></div>
							<div class="td5_event fl"><input id="radio2" type="radio" name="weightFlag" value="2"><label for="radio2"> 文章数</label></div>
							<div class="td5_event fl"><input id="radio3" type="radio" name="weightFlag" value="3"><label for="radio3"> 信源数</label></div>
							<div class="td5_event fl"><input id="radio4" type="radio" name="weightFlag" value="4"><label for="radio4"> 事件数(去重)</label></div>
						</li>
						<!-- 统计依据 -->
						<li class="clearfix bizhong" style="display: none;">
							<div class="td1 fl"><p class="tjyj_png fl"></p><b>统计依据：</b></div>
							<div class="td5_event fl"><input id="radio11" type="radio" name="valueWeight" checked="checked" value="1"><label for="radio11"> 比重</label></div>
							<div class="td5_event fl"><input id="radio22" type="radio" name="valueWeight" value="2"><label for="radio22"> 数量</label></div>
						</li>
						<!-- 国家关系展示模块附加参数 -->
						<li class="clearfix zindex99 countryRelation" style="display: none;">
							<div class="td1 fl"><p class="event_property_png fl" style="margin-top: 0 !important;"></p><b>参数设置：</b></div>
							<div class="fl clearfix">
								<div  class="td2_2 fl"><span class="span1">国家关系</span></div>
								<div class="fl">
									年参数一：<input style="width:38px;padding: 1px 5px !important;" class="default_input norm1" type="text" name="yearNorm1" id="yearNorm1"/>    年参数二：<input style="width:38px;padding: 1px 5px !important;" class="default_input norm2" type="text" name="yearNorm2" id="yearNorm2"/>
									月参数一：<input style="width:38px;padding: 1px 5px !important;" class="default_input norm1" type="text" name="monthNorm1" id="monthNorm1"/>    月参数二：<input style="width:38px;padding: 1px 5px !important;" class="default_input norm2" type="text" name="monthNorm2" id="monthNorm2"/>
									周参数一：<input style="width:38px;padding: 1px 5px !important;" class="default_input norm1" type="text" name="weekNorm1" id="weekNorm1"/>    周参数二：<input style="width:38px;padding: 1px 5px !important;" class="default_input norm2" type="text" name="weekNorm2" id="weekNorm2"/>
									天参数一：<input style="width:38px;padding: 1px 5px !important;" class="default_input norm1" type="text" name="dateNorm1" id="dateNorm1"/>    天参数二：<input style="width:38px;padding: 1px 5px !important;" class="default_input norm2" type="text" name="dateNorm2" id="dateNorm2"/>
								</div>
								<img class="hoverImg" src="<%=basePath %>/static/images/detail.png" style="margin-top: 3px;margin-left: 15px;">
								<span style="display: none;">国家关系参数值，非必填项。（只能填入数字）</span>
							</div>
						</li>
						<div class="ulli ulli_js">
						<li class="clearfix zindex99" id="actorModel">
							<div class="td1 fl"><p class="people_png fl"></p><b>角色属性：</b></div>
							<div class="fl clearfix">
								<div  class="td2_2 fl"><span class="span1">角色1</span></div>
								<div class="clearfix event_condtion4_two" >
									<!-- "国家"角色属性值 -->
									<div class="fl guojiatb" style="width: 66px;margin-left: -10px;">国家(地区)</div>
									<div class="width-150 fl" id="actor1Countrycode" ></div>
									<input type="hidden" id="countrycodeactor1" name="countrycodeactor1"/>
									<input type="hidden" name="actor1Attrs" value="1"/>
									<!-- "组织名"角色属性 -->
									<div class="fl bianmatb"  style="width: 62px;">组织</div>
									<div class="fl clearfix">
										<div class="width-150 fl" id="actor1organizationcode"></div>
										<input type="hidden" id="organizationcodeactor1" name="organizationcodeactor1"/>
									</div>
									<input type="hidden" name="actor1Attrs" value="2" />
									
									<!-- "宗教1"角色属性 -->
									<div class="fl bianmatb">宗教1</div>
									<div class="fl clearfix">
										<div class="width-150 fl" id="actor1Religion1Code1"></div>
										<input type="hidden" id="religion1CodeActor1" name="religion1CodeActor1"/>
									</div>
									<input type="hidden" name="actor1Attrs" value="3" />
									<!-- "宗教2"角色属性 -->
									<div class="fl bianmatb">宗教2</div>
										<div class="fl clearfix">
											<div class="width-150 fl" id="actor1Religion1Code2"></div>
											<input type="hidden" id="religion2CodeActor1" name="religion2CodeActor1"/>
										</div>
									<input type="hidden" name="actor1Attrs" value="4" />
								</div>
								<div class="clearfix"  style=" margin-left:82px; margin-top:10px;">
									<!-- "种族"角色属性 -->
									<div class="fl bianmatb">种族</div>
									<div class="fl clearfix">
										<div class="width-150 fl" id="actor1EthnicCode"></div>
										<input type="hidden" id="ethnicCodeactor1" name="ethnicCodeactor1"/>
									</div>
									<input type="hidden" name="actor1Attrs" value="5"/>
									<!-- "种类1"角色属性 -->
									<div class="fl bianmatb"  style="width: 62px;">种类1</div>
									<div class="fl clearfix">
										<div class="width-150 fl" id="actor1TypeCode1"></div>
										<input type="hidden" id="typeCode1actor1" name="typeCode1actor1"/>
									</div>
									<input type="hidden" name="actor1Attrs" value="6" />
									<!-- "种类2"角色属性 -->
									<div class="fl bianmatb">种类2</div>
									<div class="fl clearfix">
										<div class="width-150 fl" id="actor1TypeCode2"></div>
										<input type="hidden" id="typeCode2actor1" name="typeCode2actor1"/>
									</div>
									<input type="hidden" name="actor1Attrs" value="7" />
									<!-- "种类3"角色属性 -->
									<div class="fl bianmatb">种类3</div>
									<div class="fl clearfix">
										<div class="width-150 fl" id="actor1TypeCode3"></div>
										<input type="hidden" id="typeCode3actor1" name="typeCode3actor1"/>
									</div>
									<input type="hidden" name="actor1Attrs" value="8" />
							</div>
							<!-- 角色一地理种类下拉框 -->
							<div class="clearfix event_condtion4_one">
								
								<div class="fl guojiatb">地理类型</div>
								<div class="fl clearfix">
									<div class="dowebok26 width-150">
										<select id="actor1Geographictype"  name="actor1Geographictype">
											<option value="0" selected="selected">请选择</option>
											<option value="1">国家(地区)</option>
											<option value="2">州省</option>
											<option value="3">城市</option>
										</select>
									</div>
								</div>
								<div class="clearfix event_condtion4_two">
									<!-- 角色1地理位置-国家-->
									<div class="fl guojiatb" style="width: 62px;">国家/州省</div>
									<div id="actor1geographyCountry" class="width-150"></div>
									<input type="hidden" id="geographyCountryactor1" name="geographyCountryactor1"/>
								</div>
								<div class="tishi_tb_js">逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如  (A && B && !D)||C  </div>
								<div style="margin-left: -7px;width: 63px;float: left;padding-top: 1px;">地理全称</div>
								<div class="radio_box">
									<input class="condition_info_graph_ids2 fl" style="width: 500px;" type="text" id="eventKeyWordactor1" name="eventKeyWordactor1" onblur="validateKeyWordsRG(this)"/>
									<span id="keywordSpanactor1" style="position:relative;left:20px;width:40px;color: red"></span>
								</div>
								<div style="margin-left: 10px;float: left;"><input type="checkbox" style="vertical-align: middle;margin: 0 0 0 0;" value="0" checked name="eventKeyWordactor1IsBig">区分大小写</div>
							</div>
							
							<div class="fl clearfix">
								<div class="clearfix event_condtion4_three">
									<div class="td2_2 fl"><span class="span1">角色2</span></div>
									<!-- "国家"角色属性值 -->
										<div class="fl guojiatb" style="width: 66px;margin-left: -10px;">国家(地区)</div>
										<div class="fl clearfix">
											<div class="width-150 fl" id="actor2Countrycode" ></div>
											<input type="hidden" id="countrycodeactor2" name="countrycodeactor2"/>
										</div>
										<input type="hidden" name="actor2Attrs" value="1"/>
										<!-- "组织名"角色属性 -->
										<div class="fl bianmatb"  style="width: 62px;">组织</div>
										<div class="fl clearfix">
											<div class="width-150 fl" id="actor2organizationcode" ></div>
											<input type="hidden" id="organizationcodeactor2" name="organizationcodeactor2"/>
										</div>
										<input type="hidden" name="actor2Attrs" value="2" />
										
										<!-- "宗教1"角色属性 -->
										<div class="fl bianmatb">宗教1</div>
										<div class="fl clearfix">
											<div class="width-150 fl" id="actor2Religion1Code1"></div>
											<input type="hidden" id="religion1CodeActor2" name="religion1CodeActor2"/>
										</div>
										<input type="hidden" name="actor2Attrs" value="3" />
										
										<!-- "宗教2"角色属性 -->
										<div class="fl bianmatb">宗教2</div>
										<div class="fl clearfix">
											<div class="width-150 fl" id="actor2Religion1Code2"></div>
											<input type="hidden" id="religion2CodeActor2" name="religion2CodeActor2"/>
										</div>
										<input type="hidden" name="actor2Attrs" value="4" />
								    </div>		
									<div class="clearfix event_condtion4_one">
										<!-- "种族"角色属性 -->
										<div class="fl bianmatb">种族</div>
										<div class="fl clearfix">
											<div class="width-150 fl" id="actor2EthnicCode" ></div>
											<input type="hidden" id="ethnicCodeactor2" name="ethnicCodeactor2"/>
										</div>
										<input type="hidden" name="actor2Attrs" value="5" />
										<!-- "种类1"角色属性 -->
										<div class="fl bianmatb"  style="width: 62px;">种类1</div>
										<div class="fl clearfix">
											<div class="width-150 fl" id="actor2TypeCode1"></div>
											<input type="hidden" id="typeCode1actor2" name="typeCode1actor2"/>
										</div>
										<input type="hidden" name="actor2Attrs" value="6" />
										<!-- "种类2"角色属性 -->
										<div class="fl bianmatb">种类2</div>
										<div class="fl clearfix">
											<div class="width-150 fl" id="actor2TypeCode2" ></div>
											<input type="hidden" id="typeCode2actor2" name="typeCode2actor2"/>
										</div>
										<input type="hidden" name="actor2Attrs" value="7" />
										<!-- "种类3"角色属性 -->
										<div class="fl bianmatb">种类3</div>
										<div class="fl clearfix">
											<div class="width-150 fl" id="actor2TypeCode3" ></div>
											<input type="hidden" id="typeCode3actor2" name="typeCode3actor2"/>
										</div>
										<input type="hidden" name="actor2Attrs" value="8" />
									</div>	
									<!-- 角色二地理种类下拉框 -->
									<div class="clearfix event_condtion4_one">
										
										<div class="fl guojiatb">地理类型</div>
										<div class="fl clearfix">
											<div class="dowebok28 width-150">
												<select id="actor2Geographictype" name="actor2Geographictype">
													<option value="0" selected="selected">请选择</option>
													<option value="1">国家(地区)</option>
													<option value="2">州省</option>
													<option value="3">城市</option>
												</select>
											</div>
										</div>
										<div class="clearfix event_condtion4_two">
											<!-- 角色2地理位置-国家-->
												<div class="fl guojiatb"  style="width: 62px;" >国家/州省</div>
												<div class="width-150" id="actor2geographyCountry" ></div>
												<input type="hidden" id="geographyCountryactor2" name="geographyCountryactor2"/>
										</div>
										<div class="tishi_tb_js">逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如  (A && B && !D)||C </div>
										<div style="margin-left: -7px;width: 63px;float: left;padding-top: 1px;">地理全称</div>
										<div class="radio_box">
											<input class="condition_info_graph_ids2 fl" style="width: 500px;" type="text" id="eventKeyWordactor2" name="eventKeyWordactor2" onblur="validateKeyWordsRG(this)"/>
											<span id="keywordSpanactor2" style="position:relative;left:20px;width:40px;color: red"></span>
										</div>
										<div style="margin-left: 10px;float: left;"><input type="checkbox" style="vertical-align: middle;margin: 0 0 0 0;" value="0" checked name="eventKeyWordactor2IsBig">区分大小写</div>
									</div>
									
							    </div>
							</div>
						</li>
						<!-- 事件属性 -->
						<li class="clearfix" id="eventProperty">
							<div class="td1 fl"><p class="event_property_png fl"></p><b style="line-height:15px;">事件属性：</b></div>
							<div class="fl clearfix" style="width:954px;">
								<div  class="td2_2 fl"><span class="span1">类型</span></div>
								<div class="clearfix fl">
									<!-- 大类-->
									<div class="fl guojiatb">大类</div>
									<div class="fl clearfix">
										<div class="width-150 fl" id="quadClass"></div>
										<input type="hidden" id="quadClassData" name="quadClassData"/>
									</div>
									<input type="hidden" name="eventAttrs" value="1"/>
									<!-- 根类 -->
									<div class="fl bianmatb"  style="width: 62px;">根类</div>
									<div class="fl clearfix">
										<div class="width-150 fl" id="rootEvent" ></div>
										<input type="hidden" id="rootEventData" name="rootEventData"/>
									</div>
									<input type="hidden" name="eventAttrs" value="2" />
									
									<!-- 基类 -->
									<div class="fl bianmatb">基类</div>
									<div class="fl clearfix">
										<div class="width-150 fl" id="baseEvent" ></div>
										<input type="hidden" id="baseEventData" name="baseEventData"/>
									</div>
									<input type="hidden" name="eventAttrs" value="3" />
									
									<!-- 全事件 -->
									<div class="fl bianmatb">子类</div>
									<div class="fl clearfix">
										<div class="width-150 fl" id="eventCode" ></div>
										<input type="hidden" id="codeEventData" name="codeEventData"/>
									</div>
									<input type="hidden" name="eventAttrs" value="4" />
								</div>
								
								<!-- 发生地 -->
								<div class="fl clearfix" style="margin-left: -82px;">
									<div class="clearfix fl event_condtion4_three">
										<div class="td2_2 fl"><span class="span1">发生地</span></div>
										<div class="fl guojiatb">地理类型</div>
										<div class="fl clearfix">
											<div class="dowebok29 width-150">
												<select id="actorGeographictype"  name="Geographictype">
													<option value="0" selected="selected">请选择</option>
													<option value="1">国家(地区)</option>
													<option value="2">州省</option>
													<option value="3">城市</option>
												</select>
											</div>
										</div>
										<!-- 发生地国家 -->
										<div class="fl guojiatb"  style="width: 62px;">国家/州省</div>
										<div class="fl clearfix">
											<div class="width-150" id="actorgeographyCountry" ></div>
											<input type="hidden" id="geographyCountryactor" name="geographyCountryactor"/>
										</div>
										<input type="hidden" name="eventAttrs" value="6" />
										<div style="margin-bottom:2px;margin-top: 38px;margin-left: 139px;">逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如  (A && B && !D)||C  </div>
										<div style="float: left;margin-left: 88px;">地理全称</div>
										<div class="fl">
											<input class="condition_info_graph_ids2 fl" style="width: 500px;margin-left: 3px;" type="text" id="eventKeyWordactor" name="eventKeyWordactor" onblur="validateKeyWordsRG(this)"/>
											<span id="keywordSpanactor" style="position:relative;left:20px;width:40px;color: red"></span>
										</div>
										<div style="margin-left: 10px;float: left;"><input type="checkbox" style="vertical-align: middle;margin: 0 0 0 0;" value="0" checked name="eventKeyWordactorIsBig">区分大小写</div>
								    </div>		
							    </div>
							    <!-- 其他 -->
							    <div class="fl clearfix">
									<div class="clearfix fl event_condtion4_three">
										<div class="td2_2 fl"><span class="span1">其他</span></div>
										<!-- 源URL -->
										<div class="fl bianmatb">源URL</div>
										<div class="fl clearfix">
											<div class="fl width-150">
												<input type="hidden" name="eventAttrs"  value="8" />
												<input class="default_input2" id="eventAttr8" style="width: 150px;" type="text" name="eventAttrValues" value=""/>
											</div>
										</div>
										<!-- 情感值 -->
										<div class="fl bianmatb">情感值</div>
										<div class="fl width116 clearfix">
											<div class="fl width116">
												<input type="hidden" name="eventAttrs" value="9" />
												<input style="width:50px;" id="eventAttr9" class="default_input2 fl" type="text" value="-100" name ="eventAttrValues" onblur="validateEventAttr9()"/>
												<span class="fl ljX_1">—</span>
												<input type="hidden" name="eventAttrs" value="10" />
												<input style="width:50px;" id="eventAttr10" class="default_input2 fl" type="text" value="100" name ="eventAttrValues" onblur="validateEventAttr10()"/>
												<span id="spang" style="display:none;float: right;"><img src="<%=basePath %>/static/images/delete.png" style="margin-top: -2px;"></img></span>
											</div>
										</div>
										<!-- 影响度 -->
										<div class="fl bianmatb">影响度</div>
										<div class="fl width116 clearfix">
											<div class="fl width116">
												<input type="hidden" name="eventAttrs" value="11" />
												<input style="width:42px;" id="eventAttr11" class="default_input2 fl" type="text" value="-10" name ="eventAttrValues" onblur="validateEventAttr11()"/>
												<span class="fl ljX_1">—</span>
												<input type="hidden" name="eventAttrs" value="12" />
												<input style="width:42px;" id="eventAttr12" class="default_input2 fl" type="text" value="10" name ="eventAttrValues"  onblur="validateEventAttr12()"/>
												<span id="spanh" style="display:none;float: right;"><img src="<%=basePath %>/static/images/delete.png" style="margin-top: -2px;"></img></span>
											</div>
										</div>
										<!-- 是否为根类 -->
										<div class="fl bianmatb" style="width: 62px;" >是否根类</div>
										<div class="fl clearfix">
											<div class="fl width116" style="width:80px;">
												<div class="dowebok19 sec_gen">
													<input type="hidden" name="eventAttrs"  value="7" />
													<select name="eventAttrValues" id="eventAttr7">
														<option value="-1" selected="selected">请选择</option>
														<option value="0">否</option>
														<option value="1">是</option>
													</select>
												</div>
											</div>
										</div>	
							    	</div>
								</div>
							</div>
						</li>
						<!-- 自定义查询 -->
						<!-- <li class="clearfix">
							<div class="td1 fl"><p class="weight_png fl"></p><b>高级查询：</b></div>
							<div class="clearfix fl event_condtion4_two homeNotShow">
								<div style="margin-left: -7px;width: 63px;float: left;padding-top: 4px;">自定义查询</div>
								<div class="fl" style="float: left;">
									<input class="condition_info_graph_ids2 fl" style="width: 500px;" type="text" id="customQuery" name="customQuery"/>
								</div>
							</div>
						</li> -->
						
						<li class="clearfix quanzhongkuang" style="display: none;">
							<div class="td1 fl"><p class="weight_png fl"></p><b>权重值：</b></div>
							<div class="td1 fl"><p></p><b> </b></div>
							<div class="fl bianmatb">事件数</div>
							<div class="fl clearfix">
								<div class="fl" style="width:149px !important;">
									<input style="width:42px;" class="default_input2 fl" type="text" id="stNumMentions" name="stNumMentions"/>
									<span class="fl ljX_1">—</span>
									<input style="width:42px;" class="default_input2 fl" type="text" id="edNumMentions" name="edNumMentions"/>
								</div>
							</div>
							<div class="fl bianmatb">文章数</div>
							<div class="fl clearfix">
								<div class="fl" style="width:149px !important;">
									<input style="width:42px;" class="default_input2 fl" type="text" id="stNumArticles" name="stNumArticles"/>
									<span class="fl ljX_1">—</span>
									<input style="width:42px;" class="default_input2 fl" type="text" id="edNumArticles" name="edNumArticles"/>
								</div>
							</div>
							<div class="fl bianmatb">信源数</div>
							<div class="fl clearfix">
								<div class="fl" style="width:149px !important;">
									<input style="width:42px;" class="default_input2 fl" type="text" id="stNumSources" name="stNumSources"/>
									<span class="fl ljX_1">—</span>
									<input style="width:42px;" class="default_input2 fl" type="text" id="edNumSources" name="edNumSources"/>
								</div>
							</div>
						</li>
						<li class="clearfix">
							<div class="fr">
								<div style=" float:left; margin-right:10px; margin-top:4px;">保存配置：<input class="artificial_radio oldRadio" name="isSaveConfig" id="isSaveConfig" value="0" type="radio" onclick="$('#rgConfigName').show()">是<input class="artificial_radio oldRadio" type="radio" name="isSaveConfig" value="1" checked onclick="$('#rgConfigName').hide()">否</div>
								<div style=" float:left; margin-right:10px;display: none; margin-top:4px;" id="rgConfigName">配置名称：<input class="default_input" style="padding: 1px 8px;" type="text" id="configName" name="configName"></div>
								<div style=" float:left;"><input class="submit2" type="button" onclick="eventRGQuery(1)" value="提交"></div>
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
									<td><font class="sbFont">GLOBALEVENTID</font> : 454094217</td>
									<td><font class="sbFont">DATEADDED :</font> 20181011</td>
									<td><font class="sbFont">Actor1Code :</font> CAN</td>
									<td><font class="sbFont">Actor1Name :</font> CANADIAN</td>
									<td><font class="sbFont">Actor1CountryCode :</font> CAN</td>
								</tr>
								<tr>
									<td><font class="sbFont">Actor1KnownGroupCode :</font> IRC</td>
									<td><font class="sbFont">Actor1EthnicCode :</font> kur</td>
									<td><font class="sbFont">Actor1Religion1Code :</font> CHR</td>
									<td><font class="sbFont">Actor1Religion2Code :</font> SUN</td>
									<td><font class="sbFont">Actor1Type1Code :</font> UAF</td>
								</tr>
								<tr>
									<td><font class="sbFont">Actor1Type2Code :</font> HRI</td>
									<td><font class="sbFont">Actor1Type3Code :</font> GOV</td>
									<td><font class="sbFont">Actor2Code :</font> GBRGOV</td>
									<td><font class="sbFont">Actor2Name :</font> UNITED KINGDOM</td>
									<td><font class="sbFont">Actor2CountryCode :</font> GBR</td>
								</tr>
								<tr>
									<td><font class="sbFont">Actor2KnownGroupCode :</font> IRC</td>
									<td><font class="sbFont">Actor2EthnicCode :</font> kur</td>
									<td><font class="sbFont">Actor2Religion1Code :</font> CHR</td>
									<td><font class="sbFont">Actor2Religion2Code :</font> SUN</td>
									<td><font class="sbFont">Actor2Type1Code :</font> UAF</td>
								</tr>
								<tr>
									<td><font class="sbFont">Actor2Type2Code :</font> HRI</td>
									<td><font class="sbFont">Actor2Type3Code :</font> GOV</td>
									<td><font class="sbFont">IsRootEvent :</font> 1</td>
									<td><font class="sbFont">EventCode :</font> 35</td>
									<td><font class="sbFont">EventBaseCode :</font> 12</td>
								</tr>
								<tr>
									<td><font class="sbFont">EventRootCode :</font> 13</td>
									<td><font class="sbFont">QuadClass :</font> 3</td>
									<td><font class="sbFont">GoldsteinScale :</font> -6.5</td>
									<td><font class="sbFont">NumMentions :</font> 23</td>
									<td><font class="sbFont">NumSources :</font> 33</td>
								</tr>
								<tr>
									<td><font class="sbFont">NumArticles :</font> 22</td>
									<td><font class="sbFont">AvgTone :</font> 0.55555555555555</td>
									<td><font class="sbFont">Actor1Geo_Type :</font> 3</td>
									<td><font class="sbFont">Actor1Geo_FullName :</font> Oakland Community College, Michigan, United S</td>
									<td><font class="sbFont">Actor1Geo_CountryCode :</font> US</td>
								</tr>
								<tr>
									<td><font class="sbFont">Actor1Geo_ADM1Code :</font> USMI</td>
									<td><font class="sbFont">Actor1Geo_Lat :</font> 42.4928000</td>
									<td><font class="sbFont">Actor1Geo_Long :</font> -83.3705000</td>
									<td><font class="sbFont">Actor1Geo_FeatureID :</font> 633876</td>
									<td><font class="sbFont">Actor2Geo_Type :</font> 3</td>
								</tr>
								<tr>
									<td><font class="sbFont">Actor2Geo_Type :</font> 3</td>
									<td><font class="sbFont">Actor2Geo_FullName :</font> Oakland Community College, Michigan, United S</td>
									<td><font class="sbFont">Actor2Geo_CountryCode :</font> US</td>
									<td><font class="sbFont">Actor2Geo_ADM1Code :</font> USMI</td>
									<td><font class="sbFont">Actor2Geo_Lat :</font> 42.4928000</td>
								</tr>
								<tr>
									<td><font class="sbFont">Actor2Geo_Long :</font> -83.3705000</td>
									<td><font class="sbFont">Actor2Geo_FeatureID :</font> 633876</td>
									<td><font class="sbFont">ActionGeo_Type :</font> 3</td>
									<td><font class="sbFont">ActionGeo_FullName :</font> Oakland Community College, Michigan, United S</td>
									<td><font class="sbFont">ActionGeo_CountryCode :</font> US</td>
								</tr>
								<tr>
									<td><font class="sbFont">ActionGeo_ADM1Code :</font> USMI</td>
									<td><font class="sbFont">ActionGeo_Lat :</font> 42.4928000</td>
									<td><font class="sbFont">ActionGeo_Long :</font> -83.3705000</td>
									<td><font class="sbFont">ActionGeo_FeatureID :</font> 633876</td>
									<td></td>
								</tr> 
								<tr>
									<td><font class="sbFont">SOURCEURL :</font> http://www.independent.ie/world-news/europe/calais-crisis-hits-fever-pitch-in-catandmouse-with-migrants-31419889.html</td>
								</tr> 
							</table>
							<div class="gjcx_al_box">
								<table class="gjcx_al_tb">
									<tr>
									<td><font class="sbFont">关键字提示 :</font> 并 and,或 or,等于 =,不等于 !=,大于等于 >=,小于等于 <=,模糊匹配 like,模糊不匹配  not like,范围查询 in,不在范围查询 not in</td>
									</tr> 
									<tr>
										<td><font class="sbFont">案例SQL :</font> (ActionGeo_FullName like '%china%' or ActionGeo_FullName not like '%white House%') or Actor1Code not in('CAN','CHN') and ActionGeo_Type in (3,4,5)</td>
									</tr>
								</table>
							</div>
							<textarea class="texthtml" id="customQuery" name="customQuery"></textarea>
							<div class="fr" style="margin-top: 6px;color:rgb(189, 202, 230);">
								<div style=" float:left; margin-right:10px; margin-top:4px;">保存配置：<input class="artificial_radio newRadio" name="isSaveConfig2" id="isSaveConfig2" value="0" type="radio" onclick="$('#rgConfigName2').show()">是<input class="artificial_radio newRadio" type="radio" name="isSaveConfig2" value="1" checked onclick="$('#rgConfigName2').hide()">否</div>
								<div style=" float:left; margin-right:10px;display: none; margin-top:4px;" id="rgConfigName2">配置名称：<input class="default_input" style="padding: 1px 8px;" type="text" id="configName2" name="configName2"></div>
								<div style=" float:left;"><input class="submit2" type="button" onclick="eventRGQuery(2)" value="提交"></div>
							</div>
				        </div>
				    </div>
				    </div>
					</form>
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

$(function(){
	
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
		orientation:"auto",
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
		orientation:"auto",
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
	
	//下拉多选框数据
	countryCode = ${countryCode};
	organizationcode = ${organizationcode};
	ethnicCode = ${ethnicCode};
	religionCode = ${religionCode};
	typeCode = ${typeCode};
	quadClass = ${quadClass};
	rootEvent = ${rootEvent};
	baseEvent = ${baseEvent};
	eventCode = ${eventCode};
	geoCountryCode = ${geoCountryCode};
	//多选框加载数据
	getSelectCom();
	var ll = $("#PZLength").val();
	/////回显改变值
	updateConfigNew(ll);
	selectYearMonthDay();
	
	//鼠标移入时显示信息
	$(".hoverImg").hover(function () {
	    $(this).next().show();
	}, function () {
		$(this).next().hide();
	})
})
	function selectYearMonthDay(){
		//提示结束时间赋值
		$("#edDateSpan").html(configMaxDate);
		$("#stDateSpan").html(configMinDate);
		//重置时间插件的时间范围 注意：必须放置setDate之前
		$('.day1').datepicker('setStartDate',configMinDate); 
		$('.day2').datepicker('setEndDate',configMaxDate);
		//将时间范围的最大值、最小值放在开始时间和结束时间
		$('.day1').datepicker('setDate',configMinDate); 
		$('.day2').datepicker('setDate',configMaxDate);	
		$("#stDates").val(configMinDate);
		$("#edDates").val(configMaxDate);
	}
</script>
</html>