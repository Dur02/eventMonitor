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
<title>用户管理</title>
<link rel="stylesheet" href="<%=basePath %>/static/css/style.css"/>
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.min.css"/>
<link rel="stylesheet" href="<%=basePath %>/static/lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath %>/static/css/combo.select.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/perfect-scrollbar.css"/>
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window.css"/><!-- 弹出提示框样式 -->
<style type="text/css">
	.combo-dropdown li{float:left; width:82%;}
</style>
<script src="<%=basePath %>/static/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath %>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath %>/static/js/perfect-scrollbar.js"></script>
<script src="<%=basePath %>/static/lib/jquery.pagination.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-select.min.js"></script>
<script src="<%=basePath %>/static/js/jquery.combo.select.js"></script>
<script src="<%=basePath %>/static/js/config/config.js"></script>
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<c:if test="${bgFlag == null or bgFlag == 1}">
	<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css"/>
	<link rel="stylesheet" href="<%=basePath %>/static/css/sec2.css"/>
	<script src="<%=basePath %>/static/js/sec2.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
	<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.min.css"/>
	<link rel="stylesheet" href="<%=basePath %>/static/css/sec2_2.css"/>
	<script src="<%=basePath %>/static/js/sec2_2.js"></script>
</c:if>
<style type="text/css">
 /* 半透明的遮罩层 */
