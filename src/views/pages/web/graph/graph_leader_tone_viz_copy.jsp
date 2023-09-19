<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>人物情感分析</title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/style.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath %>/static/lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/combo.select.css">
<link rel="stylesheet"	href="<%=basePath%>/static/css/perfect-scrollbar.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/base/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/base/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/base/base.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/css/event_result.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/js/amcharts/export/export.css"/>
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
<style>
    .carousel{
        white-space: nowrap;   
        width: 100%; 
        height: 260px; 
        position: relative;
    }
    .carousel_ul_box{
         width:99%; 
        position:absolute;
        left:15px;
        top:34px;
        overflow:hidden;
    }
    .carousel_ul_box ul{
        width:318px;
        margin-right:3px;
        display:inline-block;
        overflow: hidden;
    }
    .carousel_ul_box ul li{
        margin-bottom:10px;
        border:2px solid #b9b9b9;
        float:left;
    }
    .carousel_ul_box ul li.act{
        border:3px solid #fcd202;
    }
    .li_item_l{
    	/* width:90px; */
        float:left;
        background:#deebf7;
        height:78px;
    }
    .li_item_img {
        /* width:64px; */
        margin-top:10px;
        margin-left:10px;
        width:90px;
        height:52px;
        float:left;
    }
    .li_item_img img{
        width:90px;
        height:52px;
    }
    .li_item_key{
        float:left;
        margin-left:10px;
        padding-right:10px;
    }
     .li_item_key p{
        margin:0px;
        color:#2f597d;
    }
    .li_item_r{
        float:left;
        background:#f3f8fd;
        width:140px;
    }
    .li_item_r p{
         margin:0px;
         color:#497ca7;
         border-bottom:1px solid #98bbd8;
         padding-left:10px;
         overflow:hidden;
         text-overflow:ellipsis;
         white-space:nowrap;
    }
    .li_item_r p:nth-child(4){
         border-bottom:none;
    }
    .block{
        display:block!important;
    }
    .none{
        display:none!important;
    }
    .li_item_p{
    	width:90px;
    	float:left;
    	text-align:center;
    	color: #497ca7;
    }
     #seach_coutry_name_inp{
    	width:200px;
    	height:28px; 
    	line-height:28px; 
    	padding-left:10px; 
    	border:1px solid #ccc; color:#000;
    }
    #seach_coutry_name_btn{
    	width:60px; 
    	height:28px; 
    	line-height:28px; 
    	display:inline-block; 
    	border:1px solid #ccc; 
    	cursor:pointer;
    	text-align:center;
    }
    #next_coutry_btn{
    	display:none; 
    	border:1px solid #ccc; 
    	cursor:pointer;
    }
    #next_coutry_btn{
    	width:60px; 
    	height:28px; 
    	line-height:28px; 
    	display:inline-block; 
    	border:1px solid #ccc; 
    	cursor:pointer;
    	text-align:center;
    	display:none;
    }
</style>
<body>
	<div class="index_top clearfix">
		<h3 class="fl title">图谱库分析 > 人物情感分析</h3>
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
			  <input type="hidden" id="moduleCode" value="${moduleCode}">
              <div class="col-md-12 carousel">
             	<div>
             		<select class="selectCounts" style="height:28px;border: 1px solid #ccc;" id="selectPXFS">
             			<option value="1">按情感值排序</option>
             			<option value="2">按人物名称排序</option>
             		</select>
             		<input id="seach_coutry_name_inp"  type="text" placeholder="请输入想要查询的人物名称">
             		<span  id="seach_coutry_name_btn" >搜索</span>
             		<span id="next_coutry_btn" >下一个</span>
             		<div  class="help" onmouseover="showChartInfo(1,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
             	</div>
                <div id = "country_list_div" class="carousel_ul_box"></div>
             </div>
        <div class="row">
            <div class="col-md-12  mg_b"  style="margin-top:130px;" >
            	<div class="col-md-12 bor">
	                <div class="col-md-12 map-text">
	                    <h3>人物情感线
	                    	<div  class="help" onmouseover="showChartInfo(2,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
	                    </h3>
	                </div>
	                <div id="amcharts_box" class="col-md-12">
	                      <div id="line_eachart" class="amcharts"></div>
	                </div>
                </div>
            </div>
        </div>
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
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>2</td>
						<td><span class="sort sort2">2</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>3</td>
						<td><span class="sort sort3">3</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>3</td>
						<td><span class="sort sort7">4</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>5</td>
						<td><span class="sort sort7">5</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>6</td>
						<td><span class="sort sort7">6</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>7</td>
						<td><span class="sort sort7">7</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>8</td>
						<td><span class="sort sort7">8</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>9</td>
						<td><span class="sort sort7">9</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
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
						<td><img src="<%=basePath %>/static/images/state2.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>11</td>
						<td><span class="sort sort10">11</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq2.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>12</td>
						<td><span class="sort">12</span></td>
						<td><!-- <img class="gq" src="../<%=basePath %>/static/images/gq.png" alt="挂起"> --></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state3.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
				</tbody>
			</table>
			<div id="Pagination" class="pagination"><!-- 这里显示分页 --></div>
			<div id="Searchresult">分页初始化完成后这里的内容会被替换。</div>
		</div>  --%>
		
	<!-- 条件tab页 st -->
	<jsp:include page="graph_tab1.jsp"></jsp:include>
	</div>
	<jsp:include page="../updateUserPassword.jsp"/>
