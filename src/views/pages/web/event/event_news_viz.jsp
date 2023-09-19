<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>事件新闻展示</title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/style.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/combo.select.css">
<link rel="stylesheet" href="<%=basePath%>/static/lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/perfect-scrollbar.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css"  media="all"></link>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/base.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/css/event_result.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/js/amcharts/export/export.css"/>
<link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/actormap.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window_zs.css"/><!-- 弹出提示框样式 -->
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
<link rel="stylesheet" href="<%=basePath %>/static/css/event_news.css"/>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/jquery-1.11.1.min.js"></script>
<script src="<%=basePath%>/static/js/config/config.js"></script>
<script src="<%=basePath%>/static/lib/jquery.pagination.js"></script>
<style>
	svg.wordCloud {
    width: 1000px;
    height: 500px;
	}
	svg.wordCloud g {
    transform: translate(500px, 250px);
    -moz-transform: translate(500px, 250px);
    -webkit-transform: translate(350px, 250px);
	}
	
	/*分页插件样式*/
	.layui-laypage-fr{
	  float: right;
	  margin-right: 15px;
	}
	.layui-laypage-fr a, .layui-laypage-fr span {
	  /* background-color: rgba(26,68,109,0.5); */
	  border: 1px solid #3676e0;
	  color:#000000;
	}
	.layui-laypage-fr button, .layui-laypage-fr input {
	  /* background-color: rgba(26,68,109,0.5); */
	  border: 1px solid #3676e0;
	  color:#000;
	}
	.layui-laypage-fr select {
	  /* background-color: rgba(26,68,109,0.5); */
	  border: 1px solid #3676e0;
	  color:#000;
	}
	.pic-div{
		width: 742px;
	    word-break: break-all;
	    word-wrap: break-word;
			
	}
	#page{
		height: 30px;
    	text-align: center;
	}
