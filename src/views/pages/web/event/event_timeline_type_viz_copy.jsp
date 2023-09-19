<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>类型时间演化</title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/style.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath%>/static/lib/pagination.css" />
<!--人工查询 -->
<link rel="stylesheet" href="<%=basePath%>/static/css/combo.select.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/perfect-scrollbar.css" />
<link rel="shortcut icon" type="image/x-icon" href="<%=basePath%>/static/Visualization/base/ico.png" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/base.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/css/event_result.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/js/amcharts/export/export.css"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/leaflet.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/dvf.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/example.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/leaflet/ui.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/situationalmap.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/export.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window_zs.css"/><!-- 弹出提示框样式 -->
<script src="<%=basePath%>/static/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>/static/lib/jquery.pagination.js"></script>
<script src="<%=basePath%>/static/js/config/config.js"></script>
<!-- 两种皮肤切换 -->
<c:if test="${bgFlag == null or bgFlag == 1}">
	<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css"/>
	<link rel="stylesheet" href="<%=basePath %>/static/css/sec2.css">
	<link rel="stylesheet" href="<%=basePath %>/static/css/hsCheckData.css"/>
	<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
	<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.min.css"/>
	<link rel="stylesheet" href="<%=basePath %>/static/css/sec2_2.css">
	<link rel="stylesheet" href="<%=basePath %>/static/css/hsCheckData2.css"/>
	<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
