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
<title>对比展示</title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/style.css">
<link rel="stylesheet" id="main_link" href="<%=basePath%>/static/css/sec2.css">
<!-- 即时查询日期 -->
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath%>/static/lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/combo.select.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/perfect-scrollbar.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath%>/static/lib/pagination.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/base.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/css/event_result.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/js/amcharts/export/export.css" />
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/leaflet.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/dvf.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/example.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/ui.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/contrastmap.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/export.css" type="text/css" media="screen" />
<link rel="stylesheet" id="main_link" href="<%=basePath%>/static/css/sec2.css">
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window_zs.css"/><!-- 弹出提示框样式 -->
<!-- 两种皮肤切换 -->
<c:if test="${bgFlag == null or bgFlag == 1}">
	<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css"/>
	<link rel="stylesheet" href="<%=basePath %>/static/css/sec2.css">
	<link rel="stylesheet" href="<%=basePath %>/static/css/hsCheckData.css"/>
</c:if>
<c:if test="${bgFlag == 2}">
	<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.min.css"/>
	<link rel="stylesheet" href="<%=basePath %>/static/css/sec2_2.css">
	<link rel="stylesheet" href="<%=basePath %>/static/css/hsCheckData2.css"/>
</c:if>
<script src="<%=basePath%>/static/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath %>/static/js/config/config.js"></script>
<script src="<%=basePath%>/static/lib/jquery.pagination.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/hsCheckData.js"></script>
<body>
	<div class="index_top clearfix">
		<h3 class="fl title">事件库分析 > 对比展示</h3>
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
			<input type="hidden" id="moduleCode" value="${moduleCode}">
			<div class="row" style="height: 96%;">
	        	<div class="col-md-12 mg_t mg_b" style="margin:0;height: 100%;">
	        		<h3 class="tx-c mapText" style="margin:0;line-height:23px;">地理对比图
	        			<div  class="help" onmouseover="showChartInfo(1,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
	        		</h3>
		            <div id="bb" class="bor" style="height:calc(100% - 50px); ">
		                <div id="map" style="height:100%;"></div>
		                <div id="inbox">
							<div class="fab btn-group show-on-hover dropup">
								<div data-toggle="tooltip" data-placement="right" title="EXPORT"
									style="margin-left: 42px;">
									<button type="button" class="btn btn-io dropdown-toggle"
										data-toggle="dropdown">
										<span class="fa-stack"> <i
											class="fa fa-circle fa-stack-2x fab-backdrop"></i> <i
											class="fa fa-download fa-stack-1x fa-inverse fab-primary"></i>
											<i class="fa fa-download fa-stack-1x fa-inverse fab-secondary"></i>
										</span>
									</button>
								</div>
								<ul class="dropdown-menu dropdown-menu-right" role="menu">
									<li><a href="#" data-toggle="tooltip"
										data-placement="right" title="JSON" id="json_export"><i
											class="fa fa-file-code-o"></i></a></li>
									<li><a href="#" data-toggle="tooltip"
										data-placement="right" title="TXT" id="txt_export"><i
											class="fa fa-file-text-o"></i></a></li>
									<li><a href="#" data-toggle="tooltip"
										data-placement="right" title="CSV" id="csv_export"><i
											class="fa fa-file-excel-o"></i></a></li>
								</ul>
							</div>
						</div>
						<a id="download_csv" download="download.csv" href="#"
						style="display: none">download_csv</a> <a id="download_txt"
						download="download.txt" href="#" style="display: none">download_txt</a>
						<a id="download_json" download="download.json" href="#"
						style="display: none">download_json</a>
		            </div>
	            </div>
	        </div>
		</div>

		<c:if test="${typeList.size()>0 }">
			<input type="hidden" id="PZLength" value="${typeList.size()}"/>
		</c:if>
		<!-- 条件tab页 st -->
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
							<div class=" fl clearfix">
								<div  class="td2_2 fl"><span class="span1">角色1</span></div>
								<div class="clearfix event_condtion4_two">
									<!-- "国家"角色属性值 -->
									<div class="fl guojiatb">国家编码</div>
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
									<div class="fl bianmatb" style="width: 62px;">组织</div>
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
									<div class="fl bianmatb" style="width: 62px;">种类1</div>
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
							<!-- 角色一地理类型下拉框 -->
							<div class="clearfix event_condtion4_one">
								
								<div class="fl bianmatb">地理类型</div>
									<div class="fl width138 clearfix">
										<div class="td3 fl">
											<span class="span_huixian">
												<c:forEach  items="${t.eventGeoDl }" var = "tt">
													${tt.actor1Geographictype==1?'国家':tt.actor1Geographictype==2?'州省':tt.actor1Geographictype==3?'城市':''}
												</c:forEach>
											</span>
										</div>
									</div>
									<div class="clearfix event_condtion4_one">
											<!-- 角色1地理位置-国家-->
											<div class="fl guojiatb" style="margin-top: -10px;width: 62px;">国家/州省</div>
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
									<div class="tishi_tb">逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如  (A && B && !D)||C  </div>
									<div style="margin-left: -7px;width: 63px;float: left;padding-top: 1px;">地理全称</div>
									<div class="radio_box">
										<span class="condition_info_graph_ids2 fl" style="width: 500px;margin-left: 4px;" id="eventKeyWordactor1" name="eventKeyWordactor1" >
											${t.eventKeyWords.keywordsactor1}
										</span>
									</div>
							</div>
								
							<div class=" fl clearfix">
								<div class="clearfix event_condtion4_three">
									<div class="td2_2 fl"><span class="span1">角色2</span></div>
										<!-- "国家"角色属性值 -->
										<div class="fl guojiatb">国家编码</div>
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
										<div class="fl bianmatb" style="width: 62px;">组织</div>
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
										<div class="fl bianmatb" style="width: 62px;">种类1</div>
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
									<!-- 角色二地理类型下拉框 -->
									<div class="clearfix event_condtion4_one">
										
										<div class="fl guojiatb">地理类型</div>
											<div class="fl width138 clearfix">
												<div class="td3 fl">
													<span class="span_huixian">
														<c:forEach  items="${t.eventGeoDl }" var = "tt">
															${tt.actor2Geographictype==1?'国家':tt.actor2Geographictype==2?'州省':tt.actor2Geographictype==3?'城市':''}
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
											<div class="tishi_tb">逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如  (A && B && !D)||C </div>
											<div style="margin-left: -7px;width: 63px;float: left;padding-top: 1px;">地理全称</div>
											<div class="radio_box">
												<span class="condition_info_graph_ids2 fl" style="width: 500px;margin-left: 4px;" id="eventKeyWordactor2" >
													${t.eventKeyWords.keywordsactor2}
												</span>
											</div>
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
									<div class="fl bianmatb" style="width: 62px;">根类</div>
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
														${tt.geographictype==1?'国家':tt.geographictype==2?'州省':tt.geographictype==3?'城市':''}
													</c:forEach>
												</span>
											</div>
										</div>
										<div class="fl guojiatb" style="width: 62px;">国家/州省</div>
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
										<div style="float: left;margin-left: 87px;">地理全称</div>
										<div class="radio_box clearfix">
											<span class="condition_info_graph_ids2 fl" style="width: 500px;margin-left: 6px;" id="eventKeyWordactor" >
												${t.eventKeyWords.keywordsactor}
											</span>
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
												<span class="fl">—</span>
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
												<span class="fl">—</span>
												<span class="default_span fl ${indx.index}newNUM4">
													<c:forEach items="${t.eventInfo }"  var="m">
														${m.edgoldsteinScale}
													</c:forEach> 
												</span>
											</div>
										</div>
										<!-- 是否为根类 7-->
										<div class="fl bianmatb" style="width: 56px;">是否根类</div>
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
		      <!-- 即时查询 -->
				<div class="tab_down people_tab_down">
				<form id="eventQueryForm" action="../config/renGongQuery" method="post">
				<input type="hidden" name="flid" id="RGFL">
				<input type="hidden" name="priority" value="1"/>
				<input type="hidden" name="configFlag" value="1"/>
				<input type="hidden" name="configCategoriesStr" id="modelType"/>
				<input type="hidden" name="remark" value="即时查询"/>
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
										<label class="lab2" for=""><input class="inp_selc day1" name="stDates" type="text" readonly value="${curStDate[2]}" id="stDates"/></label>
									</div>
									<div class="td3_2 fl" style="margin-right:0px;">
										<label class="lab2" for=""><input class="inp_selc day2" name="edDates" type="text" readonly value="${curEdDate[2]}" id="edDates"/></label>
									</div>
									<div class="add_date_btn"></div>
								</div>
							</div>
						</li>
						<li class="clearfix zindex99" id="actorModel">
							<div class="td1 fl"><p class="people_png fl"></p><b>角色属性：</b></div>
							<div class="fl clearfix">
								<div  class="td2_2 fl"><span class="span1">角色1</span></div>
								<div class="clearfix event_condtion4_two" >
									<!-- "国家"角色属性值 -->
									<div class="fl guojiatb">国家编码</div>
									<div class="width-150 fl" id="actor1Countrycode" ></div>
									<input type="hidden" id="countrycodeactor1" name="countrycodeactor1"/>
									<input type="hidden" name="actor1Attrs" value="1"/>
									<!-- "组织名"角色属性 -->
									<div class="fl bianmatb" style="width: 62px;">组织</div>
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
									<div class="fl bianmatb" style="width: 62px;">种类1</div>
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
							<!-- 角色一地理类型下拉框 -->
							<div class="clearfix event_condtion4_one">
								
								<div class="fl guojiatb">地理类型</div>
								<div class="fl clearfix">
									<div class="dowebok26 width-150">
										<select id="actor1Geographictype"  name="actor1Geographictype">
											<option value="0" selected="selected">请选择</option>
											<option value="1">国家</option>
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
									<input class="condition_info_graph_ids2 fl" style="width: 500px;" type="text" id="eventKeyWordactor1" name="eventKeyWordactor1" onblur="validateKeyWords(this)"/>
									<span id="keywordSpanactor1" style="position:relative;left:20px;width:40px;color: red"></span>
								</div>
							</div>
							<div class="fl clearfix">
								<div class="clearfix event_condtion4_three">
									<div class="td2_2 fl"><span class="span1">角色2</span></div>
									<!-- "国家"角色属性值 -->
										<div class="fl guojiatb">国家编码</div>
										<div class="fl clearfix">
											<div class="width-150 fl" id="actor2Countrycode" ></div>
											<input type="hidden" id="countrycodeactor2" name="countrycodeactor2"/>
										</div>
										<input type="hidden" name="actor2Attrs" value="1"/>
										<!-- "组织名"角色属性 -->
										<div class="fl bianmatb" style="width: 62px;">组织</div>
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
										<div class="fl bianmatb" style="width: 62px;">种类1</div>
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
									<!-- 角色二地理类型下拉框 -->
									<div class="clearfix event_condtion4_one">
										
										<div class="fl guojiatb">地理类型</div>
										<div class="fl clearfix">
											<div class="dowebok28 width-150">
												<select id="actor2Geographictype" name="actor2Geographictype" >
													<option value="0" selected="selected">请选择</option>
													<option value="1">国家</option>
													<option value="2">州省</option>
													<option value="3">城市</option>
												</select>
											</div>
										</div>
										<div class="clearfix event_condtion4_two">
											<!-- 角色2地理位置-国家-->
												<div class="fl guojiatb" style="width: 62px;">国家/州省</div>
												<div class="width-150" id="actor2geographyCountry" ></div>
												<input type="hidden" id="geographyCountryactor2" name="geographyCountryactor2"/>
										</div>
										<div class="tishi_tb_js">逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如  (A && B && !D)||C </div>
										<div style="margin-left: -7px;width: 63px;float: left;padding-top: 1px;">地理全称</div>
										<div class="radio_box">
											<input class="condition_info_graph_ids2 fl" style="width: 500px;" type="text" id="eventKeyWordactor2" name="eventKeyWordactor2" onblur="validateKeyWords(this)"/>
											<span id="keywordSpanactor2" style="position:relative;left:20px;width:40px;color: red"></span>
										</div>
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
									<div class="fl bianmatb" style="width: 62px;">根类</div>
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
									<div class="fl bianmatb">全事件</div>
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
													<option value="1">国家</option>
													<option value="2">州省</option>
													<option value="3">城市</option>
												</select>
											</div>
										</div>
										<!-- 发生地国家 -->
										<div class="fl guojiatb" style="width: 62px;">国家/州省</div>
										<div class="fl clearfix">
											<div class="width-150" id="actorgeographyCountry" ></div>
											<input type="hidden" id="geographyCountryactor" name="geographyCountryactor"/>
										</div>
										<input type="hidden" name="eventAttrs" value="6" />
										<div style="margin-bottom:2px;margin-top: 38px;margin-left: 139px;">逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如  (A && B && !D)||C </div>
										<div style="float: left;margin-left: 87px;">地理全称</div>
										<div class="fl">
											<input class="condition_info_graph_ids2 fl" style="width: 500px;margin-left: 3px;" type="text" id="eventKeyWordactor" name="eventKeyWordactor" onblur="validateKeyWords(this)"/>
											<span id="keywordSpanactor" style="position:relative;left:20px;width:40px;color: red"></span>
										</div>
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
												<span class="fl">—</span>
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
												<span class="fl">—</span>
												<input type="hidden" name="eventAttrs" value="12" />
												<input style="width:42px;" id="eventAttr12" class="default_input2 fl" type="text" value="10" name ="eventAttrValues"  onblur="validateEventAttr12()"/>
												<span id="spanh" style="display:none;float: right;"><img src="<%=basePath %>/static/images/delete.png" style="margin-top: -2px;"></img></span>
											</div>
										</div>
										<!-- 是否为根类 -->
										<div class="fl bianmatb" >是否根类</div>
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
						<li class="clearfix">
							<div class="td1 fl"><p class="weight_png fl"></p><b>权重依据：</b></div>
							<div class="td5_event fl"><input id="radio1" type="radio" name="weightFlag" checked="checked" value="1"><label for="radio1"> 事件数</label></div>
							<div class="td5_event fl"><input id="radio2" type="radio" name="weightFlag" value="2"><label for="radio2"> 文章数</label></div>
							<div class="td5_event fl"><input id="radio3" type="radio" name="weightFlag" value="3"><label for="radio3"> 信源数</label></div>
							<div class="td5_event fl"><input id="radio4" type="radio" name="weightFlag" value="4"><label for="radio4"> 事件数(去重)</label></div>
						</li>
						<li class="clearfix">
							<div class="fr">
								<div style=" float:left; margin-right:10px; margin-top:4px;">保存配置：<input class="artificial_radio" name="isSaveConfig" id="isSaveConfig" value="0" type="radio" onclick="$('#rgConfigName').show()">是<input class="artificial_radio" type="radio" name="isSaveConfig" value="1" checked onclick="$('#rgConfigName').hide()">否</div>
								<div style=" float:left; margin-right:10px;display: none; margin-top:4px;" id="rgConfigName">配置名称：<input class="default_input" style="padding: 1px 8px;" type="text" id="configName" name="configName"></div>
								<div style=" float:left;"><input class="submit2" type="button" onclick="eventRGQuery()" value="提交"></div>
							</div>
						</li>
					</ul>
					</form>
				</div>
			</div>
	</div>
	<jsp:include page="../updateUserPassword.jsp"/>
