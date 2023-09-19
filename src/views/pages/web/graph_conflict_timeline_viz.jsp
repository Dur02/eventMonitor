<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<title>图谱时间线-冲突</title>
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
<c:if test="${bgFlag == null or bgFlag == 1}">
	<link rel="stylesheet" href="<%=basePath %>/static/css/sec2.css">
</c:if>
<c:if test="${bgFlag == 2}">
	<link rel="stylesheet" href="<%=basePath %>/static/css/sec2_2.css">
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
		<h3 class="fl title">图谱分析 > 时间线-冲突</h3>
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
	<div class=" " style="width: 100%;">
        <div class="row"style="">
        <div class="col-md-12 mg_t" style="margin-top:6px;">
            
            <div class="col-md-10" style="width:100%;border: 1px solid #CCCCCC;margin: 0px -8px 0 0;border-radius:3px;">
              <!--  <h3 class="headline first-child"><span class="fa fa-bar-chart"></span></h3>-->
                <div class="col-md-5" id="column_chart_text" style="text-align: center;width: 100%;">
                    <h1 style="font-size:14px;">国家冲突统计
                    	<select class="selectCounts" style="margin-left:10px;" id="selectCountry">
				                        	
                      	</select>
                    </h1>
          
                </div>
                <div class="col-md-7" style="width:100%;">
                    <div id="column_chart" class="amcharts"></div>
                </div>
            </div>
        	</div>
        </div>
        <div class="row"">
          <div class="col-md-12 mg_t ">
            <div class="col-md-10 bor w50l" style="border: 1px solid #CCCCCC;margin: 0px 0px 0px 0;width:49.5%; float:left; border-radius:3px;">
              <div class="col-md-5" id="pie_chart_text" style="width:45%;">
                    <h1 style="font-size:14px;margin-left:-15px;">州省冲突统计
                    	<select class="selectCounts" style="margin-left:10px;" id="selectState">
				                        	
                       	</select>
                    </h1>
                   
                </div>
               <!-- <h3 class="headline first-child"><span class="fa fa-bar-chart"></span></h3>-->
                 <div class="col-md-7" style="width:100%;">
                    <div id="pie_chart" class="amcharts"></div>
                </div>
              
            </div>
          <div class="col-md-10 bor w50r" style="height:436px;border: 1px solid #CCCCCC;margin: 0px 0px 0px 0; border-radius:3px;width:49.5%; float:right;">
               <!-- <h3 class="headline first-child"><span class="fa fa-bar-chart"></span></h3>-->
                <div class="col-md-5" id="radar_chart_text" style="width:45%;">
                    <h1 style="font-size:14px;margin-left:-15px;">城市冲突统计
                    	<select class="selectCounts" style="margin-left:10px;" id="selectCity">
				                        	
                       	</select>
                    </h1>
                   
                </div>
                <div class="col-md-7" style="width:100%;">
                    <div id="radar_chart" class="amcharts"></div>
                </div>
            </div>
            </div>
        </div>


        <div class="row"style="">
         <div class="col-md-12 mg_t ">
            <div class="col-md-10" style="width:100%;border: 1px solid #CCCCCC;margin: 0px -8px 0 0;border-radius:3px;height:437px;">
                <!--<h3 class="headline first-child"><span class="fa fa-globe"></span></h3>
