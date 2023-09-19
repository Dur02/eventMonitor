<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	String basePath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>首页</title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/style.css">
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window.css"/><!-- 弹出提示框样式 -->
<!-- 两种皮肤切换 -->
<c:if test="${bgFlag == null or bgFlag == 1}">
	<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css"/>
	<link rel="stylesheet" href="<%=basePath %>/static/css/hsCheckData.css"/>
	<link rel="stylesheet" href="<%=basePath %>/static/css/sec2.css">
</c:if>
<c:if test="${bgFlag == 2}">
	<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.min.css"/>
	<link rel="stylesheet" href="<%=basePath %>/static/css/sec2_2.css">
	<link rel="stylesheet" href="<%=basePath %>/static/css/hsCheckData2.css"/>
</c:if>
<style>
	.time_selec_box{
		position:absolute;
		top:38px;
		right:0px;
	}
	.time_selec{
		width:300px;
		height:150px;
		background:rgba(0,0,0,0.5);
		color:#fff;
		padding-top:10px;
		display:none;
	}
	.time_span_box{
		padding-left:60px;
		border-bottom:1px solid #ececec;
	}
	.time_span{
		display:inline-block;
		width:73px;
		height:25px;
		text-align:center;
		line-height:25px;
		cursor:pointer;
		margin-bottom:10px;
	}
	.time_span_act{
		background:#88bff0;
		border-radius:3px;
	}
	.time_inp_box{
		padding-left:20px;
		margin-top:10px;
	}
	.selec_time_inp{
		padding: 0px 8px;
	    margin: 0px 4px;
	    height: 20px;
	    line-height: 20px;
	    background: url(../static/images/inp_bg.png) repeat-x;
	    border: 1px solid #49567a;
	    border-radius: 1px;
	    color: #fff;
	}
	.sec_box{
		text-align:center;
	}
	.sec_box span{
		width:74px;
		height:24px;
		display:inline-block;
		text-align:center;
		line-height:24px;
		cursor:pointer;
		background:#287fcb;
		border-radius:3px;
		margin-top:10px;
	}
	.bottom_left{
		width:144px;
		position:absolute;
		bottom:200px;
		left:0px;
		background:rgba(0,0,0,0.5);
		color:#fff;
	}
	.one_ul{
		border-bottom:1px solid #373636;
	}
	.one_ul a{
		position:relative;
		line-height:24px;
		cursor:pointer;
		padding:0px 10px;
		display:inline-block;
		width:124px;
		border:1px solid #373636;
		border-bottom:none;
	}
	.one_ul a.act{
		background:#287fcb;
	}
	.two_ul{
		display:none;
		width:240px;
		position:absolute;
		top:0px;
		left:144px;
		background:rgba(0,0,0,0.1);
		color:#fff;
		white-space:nowrap;
	}
	.two_ul li{
		padding:0px 5px;
	}
	.two_ul li.act{
		background:#eeeeee;
		color:#000;
	}
	
	.bottom_right{
		position:absolute;
		right:10px;
		bottom:10px;
	}
	.to_show{
		width:20px;
		padding:10px 7px;
		position:absolute;
		left:-34px;
		top:0px;
		background:#006ae2;
		border-radius:3px;
		color:#fff;
		cursor:pointer;
	}
	.to_show_img{
		width:5px;
		height:8px;
		display:inline-block;
		background:url(../static//images/to_show_img.png) no-repeat;
		margin-left:5px;
	}
	.to_hide_img{
		width:5px;
		height:8px;
		display:inline-block;
		background:url(../static//images/to_hide_img.png) no-repeat;
		margin-left:5px;
	}
	.tab_ul li.active{
		top:0px;
	}
	.artificial_radio {
	    margin-bottom: 0px!important;
	}
</style>
</head>
<body>
	<div class="shy_top">
		<input type="hidden" id="moduleCode" value="${moduleCode}"/>
		<h3 class="fl title" style="line-height:12px;">首页</h3>
		<ul class="chart_change">
			<li id="country" onclick="loadData('country')">国家</li>
			<li id="province" onclick="loadData('province')">州省</li>
		</ul>
	</div>
	<div class="index_bottom" style="padding:0px;padding-top:38px; margin-top:0px;">
		<div style="height:97%; width:100%;" id="mapDiv">
		</div>
	</div>
	<div class="tab">
	<div class="change_box">
		<span class="ul_xl" id="ddd"></span>
		<span class="prev_btn none"></span>
		<span class="next_btn none"></span>
		<div class="tab_ul_box">
			<ul id="tab_ul" style="top:2px;" class="tab_ul clearfix">
				<!-- 实时查询 -->
				<c:forEach items="${typeList }" var = "t" varStatus="indx">
					<c:if test="${indx.index eq 0 }">
						<li id="${t.configId}" onclick="render(${t.configId});" class="active mgl-30">${t.configName }</li>
					</c:if>
					<c:if test="${indx.index ne 0 }">
						<li class="" id="${t.configId}" onclick="render(${t.configId});" class="">${t.configName }</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
		<c:if test="${sessionScope.LOGINUSER.roleId  != 3 }">
			<p class="manual">即时查询</p>
		</c:if>
	</div>
	<div class="tab_div">
		<c:if test="${typeList.size()>0 }">
			<input type="hidden" id="PZLength" value="${typeList.size()}"/>
		</c:if>
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
		                                 <label class='lab2' for=''><input class='inp_selc'  name='edDates' type='text' readonly value='${tt.edDate}' /></label>
		                             </div>
		                        </div>
		                     </div>
			       		 </c:forEach>
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
								</div>
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
							</div>
						</div>
					</li>
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
<script src="<%=basePath%>/static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/dep/esl.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/dep/text.js"></script>
<c:if test="${bgFlag == null or bgFlag == 1}">
	<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
	<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
</c:if>
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
<script src="<%=basePath%>/static/js/sec2.js"></script>
<script src="<%=basePath%>/static/js/config/config.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/hsCheckData.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/config/newShowConfig.js"></script>
<!-- 人工查询js -->
<script src="<%=basePath %>/static/Visualization/rgQuery.js"></script>
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<script>
/*******************map******************/
	require.config({
		packages: [{
	       name: 'echarts-x',
	       location: '<%=basePath %>/static/js/dep/echarts-x/src',
	       main: 'echarts-x'
	   }, {
	       name: 'echarts',
	       location: '<%=basePath %>/static/js/dep/echarts/src',
	       main: 'echarts'
	   },{
	       name: 'zrender',
	       location: '<%=basePath %>/static/js/dep/zrender/src',
	       main: 'zrender'
	   }, {
	       name: 'qtek',
	       location: '<%=basePath %>/static/js/dep/qtek/src',
	              main: 'qtek.amd'
	          }]
	});
	$(function (){
		//默人第一个点击
		handleConfigs();
		//下拉框多选
		quadClass = ${quadClass};
		rootEvent = ${rootEvent};
		baseEvent = ${baseEvent};
		eventCode = ${eventCode};
		getSelectComEventType()
		//多选框回显截取
		var ll = $("#PZLength").val();
		updateConfigNew(ll);
		var bodyH = $(window).height();
		$(".index_bottom").height(bodyH - 38 );
		//起止时间
		$("#edDateSpan").html('${maxDate[2] }');
		$("#stDateSpan").html('${minDate[2] }');
		// 选择年月日
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
	})
	
	 //加载配置对应的数据
	 function render(configId){
		 startLoad();
		 $.ajax({
				url:'<%=basePath%>/search/home2/'+configId,
				type: 'post',
				dataType:"json",
				success:function(data){
					if(data == "-1"){
						endLoad();
						alert("获取结果信息数据失败");
					}
					renderData(data);
					endLoad();
			    },
			    error:function(){
			    	endLoad();
			    }
		});
	 }
	
	//事件类型下拉框多选 
	function getSelectComEventType(){
		//大类
		$('#quadClass').hsCheckData({
			isShowCheckBox: true,
			data: quadClass
		});
		//根类
		$('#rootEvent').hsCheckData({
			isShowCheckBox: true,
			data: rootEvent
		});
		//基类
		$('#baseEvent').hsCheckData({
			isShowCheckBox: true,
			data: baseEvent
		});
		//全事件
		$('#eventCode').hsCheckData({
			isShowCheckBox: true,
			data: eventCode
		});
	}
	function renderData(data){
		$("#country").removeClass();
		$("#province").removeClass();
		countryData = data.countryData;
		provinceData = data.provinceData;
		maxArray = data.maxCountryProvince;//最大值
		minArray = data.minCountryProvince;//最大值
		$("#country").click();
	}
	//点击国家、州省
	function loadData(geoType){
		var data;
		var max;
		var min;
		//判断皮肤
		//根据皮肤设置背景色
		 if(${bgFlag} == 1){
			 var bejingseImage ="beijingse.png";
			 textColor = "white";
		 }else if(${bgFlag} == 2){
			 var bejingseImage ="beijingse4.png";
			 textColor = "black";
		 }
		//控制国家、州省
		if(geoType == 'country'){
			if($("#country").hasClass("act")){//重复点击
				return false;
			}
			$("#country").addClass("act");
			$("#province").removeClass("act");
			data = countryData;
			max = maxArray[0];
			min = minArray[0];
		}else{
			if($("#province").hasClass("act")){//重复点击
				return false;
			}
			$("#country").removeClass("act");
			$("#province").addClass("act");
			data = provinceData;
			max = maxArray[1];
			min = minArray[1];
		}
		var showFlag = true;
		if(min == 0 && max == 0){
			showFlag = false;
		}
		//地球仪
		require([
			'echarts',
			'echarts-x',
			'echarts/chart/map',
			'echarts-x/chart/map3d'
	         ],function(ec){
			myChart = ec.init(document.getElementById('mapDiv'));
	        var option =  {
	            dataRange: {
	            	show: showFlag,
	                min: min,
	                max: max,
	                text:['高','低'],
	                textStyle:{color: textColor},
	                realtime: false,
	                calculable : true,
	                color: ['red','yellow','lightskyblue']
	            },
	            series: [{
	                name: '',
	                type: 'map3d',
	                mapType: 'world',
	                hoverable: false,
	                background:'<%=basePath %>/static/images/'+bejingseImage,
	                baseLayer: {
	                    backgroundImage: '<%=basePath %>/static/js/dep/echarts-x/doc/example/asset/earth.jpg',
	                    quality: 'high'
	                },
	                itemStyle: {
	                    normal: {
	                        label: {
	                            show: true//控制地球仪显示国家名称
	                        },
	                        borderWidth: 1,
	                        borderColor: 'yellow',
	                        areaStyle: {
	                            color: 'rgba(0, 0, 0, 0)'
	                        }
	                    }
	                },
	                markPoint: {
	                    large: true,
	                    effect: {
	                        show: true,
	                        shadowBlur: 0.4
	                    },
	                    data: data
	                }
	            }]
	        };
	        myChart.setOption(option);
			
			//调节echarts图表自适应
		     window.onresize=function (){
		     	myChart.resize();
		     }
		})
	}
</script>
<jsp:include page="../updateUserPassword.jsp"></jsp:include>
</body>
</html>