</style>
</head>
<body>
	<div class="index_top clearfix">
		<h3 class="fl title">事件库分析 > 事件新闻展示</h3>
	</div>
	<div class="index_bottom">
		<div class='shrinkage-btn' id='shrinkage-btn'></div>
		<!-- 显示图 -->
		<div class="data show" >
			<input type="hidden" id="moduleCode" value="${moduleCode}">
			<div class="row">
				<div class="col-md-12">
		            <div class="col-md-12 bor" style="margin-top: 16px;">
		                <div class="col-md-12 map-text">
		                    <h3 class="tx-c"><span class="one" style="font-size: 13px;">网站新闻量展示</span>
		                    	<select class="selectCounts" style="margin-left:10px;" id="selectCountry"></select>
								<div  class="help" onmouseover="showChartInfo(1,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
							</h3>
		                </div>
		                <div class="col-md-12">
		                    <div id="column_chart" class="amcharts oneColumChart"></div>
		                </div>
		            </div>
		        </div>
	        </div>
           	<div class="row" id="newsLoadDiv" style="position:relative">
	            <div class="col-md-12 mg_t mg_b" >
		            <div class="col-md-10  " style="border: 1px solid #CCCCCC; border-radius:3px;width:100%; float:right;">
		                <div class="col-md-12 ">
		                    <h3 class="tx-c" >新闻展示
		                    	<div class="help" onmouseover="showChartInfo(2,this,${moduleCode},${sessionScope.LOGINUSER.roleId})"></div>
		                    </h3>
		                    <div class="text-right senior-search">
		                     <ins class='ins1'>高级查询</ins>
		                     <span>》</span>
		                     <div class='container triangle'>
		                     	<input class="form_condtion" type="hidden" id="eventidsCount"/><!-- 事件ID集总记录数 -->
		                     	<input class="form_condtion" type="hidden" id="eventidsTableName"/><!-- 事件ID集表名称 -->
		                     	<input class="form_condtion" type="hidden" id="nextPageIndex" value="0"/><!-- 事件ID集表名称 -->
		                     	<div class='row'>
		                     		<label>文档采集时间：</label>
		                     		<input class="form_condtion" type='text' name="st_o_gt" id="st_o_gt" type="text" readonly />
		                     		<span>~</span>
		                     		<input class="form_condtion" type='text' name="end_o_gt" id="end_o_gt" type="text" readonly />
		                     	</div>
		                     	<div class='row'>
		                     		<label>文档发布时间：</label>
		                     		<input class="form_condtion" type='text'  name="st_s_pt" id="st_s_pt" type="text" readonly />
		                     		<span>~</span>
		                     		<input class="form_condtion" type='text'  name="end_s_pt" id="end_s_pt" type="text" readonly />
		                     	</div>
		                     	<div class='row'>
		                     		<label>文档作者：</label>
		                     		<input class="form_condtion" type='text' name="s_au" id="s_au" />
		                     		<label>网站名称：</label>
		                     		<input class="form_condtion" type='text' name="i_sn" id="i_sn"/>
		                     		<!-- <label>文档摘要：</label>
		                     		<input type='text' name="" id="" /> -->
		                     	</div>
		                     	<div class='row'>
		                     		<label>文档URL：</label>
		                     		<input class="form_condtion" type='text' name="o_url" id="o_url" />
		                     		<label>文档标题：</label>
		                     		<input class="form_condtion" type='text' name="s_title" id="s_title" />
		                     		<!-- <label>信源名称：</label>
		                     		<input type='text' name="" id="" /> -->
		                     	</div>
		                     	<div class='row'>
		                     		<label>文档正文：</label>
		                     		<input class="form_condtion" type='text' name="s_cont" id="s_cont" />
		                     		<!-- <label>文档抽取配置：</label>
		                     		<select class="selectCounts" name="" id="">
		                     			<option value="0">全部</option>
		                     			<option value="1">手动</option>
		                     			<option value="2">自动</option>
		                     		</select> -->
		                     	</div>
		                     	<div class='row sousuo-wrap'>
		                     		<input type='button' onclick="highGradeSearch()" value='高级搜索' />
		                     	</div>
		                     </div>
		                    </div>
		                    <form class="news-show-form" >
		                    	<div class="clearfix" style="display:none;"><!-- 暂时注释 -->
							      <label for="#exampleInputAmount" class="pull-left">关键字查询:</label>
							      <input class="pull-left col-md-3" type="text" id="exampleInputAmountm" >
							      <div class="pull-left search"></div>
							    </div>
		                    </form>
		                   <div class="newsBody" style="min-height: 450px;">
		                   		<h3 style="color: #c1c0c0;">共为您找到相关新闻<span id="newsCount"></span>个 </h3>
			                   	<!-- <div class='search-content clearfix'>
			                    	<div class='title55'>
			                    		dUN Says Neagotiating With Syria, <span>Russia</span> On Visit To Syria Site
			                    	</div>
			                    	<div class='clearfix' style='margin:12px 0;'>
			                    		<div class='pull-left'>
			                    			<span class='web-site'>网站：</span>
			                    			<span>www.azfamily.com</span>
			                    		</div>
			                    		<div class='pull-left'>
			                    			<span class='release-time'>发布时间：</span>
			                    			<span>2018-04-28 09:47:10</span>
			                    		</div>
			                    	</div>
			                    	<p class='search-content-text'>
			                    		A team from the United Nations is discussing security arrangements with Syrian and Russian authorities in Syria to allow experts access to the town of Douma to rt investigate an alleged chemical-weapons attack, UN officials say.\nThe remarks on April 18 came after the director-general of the Organizatioiifg
			                    	</p>
			                    	<button class='pull-right details'>查看详情</button>
			                    </div>
			                    <div class='search-content clearfix'>
			                    	<div class='title55'>
			                    		dUN Says Neagotiating With Syria, <span>Russia</span> On Visit To Syria Site
			                    	</div>
			                    	<div class='clearfix' style='margin:12px 0;'>
			                    		<div class='pull-left'>
			                    			<span class='web-site'>网站：</span>
			                    			<span>www.azfamily.com</span>
			                    		</div>
			                    		<div class='pull-left'>
			                    			<span class='release-time'>发布时间：</span>
			                    			<span>2018-04-28 09:47:10</span>
			                    		</div>
			                    	</div>
			                    	<p class='search-content-text'>
			                    		A team from the United Nations is discussing security arrangements with Syrian and Russian authorities in Syria to allow experts access to the town of Douma to rt investigate an alleged chemical-weapons attack, UN officials say.\nThe remarks on April 18 came after the director-general of the Organizatioiifg
			                    	</p>
			                    	<button class='pull-right details'>查看详情</button>
			                    </div>
			                    <div class='search-content clearfix'>
			                    	<div class='title55'>
			                    		dUN Says Neagotiating With Syria, <span>Russia</span> On Visit To Syria Site
			                    	</div>
			                    	<div class='clearfix' style='margin:12px 0;'>
			                    		<div class='pull-left'>
			                    			<span class='web-site'>网站：</span>
			                    			<span>www.azfamily.com</span>
			                    		</div>
			                    		<div class='pull-left'>
			                    			<span class='release-time'>发布时间：</span>
			                    			<span>2018-04-28 09:47:10</span>
			                    		</div>
			                    	</div>
			                    	<p class='search-content-text'>
			                    		A team from the United Nations is discussing security arrangements with Syrian and Russian authorities in Syria to allow experts access to the town of Douma to rt investigate an alleged chemical-weapons attack, UN officials say.\nThe remarks on April 18 came after the director-general of the Organizatioiifg
			                    		A team from the United Nations is discussing security arrangements with Syrian and Russian A team from the United Nations is discussing security arrangements with Syrian and Russian 
			                    	</p>
			                    	<button class='pull-right details'>查看详情</button>
			                    </div> -->
		                   </div>
		                   <div id="page">
		                   		<span style="font-size: 24px;cursor:pointer;" onclick="loadMoreNews()">加载更多<span style="font-size: 12px;">剩余<span id="remainNumber">0</span>条可加载</span></span>
		                   </div>
		                </div>
		                <div id="date_chart" class="amcharts oneColumChart" ></div>
		            </div>
	            </div>
            </div>
	   	</div>
	<!-- 页面底部收缩 -->
		<jsp:include page="event_tab1.jsp"></jsp:include>
	<!-- 页面底部收缩结束 -->
	</div>
	<jsp:include page="../updateUserPassword.jsp"/>
	<div class='dialog-wrap'>
		<div class='dialog-content'>
			<img alt="" style="float: right;cursor: pointer;" onclick="close_Dialog_content()" src="<%=basePath %>/static/images/close_news.png">
			<p class='dialog-content-head' id="xq_s_title"></p>
			<table style='width:100%;table-layout: fixed;'>
				<tr>
					<td class='right' style="width: 69px;">网站名称：</td>
					<td id="xq_i_sn" class='text-emphasis' style="width: 200px;"></td>
					<td class='right' style="width: 67px;">文档作者：</td>
					<td id="xq_s_au" class='text-emphasis'  style="width: 200px;"></td>
					<td class='right' style="width: 67px;">采集时间： </td>
					<td id="xq_o_gt"  style="width: 140px;"></td>
				</tr>
				<tr>
					<td class='right' style="width: 69px;">信源名称： </td>
					<td class='text-emphasis' style="width: 200px;">暂无</td>
					<td class='right' style="width: 67px;">抽取方式：</td>
					<td class='text-emphasis' style="width: 200px;">暂无</td>
					<td class='right' style="width: 68px;" >发布时间：</td>
					<td id="xq_s_pt" style="width: 140px;"></td>
				</tr>
				<tr>
					<td class='right'>对应URL：  </td>
					<td class='' id="xq_o_url" colspan="6" ></td>
				</tr>
			</table>
				<div class='content custom-scrollbar' id="xq_s_cont"></div>	
			<div class='clearfix' style='margin-top:10px;line-height:20px;'>
				<div class='pull-left'>图片URL地址集合:</div>
				<div id="xq_s_pic"  class='pull-left custom-scrollbar' style='margin-left:20px;height: 100px;overflow:auto;'>
					<!-- <div>
						<a href='javascript:;'>http://img8.irna.ir/1397/13970129/82890634/n82890634-72293922.j</a>
					</div>
					<div>
						<a href='javascript:;'>http://img8.irna.ir/1397/13970129/82890634/n82890634-72293922.j</a>
					</div>
					<div>
						<a href='javascript:;'>http://img8.irna.ir/1397/13970129/82890634/n82890634-72293922.j</a>
					</div> --> 
				</div>
			</div>
		</div>
	</div>
