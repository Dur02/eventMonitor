<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/jquery-1.11.1.min.js"></script>

<!--图谱下方的配置展示  （日期）模块  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="tab">
		<%-- <span class="ul_xl"></span>
		<ul id="tab_ul" class="tab_ul clearfix">
		<c:forEach items="${typeList }" var = "t" varStatus="indx">
			<c:if test="${indx.index eq 0 }">
				<li class="active mgl-30" onclick="render(${t.configId});">${t.configName }</li>
			</c:if>
			<c:if test="${indx.index ne 0 }">
				<li class=""  onclick="render(${t.configId});">${t.configName }</li>
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
		<!-- 预设点A -->
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
					<li class="clearfix">
						<div class="td1 fl"><p class="event_property_png  fl"></p><b>权重依据：</b></div>
						<div class="td5 fl"><input  type="radio" onclick="return false" name="weightFlag${t.configId }" <c:if test="${t.weightFlag eq 1}"> checked="checked"</c:if>  value="1"><label for="radio1"> 包含所选实体集的新闻报道数(1)</label></div>
						<div class="td5 fl"><input  type="radio" onclick="return false" name="weightFlag${t.configId }" <c:if test="${t.weightFlag eq 2}"> checked="checked"</c:if> value="2"><label for="radio2"> 包含所选实体集的新闻报道数(NUMARTS)</label></div>
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
				<input type="hidden" name="dataSourceType" value="1"/><!-- 这个值实际上用不到，只是后台封装的时候走一下判断 -->
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
						</div>
					</li>
					<li class="clearfix">
						<div class="td1 fl">
							<p class="event_property_png  fl"></p>
							<b>权重依据：</b>
						</div>
						<div class="td5 fl">
							<input type="radio" name="gkgWeightFlag" value="1" checked><label for="radio1"> 包含所选实体集的新闻报道数(1)</label>
						</div>
						<div class="td5 fl">
							<input type="radio" name="gkgWeightFlag" value="2"><label for="radio2"> 包含所选实体集的新闻报道数(NUMARTS)</label>
						</div>
					</li>
					<li class="clearfix">
						<div class="fr">
							<div style=" float:left; margin-right:10px; margin-top:4px;">保存配置：<input class="artificial_radio oldRadio" name="isSaveConfig" value="0" type="radio" onclick="$('#rgConfigName').show()">是<input class="artificial_radio oldRadio" type="radio" name="isSaveConfig" value="1" checked onclick="$('#rgConfigName').hide()">否</div>
							<div style=" float:left; margin-right:10px;display: none; margin-top:4px;" id="rgConfigName">配置名称：<input class="default_input" style="padding: 1px 8px;" type="text" name="configName" id="configName"></div>
							<div style=" float:left;"><input class="submit2" type="button" onclick="gkgRGQuery(1)" value="提交"></div>
						</div>
					</li>
					</ul>
					</form>
				</div>
			</div>
</body>
<script type="text/javascript">
$(function(){
	//配置页面取默认的最大日期和最小日期
	configDate = ${configDate};
	configMaxDate = configDate.maxDate1;
	configMaxDate = configMaxDate.substring(0,4)+"-"+configMaxDate.substring(4,6)+"-"+configMaxDate.substring(6,8);
	configMinDate = configDate.minDate1;
	configMinDate = configMinDate.substring(0,4)+"-"+configMinDate.substring(4,6)+"-"+configMinDate.substring(6,8);
	$("#edDateSpan").html(configMaxDate);
	$("#stDateSpan").html(configMinDate);
	$("#gkgStDate").val(configMinDate);
	$("#gkgEdDate").val(configMaxDate);
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
});

</script>
</html>