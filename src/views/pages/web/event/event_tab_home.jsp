<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	String basePath = request.getContextPath();
%>
<style type="text/css">
<c:if test="${bgFlag == null or bgFlag == 2}">
	.now{
		float:left;
		padding:0 8px;
		line-height:22px;
		border-radius:3px;
		color:#000;
		border:1px solid #b4b4b4;
		cursor:pointer;
	}
</c:if>
<c:if test="${bgFlag == null or bgFlag == 1}">
	.now{
		float:left;
		padding:0 8px;
		line-height:22px;
		border-radius:3px;
		color:#fff;
		border:1px solid #b4b4b4;
		cursor:pointer;
	}
</c:if>
.now_act{
	background:#26B;
	color:#fff;
}
</style>
</head>
<!-- 提供事件模块的大部分使用，包含有全部的查询条件 (日期、角色属性、事件属性、权重) -->
<script src="<%=basePath%>/static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<body>
<div class="tab">
	<div class="change_box">
		<span class="ul_xl" id="ddd"></span>
		<span class="prev_btn none"></span>
		<span class="next_btn none"></span>
		<div class="tab_ul_box">
			<ul id="tab_ul" style="top:2px;" class="tab_ul clearfix">
				<!-- 实时查询 -->
				<!-- <li id="0" onclick="render(0);" class="active mgl-30">实时查询</li> -->
				<c:forEach items="${typeList }" var = "t" varStatus="indx">
					<c:if test="${indx.index eq 0 }">
						<li id="${t.configId}" onclick="render(${t.configId});" class="active mgl-30">${t.configName }</li>
					</c:if>
					<c:if test="${indx.index ne 0 }">
						<li class="" id="${t.configId}" onclick="render(${t.configId});" class="">${t.configName }</li>
					</c:if>
					<%-- <li id="${t.configId}" onclick="render(${t.configId});" class="">${t.configName }</li> --%>
				</c:forEach>
			</ul>
		</div>
		<c:if test="${sessionScope.LOGINUSER.roleId  != 3 }">
			<p class="manual">即时查询</p>
		</c:if>
	</div>
	<div class="tab_div">
		<!-- <div class="tab_down show" >
				实时查询 
				<ul class="tab_down_info" id="hidelabel">
					<li class="clearfix">
						<div class="date_box clearfix">
							<div class="td1 fl">
								<p class="time_png fl"></p>
								<b>日期属性：</b>
							</div>
							<div class="clearfix">
								<div class="td2 fl b_e_date">起止日期</div>
								<div class="td3_2 fl">
									<input id="d1" style="width: 120px;" type="text" readonly />
								</div>
								<div class="fl width18"></div>
								<div class="td3_2 fl">
									<input id="d2" style="width: 120px;" type="text" readonly />
								</div>
								<div class="now" id="nowonly">实时</div>
							</div>
						</div>
					</li>
					<li class="clearfix">
						<div class="td1 fl"><p class="weight_png fl"></p><b>权重依据：</b></div>
						<div class="td5_event fl"><input  type="radio"  checked="checked"  ><label for="radio1"> 事件数</label></div>
						<div class="td5_event fl"><input  type="radio"  value="2" disabled><label for="radio2"> 文章数</label></div>
						<div class="td5_event fl"><input  type="radio"  value="3" disabled><label for="radio3"> 信源数</label></div>
						<div class="td5_event fl"><input  type="radio"  value="4" disabled><label for="radio4"> 事件数(去重)</label></div>
					</li>
				</ul>
		</div> -->
		<!-- 遍历配置集合 -->
		<c:forEach items="${typeList }" var = "t" varStatus="indx">
			<div class="tab_down" >
				<ul class="tab_down_info" id="sss">
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
		                                 <label class='lab2' for=''><input class='inp_selc' id="inp_selc_data" name='edDates' type='text' readonly value='${tt.edDate}' /></label>
		                             </div>
		                             <c:choose>
		                             	<c:when  test="${fn:length(tt.edDate) gt 10}">
		                             		 <div class="now stop_g now_act" id="nowonlylook${tt.id}">实时</div>
		                             	</c:when>
		                             	<c:otherwise>
		                            		 <div class="now stop_g" id="nowonlylook${tt.id}">实时</div>
		                             	</c:otherwise>
		                             </c:choose>
		                        </div>
		                     </div>
			       		 </c:forEach>
					</li>
					<li class="clearfix">
						<div class="td1 fl"><p class="weight_png fl"></p><b>权重依据：</b></div>
						<div class="td5_event fl"><input  type="radio" name="weightFlag${t.configId }" <c:if test="${t.weightFlag eq 1}"> checked="checked" </c:if>  value="1"><label for="radio1"> 事件数 </label></div>
						<div class="td5_event fl"><input  type="radio" name="weightFlag${t.configId }" <c:if test="${t.weightFlag eq 2}"> checked="checked" </c:if> value="2"><label for="radio2"> 文章数 </label></div>
						<div class="td5_event fl"><input  type="radio" name="weightFlag${t.configId }" <c:if test="${t.weightFlag eq 3}"> checked="checked" </c:if> value="3"><label for="radio2"> 信源数 </label></div>
						<div class="td5_event fl"><input  type="radio" name="weightFlag${t.configId }" <c:if test="${t.weightFlag eq 4}"> checked="checked" </c:if> value="4"><label for="radio2"> 事件数(去重) </label></div>
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
				<ul class="tab_down_info" id="bbb">
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
									<label class="lab2" for=""><input class="inp_selc day1" name="stDates" type="text" readonly value="${curStDate[2]}"/></label>
								</div>
								<div class="fl width18"></div>
								<div class="td3_2 fl">
									<label class="lab2" for=""><input class="inp_selc day2" name="edDates" type="text" readonly value="${curEdDate[2]}"/></label>
								</div>
								<div class="now">实时</div>
								<div class="add_date_btn"></div>
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
							<div class = "verti_align" style=" float:left; margin-right:10px; margin-top:4px;">保存配置：<input class="artificial_radio" name="isSaveConfig" id="isSaveConfig" value="0" type="radio" onclick="$('#rgConfigName').show()">是<input class="artificial_radio" type="radio" name="isSaveConfig" value="1" checked onclick="$('#rgConfigName').hide()">否</div>
							<div style=" float:left; margin-right:10px;display: none; margin-top:4px;" id="rgConfigName">配置名称：<input class="default_input" style="padding: 1px 8px;" type="text" id="configName" name="configName"></div>
							<div style=" float:left;"><input class="submit2" type="button" onclick="eventRGQuery()" value="提交"></div>
						</div>
					</li>
				</ul>
			</form>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	$(function(){
		/* rgcx();
		handleConfigs();
		if(${pzid} != 0){
			$("#"+${pzid}).addClass("active");
		}  */
		//实时查询渲染
		$("#nowonly").addClass("now_act");
		//实时查询右边按钮移除点击事件
		$('#nowonly').unbind("click");
		//配置里面的实时div
		$('.stop_g').unbind("click");
		//$('#now_act').unbind("click");
		//提示结束时间赋值
		$("#edDateSpan").html('${maxDate[2] }');
		$("#stDateSpan").html('${minDate[2] }');
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
		//实时查询添加数据
		getDate();
		setInterval(getDate,1000);
	})
	function getDate(){
		var date=new Date();
		var year=date.getFullYear();//当前年份
		var month=date.getMonth();//当前月份
		var data=date.getDate();//天
		var hours=date.getHours();//小时
		var minute=date.getMinutes();//分
		var second=date.getSeconds();//秒
		var time = year+"-"+toDou(month+1)+"-"+toDou(data)+" "+toDou(00)+":"+toDou(00)+":"+toDou(00);
		var time2=year+"-"+toDou(month+1)+"-"+toDou(data)+" "+toDou(hours)+":"+toDou(minute)+":"+toDou(second);
		$("#d1").attr("value",time);
		$("#d2").attr("value",time2);
	}
	function toDou(str){
		var num;
	 	str>=10?num = str : num = "0" + str;
		return num;
	};
	
	//即时查询点击
	$(".manual").click(function(){
		$(".now").removeClass("now_act");
		$(".ul_xl").click();
	});
	/**
	 * 点击实时
	 */
	$(".now").on("click",function (){
		if($(this).hasClass("now_act")){
			$("#constantly").val(0);
			var date = new Date();
		    var seperator1 = "-";
		    var seperator2 = ":";
		    var month = date.getMonth() + 1;
		    var strDate = date.getDate();
		    if (month >= 1 && month <= 9) {
		        month = "0" + month;
		    }
		    if (strDate >= 0 && strDate <= 9) {
		        strDate = "0" + strDate;
		    }
		    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate;
			$("input[name='edDates']").val(currentdate);
			$(this).removeClass("now_act");
		}else{
			$("#constantly").val(1);
			var date = new Date();
		    var seperator1 = "-";
		    var seperator2 = ":";
		    var month = date.getMonth() + 1;
		    var strDate = date.getDate();
		    if (month >= 1 && month <= 9) {
		        month = "0" + month;
		    }
		    if (strDate >= 0 && strDate <= 9) {
		        strDate = "0" + strDate;
		    }
		    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
		            + " " + date.getHours() + seperator2 + toDou(date.getMinutes());
			$("input[name='edDates']").val(currentdate);
			$(this).addClass("now_act");
		}
	})
</script>
</html>