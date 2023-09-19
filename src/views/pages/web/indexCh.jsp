<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>XX安全检测系统_main</title>
<link rel="stylesheet" href="<%=basePath %>/static/css/style.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/sec2_2.css">
</head>
<body>
	<div class="index_top">
		<h3 class="title">首页</h3>
	</div>
	<div class="index_bottom">
		<div class="event_info_box">
			<div class="event_info">
				<div class="event_info_head clearfix"><p class="fl">A类热点事件</p><span class="close"></span></div>
				<div class="event_info_b">
					<ul>
						<li>韩国新闻部称，朴槿惠称“愿意辞职韩国新闻部称</li>
						<li>2016年11月28日,美国中西部俄亥俄州哥伦布市俄亥俄州立大学发生校园枪击案</li>
						<li>美国大选2016最新消息：重计选票引特朗普胜选质疑</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="event_list">
			<div class="b_shadow">
				<ul class="event_ul">
					<li title="美国大选大选大美国大选大选大">美国大选大选大美国大选大选大0</li>
					<li>朴槿慧1</li>
					<li>美国大选大选大2</li>
					<li>朴槿慧3</li>
					<li>美国大选大选大4</li>
					<li>朴槿慧5</li>
					<li>美国大选大选大6</li>
					<li>朴槿慧</li>
					<li>美国大选大选大</li>
					<li>朴槿慧</li>
					<li>美国大选大选大</li>
					<li>朴槿慧</li>
					<li>美国大选大选大</li>
					<li>朴槿慧</li>
					<li>美国大选大选大</li>
					<li>朴槿慧</li>
					<li>美国大选大选大</li>
					<li>朴槿慧</li>
					<li>美国大选大选大</li>
					<li>朴槿慧</li>
				</ul>
			</div>
		</div>
	</div>
<script src="<%=basePath %>/static/js/jquery-1.9.1.min.js"></script>
<!-- <script src="<%=basePath %>/static/js/sec2.js"></script> -->
<script>
window.onload = window.onresize = function(){
	var bodyH = $(window).height();
	$(".index_bottom").height(bodyH - 50 );
	$(".data").height(bodyH - 50 );
	$(".event_list").css({"position":"absolute","left":"0","bottom":"0"});
	
	$(".event_ul").on('click','li',function(){
		$(".event_info_box").append(
				"<div class='event_info'>"+
					"<div class='event_info_head clearfix'><p class='fl'>"+$(this).text()+"</p><span class='close'></span></div>"+
					"<div class='event_info_b'>"+
						"<ul>"+
							"<li>"+2+"</li>"+
							"<li>"+3+"</li>"+
							"<li>"+4+"</li>"+
						"</ul>"+
					"</div>"+
				"</div>"
			);
	});
};
$(function(){
	$(".event_info_box").on('click','.close',function(){
		$(this).parent().parent().css("display","none");
	})
})
</script>
</body>
</html>