.mask {
   width: 100%;
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

<script>
function showMask(){
    $("#mask").css("height",$(document).height());
    $("#mask").css("width",$(document).width());
    $("#mask").show();
}
//隐藏遮罩层
function hideMask(){

    $("#mask").hide();
}
/* $(function(){
     //文本框失去焦点后
    $('form :input').blur(function(){
         var $parent = $(this).parent();
         $parent.find(".formtips").remove();
         //验证用户名
         if( $(this).is('#username') ){
                if( this.value==""){
                    var errorMsg = '<font color="#FF0000">名称不能为空</font>';
                    $parent.append('<span class="formtips onError" style="position:relative;left: -20px ">'+errorMsg+'</span>');
                }else{
                    var okMsg = '';
                    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
                }
         }
         //验证登录名
         if( $(this).is('#loginname') ){
                if( this.value==""){
                    var errorMsg = '<font color="#FF0000">登录名不能为空</font>';
                    $parent.append('<span class="formtips onError" style="position:relative;left: -20px ">'+errorMsg+'</span>');
                }else{
                    var okMsg = '';
                    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
                }
         }
         //验证用户密码
         if( $(this).is('#password1') ){
                if( this.value==""){
                    var errorMsg = '<font color="#FF0000">密码不能为空</font>';
                    $parent.append('<span class="formtips onError" style="position:relative;left: -20px ">'+errorMsg+'</span>');
                }else{
                    var okMsg = '';
                    $parent.append('<span class="formtips onSuccess" >'+okMsg+'</span>');
                }
         }
         if( $(this).is('#phoneNum') ){
                if( this.value!="" && !/^1[34578]\d{9}$/.test(this.value)){
                    var errorMsg = '<font color="#FF0000">请输入正确的手机号码</font>';
                    $parent.append('<span class="formtips onError" style="position:relative;left: -20px ">'+errorMsg+'</span>');
                }else{
                    var okMsg = '';
                    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
                }
         }
         //验证邮件
         if( $(this).is('#emailAddr') ){
            if( this.value!="" && !/.+@.+\.[a-zA-Z]{2,4}$/.test(this.value)){
                  var errorMsg = '<font color="#FF0000">请输入正确的E-Mail地址</font>';
                  $parent.append('<span class="formtips onError" style="position:relative;left: -20px ">'+errorMsg+'</span>');
            }else{
                  var okMsg = '';
                  $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
            }
         }
    }).keyup(function(){
       $(this).triggerHandler("blur");
    }).focus(function(){
         $(this).triggerHandler("blur");
    
});
  //提交，最终验证。
    $('#scheduleState1').click(function(){
           $("form :input.required").trigger('blur');
           var numError = $('form .onError').length;
           if(numError){
               return false;
           }else{
           	userSub();
           }
    });
}) */
function validateUsername(){
	var username = $("#username").val();
	if(username ==""){
		  $("#span1").text("必填项");
		  $("#span1").css({color:"red"});
		  
	  }else{
		  $("#span1").text("");
	  }
}
function validateAddPassword(){
	var add_password = $("#add_password").val();
	if(add_password ==""){
		  $("#span9").text("必填项");
		  $("#span9").css({color:"red"});
		  
	  }else{
		  $("#span9").text("");
	  }
}

function validateLoginname(){
	var loginName = $("#loginname").val();
	if(loginName ==""){
		  $("#span2").text("必填项");
		  $("#span2").css({color:"red"});
		  
	  }else{
			$.ajax({
				url:'../user/queryLoginName',
				type:'POST',
				data:{"loginName":loginName},
				success:function(data){
					if(data.msg=="one"){
						$("#span2").text("登录名重复");
					    $("#span2").css({color:"red"});
					}else if(data.msg=="zero"){
						$("#span2").text("");
					}else if(data.msg=="error"){
						win.alertEx("系统错误，请联系管理员");
					}
					
				}
			});
	  }
}
function validatePhoneNum(){
	var phoneNum = $("#phoneNum").val();
	var reg = /^1[34578]\d{9}$/;
	if(phoneNum !=""){
		if(reg.test(phoneNum)){
			 $("#span4").text("");
		}else{
			$("#span4").text("手机号码不正确");
			$("#span4").css({color:"red"});
			
		}
	  }else{
		  $("#span4").text("");
	  }
}

function validateEmailAddr(){
	var emailAddr = $("#emailAddr").val();
	var reg =/.+@.+\.[a-zA-Z]{2,4}$/;
	if(emailAddr !=""){
		if(reg.test(emailAddr)){
			 $("#span5").text("");
		}else{
			 $("#span5").text("邮箱格式不正确");
			  $("#span5").css({color:"red"});
		}
		  
	  }else{
		  $("#span5").text("");
	  }
}
function sss(){
	var emailAddr = $("#emailAddr").val();
	var phoneNum = $("#phoneNum").val();
	var loginname = $("#loginname").val();
	var username = $("#username").val();
	var add_password = $("#add_password").val();
	if(username ==""){
		  $("#span1").text("必填项");
		  $("#span1").css({color:"red"});
		  
	  }
	if(loginname ==""){
		  $("#span2").text("必填项");
		  $("#span2").css({color:"red"});
		  
	  }
	if(add_password ==""){
		  $("#span9").text("必填项");
		  $("#span9").css({color:"red"});
		  
	  }
	if($("#span1").text()==""&&$("#span2").text()==""&&$("#span4").text()==""&&$("#span5").text()==""&&$("#span9").text()==""){
		userSub();
    } 
}

//zcm mark st
function addConfig(){
	$("#add_password").empty();
    $("#password1").empty();
    $("#add_password").val("");
    $("#username").empty();
    $("#emailAddr").empty();
    $("#phoneNum").empty();
    $(".popup_h3").text("");
	$(".popup_h3").text("添加用户");
   	$(".formtips").text("");
	$("#mask").css("height",$(document).height());
    $("#mask").css("width",$(document).width());
    $("#mask").show();
	$(".popup3").css("display","block");
	$("#aa").val("");
	/* $("#add_password").removeAttr("type");
	$("#add_password").attr("type", "text"); */
	$("#loginname").attr("onblur", "validateLoginname()");
	$("#infodiv").show();
	$("input[name='loginname']").val("");
/* 	$("input[name='add_password']").val("11111111"); */	
	$("input[name='password']").val(""); 
	$("input[name='username']").val(""); 
	$("input[name='phoneNum']").val("");
	$("input[name='emailAddr']").val("");
	var selects = document.getElementsByName("roleId");  
    for (var i=0; i<selects.length; i++){  
        if (selects[i].value=="2") {  
            selects[i].checked= true;  
            break;  
        } 
        
    } 
    $("#span1").text("");
    $("#span2").text("");
    $("#span9").text("");
    $("#span4").text("");
    $("#span5").text("");
}
var rs = null;
function showConfigList(){
	var configName = $('#s_configName').val();
	var creator = $('#s_creator').val();
	var configCategory = $('#typeFilter').val();
	var scheduleState = $('#scheduleStateFilter').val();
	var pageIndexNew = $('#pageIndexNew').val();
	var configFlag = $('#configFlag').val();
	var dt = {
			pageIndex:pageIndexNew,
	};
	if(configName != null && configName != ''){
		dt['configName'] = configName;
	}
	if(creator != null && creator != ''){
		dt['creator'] = creator;
	}
	if(configCategory != null && configCategory != ''){
		dt['configCategory'] = configCategory;
	}
	if(scheduleState != null && scheduleState != ''){
		dt['scheduleState'] = scheduleState;
	}
	if(configFlag != null && configFlag != ''){
		dt['configFlag'] = configFlag;
	}
	$.ajax({
		url:'../user/getUserConfigList',
		type:'POST',
		data: dt,
		success:function(data){
			var pageSize = data.pageSize;
			var totalRows = data.total;
			var pageIndex = data.pageIndex;
			
			rs = data.data;
			$("#Pagination").pagination(totalRows, {
				callback: pageselectCallback,
				current_page: pageIndex,
				num_display_entries: 4, //主体页数
				items_per_page: pageSize, //每页显示1项
				num_edge_entries: 2 //边缘页数
			});
		}
	});
}

function pageselectCallback(pageIndex, jq){
	$("#pageIndexNew").val(pageIndex);
	initData(pageIndex);
}

function initData(pageIndex){
	var tbodys = '';
	var configName = $('#s_configName').val();
	var creator = $('#s_creator').val();
	var configCategory = $('#typeFilter').val();
	var scheduleState = $('#scheduleStateFilter').val();
	var configFlag = $('#configFlag').val();
	var dt = {
		pageIndex: pageIndex
	};
	if(configName != null && configName != ''){
		dt['configName'] = configName;
	}
	if(creator != null && creator != ''){
		dt['creator'] = creator;
	}
	if(configCategory != null && configCategory != ''){
		dt['configCategory'] = configCategory;
	}
	if(scheduleState != null && scheduleState != ''){
		dt['scheduleState'] = scheduleState;
	}
	if(configFlag != null && configFlag != ''){
		dt['configFlag'] = configFlag;
	}
	if(rs == null){
		$.ajax({
			url: '../user/getUserConfigList',
			type: 'POST',
			data: dt,
			success:function(data){
				tbodys = packageConfigData(data.data);
				$('.table tbody').html(tbodys);
			}
		});
	}else{
		tbodys = packageConfigData(rs);
		rs = null;
		$('.table tbody').html(tbodys);
	}
	return true;
}

function packageConfigData(rs){
	var tbody = '', trs = '';
	$.each(rs, function(i, item){
		trs += '<tr><td>' + (i + 1) + '</td>';
		trs += '<td>' + item.username + '</td>';
		trs += '<td>' + item.loginname + '</td>';
		trs += '<td>' + item.phoneNum + '</td>';
		trs += '<td>' + item.emailAddr + '</td>';
		trs += '<td>' + item.roleName + '</td>';
		<%-- trs += '<td><img title="修改" class="set" src="<%=basePath %>/static/images/set.png" onclick="editUserConfig('+ item.id +')"/><img title="删除" class="del" onclick="delUserConfig('+ item.id+')" src="<%=basePath %>/static/images/del.png"/>&nbsp;&nbsp;<img title="重置密码" class="reset" onclick="resetUserPwd('+ item.id+')" src="<%=basePath %>/static/images/reset.png"/></td>'; --%>
		trs += '<td><img title="修改" class="set" src="<%=basePath %>/static/images/set.png" onclick="editUserConfig('+ item.id +')"/><img title="删除" class="del" onclick="delUserConfig('+ item.id+')" src="<%=basePath %>/static/images/del.png"/></td>';
		trs += '</tr>';
	});
	tbody += trs;
	return tbody;
}


showConfigList();
/* 
 *	暂时没用（gxb）
 *  重置密码
 */
function resetUserPwd(id){
	
	win.confirm('系统提示', '确定要重置密码？', function (r) {
        if(r){
        	$.ajax({
    			url: '<%=basePath %>/user/restUserPassword',
    			type: 'POST',
    			data: {id:id},
    			dataType:"json",
    			success: function(data){
    				if(data.result=="success"){
    					win.alertEx("密码已重置");
    				}else{
    					win.alertEx("密码重置失败");
    				}
    			},error:function(data){
    				win.alertEx("系统错误");
    			}
    		});
        }else{
        	win.alertEx("已取消");
        }
  	});
}
function editUserConfig(id){
	$("#span1").text("");
    $("#span2").text("");
    $("#span4").text("");
    $("#span5").text("");
    $("#span9").text("");
	$(".formtips").text("");
	//控制页面div
    $("#mask").css("height",$(document).height());
    $("#mask").css("width",$(document).width());
    $("#mask").show();
    $("#loginname").removeAttr("onblur");
    $(".popup3").css("display","block");
	$(".popup_h3").text("修改用户");
	$("#add_password").removeAttr("type");
	$("#add_password").attr("type", "password");
	//$('#add_password').css("type","password");
	//控制页面div
	$("#infodiv").show();
	var dt = {id: id};
	$.ajax({
		url: '../user/getUserConfig',
		type: 'GET',
		data: dt,
		success: function(data){
			if(data != null){
				console.log(data)
					$('#aa').val(data.id);
					$('#loginname').val(data.loginname);
					$('#add_password').val(data.password);
					//$('#password1').val(data.password);
					$('#username').val(data.username);
					$('#phoneNum').val(data.phoneNum);
					$('#emailAddr').val(data.emailAddr);
					//角色设置值
					if(1 == data.roleId){
						$('#radio1').prop("checked","checked"); 
					}else if(2 == data.roleId){
						$('#radio2').prop("checked","checked"); 
					}else if(3 == data.roleId){
						$('#radio3').prop("checked","checked"); 
					}
			}
		}
					
	});
}
/**
 * 用户增加和修改（后台判断执行具体操作）
 */
function userSub(){
	var id=$('#aa').val();
	var loginname=$('#loginname').val();
	//var password=$('#password1').val();
	var add_password=$('#add_password').val();
	var username=$('#username').val();
	var phoneNum=$('#phoneNum').val();
	var emailAddr=$('#emailAddr').val();
	var bgFlag = $('#bgFlag').val();
	$(".roleId").each(function(){
		  if($(this).is(":checked")){
			  roleId=$(this).val();
	        }
	  });
	var dt = {
				id:id,
				loginname:loginname,
				password:add_password,
				bgFlag:bgFlag,
				username:username,
				phoneNum:phoneNum,
				emailAddr:emailAddr,
				roleId:roleId
		};
		$.ajax({
			url: '../user/saveUserConfigInfo',
			type: 'post',
			data: dt,
			success: function(data){
				if(id==""){
				 /* alert("添加成功"); */
					 win.alert('系统提示', '添加成功',  function(){
						 /* showConfigList();
						 $("#infodiv").css("display","none"); */
						 showConfigList();
						 $("#infodiv").css("display","none");
						 $(".popup3").css("display","none");
						 $("#mask").hide();
					 });
				}else{
					win.alert('系统提示', '修改成功',  function(){
						 /* showConfigList();
						 $("#infodiv").css("display","none"); */
						 showConfigList();
						 $("#infodiv").css("display","none");
						 $(".popup3").css("display","none");
						 $("#mask").hide();
					 });
				}
				
			}
		}); 
}
//zcm mark ed
</script>
</head>
<body class="body-bg">
	<div class="index_top pos_fix">
		<h3 class="fl title" style="margin:0px;">用户管理 </h3>
		<div class="title_r fr" style="display:none;">
			<span class="set_span set_span2" onclick="changeConfig(this, 1);">事件配置</span>
		</div>
	</div>
	<div class="index_bottom">
	<input type="hidden" id="pageIndexNew" value="0"/>
		<div class="table_box">
			<ul class="table_ul mgl-30 clearfix" style="float:right;height:30px;weigth:50px;margin:0px 10px 0 80px;">
				<li style="margin-right:58px;"><input type="button" class="addbutton" value="新增用户" onclick="addConfig();"></li>
			</ul>
			<table class="table">
				<thead>
					<tr>
						<th>序号</th>
						<th>用户名称</th>
						<th>登录名称</th>
						<th>手机号码</th>
						<th>邮箱</th>
						<th>角色名称</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<div id="Pagination" class="pagination"><!-- 这里显示分页 --></div>
		</div>
	</div>
	<div id="mask" class="mask"></div>
	<div class="popup3" style="height: 320px;border: 0px solid #3f4c70;color: #fff;position: fixed;left: 50%;top: 50%;margin-left: -216px;margin-top: -160px;display: none;z-index: 999;">
		<div class="popup_t" style="width:432px;">
			<h3 class="popup_h3 fl" style="comargin-left:5px;margin-top:4px;color: white;">添加用户</h3>
	    <label style="float:right;margin-top:2px;margin-right:3px;"><image src="<%=basePath %>/static/images/delete.png" style="heigt:20px;width:22px" class="delete"></image></label>
		</div>
		<div class="popup_m" style="padding: 10px;height: 195px;">
			<form id="configForm" action="../user/saveUserConfigInfo" method="post">
				<input type="hidden" id="aa" value="" name="id"/>
				<input type="hidden" id="password" value="" name="password"/>
				<input type="hidden" name="bgFlag" value="${bgFlag}" id="bgFlag"/>
				<div class="tab2 clearfix" style="display:none;" id="infodiv">
					<input type="hidden" id="configFlag" name="configFlag" value="1" />
					<!-- 用户管理 -->
						<ul class="table_ul clearfix" style="padding-top: 2px;">
							<li>
								<div class="td1 fl"><span class="fl" style="padding-left: 20px;padding-top: 2px;">用户名称：</span></div>
								<div class="fl">
									<input type="text" name="username" id="username" class="required" onblur="validateUsername()" style="position:relative;left: -30px "/>
									<span id="span1" style=" position:relative;width: 40px; left: -25px;" name="" ></span>
								</div>
							</li>
						</ul>	
						<ul class="table_ul clearfix" style="padding-top: 2px;">
							<li>
								<div class="td1 fl"><span class="fl" style="padding-left: 20px;padding-top: 2px;">角色名称：</span></div>
								<div class="fl">
									<input id="radio2" class="roleId" type="radio" name="roleId" value="2" checked="checked" style="position:relative;left: -30px;top: 5px; "><label for="radio2" style="position:relative;left: -30px; vertical-align: middle "> 普通用户</label>
									<input id="radio3" class="roleId" type="radio" name="roleId" value="3" style="position:relative;left: -30px;top: 5px "><label for="radio3" style="position:relative;left: -30px; vertical-align: middle;" > 宾客用户</label>
									<input id="radio1" class="roleId" type="radio" name="roleId" value="1" style="position:relative;left: -30px;top: 5px; "><label for="radio1" style="position:relative;left: -30px; vertical-align: middle;"> 管理员</label>
								</div>
							</li>
						</ul>
						<ul class="table_ul clearfix" style="padding-top: 2px;">
							<li>
								<div class="td1 fl"><span class="fl" style="padding-left: 20px;padding-top: 2px;">登录名称：</span></div>
								<div class="fl">
									<input type="text" name="loginname" id="loginname"  class="required" onblur="validateLoginname()" style="position:relative;left: -30px " />
									<span id="span2" style=" position:relative; width: 40px; left: -25px;" name="" ></span>
								</div>
							</li>
						</ul>
						<ul class="table_ul clearfix" style="padding-top: 2px;">
							<li>
								<div class="td1 fl"><span class="fl" style="padding-left: 20px;padding-top: 2px;">登录密码：</span></div>
								<div class="fl">
									<input type="text" name="add_password" id="add_password" class="required" onblur="validateAddPassword()" style="position:relative;left: -30px;ime-mode:disabled" onkeyup="value=value.replace(/[\u4E00-\u9FA5]/g,'')"/>
									<span id="span9" style=" position:relative;width: 40px; left: -25px;" name="" ></span>
								</div>
							</li>
						</ul>			
						<ul class="table_ul clearfix" style="padding-top: 2px;">
							<li>
								<div class="td1 fl"><span class="fl" style="padding-left: 20px;padding-top: 2px;" >手机号码：</span></div>
								<div class="fl">
									<input type="text" name="phoneNum" id="phoneNum" onblur="validatePhoneNum()" style="position:relative;left: -30px "/>
									<span id="span4" style=" position:relative; width: 40px; left: -25px;" name="" ></span>
								</div>
							</li>
						</ul>			
						<ul class="table_ul clearfix" style="padding-top: 2px;">
							<li>
								<div class="td1 fl"><span class="fl" style="padding-left: 20px;padding-top: 2px;">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</span></div>
								<div class="fl">
									<input type="text" name="emailAddr" id="emailAddr" onblur="validateEmailAddr()" style="position:relative;left: -30px "/>
									<span id="span5" style=" position:relative; width: 40px; left: -25px;" name="" ></span>
								</div>
							</li>
						</ul>			
				</div>
			</form>
		</div>
		<div class="popup_b">
			<p class="fr">
		         <span id="scheduleState1" class="save" onclick="sss()">提交</span>
			</p>
		</div>
	</div>
<div id="shadow" class="shadow"></div>
<script>
$(function(){
	$(".delete").on('click',function(){
		$(".popup3").css("display","none");
		$("#mask").hide();     
			
	});
});
</script>
<jsp:include page="./updateUserPassword.jsp"/>
</body>
</html>