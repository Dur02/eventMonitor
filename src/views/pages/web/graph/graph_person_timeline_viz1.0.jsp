<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<title>图谱时间线-人物</title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="shortcut icon" type="image/x-icon" href="<%=basePath%>/static/Visualization/base/ico.png"/>
<link rel="stylesheet" href="<%=basePath%>/static/css/style.css">
<!--人工查询 -->
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath %>/static//lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath %>/static/css/combo.select.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/perfect-scrollbar.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/base.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/css/event_result.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/js/amcharts/export/export.css"/>
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window_zs.css"/><!-- 弹出提示框样式 -->
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
		<h3 class="fl title">图谱库分析 > 人物时间线</h3>
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
	<div class="data show">
		<input type="hidden" id="moduleCode" value="${moduleCode}">
	
		<div class="row">
        	<div class="col-md-12 mg_t">
	            <div class="col-md-10" style="width:100%;border: 1px solid #CCCCCC;margin: 0px -8px 0 0;border-radius:3px;">
	                <div class="col-md-5" id="column_chart_text" style="text-align: center;width: 100%;">
	                    <h3 class="tx-c">人物事件情感统计
	                    	<select class="selectCounts" style="margin-left:10px;" id="selectPerson"></select>
                        	<div  class="help" onmouseover="showChartInfo(1,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
	                    </h3>
	                </div>
	                <div class="col-md-7" style="width:100%;">
	                    <div id="line_column_chart" class="amcharts oneColumChart"></div>
	                </div>
	            </div>
        	</div>
        </div>
	
		<%-- <div class="row">
             <div class="mg_t col-md-12">
                <div class="col-md-10" style="width:100%;border: 1px solid #CCCCCC;margin: 0px -8px 0 0; border-radius:3px;">
                   <!-- <!-- <h3 class="headline first-child"><span class="fa fa-bar-chart"></span></h3>-->
                    <div class="col-md-12 map-text" style="width:100%;">
                        <h3 class="tx-c">人物事件情感统计
                        	<select class="selectCounts" style="margin-left:10px;" id="selectPerson">
                        	</select>
                        	<div  class="help" onmouseover="showChartInfo(1,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
                        </h3>
                    </div>
                    <div class="col-md-12" >
                        <div id="line_column_chart" class="amcharts oneColumChart"></div>
                    </div>
                </div>
               </div>
        </div> --%>
        
        <div class="row"> 
		        <div class="col-md-12">
					<div class="col-md-12 mg_t bor">
	                    <div class="map-text">
	                        <h3>人物事件时间线
                    			<div  class="help" onmouseover="showChartInfo(2,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
	                        </h3>
	                    </div>
	                    <div style="margin-left: 3%;margin-right: 8%">
                  				 <select class="selectCounts form-control" style="margin-left:10px;" id="select_person_1" ></select>
               			</div>
	                    <div id="date_chart" class="amcharts oneColumChart"></div>
		             </div>
		        </div>	
	       </div>
        	
        	<div class="row"> 
		        <div class="col-md-12">
					<div class="col-md-12 mg_t mg_b bor">
	                    <div class="map-text">
	                        <h3>人物事件情感时间线
                        		<div  class="help" onmouseover="showChartInfo(3,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
	                        </h3>
	                    </div>
	                    <div style="margin-left: 3%;margin-right: 8%">
                  				 <select class="selectCounts form-control" style="margin-left:10px;" id="select_person_2" ></select>
               			</div>
	                    <div id="double_line_chart" class="amcharts oneColumChart"></div>
		             </div>
		        </div>	
	       </div>
        
	<%-- <div class="container show-graph" style="width: 100%;">
        <div class="row"style="">
             <div class="mg_t ">
            <div class="col-md-10" style="width:100%;border: 1px solid #CCCCCC;margin:0px -8px 0 0; border-radius:3px;height:437px;">
                <!--<h3 class="headline first-child"><span class="fa fa-globe"></span></h3>-->
                <div class="col-md-12 map-text" style="width:100%;">
                    <h3 class="tx-c">人物事件时间线
                    	<div  class="help" onmouseover="showChartInfo(2,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
                    </h3>
                </div>
                <div style="margin-left: 5%;margin-right: 8%">
                    <select id="select_person_1" class="form-control selectCounts">
                    </select>
                </div>
                <div id="date_chart" class="amcharts" style="height: 333px;"></div>
            </div>
            </div>
        </div>
        <div class="row"style="">
             <div class="mg_t ">
                <div class="col-md-10" style="width:100%;border: 1px solid #CCCCCC;margin: 0px -8px 0 0; border-radius:3px;margin-bottom: 70px;height:437px;">
                  <!--<h3 class="headline first-child"><span class="fa fa-globe"></span></h3>-->
                    <div class="col-md-12 map-text" style="width:100%;">
                        <h3 class="tx-c">人物事件情感时间线
                        	<div  class="help" onmouseover="showChartInfo(3,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
                        </h3>
                       
                    </div>
                    <div style="margin-left: 6%;margin-right: 5%">
                        <select id="select_person_2" class="form-control selectCounts">
                        </select>
                    </div>
                    <div class="col-md-12" style="height:365px;">
                        <div id="double_line_chart" style="height:365px;" class="amcharts"></div>
                    </div>
                </div>
               </div>
        </div>
    </div> --%>
	</div>
    
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
		<jsp:include page="graph_tab2.jsp"></jsp:include>
	</div>
		<jsp:include page="../updateUserPassword.jsp"/>
	<!-- 页面底部收缩结束 -->