</body>
<script src="<%=basePath%>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath%>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
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
<script src="<%=basePath%>/static/Visualization/datamap/d3.min.js"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/serial.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/pie.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/xy.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
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
<script src="<%=basePath%>/static/js/jquery.combo.select.js"></script>
<script src="<%=basePath%>/static/js/perfect-scrollbar.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/downLoad.js"></script>	
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<script type="text/javascript">
		
	$(function(){
		/* 弹窗展示内容过长问题 */
		function Val(){ 
			this.emphasis=$(".text-emphasis")
			this.xq_o_url=$("#xq_o_url")
			this.bindEvent()
		}
		Val.prototype={
				 bindEvent:function (){
					var self=this;
					 this.emphasis.click(function (e){
						  e.stopPropagation()
						  self.getVal(this)  
					}) 
					this.xq_o_url.click(function (e){
						  e.stopPropagation()
						  self.getVal(this)  
						}) 
				},
				getVal:function (This){
					var val=$(This).html();
					layer.open({
						  title: '内容'
						  ,content: val
						}); 
				}
		}
		var val=new Val()
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
				//如果当前日期大于结束日期 将结束日期的值同开始时间设置相同
				if($(this).val() > $('.day2').val()){
			    	$('.day2').val($(this).val());
			    }else if(datedifference($(this).val(), $('.day2').val())>7){//如果两个时间间距相差7天，将结束日期的值设置为开始时间
					$('.day2').val($(this).val());
					$('.day2').datepicker('setDate',$(this).val());
				}				
				//计算结束时间的最大值
			    setEndTime = getDateByDayCounts(e.date,6);
				//将结束时间的最大值赋为开始时间的后6天、最小值设置为起始值
			    $('.day2').datepicker('setEndDate',setEndTime);			   
			    $('.day2').datepicker('setStartDate','${minDate[2]}');
						    
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
			}else if(datedifference($(this).val(), $('.day1').val())>7){
				$('.day1').val($(this).val());
				$('.day1').datepicker('setDate',$(this).val());
			}			
			
			setStartTime = getDateByDayCounts(e.date,-6);
			$('.day1').datepicker('setStartDate',setStartTime);
			$('.day1').datepicker('setEndDate','${maxDate[2]}');
				
		});
		
		//两个时间相差天数 兼容firefox chrome
	    function datedifference(sDate1, sDate2) {//sDate1和sDate2是2006-12-18格式  
	        var dateSpan,tempDate,iDays;
	        sDate1 = Date.parse(sDate1);
	        sDate2 = Date.parse(sDate2);
	        dateSpan = sDate2 - sDate1;
	        dateSpan = Math.abs(dateSpan);
	        iDays = Math.floor(dateSpan / (24 * 3600 * 1000));
	        return iDays
	    };
	    
	    //获取当前日期的前、后几日的日期（负数表示前几日、0表示今日、正数表示后几日）
		function GetDateStr(AddDayCount) { 
			var dd = new Date(); 
			dd.setDate(dd.getDate()+AddDayCount);//获取AddDayCount天后的日期 
			var y = dd.getFullYear(); 
			var m = dd.getMonth()+1;//获取当前月份的日期 
			var d = dd.getDate(); 
			return y+"-"+m+"-"+d; 
		}
		//获取指定时间的前、后几日的日期（负数表示前几日、0表示今日、正数表示后几日）
		function getDateByDayCounts(zdTime,AddDayCount) { 
			var dd = new Date(zdTime);
			dd.setDate(dd.getDate()+AddDayCount);//获取AddDayCount天后的日期 
			return dd;
		}
		
		
		/* 收缩网站新闻量展示 */
		$("#shrinkage-btn").click(function (){
			 $(".bor").slideToggle(); 
		})
		/* 高级查询 */
		$(".ins1").click(function (e){
			$(".triangle").toggle(0,function (){
				var curState=$(this).css('display');
				if(curState=='block'){
					$(".news-show-form").hide();
					console.log(curState);
				}else{
					$(".news-show-form").show();
				}
			});
			
		})
    	
		//采集时间、发布时间的起止时间
		layui.use('laydate', function(){
  			var laydate = layui.laydate;
  			//采集开始
	  		laydate.render({
	  		   elem: '#st_o_gt',
	  		   done: function(value){
		  		    var end_o_gt = $("#end_o_gt").val();
		  		    if(end_o_gt != ""){
		  		    	var st_o_gt_time = Date.parse(value);
		  		    	var end_o_gt_time = Date.parse(end_o_gt);
		  		    	if(st_o_gt_time > end_o_gt_time){
		  		    		$("#st_o_gt").val('');
		  		    		win.alertEx("文档采集开始时间不能大于结束时间");
		  		    	}
		  		    }
	  		  }
	  		});
  			//采集结束
	  		laydate.render({
		  		   elem: '#end_o_gt',
			  	   done: function(value){
			  		    var st_o_gt = $("#st_o_gt").val();
			  		    if(st_o_gt != ""){
			  		    	var end_o_gt_time = Date.parse(value);
			  		    	var st_o_gt_time = Date.parse(st_o_gt);
			  		    	if(st_o_gt_time > end_o_gt_time){
			  		    		$("#end_o_gt").val('');
			  		    		win.alertEx("文档采集结束时间不能小于开始时间");
			  		    	}
			  		    }
			  	   }
	  		});
  			//发布开始
	  		laydate.render({
	  		   elem: '#st_s_pt',
	  		   done: function(value){
	  				var end_o_gt = $("#end_o_gt").val();
	  				if(end_o_gt != ""){
	  					var st_s_pt_time = Date.parse(value);
	  					var end_o_gt_time = Date.parse(end_o_gt);
	  					if(st_s_pt_time > end_o_gt_time){
	  						$("#st_s_pt").val('');
	  						win.alertEx("文档发布开始时间不能大于结束时间");
	  					}
	  				}
	  		  }
	  		});
  			//发布结束
	  		laydate.render({
	  		   elem: '#end_s_pt',
	  		   done: function(value){
	  				var st_o_gt = $("#st_o_gt").val();
	  				if(st_o_gt != ""){
	  					var end_s_pt_time = Date.parse(value);
	  					var st_o_gt_time = Date.parse(st_o_gt);
	  					if(st_o_gt_time > end_s_pt_time){
	  						$("#end_s_pt").val('');
	  						win.alertEx("文档发布结束时间不能小于开始时间");
	  					}
	  				}
	  		   }
	  		});
		});
				
	});
	//获取配置对应数据，并将数据加载展示
	function render(configId){
		//切换配置时将新闻查询条件清空
		$(".form_condtion").each(function () {
              $(this).val('');
        });
		startLoad();
		var resultcode = 'ALL';
		$.ajax({
			url:'<%=basePath%>/search/event_news_viz/'+configId,
			type: 'POST',
			dataType:"json",
			success:function(data){
				if(data=="-1"){
					endLoad();
					win.alertEx("加载失败");
				}
				renderData(data);
			}
		});
	}
	//加载数据展示
	var loadNumber;
	function renderData(data){
		//加载数
		loadNumber = 0;
		//网站新闻量
		var netNews =  data.netNews;
		if(netNews.length>0){
			$("#selectCountry").show();
			$("#selectCountry").html(""); 
			var netNewsLength = netNews.length > 100 ? 100:netNews.length;
			for(var i=5;i<=netNewsLength;i+=5){
				document.getElementById("selectCountry").options.add(new Option(i,i));
			} 
			var	newsOptionCount = $("#selectCountry option").map(function(){return $(this).val();}).get().join(", ");
			if(newsOptionCount.indexOf(15)!=-1){
				$("#selectCountry option[value='15']").attr("selected",true);
				process_dic_to_amchart2(netNews,'column_chart','column_chart',15);
			}else{
				$("#selectCountry").hide();
				process_dic_to_amchart2(netNews,'column_chart','column_chart',netNewsLength);
			}
			$("#selectCountry").change(function () {
	        	var changeValue = $("#selectCountry option:selected").val();
        		process_dic_to_amchart2(netNews,'column_chart','column_chart',changeValue);
	        });
		}else{
			$("#selectCountry").hide();
			$("#column_chart").html('<img alt="" class="tubiao1"  src="<%=basePath %>/static/images/tubiao2.png">');
		}
		//查询新闻
		$("#eventidsTableName").val(data.eventidsTableName);
		$("#eventidsCount").val(data.eventidsInsertDbNum);
		$("#newsCount").text(data.newsCount);//data.newsCount
		initPageParam();
		getPageNewsList(false,1);
		
	} 
	//关闭查看详情页面
	function close_Dialog_content(){
		$(".dialog-wrap").hide();
	}
	/* 查看详情 */
	function ckDetails(_id){
		startLoad();
		$.ajax({
			url:'<%=basePath%>/news/getNewsById',
			type: 'POST',
			data:{"id":_id},
			dataType:"json",
			success:function(data){
				if(data.flag){
					var news = data.news;
					$("#xq_s_title").text(news.s_title);
					$("#xq_i_sn").text(news.i_sn);
					$("#xq_s_au").text(news.s_au);
					$("#xq_o_gt").text(news.formt_o_gt);
					$("#xq_s_pt").text(news.formt_s_pt);
					$("#xq_o_url").text(news.o_url);
					$("#xq_s_cont").text(news.s_cont);
					var pics = news.s_pic;
					var picBody = "";
					var picLength = pics.length;
					if(picLength > 0){
						for(var i=0;i<picLength;i++){
							picBody += "<div class='pic-div'>"
								+"<a href='javascript:;'>"+pics[i]+"</a>"
							+"</div>";
						}
					}
					$("#xq_s_pic").html(picBody);
					$(".dialog-wrap").show();
				}else{
					win.alertEx("操作失败");
				}
				endLoad();
			}
		});
	}
	//分页查询数据 condtionChangeFlag条件是否改变标记 isFirstLoad是否第一次加载数据的标记
	function getPageNewsList(condtionChangeFlag,isFirstLoad){
		startLoad();
		var eventidsTableName = $("#eventidsTableName").val();
		var st_o_gt = $("#st_o_gt").val();
		var end_o_gt = $("#end_o_gt").val();
		var st_s_pt = $("#st_s_pt").val();
		var end_s_pt = $("#end_s_pt").val();
		var s_au = $("#s_au").val();
		var i_sn = $("#i_sn").val();
		var o_url = $("#o_url").val();
		var s_title = $("#s_title").val();
		var s_cont = $("#s_cont").val();
		var newsCount = $("#newsCount").text();
		var pageIndex = $("#nextPageIndex").val();
		var eventidsCount = $("#eventidsCount").val();
		
		var condtionData = {"eventidsCount":eventidsCount,"newsCount":newsCount,"eventidsTableName":eventidsTableName,"condtionChangeFlag":condtionChangeFlag,"pageIndex":pageIndex,"st_o_gt":st_o_gt,"end_o_gt":end_o_gt,"st_s_pt":st_s_pt,"end_s_pt":end_s_pt,"s_au":s_au,"i_sn":i_sn,"o_url":o_url,"s_title":s_title,"s_cont":s_cont};
	    /*
	    var newsLength = news.length;
	    var newsBody = "";
	    for(var i=0;i<newsLength;i++){
			newObject =  news[i];
			newsBody+="<div class='search-content clearfix'>"
		    	+"<div onclick='ckDetails(\""+newObject._id+"\")' class='title55'>"+newObject.s_title+"</div>"
		    	+"<div class='clearfix' style='margin:12px 0;'>"
		    	+"<div class='pull-left'>"
		    	+"<span class='web-site'>网站：</span>"
		    	+"<span>"+newObject.i_sn+"</span>"
		    	+"</div>"
		    	+"<div class='pull-left'>"
		    	+"<span class='release-time'>发布时间：</span>"
		    	+"<span>"+newObject.formt_s_pt+"</span>"
		    	+"</div>"
		    	+"</div>"
		    	+"<p class='search-content-text'>"+newObject.s_cont+"</p>"
		    	+"<button class='pull-right details' onclick='ckDetails(\""+newObject._id+"\")'>查看详情</button>"
		    	+"</div>";
		}
	    $(".newsBody").append(newsBody); 
	    endLoad();
	    */
	    //条件发生变化将新闻展示清空
		if(condtionChangeFlag || isFirstLoad == 1){
			$(".search-content").remove();
		}
		$.ajax({
			url:'<%=basePath%>/news/getNewsList',
			type: 'POST',
			data:condtionData,
			dataType:"json",
			success:function(data){
				if(data.flag){
					var news = data.newsList;
			    	var newsLength = news.length;
			    	var tatal = data.total;
			    	//新闻总记录数
			    	$("#newsCount").text(tatal);
			    	$("#nextPageIndex").val(data.nextPageIndex);
			    	//新闻已加载数量
			    	loadNumber+=newsLength;
			    	//新闻剩余数
			    	$("#remainNumber").text(tatal-loadNumber);
			    	var newsBody = "";
			    	if(newsLength >0){
			    		var newObject;
			    		for(var i=0;i<newsLength;i++){
			    			newObject =  news[i];
			    			newsBody+="<div class='search-content clearfix'>"
			    	    	+"<div onclick='ckDetails(\""+newObject._id+"\")' class='title55'>"+newObject.s_title+"</div>"
			    	    	+"<div class='clearfix' style='margin:12px 0;'>"
			    	    	+"<div class='pull-left'>"
			    	    	+"<span class='web-site'>网站：</span>"
			    	    	+"<span>"+newObject.i_sn+"</span>"
			    	    	+"</div>"
			    	    	+"<div class='pull-left'>"
			    	    	+"<span class='release-time'>发布时间：</span>"
			    	    	+"<span>"+newObject.formt_s_pt+"</span>"
			    	    	+"</div>"
			    	    	+"</div>"
			    	    	+"<p class='search-content-text'>"+newObject.s_cont+"</p>"
			    	    	+"<button class='pull-right details' onclick='ckDetails(\""+newObject._id+"\")'>查看详情</button>"
			    	    	+"</div>";
			    		}
			    	}
			    	$(".newsBody").append(newsBody);
					//关闭高级查询
					$(".triangle").hide();
				}else{
					win.alertEx("加载列表失败");
				}
				endLoad();
			}
		});
	}
	//高级搜索
	function highGradeSearch(){
		initPageParam();
		getPageNewsList(true,0);
	}
	
	//初始化分页的相关参数
	function initPageParam(){
		//下一页 页数为0
		$("#nextPageIndex").val(0);
		//新闻总记录数为0
		//$("#newsCount").text(0);
		//新闻加载数为0
		loadNumber = 0;
		//新闻未加载数置0
		$("#remainNumber").text(0);
		loadNumber = 0;
	}
	
	//加载更多
	function loadMoreNews(){
		var remainNumber = $("#remainNumber").text();
		if(remainNumber > 0){
			getPageNewsList(false,0);
		}else{
			win.alertEx("相关新闻已全部加载完毕");
		}
	}
	
    </script>
</html>