</body>

<script src="<%=basePath%>/static/lib/jquery.pagination.js"></script>
<script src="<%=basePath%>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath%>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath%>/static/js/bootstrap-select.min.js"></script>
<script src="<%=basePath%>/static/js/jquery.combo.select.js"></script>
<script src="<%=basePath%>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath%>/static/js/perfect-scrollbar.js"></script>
<script src="<%=basePath%>/static/js/sec2.js"></script>
<script type="text/javascript">
	var bodyH = $(window).height();
	$(".index_bottom").height(bodyH - 50 );
	$(".data").height(bodyH - 50 );
</script>
<script type="text/javascript"
	src="<%=basePath%>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/static/Visualization/base/base.js"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/amcharts.js"
	type="text/javascript"></script>
<script
	src="<%=basePath%>/static/Visualization/js/amcharts/themes/light.js"
	type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amchart_util.js"
	type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/ammap.js"
	type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/ammap_util.js"
	type="text/javascript"></script>
<script
	src="<%=basePath%>/static/Visualization/js/amcharts/export/export.js"
	type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/leaflet.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/tile.stamen.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/underscore-min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/javascript.util.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/jsts.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/leaflet-dvf.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/leaflet.dvf.experimental.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/countryData.min.js"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/serial.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/js/map-tileLayer.js"	type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
