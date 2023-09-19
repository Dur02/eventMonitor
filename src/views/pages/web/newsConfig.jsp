<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String basePath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>新闻配置</title>
<!-- 弹出层需引进，并放在所有css上面，以避免冲突 -->
<link rel="stylesheet" href="<%=basePath %>/static/css/animate.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/dialog.css">
<!-- 弹出层需引进结束 -->
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/style.css"/>
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.min.css"/>

<link rel="stylesheet" href="<%=basePath %>/static/lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath %>/static/css/combo.select.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/perfect-scrollbar.css"/>
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window.css"/><!-- 弹出提示框样式 -->
<link rel="stylesheet" href="<%=basePath %>/static/css/waringhover.css"/><!-- 内存大小移入样式 -->
<style type="text/css">
	.combo-dropdown li{float:left; width:100%;}
	.newFuxuankuang{vertical-align:middle;}
	.newsKeyWordSpan{
	    top: 3px;
	    position: relative;
	    left: 7px;
	    width: 40px;
	    color: red!important;
	    margin-right: 17px;
	}
	/* 美化滚动条 */
	.index_bottom{
		overflow: auto;
	}
  .index_bottom::-webkit-scrollbar {
       width: 10px;
       height: 10px;
       background-color: #1b2334;
   }
	.index_bottom::-webkit-scrollbar-thumb {
       background-color: #1d2334!important;
       border-radius: 10px!important;
	}

   .index_bottom::-webkit-scrollbar-thumb:hover {
    	background-color: #777!important;
   }
	.index_bottom::-webkit-scrollbar-track {
	    background: #1b2334;
	    box-shadow: inset 0 0 6px #333!important;
	    border-radius: 10px!important;
	}
</style>
<script src="<%=basePath %>/static/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath %>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath %>/static/js/perfect-scrollbar.js"></script>
<script src="<%=basePath %>/static/lib/jquery.pagination.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-select.min.js"></script>
<script src="<%=basePath %>/static/js/jquery.combo.select.js"></script>
<script src="<%=basePath %>/static/js/config/config.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/comboBoxData/geoCountryCode.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/comboBoxData/countryCode.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/comboBoxData/organizationcode.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/comboBoxData/baseEvent.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/comboBoxData/ethnicCode.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/comboBoxData/eventCode.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/comboBoxData/quadClass.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/comboBoxData/religionCode.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/comboBoxData/rootEvent.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/comboBoxData/typeCode.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/hsCheckData.js"></script>
<!-- 弹出层需引进 -->
<script src="<%=basePath %>/static/js/dialog.js"></script>
<!-- 弹出层需引进结束 -->
<c:if test="${bgFlag == null or bgFlag == 1}">
	<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css"/>
	<link rel="stylesheet" href="<%=basePath %>/static/css/sec2.css"/>
	<script src="<%=basePath %>/static/js/sec2.js"></script>
	<script type="text/javascript">
	function startLoad(){
		$('body').loading({
			loadingWidth:240,
			name:'lay',
			discription:'',
			direction:'column',
			type:'origin',
			originDivWidth:40,
			originDivHeight:40,
			originWidth:6,
			originHeight:6,
			smallLoading:false,
			loadingBg:'#000',
			loadingMaskBg:'rgba(0,0,0,0.2)'
		});
	}
	function endLoad(){
		removeLoading('lay');
	}
	
	</script>
</c:if>
<c:if test="${bgFlag == 2}">
	<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.min.css"/>
	<link rel="stylesheet" href="<%=basePath %>/static/css/sec2_2.css"/>
	<script src="<%=basePath %>/static/js/sec2_2.js"></script>
	<script type="text/javascript">
	function startLoad(){
		$('body').loading({
			loadingWidth:240,
			name:'lay',
			discription:'',
			direction:'column',
			type:'origin',
			originDivWidth:40,
			originDivHeight:40,
			originWidth:6,
			originHeight:6,
			smallLoading:false,
			loadingBg:'rgba(0,0,0,0.5)',
			loadingMaskBg:'rgba(0,0,0,0.2)'
		});
	}
	function endLoad(){
		removeLoading('lay');
	}
	</script>
</c:if>