</c:if>
</head>
<body>
	<div class="index_top clearfix">
		<h3 class="fl title">事件库分析 > 类型时间演化</h3>
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
		<div class="data show">
			<div class="row">
			<input type="hidden" id="moduleCode" value="${moduleCode}">
	            <div class="col-md-12">
	                <div class="col-md-12 bor" style="margin-top: 16px; height: 482px;">
	               	<h3 class="tx-c">根类时间演化展示 
	               		<div  class="help" onmouseenter="showChartInfo(1,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
	               	</h3>
	            	<input type="text" id="date" style="width: 115px;  height: 22px;  position: absolute;  top: 40px;  left: 0;  right: 0;  margin: auto;  text-align: center;">
	                    <div class="col-md-7">
	                        <div id="eventroot_graph" style="height: 400px; margin-top:20px;">
	                        </div>
	                    </div>
	                    <div class="col-md-5">	
	                        <div class="row" style="margin-top:-34px!important">
	                        	<div id="btn-group" class="btn-group fr" style="width:110px; margin-left:20px;">
                                     <input type="button" class="borcolor btn" id="style_start" onclick="styleStart()" value="开始">
                                     <input type="button" class="borcolor btn" id="style_stop" value="停止">
                                </div>
	                        	<input class="fr" type="text" id="four_date_range" readonly style="width:240px;text-align:center; line-height:35px;">
	                        </div>
		                    <div style="border-top:1px solid #d6d6d6; border-left:1px solid #d6d6d6; margin-top:31px; margin-left: -50px; border-radius:3px;">
		                        <div class="row row_b_b">
	                                <div class="col-md-3 key" id= "gksm"></div>
	                                <div class="col-md-3 val" id="eventroot_1"></div>
	                                <div class="col-md-3 key" id= "shangsu"></div>
	                                <div class="col-md-3 val" id="eventroot_2"></div>
	                            </div>
		                        <div class="row row_b_b">
		                        	 <div class="col-md-3 key" id= "hzyx"></div>
                                	 <div class="col-md-3 val" id="eventroot_3"></div>
	                                 <div class="col-md-3 key" id= "zixun"></div>
	                                 <div class="col-md-3 val" id="eventroot_4"></div>
		                        </div>
		                        <div class="row row_b_b">
		                       		 <div class="col-md-3 key" id= "wjhz"></div>
                                	 <div class="col-md-3 val" id="eventroot_5"></div>
	                                 <div class="col-md-3 key" id= "wzhz"></div>
	                                 <div class="col-md-3 val" id="eventroot_6"></div>
		                        </div>
		                        <div class="row row_b_b">
		                        	<div class="col-md-3 key" id= "tgyz"></div>
                                	 <div class="col-md-3 val" id="eventroot_7"></div>
	                                 <div class="col-md-3 key" id= "touxiang"></div>
	                                 <div class="col-md-3 val" id="eventroot_8"></div>
		                            <!-- <div class="col-md-6">
		                                <div class="col-md-8 talign_r"><span id= "tgyz"></span></div>
		                                <div class="col-md-4">
		                                    <input type="text" id="eventroot_7" style="width:60px; border: 0px;">
		                                </div>
		                            </div>
		                            <div class="col-md-6">
		                                <div class="col-md-8 talign_r"><span id= "touxiang"></span></div>
		                                <div class="col-md-4">
		                                    <input type="text" id="eventroot_8" style="width:60px; border: 0px;">
		                                </div>
		                            </div> -->
		                        </div>
		                        <div class="row row_b_b">
		                        	<div class="col-md-3 key" id= "yanjiu"></div>
                                	 <div class="col-md-3 val" id="eventroot_9"></div>
	                                 <div class="col-md-3 key" id= "xuqiu"></div>
	                                 <div class="col-md-3 val" id="eventroot_10"></div>
		                            <!-- <div class="col-md-6">
		                                <div class="col-md-8 talign_r"><span id= "yanjiu"></span></div>
		                                <div class="col-md-4">
		                                    <input type="text" id="eventroot_9" style="width:60px; border: 0px;">
		                                </div>
		                            </div>
		                            <div class="col-md-6">
		                                <div class="col-md-8 talign_r"><span id= "xuqiu"></span></div>
		                                <div class="col-md-4">
		                                    <input type="text" id="eventroot_10" style="width:60px; border: 0px;">
		                                </div>
		                            </div> -->
		                        </div>
		                        <div class="row row_b_b">
		                        	<div class="col-md-3 key" id= "fandui"></div>
                                	 <div class="col-md-3 val" id="eventroot_11"></div>
	                                 <div class="col-md-3 key" id= "jujue"></div>
	                                 <div class="col-md-3 val" id="eventroot_12"></div>
		                            <!-- <div class="col-md-6">
		                                <div class="col-md-8 talign_r"><span id= "fandui"></span></div>
		                                <div class="col-md-4">
		                                    <input type="text" id="eventroot_11" style="width:60px; border: 0px;">
		                                </div>
		                            </div>
		                            <div class="col-md-6">
		                                <div class="col-md-8 talign_r"><span id= "jujue"></span></div>
		                                <div class="col-md-4">
		                                    <input type="text" id="eventroot_12" style="width:60px; border: 0px;">
		                                </div>
		                            </div> -->
		                        </div>
		                        <div class="row row_b_b">
		                        	<div class="col-md-3 key" id= "weixie"></div>
                                	 <div class="col-md-3 val" id="eventroot_13"></div>
	                                 <div class="col-md-3 key" id= "kangyi"></div>
	                                 <div class="col-md-3 val" id="eventroot_14"></div>
		                             <!-- <div class="col-md-6">
		                                <div class="col-md-8 talign_r"><span id= "weixie"></span></div>
		                                <div class="col-md-4">
		                                    <input type="text" id="eventroot_13" style="width:60px; border: 0px;">
		                                </div>
		                            </div>
		                            <div class="col-md-6">
		                                <div class="col-md-8 talign_r"><span id= "kangyi"></span></div>
		                                <div class="col-md-4">
		                                    <input type="text" id="eventroot_14" style="width:60px; border: 0px;">
		                                </div>
		                            </div> -->
		                        </div>
		                        <div class="row row_b_b">
		                        	<div class="col-md-3 key" id= "libs"></div>
                                	 <div class="col-md-3 val" id="eventroot_15"></div>
	                                 <div class="col-md-3 key" id= "jslx"></div>
	                                 <div class="col-md-3 val" id="eventroot_16"></div>
		                            <!-- <div class="col-md-6">
		                                <div class="col-md-8 talign_r"><span id= "libs"></span></div>
		                                <div class="col-md-4">
		                                    <input type="text" id="eventroot_15" style="width:60px; border: 0px;">
		                                </div>
		                            </div>
		                            <div class="col-md-6">
		                                <div class="col-md-8 talign_r"><span id= "jslx"></span></div>
		                                <div class="col-md-4">
		                                    <input type="text" id="eventroot_16" style="width:60px; border: 0px;">
		                                </div>
		                            </div> -->
		                        </div>
		                        <div class="row row_b_b">
		                        	<div class="col-md-3 key" id= "qiangpo"></div>
                                	 <div class="col-md-3 val" id="eventroot_17"></div>
	                                 <div class="col-md-3 key" id= "tuji"></div>
	                                 <div class="col-md-3 val" id="eventroot_18"></div>
		                            <!-- <div class="col-md-6">
		                                <div class="col-md-8 talign_r"><span id= "qiangpo"></span></div>
		                                <div class="col-md-4">
		                                    <input type="text" id="eventroot_17" style="width:60px; border: 0px;">
		                                </div>
		                            </div>
		                            <div class="col-md-6">
		                                <div class="col-md-8 talign_r"><span id= "tuji"></span></div>
		                                <div class="col-md-4">
		                                    <input type="text" id="eventroot_18" style="width:60px; border: 0px;">
		                                </div>
		                            </div> -->
		                        </div>
		                        <div class="row row_b_b">
		                        	<div class="col-md-3 key" id= "zhandou"></div>
                                	 <div class="col-md-3 val" id="eventroot_19"></div>
	                                 <div class="col-md-3 key" id= "dgmbl"></div>
	                                 <div class="col-md-3 val" id="eventroot_20"></div>
		                            <!-- <div class="col-md-6">
		                                <div class="col-md-8 talign_r"><span id= "zhandou"></span></div>
		                                <div class="col-md-4">
		                                    <input type="text" id="eventroot_19" style="width:60px; border: 0px;">
		                                </div>
		                            </div>
		                            <div class="col-md-6">
		                                <div class="col-md-8 talign_r"><span id= "dgmbl"></span></div>
		                                <div class="col-md-4">
		                                    <input type="text" id="eventroot_20" style="width:60px; border: 0px;">
		                                </div>
		                            </div> -->
		                        </div>
		                    </div>
	                    </div>
	                </div>
	            </div>
        		<div class="col-md-12 mg_t mg_b">
	                <div class="col-md-12 bor">
	                	<div class="col-md-12">
	                		<h3 class="tx-c">大类时间线展示
	                			<div  class="help" onmouseenter="showChartInfo(2,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
	                		</h3>
	                    </div>
	                    <div id="quadclass_graph" class="oneColumChart" style="margin-top:20px;"></div>
	                </div>
	            </div>
        	</div>
		</div>
		<jsp:include page="event_tab1.jsp"></jsp:include>
		</div>
	<jsp:include page="../updateUserPassword.jsp"/>