</body>
    
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/jquery-1.11.1.min.js"></script>
<!-- 人工查询功能的日期 -->
<script src="<%=basePath %>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-select.min.js"></script>
<script src="<%=basePath %>/static/js/jquery.combo.select.js"></script>
<script src="<%=basePath %>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath %>/static/js/perfect-scrollbar.js"></script>
<script src="<%=basePath %>/static/js/config/config.js"></script>
<script src="<%=basePath%>/static/js/sec2.js"></script>
<script src="<%=basePath%>/static/lib/jquery.pagination.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/base.js"></script>


<script src="<%=basePath%>/static/Visualization/js/amcharts/amcharts.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/themes/light.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amchart_util.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/ammap.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/ammap_util.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/export/export.js" type="text/javascript"></script>

<script src="<%=basePath%>/static/Visualization/js/amcharts/serial.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/xy.js" type="text/javascript"></script>
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
<!-- 人工查询js -->
<script src="<%=basePath %>/static/Visualization/rgQuery.js"></script>
<!-- 计算显示图的高度 -->	
<script src="<%=basePath%>/static/js/chartHeight.js" type="text/javascript"></script>
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
    	// 控制选择年月日
    	$(".date").on("click",function(){
    		$(this).addClass("active_span").siblings().removeClass("active_span");
    	});
    	
    });
    
    
    function render(configId){
    	startLoad();
    	var resultcode = 'ALL';
    	$.ajax({
    		url:'<%=basePath%>/search/graph_person_timeline_viz/'+configId,
    		type: 'POST',
    		dataType:"json",
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
    	$("#select_person_1").html("");
		$("#select_person_2").html("");
	    var person_dic = data.person_dic;
	    if(person_dic.length>0){
	    	$("#selectPerson").show();
    	    $("#selectPerson").html(""); 
    	    var personNum = person_dic.length > 20 ? 20:person_dic.length;
    	    /* if(personNum==1){
				document.getElementById("selectPerson").options.add(new Option("1","1"));
			} */
			for(var i=5;i<=personNum;i+=5){
				document.getElementById("selectPerson").options.add(new Option(i,i));
			} 
			var	countryOptionCount = $("#selectPerson option").map(function(){return $(this).val();}).get().join(", ");
			if(countryOptionCount.indexOf(10)!=-1){
				$("#selectPerson option[value='10']").attr("selected",true);
				process_dic_to_country_line_column_chart3(person_dic,'line_column_chart',10);
			}else{
				$("#selectPerson").hide();
				process_dic_to_country_line_column_chart3(person_dic,'line_column_chart',personNum);
			}
			
    	    $("#selectPerson").change(function () {
	        	var changeValue = $("#selectPerson option:selected").val();
	        	process_dic_to_country_line_column_chart3(person_dic,'line_column_chart',changeValue);
	        });
	    }else{
	    	$("#selectPerson").hide();
	    	$("#line_column_chart").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
	    }
	    var timeline_dic = data.timeline_dic;
	    
	    
	    var dtlen=person_dic.length;
	    if(person_dic.length>0){
	    	for (var i = 0; i < dtlen; i++)
            {
                var name=person_dic[i].key.toString();
                var chName=person_dic[i].name_key.toString();
                var number=(person_dic[i].value).toString();
                var tone=(person_dic[i].tone_value).toString();

                $("#select_person_1").append("<option value='"+name+"'>人物："+name+"("+chName+")   事件总数："+number + "</option>");
                $("#select_person_2").append("<option value='"+name+"'>人物："+name+"("+chName+")   事件总数："+number+"    总情感值："+tone+"</option>");
            }
	    }
	    if(timeline_dic.length>0){
	    	$("#select_person_1").show();
	    	$("#select_person_2").show();
	    	$("#select_person_1").change(function() {process_dic_to_datechart(get_needed_date_dic(timeline_dic,$("#select_person_1").val()),'date_chart')});
            process_dic_to_datechart(get_needed_date_dic(timeline_dic,$("#select_person_1 option:first").val()),'date_chart');

            $("#select_person_2").change(function() { process_dic_to_country_double_line_chart(timeline_dic,$("#select_person_2").val(),'double_line_chart'); });
            process_dic_to_country_double_line_chart(timeline_dic,$("#select_person_2 option:first").val(),'double_line_chart');//函数与country通用
	    }else{
	    	$("#select_person_1").hide();
	    	$("#select_person_2").hide();
	    	$("#date_chart").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
	    	$("#double_line_chart").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
	    }
        function get_needed_date_dic(date_dic,name)
        {
            var len=date_dic.length;
            var res=[];
            for (var i = 0; i < len; i++)
            {
                if(date_dic[i].key==name){
                    res.push({"key":date_dic[i].date,"value":date_dic[i].value});
                }
            }
            return res;
        }
    }
    </script>
</html>