</head>
<body class="peizhi_bg">
<form id="newsConfigForm" class="clearfix" action="../config/updateConfigInfo" method="post">
	<div class="index_top pos_fix">
		<h3 class="fl title" style="margin:0px;">配置管理 > 新闻配置</h3>
		<div class="title_r fr" style="display:none;">
			<!-- <span class="set_span set_span2" onclick="changeConfig(this, 1);">事件配置</span> -->
			<span class="set_span" onclick="changeConfig(this, 2);">新闻配置</span>
		</div>
	</div>
	<div class="index_bottom peizhi_bg">
		<div class="table_box">
			<ul class="table_ul mgl-30 clearfix">
				<li>配置名称：<input type="text" id="s_configName"/></li>
				<li>
					<div style="float: left; line-height: 20px;">类型筛选：</div>
					<div class="fl clearfix" style="float: left; height:20px;">
						<div class="dowebok0">
							<select id="typeFilter">
								<option value="" selected="selected">全部</option>
								<c:forEach items="${atlasCategoryList}" var="category" varStatus="indx">
									<option value="${category.categoryId}">${category.categoryName}</option><br/>
								</c:forEach>
							</select> 
						</div>
					</div>
				</li>
				<li>
					<div style="float: left; line-height: 20px;">配置状态：</div>
						<div class="fl clearfix" style="float: left; height:20px;">
							<div class="dowebok0">
								<select id="scheduleStateFilter">
									<option value="" selected="selected">全部</option>
									<%-- <c:forEach items="${scheduleStateList}" var="scheduleState" varStatus="indx"> --%>
										<option value="0">待执行</option><br/>
										<option value="1">执行中</option><br/>
										<option value="4">排队中</option><br/>
										<option value="2">执行完成</option><br/>
										<option value="3">执行失败</option><br/>
									<%-- </c:forEach> --%>
								</select> 
							</div>
						</div>
				</li>
				<li>创建人：<input type="text" id="s_creator"/></li>
				<li><input class="seach_btn" type="button" value="查询" onclick="cx()"></li>
				<li><input type="button" class="addbutton" value="新增配置" onclick="addConfig();"></li>
				<li><input type="button" class="addbutton" value="批量删除" onclick="delAll();"></li>
				<li class="waring"><img id="weixian" style="vertical-align: -webkit-baseline-middle; cursor: pointer;display: none;"  src="<%=basePath %>/static/images/caution.png" ></li>
				<li class="protect"><img id="anquan" style="vertical-align: -webkit-baseline-middle; cursor: pointer;display: none;"  src="<%=basePath %>/static/images/not_caution.png" ></li>
				<div class="show-details">
       				<ul>
			            <li class="in_one">
			                	最大存储量：<span></span>
			            </li>
			            <li class="in_two">
			                	当前存储量：<span></span>
			            </li>
			            <li class="in_three">
			                	<span class="span2"></span><span class="span1"></span>
			            </li>
			        </ul>
   				</div>	
			</ul>
			<table class="table">
				<thead>
					<tr>
						<th style="padding: 0 !important;width: 53px;"><input type="checkbox" id="newAllcheck" style="vertical-align:middle;">全选</th>
						<th>序号</th>
						<th>排序</th>
						<th>挂起</th>
						<th>配置名称</th>
						<th>配置分类</th>
						<th>创建人</th>
						<th>权限</th>
						<th>创建日期</th>
						<th>备注信息</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<div id="Pagination" class="pagination"><!-- 这里显示分页 --></div>
		</div>
	
		<input type="hidden" class="aa" value="" name="configId"/>
		<input type="hidden" id="pageIndexNew" value="0"/>
		<input type="hidden" name="bgFlag" value="${bgFlag}" id="bgFlag"/>
		<div class="tab2 clearfix" style="display: none;" id="infodiv">
			
			<input type="hidden" id="configFlag" name="configFlag" value="36" /><!-- 新闻配置模块的id(36) -->
			<input type="hidden" id="typeIds" name="configCategoriesStr"/>
			<input type="hidden" class="relationId" name="relationId"/><!-- 关联配置id，用于区别二次回溯产生的配置 -->
			<input type="hidden" id="isAgain" name="isAgain"/><!-- 是否为二次回溯，区别关联分析产生的子配置进行二次回溯-->
			<!-- 增加属性，用于区分日期属性是年、月、日哪种格式 -->
			<input type="hidden" id="dateType" name="dateType" value="1" />
			<!-- 新闻配置 -->
			<fieldset class="show" style="display:none;position:relative;">
				<div class="pos_shadow2"></div>
				<ul class="table_ul clearfix">
					<li><div class="td1_2 fl"><p class="info_png fl"></p><b>基本信息：</b></div></li>
					<li>配置名称：<input type="text" name="configName" id="configName"/></li>
					<li>配置类型：<input id="atlas_type" class="atlas_type" type="text" name="news_type" onclick="graphDianji()"readonly/></li>
					<li>备注信息：<input type="text" name="newsRemark" id="newsRemark"/></li>
					<li class="clearfix">优先级：<input style="width:20px;" type="text" name="priority" value="1" id="yxj" onblur="jiaoyan()"/>
					<span id="yxjspan" style="display:none;float: right;"><img src="<%=basePath %>/static/images/delete.png" style="margin-top: -2px;"></img></span>
					</li>
					<li>权限：
						<div style="width: 60px; display: inline-block;">
							<select class="fl" id="isPrivate" name="isPrivate">
								<option value="1">私有</option>
								<option value="2">公开</option>
							</select>
						</div>
					</li>
					<li id="nowTimeLi" style="margin-right:0px;">实时监测：
						<div style="width: 60px; display: inline-block;">
							<select class="fl" id="nowTime" name="nowTime">
								<option value="1">否</option>
								<option value="2">是</option>
							</select>
						</div>
					</li>
				</ul>
				<div class="hr"></div>
				<div class="tab_down2" style="margin-bottom:6px;">
					<ul class="tab_down_info">
						<li class="clearfix">
							<div class="date_box clearfix">
								<div class="td1 fl">
									<p class="fl"></p>
									<b>采集时间：</b>
								</div>
								<div class="width250 fl clearfix">
									<div class="fl"><span class="beg_time fl">开始时间</span></div>
									<div class="td3_2 fl">
										<label class="lab2" for=""><input class="inp_selc day1" id="newsStDate_c" name="newsStDate_c" type="text" readonly /></label>
									</div>
								</div>
								<div class="fl clearfix">
									<div class="fl"><span class="end_time fl">结束时间</span></div>
									<div class="td3_2 fl">
										<label class="lab2" for=""><input class="inp_selc day2" id="newsEdDate_c" name="newsEdDate_c" type="text" readonly /></label>
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
										<label class="lab2" for=""><input class="inp_selc day3" id="newsStDate_f" name="newsStDate_f" type="text" readonly /></label>
									</div>
								</div>
								<div class="fl clearfix">
									<div class="fl"><span class="end_time fl">结束时间</span></div>
									<div class="td3_2 fl">
										<label class="lab2" for=""><input class="inp_selc day4" id="newsEdDate_f" name="newsEdDate_f" type="text" readonly /></label>
									</div>
								</div>
							</div>
						</li>
						<!-- 数据源 -->
						<li class="clearfix" id="dataSourceType">
							<div class="td1 fl"><p class="fl"></p><b>数据源：</b></div>
							<div class="td5_event fl"><input class="dataSourceType_news1 dataSourceType_news" type="radio" name="dataSourceType" checked="checked" value="1" id="radio1"><label for="radio1"> 数据源一</label></div>
							<div class="td5_event fl"><input class="dataSourceType_news2 dataSourceType_news" type="radio" name="dataSourceType" value="2" id="radio2"><label for="radio2"> 数据源二</label></div>
							<div class="td5_event fl"><input class="dataSourceType_news3 dataSourceType_news" type="radio" name="dataSourceType" value="3" id="radio3"><label for="radio3"> 数据源三</label></div>
						</li>
					   <li class="clearfix" >
							<div class="td1 fl"><p class="fl"></p><b class="sjsx">作者：</b></div>
							<div class="radio_box">
								<input class="condition_info_ids fl" type="text" id="writer" name="writer" onchange="validateNewsKeyWords(this)" />
								<span class="newsKeyWordSpan"></span>
								<div style="padding: 3px;margin-left: 10px;float: left;"><input class="likeFieldIsBig" type="checkbox" style="vertical-align: middle;" value="0" checked name="writerIsBig">区分大小写</div>
								<img class="hoverImg" src="<%=basePath %>/static/images/detail.png">
								<span style="margin-left: 9px;display: none;">支持单个关键字模糊匹配;自定义模糊匹配，逻辑运算符:&&表示"且",||表示"或", 可以用( )表示一个主体优先级,例如  (A && B && !D)||C 注意：^ ~ * \为特殊字符不允许输入 </span>
								
							</div>
						</li>
						<li class="clearfix" >
							<div class="td1 fl"><p class="fl"></p><b class="sjsx">网站：</b></div>
							<div class="radio_box">
								<input class="condition_info_ids fl" type="text"  id="website" name="website" onchange="validateNewsKeyWords(this)"/>
								<span class="newsKeyWordSpan"></span>
								<div style="padding: 3px;margin-left: 10px;float: left;"><input class="likeFieldIsBig" type="checkbox" style="vertical-align: middle;" value="0" checked name="websiteIsBig">区分大小写</div>
								<img class="hoverImg" src="<%=basePath %>/static/images/detail.png">
								<span style="margin-left: 9px;display: none;">支持单个关键字模糊匹配;自定义模糊匹配，逻辑运算符:&&表示"且",||表示"或", 可以用( )表示一个主体优先级,例如  (A && B && !D)||C 注意：^ ~ * \为特殊字符不允许输入</span>
								
							</div>
						</li>
						<li class="clearfix" >
							<div class="td1 fl"><p class="fl"></p><b class="sjsx">URL：</b></div>
							<div class="radio_box">
								<input class="condition_info_ids fl" type="text"  id="oUrl" name="oUrl" onchange="validateNewsKeyWords(this)"/>
								<span class="newsKeyWordSpan"></span>
								<div style="padding: 3px;margin-left: 10px;float: left;"><input class="likeFieldIsBig" type="checkbox" style="vertical-align: middle;" value="0" checked name="oUrlIsBig">区分大小写</div>
								<img class="hoverImg" src="<%=basePath %>/static/images/detail.png">
								<span style="margin-left: 9px;display: none;">支持单个关键字模糊匹配;自定义模糊匹配，逻辑运算符:&&表示"且",||表示"或", 可以用( )表示一个主体优先级,例如  (A && B && !D)||C 注意：^ ~ * \为特殊字符不允许输入</span>
							</div>
						</li>
						<li class="clearfix" >
							<div class="td1 fl"><p class="fl"></p><b class="sjsx">标题：</b></div>
							<div class="radio_box">
								<input class="condition_info_ids fl" type="text" id="title" name="title" onchange="validateNewsKeyWords(this)"/>
								<span class="newsKeyWordSpan"></span>
								<div style="padding: 3px;margin-left: 10px;float: left;"><input class="likeFieldIsBig" type="checkbox" style="vertical-align: middle;" value="0" checked name="titleIsBig">区分大小写</div>
								<img class="hoverImg" src="<%=basePath %>/static/images/detail.png">
								<span style="margin-left: 9px;display: none;">支持单个关键字模糊匹配;自定义模糊匹配，逻辑运算符:&&表示"且",||表示"或", 可以用( )表示一个主体优先级,例如  (A && B && !D)||C 注意：^ ~ * \为特殊字符不允许输入 </span>
							</div>
						</li>
						<li class="clearfix" >
							<div class="td1 fl"><p class="fl"></p><b class="sjsx">正文：</b></div>
							<div class="radio_box">
								<input class="condition_info_ids fl" type="text"  id="contents" name="contents" onchange="validateNewsKeyWords(this)"/>
								<span class="newsKeyWordSpan"></span>
								<div style="padding: 3px;margin-left: 10px;float: left;"><input class="likeFieldIsBig" type="checkbox" style="vertical-align: middle;" value="0" checked name="contentsIsBig">区分大小写</div>
								<img class="hoverImg" src="<%=basePath %>/static/images/detail.png">
								<span style="margin-left: 9px;display: none;">支持单个关键字模糊匹配;自定义模糊匹配，逻辑运算符:&&表示"且",||表示"或", 可以用( )表示一个主体优先级,例如  (A && B && !D)||C 注意：^ ~ * \为特殊字符不允许输入</span>
								
							</div>
						</li>
						<li><input class="submit" type="button" onclick="newsSub();" value="提交" id="scheduleState1"></li>
					</ul>
					<div class="pos_shadow"></div>
				</div>
			</fieldset>
		</div>
		</form>
		
	</div>
