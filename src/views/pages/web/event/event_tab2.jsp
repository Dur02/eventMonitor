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
<!-- 提供事件模块的大部分使用，包含有全部的查询条件 (日期、权重) -->
<script src="<%=basePath%>/static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<%-- <script type="text/javascript" src="<%=basePath %>/static/Visualization/rgQuery.js"></script>
 --%>
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
					<!-- 统计依据 -->
					<li class="clearfix bizhong">
						<div class="td1 fl"><p class="tjyj_png fl"></p><b>统计依据：</b></div>
						<div class="td5_event fl"><input  type="radio" onclick="return false" name="valueWeight${t.configId }" <c:if test="${t.staticbasic eq 1}"> checked="checked"</c:if> value="1"><label for="radio1"> 比重</label></div>
						<div class="td5_event fl"><input  type="radio" onclick="return false" name="valueWeight${t.configId }" <c:if test="${t.staticbasic eq 2}"> checked="checked"</c:if> value="2"><label for="radio2"> 数量</label></div>
					</li>
					<li class="clearfix">
						<div class="td1 fl"><p class="weight_png fl"></p><b>权重依据：</b></div>
						<div class="td5_event fl"><input  type="radio" onclick="return false" name="weightFlag${t.configId }" <c:if test="${t.weightFlag eq 1}"> checked="checked"</c:if>  value="1"><label for="radio1"> 事件数 </label></div>
						<div class="td5_event fl"><input  type="radio" onclick="return false" name="weightFlag${t.configId }" <c:if test="${t.weightFlag eq 2}"> checked="checked"</c:if> value="2"><label for="radio2"> 文章数 </label></div>
						<div class="td5_event fl"><input  type="radio" onclick="return false" name="weightFlag${t.configId }" <c:if test="${t.weightFlag eq 3}"> checked="checked"</c:if> value="3"><label for="radio2"> 信源数 </label></div>
						<div class="td5_event fl"><input  type="radio" onclick="return false" name="weightFlag${t.configId }" <c:if test="${t.weightFlag eq 4}"> checked="checked"</c:if> value="4"><label for="radio2"> 事件数(去重) </label></div>
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
				<input type="hidden" name="dataSourceType" value="1"/><!-- 这个值实际上用不到，只是后台封装的时候走一下判断 -->
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
							</div>
						</li>
						<li class="clearfix bizhong">
							<div class="td1 fl"><p class="tjyj_png fl"></p><b>统计依据：</b></div>
							<div class="td5_event fl"><input  type="radio" name="valueWeight" checked="checked" value="1"><label for="radio1"> 比重</label></div>
							<div class="td5_event fl"><input  type="radio" name="valueWeight" value="2"><label for="radio2"> 数量</label></div>
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
								<div style=" float:left; margin-right:10px; margin-top:4px;">保存配置：<input class="artificial_radio oldRadio" name="isSaveConfig" id="isSaveConfig" value="0" type="radio" onclick="$('#rgConfigName').show()">是<input class="artificial_radio oldRadio" type="radio" name="isSaveConfig" value="1" checked onclick="$('#rgConfigName').hide()">否</div>
								<div style=" float:left; margin-right:10px;display: none; margin-top:4px;" id="rgConfigName">配置名称：<input class="default_input" style="padding: 1px 8px;" type="text" id="configName" name="configName"></div>
								<div style=" float:left;"><input class="submit2" type="button" onclick="eventRGQuery(1)" value="提交"></div>
							</div>
						</li>
					</ul>
					</form>
				</div>
			</div>
</body>
<script type="text/javascript">
	$(function(){
		
		configDate = ${configDate};
		configMaxDate = configDate.maxDate1;
		configMaxDate = configMaxDate.substring(0,4)+"-"+configMaxDate.substring(4,6)+"-"+configMaxDate.substring(6,8);
		configMinDate = configDate.minDate1;
		configMinDate = configMinDate.substring(0,4)+"-"+configMinDate.substring(4,6)+"-"+configMinDate.substring(6,8);
		$("#edDateSpan").html(configMaxDate);
		$("#stDateSpan").html(configMinDate);
		$("#stDates").val(configMinDate);
		$("#edDates").val(configMaxDate);
		
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
	})
</script>
</html>