</body>
<script src="<%=basePath %>/static/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath %>/static/lib/jquery.pagination.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-select.min.js"></script>
<script src="<%=basePath %>/static/js/jquery.combo.select.js"></script>
<script src="<%=basePath %>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath %>/static/js/perfect-scrollbar.js"></script>
<script src="<%=basePath %>/static/js/sec2.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/Visualization/base/base.js"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/amcharts.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/themes/light.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amchart_util.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/ammap.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/ammap_util.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/export/export.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/Visualization/js/amcharts/serial.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/echarts.js"></script>
<script src="<%=basePath%>/static/js/config/config.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
<c:if test="${bgFlag == null or bgFlag == 1}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
</c:if>
<!-- 人工查询js -->
<script src="<%=basePath %>/static/Visualization/rgQuery.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/downLoad.js"></script>
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<script type="text/javascript">
	$(function(){
		
		/* //美化图表展示界面的右侧滚动条
		index_bottom_perfectScrollbar(); */
		
		$('#country_list_div').perfectScrollbar({
	    	useBothWheelAxes: true
	    });
		/*  */
		 function drawChart(n){
		    var seach_coutry_name_inp_val = $("#seach_coutry_name_inp").val();
      		var key = $("#country_list_div li.li_item:contains("+seach_coutry_name_inp_val+")").eq(n).children(".li_item_r").children("p").eq(0).html();
      		//点击搜索之后，图表中如果存在，不需要加入图表
      		for(var i in legend_data){
       			if(legend_data[i]==key){
       				return;
       			}
       		}
    		legend_data.push(key);
    		for(var i in data_data){
    			if(key==data_data[i].key){
    				var data_s = {}; 
    				data_s["name"] =data_data[i].key; 
    				data_s["type"] ='line'; 
    				data_s["data"] = data_data[i].value;
    				series_data.push(data_s);
    				break;
    			 }
    		}
        	$(this).addClass("act")
        	init_line_chart(legend_data,country_time_data,series_data);
		}
		
		$("#seach_coutry_name_btn").on("click",function (){
			var seach_coutry_name_inp_val = $("#seach_coutry_name_inp").val();
			var seach_coutry_length = $("#country_list_div li.li_item:contains("+seach_coutry_name_inp_val+")").length;
			var now_scroll_left = $("#country_list_div").scrollLeft();
			var scroll_left = $("#country_list_div li.li_item:contains("+seach_coutry_name_inp_val+")").eq(0).offset().left;
			$("#country_list_div li.li_item").removeClass("act");
			if(seach_coutry_length == 1){
				$("#next_coutry_btn").css({"display":"none"});
				drawChart(0);
				if(now_scroll_left == 0){
					$("#country_list_div li.li_item:contains("+seach_coutry_name_inp_val+")").eq(0).addClass("act");
					$("#country_list_div").animate({scrollLeft:scroll_left - 22},800);
				}
				if(scroll_left > 0){
					$("#country_list_div li.li_item:contains("+seach_coutry_name_inp_val+")").eq(0).addClass("act");
					$("#country_list_div").animate({scrollLeft:scroll_left + now_scroll_left - 22},800);
				}
				if(scroll_left < 0){
					$("#country_list_div li.li_item:contains("+seach_coutry_name_inp_val+")").eq(0).addClass("act");
					$("#country_list_div").animate({scrollLeft:now_scroll_left + scroll_left - 22},800);
				}
			}else{
				$("#next_coutry_btn").css({"display":"inline-block"});
				drawChart(0);
				var seach_coutry_arr = [];
				for(var i = 0; i < seach_coutry_length; i++){
					seach_coutry_arr.push($("#country_list_div li.li_item:contains("+seach_coutry_name_inp_val+")").eq(i).offset().left)
				}
				$("#country_list_div li.li_item:contains("+seach_coutry_name_inp_val+")").eq(0).addClass("act");
				$("#country_list_div").animate({scrollLeft:now_scroll_left + seach_coutry_arr[0] - 22},800);
				var n = 0;
				$("#next_coutry_btn").on("click",function (){
						n++;
						$("#country_list_div li.li_item:contains("+seach_coutry_name_inp_val+")").eq(n).addClass("act");
						$("#country_list_div").animate({scrollLeft:seach_coutry_arr[n] + now_scroll_left - 22},800);
						drawChart(n);
						if(n == seach_coutry_length - 1){
							n=0;
						}
				})
			}
		})
		
		 series_data = [];
		 legend_data = [];
		
        $(".carousel_ul_box").on("click","li",function(){
        	if($(this).hasClass("act")){
        		var key = $(this).children(".li_item_r").children("p").eq(0).html();
        		//数组删除元素
        		Array.prototype.remove=function(dx) 
        		{ 
        		  if(isNaN(dx)||dx>this.length){return false;} 
        		  for(var i=0,n=0;i<this.length;i++) 
        		  { 
        		    if(this[i]!=this[dx]) 
        		    { 
        		      this[n++]=this[i] 
        		    } 
        		  } 
        		  this.length-=1 
        		}
        		//删除
        		for(var i in legend_data){
        			if(legend_data[i]==key){
        				legend_data.remove(i);
        				series_data.remove(i);
        				break;
        			}
        		}
        		$(this).removeClass("act")
        		init_line_chart(legend_data,country_time_data,series_data);
            	
            }else{
            	var key = $(this).children(".li_item_r").children("p").eq(0).html();
        		legend_data.push(key);
        		for(var i in data_data){
        			if(key==data_data[i].key){
        				var data_s = {}; 
        				data_s["name"] =data_data[i].key; 
        				data_s["type"] ='line'; 
        				data_s["data"] = data_data[i].value;
        				series_data.push(data_s);
        				break;
        			 }
        		}
            	init_line_chart(legend_data,country_time_data,series_data);
            	$(this).addClass("act")
            	
            }
        })
       //处理配置
	   handleConfigs();
       //美化滚动条
       glorifyComboSelect();
	});
	
	
	//渲染图表（graph_leader_tone_viz修改为对应的模块）
	function render(configId){
		var resultcode = 'ALL';
		startLoad();
		$.ajax({
			url:'<%=basePath%>/search/graph_leader_tone_viz/'+configId,
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
		$("#country_list_div").empty();
		series_data = [];
		legend_data = [];
		//回显国家信息数据		
		 var data_reult;
		 data_reult = data.data1;
		 if(data_reult.length==0){
			 $("#country_list_div").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
			 $("#selectPXFS").attr("disabled","disabled");
		 }else{
			 $("#selectPXFS").removeAttr("disabled");
			 $("#country_list_div").html("");
		 }
		//加载人物显示列表 
		 for(var item_one in data_reult){
			var data_html ="<ul>";
			for(var item_two in data_reult[item_one]){
				 data_html += "<li class='li_item clearfix'>"+
									"<div class='li_item_l clearfix'>"+
										"<div class='li_item_img'>"+
											"<img src='<%=basePath %>/static/Visualization/img/flags/"+data_reult[item_one][item_two].country_Code.toLowerCase()+"-lgflag.gif' alt=''>"+
										"</div>"+
										"<div class='li_item_key'>"+
	                                       "<p>Name</p>"+
	                                        "<p>Country</p>"+
	                                        "<p>Tone</p>"+
                                   		 "</div>"+
									"</div>"+
									"<div class='li_item_r clearfix'>"+
										"<p style='display: none;'>"+data_reult[item_one][item_two].key

							+"</p>"+
										"<p title='"+data_reult[item_one][item_two].Name+"'>"+data_reult[item_one][item_two].Name+"</p>"+
										"<p title='"+data_reult[item_one][item_two].Country+"'>"+data_reult[item_one][item_two].Country+"</p>"+
										"<p title='"+data_reult[item_one][item_two].Tone+"'>"+data_reult[item_one][item_two].Tone+"</p>"+
									"</div>"+
								"</li>"
			}
			data_html+="</ul>"
			$("#country_list_div").append(data_html);
		} 
		//动态日期
		country_time_data =data.date;
		//动态
		$("#selectPXFS").change(function () {
			$("#country_list_div").empty();
			if($("#selectPXFS option:selected").val()==1){
				data_reult = data.data1;
			}
			if($("#selectPXFS option:selected").val()==2){
				data_reult = data.data2;
			}
			//加载人物显示列表 
			 for(var item_one in data_reult){
				var data_html ="<ul>";
				for(var item_two in data_reult[item_one]){
					 data_html += "<li class='li_item clearfix'>"+
										"<div class='li_item_l clearfix'>"+
											"<div class='li_item_img'>"+
												"<img src='<%=basePath %>/static/Visualization/img/flags/"+data_reult[item_one][item_two].country_Code.toLowerCase()+"-lgflag.gif' alt=''>"+
											"</div>"+
											"<div class='li_item_key'>"+
		                                       "<p>Name</p>"+
		                                        "<p>Country</p>"+
		                                        "<p>Tone</p>"+
	                                   		 "</div>"+
										"</div>"+
										"<div class='li_item_r clearfix'>"+
											"<p style='display: none;'>"+data_reult[item_one][item_two].key

								+"</p>"+
								"<p title='"+data_reult[item_one][item_two].Name+"'>"+data_reult[item_one][item_two].Name+"</p>"+
								"<p title='"+data_reult[item_one][item_two].Country+"'>"+data_reult[item_one][item_two].Country+"</p>"+
								"<p title='"+data_reult[item_one][item_two].Tone+"'>"+data_reult[item_one][item_two].Tone+"</p>"+
										"</div>"+
									"</li>"
				}
				data_html+="</ul>"
				$("#country_list_div").append(data_html);
			}
		});
		 data_data =data.leader;
		//拼接数据
		init_line_chart(legend_data,country_time_data,series_data);
	}
	//渲染图表
	function init_line_chart(legend_data,country_time_data,series_data){
		var myEachart = echarts.init(document.getElementById('line_eachart'));
		var option = {
			    tooltip: {
			        trigger: 'axis'
			    },
			    legend: {
			        data:legend_data
			    },
			    grid: {
			        left: '3%',
			        right: '4%',
			        bottom: '3%',
			        containLabel: true
			    },
			    toolbox: {
			        feature: {
			            saveAsImage: {}
			        }
			    },
			    xAxis: {
			        type: 'category',
			        boundaryGap: false,
			        data: country_time_data//横坐标数据
			    },
			    yAxis: {
			        type: 'value'
			    },
			    series: series_data
			};
		myEachart.setOption(option);
	}
	function init_line_chart_scale(lineData,key){
		var idd = "line_eachart_scale"+key;
		var myEachart = echarts.init(document.getElementById(idd));
		var option = {
			    tooltip: {
			        trigger: 'axis',
			        axisPointer: {type: 'cross'}
			    },
			    toolbox: {
			        feature: {
			            dataView: {show: true, readOnly: false},
			            saveAsImage: {show: true}
			        }
			    },
			    legend: {
			        data: ['大类一', '大类二', '大类三', '大类四', '稳定值']
			    },
			    xAxis: [
			        {
			            type: 'category',
			            data: country_time_data
			        }
			    ],
			    yAxis: [
			        {
			            type: 'value',
			            name: '稳定值',
			            min: 0,
			            max: 250,
			            interval: 50,
			            axisLabel: {
			                formatter: '{value} '
			            }
			        },
			        {
			            type: 'value',
			            name: '事件数',
			            min: 0,
			            max: 25,
			            interval: 5,
			            axisLabel: {
			                formatter: '{value} '
			            }
			        }
			    ],
			    series:lineData
			};
		myEachart.setOption(option);
	}
</script>
</html>