<div id="shadow" class="shadow"></div>
<!-- 新闻分类选择弹出层 -->
<div class="popup2">
	<div class="popup_t">
		<h3 class="popup_h3 fl">新闻分类</h3>
		<label class="check_z" for=""><input  style="vertical-align:middle;" id="sec_all_atlas" class="sec_all"  type="checkbox" >全选</label>
	</div>
	<div class="popup_m">
		<ul id="popup_ul_atlas" class="popup_ul clearfix">
			<c:forEach items="${atlasCategoryList}" var="atlas" varStatus="indx">
				<li><label for="atlas${indx.index+1}"><input style="vertical-align:middle;" id="atlas${indx.index+1}" type="checkbox" value="${atlas.categoryId}"> ${atlas.categoryName}</label></li>
			</c:forEach>
		</ul>
	</div>
	<div class="popup_b">
		<p class="fr">
			<span id="save_atlas" class="save">确定</span>
			<span class="cancel">取消</span>
		</p>
	</div>
</div>
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<script>


function addConfig(){
	//消除一些没有必要的值
	$(".relationId").val("");
	$("#isAgain").val(0);
	
	$("#sec_all_atlas").prop("checked",false);
	$(".pos_shadow").css("display","none");
	$(".aa").val("");
	$("#infodiv").show();
	$("#atlas_type").attr('onclick','graphDianji()');
	$("input[name='configName']").val(""); 
	$("input[name='news_type']").val(""); 
	$("input[name='newsRemark']").val("");
	$("input[name='priority']").val("1");
	$('#popup_ul_atlas input[type=checkbox]').each(function(){
		$(this).prop('checked', false);
    });
	$("#scheduleState1").css("display","block");
	$("#isPrivate option").each(function(){
		if($(this).val()==1){
			$(this).parent().siblings('input[type=text]').val("私有");
			$(this).attr('selected', true);
		}else{
			$(this).attr('selected', false);
		}
	});
	$("#nowTime option").each(function(){
		if($(this).val()==1){
			$(this).parent().siblings('input[type=text]').val("否");
			$(this).attr('selected', true);
		}else{
			$(this).attr('selected', false);
		}
	});
	$("#title").val("");
	$("#writer").val("");
	$("#website").val("");
	$("#contents").val("");
	$("#oUrl").val("");
	//将输入框的提示语清空
	$(".newsKeyWordSpan").html('');
	//将区分大小的选择框全部置为默认状态
	$(".likeFieldIsBig").prop("checked",true);
	//将采集时间、发布时间置为默认值
	$(".dataSourceType_news1").click();
	$("#dataSourceType").show();
}
//zcm mark st
var rs = null;
function showConfigList(){
	var configName = $('#s_configName').val();
	var creator = $('#s_creator').val();
	var configCategory = $('#typeFilter').val();
	var scheduleState = $('#scheduleStateFilter').val();
	var configFlag = $('#configFlag').val();
	var pageIndexNew = $('#pageIndexNew').val();
	var dt = {
			pageIndex:pageIndexNew,
	};
	if(configName != null && configName != ''){
		dt['configName'] = configName;
	}
	if(creator != null && creator != ''){
		dt['creator'] = creator;
	}
	if(configCategory != null && configCategory != ''){
		dt['configCategory'] = configCategory;
	}
	if(scheduleState != null && scheduleState != ''){
		dt['scheduleState'] = scheduleState;
	}
	if(configFlag != null && configFlag != ''){
		dt['configFlag'] = configFlag;
	}
	$.ajax({
		url:'../config/getConfigList',
		type:'POST',
		data: dt,
		success:function(data){
			var pageSize = data.pageSize;
			var totalRows = data.total;
			var pageIndex = data.pageIndex;
			
			rs = data.data;
			$("#Pagination").pagination(totalRows, {
				callback: pageselectCallback,
				current_page: pageIndex,
				num_display_entries: 4, //主体页数
				items_per_page: pageSize, //每页显示1项
				num_edge_entries: 2 //边缘页数
			});
			//防止浏览器input框记忆数据，必须放在加载完数据后
			$(":input").attr("autocomplete","off")
		}
	});
}

