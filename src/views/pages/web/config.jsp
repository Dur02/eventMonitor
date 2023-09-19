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
<title>XX安全检测系统_main</title>
<link rel="stylesheet" href="<%=basePath %>/static/css/style.css"/>
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.min.css"/>

<link rel="stylesheet" href="<%=basePath %>/static/lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath %>/static/css/combo.select.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/perfect-scrollbar.css"/>
<style type="text/css">
	/* .combo-dropdown li{float:left; width:82%;} */
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

<c:if test="${bgFlag == null or bgFlag == 1}">
	<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css"/>
	<link rel="stylesheet" href="<%=basePath %>/static/css/sec2.css"/>
	<script src="<%=basePath %>/static/js/sec2.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
	<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.min.css"/>
	<link rel="stylesheet" href="<%=basePath %>/static/css/sec2_2.css"/>
	<script src="<%=basePath %>/static/js/sec2_2.js"></script>
</c:if>
<script>
//zcm mark st
var rs = null;
function showConfigList(){
	var configName = $('#s_configName').val();
	var creator = $('#s_creator').val();
	var configCategory = $('#typeFilter').val();
	var configFlag = $('#configFlag').val();
	var dt = {
		/*
		configName: configName,
		creator: creator,
		configCategory: configCategory,
		configFlag: configFlag
		*/
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
		}
	});
}

function pageselectCallback(pageIndex, jq){
	initData(pageIndex);
}

function initData(pageIndex){
	var tbodys = '';
	var dt = {
		pageIndex: pageIndex
	};
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
	var tbody = '', trs = '';
	$.each(rs, function(i, item){
		trs += '<tr><td>' + (i + 1) + '</td>';
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
		if(item.isShow == 1){
			trs += '<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>';
		}else if(item.isShow == 2){
			trs += '<td><img class="gq" src="<%=basePath %>/static/images/gq2.png" alt="挂起"></td>';
		}
		
		trs += '<td>' + item.configName + '</td>';
		trs += '<td>' + item.categoryName + '</td>';
		trs += '<td>' + item.creator + '</td>';
		trs += '<td>' + item.createDate + '</td>';
		trs += '<td>' + item.remark + '</td>';
		if(item.scheduleState == 0){
			trs += '<td><img src="<%=basePath %>/static/images/state2.png"/></td>';
		}else if(item.scheduleState == 1){
			trs += '<td><img src="<%=basePath %>/static/images/state2.png"/></td>';
		}else if(item.scheduleState == 2){
			trs += '<td><img src="<%=basePath %>/static/images/state1.png"/></td>';
		}else if(item.scheduleState == 3){
			trs += '<td><img src="<%=basePath %>/static/images/state3.png"/></td>';
		}
		if(item.scheduleState == 2){
			trs += '<td><img class="set" src="<%=basePath %>/static/images/exec2.png"/><img class="set" src="<%=basePath %>/static/images/set.png"/><img class="del" onclick="delConfig('+item.configId+','+item.flid+')" src="<%=basePath %>/static/images/del.png"/></td>';
		}else{																																		
			trs += '<td><img class="set" src="<%=basePath %>/static/images/exec1.png" onclick="execQuery('+ item.configId +',\''+ item.categoryName +'\')"/><img class="set" src="<%=basePath %>/static/images/set.png" onclick="editConfig('+ item.configId +',\''+ item.categoryName +'\')"/><img class="del" onclick="delConfig('+ item.configId+','+item.flid+')" src="<%=basePath %>/static/images/del.png"/></td>';
		}
		trs += '</tr>';
	});
	tbody += trs;
	return tbody;
}

