<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<title>图谱实体地理网络展示 </title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="shortcut icon" type="image/x-icon" href="<%=basePath%>/static/Visualization/base/ico.png"/>
<link rel="stylesheet" href="<%=basePath%>/static/css/style.css">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/jquery-1.11.1.min.js"></script>
<!--人工查询 -->
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/css/bootstrap.min.css"/>
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath %>/static//lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath %>/static/css/combo.select.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/perfect-scrollbar.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/base.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/css/event_result.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/js/amcharts/export/export.css"/>
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window_zs.css"/><!-- 弹出提示框样式 -->
<script src="<%=basePath %>/static/js/config/config.js"></script>
<!-- 两种皮肤切换 -->
<c:if test="${bgFlag == null or bgFlag == 1}">
	<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css"/>
	<link rel="stylesheet" href="<%=basePath %>/static/css/sec2.css">
	<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
	<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.min.css"/>
	<link rel="stylesheet" href="<%=basePath %>/static/css/sec2_2.css">
	<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
</c:if>
<style type="text/css">
      svg.wordCloud {
    	width: 1000px;
    	height: 500px;
      }
	  svg.wordCloud g {
		transform: translate(500px, 250px);
		-moz-transform: translate(500px, 250px);
		-webkit-transform: translate(350px, 250px);
	  }