function pageselectCallback(pageIndex, jq){
	$("#pageIndexNew").val(pageIndex);
	initData(pageIndex);
}

function initData(pageIndex){
	var tbodys = '';
	var configName = $('#s_configName').val();
	var creator = $('#s_creator').val();
	var configCategory = $('#typeFilter').val();
	var scheduleState = $('#scheduleStateFilter').val();
	var configFlag = $('#configFlag').val();
	var dt = {
		pageIndex: pageIndex
	};
	if(configName != null && configName != ''){
		dt['configName'] = configName;
	}
	if(creator != null && creator != ''){
		dt['creator'] = creator;
	}
	if(configCategory != null && configCategory != ''){
		dt['configCategory'] = configCategory;
	}
	if(scheduleState != null && scheduleState != ''){
		dt['scheduleState'] = scheduleState;
	}
	if(configFlag != null && configFlag != ''){
		dt['configFlag'] = configFlag;
	}
	if(rs == null){
		$.ajax({
			url: '../config/getConfigList',
			type: 'POST',
			data: dt,
			success:function(data){
				tbodys = packageConfigData(data.data);
				$('.table tbody').html(tbodys);
			}
		});
	}else{
		tbodys = packageConfigData(rs);
		rs = null;
		$('.table tbody').html(tbodys);
		
	}
	return true;
}

