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
<title>图谱配置</title>
<!-- 弹出层需引进，并放在所有css上面，以避免冲突 -->
<link rel="stylesheet" href="<%=basePath %>/static/css/animate.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/dialog.css">
<!-- 弹出层需引进结束 -->
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/style.css"/>
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.min.css"/>
<link rel="stylesheet" href="<%=basePath %>/static/css/eventConfig.css"/>

<link rel="stylesheet" href="<%=basePath %>/static/lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath %>/static/css/combo.select.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/perfect-scrollbar.css"/>
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window.css"/><!-- 弹出提示框样式 -->
<link rel="stylesheet" href="<%=basePath %>/static/css/waringhover.css"/><!-- 内存大小移入样式 -->
<style type="text/css">
	.combo-dropdown li{float:left; width:100%;}
	.newFuxuankuang{vertical-align:middle;}
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
<form id="gkgConfigForm" class="clearfix" action="../config/updateConfigInfo" method="post">
	<div class="index_top pos_fix">
		<h3 class="fl title" style="margin:0px;">配置管理 > 图谱配置</h3>
		<div class="title_r fr" style="display:none;">
			<!-- <span class="set_span set_span2" onclick="changeConfig(this, 1);">事件配置</span> -->
			<span class="set_span" onclick="changeConfig(this, 2);">图谱配置</span>
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
				<li>配置人：<input type="text" id="s_creator"/></li>
				<li><input class="seach_btn" type="button" value="查询" onclick="cx()"></li>
				<li><input type="button" class="addbutton" value="新增配置" onclick="addConfig();"></li>
				<li><input type="button" class="addbutton" value="批量删除" onclick="delAll();"></li>
				<li class="waring"><img id="weixian" style="vertical-align: -webkit-baseline-middle; display: none; cursor: pointer;" src="<%=basePath %>/static/images/caution.png" ></li>
					<li class="protect"><img id="anquan" style="vertical-align: -webkit-baseline-middle;display: none; cursor: pointer;"  src="<%=basePath %>/static/images/not_caution.png" ></li>
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
	
		<input type="hidden" id="aa" value="" name="configId"/>
		<input type="hidden" id="pageIndexNew" value="0"/>
		<input type="hidden" name="bgFlag" value="${bgFlag}" id="bgFlag"/>
		<div class="tab2 clearfix" style="display:none;" id="infodiv">
			
			<input type="hidden" id="configFlag" name="configFlag" value="2" />
			<input type="hidden" id="typeIds" name="configCategoriesStr"/>
			
			<!-- 增加属性，用于区分日期属性是年、月、日哪种格式 -->
			<input type="hidden" id="dateType" name="dateType" value="1" />
			
			
			
			<!-- 图谱配置 -->
			<fieldset class="show" style="display:none;position:relative;">
				<div class="pos_shadow2"></div>
				<!-- <legend class="legend">南海多国热点</legend> -->
				<ul class="table_ul clearfix">
					<li><div class="td1_2 fl"><p class="info_png fl"></p><b>基本信息：</b></div></li>
					<li>配置名称：<input type="text" name="configName" id="gkgName"/></li>
					<li>配置类型：<input id="atlas_type" class="atlas_type" type="text" name="graph_type" onclick="graphDianji()"readonly/></li>
					<li>备注信息：<input type="text" name="gkgRemark" id="gkgRemark"/></li>
					<li class="clearfix">优先级：<input style="width:20px;" type="text" name="priority" value="1" id="yxj" onblur="jiaoyan()"/>
					<span id="yxjspan" style="display:none;float: right;"><img src="<%=basePath %>/static/images/delete.png" style="margin-top: -2px;"></img></span>
					</li>
					<li style="margin-right:0px;">权限：
						<div style="width: 60px; display: inline-block;">
							<select class="fl" id="isPrivate" name="isPrivate">
								<option value="1">私有</option>
								<option value="2">公开</option>
							</select>
						</div>
					</li>
				</ul>
				<div class="hr"></div>
				<div class="tab_down2" style="margin-bottom:6px;">
					<div class="high_search_con" style="margin-top: 30px;">
						<ul class="tab_down_info">
							<li class="clearfix" id="riqi">
							<div class="date_box clearfix">
								<div class="td1 fl"><p class="time_png fl"></p><b>日期属性：</b></div>
								<div style="position:absolute; left:140px; top:-20px">当前数据库时间范围：<span id="stDateSpan"></span>至<span id="edDateSpan"></span></div>
								<div id="time_be_box" class="clearfix" style="width: 95%;">
									<div class="clearfix">
										<div class="width250 fl clearfix">
											<div class="fl"><span class="beg_time fl">开始时间</span></div>
											<div class="td3_2 fl">
												<label class="lab2" for=""><input class="inp_selc day1" id="gkgStDate" name="gkgStDate" value="${curStDate[2]}" type="text" readonly/></label>
											</div>
										</div>
										<div class="fl clearfix">
											<div class="fl"><span class="end_time fl">结束时间</span></div>
											<div class="td3_2 fl">
												<label class="lab2" for=""><input class="inp_selc day2" id="gkgEdDate" name="gkgEdDate" value="${curEdDate[2]}" type="text" readonly/></label>
											</div>
										</div>
									    <div class="add_date_btn"></div>
									 </div>
								</div>
								<div class="high_search" style="margin-top: -40px;">高级查询</div>
							</div>
							</li>
							<div class="ulli">
						   <li class="clearfix" id="guanjianzi">
								<!-- <div class="td1 fl"><p class="threshold_png fl"></p><b>关键字搜索条件：</b></div>
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
								</div> -->
								<div class="td1 fl"><p class="threshold_png fl"></p><b style="line-height:15px;">关键字搜索：</b></div>
								<div style="margin-bottom:-6px;margin-left: 56px;">逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如  (A && B && !D)||C </div>
								<div class="radio_box">
									<input class="condition_info_graph_ids2 fl" type="text" id="gkgKeyWord" name="gkgKeyWord" onchange="validateKeyWords(this)"/>
									<span id="gkgKeyWordSpan" style="position:relative;left:20px;width:40px;color: red"></span>
								</div>
							</li> 
							
							<li class="clearfix" style="display: none;" id="yu">
								<div class="td1 fl"><p class="weight_png1 fl"></p><b>词语来源：</b></div>
								<div class="radio_box radio_box_qz_yu">
									<!-- mark st -->
									<label for="person"><input type="radio" id="person" name="wordSourceType" value="1" checked="checked"/> 人物</label>
									<label for="gov"><input type="radio" id="gov" name="wordSourceType" value="2"/> 组织</label>
									<label for="gkg"><input type="radio" id="gkg" name="wordSourceType" value="3"/> 主题</label>
									<label for="cty"><input type="radio" id="cty" name="wordSourceType" value="4"/> 国家</label>
									<label for="city"><input type="radio" id="city" name="wordSourceType" value="5"/> 城市</label>
									<!-- mark ed -->
								</div>
							</li>
							<li class="clearfix" style="display: none;" id="lingdaoren">
								<div class="td1 fl"><p class="weight_png2 fl"></p><b>人物信息：</b></div>
								<div class="fl"><span class="beg_time fl">人物名单</span></div>
								<input type="hidden" id="leaderhide" name="leaderNameIn"/>
								<div id="leaderid" class="fl width138 clearfix" style="margin-left:4px;">
									<div class="dowebok8">
										<select name="leaderName" id="graph_leader" onchange="findLeaderKeyWordByName(this)">
											<option value="0" selected="selected"></option>
											<c:forEach items="${leaderList}" var="leaderinfo">
												<option value="${leaderinfo.leaderName}">${leaderinfo.leaderChName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="fl" style="margin-left: 10px;margin-top: 5px;margin-left: 10px;margin-right: 5px;"><span class="fl">关键字 :</span></div>
								<div class="radio_box">
									<input class="condition_info_graph_ids2 fl" style="width: 400px;" type="text" id="leaderKeyWord" name="leaderKeyWord" onchange="validateKeyWords(this)"/>
									<span id="leaderKeywordSpan" style="position:relative;left:20px;width:40px;color: red"></span>
								</div>
								<!-- <input type="text" id="indata" name="keywordleader"> -->
							</li>
							<!-- 情感值 -->
							<li class="clearfix"  id="tone" >
								<div class="td1 fl"><p class="tone_png fl"></p><b style="line-height:15px;">情感值：</b></div>
								<div class="radio_box " id="toone" >
									<label for="avgtone" style="float: left;padding-right: 37px;margin-top: 4px;"><input type="checkbox"  id="avgtone" name="sxIds" value="1"/> 平均情感</label>
									<label  style="display:none;float: left;padding-right: 15px;" class="avg" >
										<input style="width:42px;" class="default_input fl" id="avgtone1"  type="text" value="-100" name ="qsSXZ" onblur="validate1()"/>
										<span class="fl ljX">—</span>
										<input style="width:42px;" class="default_input fl" id="avgtone2"  type="text" value="100" name ="jsSXZ" onblur="validate11()" />
										<span id="spana" style="display:none;float: right;"><img src="<%=basePath %>/static/images/delete.png" style="margin-top: -2px;"></img></span>
									</label>
									
									<label for="Positive" style="float: left;padding-right: 15px;margin-top: 4px;"><input type="checkbox" id="Positive" name="sxIds" value="2" /> 正向情感词比例</label>
									<label style="display:none;float: left;padding-right: 15px;" class="pos">
										<input style="width:42px;" class="default_input fl" id="Positive1"  type="text" value="0" name ="qsSXZ" onblur="validate2()"/>
										<span class="fl ljX">—</span>
										<input style="width:42px;" class="default_input fl" id="Positive2"  type="text" value="100" name ="jsSXZ"  onblur="validate22()"/>
										<span id="spanb" style="display:none;float: right;"><img src="<%=basePath %>/static/images/delete.png" style="margin-top: -2px;"></img></span>
									</label>
								</div>
							</li>
							<li class="clearfix"  id="tone1">
								<div class="radio_box " id="toone2" >	
									<label for="Negative" style="float: left;padding-left: 139px;height: 38px;padding-right: 13px;margin-top: 4px;"><input type="checkbox" id="Negative" name="sxIds" value="3" /> 负情感词比例</label>
									<label style="display:none;float: left;padding-right: 15px;" class="neg">
										<input style="width:42px;" class="default_input fl" id="Negative1"  type="text" value="0" name ="qsSXZ" onblur="validate3()"/>
										<span class="fl ljX">—</span>
										<input style="width:42px;" class="default_input fl" id="Negative2"  type="text" value="100" name ="jsSXZ"  onblur="validate33()"/>
										<span id="spanc" style="display:none;float: right;"><img src="<%=basePath %>/static/images/delete.png" style="margin-top: -2px;"></img></span>
									</label>
									<label for="Polarity" style="float: left;padding-right: 39px;margin-top: 4px;"><input type="checkbox" id="Polarity" name="sxIds" value="4" /> 极性词比例</label>
									<label style="display:none;float: left;padding-right: 23px;" class="pol">
										<input style="width:42px;" class="default_input fl" id="Polarity1"  type="text" value="0" name ="qsSXZ" onblur="validate4()"/>
										<span class="fl ljX">—</span>
										<input style="width:42px;" class="default_input fl" id="Polarity2"  type="text" value="100" name ="jsSXZ"  onblur="validate44()"/>
										<span id="spand" style="display:none;float: right;"><img src="<%=basePath %>/static/images/delete.png" style="margin-top: -2px;"></img></span>
									</label>
								</div>
									
							</li>
							<li class="clearfix"  id="tone2">
								<div class="radio_box " id="toone2" >
									<label for="Activitytone" style="float: left;padding-left: 139px;height: 38px;padding-right: 25px;margin-top: 4px;"><input type="checkbox" id="Activitytone" name="sxIds" value="5" /> 活动词比例</label>
									<label style="display:none;float: left;padding-right: 15px;" class="act">
										<input style="width:42px;" class="default_input fl" id="Activitytone1"  type="text" value="0" name ="qsSXZ" onblur="validate5()"/>
										<span class="fl ljX">—</span>
										<input style="width:42px;" class="default_input fl" id="Activitytone2"  type="text" value="100" name ="jsSXZ"  onblur="validate55()"/>
										<span id="spane" style="display:none;float: right;"><img src="<%=basePath %>/static/images/delete.png" style="margin-top: -2px;"></img></span>
									</label>
									<label for="Grouptone" style="float: left;padding-right: 51px;margin-top: 4px;"><input type="checkbox" id="Grouptone" name="sxIds" value="6" /> 代称比例</label>
									<label style="display:none;float: left;padding-right: 15px;" class="gro">
										<input style="width:42px;" class="default_input fl" id="Grouptone1"  type="text" value="0" name ="qsSXZ" onblur="validate6()"/>
										<span class="fl ljX">—</span>
										<input style="width:42px;" class="default_input fl" id="Grouptone2"  type="text" value="100" name ="jsSXZ"  onblur="validate66()"/>
										<span id="spanf" style="display:none;float: right;"><img src="<%=basePath %>/static/images/delete.png" style="margin-top: -2px;"></img></span>
									</label>
								</div>
							</li>
							<li class="clearfix" id="IDs">
								<div class="td1 fl"><p class="ids_png fl"></p><b style="line-height:15px;">ID集合：</b></div>
								<div  style="margin-bottom:-6px;margin-left: 56px;">支持多个事件ID的精确查询,输入形式包括1.多个ID之间用","(英文)分割,如:256,257;2.两个ID之间用"-"分割,表示事件ID的范围</div>
								<div class="radio_box">
									<input class="condition_info_graph_ids2 fl" type="text" id="ids" name="ids" onchange="validateIDs()"/>
									<span id="IDspan" style=" position:relative;left:20px;width: 40px" name="IDspan" ></span>
								</div>
							</li>
							<!-- <li class="clearfix">
								<div class="td1 fl"><p class="weight_png fl"></p><b>高级查询：</b></div>
								<div class="clearfix fl homeNotShow">
									<div class="fl" style="float: left;">
										<input class="condition_info_graph_ids2 fl" style="width: 500px; margin-top: 5px;" type="text" id="customQuery" name="customQuery"/>
									</div>
								</div>
							</li> -->
							<!-- 比重 -->
							<li class="clearfix" id="bizhong" style="display: none;">
								<div class="td1 fl"><p class="tjyj_png fl"></p><b>统计依据：</b></div>
								<div class="td5_event fl"><input id="tjradio1" type="radio" name="valueWeight" checked="checked" value="1"><label for="tjradio1"> 比重</label></div>
								<div class="td5_event fl"><input id="tjradio2" type="radio" name="valueWeight" value="2"><label for="tjradio2"> 数量</label></div>
							</li>
							<li class="clearfix" id="quanzhong">
								<div class="td1 fl"><p class="weight_png fl"></p><b>权重依据：</b></div>
								<div id="quanzhong2">
									<div class="radio_box radio_box_qz fl" style="width: 29%;">
										<!-- mark st -->
										<label for="gkgTimes"><input type="radio" id="gkgTimes" name="gkgWeightFlag" value="1" checked="checked"/> 包含所选实体集的新闻报道数（1）</label>
										<label for="gkgArticle"><input type="radio" id="gkgArticle" name="gkgWeightFlag" value="2"/> 包含所选实体集的新闻报道数（NUMARTS）</label>
										<!-- mark ed -->
									</div>
								</div>
								<div id="baodaoshu" class="fl" style="width: 30%;display:none;">
									<b class="sjsx">报道数：</b>
									<input class="condition_info_ids" style="width:42px;" type="text" id="stNUMARTS" name="stNUMARTS"/><span>—</span><input class="condition_info_ids" style="width:42px;" type="text" id="edNUMARTS" name="edNUMARTS"/>
								</div>
							</li>
							<li class="clearfix" style="display: none;" id="yuzhi">
								<div class="td1 fl"><p class="threshold_png fl"></p><b>事件阈值过滤：</b></div>
								<div class="td5 fl">节点阈值 <input id="reduce1" class="reduce" type="button" value="-" /><input id="threshold1" class="threshold" name="nodeThreshold" type="text" value="0"/><input id="add1" class="add" type="button" value="+" /></div>
								<div class="td5 fl">边阈值 <input id="reduce2" class="reduce" type="button" value="-" /><input id="threshold2" class="threshold" name="edgeThreshold" type="text" value="0"/><input id="add2" class="add" type="button" value="+" /></div>
							</li>
							<li><input class="submit" type="button" onclick="gkgSub(1);" value="提交" id="scheduleState1"></li>
						</div>
						</ul>
						<div class="test_triangle_border property_case">
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
								<textarea class="texthtml" id="customQuery" name="customQuery"></textarea>
								<div class="sub"><input class="submit" type="button" onclick="gkgSub(2);" style="bottom: 0px;right: 0px;position: relative;" value="提交" id="scheduleState2"></div><div class="clearfloat"></div> 
					        </div>
					    </div>
				    </div>
					<div class="pos_shadow"></div>
				</div>
			</fieldset>
		</div>
		</form>
		
	</div>
<div id="shadow" class="shadow"></div>
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
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<script>

$('.high_search').on('click',function(){
	$('.ulli').toggle();
	$('.property_case').toggle();
	if($('.property_case').css('display') == "block"){
		$('.high_search').css('background','#0087fd')
	}else{
		$('.high_search').css('background','none')
	}
})
function addConfig(){
	$("#sec_all_atlas").prop("checked",false);
	$(".pos_shadow").css("display","none");
	$("#aa").val("");
	var gkgTimeNum = $(".addGkgDate").length;
	for(var i=1;i<=gkgTimeNum;i++){
		var pdid = 'appendGkgTime' + i;
		$("#" + pdid + "").remove();
	}
	$(".add_date_btn").hide();
	$("#infodiv").show();
	$("#atlas_type").attr('onclick','graphDianji()');
	$("input[name='configName']").val(""); 
	$("input[name='graph_type']").val(""); 
	$("#customQuery").val("");
	$("#stNUMARTS").val(""); 
	$("#edNUMARTS").val(""); 
	$("input[name='remark']").val("");
	$("input[name='gkgRemark']").val("");
	$("input[name='priority']").val("1");
	$('#popup_ul_atlas input[type=checkbox]').each(function(){
		$(this).prop('checked', false);
    });
	$("input[name='gkgStDate']").val('${curStDate[2]}');
	$("input[name='gkgEdDate']").val('${curEdDate[2]}');
	/* $("input[name='necessaryKey']").val("");
	$("input[name='exclusiveKey']").val("");
	$("input[name='atLeastOneKey']").val(""); */
	$("#scheduleState1").css("display","block");
	$("#isPrivate option").each(function(){
		if($(this).val()==1){
			$(this).parent().siblings('input[type=text]').val("私有");
			$(this).attr('selected', true);
		}else{
			$(this).attr('selected', false);
		}
	});
	//图谱-域
	$("#person").prop("checked",true);
	//比重
	$("#bizhong").hide();
	$("#tjradio1").prop("checked",true);
	$("#gkgTimes").prop("checked",true);
	//图谱-情感
	$("#avgtone").prop("checked", false);
	$("#avgtone1").val();//设为默认值
	$("#avgtone2").val();//设为默认值
	$(".avg").css("display","none");

	$("#Positive").prop("checked", false);
	$("#Positive1").val();//设为默认值
	$("#Positive2").val();//设为默认值
	$(".pos").css("display","none");

	$("#Negative").prop("checked", false);
	$("#Negative1").val();//设为默认值
	$("#Negative2").val();//设为默认值
	$(".neg").css("display","none");

	$("#Polarity").prop("checked", false);
	$("#Polarity1").val();//设为默认值
	$("#Polarity2").val();//设为默认值
	$(".pol").css("display","none");

	$("#Activitytone").prop("checked", false);
	$("#Activitytone1").val();//设为默认值
	$("#Activitytone2").val();//设为默认值
	$(".act").css("display","none");

	$("#Grouptone").prop("checked", false);
	$("#Grouptone1").val();//设为默认值
	$("#Grouptone2").val();//设为默认值
	$(".gro").css("display","none");
	//事件ID
	$("#ids").val('');
	$("#avgtone1").val("-100");
	$("#avgtone2").val("100");
	$("#Positive1").val("0");
	$("#Positive2").val("100");
	$("#Negative1").val("0");
	$("#Negative2").val("100");
	$("#Polarity1").val("0");
	$("#Polarity2").val("100");
	$("#Activitytone1").val("0");
	$("#Activitytone2").val("100");
	$("#Grouptone1").val("0");
	$("#Grouptone2").val("100");
	//关键字
	$("#gkgKeyWord").val('');
	$("#leaderKeyWord").val('');
	$("#gkgKeyWordSpan").html('');
	$("#IDspan").html('');
	$("#leaderKeywordSpan").html('');
	//人物
	$("#graph_leader option").each(function(){
		if($(this).val()==0){
			$(this).parent().siblings('input[type=text]').val("");
			$(this).attr('selected', true);
		}else{
			$(this).attr('selected', false);
		}
	});
	jiaoyan();
	validate1();validate5();
	validate11();validate55();
	validate2();validate6();
	validate22();validate66();
	validate3();
	validate33();
	validate4();
	validate44();
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
	var tbody = '', trs = '';
	var exec1='exec1';
	var exec2='exec2';
	//处理执行图表两种皮肤的切换
	if(${bgFlag} == 2){
		exec1="exec1_white";
		exec2="exec2_white";
	}
	$.each(rs, function(i, item){
		trs += '<tr><td><input type="checkbox" class="newFuxuankuang" onclick="newFuxuankuang()" data='+item.configId+' data-status='+item.scheduleState+' data-flid='+item.flid+'></td><td>' + (i + 1) + '</td>';
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
		if(${bgFlag} == null || ${bgFlag} == 1){
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
		}
		
		trs += '<td>' + item.configName + '</td>';
		trs += '<td>' + item.categoryName + '</td>';
		if(item.creator == undefined){
			trs += '<td></td>';
		}else{
			trs += '<td>' + item.creator + '</td>';
		}
		trs += '<td>' + item.createDate + '</td>';
		trs += '<td>' + item.remark + '</td>';
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
			if(${sessionScope.LOGINUSER.roleId}==3){//宾客用户没有下载数据功能
				trs += '<td style="position:relative;"><img title="执行" class="set" src="<%=basePath %>/static/images/'+exec2+'.png"/><img title="修改" class="set" src="<%=basePath %>/static/images/set.png" onclick="editConfig('+ item.configId +',\''+ item.categoryName +'\',\''+ item.flid +'\',\''+ item.scheduleState +'\')"/><img title="下载" class="set xiazai" src="<%=basePath %>/static/images/xiazai.png"/><img title="删除" class="del" onclick="delConfig('+item.configId+','+item.flid+')" src="<%=basePath %>/static/images/del.png"/>'
			}else{
				trs += '<td style="position:relative;"><img title="执行" class="set" src="<%=basePath %>/static/images/'+exec2+'.png"/><img title="修改" class="set" src="<%=basePath %>/static/images/set.png" onclick="editConfig('+ item.configId +',\''+ item.categoryName +'\',\''+ item.flid +'\',\''+ item.scheduleState +'\')"/><img title="下载" class="set xiazai" src="<%=basePath %>/static/images/xiazai.png"/><img title="删除" class="del" onclick="delConfig('+item.configId+','+item.flid+')" src="<%=basePath %>/static/images/del.png"/>'
				if(item.paths!=undefined){
					trs +='<div class="down" >';
					for(var i=0;i<item.paths.length;i++){
						trs+='<p class="down_p" onclick=dowoladFile('+item.paths[i].id+')>'+item.paths[i].dataTypeName+'</p>'
					}
					trs+='</div></td>';
				}
			}
		}else if(item.scheduleState == 1){//执行中
			trs += '<td><img title="执行" class="set tijiao'+item.configId+'" src="<%=basePath %>/static/images/'+exec1+'.png" /><img title="修改" class="set" src="<%=basePath %>/static/images/set.png" onclick="editConfig('+ item.configId +',\''+ item.categoryName +'\',\''+ item.flid +'\',\''+ item.scheduleState +'\')"/><img title="下载" class="set xiazai" src="<%=basePath %>/static/images/xiazai.png"/><img title="删除" class="del" onclick="delConfig('+ item.configId+','+item.flid+')" src="<%=basePath %>/static/images/del.png"/></td>';
		}else if(item.scheduleState == 4){//排队中
			trs += '<td><img title="执行" class="set tijiao'+item.configId+'" src="<%=basePath %>/static/images/'+exec1+'.png" /><img title="修改" class="set" src="<%=basePath %>/static/images/set.png" onclick="editConfig('+ item.configId +',\''+ item.categoryName +'\',\''+ item.flid +'\',\''+ item.scheduleState +'\')"/><img title="下载" class="set xiazai" src="<%=basePath %>/static/images/xiazai.png"/><img title="删除" class="del" onclick="delConfig('+ item.configId+','+item.flid+')" src="<%=basePath %>/static/images/del.png"/></td>';
		}else{																																	
			<%-- trs += '<td><img title="执行" class="set tijiao'+item.configId+'" src="<%=basePath %>/static/images/'+exec1+'.png" onclick="updateConfigStatus('+ item.configId +')"/><img title="修改" class="set" src="<%=basePath %>/static/images/set.png" onclick="editConfig('+ item.configId +',\''+ item.categoryName +'\',\''+ item.flid +'\')"/><img title="下载" class="set xiazai" src="<%=basePath %>/static/images/xiazai.png"/><img title="删除" class="del" onclick="delConfig('+ item.configId+','+item.flid+')" src="<%=basePath %>/static/images/del.png"/></td>'; --%>
			trs += '<td><img title="执行" class="set tijiao'+item.configId+'" src="<%=basePath %>/static/images/'+exec1+'.png" onclick="execQuery('+ item.configId +')"/><img title="修改" class="set" src="<%=basePath %>/static/images/set.png" onclick="editConfig('+ item.configId +',\''+ item.categoryName +'\',\''+ item.flid +'\')"/><img title="下载" class="set xiazai" src="<%=basePath %>/static/images/xiazai.png"/><img title="删除" class="del" onclick="delConfig('+ item.configId+','+item.flid+')" src="<%=basePath %>/static/images/del.png"/></td>';
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

//zcm mark ed
</script>
<script>
$(function(){
	
	//内存大小移入显示详细的功能
	queryDataSpace(2);
	
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
	
	//提示开始和结束时间赋值
	$("#edDateSpan").html('${maxDate[2] }');
	$("#stDateSpan").html('${minDate[2] }');
	//控制Tone字段的显示问题
	gkgToneIsShow();
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
	 data_html ="<div class='addGkg clearfix' style='margin-left:140px; margin-top:10px;'>"+
		 			"<div class='width250 fl clearfix'>"+
                        "<div class='fl'><span class='beg_time fl'>开始时间</span></div>"+
                            "<div class='td3_2 fl'>"+
                            "<label class='lab2'><input class='inp_selc day1' id='gkgStDate' name='gkgStDate' type='text' readonly value='${curStDate[2]}'/></label>"+
                        	"</div>"+
                    "</div>"+
                    "<div class='fl clearfix'>"+
                            "<div class='fl'><span class='end_time fl'>结束时间</span></div>"+
                            "<div class='td3_2 fl'>"+
                                "<label class='lab2'><input class='inp_selc day2' id='gkgEdDate' name='gkgEdDate' type='text' readonly value='${curEdDate[2]}'/></label>"+
                            "</div>"+
                    "</div>"+
                    "<div class='del_date_btn'></div>"+
                 "</div>";
    $(".add_date_btn").on("click",function(){
    	$("#time_be_box").append(data_html);
    	
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
    	$(this).parent().remove();
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
		if(atlas_typeId_str.indexOf("17")!=-1){//是否包含该人物
			if(atlas_typeId_str.indexOf("17")==0&&atlas_typeId_str.length==2){//只有人物
				$("#guanjianzi").hide();
				document.getElementById("lingdaoren").style.display = "";
				return;
			}
			document.getElementById("lingdaoren").style.display = "";
		}else{
			$("#guanjianzi").show();
			document.getElementById("lingdaoren").style.display = "none";
		}
		if(atlas_typeId_str.indexOf("31")!=-1){//图谱时间线
			document.getElementById("bizhong").style.display = "";
		}else{
			document.getElementById("bizhong").style.display = "none";
		}
		if(atlas_typeId_str.indexOf("23")!=-1||atlas_typeId_str.indexOf("24")!=-1){//网络图  标签云
			document.getElementById("yu").style.display = "";
		}else{
			document.getElementById("yu").style.display = "none";
		}
		if(atlas_typeId_str.length==2&&atlas_typeId_str.indexOf("16")==0){
			$("#guanjianzi").hide();
			$("#tone").hide();
			$("#tone1").hide();
			$("#tone2").hide();
			$("#IDs").hide();
		}else if(atlas_typeId_str.length==2&&atlas_typeId_str.indexOf("27")==0){
			$("#guanjianzi").hide();
			$("#tone").hide();
			$("#tone1").hide();
			$("#tone2").hide();
			$("#IDs").hide();
		}else if(atlas_typeId_str.length==5&&atlas_typeId_str.indexOf("16")==0&&atlas_typeId_str.indexOf("27")==3){
			$("#guanjianzi").hide();
			$("#tone").hide();
			$("#tone1").hide();
			$("#tone2").hide();
			$("#IDs").hide();
		}else{
			$("#guanjianzi").show();
			$("#tone").show();
			$("#tone1").show();
			$("#tone2").show();
			$("#IDs").show();
		}
		if(atlas_typeId_str.length==0){
			$("#guanjianzi").show();
			$("#tone").show();
			$("#tone1").show();
			$("#tone2").show();
			$("#IDs").show();
		}
		if(atlas_typeId_str.indexOf("35")!=-1 && atlas_typeId_str.length==2){//图谱展示，显示报道数
			$("#baodaoshu").show();
			$("#baodaoshu").css("padding","0px 0px");
			$("#baodaoshu").css("margin-top","9px");
			$("#quanzhong2").hide();
		}else if(atlas_typeId_str.indexOf("35")!=-1 && atlas_typeId_str.length>3){
			$("#baodaoshu").show();
			$("#baodaoshu").css("padding","0px 0px");
			$("#baodaoshu").css("margin-top","0px");
			$("#quanzhong2").show();
		}else{
			$("#baodaoshu").hide();
			$("#quanzhong2").show();
		}
	};
	//查询
	function cx(){
		$('#pageIndexNew').val(0);
		showConfigList();
	}
</script>
<jsp:include page="./updateUserPassword.jsp"/>
</body>
</html>