</style>
</head>
<body>
	<!-- 事件描述 -->
    <div class="index_top clearfix">
		<h3 class="fl title">图谱库分析 > 地理网络</h3>
		<!-- <div class="title_r fr">
			<span class="export_img_2" title="图表切换"></span>
			<span class="info_img"></span>
			<ul class="info_box">
				<li><span>数据：</span>事件数据库</li>
				<li><span>描述：</span>反映一段时间内，某地发生的事件的对比情况</li>
				<li><span>输入：</span>对比信息，事件编码，阈值信息</li>
				<li><span>介绍：</span>ttajkasdasdfa asdfasdf asdfa啊发生的发生地阿打法的疯狂拉升地方案的发生发生的法律看见俺十分啊发生的发生地发沙发</li>
			</ul>
		</div> -->
	</div>
	<div class="index_bottom">
	<!-- 显示图 -->
	<input type="hidden" id="moduleCode" value="${moduleCode}">
	<div class="data show">
     <!-- <div class="container show-graph" style="width: 100%;"> -->
     	<div class="row">
         	 <div class="col-md-12 mg_t ">
	            <div class="col-md-10 bor w50l" style="border: 1px solid #CCCCCC;margin: 0px 0px 0px 0;width:49.5%; float:left; border-radius:3px;">
	               <div class="col-md-5" id="pie_chart_text" style="width:45%;">
	                    <h3 class="tx-l">国家联系展示
	                    	<select style="margin-left:10px;" class="selectCounts" id="selectCountryLX1"></select>
	                       	<div  class="help" onmouseover="showChartInfo(1,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
                    	</h3>
	                </div>
	               <!-- <h3 class="headline first-child"><span class="fa fa-bar-chart"></span></h3>-->
                   <div class="col-md-7" style="width:100%;">
                   		<div id="radar_chart" class="amcharts twoCharts"></div>
           		   </div>
	            </div>
	            <div class="col-md-10 bor w50r" style="border: 1px solid #CCCCCC;margin: 0px 0px 0px 0; border-radius:3px;width:49.5%; float:right;">
	               <!-- <h3 class="headline first-child"><span class="fa fa-bar-chart"></span></h3>-->
	                <div class="col-md-5" id="radar_chart_text" style="width:45%;">
	                    <h3 class="tx-l">城市联系展示
	                    	<select class="selectCounts" style="margin-left:10px;" id="selectCityLX">
	                       	</select>
	                       	<div  class="help" onmouseover="showChartInfo(2,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
                    	</h3>
	                </div>
	                <div class="col-md-7" style="width:100%">
                    <div id="pie_chart" class="amcharts twoCharts"></div>
                </div> 
	             </div>
            </div>
        </div>
     	
     
    	<!-- <div class="row"style="">
	         <div class="col-md-12 mg_t ">
	            <div class="col-md-10" style="width:100%;border: 1px solid #CCCCCC;margin: 0px -8px 0 0;border-radius:3px;height:437px;">
	               <div class="col-md-12 map-text" >
	                    <h1 style="font-size:14px;">国家联系展示 </h1>
	                </div>
	                <div style="margin-left: 5%;margin-right: 8%">
	                    <select class="selectCounts form-control"  id="selectCountryLX2">
                       	</select>
	                </div>
	               <div id="column_chart" class="amcharts"></div>
	            </div>
			 </div>
        </div> -->
        
        
        <div class="row">
	         <div class="col-md-12 mg_t ">
	            <div class="col-md-10" style="width:100%;border: 1px solid #CCCCCC;margin: 0px -8px 0 0;border-radius:3px;">
	                
	                <!-- <div class="col-md-12 map-text">
		                    <h1 class="zz1" style="font-size:14px;">组织统计 
		                    	<select class="selectCounts" style="margin-left:10px;" id="selectZZ"></select>
		                    </h1>
		                 </div>
		                 <div class="col-md-12" style="width:100%;margin-top:20px;">
		                     <div id="column_chart" class="amcharts"></div>
		                 </div> -->
	                
	                <div class="col-md-12 map-text" >
	                    <h3 class="tx-c" >国家联系展示
	                    	<select class="selectCounts" style="margin-left:10px;" id="selectCountryLX2"></select>
	                    	<div  class="help" onmouseover="showChartInfo(3,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
	                    </h3>
	                </div>
	                     <div id="column_chart" class="amcharts oneColumChart"></div>
	            </div>
			 </div>
        </div>
       
		<!-- <div class="row">
		 <div class=" mg_t ">        
		    <div class="col-md-10  " style="width:100%;border: 1px solid #CCCCCC;width:100%;border-radius:3px;height:437px">
               <h3 class="headline first-child"><span class="fa fa-bar-chart"></span></h3>
               <div class="col-md-5 chart-text" id="column_chart_text" style="opacity:1;margin-top:0px;float: initial;width:100%;text-align: center;">
                    <h1 style="font-size:14px;color:black;">国家联系展示
       		            <select class="selectCounts" style="margin-left:10px;" id="selectCountryLX2">
				                        	
                       	</select>
                    </h1>
                </div>
                <div class="col-md-7" style="width:100%;">
                    <div id="column_chart" class="amcharts"></div>
                </div>               
            </div>
		</div>
		</div> -->
		
		<div class="row">
				<div class="col-md-12 mg_t mg_b">
		                <div class="col-md-12 map-text">
		                    <h3 class="tx-c mapText_heat">城市联系展示
		                    	<div  class="help" onmouseover="showChartInfo(4,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
		                    </h3>
		                </div>
		                <div class="bor">
		                    <div id="line_map" class="amcharts myleafletjsMap" ></div>
		                </div>
		        </div>
	        </div>
		
		<!-- <div class="row"style="">
	         <div class="col-md-12 mg_t mg_b">
	            <div class="col-md-10" style="width:100%;border: 1px solid #CCCCCC;margin: 0px -8px 0 0;border-radius:3px;height:437px;">
	                <div class="col-md-12 map-text" >
	                    <h1 style="font-size:14px;">城市联系展示 </h1>
	                </div>
	                <div class="col-md-12">
                    <div id="line_map" class="ammap"></div>
                	</div>
	            </div>
			 </div>
        </div> -->
		
        <!-- <div class="row"style="">
           <div class=" mg_t ">          
            <div class="col-md-10 "style="width:100%;border: 1px solid #CCCCCC;width:100%;border-radius:3px;height:437px;margin-bottom:70px;margin-top:15px;">
                <div class="col-md-12 map-text">
                    <h1 style="font-size:14px;color:black;">城市联系展示</h1>
                </div>
                <div class="col-md-12">
                    <div id="line_map" class="ammap"></div>
                </div>
        	</div>
       </div>
    	</div> -->
   	 </div>
    </div>
		<!-- 显示图结束 --> 
		<!-- 显示表格 -->
		<%-- <div class="data2">
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
					<tr>
						<td>1</td>
						<td><span class="sort sort1">1</span></td>
						<td><img class="gq" src="<%=basePath%>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath%>/static/images/set.png"/>
							<img class="del" src="<%=basePath%>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>2</td>
						<td><span class="sort sort2">2</span></td>
						<td><img class="gq" src="<%=basePath%>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath%>/static/images/set.png"/>
							<img class="del" src="<%=basePath%>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>3</td>
						<td><span class="sort sort3">3</span></td>
						<td><img class="gq" src="<%=basePath%>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath%>/static/images/set.png"/>
							<img class="del" src="<%=basePath%>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>3</td>
						<td><span class="sort sort7">4</span></td>
						<td><img class="gq" src="<%=basePath%>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath%>/static/images/set.png"/>
							<img class="del" src="<%=basePath%>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>5</td>
						<td><span class="sort sort7">5</span></td>
						<td><img class="gq" src="<%=basePath%>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath%>/static/images/set.png"/>
							<img class="del" src="<%=basePath%>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>6</td>
						<td><span class="sort sort7">6</span></td>
						<td><img class="gq" src="<%=basePath%>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath%>/static/images/set.png"/>
							<img class="del" src="<%=basePath%>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>7</td>
						<td><span class="sort sort7">7</span></td>
						<td><img class="gq" src="<%=basePath%>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath%>/static/images/set.png"/>
							<img class="del" src="<%=basePath%>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>8</td>
						<td><span class="sort sort7">8</span></td>
						<td><img class="gq" src="<%=basePath%>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath%>/static/images/set.png"/>
							<img class="del" src="<%=basePath%>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>9</td>
						<td><span class="sort sort7">9</span></td>
						<td><img class="gq" src="<%=basePath%>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath%>/static/images/set.png"/>
							<img class="del" src="<%=basePath%>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>10</td>
						<td><span class="sort">10</span></td>
						<td></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state2.png"/></td>
						<td>
							<img class="set" src="<%=basePath%>/static/images/set.png"/>
							<img class="del" src="<%=basePath%>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>11</td>
						<td><span class="sort sort10">11</span></td>
						<td><img class="gq" src="<%=basePath%>/static/images/gq2.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath%>/static/images/set.png"/>
							<img class="del" src="<%=basePath%>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>12</td>
						<td><span class="sort">12</span></td>
						<td><!-- <img class="gq" src="../images/gq.png" alt="挂起"> --></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath%>/static/images/state3.png"/></td>
						<td>
							<img class="set" src="<%=basePath%>/static/images/set.png"/>
							<img class="del" src="<%=basePath%>/static/images/del.png"/>
						</td>
					</tr>
				</tbody>
			</table>
			<div id="Pagination" class="pagination"><!-- 这里显示分页 --></div>
			<div id="Searchresult">分页初始化完成后这里的内容会被替换。</div>
		</div> --%>
		<!-- 显示表格结束 -->
		<!-- 页面底部收缩 -->
		<%-- <div class="tab">
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
					<p class="manual">人工输入查询</p>
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
					<ul class="tab_down_info">
						<li class="clearfix">
							<div class="td1 fl">
								<p class="time_png fl"></p>
								<b>日期属性：</b>
							</div> 
							<c:forEach items="${t.dateInfo }" var="tt">
								<div class='add_date clearfix'>
									<div class='clearfix' style="margin-left: 140px;">
										<div class="fl"><span class="beg_time fl">开始时间</span></div>
										<div class='td3_2 fl'>
											<label class='lab2' for=''><input class='inp_selc'
												name='stDates' type='text' readonly value='${tt.stDate}' /></label>
										</div>
										<div class='fl width18'></div>
										<div class="fl"><span class="end_time fl">结束时间</span></div>
										<div class='td3_2 fl'>
											<label class='lab2' for=''><input class='inp_selc'
												name='edDates' type='text' readonly value='${tt.edDate}' /></label>
										</div>
									</div>
								</div>
							</c:forEach>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="threshold_png fl"></p><b>关键字搜索条件：</b></div>
							<div >您必须指定检索的关键词，用逗号隔开；在检索中，以下三个查询条件之间是“AND”关系</div>
							<div class="fl">
								<div class="condition fl">必须包含以下所有关键词</div>
								<input class="condition_info fl" type="text" readonly value='${t.necessaryKey}' />
							</div>
							<div class="fl  condition_box3">
								<div class="condition fl">不能包含以下关键词</div>
								<input class="condition_info fl" type="text" readonly value='${t.exclusiveKey}' />
							</div>
							<div class="fl condition_box2">
								<div class="condition fl">包含至少一个以下关键词</div>
								<input class="condition_info fl" type="text" readonly value='${t.atLeastOneKey}' />
							</div>
						</li>
						<li class="clearfix">
							<div class="td1 fl">
								<p class="weight_png fl"></p>
								<b>权重依据：</b>
							</div>
							<div class="td5 fl">
								<input type="radio" name="weightFlag${t.configId }"
									<c:if test="${t.weightFlag eq 1}"> checked="checked"</c:if>
									value="1"><label for="radio1"> 包含所选实体集的新闻报道数 (1)</label>
							</div>
							<div class="td5 fl">
								<input type="radio" name="weightFlag${t.configId }"
									<c:if test="${t.weightFlag eq 2}"> checked="checked"</c:if>
									value="2"><label for="radio2"> 包含所选实体集的新闻报道数(NUMARTS)</label>
							</div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="threshold_png fl"></p><b>事件阈值过滤：</b></div>
							<div class="td5 fl">节点阈值 <input id="reduce1" class="reduce" type="button" value="-" /><input id="threshold1" class="threshold" name="nodeThreshold" type="text" value="${t.nodeThreshold }"/><input id="add1" class="add" type="button" value="+" /></div>
							<div class="td5 fl">边阈值 <input id="reduce2" class="reduce" type="button" value="-" /><input id="threshold2" class="threshold" name="edgeThreshold" type="text" value="${t.edgeThreshold }"/><input id="add2" class="add" type="button" value="+" /></div>
						</li>
						<!-- 情感值 -->
						<li class="clearfix">
							<div class="td1 fl"><p class="tone_png fl"></p><b class="sjsx">情感值：</b></div>
							<div class="radio_box " id="toone" >
								<!-- 回显平均情感值的复选框以及对应的起始值和结束值 -->
								<label for="avgtone" style="float: left;padding-right: 37px;">
									<c:set value="false" var="flag_avgTone"></c:set>
									<c:set value="" var="qs_avgTone"></c:set>
									<c:set value="" var="js_avgTone"></c:set>
									<c:forEach items="${t.gkgToneConfigInfo }" var="tone">
										<c:if test="${tone.sxID==1}">
											<c:set value="true" var="flag_avgTone"></c:set>
											<c:set value="${tone.qsSXZ}" var="qs_avgTone"></c:set>
											<c:set value="${tone.jsSXZ}" var="js_avgTone"></c:set>
										</c:if>
									</c:forEach>
									<input onclick="return false;" class="radioAndCheckboxByFont_css" type="checkbox" <c:if test="${flag_avgTone == true}">checked="checked"</c:if> />平均情感
								</label>
								<c:if test="${flag_avgTone == true}">
									<label  style="float: left;padding-right: 15px;" class="avg" >
										<input style="width:50px;" class="condition_info_tone fl"   type="text" value="${qs_avgTone }" />
										<span class="fl">—</span>
										<input style="width:50px;" class="condition_info_tone fl"   type="text" value="${js_avgTone }"  />
									</label>
								</c:if>
								
								<!-- 回显正向情感词比例的复选框 -->
								<label for="Positive" style="float: left;padding-right: 15px;">
									<c:set value="false" var="flag_Positive"></c:set>
									<c:forEach items="${t.gkgToneConfigInfo }" var="tone">
										<c:if test="${tone.sxID==2}">
											<c:set value="true" var="flag_Positive"></c:set>
											<c:set value="${tone.qsSXZ}" var="qs_Positive"></c:set>
											<c:set value="${tone.jsSXZ}" var="js_Positive"></c:set>
										</c:if>
									</c:forEach>
									<input onclick="return false;" type="checkbox" class="radioAndCheckboxByFont_css" <c:if test="${flag_Positive == true}">checked="checked"</c:if> />正向情感词比例
								</label>
								<c:if test="${flag_Positive == true}">
									<label  style="float: left;padding-right: 15px;" class="avg" >
										<input style="width:50px;" class="condition_info_tone fl"   type="text" value="${qs_Positive }" />
										<span class="fl">—</span>
										<input style="width:50px;" class="condition_info_tone fl"   type="text" value="${js_Positive }"  />
									</label>
								</c:if>
							</div>
						</li>
						<li class="clearfix">
							<div class="radio_box " id="toone2" >	
								<!-- 回显负情感词比例的复选框 -->
								<label for="Negative" style="float: left;padding-left: 139px;height: 23px;padding-right: 13px;">
									<c:set value="false" var="flag_Negative"></c:set>
									<c:forEach items="${t.gkgToneConfigInfo }" var="tone">
										<c:if test="${tone.sxID==3}">
											<c:set value="true" var="flag_Negative"></c:set>
											<c:set value="${tone.qsSXZ}" var="qs_Negative"></c:set>
											<c:set value="${tone.jsSXZ}" var="js_Negative"></c:set>
										</c:if>
									</c:forEach>
									<input onclick="return false;"  class="radioAndCheckboxByFont_css" type="checkbox" <c:if test="${flag_Negative == true}">checked="checked"</c:if> />负情感词比例
								</label>
								<c:if test="${flag_Negative == true}">
									<label  style="float: left;padding-right: 15px;" class="avg" >
										<input style="width:50px;" class="condition_info_tone fl"   type="text" value="${qs_Negative }" />
										<span class="fl">—</span>
										<input style="width:50px;" class="condition_info_tone fl"   type="text" value="${js_Negative }"  />
									</label>
								</c:if>
								<!-- 回显极性词比例的复选框 -->
								<label for="Polarity" style="float: left;padding-right: 41px;">
									<c:set value="false" var="flag_Polarity"></c:set>
									<c:forEach items="${t.gkgToneConfigInfo }" var="tone">
										<c:if test="${tone.sxID==4}">
											<c:set value="true" var="flag_Polarity"></c:set>
											<c:set value="${tone.qsSXZ}" var="qs_Polarity"></c:set>
											<c:set value="${tone.jsSXZ}" var="js_Polarity"></c:set>
										</c:if>
									</c:forEach>
									<input onclick="return false;" class="radioAndCheckboxByFont_css" type="checkbox" <c:if test="${flag_Polarity == true}">checked="checked"</c:if> />极性词比例
								</label>
								<c:if test="${flag_Polarity == true}">
									<label  style="float: left;padding-right: 15px;" class="avg" >
										<input style="width:50px;" class="condition_info_tone fl"   type="text" value="${qs_Polarity }" />
										<span class="fl">—</span>
										<input  style="width:50px;" class="condition_info_tone fl"   type="text" value="${js_Polarity }"  />
									</label>
								</c:if>
							</div>
						</li>
						<li class="clearfix">
							<div class="radio_box ">
								<!-- 回显活动词比例的复选框 -->
								<label for="Activitytone" style="float: left;padding-left: 139px;height: 38px;padding-right: 25px;">
									<c:set value="false" var="flag_Activitytone"></c:set>
									<c:forEach items="${t.gkgToneConfigInfo }" var="tone">
										<c:if test="${tone.sxID==5}">
											<c:set value="true" var="flag_Activitytone"></c:set>
											<c:set value="${tone.qsSXZ}" var="qs_Activitytone"></c:set>
											<c:set value="${tone.jsSXZ}" var="js_Activitytone"></c:set>
										</c:if>
									</c:forEach>
									<input onclick="return false;" class="radioAndCheckboxByFont_css" type="checkbox" <c:if test="${flag_Activitytone == true}">checked="checked"</c:if> />活动词比例
								</label>
								<c:if test="${flag_Activitytone == true}">
									<label  style="float: left;padding-right: 15px;" class="avg" >
										<input style="width:50px;" class="condition_info_tone fl"   type="text" value="${qs_Activitytone }" />
										<span class="fl">—</span>
										<input  style="width:50px;" class="condition_info_tone fl"   type="text" value="${js_Activitytone }"  />
									</label>
								</c:if>
								<!-- 回显代称比例的复选框 -->
								<label for="Grouptone" style="float: left;padding-right: 51px;">
									<c:set value="false" var="flag_Grouptone"></c:set>
									<c:forEach items="${t.gkgToneConfigInfo }" var="tone">
										<c:if test="${tone.sxID==6}">
											<c:set value="true" var="flag_Grouptone"></c:set>
											<c:set value="${tone.qsSXZ}" var="qs_Grouptone"></c:set>
											<c:set value="${tone.jsSXZ}" var="js_Grouptone"></c:set>
										</c:if>
									</c:forEach>
									<input onclick="return false;" class="radioAndCheckboxByFont_css" type="checkbox" <c:if test="${flag_Grouptone == true}">checked="checked"</c:if> />代称比例
								</label>
								<c:if test="${flag_Grouptone == true}">
									<label  style="float: left;padding-right: 15px;" class="avg" >
										<input style="width:50px;" class="condition_info_tone fl"   type="text" value="${qs_Grouptone }" />
										<span class="fl">—</span>
										<input style="width:50px;" class="condition_info_tone fl"   type="text" value="${js_Grouptone }"  />
									</label>
								</c:if>
							</div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="ids_png fl"></p><b class="sjsx">ID集合：</b></div>
							<div >您必须输入数字用“,”（英文）隔开，如：256,257；或者输入数字用“-”隔开,表示数据范围</div>
							<div class="radio_box">
								<input class="condition_info_ids fl" type="text" value="${t.ids }"/>
							</div>
						</li>
					</ul>
			</div>
			</c:forEach>
			<!-- 人工输入查询 -->
			<div class="tab_down people_tab_down">
			<form id="graphQueryForm" action="../config/renGongQuery" method="post">
			<input type="hidden" name="flid" id="RGFL">
			<input type="hidden" name="priority" value="1"/>
			<input type="hidden" name="configFlag" value="2"/>
			<input type="hidden" name="configCategoriesStr" id="modelType"/>
			<input type="hidden" name="gkgRemark" value="人工查询"/>
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
									<label class="lab2" for=""><input class="inp_selc day1" id="gkgStDate" name="gkgStDate" type="text" readonly value="${curStDate[2]}"/></label>
								</div>
							</div>
							<div class="fl clearfix">
								<div class="fl"><span class="end_time fl">结束时间</span></div>
								<div class="td3_2 fl">
									<label class="lab2" for=""><input class="inp_selc day2" id="gkgEdDate" name="gkgEdDate" type="text" readonly value="${curEdDate[2]}"/></label>
								</div>
							</div>
						</div>
					</li>
					<li class="clearfix">
							<div class="td1 fl"><p class="threshold_png fl"></p><b>关键字搜索条件：</b></div>
							<div >您必须指定检索的关键词，用逗号隔开；在检索中，以下三个查询条件之间是“AND”关系</div>
							<div class="fl">
								<div class="condition fl">必须包含以下所有关键词</div>
								<input class="condition_info fl" type="text" value="" name="necessaryKey"/>
							</div>
							<div class="fl condition_box2">
								<div class="condition fl">不能包含以下关键词</div>
								<input class="condition_info fl" type="text" value="" name="exclusiveKey"/>
							</div>
							<div class="fl  condition_box3">
								<div class="condition fl">包含至少一个以下关键词</div>
								<input class="condition_info fl" type="text" value="" name="atLeastOneKey"/>
							</div>
						</li>
						
						<li class="clearfix">
							<div class="td1 fl">
								<p class="weight_png fl"></p>
								<b>权重依据：</b>
							</div>
							<div class="td5 fl">
								<input type="radio" name="gkgWeightFlag" value="1" checked><label for="radio1"> 包含所选实体集的新闻报道数 (1) </label>
							</div>
							<div class="td5 fl">
								<input type="radio" name="gkgWeightFlag" value="2"><label for="radio2">  包含所选实体集的新闻报道数(NUMARTS)</label>
							</div>
						</li>
						<!-- <li class="clearfix">
							<div class="td1 fl"><p class="threshold_png fl"></p><b>事件阈值过滤：</b></div>
							<div class="td5 fl">节点阈值 <input id="reduce1" class="reduce" type="button" value="-" /><input id="threshold1" class="threshold" name="nodeThreshold" type="text" value="0"/><input id="add1" class="add" type="button" value="+" /></div>
							<div class="td5 fl">边阈值 <input id="reduce2" class="reduce" type="button" value="-" /><input id="threshold2" class="threshold" name="edgeThreshold" type="text" value="0"/><input id="add2" class="add" type="button" value="+" /></div>
						</li> -->
						<!-- 情感值 -->
						<li class="clearfix"  id="tone" >
							<div class="td1 fl"><p class="tone_png fl"></p><b class="sjsx">情感值：</b></div>
							<div class="radio_box " id="toone" >
								<label for="avgtone" style="float: left;padding-right: 37px;"><input class="radioAndCheckboxByFont_css" type="checkbox"  id="avgtone" name="sxIds" value="1"/> 平均情感</label>
								<label  style="display:none;float: left;padding-right: 15px;" class="avg" >
									<input  class="condition_info_tone fl" id="avgtone1"  type="text" value="-100" name ="qsSXZ" onblur="validate1()"/>
									<span class="fl">—</span>
									<input  class="condition_info_tone_tab fl" id="avgtone2"  type="text" value="100" name ="jsSXZ" onblur="validate11()" />
									<span id="spana" style="display:none;"></span>
								</label>
								
								<label for="Positive" style="float: left;padding-right: 15px;"><input class="radioAndCheckboxByFont_css" type="checkbox" id="Positive" name="sxIds" value="2" /> 正向情感词比例</label>
								<label style="display:none;float: left;padding-right: 15px;" class="pos">
									<input class="condition_info_tone fl" id="Positive1"  type="text" value="0" name ="qsSXZ" onblur="validate2()"/>
									<span class="fl">—</span>
									<input  class="condition_info_tone_tab fl" id="Positive2"  type="text" value="100" name ="jsSXZ"  onblur="validate22()"/>
									<span id="spanb" style="display:none;"></span>
								</label>
							</div>
						</li>
						<li class="clearfix"  id="tone1">
							<div class="radio_box " id="toone2" >	
								<label for="Negative" style="float: left;padding-left: 139px;height: 23px;padding-right: 13px;"><input class="radioAndCheckboxByFont_css" type="checkbox" id="Negative" name="sxIds" value="3" /> 负情感词比例</label>
								<label style="display:none;float: left;padding-right: 15px;" class="neg">
									<input  class="condition_info_tone fl" id="Negative1"  type="text" value="0" name ="qsSXZ" onblur="validate3()"/>
									<span class="fl">—</span>
									<input  class="condition_info_tone_tab fl" id="Negative2"  type="text" value="100" name ="jsSXZ"  onblur="validate33()"/>
									<span id="spanc" style="display:none;"></span>
								</label>
								<label for="Polarity" style="float: left;padding-right: 41px;"><input class="radioAndCheckboxByFont_css" type="checkbox" id="Polarity" name="sxIds" value="4" /> 极性词比例</label>
								<label style="display:none;float: left;padding-right: 23px;" class="pol">
									<input  class="condition_info_tone fl" id="Polarity1"  type="text" value="0" name ="qsSXZ" onblur="validate4()"/>
									<span class="fl">—</span>
									<input  class="condition_info_tone_tab fl" id="Polarity2"  type="text" value="100" name ="jsSXZ"  onblur="validate44()"/>
									<span id="spand" style="display:none;"></span>
								</label>
							</div>
						</li>
						<li class="clearfix"  id="tone2">
							<div class="radio_box " id="toone2" >
								<label for="Activitytone" style="float: left;padding-left: 139px;height: 38px;padding-right: 25px;"><input class="radioAndCheckboxByFont_css" type="checkbox" id="Activitytone" name="sxIds" value="5" /> 活动词比例</label>
								<label style="display:none;float: left;padding-right: 15px;" class="act">
									<input  class="condition_info_tone fl" id="Activitytone1"  type="text" value="0" name ="qsSXZ" onblur="validate5()"/>
									<span class="fl">—</span>
									<input  class="condition_info_tone_tab fl" id="Activitytone2"  type="text" value="100" name ="jsSXZ"  onblur="validate55()"/>
									<span id="spane" style="display:none;"></span>
								</label>
								<label for="Grouptone" style="float: left;padding-right: 51px;"><input class="radioAndCheckboxByFont_css" type="checkbox" id="Grouptone" name="sxIds" value="6" /> 代称比例</label>
								<label style="display:none;float: left;padding-right: 15px;" class="gro">
									<input  class="condition_info_tone fl" id="Grouptone1"  type="text" value="0" name ="qsSXZ" onblur="validate6()"/>
									<span class="fl">—</span>
									<input  class="condition_info_tone_tab fl" id="Grouptone2"  type="text" value="100" name ="jsSXZ"  onblur="validate66()"/>
									<span id="spanf" style="display:none;"></span>
								</label>
							</div>
						</li>
						<li class="clearfix" id="IDs">
							<div class="td1 fl"><p class="ids_png fl"></p><b class="sjsx">ID集合：</b></div>
							<div >您必须输入数字用“,”（英文）隔开，如：256,257；或者输入数字用“-”隔开,表示数据范围</div>
							<div class="radio_box">
								<input class="condition_info_ids fl" type="text" id="ids" name="ids" onblur="validateIDs()"/>
								<span id="IDspan" style=" position:relative;left:20px;width: 40px" name="IDspan" ></span>
							</div>
						</li>
					<li class="clearfix">
						<div class="fr">
							<div style=" float:left; margin-right:10px; margin-top: 4px;">保存配置：<input class="artificial_radio" name="isSaveConfig" value="0" type="radio" onclick="$('#rgConfigName').show()">是<input class="artificial_radio" type="radio" name="isSaveConfig" value="1" checked onclick="$('#rgConfigName').hide()">否</div>
							<div style=" float:left; margin-right:10px;display: none;margin-top: 4px;" id="rgConfigName">配置名称：<input class="default_input" style="padding: 1px 8px;" type="text" name="configName" id="configName"></div>
							<div style=" float:left;"><input class="submit2" type="button" onclick="gkgRGQuery()" value="提交"></div>
						</div>
					</li>
					</ul>
					</form>
				</div>
			</div> --%>
			
			
			
		<jsp:include page="graph_tab2.jsp"></jsp:include>
	</div>
		<jsp:include page="../updateUserPassword.jsp"/>
		<!-- 页面底部收缩结束 -->