function packageConfigData(rs){
	
	//计算序号与分页是对应的数值
	var pageIndex_current = $('#pageIndexNew').val();
	var pageSize = 10;
	
	var tbody = '', trs = '';
	var exec1='exec1';
	var exec2='exec2';
	//处理执行图表两种皮肤的切换
	if(${bgFlag} == 2){
		exec1="exec1_white";
		exec2="exec2_white";
	}
	$.each(rs, function(i, item){
		trs += '<tr><td><input type="checkbox" class="newFuxuankuang" onclick="newFuxuankuang()" data='+item.configId+' data-status='+item.scheduleState+' data-flid='+item.flid+'></td><td>' + (pageIndex_current * pageSize + i + 1) + '</td>';
		switch(item.priority){
		case 1:
			trs += '<td><span class="sort sort1">1</span></td>';
			break;
		case 2:
			trs += '<td><span class="sort sort2">2</span></td>';
			break;
		case 3:
			trs += '<td><span class="sort sort3">3</span></td>';
			break;
		default:
			trs += '<td><span class="sort sort7">' + item.priority + '</span></td>';
			break;
		}
		//根据皮肤ID切换图片
		<%-- if(${bgFlag} == null || ${bgFlag} == 1){
			if(item.isShow == 1){
				trs += '<td><img class="gq" onclick="isShow('+ item.configId +',\''+ item.isShow +'\',\''+ item.scheduleState +'\')" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>';
			}else if(item.isShow == 2){
				trs += '<td><img class="gq" onclick="isShow('+ item.configId +',\''+ item.isShow +'\',\''+ item.scheduleState +'\')" src="<%=basePath %>/static/images/gq2.png" alt="挂起"></td>';
			}
		}else{
			if(item.isShow == 1){
				trs += '<td><img class="gq" onclick="isShow('+ item.configId +',\''+ item.isShow +'\',\''+ item.scheduleState +'\')" src="<%=basePath %>/static/images/gq2.png" alt="挂起"></td>';
			}else if(item.isShow == 2){
				trs += '<td><img class="gq" onclick="isShow('+ item.configId +',\''+ item.isShow +'\',\''+ item.scheduleState +'\')" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>';
			}
		} --%>
		if(item.isShow == 1){
			if(${sessionScope.LOGINUSER.roleId}==1){//管理员最高权限
				trs += '<td><img class="gq" onclick="isShow('+ item.configId +',\''+ item.isShow +'\',\'yes\')" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>';
			}else if(${sessionScope.LOGINUSER.id} == item.creatorId){
				trs += '<td><img class="gq" onclick="isShow('+ item.configId +',\''+ item.isShow +'\',\'yes\')" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>';
			}else{
				trs += '<td><img class="gq" onclick="isShow('+ item.configId +',\''+ item.isShow +'\',\'no\')" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>';
			}
		}else if(item.isShow == 2){
			if(${sessionScope.LOGINUSER.roleId}==1){//管理员最高权限
				trs += '<td><img class="gq" onclick="isShow('+ item.configId +',\''+ item.isShow +'\',\'yes\')" src="<%=basePath %>/static/images/gq2.png" alt="挂起"></td>';
			}else if(${sessionScope.LOGINUSER.id} == item.creatorId){
				trs += '<td><img class="gq" onclick="isShow('+ item.configId +',\''+ item.isShow +'\',\'yes\')" src="<%=basePath %>/static/images/gq2.png" alt="挂起"></td>';
			}else{
				trs += '<td><img class="gq" onclick="isShow('+ item.configId +',\''+ item.isShow +'\',\'no\')" src="<%=basePath %>/static/images/gq2.png" alt="挂起"></td>';
			}
		}
		
		trs += '<td>' + item.configName + '</td>';
		trs += '<td>' + item.categoryName + '</td>';
		if(item.creator == undefined){
			trs += '<td></td>';
		}else{
			trs += '<td>' + item.creator + '</td>';
		}
		if(item.isPrivate == 1){
			trs += '<td>私有</td>';
		}else{
			trs += '<td>公开</td>';
		}
		trs += '<td>' + item.createDate + '</td>';
		if(item.remark == undefined){
			trs += '<td></td>';
		}else{
			trs += '<td>' + item.remark + '</td>';
		}
		if(item.scheduleState == 0){
			trs += '<td><img title="待执行" src="<%=basePath %>/static/images/state2.png"/></td>';
		}else if(item.scheduleState == 1){
			trs += '<td><img title="执行中" src="<%=basePath %>/static/images/state4.png"/></td>';
		}else if(item.scheduleState == 2){
			trs += '<td><img title="执行成功" src="<%=basePath %>/static/images/state1.png"/></td>';
		}else if(item.scheduleState == 3){
			trs += '<td><img title="执行失败" src="<%=basePath %>/static/images/state3.png"/></td>';
		}else if(item.scheduleState == 4){
			trs += '<td><img title="排队中" src="<%=basePath %>/static/images/state5.png"/></td>';
		}
		if(item.scheduleState == 2){//执行成功
			if(${sessionScope.LOGINUSER.roleId}==2){//普通用户没有下载数据功能
				trs += '<td style="position:relative;"><img title="执行成功" class="set" src="<%=basePath %>/static/images/exec3.png"/>';
				if(item.relationId!=null && item.relationId!=undefined){
					trs += '<img title="修改" class="set" src="<%=basePath %>/static/images/set.png" onclick="editConfig('+ item.configId +',\''+ item.categoryName +'\',\''+ item.flid +'\',\''+ item.scheduleState +'\',null,null,\'two\')"/>';
				}else{
					trs += '<img title="修改" class="set" src="<%=basePath %>/static/images/set.png" onclick="editConfig('+ item.configId +',\''+ item.categoryName +'\',\''+ item.flid +'\',\''+ item.scheduleState +'\')"/>';
				}
				trs += '<img title="删除" class="set" onclick="delConfig('+item.configId+','+item.flid+')" src="<%=basePath %>/static/images/del.png"/>';
				if(item.relationId == null || item.relationId == undefined){//非二次回溯的配置有配置复制功能，二次回溯的配置没有此功能
					trs += '<img title="配置复制" class="set" onclick="cloneConfig('+ item.configId +',\''+ item.categoryName +'\',\''+ item.flid +'\')" src="<%=basePath %>/static/images/clone.png"/>';
				}
				trs += '</td>';
			}else{
				trs += '<td style="position:relative;"><img title="执行成功" class="set" src="<%=basePath %>/static/images/exec3.png"/>';
				if(item.relationId!=null && item.relationId!=undefined){
					trs += '<img title="修改" class="set" src="<%=basePath %>/static/images/set.png" onclick="editConfig('+ item.configId +',\''+ item.categoryName +'\',\''+ item.flid +'\',\''+ item.scheduleState +'\',null,null,\'two\')"/>';
				}else{
					trs += '<img title="修改" class="set" src="<%=basePath %>/static/images/set.png" onclick="editConfig('+ item.configId +',\''+ item.categoryName +'\',\''+ item.flid +'\',\''+ item.scheduleState +'\')"/>';
				}
				trs += '<img title="下载" class="set xiazai" src="<%=basePath %>/static/images/xiazai.png"/><img title="删除" class="set" onclick="delConfig('+item.configId+','+item.flid+')" src="<%=basePath %>/static/images/del.png"/>';
				if(item.paths!=undefined){
					trs +='<div class="down" >';
					for(var i=0;i<item.paths.length;i++){
						trs+='<p class="down_p" onclick=dowoladFile('+item.paths[i].id+')>'+item.paths[i].dataTypeName+'</p>'
					}
					trs+='</div>';
				}
				if(item.relationId!=null && item.relationId!=undefined && item.isAgain==0){//判断是否是回溯配置产生的子配置并且是没有进行二次回溯的配置
					trs += '<img title="二次回溯" class="set" src="<%=basePath%>/static/images/begin_remountTo.png" onclick="twoRelationConfig('+ item.configId +')">';
				}
				if(item.relationId == null || item.relationId == undefined){//非二次回溯的配置有配置复制功能，二次回溯的配置没有此功能
					trs += '<img title="配置复制" class="set" onclick="cloneConfig('+ item.configId +',\''+ item.categoryName +'\',\''+ item.flid +'\')" src="<%=basePath %>/static/images/clone.png"/>';
				}
				trs += '</td>';
			}
		}else if(item.scheduleState == 1){//执行中
			trs += '<td><img title="执行" class="set tijiao'+item.configId+'" src="<%=basePath %>/static/images/'+exec1+'.png" />';
			if(item.relationId!=null && item.relationId!=undefined){
				trs += '<img title="修改" class="set" src="<%=basePath %>/static/images/set.png" onclick="editConfig('+ item.configId +',\''+ item.categoryName +'\',\''+ item.flid +'\',\''+ item.scheduleState +'\',null,null,\'two\')"/>';
			}else{
				trs += '<img title="修改" class="set" src="<%=basePath %>/static/images/set.png" onclick="editConfig('+ item.configId +',\''+ item.categoryName +'\',\''+ item.flid +'\',\''+ item.scheduleState +'\')"/>';
			}
			if(${sessionScope.LOGINUSER.roleId} == 1){//管理员才有下载数据功能
				trs += '<img title="下载" class="set xiazai" src="<%=basePath %>/static/images/xiazai.png"/>';
			}
			trs += '<img title="删除" class="set" onclick="delConfig('+ item.configId+','+item.flid+')" src="<%=basePath %>/static/images/del.png"/>';
			if(item.relationId == null || item.relationId == undefined){//非二次回溯的配置有配置复制功能，二次回溯的配置没有此功能
				trs += '<img title="配置复制" class="set" onclick="cloneConfig('+ item.configId +',\''+ item.categoryName +'\',\''+ item.flid +'\')" src="<%=basePath %>/static/images/clone.png"/>';
			}
			trs += '<img title="强制停止" class="set" onclick="stopTask('+ item.configId+')" src="<%=basePath %>/static/images/stopTask.png"/></td>';
		}else if(item.scheduleState == 4){//排队中
			trs += '<td><img title="执行" class="set tijiao'+item.configId+'" src="<%=basePath %>/static/images/'+exec1+'.png" />';
			if(item.relationId!=null && item.relationId!=undefined){
				trs += '<img title="修改" class="set" src="<%=basePath %>/static/images/set.png" onclick="editConfig('+ item.configId +',\''+ item.categoryName +'\',\''+ item.flid +'\',\''+ item.scheduleState +'\',null,null,\'two\')"/>';
			}else{
				trs += '<img title="修改" class="set" src="<%=basePath %>/static/images/set.png" onclick="editConfig('+ item.configId +',\''+ item.categoryName +'\',\''+ item.flid +'\',\''+ item.scheduleState +'\')"/>';
			}
			if(${sessionScope.LOGINUSER.roleId} == 1){//管理员才有下载数据功能
				trs += '<img title="下载" class="set xiazai" src="<%=basePath %>/static/images/xiazai.png"/>';
			}
			trs += '<img title="删除" class="set" onclick="delConfig('+ item.configId+','+item.flid+')" src="<%=basePath %>/static/images/del.png"/>';
			if(item.relationId == null || item.relationId == undefined){//非二次回溯的配置有配置复制功能，二次回溯的配置没有此功能
				trs += '<img title="配置复制" class="set" onclick="cloneConfig('+ item.configId +',\''+ item.categoryName +'\',\''+ item.flid +'\')" src="<%=basePath %>/static/images/clone.png"/>';
			}
			trs += '<img title="强制停止" class="set" onclick="stopTask('+ item.configId+')" src="<%=basePath %>/static/images/stopTask.png"/></td>';
		}else{																																	
			<%-- trs += '<td><img title="执行" class="set tijiao'+item.configId+'" src="<%=basePath %>/static/images/'+exec2+'.png" onclick="updateConfigStatus('+ item.configId +')"/>'; --%>
			trs += '<td><img title="执行" class="set tijiao'+item.configId+'" src="<%=basePath %>/static/images/'+exec2+'.png" onclick="execQuery('+ item.configId +')"/>';
			if(item.relationId!=null && item.relationId!=undefined){
				trs += '<img title="修改" class="set" src="<%=basePath %>/static/images/set.png" onclick="editConfig('+ item.configId +',\''+ item.categoryName +'\',\''+ item.flid +'\',\''+ item.scheduleState +'\',null,null,\'two\')"/>';
			}else{
				trs += '<img title="修改" class="set" src="<%=basePath %>/static/images/set.png" onclick="editConfig('+ item.configId +',\''+ item.categoryName +'\',\''+ item.flid +'\',\''+ item.scheduleState +'\')"/>';
			}
			if(${sessionScope.LOGINUSER.roleId} == 1){//管理员才有下载数据功能
				trs += '<img title="下载" class="set xiazai" src="<%=basePath %>/static/images/xiazai.png"/>';
			}
			trs += '<img title="删除" class="set" onclick="delConfig('+ item.configId+','+item.flid+')" src="<%=basePath %>/static/images/del.png"/>';
			if(item.relationId == null || item.relationId == undefined){//非二次回溯的配置有配置复制功能，二次回溯的配置没有此功能
				trs += '<img title="配置复制" class="set" onclick="cloneConfig('+ item.configId +',\''+ item.categoryName +'\',\''+ item.flid +'\')" src="<%=basePath %>/static/images/clone.png"/>';
			}
			trs += '</td>';
		}
		trs += '</tr>';
	});
	tbody += trs;
	
	return tbody;
	
}

