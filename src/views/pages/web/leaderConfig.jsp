<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String basePath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>人物配置</title>
<link rel="stylesheet" href="<%=basePath %>/static/css/style.css" />
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.min.css" />
<link rel="stylesheet" href="<%=basePath %>/static/lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath %>/static/css/combo.select.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/perfect-scrollbar.css" />
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window.css"/><!-- 弹出提示框样式 -->
<style type="text/css">
/* 人物头像放大 */
  .headerImage{  
        cursor: pointer;  
        transition: all 0.6s;  
   }  
   .headerImage:HOVER{  
       transform: scale(5);  
   }  

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
.combo-dropdown li{float:left; width:82%;}
	/* 表格滚动条 */
	.table thead tr {
		 display:block; 
	}
	.table tbody {
		display: block;
	    height: 99%;
		overflow: auto;
	}
	/*滚动条*/
	.table tbody::-webkit-scrollbar
		{
		  width: 2px;
		  height: 8px;
		  background-color: rgba(255, 255, 255, 0.2);
		}
	.table tbody::-webkit-scrollbar-track
		
	{
	  -webkit-box-shadow: inset 0 0 8px rgb(1, 64, 118);
	  border-radius: 2px;
	  background-color:#424242;
	}
			
	.table tbody::-webkit-scrollbar-thumb
	{
	  border-radius: 10px;
	  -webkit-box-shadow: inset 0 0 8px #014076;
	  background-color:#2b3554;
	}
	/* 分页样式 */
	.pagination {
	    float: right;
	    margin-top: 10px;
	}
</style>