<c:if test="${bgFlag == null or bgFlag == 1}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
</c:if>
<!-- 即时查询js -->
<script src="<%=basePath %>/static/Visualization/rgQuery.js"></script>	
<script type="text/javascript" src="<%=basePath%>/static/js/config/newShowConfig.js"></script>
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<script type="text/javascript">
	$(function(){
		//下拉框多选框数据
		countryCode = ${countryCode} ;
		organizationcode = ${organizationcode};
		ethnicCode = ${ethnicCode};
		religionCode = ${religionCode};
		typeCode = ${typeCode};
		quadClass = ${quadClass};
		rootEvent = ${rootEvent};
		baseEvent = ${baseEvent};
		eventCode = ${eventCode};
		geoCountryCode = ${geoCountryCode};
		//下拉框多选框加载
		getSelectCom();
		//处理配置
		handleConfigs();
		var ll = $("#PZLength").val();
		//回显改变值
		updateConfigNew(ll);
		//美化滚动条
		glorifyComboSelect();
		//提示结束时间赋值
		$("#edDateSpan").html('${maxDate[2] }');
		$("#stDateSpan").html('${minDate[2] }');
		$(".add_date_btn").show();
		//添加起止日期
		 data_html ="<div class='add_date clearfix addEventDate'>"+
	                        "<div class='td1 fl'>"+
	                            "<p class='fl'></p>"+
	                            "<b></b>"+
	                        "</div>"+
	                        "<div class='clearfix'>"+
	                            "<div class='td2 fl b_e_date'>起止日期</div>"+
	                            "<div class='td3_2 fl'>"+
	                                "<label class='lab2' for=''><input class='inp_selc day1' name='stDates' type='text' readonly value='${curStDate[2]}'/></label>"+
	                            "</div>"+
	                            "<div class='fl width18'></div>"+
	                            "<div class='td3_2 fl'>"+
	                                "<label class='lab2' for=''><input class='inp_selc day2' name='edDates' type='text' readonly value='${curEdDate[2]}'/></label>"+
	                            "</div>"+
	                            "<div class='del_date_btn' style='margin-left: -20px;'></div>"+
	                       " </div>"+
	                    "</div>";
	    $(".add_date_btn").on("click",function(){
	    	$(".date_box").append(data_html);
	    	
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
    		    if($(this).val() > $(this).parent().parent().siblings().children().children('.day2').val()){
    		    	$(this).parent().parent().siblings().children().children('.day2').val($(this).val());
    		    }
    		    var startTime = e.date; 
    		    $(this).parent().parent().siblings().children().children('.day2').datepicker('setStartDate',startTime);  
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
    			if($(this).val() < $(this).parent().parent().siblings().children().children('.day1').val()){
    				$(this).parent().parent().siblings().children().children('.day1').val($(this).val());
    			}
    		    var endTime = e.date;  
    		    $(this).parent().parent().siblings().children().children('.day1').datepicker('setEndDate',endTime);  
    		}); 
	    });
	    $(".date_box").on("click",".del_date_btn",function(){
	    	$(this).parent().parent().remove();
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
		    if($(this).val() > $(this).parent().parent().siblings().children().children('.day2').val()){
		    	$(this).parent().parent().siblings().children().children('.day2').val($(this).val());
		    }
		    var startTime = e.date; 
		    $(this).parent().parent().siblings().children().children('.day2').datepicker('setStartDate',startTime);  
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
			if($(this).val() < $(this).parent().parent().siblings().children().children('.day1').val()){
				$(this).parent().parent().siblings().children().children('.day1').val($(this).val());
			}
		    var endTime = e.date;  
		    $(this).parent().parent().siblings().children().children('.day1').datepicker('setEndDate',endTime);  
		}); 
	});
	
	//地图
    var map = L.map('map');
    var OSMWhiteLayer = getOSMBrightLayer();
    var lightLayer = getLighLayer();
    var darkLayer = getDarkLayer();//高黑地图
    var OSMCartoLayer = getOSMCartoLayer();
    //var darkLayer = getDarkLayer();
     var baseMaps = {
             "高对比地图": OSMWhiteLayer,
             "高亮地图": lightLayer,
             "高黑地图":darkLayer,
             "地图新样式一":OSMCartoLayer
         };
    /*  纬度为 南纬90-0-北纬90
     	经度为 西经180-本出子午线(0度)-东经180 
     	long 是经度
     	lat 是纬度
     	*/
    //设置地图的显示范围
    var corner1 = L.latLng(-60, -180),
 	corner2 = L.latLng(90, 180),
 	bounds = L.latLngBounds(corner1, corner2);
 	map.setMaxBounds(bounds);
 	
	var legendControl = null;
	var layerControl = null;
	var cityCountryLayers = [];
	
    //事件信息渲染图表
	function render(configId){
		startLoad();
		$.ajax({
			url:'<%=basePath%>/search/event_situational_viz/'+configId,
			type: 'POST',
			dataType:"json",
			async:false,
			success:function(data){
				if(data == "-1"){
					endLoad();
					alert("获取结果信息数据失败");
				}
				renderData(data);
				endLoad();
			}
		});
    }
    function renderData(data){
    	 //判断控制器
			if(legendControl != null || layerControl !=null){
				try {
					 map.removeLayer(countLayer);
		    	} catch (err) {
		    	}
				map.removeLayer(OSMWhiteLayer);
				//map.removeLayer(darkLayer);
				map.removeLayer(lightLayer);
				for (var i=0; i<cityCountryLayers.length; i++) {
			    try {
			    	map.removeLayer(cityCountryLayers[i]);
			    } catch (err) {
			    }
				}
				cityCountryLayers = [];
				//把控制图层移除
	        	map.removeControl(legendControl);
	        	map.removeControl(layerControl);
        }
		var date_data= data.date_data;
		var color_set= ["red", "blue", "orange", "yellow", "green", "purple"];;
		var country_city_data=data.country_city_data;
		var contrast_data=data.contrast_data;
		var max_country_data=data.max_country_data;
		var max_city_data=data.max_city_data;
		var max_contrast=data.max_contrast;
        var length = country_city_data.length;
        if(contrast_data.country_dic.length==0){
			 map.setView([ 37.8, 113.7 ], 4);
		 }else{
			 map.setView([ 47.8, 0 ], 2);
		 }
        
        map.addLayer(OSMWhiteLayer);
        legendControl = new L.Control.Legend();
        legendControl.addTo(map);
        layerControl = L.control.layers(baseMaps).addTo(map);
        if(date_data.length>0){
	        $.each(date_data, function (index, date) {
	            var len = date.length;
	            var time = date.slice(0,4) + '年' + date.slice(4,6) + '月'+date.slice(6,8)+'日'+"-"+date.slice(9,13) + '年' + date.slice(13,15) + '月'+date.slice(15,17)+'日';
	            var data = country_city_data[index];
	            var cityLayer = new L.DataLayer(data, {
	                recordsField: 'city_dic',
	                latitudeField: 'Lat',
	                longitudeField: 'Lon',
	                displayOptions: {
	                    EventSum: {
	                        radius: new L.LinearFunction([20, 2], [max_city_data[index], 10], {
	                            preProcess: function (a) {
	                                    return a;
	                            }
	                        }),
	                        displayName: time + '城市事件数'
	                    }
	                },
	                legendOptions: {
	                },
	                includeLayer: function (record) {
	                    var a = record.EventSum;
	                    if (a < 20) {
	                        return false;
	                    }
	                    else {
	                        return true;
	                    }
	                },
	                layerOptions: {
	                    numberOfSides: 50,
	                    color: '#ffffff',
	                    fillOpacity: 0.9,
	                    fillColor: color_set[index],
	                    opacity: 0,
	                    weight: 0.4,
	                    gradient: false,
	                    dropShadow: false
	                },
	                tooltipOptions: {
	                    iconSize: new L.Point(120, 70),
	                    iconAnchor: new L.Point(-5, 70)
	                },
	                onEachRecord: function (layer, record) {
	                    var $html = $(L.HTMLUtils.buildTable(record));
	
	                    layer.bindPopup($html.wrap('<div/>').parent().html(), {
	                        maxWidth: 400,
	                        minWidth: 400
	                    });
	                }
	            });
	
	
	            var options = {
	                recordsField: 'country_dic',
	                locationMode: L.LocationModes.COUNTRY,
	                codeField: 'ISO',
	                displayOptions: {
	                    EventSum: {
	                        displayName: '国家事件数',
	                        fillColor: new L.HSLLuminosityFunction([1, 0.90], [max_country_data[index], 0.4], {
	                            outputHue: 30,
	                            constrainX: true
	                        }),
	                        color: new L.HSLLuminosityFunction([1, 0.80], [max_country_data[index], 0.30], {
	                            outputHue: 30,
	                            constrainX: true
	                        })
	                    }
	                },
	                layerOptions: {
	                    numberofSides: 50,
	                    fillOpacity: 0.8,
	                    opacity: 0.8,
	                    weight: 1
	
	                },
	                tooltipOptions: {
	                    iconSize: new L.Point(120, 70),
	                    iconAnchor: new L.Point(-5, 70)
	                },
	
	                onEachRecord: function (layer, record) {
	                    var $html = $(L.HTMLUtils.buildTable(record));
	
	                    layer.bindPopup($html.wrap('<div/>').parent().html(), {
	                        maxWidth: 400,
	                        minWidth: 400
	                    });
	                },
	                showLegendTooltips: true,
	                zIndex: 20
	            };
	            var countryLayer = new L.ChoroplethDataLayer(data, options);
	
	            layerControl.addOverlay(countryLayer, time + '事件国家分布');
	            layerControl.addOverlay(cityLayer, time + '事件城市分布');
	            cityCountryLayers.push(countryLayer);
	            cityCountryLayers.push(cityLayer);
	        });
        }
        var options = new Array();
        $.each(date_data, function (index, value) {
            var name = value + '事件数';
            options[name] =
                 {
                    color: 'black',
                    fillColor: '#dd5500',
                    minValue: 0,
                    maxValue: max_contrast/10,
                    displayName: value + '事件数'
                };
        });

        var boundaryColorFunction = new L.HSLHueFunction([0, 120], [200000, 0]);
        //定义全局变量countLayer
        countLayer = new L.BarChartDataLayer(contrast_data, {
            recordsField: 'country_dic',
            locationMode: L.LocationModes.COUNTRY,
            codeField: 'ISO',
            includeBoundary: true,
            showLegendTooltips: false,
            boundaryStyle: function (record, layer) {
                return {
                    color: 'black',
                    fillOpacity: 0.5,
                    fillColor: boundaryColorFunction.evaluate(record.AllEventSum),
                    weight: 3,
                    opacity: 1.0,
                    settitle: 1
                }
            },
            legendOptions: {
                title: '所有日期事件国家对比'
            },
            displayOptions: {
            },
            tooltipOptions: {
                iconSize: new L.Point(100, 70),
                iconAnchor: new L.Point(-5, 70)
            },
            chartOptions: options,
            onEachRecord: function (layer, record) {
                var $html = $(L.HTMLUtils.buildTable(record));

                layer.bindPopup($html.wrap('<div/>').parent().html(), {
                    maxWidth: 400,
                    minWidth: 400
                });
            },
            layerOptions: {
                fillOpacity: 0.9,
                color: 'black',
                opacity: 1,
                weight: 1,
                width: 8,
                numberOfSides: 100,
                gradient: false,
                dropShadow: false,
                stroke: true
            }

        });
        
        map.addLayer(countLayer);
        
        layerControl.addOverlay(countLayer, '所有日期事件国家对比');

        $('.fab').hover(function () {
            $(this).toggleClass('active');
        });
        $(function () {
          $('[data-toggle="tooltip"]').tooltip()
        });

        $("#csv_export").click(function(){
            var str = data_download(country_city_data,date_data,'csv');
            $("#download_csv").attr("href","data:text/csv;charset=utf-8,"+str);
            document.getElementById("download_csv").click();
        });
        $("#txt_export").click(function(){
            var str = data_download(country_city_data,date_data,'txt');
            $("#download_txt").attr("href","data:text/csv;charset=utf-8,"+str);
            document.getElementById("download_txt").click();
        });
        $("#json_export").click(function(){
            var str = data_download(country_city_data,date_data,'json');
            $("#download_json").attr("href","data:text/csv;charset=utf-8,"+str);
            document.getElementById("download_json").click();
        });
        //下载
        function data_download(d,date,format) {
            if(format=='json'){
                var str=JSON.stringify(d);
            }
            else if(format=='csv') {
                var str = date[0]+"Country_Data"+ '\n';
                var header = new Array();
                for (var key in (d[0].country_dic)[0]) {
                    if (key == 'ChineseName') {
                        continue;
                    }
                    header.push(key);
                }
                for (var i = 0; i < d.length; i++) {
                    for (var k = 0; k < header.length; k++) {
                        str = str + header[k] + ',';
                    }
                    str = str.slice(0, -1) + '\n';
                    var data = d[i].country_dic;
                    for (var j = 0; j < data.length; j++) {
                        for (var k = 0; k < header.length; k++) {
                            str = str + data[j][header[k]] + ',';
                        }
                        str = str.slice(0, -1) + '\n';
                    }
                    if (i + 1 < d.length)
                        str = str + '\n' + date[i + 1] + "Country_Data" +'\n';
                    else
                        str = str + '\n';
                }
                //city
                str = '\n'+str + date[0] +'City_Data'+ '\n';
                var header = new Array();
                for (var key in (d[0].city_dic)[0]) {
                    header.push(key);
                }
                for (var i = 0; i < d.length; i++) {
                    for (var k = 0; k < header.length; k++) {
                        str = str + header[k] + ',';
                    }
                    str = str.slice(0, -1) + '\n';
                    var data = d[i].city_dic;
                    for (var j = 0; j < data.length; j++) {
                        for (var k = 0; k < header.length; k++) {
                            str = str + data[j][header[k]] + ',';
                        }
                        str = str.slice(0, -1) + '\n';
                    }
                    if (i + 1 < d.length)
                        str = str + '\n' + date[i + 1] +"City_Data" +'\n';
                    else
                        str = str + '\n';
                }
            }
            else if(format=='txt'){
                var str = date[0]+"Country_Data"+ '\r\n';
                var header = new Array();
                for (var key in (d[0].country_dic)[0]) {
                    if (key == 'ChineseName') {
                        continue;
                    }
                    header.push(key);
                }
                for (var i = 0; i < d.length; i++) {
                    for (var k = 0; k < header.length; k++) {
                        str = str + header[k] + ',';
                    }
                    str = str.slice(0, -1) + '\r\n';
                    var data = d[i].country_dic;
                    for (var j = 0; j < data.length; j++) {
                        for (var k = 0; k < header.length; k++) {
                            str = str + data[j][header[k]] + ',';
                        }
                        str = str.slice(0, -1) + '\r\n';
                    }
                    if (i + 1 < d.length)
                        str = str + '\r\n' + date[i + 1] + "Country_Data" +'\r\n';
                    else
                        str = str + '\r\n';
                }
                //city
                str = '\r\n'+str + date[0] +'City_Data'+ '\r\n';
                var header = new Array();
                for (var key in (d[0].city_dic)[0]) {
                    header.push(key);
                }
                for (var i = 0; i < d.length; i++) {
                    for (var k = 0; k < header.length; k++) {
                        str = str + header[k] + ',';
                    }
                    str = str.slice(0, -1) + '\r\n';
                    var data = d[i].city_dic;
                    for (var j = 0; j < data.length; j++) {
                        for (var k = 0; k < header.length; k++) {
                            str = str + data[j][header[k]] + ',';
                        }
                        str = str.slice(0, -1) + '\r\n';
                    }
                    if (i + 1 < d.length)
                        str = str + '\r\n' + date[i + 1] +"City_Data" +'\r\n';
                    else
                        str = str + '\r\n';
                }
            }
            str = encodeURIComponent(str);
            return str;
        }
    }
		
	</script>
</html>