function newFuxuankuang(){
	var chknum = $(".table tbody :checkbox").size();
	var chk = 0;
	$(".table tbody :checkbox").each(function(){
		if($(this).prop("checked") == true){
			chk++;
		}
	});
	if(chk == chknum){
		$("#newAllcheck").prop("checked",true);
	}else{
		$("#newAllcheck").prop("checked",false);
	}
}
$("#newAllcheck").on('click',function(){
	$(".table tbody :checkbox").each(function(){
		$(this).prop("checked",$("#newAllcheck").prop("checked"));
	});
	
});

showConfigList();

</script>
<script>


	//定义全局时间范围变量
	newsDateRange = {
						"dateType1":{"min_s_pt":"","max_s_pt":"","min_o_gt":"","max_o_gt":""},
						"dateType2":{"min_s_pt":"","max_s_pt":"","min_o_gt":"","max_o_gt":""},
						"dateType3":{"min_s_pt":"","max_s_pt":"","min_o_gt":"","max_o_gt":""}
					};
	//默认数据源一选中
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
	
	//数据源切换事件
	$(".dataSourceType_news").on("click",function (){
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
		//发布时间的起止时间设置时间范围
		$('#newsStDate_f').datepicker('setStartDate',min_s_pt);  
		$('#newsStDate_f').datepicker('setEndDate',max_s_pt);  
		$('#newsEdDate_f').datepicker('setStartDate',min_s_pt);  
		$('#newsEdDate_f').datepicker('setEndDate',max_s_pt); 
		//发布起止时间设置默认值
		$('#newsStDate_f').val(min_s_pt);
	    $('#newsEdDate_f').val(max_s_pt);
		$('#newsStDate_f').datepicker('setDate',min_s_pt); 
		$('#newsEdDate_f').datepicker('setDate',max_s_pt); 
		//采集时间的起止时间设置时间范围
		$('#newsStDate_c').datepicker('setStartDate',min_o_gt);  
		$('#newsStDate_c').datepicker('setEndDate',max_o_gt);  
		$('#newsEdDate_c').datepicker('setStartDate',min_o_gt);  
		$('#newsEdDate_c').datepicker('setEndDate',max_o_gt); 
		//采集时间的起止时间设置默认值
		$("#newsStDate_c").val(min_o_gt);
	    $("#newsEdDate_c").val(max_o_gt);
	    $('#newsStDate_c').datepicker('setDate',min_o_gt); 
	    $('#newsEdDate_c').datepicker('setDate',max_o_gt);
	});