</body>
<!-- 人工查询日期 -->
<script src="<%=basePath%>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath%>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath%>/static/js/bootstrap-select.min.js"></script>
<script src="<%=basePath%>/static/js/jquery.combo.select.js"></script>
<script src="<%=basePath%>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath%>/static/js/perfect-scrollbar.js"></script>
<script src="<%=basePath%>/static/js/sec2.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/base.js"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/amcharts.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/themes/light.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amchart_util.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/ammap.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/ammap_util.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/export/export.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/echarts.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
<c:if test="${bgFlag == null or bgFlag == 1}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
</c:if>
<!-- 人工查询js -->
<script src="<%=basePath %>/static/Visualization/rgQuery.js"></script>
<!-- 计算显示图的高度 -->	
<script src="<%=basePath%>/static/js/chartHeight.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<script type="text/javascript">
        $(function(){
        	/* //美化图表展示界面的右侧滚动条
    		index_bottom_perfectScrollbar(); */
        	//处理配置
    		handleConfigs();
    		//美化滚动条
    		glorifyComboSelect();
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
        var timeArray = [];
        var date_data;
        var len;
        //事件类型渲染图表
        function render(configId){
        	startLoad();
			$.ajax({
				url:'<%=basePath%>/search/event_timeline_type_viz/'+configId,
				type: 'POST',
				dataType:"json",
				async:false,
				success:function(data){
					if(data=="-1"){
						endLoad();
						alert("加载失败");
					}
					renderData(data);
					endLoad();
				}
		});
        }
        function renderData(data){
        	var showstr,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20;
        	for(var i=0;i<timeArray.length;i++){
				clearInterval(timeArray[i]);
			}
        	//演化按钮的样式
        	if($("#style_start").hasClass("act")){
        		$("#style_start").removeClass("act");
        	}
			date_data =data.date_data;
            quadclass_data = data.quadclass_data;
            eventroot_data = data.eventroot_data;
            maxrootvalue = data.maxrootvalue;
            sjbmname = data.name;
            $('#gksm').html(sjbmname[4].substring(sjbmname[4].indexOf("(") + 1,sjbmname[4].indexOf(")")));
            $('#shangsu').html(sjbmname[5].substring(sjbmname[5].indexOf("(") + 1,sjbmname[5].indexOf(")")));
            $('#hzyx').html(sjbmname[6].substring(sjbmname[6].indexOf("(") + 1,sjbmname[6].indexOf(")")));
            $('#zixun').html(sjbmname[7].substring(sjbmname[7].indexOf("(") + 1,sjbmname[7].indexOf(")")));
            $('#wjhz').html(sjbmname[8].substring(sjbmname[8].indexOf("(") + 1,sjbmname[8].indexOf(")")));
            $('#wzhz').html(sjbmname[9].substring(sjbmname[9].indexOf("(") + 1,sjbmname[9].indexOf(")")));
            $('#tgyz').html(sjbmname[10].substring(sjbmname[10].indexOf("(") + 1,sjbmname[10].indexOf(")")));
            $('#touxiang').html(sjbmname[11].substring(sjbmname[11].indexOf("(") + 1,sjbmname[11].indexOf(")")));
            $('#yanjiu').html(sjbmname[12].substring(sjbmname[12].indexOf("(") + 1,sjbmname[12].indexOf(")")));
            $('#xuqiu').html(sjbmname[13].substring(sjbmname[13].indexOf("(") + 1,sjbmname[13].indexOf(")")));
            $('#fandui').html(sjbmname[14].substring(sjbmname[14].indexOf("(") + 1,sjbmname[14].indexOf(")")));
            $('#jujue').html(sjbmname[15].substring(sjbmname[15].indexOf("(") + 1,sjbmname[15].indexOf(")")));
            $('#weixie').html(sjbmname[16].substring(sjbmname[16].indexOf("(") + 1,sjbmname[16].indexOf(")")));
            $('#kangyi').html(sjbmname[17].substring(sjbmname[17].indexOf("(") + 1,sjbmname[17].indexOf(")")));
            $('#libs').html(sjbmname[18].substring(sjbmname[18].indexOf("(") + 1,sjbmname[18].indexOf(")")));
            $('#jslx').html(sjbmname[19].substring(sjbmname[19].indexOf("(") + 1,sjbmname[19].indexOf(")")));
            $('#qiangpo').html(sjbmname[20].substring(sjbmname[20].indexOf("(") + 1,sjbmname[20].indexOf(")")));
            $('#tuji').html(sjbmname[21].substring(sjbmname[21].indexOf("(") + 1,sjbmname[21].indexOf(")")));
            $('#zhandou').html(sjbmname[22].substring(sjbmname[22].indexOf("(") + 1,sjbmname[22].indexOf(")")));
            $('#dgmbl').html(sjbmname[23].substring(sjbmname[23].indexOf("(") + 1,sjbmname[23].indexOf(")")));
            var date = date_data[0];
            if(!date==""||!date==null||!date==undefined){
            	$('#style_start').attr("disabled",false);
            	if(date.length==8){
            		$("#date").val(date.slice(0,4)+"年"+date.slice(4,6)+"月"+date.slice(6,8)+"日");
            	}else if(date.length==6){
            		$("#date").val(date.slice(0,4)+"年"+date.slice(4,6)+"月");
            	}else{
            		$("#date").val(date.slice(0,4)+"年");
            	}
			}else{
				$('#style_start').attr("disabled",true);
				$("#date").val("");
			}
            for(var k=1;k<=20;k++){
                $("#eventroot_"+(k).toString()).html(getDataByDate(date,eventroot_data)[k-1]);
                if(k==1){
                	a1 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==2){
                	a2 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==3){
                	a3 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==4){
                	a4 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==5){
                	a5 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==6){
                	a6 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==7){
                	a7 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==8){
                	a8 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==9){
                	a9 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==10){
                	a10 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==11){
                	a11 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==12){
                	a12 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==13){
                	a13 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==14){
                	a14 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==15){
                	a15 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==16){
                	a16 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==17){
                	a17 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==18){
                	a18 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==19){
                	a19 = getDataByDate(date,eventroot_data)[k-1];
                }else if(k==20){
                	a20 = getDataByDate(date,eventroot_data)[k-1];
                }
            }
            showstr = "MAKE PUBLIC STATEMENT(公开声明):" + a1 
			+ "<br />APPEAL(上诉):" + a2
			+ "<br />EXPRESS INTENT TO COOPERATE(表示合作意向):" + a3
			+ "<br />CONSULT(咨询):" + a4
			+ "<br />ENGAGE IN DIPLOMATIC COOPERATION(从事外交合作):" + a5
			+ "<br />ENGAGE IN MATERIAL COOPERATION(从事物质合作):" + a6
			+ "<br />PROVIDE AID(提供援助):" + a7
			+ "<br />YIELD(投降):" + a8
			+ "<br />INVESTIGATE(研究):" + a9
			+ "<br />DEMAND(需求):" + a10
			+ "<br />DISAPPROVE(反对):" + a11
			+ "<br />REJECT(拒绝):" + a12
			+ "<br />THREATEN(威胁):" + a13
			+ "<br />PROTEST(抗议):" + a14
			+ "<br />EXHIBIT FORCE POSTURE(展示力量部署):" + a15
			+ "<br />REDUCE RELATIONS(减少联系):" + a16
			+ "<br />COERCE(强迫):" + a17
			+ "<br />ASSAULT(突击):" + a18
			+ "<br />FIGHT(战斗):" + a19
			+ "<br />USE UNCONVENTIONAL MASS VIOLENCE(非常规大规模暴力):" + a20;
            var data_chart = echarts.init(document.getElementById('eventroot_graph'));
            var data_option = {
                tooltip: {
                	confine:'true',
                	position:[70, 20],
                },
                radar: {
                    indicator: [
                    			{ name: sjbmname[4].substring(sjbmname[4].indexOf("(") + 1,sjbmname[4].indexOf(")")), max: maxrootvalue[0]},
                                { name: sjbmname[5].substring(sjbmname[5].indexOf("(") + 1,sjbmname[5].indexOf(")")), max: maxrootvalue[0]},
                                { name: sjbmname[6].substring(sjbmname[6].indexOf("(") + 1,sjbmname[6].indexOf(")")), max: maxrootvalue[0]},
                                { name: sjbmname[7].substring(sjbmname[7].indexOf("(") + 1,sjbmname[7].indexOf(")")), max: maxrootvalue[0]},
                                { name: sjbmname[8].substring(sjbmname[8].indexOf("(") + 1,sjbmname[8].indexOf(")")), max: maxrootvalue[0]},
                                { name: sjbmname[9].substring(sjbmname[9].indexOf("(") + 1,sjbmname[9].indexOf(")")), max: maxrootvalue[0]},
                                { name: sjbmname[10].substring(sjbmname[10].indexOf("(") + 1,sjbmname[10].indexOf(")")), max: maxrootvalue[0]},
                                { name: sjbmname[11].substring(sjbmname[11].indexOf("(") + 1,sjbmname[11].indexOf(")")), max: maxrootvalue[0]},
                                { name: sjbmname[12].substring(sjbmname[12].indexOf("(") + 1,sjbmname[12].indexOf(")")), max: maxrootvalue[0]},
                                { name: sjbmname[13].substring(sjbmname[13].indexOf("(") + 1,sjbmname[13].indexOf(")")), max: maxrootvalue[0]},
                                { name: sjbmname[14].substring(sjbmname[14].indexOf("(") + 1,sjbmname[14].indexOf(")")), max: maxrootvalue[0]},
                                { name: sjbmname[15].substring(sjbmname[15].indexOf("(") + 1,sjbmname[15].indexOf(")")), max: maxrootvalue[0]},
                                { name: sjbmname[16].substring(sjbmname[16].indexOf("(") + 1,sjbmname[16].indexOf(")")), max: maxrootvalue[0]},
                                { name: sjbmname[17].substring(sjbmname[17].indexOf("(") + 1,sjbmname[17].indexOf(")")), max: maxrootvalue[0]},
                                { name: sjbmname[18].substring(sjbmname[18].indexOf("(") + 1,sjbmname[18].indexOf(")")), max: maxrootvalue[0]},
                                { name: sjbmname[19].substring(sjbmname[19].indexOf("(") + 1,sjbmname[19].indexOf(")")), max: maxrootvalue[0]},
                                { name: sjbmname[20].substring(sjbmname[20].indexOf("(") + 1,sjbmname[20].indexOf(")")), max: maxrootvalue[0]},
                                { name: sjbmname[21].substring(sjbmname[21].indexOf("(") + 1,sjbmname[21].indexOf(")")), max: maxrootvalue[0]},
                                { name: sjbmname[22].substring(sjbmname[22].indexOf("(") + 1,sjbmname[22].indexOf(")")), max: maxrootvalue[0]},
                                { name: sjbmname[23].substring(sjbmname[23].indexOf("(") + 1,sjbmname[23].indexOf(")")), max: maxrootvalue[0]}
                    			]
                },
                name: {
                    textStyle: {
                      color: '#5B5B5B'
                    }
                },
                series: [{
                    name: '基类数据',
                    type: 'radar',
                    tooltip: {
                        trigger: 'item',
                        formatter: showstr
                    },
                    data : [
                        {
                            value : getDataByDate(date,eventroot_data),
                            name : '基类数据'
                        }
                    ]
                }]
            };
            data_chart.setOption(data_option);
            len = date_data.length;
            var pos = 1;
            var endtime;
            var timeDataPlay;
            var starttime = date_data[0];
            var endtime = date_data[len-1];
            if(!starttime==""||!starttime==null||!starttime==undefined){
            	if(starttime.length==8){
            		document.getElementById("four_date_range").value = "轮播范围:" + starttime.slice(0,4)+"年"+starttime.slice(4,6)+"月"+starttime.slice(6,8)+"日-" + endtime.slice(0,4)+"年"+endtime.slice(4,6)+"月"+endtime.slice(6,8)+"日";
            	}else if(starttime.length==6){
            		document.getElementById("four_date_range").value = "轮播范围:" + starttime.slice(0,4)+"年"+starttime.slice(4,6)+"月-" + endtime.slice(0,4)+"年"+endtime.slice(4,6)+"月";
            	}else{
            		document.getElementById("four_date_range").value = "轮播范围:" + starttime.slice(0,4)+"年-" + endtime.slice(0,4)+"年";
            	}	
            }else{
            	$("#four_date_range").val("");
            }
            
            var timeline_chart = echarts.init(document.getElementById('quadclass_graph'));
            var timeline_option = {
                    toolbox: {
                        show: true,
                        feature: {
                            mark: {
                                show: true
                            },
                            dataView: {
                                show: true,
                                readOnly: false
                            },
                            restore: {
                                show: true
                            },
                            saveAsImage: {
                                show: true
                            }
                        }
                    },
            	    tooltip: {
            	        trigger: 'axis',
            	        formatter:'{a0}:{c0}<br/>{a1}:{c1}<br/>{a2}:{c2}<br/>{a3}:{c3}'
            	    },
            	    legend: {
            	    	selectedMode:false,
            	    	data:[sjbmname[0],sjbmname[1],sjbmname[2],sjbmname[3]]
            	    },
            	    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
            	    xAxis: [
            	        {
            	            type : 'category',
            	            boundaryGap : false,
            	            data: date_data
            	        }
            	    ],
            	    yAxis: [
            	        {
            	            type: 'value',
            	            axisLabel:{
            	                        	formatter:'{value}'
            	                        }
            	        }
            	    ],
            	    series:  [
                              {
                                  name:sjbmname[0],
                                  type:'line',
                                  data:getDataByCat(sjbmname[0],quadclass_data)
                              },
                              {
                                  name:sjbmname[1],
                                  type:'line',
                                  data:getDataByCat(sjbmname[1],quadclass_data)
                              },
                              {
                                  name:sjbmname[2],
                                  type:'line',
                                  data:getDataByCat(sjbmname[2],quadclass_data)
                              },
                              {
                                  name:sjbmname[3],
                                  type:'line',
                                  data:getDataByCat(sjbmname[3],quadclass_data)
                              }
                          ]
            	};
            timeline_chart.setOption(timeline_option);
            //调节echarts图表自适应
            window.onresize=function (){
            	timeline_chart.resize();
            }
        }
        function getDataByCat(cat,data){
            var len = data.length;
            var ret=[];
            for(var i =0 ;i<len;i++)
            {
                ret[i] = data[i][cat];
            }
            return ret;
        }
        function getDataByDate(date,data){
            var len = data.length;
            var ret=[];
            for(var i=0;i<20;i++){
            	ret[i] = 0;
            }
            for(var i =0 ;i<len;i++)
            {
                if (data[i].date == date){
                	if(typeof(data[i]['MAKE PUBLIC STATEMENT(公开声明)'])=="undefined"){
                		 ret[0] = 0;
                	}else{
                		ret[0] = data[i]['MAKE PUBLIC STATEMENT(公开声明)'];
                	}
                	if(typeof(data[i]['APPEAL(上诉)'])=="undefined"){
                		 ret[1] = 0;
                	}else{
                		ret[1] = data[i]['APPEAL(上诉)'];
                	}
                	if(typeof(data[i]['EXPRESS INTENT TO COOPERATE(表示合作意向)'])=="undefined"){
                		 ret[2] = 0;
                	}else{
                		ret[2] = data[i]['EXPRESS INTENT TO COOPERATE(表示合作意向)'];
                	}
                	if(typeof(data[i]['CONSULT(咨询)'])=="undefined"){
                		 ret[3] = 0;
                	}else{
                		ret[3] = data[i]['CONSULT(咨询)'];
                	}
                	if(typeof(data[i]['ENGAGE IN DIPLOMATIC COOPERATION(从事外交合作)'])=="undefined"){
                		 ret[4] = 0;
                	}else{
                		ret[4] = data[i]['ENGAGE IN DIPLOMATIC COOPERATION(从事外交合作)'];
                	}
                	if(typeof(data[i]['ENGAGE IN MATERIAL COOPERATION(从事物质合作)'])=="undefined"){
                		 ret[5] = 0;
                	}else{
                		ret[5] = data[i]['ENGAGE IN MATERIAL COOPERATION(从事物质合作)'];
                	}
                	if(typeof(data[i]['PROVIDE AID(提供援助)'])=="undefined"){
                		 ret[6] = 0;
                	}else{
                		ret[6] = data[i]['PROVIDE AID(提供援助)'];
                	}
                	if(typeof(data[i]['YIELD(投降)'])=="undefined"){
                		 ret[7] = 0;
                	}else{
                		ret[7] = data[i]['YIELD(投降)'];
                	}
                	if(typeof(data[i]['INVESTIGATE(研究)'])=="undefined"){
                		 ret[8] = 0;
                	}else{
                		ret[8] = data[i]['INVESTIGATE(研究)'];
                	}
                	if(typeof(data[i]['DEMAND(需求)'])=="undefined"){
                		 ret[9] = 0;
                	}else{
                		ret[9] = data[i]['DEMAND(需求)'];
                	}
                	if(typeof(data[i]['DISAPPROVE(反对)'])=="undefined"){
                		 ret[10] = 0;
                	}else{
                		ret[10] = data[i]['DISAPPROVE(反对)'];
                	}
                	if(typeof(data[i]['REJECT(拒绝)'])=="undefined"){
                		 ret[11] = 0;
                	}else{
                		ret[11] = data[i]['REJECT(拒绝)'];
                	}
                	if(typeof(data[i]['THREATEN(威胁)'])=="undefined"){
                		 ret[12] = 0;
                	}else{
                		ret[12] = data[i]['THREATEN(威胁)'];
                	}
                	if(typeof(data[i]['PROTEST(抗议)'])=="undefined"){
                		 ret[13] = 0;
                	}else{
                		ret[13] = data[i]['PROTEST(抗议)'];
                	}
                	if(typeof(data[i]['EXHIBIT FORCE POSTURE(展示力量部署)'])=="undefined"){
                		 ret[14] = 0;
                	}else{
                		ret[14] = data[i]['EXHIBIT FORCE POSTURE(展示力量部署)'];
                	}
                	if(typeof(data[i]['REDUCE RELATIONS(减少联系)'])=="undefined"){
                		 ret[15] = 0;
                	}else{
                		ret[15] = data[i]['REDUCE RELATIONS(减少联系)'];
                	}
                	if(typeof(data[i]['COERCE(强迫)'])=="undefined"){
                		 ret[16] = 0;
                	}else{
                		ret[16] = data[i]['COERCE(强迫)'];
                	}
                	if(typeof(data[i]['ASSAULT(突击)'])=="undefined"){
                		 ret[17] = 0;
                	}else{
                		ret[17] = data[i]['ASSAULT(突击)'];
                	}
                	if(typeof(data[i]['FIGHT(战斗)'])=="undefined"){
                		 ret[18] = 0;
                	}else{
                		ret[18] = data[i]['FIGHT(战斗)'];
                	}
                	if(typeof(data[i]['USE UNCONVENTIONAL MASS VIOLENCE(非常规大规模暴力)'])=="undefined"){
                		 ret[19] = 0;
                	}else{
                		ret[19] = data[i]['USE UNCONVENTIONAL MASS VIOLENCE(非常规大规模暴力)'];
                	}
                }
            }
            return ret;
        }
        function styleStart(){
        	var showstr,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20;
        	if(date_data.length > 1){
        		if(!$("#style_start").hasClass("act")){
	        		$("#style_start").addClass("act");
	        	}else{
	           		return;
	           	}
	        	var pos = 0;
                 timeDataPlay = setInterval(function(){
	                if(pos==len) {// 到了最后一个则又重复执行
	                    pos = 0;
	                } else {
                        var date = date_data[pos];
                        if(!date==""||!date==null||!date==undefined){
                        	if(date.length==8){
                        		$("#date").val(date.slice(0,4)+"年"+date.slice(4,6)+"月"+date.slice(6,8)+"日");
                        	}else if(date.length==6){
                        		$("#date").val(date.slice(0,4)+"年"+date.slice(4,6)+"月");
                        	}else{
                        		$("#date").val(date.slice(0,4)+"年");
                        	}	
            			}
                        for(var k=1;k<=20;k++){
                            $("#eventroot_"+(k).toString()).html(getDataByDate(date,eventroot_data)[k-1]);
                            if(k==1){
                            	a1 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==2){
                            	a2 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==3){
                            	a3 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==4){
                            	a4 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==5){
                            	a5 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==6){
                            	a6 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==7){
                            	a7 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==8){
                            	a8 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==9){
                            	a9 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==10){
                            	a10 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==11){
                            	a11 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==12){
                            	a12 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==13){
                            	a13 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==14){
                            	a14 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==15){
                            	a15 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==16){
                            	a16 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==17){
                            	a17 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==18){
                            	a18 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==19){
                            	a19 = getDataByDate(date,eventroot_data)[k-1];
                            }else if(k==20){
                            	a20 = getDataByDate(date,eventroot_data)[k-1];
                            }
                        }
                        showstr = "MAKE PUBLIC STATEMENT(公开声明):" + a1 
        				+ "<br />APPEAL(上诉):" + a2
        				+ "<br />EXPRESS INTENT TO COOPERATE(表示合作意向):" + a3
        				+ "<br />CONSULT(咨询):" + a4
        				+ "<br />ENGAGE IN DIPLOMATIC COOPERATION(从事外交合作):" + a5
        				+ "<br />ENGAGE IN MATERIAL COOPERATION(从事物质合作):" + a6
        				+ "<br />PROVIDE AID(提供援助):" + a7
        				+ "<br />YIELD(投降):" + a8
        				+ "<br />INVESTIGATE(研究):" + a9
        				+ "<br />DEMAND(需求):" + a10
        				+ "<br />DISAPPROVE(反对):" + a11
        				+ "<br />REJECT(拒绝):" + a12
        				+ "<br />THREATEN(威胁):" + a13
        				+ "<br />PROTEST(抗议):" + a14
        				+ "<br />EXHIBIT FORCE POSTURE(展示力量部署):" + a15
        				+ "<br />REDUCE RELATIONS(减少联系):" + a16
        				+ "<br />COERCE(强迫):" + a17
        				+ "<br />ASSAULT(突击):" + a18
        				+ "<br />FIGHT(战斗):" + a19
        				+ "<br />USE UNCONVENTIONAL MASS VIOLENCE(非常规大规模暴力):" + a20;
                        pos++;
                        var data_chart = echarts.init(document.getElementById('eventroot_graph'));
                        var data_option = {
                       		tooltip: {
                               	confine:'true',
                               	position:[70, 20],
                            },
                            legend: {
                            },
                            radar: {
                                indicator: [
                                    { name: sjbmname[4].substring(sjbmname[4].indexOf("(") + 1,sjbmname[4].indexOf(")")), max: maxrootvalue[0]},
	                                { name: sjbmname[5].substring(sjbmname[5].indexOf("(") + 1,sjbmname[5].indexOf(")")), max: maxrootvalue[0]},
	                                { name: sjbmname[6].substring(sjbmname[6].indexOf("(") + 1,sjbmname[6].indexOf(")")), max: maxrootvalue[0]},
	                                { name: sjbmname[7].substring(sjbmname[7].indexOf("(") + 1,sjbmname[7].indexOf(")")), max: maxrootvalue[0]},
	                                { name: sjbmname[8].substring(sjbmname[8].indexOf("(") + 1,sjbmname[8].indexOf(")")), max: maxrootvalue[0]},
	                                { name: sjbmname[9].substring(sjbmname[9].indexOf("(") + 1,sjbmname[9].indexOf(")")), max: maxrootvalue[0]},
	                                { name: sjbmname[10].substring(sjbmname[10].indexOf("(") + 1,sjbmname[10].indexOf(")")), max: maxrootvalue[0]},
	                                { name: sjbmname[11].substring(sjbmname[11].indexOf("(") + 1,sjbmname[11].indexOf(")")), max: maxrootvalue[0]},
	                                { name: sjbmname[12].substring(sjbmname[12].indexOf("(") + 1,sjbmname[12].indexOf(")")), max: maxrootvalue[0]},
	                                { name: sjbmname[13].substring(sjbmname[13].indexOf("(") + 1,sjbmname[13].indexOf(")")), max: maxrootvalue[0]},
	                                { name: sjbmname[14].substring(sjbmname[14].indexOf("(") + 1,sjbmname[14].indexOf(")")), max: maxrootvalue[0]},
	                                { name: sjbmname[15].substring(sjbmname[15].indexOf("(") + 1,sjbmname[15].indexOf(")")), max: maxrootvalue[0]},
	                                { name: sjbmname[16].substring(sjbmname[16].indexOf("(") + 1,sjbmname[16].indexOf(")")), max: maxrootvalue[0]},
	                                { name: sjbmname[17].substring(sjbmname[17].indexOf("(") + 1,sjbmname[17].indexOf(")")), max: maxrootvalue[0]},
	                                { name: sjbmname[18].substring(sjbmname[18].indexOf("(") + 1,sjbmname[18].indexOf(")")), max: maxrootvalue[0]},
	                                { name: sjbmname[19].substring(sjbmname[19].indexOf("(") + 1,sjbmname[19].indexOf(")")), max: maxrootvalue[0]},
	                                { name: sjbmname[20].substring(sjbmname[20].indexOf("(") + 1,sjbmname[20].indexOf(")")), max: maxrootvalue[0]},
	                                { name: sjbmname[21].substring(sjbmname[21].indexOf("(") + 1,sjbmname[21].indexOf(")")), max: maxrootvalue[0]},
	                                { name: sjbmname[22].substring(sjbmname[22].indexOf("(") + 1,sjbmname[22].indexOf(")")), max: maxrootvalue[0]},
	                                { name: sjbmname[23].substring(sjbmname[23].indexOf("(") + 1,sjbmname[23].indexOf(")")), max: maxrootvalue[0]}
                                ]
                            },
                            name: {
                                textStyle: {
                                  color: '#5B5B5B'
                                }
                            },
                            series: [{
                                name: '基类数据',
                                type: 'radar',
                                tooltip: {
                                    trigger: 'item',
                                    formatter: showstr
                                },
                                data : [
                                    {
                                        value : getDataByDate(date,eventroot_data),
                                        name : '基类数据'
                                    }
                                ]
                            }]
                        };
                        data_chart.setOption(data_option);
                    }
                },1000);// 每1秒执行一次
                timeArray.push(timeDataPlay);
            $("#style_stop").click(function(){
           		$("#style_start").removeClass("act");
                clearInterval(timeDataPlay);
            });
        	}
        }
        
	</script>
</body>
</html>