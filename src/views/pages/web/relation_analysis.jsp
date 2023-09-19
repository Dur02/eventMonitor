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
<title>关联分析</title>
<!-- 弹出层需引进，并放在所有css上面，以避免冲突 -->
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/animate.css">
<!-- 弹出层需引进结束 -->
<link rel="stylesheet" href="<%=basePath %>/static/css/dialog.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/style.css"/>
<link rel="stylesheet" href="<%=basePath %>/static/css/eventConfig.css"/>

<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.min.css"/>
<link rel="stylesheet" href="<%=basePath %>/static/lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath %>/static/css/combo.select.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/perfect-scrollbar.css"/>
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window.css"/><!-- 弹出提示框样式 -->
<link rel="stylesheet" href="<%=basePath %>/static/css/waringhover.css"/><!-- 内存大小移入样式 -->

<style type="text/css">
	.combo-dropdown li{float:left; width:100%;}
	.hcd_main_border{position:absolute!important;}
	.newFuxuankuang{vertical-align:middle;}
	/* 弹出框的样式 */
	.window-panel .content {
    	padding: 9px 5px 0px 5px;
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
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/hsCheckData.js"></script>

<!-- 弹出层-->

<!-- 两种皮肤切换 -->
<c:if test="${bgFlag == null or bgFlag == 1}">
	<!-- 日期插件的两种样式 -->
	<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css"/>
	<link rel="stylesheet" href="<%=basePath %>/static/css/sec2.css"/>
	<script src="<%=basePath %>/static/js/sec2.js"></script>
	<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
	<link rel="stylesheet" href="<%=basePath %>/static/css/hsCheckData.css"/>
</c:if>
<c:if test="${bgFlag == 2}">
	<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.min.css"/>
	<link rel="stylesheet" href="<%=basePath %>/static/css/sec2_2.css"/>
	<script src="<%=basePath %>/static/js/sec2_2.js"></script>
	<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
	<link rel="stylesheet" href="<%=basePath %>/static/css/hsCheckData2.css"/>
</c:if>
<style>

	.pzlx_td{
		text-overflow: ellipsis;
	    white-space: nowrap;
	    width: 101px;
	    max-width: 194px;
	    overflow: hidden;
	    cursor: pointer;
	}
	.pz_tab_box{
	    margin-top: 17px;
	    margin-left: 20px;
	}
	.pz_tab{
		line-height: 26px;
	    border: 1px solid #33499a;
	    width: 89px;
	    height: 26px;
	    text-align: center;
	    font-size: 14px;
	    vertical-align: middle;
		float: left;
		background: #C3D71;
	}
	
	.pz_tab_select{
	    color: #4bc5a3;
		background: url(<%=basePath %>/static/images/tab_select_bg.png) ;
	}
	.pz_tab_not_select{
	    color: #b5a5a5;
		background: url(<%=basePath %>/static/images/tab_notselect_bg.png) ;
	}
	.tab_down2{
		margin-top: 84px;
	}
	
	/* 弹出框 */
	.check_z {
	    float: right;
	    margin-top: 0px!important;
	    margin-right: 0px!important;
	}
	.popup_h3 {
	    color: white;
	    padding-top: 8px;
	    margin-top: -3px;
	}
	.popup {
	   	width: 550px;
	}
	
	.popup_m{
	    height: 284px;
	}
	
	.popup_t {
		width: 550px;
	}
	.popup_b {
		height: 44px;
	}
	
	.pz_box{
	    width: 31%;
	    height:266px;
	    float: left;
	    margin-top: 13px;
	}
	
	.pz_title{
		width:100%;
		height: 10px;
		text-align: left;
		font-size: 15px;
	}
	
	.pz_title_select{
	    color: #07A8D7
	}
	.pz_title_not_select{
	    color: #2E759E
	}
	
	.pz_list_box{
		margin-top: 14px;
	}
	
	.pzlx_box{
	    line-height: 26px;
	    width: 151px;
	    height: 26px;
	    font-size: 12px;
	    vertical-align: middle;
	    float: left;
	    background: #C3D71;
	    text-align: left;
	}
	
	.pzlx_not_select{
		color: #9DA9C2
	}
	.pzlx_select{
		color: white
	}
	
	.popup {
	    left: 45%;
	    top: 41%
	}
	
	.image_explain{
		margin-top: 10px;
	    margin-left: 18px;
	}
	
	.tab_data_span{
		font-size:14px;
		cursor: pointer;
	    text-decoration: underline;
	}
	/*图谱关键字的样式*/
	.gkgKeyWordSpan{
		top: 6px;
	    position: relative;
	    left: 12px;
	    width: 40px;
	    color: red!important;
	}
	.hoverImg{
	    margin-top: 3px;
	  	 	margin-left: 14px;
	}
	.newsKeyWordSpan {
	    top: 3px;
	    position: relative;
	    left: 7px;
	    width: 40px;
	    color: red!important;
	    margin-right: 17px;
	}
</style>
</head>
<body class="peizhi_bg">
					
	<div class="index_top pos_fix">
		<h3 class="fl title" style="margin:0px;">关联分析</h3>
	</div>
	<div class="index_bottom">
		<div class="table_box">
			<ul class="table_ul mgl-30 clearfix">
					
				<li>回溯名称：<input type="text" id="s_configName"/></li>
				<li>
					<div style="float: left; line-height: 20px;">回溯入口：</div>
					<div class="fl clearfix" style="float: left; height:20px;">
						<div class="dowebok0">
							<select id="queryRelationEntry">
								<option value="-1" selected="selected">全部</option>
								<option value="1" >事件回溯</option>
								<option value="2" >图谱回溯</option>
								<option value="36" >新闻回溯</option>
							</select> 
						</div>
					</div>
				</li>
				<li>
					<div style="float: left; line-height: 20px;">源数据回溯状态：</div>
					<div class="fl clearfix" style="float: left; height:20px;">
						<div class="dowebok0">
							<select id="scheduleStateFilter">
								<option value="-1" selected="selected">全部</option>
								<option value="0">待回溯</option>
								<option value="1">回溯中</option>
								<option value="2">回溯完成</option>
								<option value="3">回溯失败</option>
								<option value="4">排队中</option>
							</select> 
						</div>
					</div>
				</li>
				<li>创建人：<input type="text" id="s_creator"/></li>
				<li><input class="seach_btn" type="button" value="查询" onclick="cx()"></li>
				<li><input type="button" class="addbutton" value="新增配置" onclick="addConfig();"></li>
				<li><input type="button" class="addbutton" value="批量删除" onclick="delAllRelationConfig();"></li>
			</ul>
			<table class="table">
				<thead>
					<tr>
						<th style="padding: 0 !important;width: 1%;"><input type="checkbox" id="newAllcheck" style="vertical-align:middle;">全选</th>
						<th style="width: 2%;">序号</th>
						<th style="width: 6%;">回溯名称</th>
						<th style="width: 4%;">回溯入口</th>
						<!--2019-7-31 gxb 暂时不展示，用配置回溯详情展示
						 <th style="width: 8%;">配置类型</th> 
						 -->
						<th style="width: 10%;">配置回溯详情（条）</th>
						<th style="width: 2%;">创建人</th>
						<th style="width: 2%;">权限</th>
						<th style="width: 2%;">创建时间</th>
						<th style="width: 2%;">耗时（分）</th>
						<th style="width: 4%;">备注</th>
						<th style="width: 4%;">源数据回溯状态</th>
						<th style="width: 4%;">操作</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<div id="Pagination" class="pagination"><!-- 这里显示分页 --></div>
		</div>
		
		<input type="hidden" id="pageIndexNew" value="0"/>
		<!-- 配置查询条件 -->
		<div class="tab2 clearfix w-position" style="display:none; position:relative;" id="infodiv">
			<div class="pos_shadow2"></div>
			<fieldset class="show" id="eventInfo">
				<!-- 基本信息 -->
				<ul class="table_ul clearfix">
					<li><div class="td1_2 fl"><p class="info_png fl"></p><b>基本信息：</b></div></li>
					<li>回溯名称：<input type="text" id="configName"/></li>
					<li style="margin-right:0px;">回溯入口：
						<div style="width: 100px; display: inline-block;">
							<select onchange="pzSwitch(this)" id="relationEntry">
								<option value="1" selected>事件回溯</option>
								<option value="2">图谱回溯</option>
								<option value="36">新闻回溯</option>
							</select>
						</div>
						<div id="hsrk" style="position:absolute;top:15px;left:24.4%;width:8.2%;height:44%;background:rgba(200,200,200,0);z-index:999;display:none;"></div>
					</li>
					<li style="margin-left: 25px;">回溯配置类型：<input id="allTypesName" type="text" onclick="dianji()" readonly/></li>
					<li style="margin-right:0px;">权限：
						<div style="width: 60px; display: inline-block;">
							<select class="fl" id="isPrivate">
								<option value="1" selected>私有</option>
								<option value="2">公开</option>
							</select>
						</div>
					</li>
					<li style="margin-left: 25px;">备注信息：<input type="text" id="remark"/></li>
				</ul>
				<span id="yxjspan" style="display:none;"></span>
				<!-- 分界线 -->
				<div class="hr"></div>
				<!-- 配置tab显示 -->
				<div class="pz_tab_box">
					<div id="event_pz" class="pz_tab pz_tab_select">事件配置</div>
					<div id="gkg_pz" class="pz_tab pz_tab_not_select">图谱配置</div>
					<div id="news_pz" class="pz_tab pz_tab_not_select">新闻配置</div>
				</div>
				
				<!-- 事件配置 -->
				<div class="tab_down2" id="event_condtion">
				<form id="configForm">
					<!-- 隐藏域，获取一些公共的值 -->
					<input type="hidden" class="configName2" name="configName">
					<input type="hidden" class="relationEntry2" name="queryRelationEntry">
					<input type="hidden" class="pzTypes" name="pzTypes">
					<input type="hidden" class="isPrivate2" name="isPrivate">
					<input type="hidden" class="remark2" name="remark">
					
					<input type="hidden" class="aa" value="" name="configId"/>
					<input type="hidden" name="configFlag" value="1" />
					<input type="hidden" name="priority" value="1" /><!-- 优先级 -->
					<input type="hidden" name="isRelation" id="isRelation" value="1" /><!-- 是否为关联配置，1表示关联配置 -->
					<input type="hidden" name="configCategoriesStr" value="0" id="typeIds"/><!-- 这个值没有用，但是不能删除，后台验证用 -->
					<input type="hidden" name="bgFlag" value="${bgFlag}"/>
					<div class="high_search_con" style="margin-top: 30px;">
						<ul class="tab_down_info">
							<li class="clearfix">
								<div class="date_box clearfix">
									<div class="td1 fl">
										<p class="time_png fl"></p>
										<b>日期属性：</b>
									</div>
									<div style="position:absolute; left:226px; top:-20px">当前数据库时间范围：<span id="stDateSpan"></span>至<span id="edDateSpan"></span></div>
									<div class="clearfix" style="width: 95%;">
										<div class="td2 fl b_e_date">起止日期</div>
										<div class="td3_2 fl">
											<label class="lab2" for=""><input class="inp_selc day1" name="stDates"  type="text" readonly  id="stDates"/></label>
										</div>
										<div class="td3_2 fl" >
											<label class="lab2" for=""><input class="inp_selc day2" name="edDates"  type="text" readonly  id="edDates"/></label>
										</div>
										<div class="add_date_btn" style="margin-left: 19px;"></div>
									</div>
									<div class="high_search" style="margin-top: -17px;">高级查询</div>
								</div>
							</li>
							<li class="clearfix">
							</li>
							<!-- 数据源 -->
							<li class="clearfix" id="dataSourceType">
								<div class="td1 fl"><p class="weight_png fl"></p><b>数据源：</b></div>
								<div class="td5_event fl"><input class="dataSourceTypeRela dataSourceTypeRela1 dataSourceType1" type="radio" id="radioEvent1" name="dataSourceType" checked="checked" value="1"><label for="radioEvent1"> 数据源一</label></div>
								<div class="td5_event fl"><input class="dataSourceTypeRela dataSourceType2" type="radio" id="radioEvent2" name="dataSourceType" value="2"><label for="radioEvent2"> 数据源二</label></div>
								<div class="td5_event fl"><input class="dataSourceTypeRela dataSourceType3" type="radio" id="radioEvent3" name="dataSourceType" value="3"><label for="radioEvent3"> 数据源三</label></div>
							</li>
							<!-- 比重 -->
							<li class="clearfix" id="bizhong" style="display: none;">
								<div class="td1 fl"><p class="tjyj_png fl"></p><b>统计依据：</b></div>
								<div class="td5_event fl"><input class="tjradio1" type="radio" name="valueWeight" checked="checked" value="1"><label for="tjradio1"> 比重</label></div>
								<div class="td5_event fl"><input class="tjradio2" type="radio" name="valueWeight" value="2"><label for="tjradio2"> 数量</label></div>
							</li>
							<div class="ulli">
							<li class="clearfix zindex99" id="actorModel">
								<div class="td1 fl"><p class="people_png fl"></p><b>角色属性：</b></div>
								<div class="fl clearfix">
									<div  class="td2_2 fl"><span class="span1">角色1</span></div>
									<div class="clearfix event_condtion4_two" >
										<!-- "国家"角色属性值 -->
										<div class="fl guojia">国家编码</div>
										<div class="width-150 fl checkBoxSelect" id ="actor1Countrycode">
										</div>
										<input type="hidden" id="countrycodeactor1" name="countrycodeactor1"/>
										<input type="hidden" name="actor1Attrs" value="1"/>
										<!-- "组织名"角色属性 -->
										<div class="fl bianma" style="width: 54px;">组织</div>
										<div class="fl clearfix">
											<div class="width-150 fl checkBoxSelect" id="actor1organizationcode"></div>
											<input type="hidden" id="organizationcodeactor1" name="organizationcodeactor1"/>
										</div>
										<input type="hidden" name="actor1Attrs" value="2" />
										
										<!-- "宗教1"角色属性 -->
										<div class="fl bianma">宗教1</div>
										<div class="fl clearfix">
											<div class="width-150 fl checkBoxSelect" id="actor1Religion1Code1"></div>
											<input type="hidden" id="religion1CodeActor1" name="religion1CodeActor1"/>
										</div>
										<input type="hidden" name="actor1Attrs" value="3" />
										<!-- "宗教2"角色属性 -->
										<div class="fl bianma">宗教2</div>
											<div class="fl clearfix">
												<div class="width-150 fl checkBoxSelect" id="actor1Religion1Code2"></div>
												<input type="hidden" id="religion2CodeActor1" name="religion2CodeActor1"/>
											</div>
										<input type="hidden" name="actor1Attrs" value="4" />
									</div>
									<div class="clearfix"  style=" margin-left:82px; margin-top:10px;">
										<!-- "种族"角色属性 -->
										<div class="fl bianma">种族</div>
										<div class="fl clearfix">
											<div class="width-150 fl checkBoxSelect" id="actor1EthnicCode"></div>
											<input type="hidden" id="ethnicCodeactor1" name="ethnicCodeactor1"/>
										</div>
										<input type="hidden" name="actor1Attrs" value="5"/>
										<!-- "种类1"角色属性 -->
										<div class="fl bianma" style="width: 54px;">种类1</div>
										<div class="fl clearfix">
											<div class="width-150 fl checkBoxSelect" id="actor1TypeCode1"></div>
											<input type="hidden" id="typeCode1actor1" name="typeCode1actor1"/>
										</div>
										<input type="hidden" name="actor1Attrs" value="6" />
										<!-- "种类2"角色属性 -->
										<div class="fl bianma">种类2</div>
										<div class="fl clearfix">
											<div class="width-150 fl checkBoxSelect" id="actor1TypeCode2"></div>
											<input type="hidden" id="typeCode2actor1" name="typeCode2actor1"/>
										</div>
										<input type="hidden" name="actor1Attrs" value="7" />
										<!-- "种类3"角色属性 -->
										<div class="fl bianma">种类3</div>
										<div class="fl clearfix">
											<div class="width-150 fl checkBoxSelect" id="actor1TypeCode3"></div>
											<input type="hidden" id="typeCode3actor1" name="typeCode3actor1"/>
										</div>
										<input type="hidden" name="actor1Attrs" value="8" />
								</div>
								<!-- 角色一地理种类下拉框 -->
								<div class="clearfix event_condtion4_one">
									<div class="fl guojia">地理类型</div>
									<div class="fl clearfix">
										<div class="dowebok27 width-150">
											<select id="actor1Geographictype"  name="actor1Geographictype">
												<option value="0" selected="selected">请选择</option>
												<option value="1">国家</option>
												<option value="2">州省</option>
												<option value="3">城市</option>
											</select>
										</div>
									</div>
									<div class="fl guojia" style="width: 54px;">国家/州省</div>
									<div id="actor1geographyCountry" class="width-150 checkBoxSelect"></div>
									<input type="hidden" id="geographyCountryactor1" name="geographyCountryactor1"/>
									
								</div>
								<div class="clearfix event_condtion4_two">
									<!-- 角色1地理位置-国家-->
									<div style="margin-bottom:3px;margin-left: 56px;">逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如  (A && B && !D)||C  </div>
									<div style="margin-left: -7px;width: 63px;float: left;padding-top: 4px;">地理全称</div>
									<div class="radio_box flearfix" style="float: left;">
										<input class="condition_info_graph_ids2 fl" style="width: 500px;" type="text" id="eventKeyWordactor1" name="eventKeyWordactor1" onblur="validateKeyWords(this)"/>
										<span id="keywordSpanactor1" style="position:relative;left:20px;width:40px;color: red"></span>
									</div>
									<div style="padding: 3px;margin-left: 10px;float: left;"><input type="checkbox" style="vertical-align: middle;" value="0" checked name="eventKeyWordactor1IsBig">区分大小写</div>
								</div>
								<div class="fl clearfix">
									<div class="clearfix event_condtion4_three">
										<div class="td2_2 fl"><span class="span1">角色2</span></div>
										<!-- "国家"角色属性值 -->
											<div class="fl guojia">国家编码</div>
											<div class="fl clearfix">
												<div class="width-150 fl checkBoxSelect" id="actor2Countrycode" >
												</div>
												<input type="hidden" id="countrycodeactor2" name="countrycodeactor2"/>
											</div>
											<input type="hidden" name="actor2Attrs" value="1"/>
											<!-- "组织名"角色属性 -->
											<div class="fl bianma" style="width: 54px;">组织</div>
											<div class="fl clearfix">
												<div class="width-150 fl checkBoxSelect" id="actor2organizationcode" ></div>
												<input type="hidden" id="organizationcodeactor2" name="organizationcodeactor2"/>
											</div>
											<input type="hidden" name="actor2Attrs" value="2" />
											
											<!-- "宗教1"角色属性 -->
											<div class="fl bianma">宗教1</div>
											<div class="fl clearfix">
												<div class="width-150 fl checkBoxSelect" id="actor2Religion1Code1"></div>
												<input type="hidden" id="religion1CodeActor2" name="religion1CodeActor2"/>
											</div>
											<input type="hidden" name="actor2Attrs" value="3" />
											
											<!-- "宗教2"角色属性 -->
											<div class="fl bianma">宗教2</div>
											<div class="fl clearfix">
												<div class="width-150 fl checkBoxSelect" id="actor2Religion1Code2"></div>
												<input type="hidden" id="religion2CodeActor2" name="religion2CodeActor2"/>
											</div>
											<input type="hidden" name="actor2Attrs" value="4" />
									    </div>		
										<div class="clearfix event_condtion4_one">
											<!-- "种族"角色属性 -->
											<div class="fl bianma">种族</div>
											<div class="fl clearfix">
												<div class="width-150 fl checkBoxSelect" id="actor2EthnicCode" ></div>
												<input type="hidden" id="ethnicCodeactor2" name="ethnicCodeactor2"/>
											</div>
											<input type="hidden" name="actor2Attrs" value="5" />
											<!-- "种类1"角色属性 -->
											<div class="fl bianma" style="width: 54px;">种类1</div>
											<div class="fl clearfix">
												<div class="width-150 fl checkBoxSelect" id="actor2TypeCode1"></div>
												<input type="hidden" id="typeCode1actor2" name="typeCode1actor2"/>
											</div>
											<input type="hidden" name="actor2Attrs" value="6" />
											<!-- "种类2"角色属性 -->
											<div class="fl bianma">种类2</div>
											<div class="fl clearfix">
												<div class="width-150 fl checkBoxSelect" id="actor2TypeCode2" ></div>
												<input type="hidden" id="typeCode2actor2" name="typeCode2actor2"/>
											</div>
											<input type="hidden" name="actor2Attrs" value="7" />
											<!-- "种类3"角色属性 -->
											<div class="fl bianma">种类3</div>
											<div class="fl clearfix">
												<div class="width-150 fl checkBoxSelect" id="actor2TypeCode3" ></div>
												<input type="hidden" id="typeCode3actor2" name="typeCode3actor2"/>
											</div>
											<input type="hidden" name="actor2Attrs" value="8" />
										</div>	
										<!-- 角色二地理种类下拉框 -->
										<div class="clearfix event_condtion4_one">
											<div class="fl guojia">地理类型</div>
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
											<!-- 角色2地理位置-国家-->
											<div class="fl guojia" style="width: 54px;">国家/州省</div>
											<div class="width-150 checkBoxSelect" id="actor2geographyCountry" ></div>
											<input type="hidden" id="geographyCountryactor2" name="geographyCountryactor2"/>
											
										</div>
										<div class="clearfix event_condtion4_two">
											<div style="margin-bottom:3px;margin-left: 56px;">逻辑运算符:&&表示“且”,||表示“或”,!(英文)表示“非”,可以用( )表示一个主体优先级,例如 :(A && B && !D)||C </div>
											<div style="margin-left: -7px;width: 63px;float: left;padding-top: 4px;">地理全称</div>
											<div class="radio_box" style="float: left;">
												<input class="condition_info_graph_ids2 fl" style="width: 500px;" type="text" id="eventKeyWordactor2" name="eventKeyWordactor2" onblur="validateKeyWords(this)"/>
												<span id="keywordSpanactor2" style="position:relative;left:20px;width:40px;color: red"></span>
											</div>
											<div style="padding: 3px;margin-left: 10px;float: left;"><input type="checkbox" style="vertical-align: middle;" value="0" checked name="eventKeyWordactor2IsBig">区分大小写</div>
										</div>
								    </div>
								</div>
							</li>
							<!-- 事件属性 -->
							<li class="clearfix" id="eventProperty">
								<div class="td1 fl"><p class="event_property_png fl"></p><b style="line-height:15px;">事件属性：</b></div>
								<div class="fl clearfix checkBoxSelect" style="width:954px;">
									<div  class="td2_2 fl"><span class="span1">类型</span></div>
									<div class="clearfix fl">
										<!-- 大类-->
										<div class="fl guojia">大类</div>
										<div class="fl clearfix">
											<div class="width-150 fl checkBoxSelect" id="quadClass"></div>
											<input type="hidden" id="quadClassData" name="quadClassData"/>
										</div>
										<input type="hidden" name="eventAttrs" value="1"/>
										<!-- 根类 -->
										<div class="fl bianma" style="width: 54px;">根类</div>
										<div class="fl clearfix">
											<div class="width-150 fl checkBoxSelect" id="rootEvent" ></div>
											<input type="hidden" id="rootEventData" name="rootEventData"/>
										</div>
										<input type="hidden" name="eventAttrs" value="2" />
										
										<!-- 基类 -->
										<div class="fl bianma">基类</div>
										<div class="fl clearfix">
											<div class="width-150 fl checkBoxSelect" id="baseEvent" ></div>
											<input type="hidden" id="baseEventData" name="baseEventData"/>
										</div>
										<input type="hidden" name="eventAttrs" value="3" />
										
										<!-- 全事件 -->
										<div class="fl bianma">子类</div>
										<div class="fl clearfix">
											<div class="width-150 fl checkBoxSelect" id="eventCode" ></div>
											<input type="hidden" id="codeEventData" name="codeEventData"/>
										</div>
										<input type="hidden" name="eventAttrs" value="4" />
									</div>
								    <!-- 地理全名 -->
								    <div class="fl clearfix homeNotShow" style="margin-left: -82px;">
										<div class="clearfix fl event_condtion4_three">
											<div class="td2_2 fl"><span class="span1">发生地</span></div>
											<div class="fl guojia">地理类型</div>
											<div class="fl clearfix">
												<div class="dowebok28 width-150">
													<select id="actorGeographictype"  name="Geographictype">
														<option value="0" selected="selected">请选择</option>
														<option value="1">国家</option>
														<option value="2">州省</option>
														<option value="3">城市</option>
													</select>
												</div>
											</div>
											<!-- 发生地国家 -->
											<div class="fl guojia" style="width: 54px;">国家/州省</div>
											<div class="fl clearfix">
												<div class="width-150 checkBoxSelect" id="actorgeographyCountry" ></div>
												<input type="hidden" id="geographyCountryactor" name="geographyCountryactor"/>
											</div>
											<input type="hidden" name="eventAttrs" value="6" />
											
									    </div>		
								    </div>
								    
									<div class="clearfix fl event_condtion4_two homeNotShow" style="">
										<div style="margin-bottom:3px;margin-left: 56px;">逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如  (A && B && !D)||C  </div>
										<div style="margin-left: -7px;width: 63px;float: left;padding-top: 4px;">地理全称</div>
										<div class="fl" style="float: left;">
											<input class="condition_info_graph_ids2 fl" style="width: 500px;" type="text" id="eventKeyWordactor" name="eventKeyWordactor" onblur="validateKeyWords(this)"/>
											<span id="keywordSpanactor" style="position:relative;left:20px;width:40px;color: red"></span>
										</div>
										<div style="padding: 3px;margin-left: 10px;float: left;"><input type="checkbox" style="vertical-align: middle;" value="0" checked name="eventKeyWordactorIsBig">区分大小写</div>
									</div>
								    <!-- 其他 -->
								    <div class="fl clearfix homeNotShow">
										<div class="clearfix fl event_condtion4_three">
											<div class="td2_2 fl"><span class="span1">其他</span></div>
											<!-- 源URL -->
											<div class="fl bianma">源URL</div>
											<div class="fl clearfix">
												<div class="fl width-150">
													<input type="hidden" name="eventAttrs"  value="8" />
													<input class="default_input" id="eventAttr8" style="width: 131px;" type="text" name="eventAttrValues"/>
												</div>
											</div>
											<!-- 情感值 -->
											<div class="fl bianma">情感值</div>
											<div class="fl width160 clearfix">
												<div class="fl width160">
													<input type="hidden" name="eventAttrs" value="9" />
													<input style="width:42px;" id="eventAttr9" class="default_input fl" type="text" value="-100" name ="eventAttrValues" onblur="validateEventAttr9()"/>
													<span class="fl ljX">—</span>
													<input type="hidden" name="eventAttrs" value="10" />
													<input style="width:42px;" id="eventAttr10" class="default_input fl" type="text" value="100" name ="eventAttrValues" onblur="validateEventAttr10()"/>
													<span id="spang" style="display:none;float: right;"><img src="<%=basePath %>/static/images/delete.png" style="margin-top: -2px;"></img></span>
												</div>
											</div>
											<!-- 影响度 -->
											<div class="fl bianma">影响度</div>
											<div class="fl width160 clearfix">
												<div class="fl width160">
													<input type="hidden" name="eventAttrs" value="11" />
													<input style="width:42px;" id="eventAttr11" class="default_input fl" type="text" value="-10" name ="eventAttrValues" onblur="validateEventAttr11()"/>
													<span class="fl ljX">—</span>
													<input type="hidden" name="eventAttrs" value="12" />
													<input style="width:42px;" id="eventAttr12" class="default_input fl" type="text" value="10" name ="eventAttrValues"  onblur="validateEventAttr12()"/>
													<span id="spanh" style="display:none;float: right;"><img src="<%=basePath %>/static/images/delete.png" style="margin-top: -2px;"></img></span>
												</div>
											</div>
											<!-- 是否为根类 -->
											<div class="fl bianma" >是否根类</div>
											<div class="fl clearfix">
												<div class="fl width138" style="width:80px;">
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
							<li class="clearfix" style="height:31px;display: none;" id="quanzhong">
								<div class="td1 fl"><p class="weight_png fl"></p><b>权重依据：</b></div>
								<div class="td5_event fl"><input id="radio1" type="radio" name="weightFlag" checked="checked" value="1"><label for="radio1"> 事件数</label></div>
								<div class="td5_event fl"><input id="radio2" type="radio" name="weightFlag" value="2"><label for="radio2"> 文章数</label></div>
								<div class="td5_event fl"><input id="radio3" type="radio" name="weightFlag" value="3"><label for="radio3"> 信源数</label></div>
								<div class="td5_event fl" style="width:89px;"><input id="radio4" type="radio" name="weightFlag" value="4"><label for="radio4"> 事件数(去重)</label></div>
							</li>
							<!-- 权重依据 范围-->
							<li class="clearfix" id="quanzhongkuang">
								<div class="td1 fl" id="newquanzhongkuang"><p class="weight_png fl"></p><b>权重值：</b></div>
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
							<li class="clearfix"><input class="submit" type="button" onclick="eventSub(1);" value="提交" id="scheduleState1"></li>
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
										<td><font class="sbFont">ActorGeo_FullName :</font> Oakland Community College, Michigan, United S</td>
										<td><font class="sbFont">ActorGeo_CountryCode :</font> US</td>
									</tr>
									<tr>
										<td><font class="sbFont">ActorGeo_ADM1Code :</font> USMI</td>
										<td><font class="sbFont">ActorGeo_Lat :</font> 42.4928000</td>
										<td><font class="sbFont">ActorGeo_Long :</font> -83.3705000</td>
										<td><font class="sbFont">ActorGeo_FeatureID :</font> 633876</td>
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
								<div class="sub"><input class="submit" type="button" onclick="eventSub(2);" style="bottom: 0px;right: 0px;position: relative;" value="提交" id="scheduleState2"></div><div class="clearfloat"></div> 
					        </div>
					    </div> 									
					</div>					
					<div class="pos_shadow"></div>
					</form>
				</div>
				<!-- 图谱配置 -->
				<div id="gkg_condtion" class="pz_condtion_box" style="display: none; margin-top: 79px;">
				<form id="gkgConfigForm">
					<!-- 隐藏域，获取一些公共的值 -->
					<input type="hidden" class="configName2" name="configName">
					<input type="hidden" class="relationEntry2" name="queryRelationEntry">
					<input type="hidden" class="pzTypes" name="pzTypes">
					<input type="hidden" class="isPrivate2" name="isPrivate">
					<input type="hidden" class="remark2" name="gkgRemark">
					
					<input type="hidden" class="aa" value="" name="configId"/>
					<input type="hidden" name="configFlag" value="2" />
					<input type="hidden" name="priority" value="1" /><!-- 优先级 -->
					<input type="hidden" name="isRelation" id="isRelation" value="1" /><!-- 是否为关联配置，1表示关联配置 -->
					<input type="hidden" name="configCategoriesStr" value="0" id="typeIds"/><!-- 这个值没有用，但是不能删除，后台验证用 -->
					<input type="hidden" name="bgFlag" value="${bgFlag}"/>
					<div class="high_search_con" style="margin-top: 30px;">
						<ul class="tab_down_info">
							<li class="clearfix" id="riqi">
							<div class="date_box clearfix">
								<div class="td1 fl"><p class="time_png fl"></p><b>日期属性：</b></div>
								<div style="position:absolute; left:140px; top:-20px">当前数据库时间范围：<span id="stDateSpan2"></span>至<span id="edDateSpan2"></span></div>
								<div id="time_be_box" class="clearfix" style="width: 95%;">
									<div class="clearfix">
										<div class="width250 fl clearfix">
											<div class="fl"><span class="beg_time fl">开始时间</span></div>
											<div class="td3_2 fl">
												<label class="lab2" for=""><input class="inp_selc day12" id="gkgStDate" name="gkgStDate" value="${curStDate[2]}" type="text" readonly/></label>
											</div>
										</div>
										<div class="fl clearfix">
											<div class="fl"><span class="end_time fl">结束时间</span></div>
											<div class="td3_2 fl">
												<label class="lab2" for=""><input class="inp_selc day22" id="gkgEdDate" name="gkgEdDate" value="${curEdDate[2]}" type="text" readonly/></label>
											</div>
										</div>
									    <div class="add_date_btn"></div>
									 </div>
								</div>
								<div class="high_search" style="margin-top: -40px;">高级查询</div>
							</div>
							</li>
							<!-- 数据源 -->
							<li class="clearfix" id="dataSourceType">
								<div class="td1 fl"><p class="weight_png fl"></p><b>数据源：</b></div>
								<div class="td5_event fl"><input class="dataSourceTypeRela dataSourceTypeRela1 dataSourceType1" type="radio" id="radio11" name="dataSourceType" checked="checked" value="1"><label for="radio11"> 数据源一</label></div>
								<div class="td5_event fl"><input class="dataSourceTypeRela dataSourceType2" type="radio" id="radio22" name="dataSourceType" value="2"><label for="radio22"> 数据源二</label></div>
								<div class="td5_event fl"><input class="dataSourceTypeRela dataSourceType3" type="radio" id="radio33" name="dataSourceType" value="3"><label for="radio33"> 数据源三</label></div>
							</li>
							<div class="ulli">
						   <li class="clearfix">
								<div class="td1 fl"><p class="threshold_png fl"></p><b style="line-height:15px;">COUNTS搜索：</b></div>
								<div class="radio_box">
									<input class="condition_info_graph_ids2 fl gkgKeyWord" type="text" id="countsKeyWord" name="countsKeyWord" onchange="validateKeyWords(this)"/>
									<span class="gkgKeyWordSpan" ></span>
									<div style="padding: 3px;margin-left: 10px;float: left;"><input type="checkbox" style="vertical-align: middle;" value="0" checked name="countsIsBig">区分大小写</div>
									<img class="hoverImg" src="<%=basePath %>/static/images/detail.png">
									<span style="margin-left: 9px;display: none;">逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如  (A && B && !D)||C </span>
								</div>
							</li> 
						   <li class="clearfix">
								<div class="td1 fl"><p class="threshold_png fl"></p><b style="line-height:15px;">主题搜索：</b></div>
								<div class="radio_box">
									<input class="condition_info_graph_ids2 fl gkgKeyWord" type="text" id="themesKeyWord" name="themesKeyWord" onchange="validateKeyWords(this)"/>
									<span class="gkgKeyWordSpan"></span>
									<div style="padding: 3px;margin-left: 10px;float: left;"><input type="checkbox" style="vertical-align: middle;" value="0" checked name="themesIsBig">区分大小写</div>
									<img class="hoverImg" src="<%=basePath %>/static/images/detail.png">
									<span style="margin-left: 9px;display: none;">逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如  (A && B && !D)||C </span>
								</div>
							</li> 
						   <li class="clearfix">
								<div class="td1 fl"><p class="threshold_png fl"></p><b style="line-height:15px;">地理搜索：</b></div>
								<div class="radio_box">
									<input class="condition_info_graph_ids2 fl gkgKeyWord" type="text" id="locationsKeyWord" name="locationsKeyWord" onchange="validateKeyWords(this)"/>
									<span class="gkgKeyWordSpan" ></span>
									<div style="padding: 3px;margin-left: 10px;float: left;"><input type="checkbox" style="vertical-align: middle;" value="0" checked name="locationsIsBig">区分大小写</div>
									<img class="hoverImg" src="<%=basePath %>/static/images/detail.png">
									<span style="margin-left: 9px;display: none;">逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如  (A && B && !D)||C </span>
									
								</div>
							</li> 
						   <li class="clearfix">
								<div class="td1 fl"><p class="threshold_png fl"></p><b style="line-height:15px;">人物搜索：</b></div>
								<div class="radio_box">
									<input class="condition_info_graph_ids2 fl gkgKeyWord" type="text" id="personsKeyWord" name="personsKeyWord" onchange="validateKeyWords(this)"/>
									<span class="gkgKeyWordSpan" ></span>
									<div style="padding: 3px;margin-left: 10px;float: left;"><input type="checkbox" style="vertical-align: middle;" value="0" checked name="personsIsBig">区分大小写</div>
									<img class="hoverImg" src="<%=basePath %>/static/images/detail.png">
									<span style="margin-left: 9px;display: none;">逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如  (A && B && !D)||C </span>
									
								</div>
							</li> 
						   <li class="clearfix">
								<div class="td1 fl"><p class="threshold_png fl"></p><b style="line-height:15px;">组织搜索：</b></div>
								<div class="radio_box">
									<input class="condition_info_graph_ids2 fl gkgKeyWord" type="text" id="organizationsKeyWord" name="organizationsKeyWord" onchange="validateKeyWords(this)"/>
									<span class="gkgKeyWordSpan" ></span>
									<div style="padding: 3px;margin-left: 10px;float: left;"><input type="checkbox" style="vertical-align: middle;" value="0" checked name="organizationsIsBig">区分大小写</div>
									<img class="hoverImg" src="<%=basePath %>/static/images/detail.png">
									<span style="margin-left: 9px;display: none;">逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如  (A && B && !D)||C </span>
								</div>
							</li> 
						   <li class="clearfix">
								<div class="td1 fl"><p class="threshold_png fl"></p><b style="line-height:15px;">网站地域：</b></div>
								<div><!-- 这个空div不能删除，必须保留 -->
									<div id="webCountry" class="checkBoxSelect" style="width: 150px;"></div>
									<input type="hidden" id="webCountry1" name="webCountry"/>
								</div>
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
							<!-- 比重 -->
							<li class="clearfix" id="bizhong" style="display: none;">
								<div class="td1 fl"><p class="tjyj_png fl"></p><b>统计依据：</b></div>
								<div class="td5_event fl"><input class="tjradio1" type="radio" name="valueWeight" checked="checked" value="1"><label for="tjradio1"> 比重</label></div>
								<div class="td5_event fl"><input class="tjradio2" type="radio" name="valueWeight" value="2"><label for="tjradio2"> 数量</label></div>
							</li>
							<li class="clearfix" id="quanzhong"  style="display: none;">
								<div class="td1 fl"><p class="weight_png fl"></p><b>权重依据：</b></div>
								<div id="quanzhong2">
									<div class="radio_box radio_box_qz fl" style="width: 29%;">
										<!-- mark st -->
										<label for="gkgTimes"><input type="radio" id="gkgTimes" name="gkgWeightFlag" value="1" checked="checked"/> 包含所选实体集的新闻报道数（1）</label>
										<label for="gkgArticle"><input type="radio" id="gkgArticle" name="gkgWeightFlag" value="2"/> 包含所选实体集的新闻报道数（NUMARTS）</label>
										<!-- mark ed -->
									</div>
								</div>
							</li>
							<!-- 权重范围 -->
							<li class="clearfix" id="baodaoshu" style="margin-top: 5px">
								<div class="td1 fl"><p class="weight_png fl"></p><b>权重值：</b></div>
								<div  class="fl" style="width: 30%;    margin-top: 6px;">
									<b class="sjsx">报道数：</b>
									<input class="condition_info_ids" style="width:42px;" type="text" id="stNUMARTS" name="stNUMARTS"/><span>—</span><input class="condition_info_ids" style="width:42px;" type="text" id="edNUMARTS" name="edNUMARTS"/>
								</div>
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
								<div class="gjcx_al_box">
									<table class="gjcx_al_tb">
										<tr>
											<td><font class="sbFont">关键字提示 :</font> 并 and,或 or,等于 =,不等于 !=,大于等于 >=,小于等于 <=,模糊匹配 like,模糊不匹配  not like,范围查询 in,不在范围查询 not in</td>
										</tr> 
										<tr>
											<td><font class="sbFont">案例SQL :</font> NUMARTS != 2 and PERSONS like '%keqiang%' and (ORGANIZATIONS not like '%police%' or COUNTS like '%ARREST%')</td>
										</tr>
									</table>
								</div>
								<textarea class="texthtml" id="customQuery" name="customQuery"></textarea>
								<div class="sub"><input class="submit" type="button" onclick="gkgSub(2);" style="bottom: 0px;right: 0px;position: relative;" value="提交" id="scheduleState2"></div><div class="clearfloat"></div> 
					        </div>
					    </div>
				    </div>
				    </form>
				</div>
				<!-- 新闻配置 -->
				<div id="news_condtion" class="pz_condtion_box" style="display: none;margin-top: 58px;">
				<form id="newsConfigForm">
					<!-- 隐藏域，获取一些公共的值 -->
					<input type="hidden" class="configName2" name="configName">
					<input type="hidden" class="relationEntry2" name="queryRelationEntry">
					<input type="hidden" class="pzTypes" name="pzTypes">
					<input type="hidden" class="isPrivate2" name="isPrivate">
					<input type="hidden" class="remark2" name="newsRemark">
					
					<input type="hidden" class="aa" value="" name="configId"/>
					<input type="hidden" name="configFlag" value="36" />
					<input type="hidden" name="priority" value="1" /><!-- 优先级 -->
					<input type="hidden" name="isRelation" id="isRelation" value="1" /><!-- 是否为关联配置，1表示关联配置 -->
					<input type="hidden" name="configCategoriesStr" value="0" id="typeIds"/><!-- 这个值没有用，但是不能删除，后台验证用 -->
					<input type="hidden" name="bgFlag" value="${bgFlag}"/>
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
										<label class="lab2" for=""><input class="inp_selc" id="newsStDate_c" name="newsStDate_c" type="text" readonly /></label>
									</div>
								</div>
								<div class="fl clearfix">
									<div class="fl"><span class="end_time fl">结束时间</span></div>
									<div class="td3_2 fl">
										<label class="lab2" for=""><input class="inp_selc" id="newsEdDate_c" name="newsEdDate_c" type="text" readonly /></label>
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
										<label class="lab2" for=""><input class="inp_selc" id="newsStDate_f" name="newsStDate_f" type="text" readonly /></label>
									</div>
								</div>
								<div class="fl clearfix">
									<div class="fl"><span class="end_time fl">结束时间</span></div>
									<div class="td3_2 fl">
										<label class="lab2" for=""><input class="inp_selc" id="newsEdDate_f" name="newsEdDate_f" type="text" readonly /></label>
									</div>
								</div>
							</div>
						</li>
						<!-- 数据源 -->
						<li class="clearfix">
							<div class="td1 fl"><p class="fl"></p><b>数据源：</b></div>
							<div class="td5_event fl"><input class="dataSourceType_news1 dataSourceType_news" type="radio" name="dataSourceType" checked="checked" value="1" id="radio1N"><label for="radio1N"> 数据源一</label></div>
							<div class="td5_event fl"><input class="dataSourceType_news2 dataSourceType_news" type="radio" name="dataSourceType" value="2" id="radio2N"><label for="radio2N"> 数据源二</label></div>
							<div class="td5_event fl"><input class="dataSourceType_news3 dataSourceType_news" type="radio" name="dataSourceType" value="3" id="radio3N"><label for="radio3N"> 数据源三</label></div>
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
							<div class="td1 fl"><p class="fl"></p><b class="sjsx">网站名称：</b></div>
							<div class="radio_box">
								<input class="condition_info_ids fl" type="text"  id="website" name="website" onchange="validateNewsKeyWords(this)" />
								<span class="newsKeyWordSpan"></span>
								<div style="padding: 3px;margin-left: 10px;float: left;"><input class="likeFieldIsBig" type="checkbox" style="vertical-align: middle;" value="0" checked name="websiteIsBig">区分大小写</div>
								<img class="hoverImg" src="<%=basePath %>/static/images/detail.png">
								<span style="margin-left: 9px;display: none;">支持单个关键字模糊匹配;自定义模糊匹配，逻辑运算符:&&表示"且",||表示"或", 可以用( )表示一个主体优先级,例如  (A && B && !D)||C 注意：^ ~ * \为特殊字符不允许输入</span>
							</div>
						</li>
						<li class="clearfix" >
							<div class="td1 fl"><p class="fl"></p><b class="sjsx">URL：</b></div>
							<div class="radio_box">
								<input class="condition_info_ids fl" type="text"  id="oUrl" name="oUrl" onchange="validateNewsKeyWords(this)" />
								<span class="newsKeyWordSpan"></span>
								<div style="padding: 3px;margin-left: 10px;float: left;"><input class="likeFieldIsBig" type="checkbox" style="vertical-align: middle;" value="0" checked name="oUrlIsBig">区分大小写</div>
								<img class="hoverImg" src="<%=basePath %>/static/images/detail.png">
								<span style="margin-left: 9px;display: none;">支持单个关键字模糊匹配;自定义模糊匹配，逻辑运算符:&&表示"且",||表示"或", 可以用( )表示一个主体优先级,例如  (A && B && !D)||C 注意：^ ~ * \为特殊字符不允许输入</span>
							</div>
						</li>
						<li class="clearfix" >
							<div class="td1 fl"><p class="fl"></p><b class="sjsx">标题：</b></div>
							<div class="radio_box">
								<input class="condition_info_ids fl" type="text" id="title" name="title" onchange="validateNewsKeyWords(this)" />
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
				</form>
				</div>
			</fieldset>
		</div>
		<input type="hidden" value="1" id="pz_flag">
		
	</div>
<div id="shadow" class="shadow"></div>
<!-- 配置类型 -选择框 -->
<div id="popup_pzlx" class="popup">
	<div class="popup_t">
		<h3 class="popup_h3 fl">配置类型</h3>
		<label class="check_z" for=""><img onclick="closePoP()" src="<%=basePath %>/static/images/delete.png"></label>
	</div>
	<div class="popup_m">
		<div class="pz_box" id="eventPZ">
			<!-- 根据回溯入库 决定 是否禁用
				配置名称：pz_title_not_select pz_title_select
				复选框：disabled="disabled"
				配置类型名称：pzlx_not_select pzlx_select
			 -->
			<div class="pz_title pz_title_not_select">事件配置</div>
			<div class="pz_list_box">
				<div class="pzlx_box pzlx_not_select">
					<input type="checkbox" disabled="disabled" name="pzTypes" value="34"/> 事件展示 
				</div>
				<div class="pzlx_box pzlx_not_select">
					<input type="checkbox" disabled="disabled" name="pzTypes" value="32"/> 事件时间线 
				</div>
				<div class="pzlx_box pzlx_not_select">
					<input type="checkbox" disabled="disabled" name="pzTypes" value="4"/> 地理网络 
				</div>
				<div class="pzlx_box pzlx_not_select">
					<input type="checkbox" disabled="disabled" name="pzTypes" value="5"/> 类型时间演化 
				</div>
				<div class="pzlx_box pzlx_not_select">
					<input type="checkbox" disabled="disabled" name="pzTypes" value="7"/>  热点发生地展示 
				</div>
				<div class="pzlx_box pzlx_not_select">
					<input type="checkbox" disabled="disabled" name="pzTypes" value="8"/> 情感稳定发生地分析
				</div>
				<div class="pzlx_box pzlx_not_select">
					<input type="checkbox" disabled="disabled" name="pzTypes" value="41"/> 情感稳定事件分析
				</div>
				<div class="pzlx_box pzlx_not_select">
					<input type="checkbox" disabled="disabled" name="pzTypes" value="9"/> 事件角色展示 
				</div>
			</div>
		</div>
		<div class="pz_box" id="gkgPZ">
			<div class="pz_title pz_title_select">图谱配置</div>
			<div class="pz_list_box">
				<div class="pzlx_box">
					<input type="checkbox" name="pzTypes" value="35"/> 图谱展示
				</div>
				<div class="pzlx_box">
					<input type="checkbox" name="pzTypes" value="31"/> 图谱时间线
				</div>
				<div class="pzlx_box">
					<input type="checkbox" name="pzTypes" value="21"/> 人物分析 
				</div>
				<div class="pzlx_box">
					<input type="checkbox" name="pzTypes" value="18"/> 组织分析
				</div>
				<div class="pzlx_box">
					<input type="checkbox" name="pzTypes" value="22"/> 主题分析 
				</div>
				<div class="pzlx_box">
					<input type="checkbox" name="pzTypes" value="29"/> 情感分析 
				</div>
				<div class="pzlx_box">
					<input type="checkbox" name="pzTypes" value="19"/> 地域分析 
				</div>
				<div class="pzlx_box">
					<input type="checkbox" name="pzTypes" value="20"/> counts分析 
				</div>
				<div class="pzlx_box">
					<input type="checkbox" name="pzTypes" value="42"/> 网站分析 
				</div>
			</div>
		</div>
		<div class="pz_box" id="newsPZ">
			<div class="pz_title pz_title_select">新闻配置</div>
			<div class="pz_list_box">
				<div class="pzlx_box">
					<input type="checkbox" name="pzTypes" value="37"/> 新闻展示 
				</div>
				<div class="pzlx_box">
					<input type="checkbox" name="pzTypes" value="38"/> 新闻分析
				</div>
				<div class="pzlx_box">
					<input type="checkbox" name="pzTypes" value="43"/> 网站分析
				</div>
			</div>
		</div>
	</div>
	<div class="popup_b">
		<p class="fr" style=" margin-top: 5px">
			<span class="save" onclick="getAllType()">提交</span>
			<span onclick="closePoP()" class="cancel">取消</span>
		</p>
	</div>
</div>
<!-- 配置类型-详情 -->
<div id="popup_pzlxdetail" class="popup">
	<div class="popup_t">
		<h3 class="popup_h3 fl">配置类型</h3>
		<label class="check_z" for=""><img onclick="closePoP()" src="<%=basePath %>/static/images/delete.png"></label>
	</div>
	<div class="popup_m">
		<div class="pz_box">
			<div class="pz_title pz_title_select">事件配置</div>
			<div class="pz_list_box huixian">
				<div class="pzlx_box" dataValue="34">
					事件展示
				</div>
				<div class="pzlx_box" dataValue="32">
					事件时间线
				</div>
				<div class="pzlx_box" dataValue="4">
					地理网络 
				</div>
				<div class="pzlx_box" dataValue="5">
					类型时间演化
				</div>
				<div class="pzlx_box" dataValue="7">
					热点发生地展示
				</div>
				<div class="pzlx_box" dataValue="8">
					情感稳定发生地分析
				</div>
				<div class="pzlx_box" dataValue="41">
					情感稳定事件分析
				</div>
				<div class="pzlx_box" dataValue="9">
					事件角色展示
				</div>
			</div>
		</div>
		<div class="pz_box">
			<div class="pz_title pz_title_select">图谱配置</div>
			<div class="pz_list_box huixian">
				<div class="pzlx_box" dataValue="35">
					图谱展示
				</div>
				<div class="pzlx_box" dataValue="31">
					图谱时间线
				</div>
				<div class="pzlx_box" dataValue="21">
					人物分析
				</div>
				<div class="pzlx_box" dataValue="18">
					组织分析
				</div>
				<div class="pzlx_box" dataValue="22">
					主题分析
				</div>
				<div class="pzlx_box" dataValue="29">
					情感分析
				</div>
				<div class="pzlx_box" dataValue="19">
					地域分析
				</div>
				<div class="pzlx_box" dataValue="20">
					counts分析
				</div>
				<div class="pzlx_box" dataValue="42">
					网站分析
				</div>
			</div>
		</div>
		<div class="pz_box">
			<div class="pz_title pz_title_select">新闻配置</div>
			<div class="pz_list_box huixian">
				<div class="pzlx_box" dataValue="37">
					新闻展示
				</div>
				<div class="pzlx_box" dataValue="38">
					新闻分析
				</div>
				<div class="pzlx_box" dataValue="43">
					网站分析
				</div>
			</div>
		</div>
	</div>
	<div class="popup_b" style="height: 31px;text-align: center;line-height: 31px;">
		说明：
		 <img class="image_explain"  src="<%=basePath %>/static/images/hs_success.png"> 回溯成功 
		 <img class="image_explain"  src="<%=basePath %>/static/images/hs_fail.png"> 回溯失败
		 <img class="image_explain" src="<%=basePath %>/static/images/hs_doing.png"> 回溯中 
		 <img class="image_explain" src="<%=basePath %>/static/images/hs_wait.png"> 待回溯 
		 <img class="image_explain" src="<%=basePath %>/static/images/hs_not.png"> 不回溯
	</div>
</div>
<script src="<%=basePath %>/static/js/config/config.js"></script>
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<script>
	
	//初始化新闻配置的时间
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
	
	
	//高级查询控制页面显示隐藏
	$('.high_search').on('click',function(){
		$('.ulli').toggle();
		$('.property_case').toggle();
		if($('.property_case').css('display') == "block"){
			$('.high_search').css('background','#0087fd')
		}else{
			$('.high_search').css('background','none')
		}
	}) 
	//虚拟字段下拉复选框获取值
	$('#webCountry').hsCheckData({
		isShowCheckBox: true,
		data: ${webCountryCode}
	});
	//新增配置
	function addConfig(){
		//每次点击新增配置的时候，默认点击数据源一
		setTimeout(function(){$(".dataSourceTypeRela1").click();},2000);
		//高级查询复位
		$('.high_search').css('background','none');
		$('.ulli').show();
		$('.property_case').hide();
		//回溯入口的遮罩隐藏
		$("#hsrk").hide();
		$("#webCountry").attr("title","");
		$("#webCountry").attr("data-id","");
		$("#webCountry").attr("tit","");
		$("#webCountry").html("");
		$(".aa").val("");
		$("#sec_all_event").prop("checked",false);
		//getSelectCom();
		$(".pos_shadow").css("display","none");
		$(".pos_shadow2").css("display","none");
		$(".texthtml").val("");
		$("#actorModel").show();
		$("#eventProperty").show();
		//$("#bizhong").hide();
		$("#eventKeyWordactor1").val("");
		$("#eventKeyWordactor2").val("");
		$("#eventKeyWordactor").val("");
		$(".add_date_btn").hide();
		var eventTimeNum = $(".addEventDate").length;
		for(var i=1;i<=eventTimeNum;i++){
			var pdid = 'appendDatas' + i;
			$("#" + pdid + "").remove();
			$(".addEventDate").remove();
		}
		//选中回溯入口为事件配置
		$('#relationEntry option').each(function(){
			if(1 == $(this).val()){
				$(this).parent().siblings('input[type=text]').val($(this).html());
				$(this).attr('selected', true);
				pzSwitch($(this));
			}else{
				$(this).attr('selected', false);
			}
		});
		
		$("#infodiv").show();
		$("#allTypesName").attr('onclick','dianji()');
		$("#configName").val("");
		$("input[name='configName']").val(""); 
		$("input[name='priority']").val("1"); 
		$("#allTypesName").val(""); 
		$("input[name='remark']").val("");
		$('#popup_ul_event input[type=checkbox]').each(function(){
				$(this).prop('checked', false);
		});
		//权重
		$(".tjradio1").prop("checked",true);
		$("#radio1").prop("checked",true);
		//角色1属性
		$("#actor1Countrycode").attr("title","");
		$("#actor1Countrycode").attr("data-id","");
		$("#actor1Countrycode").attr("tit","");
		$("#actor1Countrycode").html(""); 
		
		$("#actor1organizationcode").attr("title","");
		$("#actor1organizationcode").attr("data-id","");
		$("#actor1organizationcode").attr("tit","");
		$("#actor1organizationcode").html("");
		
		$("#actor1Religion1Code1").attr("title","");
		$("#actor1Religion1Code1").attr("data-id","");
		$("#actor1Religion1Code1").attr("tit","");
		$("#actor1Religion1Code1").html("");
		
		$("#actor1Religion1Code2").attr("title","");
		$("#actor1Religion1Code2").attr("data-id","");
		$("#actor1Religion1Code2").attr("tit","");
		$("#actor1Religion1Code2").html("");
		
		$("#actor1EthnicCode").attr("title","");
		$("#actor1EthnicCode").attr("data-id","");
		$("#actor1EthnicCode").attr("tit","");
		$("#actor1EthnicCode").html("");
		
		$("#actor1TypeCode1").attr("title","");
		$("#actor1TypeCode1").attr("data-id","");
		$("#actor1TypeCode1").attr("tit","");
		$("#actor1TypeCode1").html("");
		
		$("#actor1TypeCode2").attr("title","");
		$("#actor1TypeCode2").attr("data-id","");
		$("#actor1TypeCode2").attr("tit","");
		$("#actor1TypeCode2").html("");
		
		$("#actor1TypeCode3").attr("title","");
		$("#actor1TypeCode3").attr("data-id","");
		$("#actor1TypeCode3").attr("tit","");
		$("#actor1TypeCode3").html("");
		
		$("#actor1geographyCountry").attr("title","");
		$("#actor1geographyCountry").attr("data-id","");
		$("#actor1geographyCountry").attr("tit","");
		$("#actor1geographyCountry").html("");
		//角色二
		$("#actor2Countrycode").attr("title","");
		$("#actor2Countrycode").attr("data-id","");
		$("#actor2Countrycode").attr("tit","");
		$("#actor2Countrycode").html("");
		
		$("#actor2organizationcode").attr("title","");
		$("#actor2organizationcode").attr("data-id","");
		$("#actor2organizationcode").attr("tit","");
		$("#actor2organizationcode").html("");
		
		$("#actor2Religion1Code1").attr("title","");
		$("#actor2Religion1Code1").attr("data-id","");
		$("#actor2Religion1Code1").attr("tit","");
		$("#actor2Religion1Code1").html("");
		
		$("#actor2Religion1Code2").attr("title","");
		$("#actor2Religion1Code2").attr("data-id","");
		$("#actor2Religion1Code2").attr("tit","");
		$("#actor2Religion1Code2").html("");
		
		$("#actor2EthnicCode").attr("title","");
		$("#actor2EthnicCode").attr("data-id","");
		$("#actor2EthnicCode").attr("tit","");
		$("#actor2EthnicCode").html("");
		
		$("#actor2TypeCode1").attr("title","");
		$("#actor2TypeCode1").attr("data-id","");
		$("#actor2TypeCode1").attr("tit","");
		$("#actor2TypeCode1").html("");
		
		$("#actor2TypeCode2").attr("title","");
		$("#actor2TypeCode2").attr("data-id","");
		$("#actor2TypeCode2").attr("tit","");
		$("#actor2TypeCode2").html("");
		
		$("#actor2TypeCode3").attr("title","");
		$("#actor2TypeCode3").attr("data-id","");
		$("#actor2TypeCode3").attr("tit","");
		$("#actor2TypeCode3").html("");
		
		$("#actor2geographyCountry").attr("title","");
		$("#actor2geographyCountry").attr("data-id","");
		$("#actor2geographyCountry").attr("tit","");
		$("#actor2geographyCountry").html("");
		
		$("#quadClass").attr("title","");
		$("#quadClass").attr("data-id","");
		$("#quadClass").attr("tit","");
		$("#quadClass").html("");
		
		$("#rootEvent").attr("title","");
		$("#rootEvent").attr("data-id","");
		$("#rootEvent").attr("tit","");
		$("#rootEvent").html("");
		
		$("#baseEvent").attr("title","");
		$("#baseEvent").attr("data-id","");
		$("#baseEvent").attr("tit","");
		$("#baseEvent").html("");
		
		$("#eventCode").attr("title","");
		$("#eventCode").attr("data-id","");
		$("#eventCode").attr("tit","");
		$("#eventCode").html("");
		
		$("#actorgeographyCountry").attr("title","");
		$("#actorgeographyCountry").attr("data-id","");
		$("#actorgeographyCountry").attr("tit","");
		$("#actorgeographyCountry").html("");
		
		//权重框
		$("#stNumMentions").val("");
		$("#edNumMentions").val("");
		$("#stNumArticles").val("");
		$("#edNumArticles").val("");
		$("#stNumSources").val("");  
		$("#edNumSources").val("");  
		//事件属性
		$("#eventAttr8").val("");
		$("#eventAttr9").val("-100");
		$("#eventAttr10").val("100");
		$("#eventAttr11").val("-10");
		$("#eventAttr12").val("10");
		validateEventAttr9();
		validateEventAttr10();
		validateEventAttr11();
		validateEventAttr12();
		$("#isPrivate option").each(function(){
			if($(this).val()==1){
				$(this).parent().siblings('input[type=text]').val("私有");
				$(this).attr('selected', true);
			}else{
				$(this).attr('selected', false);
			}
		});
		$("#eventAttr7 option").each(function(){
			if($(this).val()=="-1"){
				$(this).parent().siblings('input[type=text]').val("请选择");
				$(this).attr('selected', true);
			}else{
				$(this).attr('selected', false);
			}
		});
		//三个地理位置重置
		$("#actor1Geographictype option").each(function(){
			if($(this).val()=="0"){
				$(this).parent().siblings('input[type=text]').val("请选择");
				$(this).attr('selected', true);
			}else{
				$(this).attr('selected', false);
			}
		});
		$("#actor2Geographictype option").each(function(){
			if($(this).val()=="0"){
				$(this).parent().siblings('input[type=text]').val("请选择");
				$(this).attr('selected', true);
			}else{
				$(this).attr('selected', false);
			}
		});
		$("#actorGeographictype option").each(function(){
			if($(this).val()=="0"){
				$(this).parent().siblings('input[type=text]').val("请选择");
				$(this).attr('selected', true);
			}else{
				$(this).attr('selected', false);
			}
		});
		$("#scheduleState1").css("display","block");
		validate1();validate5();
		validate11();validate55();
		validate2();validate6();
		validate22();validate66();
		validate3();
		validate33();
		validate4();
		validate44();
		$(".gkgKeyWord").val('');
		//5个大小写选中
		$("input[name=countsIsBig]").prop("checked",true);
		$("input[name=themesIsBig]").prop("checked",true);
		$("input[name=locationsIsBig]").prop("checked",true);
		$("input[name=personsIsBig]").prop("checked",true);
		$("input[name=organizationsIsBig]").prop("checked",true);
	}
	
	//全选，反选功能
	$("#newAllcheck").on('click',function(){
		$(".table tbody :checkbox").each(function(){
			$(this).prop("checked",$("#newAllcheck").prop("checked"));
		});
		
	});


	$(function(){
		//定义全局时间范围变量
		configDateEvent = {"maxDate1":"","minDate1":"","maxDate2":"","minDate2":"","maxDate3":"","minDate3":""};
		configDateGkg = {"maxDate1":"","minDate1":"","maxDate2":"","minDate2":"","maxDate3":"","minDate3":""};
		//对事件、图谱、开始时间、结束时间插件进行处理
		$('#stDates').datepicker({
			format: 'yyyy-mm-dd', 
			weekStart: 0,
			autoclose: true, 
			orientation:"auto",
			startView: 0,
			maxViewMode: 2,
			minViewMode:0,
			forceParse: false, 
			language: 'zh-CN',
			startDate: configDateEvent.minDate1,
			endDate : configDateEvent.maxDate1
		}).on('changeDate',function(e){  
		    if($(this).val() > $('#edDates').val()){
		    	$('#edDates').val($(this).val());
		    }
		    var startTime = e.date; 
		    $('#edDates').datepicker('setStartDate',startTime);  
		});
		$('#edDates').datepicker({
			format: 'yyyy-mm-dd', 
			weekStart: 0,
			autoclose: true, 
			orientation:"auto",
			startView: 0,
			maxViewMode: 2,
			minViewMode:0,
			forceParse: false, 
			language: 'zh-CN',
			startDate: configDateEvent.minDate1,
			endDate : configDateEvent.maxDate1
		}).on('changeDate',function(e){  
			if($(this).val() < $('#stDates').val()){
				$('#stDates').val($(this).val());
			}
		    var endTime = e.date;  
		    $('#stDates').datepicker('setEndDate',endTime);  
		});
		$('#gkgStDate').datepicker({
			format: 'yyyy-mm-dd', 
			weekStart: 0,
			autoclose: true, 
			orientation:"auto",
			startView: 0,
			maxViewMode: 2,
			minViewMode:0,
			forceParse: false, 
			language: 'zh-CN',
			startDate: configDateGkg.minDate1,
			endDate : configDateGkg.maxDate1
		}).on('changeDate',function(e){  
		    if($(this).val() > $('#gkgEdDate').val()){
		    	$('#gkgEdDate').val($(this).val());
		    }
		    var startTime = e.date; 
		    $('#gkgEdDate').datepicker('setStartDate',startTime);  
		});
		$('#gkgEdDate').datepicker({
			format: 'yyyy-mm-dd', 
			weekStart: 0,
			autoclose: true, 
			orientation:"auto",
			startView: 0,
			maxViewMode: 2,
			minViewMode:0,
			forceParse: false, 
			language: 'zh-CN',
			startDate: configDateGkg.minDate1,
			endDate : configDateGkg.maxDate1,
		}).on('changeDate',function(e){  
			if($(this).val() < $('#gkgStDate').val()){
				$('#gkgStDate').val($(this).val());
			}
		    var endTime = e.date;  
		    $('#gkgStDate').datepicker('setEndDate',endTime);  
		});
		//下拉多选框数据
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
		//多选框加载数据
		getSelectCom();
		//ajax获取数据源对应的日期范围
		findConfigDateRange();
		
		//对新闻配置的采集时间、开始时间进行处理
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
		
		$('select:not(.selectCounts)').comboSelect();//所有select标签中非class为selectCounts的标签
		//下拉框 每一个下拉框对应一个ID，然后调用perfectScrollbar美化滚动条
		$(".dowebok0 ul").attr("id","description0");
		$(".dowebok1 ul").attr("id","description1");
		$(".dowebok2 ul").attr("id","description2");
		$(".dowebok3 ul").attr("id","description3");
		$(".dowebok4 ul").attr("id","description4");
		$(".dowebok5 ul").attr("id","description5");
		$(".dowebok6 ul").attr("id","description6");
		$(".dowebok7 ul").attr("id","description7");
		$(".dowebok8 ul").attr("id","description8");
		$(".dowebok9 ul").attr("id","description9");
		$(".dowebok10 ul").attr("id","description10");
		$(".dowebok11 ul").attr("id","description11");
		$(".dowebok12 ul").attr("id","description12");
		$(".dowebok13 ul").attr("id","description13");
		$(".dowebok14 ul").attr("id","description14");
		$(".dowebok15 ul").attr("id","description15");
		$(".dowebok16 ul").attr("id","description16");
		$(".dowebok17 ul").attr("id","description17");
		$(".dowebok18 ul").attr("id","description18");
		$(".dowebok19 ul").attr("id","description19");
		$(".dowebok20 ul").attr("id","description20");
		$(".dowebok21 ul").attr("id","description21");
		$(".dowebok22 ul").attr("id","description22");
		$(".dowebok23 ul").attr("id","description23");
		$(".dowebok24 ul").attr("id","description24");
		$(".dowebok25 ul").attr("id","description25");
		$(".dowebok26 ul").attr("id","description26");
		$(".dowebok27 ul").attr("id","description27");
		$(".dowebok28 ul").attr("id","description28");
		$(".dowebok29 ul").attr("id","description29");
	
		$('#description0').perfectScrollbar({
		  wheelSpeed: 10,
		  wheelPropagation: false
		});
		$('#description1').perfectScrollbar({
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
		$('#description9').perfectScrollbar({
		    wheelSpeed: 10,
		    wheelPropagation: false
		 });
		$('#description10').perfectScrollbar({
		    wheelSpeed: 10,
		    wheelPropagation: false
		 });
		$('#description11').perfectScrollbar({
		    wheelSpeed: 10,
		    wheelPropagation: false
		 });
		$('#description12').perfectScrollbar({
		    wheelSpeed: 10,
		    wheelPropagation: false
		 });
		$('#description13').perfectScrollbar({
		    wheelSpeed: 10,
		    wheelPropagation: false
		 });
		$('#description14').perfectScrollbar({
		    wheelSpeed: 10,
		    wheelPropagation: false
		 });
		$('#description15').perfectScrollbar({
		    wheelSpeed: 10,
		    wheelPropagation: false
		 });
		$('#description16').perfectScrollbar({
		    wheelSpeed: 10,
		    wheelPropagation: false
		 });
		$('#description17').perfectScrollbar({
		    wheelSpeed: 10,
		    wheelPropagation: false
		 });
		$('#description18').perfectScrollbar({
		    wheelSpeed: 10,
		    wheelPropagation: false
		 });
		$('#description19').perfectScrollbar({
		    wheelSpeed: 10,
		    wheelPropagation: false
		 });
		$('#description20').perfectScrollbar({
		    wheelSpeed: 10,
		    wheelPropagation: false
		 });
		$('#description21').perfectScrollbar({
		    wheelSpeed: 10,
		    wheelPropagation: false
		 });
		$('#description22').perfectScrollbar({
		    wheelSpeed: 10,
		    wheelPropagation: false
		 });
		$('#description23').perfectScrollbar({
		    wheelSpeed: 10,
		    wheelPropagation: false
		 });
		$('#description24').perfectScrollbar({
		    wheelSpeed: 10,
		    wheelPropagation: false
		 });
		$('#description25').perfectScrollbar({
		    wheelSpeed: 10,
		    wheelPropagation: false
		 });
		$('#description26').perfectScrollbar({
		    wheelSpeed: 10,
		    wheelPropagation: false
		 });
		$('#description27').perfectScrollbar({
		    wheelSpeed: 10,
		    wheelPropagation: false
		 });
		$('#description28').perfectScrollbar({
		    wheelSpeed: 10,
		    wheelPropagation: false
		 });
		$('#description29').perfectScrollbar({
		    wheelSpeed: 10,
		    wheelPropagation: false
		 });
	
		$(".closePoP").on('click',function(){
			$(".shadow").css("display","none");
			$(".popup").css("display","none");
			$(".popup2").css("display","none");
		});
		
	})
    
	
	
	//选择年月日（事件）
	function selectYearMonthDay(value){
		var maxDate,minDate;
		if(value == 1){
			maxDate = configDateEvent.maxDate1;
			minDate = configDateEvent.minDate1;
			$(".dataSourceType1").prop('checked','true');
		}else if(value == 2){
			maxDate = configDateEvent.maxDate2;
			minDate = configDateEvent.minDate2;
			$(".dataSourceType2").prop('checked','true');
		}else{
			maxDate = configDateEvent.maxDate3;
			minDate = configDateEvent.minDate3;
			$(".dataSourceType3").prop('checked','true');
		}
		$('#stDates').val(minDate);
		$('#edDates').val(maxDate);
		//提示结束时间赋值
		$("#stDateSpan").html(minDate);
		$("#edDateSpan").html(maxDate);
		//重置时间插件的时间范围 注意：必须放置setDate之前
		$('#stDates').datepicker('setStartDate',minDate); 
		$('#edDates').datepicker('setEndDate',maxDate);
		//将时间范围的最大值、最小值放在开始时间和结束时间
		$('#stDates').datepicker('setDate',minDate); 
		$('#edDates').datepicker('setDate',maxDate);
		 
	}
	//选择年月日（图谱）
	function selectYearMonthDay2(value){
		var maxDate,minDate;
		if(value == 1){
			maxDate = configDateGkg.maxDate1;
			minDate = configDateGkg.minDate1;
			$(".dataSourceType1").prop('checked','true');
		}else if(value == 2){
			maxDate = configDateGkg.maxDate2;
			minDate = configDateGkg.minDate2;
			$(".dataSourceType2").prop('checked','true');
		}else{
			maxDate = configDateGkg.maxDate3;
			minDate = configDateGkg.minDate3;
			$(".dataSourceType3").prop('checked','true');
		}
		$('#gkgStDate').val(minDate);
		$('#gkgEdDate').val(maxDate);
		//提示结束时间赋值
		$("#stDateSpan2").html(minDate);
		$("#edDateSpan2").html(maxDate);
		//重置时间插件的时间范围 注意：必须放置setDate之前
		$('#gkgStDate').datepicker('setStartDate',minDate); 
		$('#gkgEdDate').datepicker('setEndDate',maxDate);
		//将时间范围的最大值、最小值放在开始时间和结束时间
		$('#gkgStDate').datepicker('setDate',minDate); 
		$('#gkgEdDate').datepicker('setDate',maxDate);
	}
	//获取事件配置和图谱配置的三套数据源的日期范围
	function findConfigDateRange(){
		$.ajax({
			url:'../relationAnalysis/findConfigDateRange',
			type:'post',
			dataType:"json",
			//async:false,
			success:function(data){
				configDateEvent = data.configDateEvent;
				configDateGkg = data.configDateGkg;
				$("#stDateSpan").html(configDateEvent.minDate1);
				$("#edDateSpan").html(configDateEvent.maxDate1);
				$("#stDateSpan2").html(configDateGkg.minDate1);
				$("#edDateSpan2").html(configDateGkg.maxDate1);
				//对事件、图谱、开始时间、结束时间插件进行处理
				$('#stDates').datepicker({
					format: 'yyyy-mm-dd', 
					weekStart: 0,
					autoclose: true, 
					orientation:"auto",
					startView: 0,
					maxViewMode: 2,
					minViewMode:0,
					forceParse: false, 
					language: 'zh-CN',
					startDate: configDateEvent.minDate1,
					endDate : configDateEvent.maxDate1
				}).on('changeDate',function(e){  
				    if($(this).val() > $('#edDates').val()){
				    	$('#edDates').val($(this).val());
				    }
				    var startTime = e.date; 
				    $('#edDates').datepicker('setStartDate',startTime);  
				});
				$('#edDates').datepicker({
					format: 'yyyy-mm-dd', 
					weekStart: 0,
					autoclose: true, 
					orientation:"auto",
					startView: 0,
					maxViewMode: 2,
					minViewMode:0,
					forceParse: false, 
					language: 'zh-CN',
					startDate: configDateEvent.minDate1,
					endDate : configDateEvent.maxDate1
				}).on('changeDate',function(e){  
					if($(this).val() < $('#stDates').val()){
						$('#stDates').val($(this).val());
					}
				    var endTime = e.date;  
				    $('#stDates').datepicker('setEndDate',endTime);  
				});
				$('#gkgStDate').datepicker({
					format: 'yyyy-mm-dd', 
					weekStart: 0,
					autoclose: true, 
					orientation:"auto",
					startView: 0,
					maxViewMode: 2,
					minViewMode:0,
					forceParse: false, 
					language: 'zh-CN',
					startDate: configDateGkg.minDate1,
					endDate : configDateGkg.maxDate1
				}).on('changeDate',function(e){  
				    if($(this).val() > $('#gkgEdDate').val()){
				    	$('#gkgEdDate').val($(this).val());
				    }
				    var startTime = e.date; 
				    $('#gkgEdDate').datepicker('setStartDate',startTime);  
				});
				$('#gkgEdDate').datepicker({
					format: 'yyyy-mm-dd', 
					weekStart: 0,
					autoclose: true, 
					orientation:"auto",
					startView: 0,
					maxViewMode: 2,
					minViewMode:0,
					forceParse: false, 
					language: 'zh-CN',
					startDate: configDateGkg.minDate1,
					endDate : configDateGkg.maxDate1,
				}).on('changeDate',function(e){  
					if($(this).val() < $('#gkgStDate').val()){
						$('#gkgStDate').val($(this).val());
					}
				    var endTime = e.date;  
				    $('#gkgStDate').datepicker('setEndDate',endTime);  
				});
			}
		})
	}
	
	
	//配置切换按钮
	function pzSwitch(obj){
		//每次改变回溯入口的时候。需要把已经存在的回溯配类型型清空,包括已经勾选上的配置类型
		$("input[name='pzTypes']").each(function(){
			if($(this).prop("checked") == true){
				$(this).prop("checked",false);
			}
		})
		$("#allTypesName").val("");
		$("#allTypesName").attr("title","");
		$(".pzTypes").val("");
		var pz_flag = $(obj).val();
		$("#pz_flag").val(pz_flag);
		//每次切换的时候，默认点击数据源一
		$(".dataSourceTypeRela1").click();
		
		$(".pz_tab").removeClass("pz_tab_select");
		$(".pz_tab").removeClass("pz_tab_not_select");
		if(pz_flag==1){//事件配置显示
			$("#event_pz").addClass("pz_tab_select");
			$("#gkg_pz").addClass("pz_tab_not_select");
			$("#news_pz").addClass("pz_tab_not_select");
			
			$("#event_condtion").show();
			$("#gkg_condtion").hide();
			$("#news_condtion").hide();
			
			$("#eventPZ").children(".pz_title").removeClass("pz_title_select").addClass("pz_title_not_select");
			$("#gkgPZ").children(".pz_title").removeClass("pz_title_not_select").addClass("pz_title_select");
			$("#newsPZ").children(".pz_title").removeClass("pz_title_not_select").addClass("pz_title_select");
			$("#eventPZ").children(".pz_list_box").children(".pzlx_box").each(function(){
				$(this).removeClass("pzlx_select").addClass("pzlx_not_select");
			});
			$("#gkgPZ").children(".pz_list_box").children(".pzlx_box").each(function(){
				$(this).removeClass("pzlx_not_select").addClass("pzlx_select");
			});
			$("#newsPZ").children(".pz_list_box").children(".pzlx_box").each(function(){
				$(this).removeClass("pzlx_not_select").addClass("pzlx_select");
			});
			$("#eventPZ input").each(function(){
				$(this).attr("disabled",true);
			});
			$("#gkgPZ input").each(function(){
				$(this).attr("disabled",false);
			});
			$("#newsPZ input").each(function(){
				$(this).attr("disabled",false);
			});
			
		}else if(pz_flag==2){//图谱配置显示
			$("#gkg_pz").addClass("pz_tab_select");
			$("#event_pz").addClass("pz_tab_not_select");
			$("#news_pz").addClass("pz_tab_not_select");
			
			$("#gkg_condtion").show();
			$("#event_condtion").hide();
			$("#news_condtion").hide();
			
			$("#gkgPZ").children(".pz_title").removeClass("pz_title_select").addClass("pz_title_not_select");
			$("#eventPZ").children(".pz_title").removeClass("pz_title_not_select").addClass("pz_title_select");
			$("#newsPZ").children(".pz_title").removeClass("pz_title_not_select").addClass("pz_title_select");
			$("#gkgPZ").children(".pz_list_box").children(".pzlx_box").each(function(){
				$(this).removeClass("pzlx_select").addClass("pzlx_not_select");
			});
			$("#eventPZ").children(".pz_list_box").children(".pzlx_box").each(function(){
				$(this).removeClass("pzlx_not_select").addClass("pzlx_select");
			});
			$("#newsPZ").children(".pz_list_box").children(".pzlx_box").each(function(){
				$(this).removeClass("pzlx_not_select").addClass("pzlx_select");
			});
			$("#gkgPZ input").each(function(){
				$(this).attr("disabled",true);
			});
			$("#eventPZ input").each(function(){
				$(this).attr("disabled",false);
			});
			$("#newsPZ input").each(function(){
				$(this).attr("disabled",false);
			});
		}else if(pz_flag==36){
			//新闻配置对应的数据源一的时间范围
			$(".dataSourceType_news1").click();
			
			//新闻配置显示
			$("#news_pz").addClass("pz_tab_select");
			$("#event_pz").addClass("pz_tab_not_select");
			$("#gkg_pz").addClass("pz_tab_not_select");
			
			$("#news_condtion").show();
			$("#gkg_condtion").hide();
			$("#event_condtion").hide();
			
			$("#newsPZ").children(".pz_title").removeClass("pz_title_select").addClass("pz_title_not_select");
			$("#eventPZ").children(".pz_title").removeClass("pz_title_not_select").addClass("pz_title_select");
			$("#gkgPZ").children(".pz_title").removeClass("pz_title_not_select").addClass("pz_title_select");
			$("#newsPZ").children(".pz_list_box").children(".pzlx_box").each(function(){
				$(this).removeClass("pzlx_select").addClass("pzlx_not_select");
			});
			$("#eventPZ").children(".pz_list_box").children(".pzlx_box").each(function(){
				$(this).removeClass("pzlx_not_select").addClass("pzlx_select");
			});
			$("#gkgPZ").children(".pz_list_box").children(".pzlx_box").each(function(){
				$(this).removeClass("pzlx_not_select").addClass("pzlx_select");
			});
			$("#newsPZ input").each(function(){
				$(this).attr("disabled",true);
			});
			$("#eventPZ input").each(function(){
				$(this).attr("disabled",false);
			});
			$("#gkgPZ input").each(function(){
				$(this).attr("disabled",false);
			});
		}
	}
	
	//弹出配置类型的选择功能
	function dianji(){
		var bodyScrH = document.body.scrollHeight;
		$(".shadow").height(bodyScrH);
		$(".shadow").css("display","block");
		$("#popup_pzlx").css("display","block");
	}
	
	//关闭弹出框（配置类型、配置类型详情用同一个）
	function closePoP(){
		$(".shadow").css("display","none");
		$(".popup").css("display","none");
		$(".popup2").css("display","none");
	};
	//配置类型详情弹出出框,去后台查询子配置的各个状态
	function selectDetail(id,pzTypes){
		//先移除上次遗留的img图片
		if($('.huixian').find('img').length > 0){
			$('.huixian img').remove();
		}
		$.ajax({
			url:'../relationAnalysis/getRelationConfigStatus',
			type: 'POST',
			data: {"configId":id,"pzTypes":pzTypes},
			dataType:'json',
			success:function(data){ 
				if(data.msg=="success"){
					var bodyScrH = document.body.scrollHeight;
					$(".shadow").height(bodyScrH);
					$(".shadow").css("display","block");
					$("#popup_pzlxdetail").css("display","block");
					var split = new Array()
					split = pzTypes.split(",");
					$(".huixian").children(".pzlx_box").each(function(){
						if(Ifcontions($(this).attr("dataValue"),pzTypes)){
							var This = $(this);
							if(data.resultData.length > 0){
								$.each(data.resultData, function(i, item){
									if(item.configCategory == This.attr("dataValue")){
										var htmls = This.html();
										if(item.scheduleStatus == 0 || item.scheduleStatus == 4){
											htmls += "<img class='image_explain' src='<%=basePath %>/static/images/hs_wait.png'>";
										}else if(item.scheduleStatus == 1){
											htmls += "<img class='image_explain' src='<%=basePath %>/static/images/hs_doing.png'>";
										}else if(item.scheduleStatus == 2){
											htmls += "<img class='image_explain' src='<%=basePath %>/static/images/hs_success.png'>";
										}else if(item.scheduleStatus == 3){
											htmls += "<img class='image_explain' src='<%=basePath %>/static/images/hs_fail.png'>";
										}
										This.html(htmls);
									}
								});
							}else{
								var htmls = This.html();
								htmls += "<img class='image_explain' src='<%=basePath %>/static/images/hs_wait.png'>";
								This.html(htmls);
							}
						}else{
							var htmls = $(this).html();
							htmls += "<img class='image_explain' src='<%=basePath %>/static/images/hs_not.png'>";
							$(this).html(htmls);
						}
					});
				}else{
					win.alertEx("获取子配置执行状态失败");
				}
			}
		});
	}
	function Ifcontions(id,pzTypes){
		var split = new Array()
		split = pzTypes.split(",");
		for(var i=0;i<split.length;i++){
			if(split[i]==id){
				return true;
			}
		}
	}
	//查询
	function cx(){
		$('#pageIndexNew').val(0);
		showConfigList();
	}
	
	//获取已勾选的回溯配置类型
	function getAllType(){
		var allTypes = [];
		var allTypesName = [];
		$("input[name='pzTypes']").each(function(){
			if($(this).prop("checked") == true){
				allTypes.push($(this).val());
				allTypesName.push($(this).parent().text().replace(/\s/g,""));
			}
		})
		allTypes = allTypes.join(",");
		allTypesName = allTypesName.join(",");
		$("#allTypesName").val(allTypesName);
		$("#allTypesName").attr("title",allTypesName);
		$(".pzTypes").val(allTypes);
		closePoP();
	}
	showConfigList();
	var tableData = null;
	//查询列表
	function showConfigList(){
		var configName = $('#s_configName').val();//回溯名称
		var creator = $('#s_creator').val();//创建人
		var queryRelationEntry = $('#queryRelationEntry').val();//回溯入口
		var scheduleState = $('#scheduleStateFilter').val();//执行状态
		var pageIndexNew = $('#pageIndexNew').val();//分页要求
		var dt = {
				pageIndex:pageIndexNew,
		};
		if(configName != null && configName != ''){
			dt['configName'] = configName;
		}
		if(creator != null && creator != ''){
			dt['creator'] = creator;
		}
		if(scheduleState != -1){
			dt['scheduleState'] = scheduleState;
		}
		if(queryRelationEntry != -1){
			dt['queryRelationEntry'] = queryRelationEntry;
		}
		$.ajax({
			url:'../relationAnalysis/getRelationConfigList',
			type:'POST',
			data: dt,
			dataType:'json',
			success:function(data){
				var pageSize = data.pageSize;
				var totalRows = data.total;
				var pageIndex = data.pageIndex;
				tableData = data.resultData;
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
	function pageselectCallback(pageIndex){
		$("#pageIndexNew").val(pageIndex);
		initData(pageIndex);
	}
	function initData(pageIndex){
		var tbodys = '';
		var configName = $('#s_configName').val();//回溯名称
		var creator = $('#s_creator').val();//创建人
		var queryRelationEntry = $('#queryRelationEntry').val();//回溯入口
		var scheduleState = $('#scheduleStateFilter').val();//执行状态
		var pageIndexNew = $('#pageIndexNew').val();//分页要求
		var dt = {
				pageIndex:pageIndexNew,
		};
		if(configName != null && configName != ''){
			dt['configName'] = configName;
		}
		if(creator != null && creator != ''){
			dt['creator'] = creator;
		}
		if(scheduleState != -1){
			dt['scheduleState'] = scheduleState;
		}
		if(queryRelationEntry != -1){
			dt['queryRelationEntry'] = queryRelationEntry;
		}
		if(tableData == null){
			$.ajax({
				url:'../relationAnalysis/getRelationConfigList',
				type:'POST',
				data: dt,
				dataType:'json',
				success:function(data){
					tbodys = packageConfigData(data.resultData);
					$('.table tbody').html(tbodys);
				}
			});
		}else{
			tbodys = packageConfigData(tableData);
			tableData = null;
			$('.table tbody').html(tbodys);
		}
		return true;
	}
	function packageConfigData(rs){
		//计算序号与分页是对应的数值
		var pageIndex_current = $('#pageIndexNew').val();
		var pageSize = 10;
		
		var tbody = '', trs = '';
		$.each(rs, function(i, item){
			trs += '<tr><td><input type="checkbox" class="newFuxuankuang" onclick="newFuxuankuang()" data='+item.configId+' data-status='+item.scheduleState+' data-flid='+item.flid+'></td><td>' + (pageIndex_current * pageSize + i + 1) + '</td>';
			trs += '<td>' + item.configName + '</td>';
			if(item.queryRelationEntry==1){
				trs += '<td>事件回溯</td>';
			}else if(item.queryRelationEntry==2){
				trs += '<td>图谱回溯</td>';
			}else if(item.queryRelationEntry==36){
				trs += '<td>新闻回溯</td>';
			}
			/* trs += '<td>' + item.pzTypesName + '</td>'; */
			var ll = item.pzTypes.split(",").length;
			trs += '<td onclick="selectDetail('+ item.configId +',\''+item.pzTypes+'\')">总数：<span class="tab_data_span"  style="color: #DBE907;" >'+ll+'</span> 成功：<span class="tab_data_span" style="color: #04DFE9;" >'+item.statusNum.num2+'</span> 失败：<span class="tab_data_span" style="color: red;" >'+item.statusNum.num3+'</span> 回溯中：<span class="tab_data_span"  style="color: #1377de;">'+item.statusNum.num1+'</span> 排队中：<span class="tab_data_span"  style="color: #1377de;">'+item.statusNum.num4+'</span></td>';
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
			if(item.costTime == undefined){
				trs += '<td></td>';
			}else{
				trs += '<td>' + item.costTime + '</td>';
			}
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
				trs += '<td><img title="回溯成功" class="set" src="<%=basePath%>/static/images/end_remountTo.png"><img title="修改" class="set" src="<%=basePath%>/static/images/set.png" onclick="updateRelationConfig('+ item.configId+','+item.queryRelationEntry+','+ item.scheduleState +')"><img title="删除" class="del" src="<%=basePath%>/static/images/del.png" onclick="delRelationConfig('+ item.configId+')"></td>';
			}else if(item.scheduleState == 1){//执行中
				trs += '<td><img title="回溯中" class="set" src="<%=basePath%>/static/images/end_remountTo.png"><img title="修改" class="set" src="<%=basePath%>/static/images/set.png" ><img title="删除" class="del" src="<%=basePath%>/static/images/del.png"></td>';
			}else if(item.scheduleState == 4){//排队中
				trs += '<td><img title="排队中" class="set" src="<%=basePath%>/static/images/end_remountTo.png"><img title="修改" class="set" src="<%=basePath%>/static/images/set.png" ><img title="删除" class="del" src="<%=basePath%>/static/images/del.png"></td>';
			}else{																																	
				trs += '<td><img title="回溯" class="set" src="<%=basePath%>/static/images/begin_remountTo.png" onclick="getRelationConfigNum('+ item.configId +')"><img title="修改" class="set" src="<%=basePath%>/static/images/set.png" onclick="updateRelationConfig('+ item.configId+','+item.queryRelationEntry+','+ item.scheduleState +')"><img title="删除" class="del" src="<%=basePath%>/static/images/del.png" onclick="delRelationConfig('+ item.configId+')"></td>';
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
	//删除配置
	function delRelationConfig(id){
		var dt = {configId:id,flid:0};
		$.ajax({
			url: '../config/findDelConfigAuth',
			type: 'POST',
			data: dt,
			success: function(data){
				if(data.msg == 'nopermission'){
					win.alertEx('无删除权限');
				}else if(data.msg == 'ok'){
					 win.confirm('系统提示', '确定要删除配置信息吗?', function (r) {
		               if(r){
		            	   $.ajax({
								url: '../relationAnalysis/delRelationConfig',
								type: 'POST',
								data: dt,
								dataType:'json',
								success: function(data){
									if(data.msg == 'ok'){
										 win.alert('系统提示', '配置删除成功',  function(){
											 showConfigList();
											 $("#infodiv").css("display","none");
										 });
										
									}else{
										win.alertEx("操作失败！");
									}
							  	}
							});
		               }else{
		            	   win.alertEx("已取消");
		               }
			         });
				}else{
					win.alertEx("操作失败！");
				}
		  }
		});
	}
	//批量删除
	function delAllRelationConfig(){
		var ids = "";
		var isDel = true;
		$(".table tbody :checkbox").each(function(){
			if($(this).prop("checked") == true){
				ids += $(this).attr("data")+",";
				if($(this).attr("data-status")==1||$(this).attr("data-status")==4){//正在执行的和排队中的配置不能删除
					isDel = false;
					return false;
				}
			}
		});
		if(ids.length>0){
			if(isDel){
				var dt = {configId:1,flid:0};
				$.ajax({
					url: '../config/findDelConfigAuth',
					type: 'POST',
					data: dt,
					success: function(data){
						if(data.msg == 'nopermission'){
							win.alertEx('无删除权限!');
						}else if(data.msg == 'ok'){
							 win.confirm('系统提示', '确定要删除配置信息吗?', function (r) {
				               if(r){
				            	   var dt2 = {ids:ids};
				            	   $.ajax({
										url: '../relationAnalysis/delAllRelationConfig',
										type: 'POST',
										data: dt2,
										dataType:'json',
										success: function(data){
											if(data.msg == 'ok'){
												 win.alert('系统提示', '配置批量删除成功',  function(){
													 showConfigList();
													 $("#infodiv").css("display","none");
												 });
												
											}else{
												win.alertEx("操作失败！");
											}
									  }
									});
				               }else{
				            	   win.alertEx("已取消");
				               }
					         });
						}else{
							win.alertEx("操作失败！");
						}
				  	}
				});
			}else{
				win.alertEx("所勾选配置中含有【排队中】或者【执行中】的配置，请重新勾选");
			}
		}else{
			win.alertEx("请勾选需要删除的配置");
		}
	}
	function updateRelationConfig(id,relationEntry,status){//参数类型：配置id，回溯入口，执行状态
		
		//回显选中回溯入口
		$('#relationEntry option').each(function(){
			if(relationEntry == $(this).val()){
				$(this).parent().siblings('input[type=text]').val($(this).html());
				$(this).attr('selected', true);
				pzSwitch($(this));
			}else{
				$(this).attr('selected', false);
			}
		});
		if(status == 2){//执行成功的配置，回溯入口不支持点击
			$("#hsrk").show();
		}else{
			$("#hsrk").hide();
		}
		//调用统一的修改方法
		editConfig(id,"",0,status,null,null,'relation');
	}
	//先查询结果记录数，并提示用户是否进行回溯
	function getRelationConfigNum(id){
		startLoad();
		$.ajax({
			url:'../relationAnalysis/getRelationConfigNum',
			type: 'POST',
			data: {configId:id},
			dataType:'json',
			success:function(data){
				endLoad();
				if(data.msg=="error"){
					win.alertEx("查询配置产生数据量失败。");
				}else{
					win.confirm('系统提示', '该条配置最终会产生'+data.msg+'条数据，是否要继续执行？', function (r) {
				        if(r){
				        	//调用修改配置状态方法
				        	updateConfigStatus(id);
				        	showConfigList();
				        	/* $.ajax({
				    			url:'../relationAnalysis/relationConfig',
				    			type: 'POST',
				    			data: {configId:id},
				    			dataType:'json',
				    			success:function(data){
				    				showConfigList();
				    			}
				        	}); */
				        }else{
				        	win.alertEx("已取消");
				        }
				 	});
				}
			}
		});
	}
	
	$(".dataSourceTypeRela").click(function(){
		var pz_flag = $("#pz_flag").val();
		var value = $(this).val();
		if(pz_flag == 1){//事件配置
			selectYearMonthDay(value);
		}else if(pz_flag == 2){//图谱配置
			selectYearMonthDay2(value);
		}
	})
</script>
<jsp:include page="./updateUserPassword.jsp"/>
</body>
</html>