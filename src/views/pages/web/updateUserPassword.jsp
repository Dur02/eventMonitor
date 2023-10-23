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
<style type="text/css">
 /* 半透明的遮罩层 */
 .maskLaye {
    width: 100%;
    min-height: 100%;
    display: none;
	position: absolute;
	top: 0px;
	left: 0px;
	z-index: 999;
	background: rgba(0, 0, 0, 0.5);
	filter: progid:DXImageTransform.Microsoft.Gradient(GradientType=0,
		StartColorStr='#7f000000', EndColorStr='#7f000000');
	*zoom: 1;
}
</style>
<title></title>
<%-- <script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/jquery-1.11.1.min.js"></script> --%>
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<body>
<div id="maskLaye" class="maskLaye"></div>
		<div class="upd_popup">
			<div class="upd_popup_t">
				<h4 class="upd_popup_h4 fl">修改密码</h4>
		    	<label class="fr"><image src="<%=basePath %>/static/images/delete.png" onclick="close_s()" class="userdelete"></image></label>
			</div>
			<div class="upd_popup_m clearfix">
			<form id="updUserPasswordForm" action="../auth/updatePassword" method="post">
				<div class="tab3 clearfix" id="userInfodiv">
					<!-- 用户管理 -->
						<ul class="upd_table_ul clearfix">
							<li class="clearfix" style="margin-top:0px">
								<div class="upd_td1 fl"><span class="fl">原密码：</span></div>
								<div class="fl">
									<input type="password" name="oldpwd" id="oldpwd" onblur="validateUpd1()"/>
									<span id="updspan" style=" position:relative;width: 40px" name="updspan" ></span>
								</div>
							</li>
							<li class="clearfix">
								<div class="upd_td1 fl"><span class="fl">新密码：</span></div>
								<div class="fl">
									<input type="password" name="password" id="password1"  onblur="validateUpd2()"/>
									<span id="updspan1" style=" position:relative;width: 40px" name="updspan1" ></span>
								</div>
							</li>
							<li class="clearfix">
								<div class="upd_td1 fl"><span class="fl">确认密码：</span></div>
								<div class="fl">
									<input type="password" name="confirmpwd" id="confirmpwd"  onblur="validateUpd3()"/>
									<span id="updspan2" style=" position:relative;width: 40px" name="updspan2" ></span>
								</div>
							</li>
						</ul>		
				</div>
			</form>
		</div>
		<div class="popup_b">
			<p class="fr" style="margin-bottom:0px;">
		         <span id="scheduleState33" class="save" onclick="savePass();">提交</span>
			</p>
		</div>
	</div>
</body>
<script type="text/javascript">
function validateUpd1(){
	var oldpwd=$("#oldpwd").val();
	if(oldpwd ==null||oldpwd==""){
		  $("#updspan").text("请输入原密码");
		  $("#updspan").css({color:"red"});
		  
	  }else{
		  $("#updspan").text("");
		  $.ajax({
				url: '<%=basePath %>/auth/checkOldName',
				type: 'POST',
				data: {password:oldpwd},
				async:false,
				success: function(data){
					if(data == "success"){
						}else{
							$("#updspan").text("原密码不正确");
							$("#updspan").css({color:"red"});
					}
				}
			});
	  }
	
}
 function validateUpd3(){
	var confirmpwd=$("#confirmpwd").val();
	if(confirmpwd==""){
		$("#updspan2").text("确认密码为空");
		$("#updspan2").css({color:"red"});
	}else{
		$("#updspan2").text("");
	}
}
 function validateUpd2(){
	var password=$("#password1").val();
	var oldpwd=$("#oldpwd").val();
	if(password==""){
		$("#updspan1").text("新密码为空");
		$("#updspan1").css({color:"red"});
	}else{
		$("#updspan1").text("");
	}
	if(oldpwd==password&&password!=""){
		$("#updspan1").text("与旧密码相同!");
		$("#updspan1").css({color:"red"});
	}
 }
function savePass(){
	var oldpwd=$("#oldpwd").val();
	var password=$("#password1").val();
	var confirmpwd=$("#confirmpwd").val();
	if(oldpwd==""&&$("#updspan").text()==""){
		$("#updspan").text("原密码为空");
		$("#updspan").css({color:"red"});
	}
	if(password==""&&$("#updspan1").text()==""){
		$("#updspan1").text("新密码为空");
		$("#updspan1").css({color:"red"});
	}
	if(confirmpwd==""&&$("#updspan2").text()==""){
		$("#updspan2").text("确认密码为空");
		$("#updspan2").css({color:"red"});
	}
	if(password!=confirmpwd && password!="" && confirmpwd!=""){
		$("#updspan2").text("两次密码不一致");
		$("#updspan2").css({color:"red"});
	}
	if(oldpwd==password && password!="" && password!=null){
		$("#updspan1").text("与旧密码相同!");
		$("#updspan1").css({color:"red"});
	}
	if($("#updspan").text()!=""||$("#updspan1").text()!=""||$("#updspan2").text()!=""){
		return;
	}
	$.ajax({
		url: '<%=basePath %>/auth/updatePassword',
		type: 'POST',
		data: {password:password},
		async:false,
		success: function(data){
			if(data == "success"){
				//win.alertEx('密码修改成功，请重新登录');
				$.ajax({
					url: '<%=basePath %>/auth/doLoginout',
					type: 'GET',
					success: function(data){
						//跳转到项目根路径（登录页面）
						location.href='<%=basePath %>';
					}
				});
			}else{
				win.alertEx('密码修改失败');
			}
		}
	});
		
}
function close_s(){
	$(".upd_popup").css("display","none");
	$("#oldpwd").val("");
	$("#password1").val("");
	$("#confirmpwd").val("");
	$("#updspan").text("");
	$("#updspan1").text("");
	$("#updspan2").text("");
	$("#maskLaye").hide();     
}
</script>
</html>