<script src="<%=basePath %>/static/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath %>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath %>/static/js/perfect-scrollbar.js"></script>
<script src="<%=basePath %>/static/lib/jquery.pagination.js"></script>
<script src="<%=basePath %>/static/lib/jquery.form.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-select.min.js"></script>
<script src="<%=basePath %>/static/js/jquery.combo.select.js"></script>
<script src="<%=basePath %>/static/js/config/config.js"></script>
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<link rel="stylesheet"
	href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css" />
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
<script type="text/javascript">
function showMask(){
    $("#mask").css("height",$(document).height());
    $("#mask").css("width",$(document).width());
    $("#mask").show();
}
//隐藏遮罩层
function hideMask(){
    $("#mask").hide();
}
//新增人物
function addConfig(){
	
		$("#gkgName").attr("readonly",false);
		$("#necessaryKey").attr("readonly",false);
	    $("#exclusiveKey").attr("readonly",false);
	    $("#atLeastOneKey").attr("readonly",false);
		$("#aa").val("");
		$("#mask").css("height",$(document).height());
	    $("#mask").css("width",$(document).width());
	    $("#mask").show();
		$(".popup3").css("display","block");
		//$("#span2").attr({ "src": ""});
		//$("#span2").css({ display: "none"});
		//清空展示图片的div
		$("#preview").empty();
		$("#span1").text("");
		$("#span3").text("");
		$("#span4").text("");
		$("#leaderChName1").text("");
		$("#leaderChName").val("");
		$(".popup_h3").text("");
		$(".popup_h3").text("添加人物");
		$("input[name='configName']").val(""); 
		$("input[name='graph_type']").val(""); 
		$("input[name='remark']").val("");
		$("input[name='gkgRemark']").val("");
		$("#leaderPath").hide();
		$('#popup_ul_atlas input[type=checkbox]').each(function(){
			$(this).prop('checked', false);
	    });
		$("input[name='gkgStDate']").val("2014-08-05");
		$("input[name='gkgEdDate']").val("2015-02-08");
		$("input[name='necessaryKey']").val("");
		$("input[name='exclusiveKey']").val("");
		$("input[name='atLeastOneKey']").val("");
		$("#scheduleState1").css("display","block");
		$("#isPrivate option").each(function(){
			if($(this).val()=="-1"){
				$(this).parent().siblings('input[type=text]').val("请选择");
				$(this).attr('selected', true);
			}else{
				$(this).attr('selected', false);
			}
		});
}
//zcm mark st
var rs = null;
function showConfigList(){
	var configName = $('#s_configName').val();
	var scheduleState = $('#scheduleStateFilter').val();
	var pageIndexNew = $('#pageIndexNew').val();
	var dt = {
			pageIndex:pageIndexNew
		/*
		configName: configName,
		creator: creator,
		configCategory: configCategory,
		configFlag: configFlag
		*/
	};
	if(configName != null && configName != ''){
		dt['leaderName'] = configName;
	}
	if(scheduleState != null && scheduleState != ''){
		dt['leaderCountry'] = scheduleState;
	}
	$.ajax({
		url:'../leader/getConfigList1',
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
	var dt = {
		pageIndex: pageIndex
	};
	if(rs == null){
		$.ajax({
			url: '../leader/getConfigList1',
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
//删除人物
function delConfig1(id){
	
	win.confirm('系统提示', '确定要删除该人物信息吗?', function (r) {
        if(r){
        	var dt = {id:id};
    		$.ajax({
    			url: '../leader/delConfig',
    			type: 'POST',
    			data: dt,
    			dataType:"json",
    			success: function(data){
    				if(data.msg == '1'){
    					/* alert('删除成功!');
    					showConfigList();
    					$("#infodiv").css("display","none"); */
    					win.alert('系统提示', '人物删除成功',  function(){
    						showConfigList();
    						$("#infodiv").css("display","none");
						 });
    				}else {
    					win.alertEx('删除失败');
    				}
    			}
    		});
        }else{
        	win.alertEx("已取消");
        }
  });
	
	
	/* if(confirm('确定要删除该人物信息吗?')){
		var dt = {id:id};
		$.ajax({
			url: '../leader/delConfig',
			type: 'POST',
			data: dt,
			dataType:"json",
			success: function(data){
				if(data.msg == '1'){
					alert('删除成功!');
					showConfigList();
					$("#infodiv").css("display","none");
				}else if(data.msg == '2'){
					alert('删除失败');
				}else if(data.msg == 'error'){
					alert('系统异常，请联系系统管理员!');
				}
			}
		});
	} */	
}

//修改回显数据
function editConfig1(id, categoryName,scheduleState){
	//控制页面div
     $("#mask").css("height",$(document).height());
     $("#mask").css("width",$(document).width());
     $("#mask").show();
	//$(".shadow").css("display","block");
	$(".popup3").css("display","block");
	$(".popup_h3").text("修改人物");
	$("#span1").text("");
	$("#span3").text("");
	$("#span4").text("");
	$("#leaderChName1").text("");
	$("#gkgRemark").val('');
	//$("#leaderPath").show();
	//$("#leaderPath").css("height":"30px","width":"40px");
	var dt = {id: id};
	$.ajax({
		url: '../leader/selectLeaderById',
		type: 'GET',
		data: dt,
		dataType:"json",
		success: function(data){
	     //回显数据 
            $("#gkgName").empty();
            $("#leaderChName").empty();
           // $("#isPrivate").empty();
            //$("#gkgRemark").empty();
            $("#necessaryKey").empty();
            $("#exclusiveKey").empty();
            $("#atLeastOneKey").empty();
            //图片清空
            /* if("" == data.leaderPath){
            	$("#span2").css({display:"none"});
            $("#span2").attr({ "src":""});
            } */
            $("#preview").empty();
            $("#span3").text("")
            //开始赋值 data.leaderCountry
             $("#gkgName").val(data.leaderName);
             $("#gkgName").attr("readonly",true);
             $("#aa").val(data.id);
             $('#isPrivate option').each(function(){
					if(data.leaderCountry == $(this).val()){
						$(this).parent().siblings('input[type=text]').val($(this).html());
						$(this).attr('selected', true);
					}else{
						$(this).attr('selected', false);
					}
			});
             //$("#isPrivate").css("pointer-events","none");

             
             //$("#isPrivate").;
             //$("#gkgRemark").val(data.leaderPath);
             //$("#leaderPath").attr({ "src": "../leader/imagePath?imagePath="+data.leaderPath, "alt": "Test Image" });
             //图片回显
             var leaderImagePath;
             if("" != data.leaderPath){
            	 leaderImagePath = data.leaderPath;
             }else{
            	 leaderImagePath = "simple.jpg";
             }
             //添加图片回显
             var imgNode = document.createElement('img');
             imgNode.setAttribute('src','../leader/imagePath?imagePath='+leaderImagePath);
             document.getElementById('preview').appendChild(imgNode);
             imgNode.width = 117;
             imgNode.height = 108;
             imgNode.style.marginTop = 0 + 'px';
             $("#necessaryKey").val(data.necessaryKey);
             $("#exclusiveKey").val(data.exclusiveKey);
             $("#atLeastOneKey").val(data.atLeastOneKey);
             $("#necessaryKey").attr("readonly",true);
             $("#exclusiveKey").attr("readonly",true);
             $("#atLeastOneKey").attr("readonly",true);
             $("#leaderChName").val(data.leaderChName);
		}
	});
}

	function packageConfigData(rs){
		
		//计算序号与分页是对应的数值
		var pageIndex_current = $('#pageIndexNew').val();
		var pageSize = 30;
		var tbody = '', trs = '';
		$.each(rs, function(i, item){
			trs += '<tr><td style="width: 5%">' + (pageIndex_current * pageSize + i + 1) + '</td>';
		    trs += '<td style="width: 6.5%;    min-width: 83px;">' + item.leaderName + '</td>';
		    trs += '<td style="width: 6.5%">'+ item.leaderChName +'</td>';
		    if (item.leaderCountry != ''){
		    	trs += '<td style="width: 5%">' + item.leaderCountry + '</td>';
		    }else{
		    	trs += '<td style="width: 5%">暂无</td>';
		    }
			
			if (item.leaderPath != ''){
				trs += '<td style="width: 5%"><img class="headerImage" src="<%=basePath %>/leader/imagePath?imagePath='+ item.leaderPath +'" height="20px" width="40px"/></td>';
			}else{
				trs += '<td style="width: 5%"><img class="headerImage" src="<%=basePath %>/leader/imagePath?imagePath=simple.jpg" height="20px" width="40px"/></td>';
			}
			if(item.necessaryKey == null || item.necessaryKey == ''){
				trs += '<td style="width: 5%"></td>';
			}else{
				trs += '<td style="width: 5%">' + item.necessaryKey + '</td>';
			}
			if(item.exclusiveKey == null || item.exclusiveKey == ''){
				trs += '<td style="width: 5%"></td>';
			}else{
				trs += '<td style="width: 5%">' + item.exclusiveKey + '</td>';
			}
			if(item.atLeastOneKey == null || item.atLeastOneKey == ''){
				trs += '<td style="width: 5%"></td>';
			}else{
				trs += '<td style="width: 5%">' + item.atLeastOneKey + '</td>';
			}
			
			trs += '<td style="width: 5%"><img title="修改" class="set" src="<%=basePath %>/static/images/set.png" onclick="editConfig1('+ item.id +')"/><img title="删除" class="del" onclick="delConfig1('+ item.id+')" src="<%=basePath %>/static/images/del.png"/></td>';
			trs += '</tr>';
		});
		tbody += trs;
			
	
		return tbody;
	
	}

	showConfigList();
	//英文名称校验
	function validateLeader1(){
		  var leaderName = $("#gkgName").val();
		  var leader=leaderName.split(" ");
		  $("#necessaryKey").val('');
		  var aa=$("#aa").val();
	      var dt = {leaderName:leaderName,id:aa};
	      if(leaderName == ""){
	    	  $("#span1").text("英文名称为空");
	    	  $("#span1").css({color:"red"});
	      }else{
	    	  //判断英文名称的格式不能用中文并且不能有,
	    	   var req = /^.*[\u4E00-\u9FA5]+.*$/;//需要再加
			   if (req.test(leaderName)) {
				   $("#span1").text("英文名称不能包含汉字");
				   $("#span1").css({color:"red"});
			   }else{
				   //分割付给必须包含的关键字
				   var leader_value="";
				   for(var i=0;i<leader.length;i++){
					  if(leader[i].length!=0){
						  leader_value+=leader[i]+","
					  }
				    }
					$("#necessaryKey").val(leader_value);
					//清空提示span
					$("#span1").text("");
		    		$.ajax({
		  	  	  		url:'../leader/validateLeader',
		  	  	  		type: 'POST',
		  	  	  		data: dt,
		  	  	  		dataType:"json",
		  	  	  		async:false,
		  	  	  		success: function(data1){
		  	  	  			var msg =  data1.msg;
		  	  	  			if(msg == 'error'){
		  	  	  				$("#span1").text("校验人物名称发生错误");
		  	  	  				$("#span1").css({color:"red"});
		  	  	  				win.alertEx("校验人物名称发生错误");
		  	  	  			}else if(msg == 1){
			  	  	  			$("#span1").text("英文名称重复");
	  	  	  			    	$("#span1").css({color:"red"});
		  	  	  			}else if(msg == 2){
			  	  	  			$("#span1").text("英文名称不能以该值命名");
	  	  	  			    	$("#span1").css({color:"red"});
		  	  	  			}else{
		  	  	  				$("#span1").text("");
		  	  	  			}
		  	  	  		}
		  	  	  	});  
			   }
	    }
	      
	}
	//校验人物中文名称
	function validateLeader2(){
		  var leaderChName = $("#leaderChName").val();
		  if(leaderChName.length == 0){
			  $("#leaderChName1").text("中文名称为空");
			  $("#leaderChName1").css({color:"red"});
		  }else{
			  $("#leaderChName1").text("");
		  }
		  
		  
		  /* var  countryName = $("#isPrivate").val();
		  var aa=$("#aa").val();
	      var dt = {leaderChName:leaderChName,leaderCountry:countryName,id:aa};
		  if(leaderChName ==""){
			  $("#leaderChName1").text("中文名称为空");
			  $("#leaderChName1").css({color:"red"});
			  
		  }else{
			  $("#leaderChName1").text("");
			  $.ajax({
	  	  	  		url:'../leader/validateLeader',
	  	  	  		type: 'POST',
	  	  	  		data: dt,
	  	  	  		dataType:"json",
	  	  	  		success: function(data1){
	  	  	  			if(data1.msg == '1'){
	  	  	  				
	  	  	  			    if(data1.data == '2'){
	  	  	  			    	$("#leaderChName1").text("中文名称重复");
	  	  	  			    	$("#leaderChName1").css({color:"red"});
	  	  	  			    	//$("#span1").html("领导人为空或重复");
	  	  	  			    	
	  	  	  			    }else if(data1.data == '3'){
	  	  	  			    	//alert("不重复 ");
	  	  	  			    	$("#leaderChName1").text("");
	  	  	  			    }else{
	  	  	  			    	$("#leaderChName1").text("");
	  	  	  			    }
	  	  	  			}
	  	  	  			
	  	  	  		},
	  	  	  		error:function(data){
	  	  			}
	  	  	  	});  
			  
		  } */
	}
	
	//校验人物国家
	function validateCountry(){
		var country = $("#isPrivate").val();
		if(country == -1){
			$("#span4").text("请选择国家");
			$("#span4").css({color:"red"});
		}else{
			$("#span4").text("");
			$("#span4").css({color:"red"});
		}
	}
	
	//图片上传预览，非IE则用了HTML5的代码，IE是用了滤镜
    function previewImage(file){//MAXWIDTH、MAXHEIGHT与放预览图片的DIV——preview的大小相呼应
    	var f=document.getElementById("gkgRemark").value;
       	if(f.length > 15){
       		$("#span3").css({color:""});
    		$("#span3").text(".."+f.substring(f.lastIndexOf(".")-11,f.length));
       	}else{
       		$("#span3").css({color:""});
    		$("#span3").text(f);
       	}
        //选择的图片预览显示
        var div = document.getElementById('preview');
        if (file.files && file.files[0]) {//HTML5部分
	        div.innerHTML = "<img id='imghead'></img>";
	        var img = document.getElementById('imghead');
	        img.onload = function(){
	          img.width = 117;
	          img.height = 108;
	          img.style.marginTop = 0 + 'px';
	        }
	        var reader = new FileReader();
	        reader.onload = function(evt){
	          img.src = evt.target.result;
	        }
	        reader.readAsDataURL(file.files[0]);
       }
       else{
	        var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
	        file.select();
	        var src = document.selection.createRange().text;
	        div.innerHTML = "<img id='imghead'></img>";
	        var img = document.getElementById('imghead');
	        img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
	        var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
	        div.innerHTML = "<div style='width:" + 117 + "px;height:" + 108 + "px;margin-top:" + 0 + "px;" + sFilter + src + "\"'></div>";
      }
    }
    

$(document).ready(function() {
	//添加人物
	var options = {
		url : "<%=basePath %>/leader/addLeader",
		dataType : 'json',
		contentType : "application/json; charset=utf-8",
		success : function(data) {
			if($("#aa").val()==""){
				if(data.msg=="success"){
					/* alert("添加成功");
					location.reload(); */
					win.alert('系统提示', '人物添加成功',  function(){
						location.reload();
					});
				}else{
					win.alertEx("人物添加失败");
				}
			}else{
				if(data.msg=="success"){
					/* showConfigList();
					alert("修改成功"); */
					win.alert('系统提示', '人物修改成功',  function(){
						showConfigList();
					});
				}else{
					win.alertEx("人物修改失败");
				}
			}
			
		}
	};
	// ajaxForm
	//  $("#form1").ajaxForm(options);
	//提交 ajaxSubmit
	$("#scheduleState1").click(function() {
		$("#isPrivate").removeAttr("disabled");
		var aa = $("#gkgName").val();
		var aa1 = $("#leaderChName").val();
		//var xiala = $("#isPrivate").val();//国家信息
		var bxbh = $("#necessaryKey").val();
		var bnbh = $("#exclusiveKey").val();
		var zsyg = $("#atLeastOneKey").val();
		//判断领导人 是不是为空  
		validateLeader1();
		if($("#span1").text() != ""){
			return false;
		}
		if(aa1 == ""){
			$("#leaderChName1").text("中文名称为空");
			$("#leaderChName1").css({color:"red"});
			return false;
		}else{
			$("#leaderChName1").text("");
		}
		if($("#aa").val() == ""){//添加的时候进行关键字校验，修改的时候不进行关键字校验
			if(bxbh=="" && bnbh=="" && zsyg==""){
				win.alertEx("三种关键字必须输入一项。");
				return false;
			}
		}
		/* if(xiala=="-1"){
			$("#span4").text("请选择国家");
			$("#span4").css({color:"red"});
		}else{
			$("#span4").text("");
		} */
		if($("#span1").text() == "" && $("#leaderChName1").text() ==""){
			 $("#configForm").ajaxSubmit(options);
			 $(".popup3").css("display","none");
			 $("#mask").hide();    
		}
	});
	
	$(".delete").click(function(){
		$(".popup3").css("display","none");
		 $("#mask").hide();     
	});
	
	//选择照片
	$("#select").click(function(){
		$("#gkgRemark").click();
	});
	
	var options1 = {
		url : "<%=basePath %>/leader/saveImage",
		dataType : 'json',
		contentType : "application/json; charset=utf-8",
		success : function(data) {
			//showConfigList();
			 $("#span2").css({display:"block"});	
			 $("#span2").attr({ "src": "../leader/imagePath?imagePath="+data.realFileName});
		}
	};
	
	/* $("#gkgRemark").change(function(){
		var f=document.getElementById("gkgRemark").value;
        if(f==""){
			        $("#span2").attr({ "src": ""});
			    	$("#span2").css({ display: "none"});
			       　　　  $("#span3").text("请上传人物照片");
					$("#span3").css({color:"red"});return false;}
        else{
	        if(!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(f)){
		        	$("#span2").attr({ "src": ""});
		    		$("#span2").css({ display: "none"});
		        	$("#span3").text("图片的格式错误 ");
		    		$("#span3").css({color:"red"});
	          return false;
	        }else{
	        	if(f.length > 15){
	        		$("#span3").css({color:""});
	        		$("#configForm").ajaxSubmit(options1);
		    		$("#span3").text(".."+f.substring(f.lastIndexOf(".")-11,f.length));
	        	}else{
	        		$("#span3").css({color:""});
	        		$("#configForm").ajaxSubmit(options1);
		    		$("#span3").text(f);
	        	}
	        }
        }
	}); */
});
//zcm mark ed
</script>
</head>
<body class="peizhi_bg" style="overflow: hidden;">
	<div class="index_top pos_fix">
		<h3 class="fl title" style="margin: 0px;">配置管理 >人物配置</h3>
		<div class="title_r fr" style="display: none;">
			<!-- <span class="set_span set_span2" onclick="changeConfig(this, 1);">事件配置</span> -->
			<span class="set_span" onclick="changeConfig(this, 2);">图谱配置</span>
		</div>
	</div>
	<div class="index_bottom">
		<input type="hidden" id="pageIndexNew" value="0"/>
		<div class="table_box" style="height:100% ">
			<ul class="table_ul mgl-30 clearfix" style="height: 20px;">
				<li>人物名称：<input type="text" id="s_configName" /></li>
				<li></li>
				<li>
					<div style="float: left; line-height: 20px;">国家(地区)：</div>
					<div class="fl clearfix" style="float: left; height: 20px;">
						<div class="dowebok0">
							<select id="scheduleStateFilter" name="">
								<option value="" selected="selected">全部</option>
								<c:forEach items="${countryList}" var="country" varStatus="indx">
									<option value="${country.country_text}">${country.country_chinese_text}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</li>
				<li><input class="seach_btn" type="button" value="查询" onclick="cx()"></li>
				<li><input type="button" class="addLeaderbutton" value="新增人物" onclick="addConfig();"></li>
			</ul>
			<table class="table" style="height: 90%;" >
				<thead>
					<tr>
						<th style="width: 5%">序号</th>
						<th style="width: 6.5%">人物名称(英文)</th>
						<th style="width: 6.5%">人物名称(中文)</th>
						<th style="width: 5%">国家(地区)</th>
						<th style="width: 5%;margin-left: 2px;padding-left: 0px;padding-right: 0px">照片</th>
						<th style="width: 5%">必须包含</th>
						<th style="width: 5%">不能包含</th>
						<th style="width: 5%">至少包含</th>
						<th style="width: 5%">操作</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<!-- 分页 -->
			<div id="Pagination" class="pagination"></div>
			
		</div>
	</div>
	<div id="mask" class="mask"></div>


	<!-- 图谱分类选择弹出层 -->
	<div class="popup3" style="width: 440px;height: 420px;border: 0px solid #3f4c70;color: #fff;position: fixed;left: 50%;top: 50%;margin-left: -220px;margin-top: -210px;display: none;z-index: 999;">

		<div class="popup_t" style="width: 440px;">
			<h3 class="popup_h3 fl" style="margin-left:5px;margin-top:4px;color: white;">添加人物</h3>
	    <label style="float:right;margin-top:2px;margin-right:3px;"><image src="<%=basePath %>/static/images/delete.png" style="heigt:20px;width:22px" class="delete"></image></label>
		</div>

		<div class="popup_m" style="padding: 10px;height: 280px;">
			<form id="configForm" action="../leader/addLeader" method="post">
			<input type="hidden" id="aa" value="" name="id" />
			 <input type="hidden" name="bgFlag" value="${bgFlag}" />
			 <input type="hidden" value="" id="leader" />
			
					<div class="tab_down2" style="padding-top: 0px;">
						<ul class="table_ul clearfix" style="padding-top: 2px;">
							<li><span class="fl" style="margin-left:8px;padding-left: 10px;padding-top: 0px;">英文名称：</span>
								<input type="text" name="configName" id="gkgName" onchange="validateLeader1()" style="position: relative;left: 8px;width: 170px"/>
								<span id="span1" style=" position:relative;left:20px;width: 40px"></span>
							</li>
						</ul>
						<ul class="table_ul clearfix" style="padding-top: 20px;">
							<li><span class="fl" style="margin-left:8px;padding-left: 10px;">中文名称：</span>
								<input type="text" name="leaderChName" id="leaderChName" onchange="validateLeader2()" style="position: relative;left: 8px;width: 170px"/>
								<span id="leaderChName1" style=" position:relative;left:20px;width: 40px"></span>
							</li>
						</ul>
						<ul class="table_ul clearfix">
							<li style="margin-right: 0px;"><span class="fl" style="padding-left: 10px;">国家(地区)：</span>
							<li>
								<div class="fl dowebok2" style="width: 135px;margin-left:9px;" >
									<!-- <select class="fl" id="isPrivate" name="country" onchange="validateCountry()"> -->
									<select class="fl" id="isPrivate" name="country">
										<option value="-1">请选择</option>
										<c:forEach items="${countryList}" var="country">
											<option value="${country.country_text}">${country.country_chinese_text}</option>
										</c:forEach>
									</select>
								</div><span id="span4" style="position:relative;left:20px;width: 40px"></span>
							</li>
						</ul>
						<ul class="table_ul clearfix" style="padding-top: 1px;">
							<li>
							<span class="fl" style="margin-left:8px;padding-left: 10px;">图&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;片：</span>
							<input type="button" class="selectHeadImage" value="选择照片" id="select"></input>
							<span id="span3" style="position:relative;left:10px;height:16px;width: 20px"></span>
							<input type="file" name="gkgRemark" id="gkgRemark" onchange="previewImage(this)" accept="image/*"
								style="height: 14px; border: 0px;width: 160px; display: none" />
							</li>
						</ul>
						<div style=" position:absolute;left:308px;top:70px;height:90px;width: 100px;" id="preview"></div>
						<!-- <img style=" position:absolute;left:280px;top:70px;height:90px;width: 100px;display: none" name="" id="span2"></img> -->
						<ul class="tab_down_info" style="padding-top:17px;margin-left:0px;">
							 <li class="clearfix" style="padding-bottom: 0px;margin-bottom: 0px">
								<div style="margin-left:0px;padding-left: 5px;">您可以指定检索的人物关键词,可以用逗号隔开</div>
								<div class="fl" >
									<div class="condition fl fontBgStyle"  style="margin-left:0px;width:132px;padding-left: 6px;">必须包含人物关键字</div>
									<input class="cfg_condition_info fl" id="necessaryKey" name="necessaryKey" type="text" style="width: 180px"/>
								</div>
								<div class="fl condition_box2" style="margin-left:0px;padding-left: 5px;">
									<div class="condition fl fontBgStyle" style="padding-left:6px;width:132px">不能包含人物关键字</div>
									<input class="cfg_condition_info fl" id="exclusiveKey" name="exclusiveKey" type="text" style="width: 180px"/>
								</div>
								<div class="fl  condition_box3" style="margin-left:0px;padding-left: 5px;">
									<div class="condition fl fontBgStyle" style="padding-left:6px;width:132px">至少包含一个人物关键字</div>
									<input  class="cfg_condition_info fl" id="atLeastOneKey" name="atLeastOneKey" type="text" style="width: 180px"/>
								</div>
							</li>
							<li class="clearfix" style="display: none;" id="lingdaoren">
								<div class="td1 fl">
									<p class="weight_png fl"></p>
									<b>信息提示：</b>
								</div>
								<div>您必须指定检索的关键字，最多支持3个；在检索中，检索字之间的关系为"OR"。</div>
							</li>
						</ul>
					</div>

			</form>

		</div>

		<div class="popup_b" style="height: 32px;">
			<p class="fr">
		          <span class="save" id="scheduleState1" style="margin-top:4px;position:absolute;left: 370px">提交</span>
			</p>
		</div>
	</div>
	<script>
		$(function() {
			$('select').comboSelect();
			// 下拉框 每一个下拉框对应一个ID，然后调用perfectScrollbar美化滚动条
			$(".dowebok0 ul").attr("id", "description0");
			$(".dowebok ul").attr("id", "description");
			$(".dowebok2 ul").attr("id", "description2");
			$(".dowebok3 ul").attr("id", "description3");
			$(".dowebok4 ul").attr("id", "description4");
			$(".dowebok5 ul").attr("id", "description5");
			$(".dowebok6 ul").attr("id", "description6");
			$(".dowebok7 ul").attr("id", "description7");
			$(".dowebok8 ul").attr("id", "description8");

			$('#description0').perfectScrollbar({
				wheelSpeed : 10,
				wheelPropagation : false
			});
			$('#description').perfectScrollbar({
				wheelSpeed : 10,
				wheelPropagation : false
			});
			$('#description2').perfectScrollbar({
				wheelSpeed : 10,
				wheelPropagation : false
			});
			$('#description3').perfectScrollbar({
				wheelSpeed : 10,
				wheelPropagation : false
			});
			$('#description4').perfectScrollbar({
				wheelSpeed : 10,
				wheelPropagation : false
			});
			$('#description5').perfectScrollbar({
				wheelSpeed : 10,
				wheelPropagation : false
			});
			$('#description6').perfectScrollbar({
				wheelSpeed : 10,
				wheelPropagation : false
			});
			$('#description7').perfectScrollbar({
				wheelSpeed : 10,
				wheelPropagation : false
			});
			$('#description8').perfectScrollbar({
				wheelSpeed : 10,
				wheelPropagation : false
			});

		});
	//查询
	function cx(){
		$('#pageIndexNew').val(0);
		showConfigList();
	}
	</script>
<jsp:include page="./updateUserPassword.jsp"/>
</body>
</html>