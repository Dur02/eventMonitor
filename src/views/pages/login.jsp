<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>监测系统</title>
<link rel="stylesheet"  type="text/css" href="static/css/style.css">
<link rel="stylesheet" href="static/win_alert/window.css"/><!-- 弹出提示框样式 -->
<script src="static/js/jquery-1.9.1.min.js"></script>
<script src="static/js/login.js"></script>
<style>
body {padding:0; margin:0;}
#coverpage{ width: 100%; height: 100%; z-index: 9999; background: #000; overflow: hidden; position: absolute;}
#onepics{ width: 100%; height: 100%; overflow: hidden; position: relative;}
.onepic_wrap{ width: 100%; height: 100%; overflow: hidden; display: block; position: relative; }

.window-panel .title{
	line-height: 38px;
}
.login{
	width:499px;
	height:325px;
	position:fixed;
	top:50%;
	left:50%;
	margin-left:-249px;
	margin-top:-162px;
}
.shadow{
	width:499px;
	height:325px;
	background:url(static/images/loginbox_bg.png) no-repeat;
}
.login_box{
	position:absolute;
	top:0px;
	left:0px;
	padding:50px 64px;
}
ul li{
	margin-bottom: 30px;
}
.username{
	width:44px;
	height:42px;
	background:url(static/images/user.png) no-repeat #abb5ca center;
	float:left;
}
.password{
	width:44px;
	height:42px;
	background:url(static/images/lock.png) no-repeat #abb5ca center;
	float:left;
}
.inp{
	width:318px;
	height:42px;
	line-height:42px;
	background:#6d7a9c;
	padding-left:4px;
	color:#fff;
}
.inp:hover{
	background:#7785a9;
}
.checkbox{
	vertical-align:middle;
}
.rember{
	margin-left:18px;
	color:#fff;
}
.sub{
	width:366px;
	height:42px;
	line-height:42px;
	text-align:center;
	background:#2e8bed;
	cursor:pointer;
	color:#fff;
}
.sub:hover{
	background:#005ec2;
}
</style>
<script src="static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<script type="text/javascript">
//把用户名密码从cookie中取出来
function getCookie(name) {
    var strCookie=document.cookie;
    var arrCookie=strCookie.split("; ");
    for(var i=0;i<arrCookie.length;i++) {
        var arr=arrCookie[i].split("=");
        if(arr[0]==name)
            return arr[1];
    }
    return "";
}
//把用户名密码存入cookie
function setCookie(name,value,expiresHours) {
    var cookieString = name + "=" + escape(value);
    if(expiresHours>0) {
        var date=new Date();
        date.setTime(date.getTime+expiresHours*3600*1000);
        cookieString=cookieString+"; expires="+date.toGMTString();
    }
    document.cookie=cookieString;
}
//记住密码
$(function() {
    var loginNameStr = "username";
    var passwordStr = "password";
    if((getCookie(loginNameStr)!=null&&getCookie(loginNameStr)!="")&&getCookie(passwordStr)!=null&&getCookie(passwordStr)!=""){
        $("#remember").attr("checked","checked");
        $("#usr").val(getCookie(loginNameStr));
        $("#pwd").val(getCookie(passwordStr));
    }
    $("#remember").click(function(){
        var ischeck=$(this).is(":checked"); 
        var loginVal = "";
        var passwordVal = "";
        if(ischeck){
            loginVal = $("#usr").val();
            passwordVal = $("#pwd").val();
        }
        setCookie(loginNameStr,loginVal,5);
        setCookie(passwordStr,passwordVal,5);
    });
});
</script>
</head>
<body onkeydown="keyLogin();">
<div id="coverpage">
  <div id="onepics"><div class="onepic_wrap"><img src="static/images/login_bg.png" class="wrap_pic"></div></div>
  <div class="login">
    	<div class="shadow"></div>
    	<div class="login_box">
	      	<ul>
		  		<li><span class="username"></span><input class="inp" id="usr" type="text"/></li>
		  		<li><span class="password"></span><input class="inp" id="pwd"  type="password"/></li>
		  		<li><input class="checkbox" type="checkbox" id="remember"/><span class="rember">记住我</span></li>
		  	    <li><input class="sub" type="button" value="登录" id="sub" onclick="Login.login();"></li>
	  	  	</ul>
  	  	</div>
  </div>
</div>

<script type="text/javascript">
function keyLogin(){
	 if (event.keyCode==13){
		 //回车键的键值为13
		 document.getElementById("sub").click(); //调用登录按钮的登录事件
	 } 
}
      var win_height; //浏览器当前窗口可视区域高度
      var win_width; //浏览器当前窗口可视区域宽度
      var original_width = 1920; //图片原始尺寸，编辑可手填
      var original_height = 1080; //图片原始尺寸，编辑可手填

      var pic_width, pic_height, pic_left ,pic_top; //裁剪适配后的图片显示尺寸和左边距、上边距

	  OnePicAction();

      function OnePicAction(){
          win_height = $(window).height(); //浏览器当前窗口可视区域高度
          win_width = $(window).width(); //浏览器当前窗口可视区域宽度

          //裁剪图片
          if(Math.ceil(win_height * original_width / original_height) < win_width ){
              pic_width = win_width ;
              pic_height = Math.ceil(win_width * original_height / original_width);
              pic_left = 0;
              pic_top = - Math.ceil((pic_height - win_height) / 2);
          }else{
              pic_height = win_height;
              pic_width = Math.ceil(win_height * original_width / original_height);
              pic_left = - Math.ceil((pic_width - win_width) / 2);
              pic_top = 0;
          }
          $("#onepics .wrap_pic").css("width",pic_width+"px").css("height",pic_height+"px").css("margin-top",pic_top+"px").css("margin-left",pic_left+"px");

      }
	  //浏览器大小变化时壹图处理
	  window.onresize = function(){
		  OnePicAction();
	  }
	  //解决页面嵌套问题
	  if(window != window.parent){
			window.parent.location.reload(true);
		}
</script>
</body>
</html>