-->                <div class="col-md-12 map-text" >
                    <h1 style="font-size:14px;">国家冲突时间线 </h1>
                </div>
                <div style="margin-left: 5%;margin-right: 8%">
                    <select id="select_country" class="form-control">
                    </select>
                </div>
                <div id="country_date_chart" class="amcharts" style="height: 350px;"></div>
            </div>
			</div>
        </div>
        <div class="row"style="">
				<div class="col-md-12 mg_t ">
            <div class="col-md-10" style="width:100%;border: 1px solid #CCCCCC;margin: 0px -8px 0 0;border-radius:3px;height:437px;">
 <!-- <h3 class="headline first-child"><span class="fa fa-globe"></span></h3>-->
                <div class="col-md-12 map-text">
                    <h1 style="font-size:14px;">州省冲突时间线 </h1>
                </div>
                <div style="margin-left: 5%;margin-right: 8%">
                    <select id="select_state" class="form-control">
                    </select>
                </div>
                <div id="state_date_chart" class="amcharts" style="height: 350px;"></div>
            </div>
   </div>
        </div>
        <div class="row"style="">
			<div class="col-md-12 mg_t ">
            <div class="col-md-10" style="width:100%;border: 1px solid #CCCCCC;margin: 15px -8px 0 0;border-radius:3px;height:437px;">
                   <!-- <h3 class="headline first-child"><span class="fa fa-globe"></span></h3>-->
                <div class="col-md-12 map-text">
                    <h1 style="font-size:14px;">城市冲突时间线 </h1>
                </div>
                <div style="margin-left: 5%;margin-right: 8%">
                    <select id="select_city" class="form-control">
                    </select>
                </div>
                <div id="city_date_chart" class="amcharts" style="height: 350px;"></div>
            </div>
			</div>
        </div>
        <div class="" id="">
      	<div class="col-md-12 mg_t ">
            <div class="col-md-10 bor w50l" style="height:437px;" >
                   <!-- <h3 class="headline first-child"><span class="fa fa-globe"></span></h3>-->
                <div class="col-md-12 map-text">
                    <h1 style="font-size:14px;color:black;margin-left:-15px;float:left;">国家冲突热点图</h1>
                    <input type="text" value="时间" id="country_date" style="margin-top:8px;" >
                </div>
                <div class="col-md-12">
                    <div id="bubble_country" class="ammap" style="height:370px;"></div>
                    <div style="position: absolute;z-index: 99;right:100px;top: 5px">
                        <div class="btn-group">
                            <buttun type="button" class="btn btn-default" id="country_start">开始</buttun>
                            <buttun type="button" class="btn btn-default" id="country_stop">停止</buttun>
                        </div>
                    </div>
                </div>
            </div>
       	
       	 <div class="col-md-10 bor w50r" style="height:437px;">
                   <!-- <h3 class="headline first-child"><span class="fa fa-globe"></span></h3>-->
                <div class="col-md-12 map-text">
                    <h1 style="font-size:14px;color:black;margin-left:-15px;float:left;">州省冲突热点图</h1>
                    <input type="text" value="时间" id="state_date" style="margin-top:8px;">
                </div>
                <div class="col-md-12">
                    <div id="bubble_state" class="ammap" style="height:370px;"></div>
                    <div style="position: absolute;z-index: 99;right:100px;top: 5px">
                        <div class="btn-group">
                            <buttun type="button" class="btn btn-default" id="state_start">开始</buttun>
                            <buttun type="button" class="btn btn-default" id="state_stop">停止</buttun>
                        </div>
                    </div>
                </div>
            </div>         
            </div>
        </div>
		 <div class="row"style="">
		 <div class="col-md-12  ">
		 <div class="col-md-10 " style="width:100%;border: 1px solid #CCCCCC;margin: 15px -8px 0 0;border-radius:3px;height:437px;margin-bottom:70px;">
                   <!-- <h3 class="headline first-child"><span class="fa fa-globe"></span></h3>-->
                <div class="col-md-12 map-text">
                    <h1 style="font-size:14px;">城市冲突热点图</h1>
                    <input type="text" value="时间" id="city_date" style="border:0px;text-align: center;margin-top: -3px;margin-bottom: 5px;">
                </div>
                <div class="col-md-12">
                    <div id="bubble_city" class="ammap" style="height:360px;"></div>
                    <div style="position: absolute;z-index: 99;right:100px;top: 5px">
                        <div class="btn-group">
                            <buttun type="button" class="btn btn-default" id="city_start">开始</buttun>
                            <buttun type="button" class="btn btn-default" id="city_stop">停止</buttun>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            </div>
    </div>
	</div>
    
       <%--  <div class="data2">
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
		<%-- <jsp:include page="graph_tab2.jsp"></jsp:include> --%>
	</div>
		<%-- <jsp:include page="../updateUserPassword.jsp"/> --%>
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
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/downLoad.js"></script>
    <script type="text/javascript">
    $(function(){
    	//默认调用第一个配置
    	$('#tab_ul').children().eq(0).click();
    	//$('select').comboSelect();
    ////////////////////////////////////////////////////////////////////////////
    	// 控制选择年月日
    	$(".date").on("click",function(){
    		$(this).addClass("active_span").siblings().removeClass("active_span");
    	});
    	
    });
    
    
    var timeArray = [];
    
    /**
     * 人工查询
     */
    function gkgRGQuery(){
    	startLoad();
    	$("#RGFL").val(20);
    	$("#modelType").val(20);
    	var formData = $("#graphQueryForm").serialize();
    	$.ajax({
    		url: '<%=basePath%>/config/renGongQuery',
    		type: 'POST',
    		data: formData,
    		dataType:"json",
    		success: function(data){
    			if(data=="1"){
    				location.reload();
    			}else{
	    			renderData(data);
    			}
    			endLoad();
	    	},
	    	error:function(data){
	    		endLoad();
	    		win.alertEx("人工查询配置异常，请到配置管理中查看。");
	    	}
    	});
    }
    function render(configId){
    	startLoad();
    	var resultcode = 'ALL';
    	
    	$.ajax({
    		url:'<%=basePath%>/search/graph_country_timeline_viz/'+configId+'/'+resultcode,
    		type: 'Get',
    		dataType:"json",
    		success:function(data){
    			renderData(data);
    			endLoad();
    		},
    		error:function(data){
    			endLoad();
    			win.alertEx("加载失败");
    		}
    	});
  
        
    }
    function renderData(data){
    	for(var j = 0;j<timeArray.length;j++){
			clearInterval(timeArray[j]);
		}
		$("#select_country").html("");
		$("#select_state").html("");
		$("#select_city").html("");
		var country_dic = data.country_dic;
		if(country_dic.length>0){
			$("#selectCountry").show();
			$("#selectCountry").html(""); 
			var countryNum = country_dic.length > 20 ? 20:country_dic.length;
			for(var i=5;i<=countryNum;i+=5){
				document.getElementById("selectCountry").options.add(new Option(i,i));
			} 
			document.getElementById("selectCountry").options.add(new Option("全部","all"));
			var	countryOptionCount = $("#selectCountry option").map(function(){return $(this).val();}).get().join(", ");
			if(countryOptionCount.indexOf(10)!=-1){
				$("#selectCountry option[value='10']").attr("selected",true);
			}
			column_chart('column_chart',{category:'name_key',value:'value'},country_dic.slice(0,10));
			$("#selectCountry").change(function () {
	        	var changeValue = $("#selectCountry option:selected").val();
	        	if(changeValue!="all"){
	        		column_chart('column_chart',{category:'name_key',value:'value'},country_dic.slice(0,changeValue));
	        	}if(changeValue=="all"){
	        		if(confirm("确定下载全部数据吗？")){
	        			exportAllData(country_dic,true,"国家事件稳定统计");
	        		}
	        	}
	        });
		}else{
			$("#selectCountry").hide();
        	$("#column_chart").html('<img alt="" style="width: 28%;margin-left: 38%;margin-top: 3%;"  src="<%=basePath %>/static/images/tubiao.jpg">');
		}
		var state_dic = data.state_dic;
		if(state_dic.length>0){
			$("#selectState").show();
			$("#selectState").html(""); 
			var stateNum = state_dic.length > 20 ? 20:state_dic.length;
			for(var i=2;i<=stateNum;i+=2){
				document.getElementById("selectState").options.add(new Option(i,i));
			}
			document.getElementById("selectState").options.add(new Option("全部","all"));
			var countryOptionCount = $("#selectState option").map(function(){return $(this).val();}).get().join(", ");
			if(countryOptionCount.indexOf(8)!=-1){
				$("#selectState option[value='8']").attr("selected",true);
			}
			process_dic_to_amchart(state_dic,'pie_chart','pie_chart');
			$("#selectState").change(function () {
	        	var changeValue = $("#selectState option:selected").val();
	        	if(changeValue!="all"){
	        		process_dic_to_amchart(state_dic,'pie_chart','pie_chart',changeValue);
	        	}if(changeValue=="all"){
	        		if(confirm("确定下载全部数据吗？")){
	        			exportAllData(state_dic,true,"州省冲突统计");
	        		}
	        	}
	        	
	        });
		}else{
			$("#selectState").hide();
			$("#pie_chart").html('<img alt="" style="width: 50%;margin-left: 23%;margin-top: 8%;"  src="<%=basePath %>/static/images/tubiao.jpg">');
		}
		var city_dic = data.city_dic;
		if(city_dic.length>0){
			$("#selectCity").show();
			$("#selectCity").html(""); 
			var cityNum = city_dic.length > 20 ? 20:city_dic.length;
			for(var i=3;i<=cityNum;i+=3){
				document.getElementById("selectCity").options.add(new Option(i,i));
			}
			document.getElementById("selectCity").options.add(new Option("全部","all"));
			var cityOptionCount = $("#selectCity option").map(function(){return $(this).val();}).get().join(", ");
			if(cityOptionCount.indexOf(6)!=-1){
				$("#selectCity option[value='6']").attr("selected",true);
			}
			process_dic_to_amchart(city_dic,'radar_chart','radar_chart');
			$("#selectCity").change(function () {
	        	var changeValue = $("#selectCity option:selected").val();
	        	if(changeValue!="all"){
	        		process_dic_to_amchart(city_dic,'radar_chart','radar_chart',changeValue);
	        	}if(changeValue=="all"){
	        		if(confirm("确定下载全部数据吗？")){
	        			exportAllData(city_dic,true,"城市冲突统计");
	        		}
	        	}
	        });
		}else{
			$("#selectCity").hide();
			$("#radar_chart").html('<img alt="" style="width: 50%;margin-left: 23%;margin-top: 8%;"  src="<%=basePath %>/static/images/tubiao.jpg">');
		}
		var country_timeline_dic = data.country_timeline_dic;
		var state_timeline_dic = data.state_timeline_dic;
		var city_timeline_dic = data.city_timeline_dic;
		var dtlen1 = country_dic.length;
        var dtlen2 = state_dic.length;
        var dtlen3 = city_dic.length;
        for (var i = 0; i < dtlen1; i++)
        {
            var name=country_dic[i].name_key.toString();
            var number=(country_dic[i].value).toString();
            $("#select_country").append("<option value='"+name+"'>国家："+name+"   冲突总数："+number + "</option>");
        }
        $("#select_country").change(function() {process_dic_to_datechart(get_needed_date_dic(country_timeline_dic,$("#select_country").val()),'country_date_chart')});
        process_dic_to_datechart(get_needed_date_dic(country_timeline_dic,$("#select_country option:first").val()),'country_date_chart');

        for (var i = 0; i < dtlen2; i++)
        {
            var name=state_dic[i].name_key.toString();
            var number=(state_dic[i].value).toString();
            $("#select_state").append("<option value='"+name+"'>州省："+name+"   冲突总数："+number + "</option>");
        }
        $("#select_state").change(function() {process_dic_to_datechart(get_needed_date_dic(state_timeline_dic,$("#select_state").val()),'state_date_chart')});
        process_dic_to_datechart(get_needed_date_dic(state_timeline_dic,$("#select_state option:first").val()),'state_date_chart');

        for (var i = 0; i < dtlen3; i++)
        {
            var name=city_dic[i].name_key.toString();
            var number=(city_dic[i].value).toString();
            $("#select_city").append("<option value='"+name+"'>城市："+name+"   冲突总数："+number + "</option>");
        }
        $("#select_city").change(function() {process_dic_to_datechart(get_needed_date_dic(city_timeline_dic,$("#select_city").val()),'city_date_chart')});
        process_dic_to_datechart(get_needed_date_dic(city_timeline_dic,$("#select_city option:first").val()),'city_date_chart');
        ///////////////////////////
        if(country_timeline_dic!=""){
        	var country_data = groupByDate(country_timeline_dic,'country');
	        var date1 = country_data.seq[0];
	        document.getElementById("country_date").value = date1.slice(0,4)+"年"+date1.slice(4,6)+"月"+date1.slice(6,8)+"日";
	        process_dic_to_bubblemap(country_data.get(0), 'bubble_country');
	        var len1 = country_data.count;///
	        var pos1 = 0;
	        $('#country_start').click(function() {
	            countryPlay = setInterval(function(){
	                if(pos1==len1){// 到了最后一个则又重复执行
	                    pos1 = 0;
	                }
	                else{
	                    var date1 = country_data.seq[pos1];
	                    document.getElementById("country_date").value = date1.slice(0,4)+"年"+date1.slice(4,6)+"月"+date1.slice(6,8)+"日";
	                    process_dic_to_bubblemap(country_data.get(pos1), 'bubble_country');
	                    pos1++;
	                }
	            },1000);// 每1秒执行一次
	            timeArray.push(countryPlay);
	        });
	        $('#country_stop').click(function() {
	            clearInterval(countryPlay);
	        });
        }else{
        	$("#bubble_country").html("");
        }
        
        //////////////////////////
        if(state_timeline_dic!=""){
        	var state_data = groupByDate(state_timeline_dic,'state');
	        var date2 = state_data.seq[0];
	        document.getElementById("state_date").value = date2.slice(0,4)+"年"+date2.slice(4,6)+"月"+date2.slice(6,8)+"日";
	        process_dic_to_bubblemap(state_data.get(0), 'bubble_state');
	        var len2 = state_data.count;///
	        var pos2 = 0;
	        $('#state_start').click(function() {
	            statePlay = setInterval(function(){
	                if(pos2==len2){// 到了最后一个则又重复执行
	                    pos2 = 0;
	                }
	                else{
	                    var date2 = state_data.seq[pos2];
	                    document.getElementById("state_date").value = date2.slice(0,4)+"年"+date2.slice(4,6)+"月"+date2.slice(6,8)+"日";
	                    process_dic_to_bubblemap(state_data.get(pos2), 'bubble_state');
	                    pos2++;
	                }
	            },1000);// 每1秒执行一次
	            timeArray.push(statePlay);
	        });
	        $('#state_stop').click(function() {
	            clearInterval(statePlay);
	        });
        }else{
        	$("#bubble_state").html("");
        }
        
        /////////////////////////
        if(city_timeline_dic!=""){
        	var city_data = groupByDate(city_timeline_dic,'city');
	        var date3 = city_data.seq[0];
	        document.getElementById("city_date").value = date3.slice(0,4)+"年"+date3.slice(4,6)+"月"+date3.slice(6,8)+"日";
	        process_dic_to_bubblemap(city_data.get(0), 'bubble_city');
	        var len3 = city_data.count;///
	        var pos3 = 0;
	        $('#city_start').click(function() {
	            cityPlay = setInterval(function(){
	                if(pos3==len3){// 到了最后一个则又重复执行
	                    pos3 = 0;
	                }
	                else{
	                    var date3 = city_data.seq[pos3];
	                    document.getElementById("city_date").value = date3.slice(0,4)+"年"+date3.slice(4,6)+"月"+date3.slice(6,8)+"日";
	                    process_dic_to_bubblemap(city_data.get(pos3), 'bubble_city');
	                    pos3++;
	                }
	            },1000);// 每1秒执行一次
	            timeArray.push(cityPlay);
	        });
	        $('#city_stop').click(function() {
	            clearInterval(cityPlay);
	        });
        }else{
        	$("#bubble_city").html("");
        }
        

        function get_needed_date_dic(date_dic,name) {
            var len=date_dic.length;
            var res=[];
            for (var i = 0; i < len; i++)
            {
                if(date_dic[i].name_key==name){
                    res.push({"key":date_dic[i].date,"value":date_dic[i].value});
                }
            }
            return res;
        }
        function groupByDate(data,type) {
            var ret = {values: {}, seq:[]};
            var minValue, maxValue;
            data.forEach(function(e) {
                var c;
                if (type=='country'){
                    c = {
                        lat: e.lat,
                        long: e.long,
                        key: e.name_key,
                        color: e.value > 200 ? 'red' : (e.value > 100 ? '#ff4500' : (e.value > 50 ? 'green' : 'limegreen')),
                        value: e.value
                    };
                }
                else {
                    c = {
                        lat: e.lat,
                        long: e.long,
                        key: e.name_key,
                        color: e.value > 20 ? 'red' : (e.value > 10 ? '#ff4500' : (e.value > 5 ? 'green' : 'limegreen')),
                        value: e.value
                    };
                }
                minValue = minValue ? e.value : Math.min(minValue, e.value);
                maxValue = maxValue ? e.value : Math.max(maxValue, e.value);
                if (!(e.date in ret.values)) {
                    ret.values[e.date] = [];
                    ret.seq.push(e.date);
                }
                ret.values[e.date].push(c);
            });
            ret.seq.sort();
            ret.count = ret.seq.length;
            ret.get = function(idx) {
                return this.values[this.seq[idx]];
            };
            ret.minValue = minValue;
            ret.maxValue = maxValue;
            return ret;
        }
    }
    </script>
</html>