showConfigList();
//zcm mark ed
</script>
</head>
<body style="background:#1d2334;">
	<div class="index_top pos_fix">
		<h3 class="fl title" style="margin:0px;">配置与参数</h3>
		<div class="title_r fr">
			<span class="set_span set_span2" onclick="changeConfig(this, 1);">事件配置</span>
			<span class="set_span" onclick="changeConfig(this, 2);">图谱配置</span>
		</div>
	</div>
	<div class="index_bottom">
		<div class="table_box">
			<ul class="table_ul mgl-30 clearfix">
				<li>事件名称：<input type="text" id="s_configName"/></li>
				<li>
					<div style="float: left; line-height: 20px;">类型筛选：</div>
					<div class="fl clearfix" style="float: left; height:20px;">
						<div class="dowebok0">
							<select id="typeFilter">
								<option value="" selected="selected">全部</option>
								<c:forEach items="${categoryList}" var="category" varStatus="indx">
									<option value="${category.categoryId}">${category.categoryName}</option><br/>
								</c:forEach>
							</select> 
						</div>
					</div>
				</li>
				<li>配置人：<input type="text" id="s_creator"/></li>
				<li><input class="seach_btn" type="button" value="查询" onclick="showConfigList();"></li>
			</ul>
			<table class="table">
				<thead>
					<tr>
						<th>序号</th>
						<th>排序</th>
						<th>挂起</th>
						<th>事件名称</th>
						<th>事件分类</th>
						<th>创建人</th>
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
		<form id="configForm" action="../config/saveConfigInfo" method="post">
		<input type="hidden" name="bgFlag" value="${bgFlag}" />
		<div class="tab2 clearfix">
			<input type="hidden" id="configFlag" name="configFlag" value="1" />
			<input type="hidden" id="typeIds" name="configCategoriesStr"/>
			<!-- 增加属性，用于区分日期属性是年、月、日哪种格式 -->
			<input type="hidden" id="dateType" name="dateType" value="1" />
			
			<!-- 事件配置 -->
			<fieldset class="show">
				<!-- 用于区分事件配置及图谱配置 -->
				<ul class="table_ul clearfix">
					<li><div class="td1_2 fl"><p class="info_png fl"></p><b>信息描述：</b></div></li>
					<li>事件名称：<input type="text" name="configName" id="eventName"/></li>
					<li>事件类型：<input id="event_type" class="event_type" type="text"/></li>
					<li>备注信息：<input type="text" name="remark" id="remark"/></li>
				</ul>
				<!-- 分界线 -->
				<div class="hr"></div>
				
				<div class="tab_down2">
					<ul class="tab_down_info">
						<li class="clearfix">
							<div class="date_box clearfix">
								<div class="td1 fl">
									<p class="time_png fl"></p>
									<b>日期属性：</b>
								</div>
								<%-- <div class="td2 fl">
									<span class="date">年</span><span class="date">月</span><span class="date active_span">日</span>
								</div>
								<div class="td3_2 fl">
									<label class="lab0 yc" for=""><input class="inp_selc year1" name="stDates" type="text" readonly value="${curStDate[0]}"/></label>
									<label class="lab1 yc" for=""><input class="inp_selc month1" name="stDates" type="text" readonly value="${curStDate[1]}"/></label>
									<label class="lab2" for=""><input class="inp_selc day1" name="stDates" type="text" readonly value="${curStDate[2]}"/></label>
								</div>
								<div class="fl width18"></div>
								<div class="td3_2 fl">
									<label class="lab0 yc" for=""><input class="inp_selc year2" name="edDates" type="text" readonly value="${curEdDate[0]}"/></label>
									<label class="lab1 yc" for=""><input class="inp_selc month2" name="edDates" type="text" readonly value="${curEdDate[1]}"/></label>
									<label class="lab2" for=""><input class="inp_selc day2" name="edDates" type="text" readonly value="${curEdDate[2]}"/></label>
								</div> --%>
								<div class="clearfix">
									<div class="td2 fl b_e_date">起止日期</div>
									<div class="td3_2 fl">
										<%-- <label class="lab0 yc" for=""><input class="inp_selc year1" name="stDates" type="text" readonly value="${curStDate[0]}"/></label>
										<label class="lab1 yc" for=""><input class="inp_selc month1" name="stDates" type="text" readonly value="${curStDate[1]}"/></label> --%>
										<label class="lab2" for=""><input class="inp_selc day1" name="stDates" type="text" readonly value="${curStDate[2]}"/></label>
									</div>
									<div class="fl width18"></div>
									<div class="td3_2 fl">
										<%-- <label class="lab0 yc" for=""><input class="inp_selc year2" name="edDates" type="text" readonly value="${curEdDate[0]}"/></label>
										<label class="lab1 yc" for=""><input class="inp_selc month2" name="edDates" type="text" readonly value="${curEdDate[1]}"/></label> --%>
										<label class="lab2" for=""><input class="inp_selc day2" name="edDates" type="text" readonly value="${curEdDate[2]}"/></label>
									</div>
									<div class="add_date_btn"></div>
								</div>
							</div>
						</li>
						<li class="clearfix zindex99">
							<div class="td1 fl"><p class="people_png fl"></p><b>角色属性：</b></div>
							<div class="width544 fl clearfix">
								<div class="td2_2 fl"><span class="span1">角色1</span></div>
								<div class="fl width138 clearfix">
									<div class="dowebok">
										<select name="actor1AttrValues" id="actor1Cty">
											<option value="0" selected="selected">请选择</option>
											<c:forEach items="${countryList}" var="info">
												<option value="${info.country_code}">${info.cnName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								
								<!-- "国家"角色属性值 -->
								<input type="hidden" name="actor1Attrs" value="1"/>
								<div class="fl guojia">国家</div>

								<div class="fl width138 clearfix">
									<div class="dowebok2">
										<select name="actor1AttrValues" id="actor1Code">
											<option value="0" selected="selected">请选择</option>
											<c:forEach items="${roleCodeList}" var="role">
												<option value="${role.ACTOR_CODE}">${role.ACTOR_TEXT}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<!-- "编码"角色属性 -->
								<input type="hidden" name="actor1Attrs" value="2" />
								<div class="fl bianma">编码</div>
							</div>
							<div class="width544 fl clearfix">
								<div class="td2_2 fl"><span class="span1">角色2</span></div>
								<div class="fl width138 clearfix">
									<div class="dowebok3">
										<select name="actor2AttrValues" id="actor2Cty">
											<option value="0" selected="selected">请选择</option>
											<c:forEach items="${countryList}" var="info">
												<option value="${info.country_code}">${info.cnName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<!-- "国家"角色属性 -->
								<input type="hidden" name="actor2Attrs" value="1" />
								<div class="fl guojia">国家</div>

								<div class="fl width138 clearfix">
									<div class="dowebok4">
										<select name="actor2AttrValues" id="actor2Code">
											<option value="0" selected="selected">请选择</option>
											<c:forEach items="${roleCodeList}" var="role">
												<option value="${role.ACTOR_CODE}">${role.ACTOR_TEXT}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<!-- "编码"角色属性 -->
								<input type="hidden" name="actor2Attrs" value="2"/>
								<div class="fl bianma">编码</div>
							</div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="event_png fl"></p><b>事件属性：</b></div>
							<div class="width272 fl clearfix">
								<!-- "大类事件编码"事件属性 -->
								<input type="hidden" name="eventAttrs" value="2" />
								<div class="td2_2 fl"><span class="span1">大类事件编码</span></div>
								<!-- <div class="td3_2_2 fl"><input type="text" value="fight"/></div> -->
								<div class="fl width138">
									<div class="dowebok5">
											<select name="eventAttrValues" id="eventAttr2">
												<option value="0">请选择</option>
												<c:forEach items="${quadClassList}" var="quadClass">
													<option value="${quadClass.code}">${quadClass.name}</option>
												</c:forEach>
											</select>
									</div>
								</div>
							</div>
							<div class="width272 fl clearfix">
								<!-- "根类事件编码"事件属性 -->
								<input type="hidden" name="eventAttrs" value="1" />
								<div class="td2_2 fl"><span class="span1">根类事件编码</span></div>
								<!-- <div class="td3_2_2 fl"><input type="text" value="fight"/></div> -->
								<div class="fl width138">
									<div class="dowebok6">
										<select name="eventAttrValues" id="eventAttr1">
											<option value="0">请选择</option>
											<c:forEach items="${rootEventList}" var="root">
												<option value="${root.code}">${root.name}</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
							<div class="width272 fl clearfix">
								<!-- "事件发生位置"事件属性 -->
								<input type="hidden" name="eventAttrs" value="3" />
								<div class="td2_2 fl"><span class="span1">事件发生位置</span></div>
								<!-- <div class="td3_2_2 fl"><input type="text" value="fight"/></div> -->
								<div class="fl width138">
									<div class="dowebok7">
										<select name="eventAttrValues" id="eventAttr3">
											<option value="0" selected="selected">请选择</option>
											<c:forEach items="${countryList}" var="info">
												<option value="${info.nga_country_code}">${info.cnName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="weight_png fl"></p><b>权重依据：</b></div>
							<div class="td5 fl"><input id="radio1" type="radio" name="weightFlag" checked="checked" value="1"><label for="radio1"> 事件出现次数</label></div>
							<div class="td5 fl"><input id="radio2" type="radio" name="weightFlag" value="2"><label for="radio2"> 出现该事件的文章数</label></div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="threshold_png fl"></p><b>事件阈值过滤：</b></div>
							<div class="td5 fl">节点阈值 <input id="reduce1" class="reduce" type="button" value="-" /><input id="threshold1" class="threshold" name="nodeThreshold" type="text" value="200"/><input id="add1" class="add" type="button" value="+" /></div>
							<div class="td5 fl">边阈值 <input id="reduce2" class="reduce" type="button" value="-" /><input id="threshold2" class="threshold" name="edgeThreshold" type="text" value="100000"/><input id="add2" class="add" type="button" value="+" /></div>
						</li>
						<li><input class="submit" type="button" onclick="eventSub();" value="提交"></li>
					</ul>
				</div>
			</fieldset>
			
			<!-- 图谱配置 -->
			<fieldset>
				<!-- <legend class="legend">南海多国热点</legend> -->
				<ul class="table_ul clearfix">
					<li><div class="td1_2 fl"><p class="info_png fl"></p><b>信息描述：</b></div></li>
					<li>事件名称：<input type="text" name="configName" id="gkgName"/></li>
					<li>事件类型：<input id="atlas_type" class="atlas_type" type="text" /></li>
					<li>备注信息：<input type="text" name="gkgRemark" id="gkgRemark"/></li>
				</ul>
				<div class="hr"></div>
				<div class="tab_down2">
					<ul class="tab_down_info">
						<li class="clearfix">
							<div class="td1 fl"><p class="time_png fl"></p><b>日期属性：</b></div>
							<div>当前数据库时间范围：<span>2013-03-01</span>至<span>2016-12-12</span></div>
							<div class="width250 fl clearfix">
								<div class="fl"><span class="beg_time fl">开始时间</span></div>
								<div class="td3_2 fl">
									<label class="lab2" for=""><input class="inp_selc day1" id="gkgStDate" name="gkgStDate" type="text" readonly value="2014-12-01"/></label>
								</div>
							</div>
							<div class="fl clearfix">
								<div class="fl"><span class="end_time fl">结束时间</span></div>
								<div class="td3_2 fl">
									<label class="lab2" for=""><input class="inp_selc day2" id="gkgEdDate" name="gkgEdDate" type="text" readonly value="2014-12-01"/></label>
								</div>
							</div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="threshold_png fl"></p><b>关键字搜索条件：</b></div>
							<div >您必须指定检索的关键词，用逗号隔开；在检索中，以下三个查询条件之间是“AND”关系</div>
							<div class="fl">
								<div class="condition fl">必须包含以下所有关键词</div>
								<input class="cfg_condition_info fl" id="necessaryKey" name="necessaryKey" type="text" value="" />
							</div>
							<div class="fl condition_box2">
								<div class="condition fl">不能包含以下关键词</div>
								<input class="cfg_condition_info fl" id="exclusiveKey" name="exclusiveKey" type="text" value="" />
							</div>
							<div class="fl  condition_box3">
								<div class="condition fl">包含至少一个以下关键词</div>
								<input class="cfg_condition_info fl" id="atLeastOneKey" name="atLeastOneKey" type="text" value="" />
							</div>
						</li>
						<li class="clearfix" style="display: none;" id="yu">
							<div class="td1 fl"><p class="weight_png fl"></p><b>域：</b></div>
							<div>词云里面词语的来源</div>
							<div class="radio_box">
								<!-- mark st -->
								<label for="person"><input type="radio" id="person" name="wordSourceType" value="1" checked="checked"/> 人物</label>
								<label for="gov"><input type="radio" id="gov" name="wordSourceType" value="2"/> 组织</label>
								<label for="gkg"><input type="radio" id="gkg" name="wordSourceType" value="3"/> 主题</label>
								<label for="cty"><input type="radio" id="cty" name="wordSourceType" value="4"/> 国家</label>
								<label for="city"><input type="radio" id="city" name="wordSourceType" value="5"/>城市</label>
								<!-- mark ed -->
							</div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="weight_png fl"></p><b>权重依据：</b></div>
							<div class="radio_box">
								<!-- mark st -->
								<label for="gkgTimes"><input type="radio" id="gkgTimes" name="gkgWeightFlag" value="1" checked="checked"/> 包含所选实体集的新闻报道数</label>
								<label for="gkgArticle"><input type="radio" id="gkgArticle" name="gkgWeightFlag" value="2"/> 包含所选实体集的新闻报道数（新闻去重）</label>
								<!-- mark ed -->
							</div>
						</li>
						<li class="clearfix" style="display: none;" id="lingdaoren">
							<div class="td1 fl"><p class="weight_png fl"></p><b>信息提示：</b></div>
							<div >您必须指定检索的关键字，最多支持3个；在检索中，检索字之间的关系为"OR"。</div>
							<div class="fl"><span class="leader fl">领导人名单</span></div>
							<div class="fl width138 clearfix" style="margin-left:8px;">
								<div class="dowebok8">
									<select name="graph_leader" id="graph_leader">
										<option value="0" selected="selected">请选择</option>
										<c:forEach items="${leaderList}" var="leaderinfo">
											<option>${leaderinfo.leaderName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="fl" style="margin-left:20px;">
								<div class="fl"><span class="leader fl">输入领导人</span></div>
								<!-- 信息提示1 -->
								<input class="cfg_condition_info fl" name="msgCondition1"  type="text"  />
							</div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="threshold_png fl"></p><b>事件阈值过滤：</b></div>
							<div class="td5 fl">节点阈值 <input id="reduce1" class="reduce" type="button" value="-" /><input id="threshold1" class="threshold" name="nodeThreshold" type="text" value="200"/><input id="add1" class="add" type="button" value="+" /></div>
							<div class="td5 fl">边阈值 <input id="reduce2" class="reduce" type="button" value="-" /><input id="threshold2" class="threshold" name="edgeThreshold" type="text" value="100000"/><input id="add2" class="add" type="button" value="+" /></div>
						</li>
						<li><input class="submit" type="button" onclick="gkgSub();" value="提交"></li>
					</ul>
				</div>
			</fieldset>
		</div>
		</form>
	</div>
<div id="shadow" class="shadow"></div>

<!-- 事件分类选择弹出层 -->
<div class="popup">
	<div class="popup_t">
		<h3 class="popup_h3 fl">事件分类</h3>
		<label class="check_z" for=""><input id="sec_all_event" class="sec_all"  type="checkbox" > 全选</label>
	</div>
	<div class="popup_m">
		<ul id="popup_ul_event" class="popup_ul  clearfix">
			<c:forEach items="${categoryList}" var="category" varStatus="indx">
				<li><label for="event${indx.index + 1}"><input id="event${indx.index + 1}" type="checkbox" value="${category.categoryId}"> ${category.categoryName}</label></li>
			</c:forEach>
		</ul>
	</div>
	<div class="popup_b">
		<p class="fr">
			<span id="save_event" class="save">确定</span>
			<span class="cancel">取消</span>
		</p>
	</div>
</div>

<!-- 图谱分类选择弹出层 -->
<div class="popup2">
	<div class="popup_t">
		<h3 class="popup_h3 fl">图谱分类</h3>
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

<script src="<%=basePath %>/static/js/yuzhi.js"></script>
<script>
$(function(){
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
	//添加起止日期
	 data_html ="<div class='add_date clearfix' id='appendData1'>"+
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
                            "<div class='del_date_btn'></div>"+
                       " </div>"+
                    "</div>";
   	 data_htmls ="<div class='add_date clearfix' id='appendData2'>"+
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
    	$(this).parent().parent().remove();
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

	var bodyScrH = document.body.scrollHeight;
	$(".event_type").focus(function(){
		$(".shadow").height(bodyScrH);
		$(".shadow").css("display","block");
		$(".popup").css("display","block");
	});
	$(".atlas_type").focus(function(){
		$(".shadow").height(bodyScrH);
		$(".shadow").css("display","block");
		$(".popup2").css("display","block");
	});

	$(".shadow").on('click',function(){
		$(".shadow").css("display","none");
		$(".popup").css("display","none");
		$(".popup2").css("display","none");

	});
/* 事件,图谱类型多选、保存、取消 */
	$("#sec_all_event").on('click',function(){
		if(this.checked){
			$("#popup_ul_event :checkbox").prop("checked",true);
		}else{
			$("#popup_ul_event :checkbox").prop("checked",false);
		}
	});
	
	$("#popup_ul_event :checkbox").on('click',function(){
		allCheck();
	});

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
	
	$("#save_event").on('click',function(){
		save_event();
	});
	
	$("#save_atlas").on('click',function(){
		save_atlas();
	});
})
	function allCheck(){
		var chknum = $("#popup_ul_event :checkbox").size();
		var chk = 0;
		$("#popup_ul_event :checkbox").each(function(){
			if($(this).prop("checked") == true){
				chk++;
			}
		});
		if(chk == chknum){
			$("#sec_all_event").prop("checked",true);
		}else{
			$("#sec_all_event").prop("checked",false);
		}
	};
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
	
	function save_event(){
		var flagi = 0;
		var flagp = 0;
		var event_type_arr = [];
		var event_typeId_arr = [];
		
		$("#popup_ul_event :checkbox").each(function(){
			if($(this).prop("checked") == true){
				ll = $(".add_date .clearfix").length;
				event_type_arr.push($(this).parent().text().replace(/\s/g,""));
				event_typeId_arr.push($(this).val());
				//判断选中的中是否有7(对比展示)  添加按钮显示
				if($(this).val() == 7 ){
					flagp = 1;
					$(".add_date_btn").show();
				}
				
				//判断选中的是否有15(事件综合展示)12(事件国家态势感知)   显示2个时间框
				if($(this).val() == 15){
					flagi = 1;
					if(ll==0){
						$(".date_box").append(data_htmls);
						$(".del_date_btn").hide();
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
				    	});
					}
				}
				if($(this).val()==12){
					flagi = 1;
					if(ll==0){
						$(".date_box").append(data_htmls);
						$(".del_date_btn").hide();
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
				    	});
					}
				}
				
			}
		})
		if(ll > 1){
			$("#appendData2").remove();
		} 
		if(flagp == 1){
			$(".add_date_btn").show();
		}else{
			$(".add_date_btn").hide();
			$("#appendData1").remove();
		}
		if(flagi != 1){
			$("#appendData2").remove();
			$("#appendData1").remove();
		}
		
		event_type_str   = event_type_arr.join(",");
		event_typeId_str = event_typeId_arr.join(",");
		$("#event_type").val(event_type_str);
		$("#typeIds").val(event_typeId_str);
		$(".shadow").css("display","none");
		$(".popup").css("display","none");
	};
	
	function save_atlas(){
		var flago = 0;
		var flagp = 0;
		var atlas_type_arr = [];
		var atlas_typeId_arr = [];
		$("#popup_ul_atlas :checkbox").each(function(){
			if($(this).prop("checked") == true){
				atlas_type_arr.push($(this).parent().text().replace(/\s/g,""));
				atlas_typeId_arr.push($(this).val());
				//判断选中的是否有17(图谱领导人头像标签云)  显示领导人名单
				if($(this).val() == 17){
					flago = 1;
				}
				if($(this).val()==23||$(this).val()==24||$(this).val()==29){
					flagp = 1;
				}
			}
		})
		if(flago == 1){
			document.getElementById("lingdaoren").style.display = "";
		}else{
			document.getElementById("lingdaoren").style.display = "none";
		}
		if(flagp == 1){
			document.getElementById("yu").style.display = "";
		}else{
			document.getElementById("yu").style.display = "none";
		}
		atlas_type_str = atlas_type_arr.join(",");
		atlas_typeId_str = atlas_typeId_arr.join(",");
		$("#atlas_type").val(atlas_type_str);
		$("#typeIds").val(atlas_typeId_str);
		$(".shadow").css("display","none");
		$(".popup2").css("display","none");
	};
	
</script>
</body>
</html>