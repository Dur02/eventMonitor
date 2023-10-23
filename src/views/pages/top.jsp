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
<title>监测系统</title>
<link rel="stylesheet"  type="text/css" href="<%=basePath %>/static/css/style.css">
<link rel="stylesheet" id="top_link"  type="text/css" href="<%=basePath %>/static/css/top.css">
<script src="<%=basePath %>/static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/js/main.js"></script>
</head>
<body>
<div class="header clearfix">
	<h2 class="fl">全球政治安全监测分析系统</h2>
	<div class="header_r fr clearfix">
		<div class="skin fr clearfix">
			<p id="time" class="fl time"></p>
			<span  class="black_btn" style="display: none;"></span>
			<span  class="white" style="display: none;"></span>
		</div>
		<div class="user fr clearfix">
			<ul class="userinfo fr">
				<li class="user_img"></li>
				<li class="user_name">${LOGINUSER.username }</li>
				<li class="user_change" onclick="doLoginOut()">退出登录</li>
				<li class="user_upd" onclick="Login.toUpdatePassword();">修改密码</li>
			</ul>
			<div class="user_changebox">
				<!-- <input type="button" value="退出登录" onclick="Login.loginout();"> -->
			</div>
		</div>
	</div>
</div>
<script>
window.onload = function(){
	function toDou(str){
		var num;
	 	str>=10?num = str : num = "0" + str;
		return num;
	};
	function getDate(){
		var oTime = document.getElementById('time');
		var date  = new Date();
		var year  = date.getFullYear();
		var month = date.getMonth() + 1;
		var day   = date.getDate();
		var hours = date.getHours();
		var min   = date.getMinutes();
		var sec   = date.getSeconds();
		oTime.innerHTML = year + "-" +toDou(month) + "-" +toDou(day) + " " + toDou(hours) +":"+ toDou(min) +":"+ toDou(sec);  
	};
	getDate();
	setInterval(getDate,1000);
};
var isCollect = false, indxs = new Array();
$(".white").click(function(){
	return;//将背景切换共去掉
	$("#top_link").attr("href","<%=basePath %>/static/css/top2.css");
	$(window.parent.frames["lefthtml"].document).find("#left_link").attr("href","<%=basePath %>/static/css/left2.css");
	$(window.parent.frames["lefthtml"].document).find("#left_link2").attr("href","<%=basePath%>/static/css/sec2_2.css");
	$(window.parent.frames["lefthtml"].document).find("#index").attr("onclick","").click(function(){
		parent.mainhtml.location='../search/event/home2?bgFlag=2';
	});
	$(window.parent.frames["lefthtml"].document).find("#config2").attr("onclick","").click(function(){
		parent.mainhtml.location='../config/toGraphConfig?bgFlag=2';
	});
	$(window.parent.frames["lefthtml"].document).find("#config1").attr("onclick","").click(function(){
		parent.mainhtml.location='../config/toEventConfig?bgFlag=2';
	});
	$(window.parent.frames["lefthtml"].document).find("#leaderPZ").attr("onclick","").click(function(){
		parent.mainhtml.location='../config/toLeaderConfig?bgFlag=2';
	});
	//数据统计
	$(window.parent.frames["lefthtml"].document).find("#insertDBCounts").attr("onclick","").click(function(){
		parent.mainhtml.location='../dataStatistics/insertDBCounts?bgFlag=2';
	});
	$(window.parent.frames["lefthtml"].document).find("#netNewsCounts").attr("onclick","").click(function(){
		parent.mainhtml.location='../dataStatistics/netNewsCounts?bgFlag=2';
	});
	//人物配置
	$(window.parent.frames["lefthtml"].document).find("#user").attr("onclick","").click(function(){
		parent.mainhtml.location='../user/toUserConfig?bgFlag=2';
	});
	var mL  = $(window.parent.frames["lefthtml"].document).find(".two_li");
	var mL_length = mL.length;
	mL.each(
		function(i){
			var path;
			if(!isCollect){
				path = $(this).attr("onclick").split('=')[1];
				path = path.substr(1, path.length);
				indxs[i] = path;
			}
			$(this).attr("onclick","").click(function(){
				if(isCollect){
					parent.mainhtml.location=indxs[i]+'=2';
				}else{
					parent.mainhtml.location=path+'=2';
				}
			})
		}
	);
	isCollect = true;
	$(window.parent.frames["lefthtml"].document).find(".two_li_active").click();
});
$(".black_btn").click(function(){
	return;//将背景切换共去掉
	$("#top_link").attr("href","<%=basePath %>/static/css/top.css");
	$(window.parent.frames["lefthtml"].document).find("#left_link").attr("href","<%=basePath %>/static/css/left.css");
	$(window.parent.frames["lefthtml"].document).find("#left_link2").attr("href","<%=basePath %>/static/css/sec2.css");

	$(window.parent.frames["lefthtml"].document).find("#index").attr("onclick","").click(function(){
		parent.mainhtml.location='../search/event/home2?bgFlag=1';
	});
	$(window.parent.frames["lefthtml"].document).find("#config2").attr("onclick","").click(function(){
		parent.mainhtml.location='../config/toGraphConfig?bgFlag=1';
	});
	$(window.parent.frames["lefthtml"].document).find("#config1").attr("onclick","").click(function(){
		parent.mainhtml.location='../config/toEventConfig?bgFlag=1';
	});
	//人物配置
	$(window.parent.frames["lefthtml"].document).find("#leaderPZ").attr("onclick","").click(function(){
		parent.mainhtml.location='../config/toLeaderConfig?bgFlag=1';
	});
	//数据统计
	$(window.parent.frames["lefthtml"].document).find("#insertDBCounts").attr("onclick","").click(function(){
		parent.mainhtml.location='../dataStatistics/insertDBCounts?bgFlag=1';
	});
	$(window.parent.frames["lefthtml"].document).find("#netNewsCounts").attr("onclick","").click(function(){
		parent.mainhtml.location='../dataStatistics/netNewsCounts?bgFlag=1';
	});
	//用户管理
	$(window.parent.frames["lefthtml"].document).find("#user").attr("onclick","").click(function(){
		parent.mainhtml.location='../user/toUserConfig?bgFlag=1';
	});
	
	var mL  = $(window.parent.frames["lefthtml"].document).find(".two_li");
	var mL_length = mL.length;
	mL.each(
			function(i){
				var path;
				if(!isCollect){
					path = $(this).attr("onclick").split('=')[1];
					path = path.substr(1, path.length);
					indxs[i] = path;
				}
				$(this).attr("onclick","").click(function(){
					if(isCollect){
						parent.mainhtml.location=indxs[i]+'=1';
					}else{
						parent.mainhtml.location=path+'=1';
					}
				})
			}
	);
	isCollect = true;
	$(window.parent.frames["lefthtml"].document).find(".two_li_active").click();
});
function doLoginOut(){
	location.href="../auth/doLoginout";
}
</script>
</body>
</html>