</body>


<!-- 人工查询功能的日期 -->
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/base.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-select.min.js"></script>
<script src="<%=basePath %>/static/js/jquery.combo.select.js"></script>
<script src="<%=basePath %>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath %>/static/js/perfect-scrollbar.js"></script>
<script src="<%=basePath%>/static/js/sec2.js"></script>
<script src="<%=basePath%>/static/lib/jquery.pagination.js"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/amcharts.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/themes/light.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amchart_util.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/ammap.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/ammap_util.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/export/export.js" type="text/javascript"></script>    
       
<script src="<%=basePath%>/static/Visualization/js/amcharts/serial.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/pie.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/radar.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/worldLow.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
<c:if test="${bgFlag == null or bgFlag == 1}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
</c:if>
<!-- 计算显示图的高度 -->	
<script src="<%=basePath%>/static/js/chartHeight.js" type="text/javascript"></script>
<!-- 人工查询js -->
<script src="<%=basePath %>/static/Visualization/rgQuery.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/downLoad.js"></script>
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<script type="text/javascript">
	$(function(){
		/* //美化图表展示界面的右侧滚动条
		index_bottom_perfectScrollbar(); */
		//处理配置
		handleConfigs();
		//控制Tone字段的显示问题
		gkgToneIsShow();
		//美化滚动条
		glorifyComboSelect();
		//提示开始和结束时间赋值
		$("#edDateSpan").html('${maxDate[2] }');
		$("#stDateSpan").html('${minDate[2] }');
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
	});
	
	function render(configId){
		startLoad();
		$.ajax({
				url:'<%=basePath%>/search/graph_geo_net_viz/'+configId,
				type: 'POST',
				dataType:"json",
			success:function(data){
				if(data == "-1"){
					endLoad();
					win.alertEx("获取结果信息数据失败");
				}
				renderData(data);
				endLoad();
			}
		});
        
	}
	function renderData(data){
		var  country_data=data.country_dic; 
		var  city_data=data.city_dic;
	if(country_data.length>0){
			$("#selectCountryLX2").show();
			$("#selectCountryLX2").html(""); 
	        var countryLX2Num = country_data.length > 20 ? 20:country_data.length;
	        /* if(countryLX2Num==1){
				document.getElementById("selectCountryLX2").options.add(new Option("1","1"));
			} */
	        for(var i=5;i<=countryLX2Num;i+=5){
	        	document.getElementById("selectCountryLX2").options.add(new Option(i,i));
	        }
	        var CountryLX2OptionCount = $("#selectCountryLX2 option").map(function(){return $(this).val();}).get().join(", ");
			if(CountryLX2OptionCount.indexOf(10)!=-1){
				$("#selectCountryLX2 option[value='10']").attr("selected",true);
				process_dic_to_amchart2(country_data,'column_chart','column_chart',10);
			}else{
				$("#selectCountryLX2").hide();
				process_dic_to_amchart2(country_data,'column_chart','column_chart',countryLX2Num);
			}
	        
	        $("#selectCountryLX2").change(function () {
	        	var changeValue = $("#selectCountryLX2 option:selected").val();
        		process_dic_to_amchart2(country_data,'column_chart','column_chart',changeValue);
	        	
	        });
		}else{
			$("#selectCountryLX2").hide();
			$("#column_chart").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
		}
		if(country_data.length>0){
			$("#selectCountryLX1").show();
	        $("#selectCountryLX1").html(""); 
	        var countryLX1Num = country_data.length > 20? 20:country_data.length;
	        /* if(countryLX1Num==1){
				document.getElementById("selectCountryLX1").options.add(new Option("1","1"));
			} */
	        for(var i=3;i<=countryLX1Num;i+=3){
	        	document.getElementById("selectCountryLX1").options.add(new Option(i,i));
	        }
	        var CountryLX1OptionCount = $("#selectCountryLX1 option").map(function(){return $(this).val();}).get().join(", ");
			if(CountryLX1OptionCount.indexOf(6)!=-1){
				$("#selectCountryLX1 option[value='6']").attr("selected",true);
				int_rander_chart3(country_data,'radar_chart',6);
			}else{
				$("#selectCountryLX1").hide();
				int_rander_chart3(country_data,'radar_chart',countryLX1Num);
			}
			
	        $("#selectCountryLX1").change(function () {
	        	var changeValue = $("#selectCountryLX1 option:selected").val();
	        	int_rander_chart3(country_data,'radar_chart',changeValue);
	        });
		}else{
			$("#selectCountryLX1").hide();
			$("#radar_chart").html('<img alt="" class="tubiao2"  src="<%=basePath %>/static/images/tubiao2.png">');
		}
		if(city_data.length>0){
			$("#selectCityLX").show();
	        $("#selectCityLX").html(""); 
	        var cityLXNum = city_data.length > 20 ? 20:city_data.length;
	        /* if(cityLXNum==1){
				document.getElementById("selectCityLX").options.add(new Option("1","1"));
			} */
	        for(var i=2;i<=cityLXNum;i+=2){
	        	document.getElementById("selectCityLX").options.add(new Option(i,i));
	        }
	        var CityLXOptionCount = $("#selectCityLX option").map(function(){return $(this).val();}).get().join(", ");
			if(CityLXOptionCount.indexOf(8)!=-1){
				$("#selectCityLX option[value='8']").attr("selected",true);
				process_dic_to_amchart(city_data,'pie_chart','pie_chart',8);
			}else{
				$("#selectCityLX").hide();
				process_dic_to_amchart(city_data,'pie_chart','pie_chart',cityLXNum);
			}
	        
	        $("#selectCityLX").change(function () {
	        	var changeValue = $("#selectCityLX option:selected").val();
	        		process_dic_to_amchart(city_data,'pie_chart','pie_chart',changeValue);
	        	
	        });
	        process_dic_to_linemap(city_data,'line_map');
		}else{
			$("#line_map").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
			$("#selectCityLX").hide();
			$("#pie_chart").html('<img alt="" class="tubiao2"  src="<%=basePath %>/static/images/tubiao2.png">');
		}
        
	}
    </script>
</html>