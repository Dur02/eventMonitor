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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻库分析-查询配置页面</title>
<style type="text/css">
	.hoverImg{
		margin-top: 4px;
	}
	
	.newsKeyWordSpan{
		top: 3px;
	    position: relative;
	    left: 7px;
	    width: 40px;
	    color: red!important;
	    margin-right: 17px;
	}
	/* 美化滚动条 */
	.tab_div{
		overflow: auto;
	}
   .tab_div ::-webkit-scrollbar {
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
			<!-- 预设点A -->
			<c:forEach items="${typeList }" var="t" varStatus="indx">
				<c:if test="${indx.index eq 0 }">
					<div class="tab_down show">
				</c:if>
				<c:if test="${indx.index ne 0 }">
					<div class="tab_down">
				</c:if>
				<ul class="tab_down_info" style="overflow: auto;">
					<li class="clearfix">
							<input type="hidden" id="dataType"  />
							<div class="date_box clearfix">
								<div class="td1 fl">
									<p class="fl"></p>
									<b>采集时间：</b>
								</div>
								<div class="width250 fl clearfix">
									<div class="fl"><span class="beg_time fl">开始时间</span></div>
									<div class="td3_2 fl">
										<label class="lab2" for=""><input class="inp_selc" value='${t.newsInfo.newsStDate_c}'   type="text" readonly /></label>
									</div>
								</div>
								<div class="fl clearfix">
									<div class="fl"><span class="end_time fl">结束时间</span></div>
									<div class="td3_2 fl">
										<label class="lab2" for=""><input class="inp_selc"   type="text" readonly value='${t.newsInfo.newsEdDate_c}' /></label>
									</div>
								</div>
							</div>
							<div class="date_box clearfix">
								<div class="td1 fl">
									<p class="fl"></p>
									<b>发布时间：</b>
								</div>
								<div class="width250 fl clearfix">
									<div class="fl"><span class="beg_time fl">开始时间</span></div>
									<div class="td3_2 fl">
										<label class="lab2" for=""><input class="inp_selc"   type="text" value='${t.newsInfo.newsStDate_f}' readonly /></label>
									</div>
								</div>
								<div class="fl clearfix">
									<div class="fl"><span class="end_time fl">结束时间</span></div>
									<div class="td3_2 fl">
										<label class="lab2" for=""><input class="inp_selc"   type="text" value='${t.newsInfo.newsEdDate_f}' readonly /></label>
									</div>
								</div>
							</div>
						</li>
						<!-- 数据源 -->
						<!-- 根据是否为二次回溯显示或隐藏数据源 -->
		       		 	<c:if test="${t.relationId == undefined || t.relationId == null }" >
							<li class="clearfix" id="dataSourceType">
								<div class="td1 fl"><p class="fl"></p><b>数据源：</b></div>
								<div class="td5_event fl"><input class="dataSourceType_new" type="radio" <c:if test="${t.dataSourceType eq 1}"> checked="checked"</c:if>  ><label for="radio1"> 数据源一</label></div>
								<div class="td5_event fl"><input class="dataSourceType_new" type="radio" <c:if test="${t.dataSourceType eq 2}"> checked="checked"</c:if>  ><label for="radio2"> 数据源二</label></div>
								<div class="td5_event fl"><input class="dataSourceType_new" type="radio" <c:if test="${t.dataSourceType eq 3}"> checked="checked"</c:if> ><label for="radio3"> 数据源三</label></div>
							</li>
		       		 	</c:if>
						<li class="clearfix" >
							<div class="td1 fl"><p class="fl"></p><b class="sjsx">作者：</b></div>
							<div class="radio_box">
								<input class="condition_info_ids fl" type="text"  value='${t.newsInfo.writer}'  />
								<div style="padding: 3px;margin-left: 10px;float: left;"><input type="checkbox" style="vertical-align: middle;"  <c:if test="${t.newsInfo.writerIsBig eq 0}"> checked=""</c:if> >区分大小写</div>
								<img  class="hoverImg" src="<%=basePath %>/static/images/detail.png">
								<span style="margin-left: 9px;display: none;">支持单个关键字模糊匹配;自定义模糊匹配，逻辑运算符:&&表示"且",||表示"或", 可以用( )表示一个主体优先级,例如  (A && B && !D)||C 注意：^ ~ * \为特殊字符不允许输入 </span>
							</div>
						</li>
						<li class="clearfix" >
							<div class="td1 fl"><p class="fl"></p><b class="sjsx">网站：</b></div>
							<div class="radio_box">
								<input class="condition_info_ids fl" type="text" value='${t.newsInfo.website}'  />
								<div style="padding: 3px;margin-left: 10px;float: left;"><input type="checkbox" style="vertical-align: middle;"  <c:if test="${t.newsInfo.websiteIsBig eq 0}"> checked=""</c:if> >区分大小写</div>
								<img style="margin-top: 4px;" class="hoverImg" src="<%=basePath %>/static/images/detail.png">
								<span style="margin-left: 9px;display: none;">支持单个关键字模糊匹配;自定义模糊匹配，逻辑运算符:&&表示"且",||表示"或", 可以用( )表示一个主体优先级,例如  (A && B && !D)||C 注意：^ ~ * \为特殊字符不允许输入 </span>
							</div>
						</li>
						<li class="clearfix" >
							<div class="td1 fl"><p class="fl"></p><b class="sjsx">URL：</b></div>
							<div class="radio_box">
								<input class="condition_info_ids fl" type="text" value='${t.newsInfo.oUrl}'   />
								<div style="padding: 3px;margin-left: 10px;float: left;"><input type="checkbox" style="vertical-align: middle;"  <c:if test="${t.newsInfo.oUrlIsBig eq 0}"> checked=""</c:if> >区分大小写</div>
								<img style="margin-top: 4px;" class="hoverImg" src="<%=basePath %>/static/images/detail.png">
								<span style="margin-left: 9px;display: none;">支持单个关键字模糊匹配;自定义模糊匹配，逻辑运算符:&&表示"且",||表示"或", 可以用( )表示一个主体优先级,例如  (A && B && !D)||C 注意：^ ~ * \为特殊字符不允许输入 </span>
							</div>
						</li>
						<li class="clearfix" >
							<div class="td1 fl"><p class="fl"></p><b class="sjsx">标题：</b></div>
							<div class="radio_box">
								<input class="condition_info_ids fl" type="text" value='${t.newsInfo.title}' />
								<div style="padding: 3px;margin-left: 10px;float: left;"><input type="checkbox" style="vertical-align: middle;"  <c:if test="${t.newsInfo.titleIsBig eq 0}"> checked=""</c:if> >区分大小写</div>
								<img style="margin-top: 4px;" class="hoverImg" src="<%=basePath %>/static/images/detail.png">
								<span style="margin-left: 9px;display: none;">支持单个关键字模糊匹配;自定义模糊匹配，逻辑运算符:&&表示"且",||表示"或", 可以用( )表示一个主体优先级,例如  (A && B && !D)||C 注意：^ ~ * \为特殊字符不允许输入 </span>
							</div>
						</li>
						<li class="clearfix" >
							<div class="td1 fl"><p class="fl"></p><b class="sjsx">正文：</b></div>
							<div class="radio_box">
								<input class="condition_info_ids fl" type="text"  value='${t.newsInfo.contents}' />
								<div style="padding: 3px;margin-left: 10px;float: left;"><input type="checkbox" style="vertical-align: middle;"  <c:if test="${t.newsInfo.contentsIsBig eq 0}"> checked=""</c:if> >区分大小写</div>
								<img style="margin-top: 4px;" class="hoverImg" src="<%=basePath %>/static/images/detail.png">
								<span style="margin-left: 9px;display: none;">支持单个关键字模糊匹配;自定义模糊匹配，逻辑运算符:&&表示"且",||表示"或", 可以用( )表示一个主体优先级,例如  (A && B && !D)||C 注意：^ ~ * \为特殊字符不允许输入 </span>
							</div>
						</li>
				</ul>
		</div>
		</c:forEach>
		<!-- 即时查询 -->
		<div class="tab_down people_tab_down" style="overflow: auto;">
			<form id="newsQueryForm" action="../config/renGongQuery" method="post">
				<input type="hidden" name="flid" id="RGFL">
				<input type="hidden" name="priority" value="1"/>
				<input type="hidden" name="configFlag" value="36"/>
				<input type="hidden" name="configCategoriesStr" id="modelType"/>
				<input type="hidden" name="newsRemark" value="即时查询"/>
				<ul class="tab_down_info">
						<li class="clearfix">
							<input type="hidden" id="dataType"  />
							<div class="date_box clearfix">
								<div class="td1 fl">
									<p class="fl"></p>
									<b>采集时间：</b>
								</div>
								<div class="width250 fl clearfix">
									<div class="fl"><span class="beg_time fl">开始时间</span></div>
									<div class="td3_2 fl">
										<label class="lab2" for=""><input class="inp_selc day1" id="newsStDate_c"  name="newsStDate_c" type="text"  readonly /></label>
									</div>
								</div>
								<div class="fl clearfix">
									<div class="fl"><span class="end_time fl">结束时间</span></div>
									<div class="td3_2 fl">
										<label class="lab2" for=""><input class="inp_selc day2" id="newsEdDate_c"  name="newsEdDate_c" type="text" readonly /></label>
									</div>
								</div>
							</div>
							<div class="date_box clearfix">
								<div class="td1 fl">
									<p class="fl"></p>
									<b>发布时间：</b>
								</div>
								<div class="width250 fl clearfix">
									<div class="fl"><span class="beg_time fl">开始时间</span></div>
									<div class="td3_2 fl">
										<label class="lab2" for=""><input class="inp_selc day3" id="newsStDate_f"  name="newsStDate_f" type="text" readonly /></label>
									</div>
								</div>
								<div class="fl clearfix">
									<div class="fl"><span class="end_time fl">结束时间</span></div>
									<div class="td3_2 fl">
										<label class="lab2" for=""><input class="inp_selc day4" id="newsEdDate_f"  name="newsEdDate_f" type="text" readonly /></label>
									</div>
								</div>
							</div>
						</li>
						<!-- 数据源 -->
						<li class="clearfix" id="dataSourceType">
							<div class="td1 fl"><p class="fl"></p><b>数据源：</b></div>
							<div class="td5_event fl"><input class="dataSourceType1 dataSourceType_new dataSourceType_news_js" type="radio" name="dataSourceType" checked="checked" value="1" id="radio1"><label for="radio1"> 数据源一</label></div>
							<div class="td5_event fl"><input class="dataSourceType2 dataSourceType_new dataSourceType_news_js" type="radio" name="dataSourceType" value="2" id="radio2"><label for="radio2"> 数据源二</label></div>
							<div class="td5_event fl"><input class="dataSourceType3 dataSourceType_new dataSourceType_news_js" type="radio" name="dataSourceType" value="3" id="radio3"><label for="radio3"> 数据源三</label></div>
						</li>
						<li class="clearfix" >
							<div class="td1 fl"><p class="fl"></p><b class="sjsx">作者：</b></div>
							<div class="radio_box">
								<input class="condition_info_ids fl" type="text" name="writer" onchange="validateNewsKeyWords(this)"  />
								<span class="newsKeyWordSpan"></span>
								<div style="padding: 3px;margin-left: 10px;float: left;"><input type="checkbox" style="vertical-align: middle;" value="0" checked name="writerIsBig">区分大小写</div>
								<img class="hoverImg" src="<%=basePath %>/static/images/detail.png">
								<span style="margin-left: 9px;display: none;">支持单个关键字模糊匹配;自定义模糊匹配，逻辑运算符:&&表示"且",||表示"或", 可以用( )表示一个主体优先级,例如  (A && B && !D)||C 注意：^ ~ * \为特殊字符不允许输入 </span>
								
							</div>
						</li>
						<li class="clearfix" >
							<div class="td1 fl"><p class="fl"></p><b class="sjsx">网站：</b></div>
							<div class="radio_box">
								<input class="condition_info_ids fl" type="text" name="website" onchange="validateNewsKeyWords(this)" />
								<span class="newsKeyWordSpan"></span>
								<div style="padding: 3px;margin-left: 10px;float: left;"><input type="checkbox" style="vertical-align: middle;" value="0" checked name="websiteIsBig">区分大小写</div>
								<img class="hoverImg" src="<%=basePath %>/static/images/detail.png">
								<span style="margin-left: 9px;display: none;">支持单个关键字模糊匹配;自定义模糊匹配，逻辑运算符:&&表示"且",||表示"或", 可以用( )表示一个主体优先级,例如  (A && B && !D)||C 注意：^ ~ * \为特殊字符不允许输入</span>
								
							</div>
						</li>
						<li class="clearfix" >
							<div class="td1 fl"><p class="fl"></p><b class="sjsx">URL：</b></div>
							<div class="radio_box">
								<input class="condition_info_ids fl" type="text" name="oUrl" onchange="validateNewsKeyWords(this)"  />
								<span class="newsKeyWordSpan"></span>
								<div style="padding: 3px;margin-left: 10px;float: left;"><input type="checkbox" style="vertical-align: middle;" value="0" checked name="oUrlIsBig">区分大小写</div>
								<img class="hoverImg" src="<%=basePath %>/static/images/detail.png">
								<span style="margin-left: 9px;display: none;">支持单个关键字模糊匹配;自定义模糊匹配，逻辑运算符:&&表示"且",||表示"或", 可以用( )表示一个主体优先级,例如  (A && B && !D)||C 注意：^ ~ * \为特殊字符不允许输入</span>
							</div>
						</li>
						<li class="clearfix" >
							<div class="td1 fl"><p class="fl"></p><b class="sjsx">标题：</b></div>
							<div class="radio_box">
								<input class="condition_info_ids fl" type="text" name="title" onchange="validateNewsKeyWords(this)" />
								<span class="newsKeyWordSpan"></span>
								<div style="padding: 3px;margin-left: 10px;float: left;"><input type="checkbox" style="vertical-align: middle;" value="0" checked name="titleIsBig">区分大小写</div>
								<img class="hoverImg" src="<%=basePath %>/static/images/detail.png">
								<span style="margin-left: 9px;display: none;">支持单个关键字模糊匹配;自定义模糊匹配，逻辑运算符:&&表示"且",||表示"或", 可以用( )表示一个主体优先级,例如  (A && B && !D)||C 注意：^ ~ * \为特殊字符不允许输入 </span>
							</div>
						</li>
						<li class="clearfix" >
							<div class="td1 fl"><p class="fl"></p><b class="sjsx">正文：</b></div>
							<div class="radio_box">
								<input class="condition_info_ids fl" type="text" name="contents"  onchange="validateNewsKeyWords(this)" />
								<span class="newsKeyWordSpan"></span>
								<div style="padding: 3px;margin-left: 10px;float: left;"><input type="checkbox" style="vertical-align: middle;" value="0" checked name="contentsIsBig">区分大小写</div>
								<img class="hoverImg" src="<%=basePath %>/static/images/detail.png">
								<span style="margin-left: 9px;display: none;">支持单个关键字模糊匹配;自定义模糊匹配，逻辑运算符:&&表示"且",||表示"或", 可以用( )表示一个主体优先级,例如  (A && B && !D)||C 注意：^ ~ * \为特殊字符不允许输入</span>
								
							</div>
						</li>
						<li class="clearfix">
							<div class="fr">
								<div style=" float:left; margin-right:10px; margin-top:4px;">保存配置：<input class="artificial_radio" name="isSaveConfig" id="isSaveConfig" value="0" type="radio" onclick="$('#rgConfigName').show()">是<input class="artificial_radio" type="radio" name="isSaveConfig" value="1" checked onclick="$('#rgConfigName').hide()">否</div>
								<div style=" float:left; margin-right:10px;display: none; margin-top:4px;" id="rgConfigName">配置名称：<input class="default_input" style="padding: 1px 8px;" type="text" id="configName" name="configName"></div>
								<div style=" float:left;"><input class="submit2" type="button" onclick="newsRGQuery()" value="提交"></div>
							</div>
						</li>
					</ul>
				</form>
			</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		
		//渲染即时查询时间插件
		newsDateRange = {
						"dateType1":{"max_s_pt":"","min_o_gt":"","min_s_pt":"","max_o_gt":""},
						"dateType2":{"min_o_gt":"","max_o_gt":"","min_s_pt":"","max_s_pt":""},
						"dateType3":{"min_o_gt":"","max_o_gt":"","min_s_pt":"","max_s_pt":""}
					};
		var dataRange = newsDateRange.dateType1;
		var min_s_pt = dataRange.min_s_pt;
		var max_s_pt = dataRange.max_s_pt;
		var min_o_gt = dataRange.min_o_gt;
		var max_o_gt = dataRange.max_o_gt;
		$('#newsStDate_f').datepicker({
			format: 'yyyy-mm-dd', 
			weekStart: 0,
			autoclose: true, 
			orientation:" top auto",
			startView: 0,
			maxViewMode: 2,
			minViewMode:0,
			forceParse: false, 
			language: 'zh-CN',
			startDate: min_s_pt,
			endDate : max_s_pt,
		}).on('changeDate',function(e){  
		    if($(this).val() > $('#newsEdDate_f').val()){
		    	$('#newsEdDate_f').val($(this).val());
		    }
		    var startTime = e.date; 
		    $('#newsEdDate_f').datepicker('setStartDate',startTime);  
		});
		$('#newsEdDate_f').datepicker({
			format: 'yyyy-mm-dd', 
			weekStart: 0,
			autoclose: true, 
			orientation:" top auto",
			startView: 0,
			maxViewMode: 2,
			minViewMode:0,
			forceParse: false, 
			language: 'zh-CN',
			startDate: min_s_pt,
			endDate : max_s_pt
		}).on('changeDate',function(e){  
			if($(this).val() < $('#newsStDate_f').val()){
				$('#newsStDate_f').val($(this).val());
			}
		    var endTime = e.date;  
		    $('#newsStDate_f').datepicker('setEndDate',endTime);  
		}); 
		//发布时间
		$('#newsStDate_f').val(min_s_pt);
	    $('#newsEdDate_f').val(max_s_pt);
		$('#newsStDate_f').datepicker('setDate',min_s_pt); 
		$('#newsEdDate_f').datepicker('setDate',max_s_pt); 
		
		//采集时间
		$('#newsStDate_c').datepicker({
			format: 'yyyy-mm-dd', 
			weekStart: 0,
			autoclose: true, 
			orientation:" top auto",
			startView: 0,
			maxViewMode: 2,
			minViewMode:0,
			forceParse: false, 
			language: 'zh-CN',
			startDate: min_o_gt,
			endDate : max_o_gt,
		}).on('changeDate',function(e){  
			    if($(this).val() > $('#newsEdDate_c').val()){
			    	$('#newsEdDate_c').val($(this).val());
			    }
			    var startTime = e.date; 
			    $('#newsEdDate_c').datepicker('setStartDate',startTime);  
			});
		$('#newsEdDate_c').datepicker({
			format: 'yyyy-mm-dd', 
			weekStart: 0,
			autoclose: true, 
			orientation:" top auto",
			startView: 0,
			maxViewMode: 2,
			minViewMode:0,
			forceParse: false, 
			language: 'zh-CN',
			startDate: min_o_gt,
			endDate : max_o_gt
		}).on('changeDate',function(e){  
				if($(this).val() < $('#newsStDate_c').val()){
					$('#newsStDate_c').val($(this).val());
				}
			    var endTime = e.date;  
			    $('#newsStDate_c').datepicker('setEndDate',endTime);  
		}); 
		
		$("#newsStDate_c").val(min_o_gt);
	    $("#newsEdDate_c").val(max_o_gt);
	    $('#newsStDate_c').datepicker('setDate',min_o_gt); 
	    $('#newsEdDate_c').datepicker('setDate',max_o_gt);
		
	    $(".dataSourceType_news_js").on("click",function (){
			var sourceType = $(this).val();
			if(sourceType == 1){
				dataRange = newsDateRange.dateType1;
			}else if(sourceType == 2){
				dataRange = newsDateRange.dateType2;
			}else if(sourceType == 3){
				dataRange = newsDateRange.dateType3;
			}
			var min_s_pt = dataRange.min_s_pt;
			var max_s_pt = dataRange.max_s_pt;
			
			var min_o_gt = dataRange.min_o_gt;
			var max_o_gt = dataRange.max_o_gt;
			
			//发布时间
			$('#newsStDate_f').datepicker('setStartDate',min_s_pt);  
			$('#newsStDate_f').datepicker('setEndDate',max_s_pt);  
			$('#newsEdDate_f').datepicker('setStartDate',min_s_pt);  
			$('#newsEdDate_f').datepicker('setEndDate',max_s_pt);  
			
			$('#newsStDate_f').val(min_s_pt);
		    $('#newsEdDate_f').val(max_s_pt);
			$('#newsStDate_f').datepicker('setDate',min_s_pt); 
			$('#newsEdDate_f').datepicker('setDate',max_s_pt); 
			//采集时间
			$('#newsStDate_c').datepicker('setStartDate',min_o_gt);  
			$('#newsStDate_c').datepicker('setEndDate',max_o_gt);  
			$('#newsEdDate_c').datepicker('setStartDate',min_o_gt);  
			$('#newsEdDate_c').datepicker('setEndDate',max_o_gt); 
			
			$("#newsStDate_c").val(min_o_gt);
		    $("#newsEdDate_c").val(max_o_gt);
		    $('#newsStDate_c').datepicker('setDate',min_o_gt); 
		    $('#newsEdDate_c').datepicker('setDate',max_o_gt);
		});
		
	    //点击即时查询时默认数据源一选中
		$(".manual").on("click",function (){
			$(".dataSourceType1").click();
		});
		
		//ajax获取新闻库采集事件、发布时间的范围（三套数据源一起获取）
		$.ajax({
			url:'<%=basePath%>/config/findNewsDateRange',
			type:'post',
			dataType:"json",
			success:function(data){
				//将查询的时间范围赋给时间范围的全局变量
				newsDateRange = data;
				//将当前选中的数据源对应的时间范围重新赋值
				var checkedDataSource = $(".dataSourceType_news_js:checked").val();
				if(checkedDataSource == 1){
					dataRange = newsDateRange.dateType1;
				}else if(checkedDataSource == 2){
					dataRange = newsDateRange.dateType2;
				}else if(checkedDataSource == 3){
					dataRange = newsDateRange.dateType3;
				}
				var min_s_pt = dataRange.min_s_pt;
				var max_s_pt = dataRange.max_s_pt;
				var min_o_gt = dataRange.min_o_gt;
				var max_o_gt = dataRange.max_o_gt;
				
				//发布时间的起止时间设置时间范围
				$('#newsStDate_f').datepicker('setStartDate',min_s_pt);  
				$('#newsStDate_f').datepicker('setEndDate',max_s_pt);  
				$('#newsEdDate_f').datepicker('setStartDate',min_s_pt);  
				$('#newsEdDate_f').datepicker('setEndDate',max_s_pt); 
				//采集时间的起止时间设置时间范围
				$('#newsStDate_c').datepicker('setStartDate',min_o_gt);  
				$('#newsStDate_c').datepicker('setEndDate',max_o_gt);  
				$('#newsEdDate_c').datepicker('setStartDate',min_o_gt);  
				$('#newsEdDate_c').datepicker('setEndDate',max_o_gt); 
				
				//将没值的采集、发布时间设置初始值
				if($('#newsStDate_f').val() == ''){
					$('#newsStDate_f').val(min_s_pt);
					$('#newsStDate_f').datepicker('setDate',min_s_pt); 
				}
				
				if($('#newsEdDate_f').val() == ''){
					$('#newsEdDate_f').val(max_s_pt);
					$('#newsEdDate_f').datepicker('setDate',max_s_pt); 
				}
				
				if($('#newsStDate_c').val() == ''){
					$('#newsStDate_c').datepicker('setDate',min_o_gt); 
					$("#newsStDate_c").val(min_o_gt);
				}
				
				if($('#newsEdDate_c').val() == ''){
					$('#newsEdDate_c').datepicker('setDate',max_o_gt);
					$("#newsEdDate_c").val(max_o_gt);
				}
			},
			error:function(){
				win.alertEx("加载采集、发布时间范围失败")
			}
			
		});
		
	});
	//鼠标移入时显示信息
	$(".hoverImg").hover(function () {
	    $(this).next().show();
	}, function () {
		$(this).next().hide();
	})
</script>
</html>