$(function(){
	//ajax获取新闻库采集事件、发布时间的范围（三套数据源一起获取）
	$.ajax({
		url:'../config/findNewsDateRange',
		type:'post',
		dataType:"json",
		success:function(data){
			//将查询的时间范围赋给时间范围的全局变量
			newsDateRange = data;
			//将当前选中的数据源对应的时间范围重新赋值
			var checkedDataSource = $(".dataSourceType_news:checked").val();
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
			
			//将没值的采集、发布时间设置初始值
			if($('#newsStDate_f').val() == ''){
				//发布时间的起止时间设置时间范围
				$('#newsStDate_f').datepicker('setStartDate',min_s_pt);  
				$('#newsStDate_f').datepicker('setEndDate',max_s_pt);  
				$('#newsStDate_f').val(min_s_pt);
				$('#newsStDate_f').datepicker('setDate',min_s_pt); 
			}
			
			if($('#newsEdDate_f').val() == ''){
				//发布时间的起止时间设置时间范围
				$('#newsEdDate_f').datepicker('setStartDate',min_s_pt);  
				$('#newsEdDate_f').datepicker('setEndDate',max_s_pt); 
				$('#newsEdDate_f').val(max_s_pt);
				$('#newsEdDate_f').datepicker('setDate',max_s_pt); 
			}
			
			if($('#newsStDate_c').val() == ''){
				//采集时间的起止时间设置时间范围
				$('#newsStDate_c').datepicker('setStartDate',min_o_gt);  
				$('#newsStDate_c').datepicker('setEndDate',max_o_gt); 
				$('#newsStDate_c').datepicker('setDate',min_o_gt); 
				$("#newsStDate_c").val(min_o_gt);
			}
			
			if($('#newsEdDate_c').val() == ''){
				$('#newsEdDate_c').datepicker('setStartDate',min_o_gt);  
				$('#newsEdDate_c').datepicker('setEndDate',max_o_gt); 
				$('#newsEdDate_c').datepicker('setDate',max_o_gt);
				$("#newsEdDate_c").val(max_o_gt);
			}
			
		},
		error:function(){
			win.alertEx("加载采集、发布时间范围失败")
		}
		
	});
	
	
	//内存大小移入显示详细的功能
	queryDataSpace(36);
	
	//配置页面下载框
	$(".table").on("mouseover",".xiazai",function (){
		$(this).siblings(".down").css({"display":"block"});
		$(this).parent().parent().siblings().children().children(".down").css({"display":"none"}); 
	});
	$(".table").on("mouseleave",".down",function (){
		$(this).css({"display":"none"});
	});
	$(".table").on("click",".close_down",function (){
		$(this).parent(".down").css({"display":"none"});
	});
	
	$('select').comboSelect();
	// 下拉框 每一个下拉框对应一个ID，然后调用perfectScrollbar美化滚动条
	$(".dowebok0 ul").attr("id","description0");
	$(".dowebok ul").attr("id","description");
	$(".dowebok2 ul").attr("id","description2");
	$(".dowebok3 ul").attr("id","description3");
	$(".dowebok4 ul").attr("id","description4");
	$(".dowebok5 ul").attr("id","description5");
	$(".dowebok6 ul").attr("id","description6");
	$(".dowebok7 ul").attr("id","description7");
	$(".dowebok8 ul").attr("id","description8");
	
	$('#description0').perfectScrollbar({
      wheelSpeed: 10,
      wheelPropagation: false
    });
	$('#description').perfectScrollbar({
      wheelSpeed: 10,
      wheelPropagation: false
    });
	$('#description2').perfectScrollbar({
      wheelSpeed: 10,
      wheelPropagation: false
    });
    $('#description3').perfectScrollbar({
      wheelSpeed: 10,
      wheelPropagation: false
    });
	$('#description4').perfectScrollbar({
      wheelSpeed: 10,
      wheelPropagation: false
    });
    $('#description5').perfectScrollbar({
      wheelSpeed: 10,
      wheelPropagation: false
    });
    $('#description6').perfectScrollbar({
      wheelSpeed: 10,
      wheelPropagation: false
    });
    $('#description7').perfectScrollbar({
      wheelSpeed: 10,
      wheelPropagation: false
    });
    $('#description8').perfectScrollbar({
        wheelSpeed: 10,
        wheelPropagation: false
     });

    
	
///////////////////////////////////////////////


	$(".input_select").click(function(){
		var ul = $(".dropdown ul");
		if(ul.css("display") == "none"){
			ul.slideDown("fast");
		}else{
			ul.slideUp("fast");
		}
	});

	$(".dropdown ul li a").click(function(){
		var txt = $(this).text();
		$(".input_select").val(txt);
		$(".dropdown ul").hide();
	});

	
/* 事件,图谱类型多选、保存、取消 */
	$("#sec_all_atlas").on('click',function(){
		if(this.checked){
			$("#popup_ul_atlas :checkbox").prop("checked",true);
		}else{
			$("#popup_ul_atlas :checkbox").prop("checked",false);
		}
	});
	
	$("#popup_ul_atlas :checkbox").on('click',function(){
		allCheck2();
	});

	$(".cancel").on('click',function(){
		$(".shadow").css("display","none");
		$(".popup").css("display","none");
		$(".popup2").css("display","none");
	});
	
	$("#save_atlas").on('click',function(){
		save_atlas();
	});
})
  //   -------------------------------------------------------------
  
	function graphDianji(){
		var bodyScrH = document.body.scrollHeight;
			$(".shadow").height(bodyScrH);
			$(".shadow").css("display","block");
			$(".popup2").css("display","block");
	}

	function allCheck2(){
		var chknum = $("#popup_ul_atlas :checkbox").size();
		var chk = 0;
		$("#popup_ul_atlas :checkbox").each(function(){
			if($(this).prop("checked") == true){
				chk++;
			}
		});
		if(chk == chknum){
			$("#sec_all_atlas").prop("checked",true);
		}else{
			$("#sec_all_atlas").prop("checked",false);
		}
	};
	
	function save_atlas(){
		$(".shadow").css("display","none");
		$(".popup2").css("display","none");
		var atlas_type_arr = [];
		var atlas_typeId_arr = [];
		$("#popup_ul_atlas :checkbox").each(function(){
			if($(this).prop("checked") == true){
				atlas_type_arr.push($(this).parent().text().replace(/\s/g,""));
				atlas_typeId_arr.push($(this).val());
			}
		})
		atlas_type_str = atlas_type_arr.join(",");
		atlas_typeId_str = atlas_typeId_arr.join(",");
		$("#atlas_type").val(atlas_type_str);
		$("#typeIds").val(atlas_typeId_str);
	};
	//查询
	function cx(){
		$('#pageIndexNew').val(0);
		showConfigList();
	}
	//鼠标移入时显示信息
	$(".hoverImg").hover(function () {
	    $(this).next().show();
	}, function () {
		$(this).next().hide();
	})
</script>
<jsp:include page="./updateUserPassword.jsp"/>
</body>
</html>