<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String basePath = request.getContextPath();
%>
<%  
	session.setAttribute("selectekey",  3);  //把b放到session里，命名为a，  
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>热力图</title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/style.css">
<!-- 两种皮肤切换 -->
<c:if test="${bgFlag == null or bgFlag == 1}">
	<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css"/>
	<link rel="stylesheet" href="<%=basePath %>/static/css/sec2.css">
</c:if>
<c:if test="${bgFlag == 2}">
	<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.min.css"/>
	<link rel="stylesheet" href="<%=basePath %>/static/css/sec2_2.css">
</c:if>
<style>
	.time_selec_box{
		position:absolute;
		top:38px;
		right:0px;
	}
	.time_selec{
		width:300px;
		height:150px;
		background:rgba(0,0,0,0.5);
		color:#fff;
		padding-top:10px;
		display:none;
	}
	.time_span_box{
		padding-left:60px;
		border-bottom:1px solid #ececec;
	}
	.time_span{
		display:inline-block;
		width:73px;
		height:25px;
		text-align:center;
		line-height:25px;
		cursor:pointer;
		margin-bottom:10px;
	}
	.time_span_act{
		background:#88bff0;
		border-radius:3px;
	}
	.time_inp_box{
		padding-left:20px;
		margin-top:10px;
	}
	.selec_time_inp{
		padding: 0px 8px;
	    margin: 0px 4px;
	    height: 20px;
	    line-height: 20px;
	    background: url(../static/images/inp_bg.png) repeat-x;
	    border: 1px solid #49567a;
	    border-radius: 1px;
	    color: #fff;
	}
	.sec_box{
		text-align:center;
	}
	.sec_box span{
		width:74px;
		height:24px;
		display:inline-block;
		text-align:center;
		line-height:24px;
		cursor:pointer;
		background:#287fcb;
		border-radius:3px;
		margin-top:10px;
	}
	.bottom_left{
		width:144px;
		position:absolute;
		bottom:200px;
		left:0px;
		background:rgba(0,0,0,0.5);
		color:#fff;
	}
	.one_ul{
		border-bottom:1px solid #373636;
	}
	.one_ul a{
		position:relative;
		line-height:24px;
		cursor:pointer;
		padding:0px 10px;
		display:inline-block;
		width:124px;
		border:1px solid #373636;
		border-bottom:none;
	}
	.one_ul a.act{
		background:#287fcb;
	}
	.two_ul{
		display:none;
		width:240px;
		position:absolute;
		top:0px;
		left:144px;
		background:rgba(0,0,0,0.1);
		color:#fff;
		white-space:nowrap;
	}
	.two_ul li{
		padding:0px 5px;
	}
	.two_ul li.act{
		background:#eeeeee;
		color:#000;
	}
	
	.bottom_right{
		position:absolute;
		right:10px;
		bottom:10px;
	}
	.to_show{
		width:20px;
		padding:10px 7px;
		position:absolute;
		left:-34px;
		top:0px;
		background:#006ae2;
		border-radius:3px;
		color:#fff;
		cursor:pointer;
	}
	.to_show_img{
		width:5px;
		height:8px;
		display:inline-block;
		background:url(../static//images/to_show_img.png) no-repeat;
		margin-left:5px;
	}
	.to_hide_img{
		width:5px;
		height:8px;
		display:inline-block;
		background:url(../static//images/to_hide_img.png) no-repeat;
		margin-left:5px;
	}
</style>
</head>
<body>
<script type="text/javascript" src="<%=basePath%>/static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/echarts.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/bmap.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=53oVIOgmSIejwV7EfphPgTynOZbIiVYu"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/echarts/map/world.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
<script src="<%=basePath%>/static/js/sec2.js"></script>
	<div class="shy_top">
		<input type="hidden" id="moduleCode" value="${moduleCode}">
		<input type="hidden" id="djpzid" value="0"/>
		<h3 class="fl title" style="line-height:12px;">首页</h3>
		<ul class="chart_change">
			<li id="worldclick">地球仪</li>
			<li id="worldclick2">散点图</li>
			<li class="act" id="worldclick3">热力图</li>
		</ul>
	</div>
	<div class="index_bottom" style="padding:0px;padding-top:38px; margin-top:0px;">
		<div style="height:95%; width:100%;" id="mapDiv"></div>
	</div>
	<jsp:include page="event_tab_home.jsp"></jsp:include>
<script type="text/javascript" src="<%=basePath%>/static/js/dep/esl.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/dep/text.js"></script>

<c:if test="${bgFlag == null or bgFlag == 1}">
	<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
	<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
</c:if>
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>

<script>
	$(function (){
		//$("#"+${pzid}).click();
		//默人第一个点击
		if(${pzid} == 0){
			$('#tab_ul').children().eq(0).click();
		}else{
			$("#"+${pzid}).click();
		} 
		$("#djpzid").val(${pzid});
		
		var bodyH = $(window).height();
		$(".index_bottom").height(bodyH - 38 );
		
		$(".one_ul a").on("mouseenter",function (){
			$(this).children(".two_ul").addClass("show");
		}).on("mouseleave",function (){
			$(this).children(".two_ul").removeClass("show");
		});
		
		$(".time_span_box span").on("click",function (){
			$(this).addClass("time_span_act").siblings().removeClass("time_span_act");
		});
		
		$(".one_ul a").on("click",function (){
			$(this).addClass("act").siblings().removeClass("act");
		});
		
		$("#worldclick").on("click",function (){
			$(this).addClass("act").siblings().removeClass("act");
			window.location.href='../search/home2?bgFlag='+${bgFlag}+'&&pzid='+$("#djpzid").val();
		});
		$("#worldclick2").on("click",function (){
			$(this).addClass("act").siblings().removeClass("act");
			window.location.href='../search/home3?bgFlag='+${bgFlag}+'&&pzid='+$("#djpzid").val();
		});
		$(".two_ul li").on("click",function (){
			$(this).addClass("act").siblings().removeClass("act");
		});
		$(".to_show").on("click",function (){
			if($(".time_selec").css("display") == "none"){
				$(".time_selec").css({"display":"block"});
				$(".to_show_img").removeClass("to_show_img").addClass("to_hide_img");
			}else{
				$(".time_selec").css({"display":"none"});
				$(".to_hide_img").removeClass("to_hide_img").addClass("to_show_img");
			}
		})
		$(".chart_btn_change2 p").on("click",function (){
			if($(this).hasClass("act")){
				$(this).removeClass("act").siblings().addClass("act");
			}else{
				$(this).addClass("act");
			}
		})
	})
	var geoCoordMap;
	var data1;
	var data2;
	var data3;
	var data4;
	//实时查询
	function worldmapRender(){
		startLoad();
		$.ajax({
			url:'<%=basePath%>/home/findthermodynamicchart',
			type:'get',
			dataType:'json',
			success:function(data){
				rlop(data);
				endLoad();
			},
			error:function(data){
				endLoad();
			}
		});
	}
	function render(configId){
		if(configId==0){
			worldmapRender();
			$("#djpzid").attr("value",configId);
		}else{
			startLoad();
			 var oo = configId;
			 $("#djpzid").attr("value",oo);
			 var resultcode = 'rl';
				$.ajax({
					url:'<%=basePath%>/search/homedata?configId='+configId+'&resultcode='+resultcode,
					type: 'Get',
					dataType:"json",
					success:function(data){
						if(data != null || data != undefined || data.length >0){
							rlop(data);
						}
						endLoad();
					},
					error:function(data){
						endLoad();
						alert("该查询条件没有预处理,请先去配置页面进行预处理");
					}
				});
		}
	}
	function rlop(data){
		if(data.geoCoordMap != undefined){
			geoCoordMap = data.geoCoordMap;
			
		}
		if(data.r1 != undefined){
			data1 = data.r1;
		}
		if(data.r2 != undefined){
			data2 = data.r2;
		}
		if(data.r3 != undefined){
			data3 = data.r3;
		}
		if(data.r4 != undefined){
			data4 = data.r4;
		}
		if(${bgFlag} == 1){
			var bgcolor = [{
	            'featureType': 'water',
	            'elementType': 'all',
	            'stylers': {
	                'color': '#010207'
	            }
	        }, {
	            'featureType': 'land', //调整土地颜色
	            'elementType': 'all',
	            'stylers': {
	                'color': '#06517B'
	            }
	        }, {
	            'featureType': 'railway',
	            'elementType': 'all',
	            'stylers': {
	                'visibility': 'off'
	            }
	        }, {
	            'featureType': 'highway',//调整高速道路颜色
	            'elementType': 'all',
	            'stylers': {
	                'color': '#fdfdfd'
	            }
	        }, {
	            'featureType': 'highway',//调整高速名字是否可视
	            'elementType': 'labels',
	            'stylers': {
	                'visibility': 'off'
	            }
	        }, {
	            'featureType': 'arterial',//调整一些干道颜色
	            'elementType': 'geometry',
	            'stylers': {
	                'color': '#fefefe'
	            }
	        }, {
	            'featureType': 'arterial',
	            'elementType': 'geometry.fill',
	            'stylers': {
	                'color': '#fefefe'
	            }
	        }, {
	            'featureType': 'poi',
	            'elementType': 'all',
	            'stylers': {
	                'visibility': 'off'
	            }
	        }, {
	            'featureType': 'green',
	            'elementType': 'all',
	            'stylers': {
	                'visibility': 'off'
	            }
	        }, {
	            'featureType': 'subway',//调整地铁是否可视
	            'elementType': 'all',
	            'stylers': {
	                'visibility': 'off'
	            }
	        }, {
	            'featureType': 'manmade',
	            'elementType': 'all',
	            'stylers': {
	                'color': '#d1d1d1'
	            }
	        }, {
	            'featureType': 'local',
	            'elementType': 'all',
	            'stylers': {
	                'color': '#d1d1d1'
	            }
	        }, {
	            'featureType': 'arterial',
	            'elementType': 'labels',
	            'stylers': {
	                'visibility': 'off'
	            }
	        }, {
	            'featureType': 'boundary',
	            'elementType': 'all',
	            'stylers': {
	                'color': '#fefefe'
	            }
	        }, {
	            'featureType': 'building',//调整建筑物颜色
	            'elementType': 'all',
	            'stylers': {
	                'color': '#d1d1d1'
	            }
	        }, {
	            'featureType': 'label',
	            'elementType': 'labels.text.fill',
	            'stylers': {
	                'color': '#999999'
	            }
	        }];
		}else if(${bgFlag} == 2){
			var bgcolor = [{
	            'featureType': 'water',
	            'elementType': 'all',
	            'stylers': {
	                'color': '#A5C0DB'
	            }
	        }, {
	            'featureType': 'land', //调整土地颜色
	            'elementType': 'all',
	            'stylers': {
	                'color': '#F3F2F0'
	            }
	        }, {
	            'featureType': 'railway',
	            'elementType': 'all',
	            'stylers': {
	                'visibility': 'off'
	            }
	        }, {
	            'featureType': 'highway',//调整高速道路颜色
	            'elementType': 'all',
	            'stylers': {
	                'color': '#fdfdfd'
	            }
	        }, {
	            'featureType': 'highway',//调整高速名字是否可视
	            'elementType': 'labels',
	            'stylers': {
	                'visibility': 'off'
	            }
	        }, {
	            'featureType': 'arterial',//调整一些干道颜色
	            'elementType': 'geometry',
	            'stylers': {
	                'color': '#fefefe'
	            }
	        }, {
	            'featureType': 'arterial',
	            'elementType': 'geometry.fill',
	            'stylers': {
	                'color': '#fefefe'
	            }
	        }, {
	            'featureType': 'poi',
	            'elementType': 'all',
	            'stylers': {
	                'visibility': 'off'
	            }
	        }, {
	            'featureType': 'green',
	            'elementType': 'all',
	            'stylers': {
	                'visibility': 'off'
	            }
	        }, {
	            'featureType': 'subway',//调整地铁是否可视
	            'elementType': 'all',
	            'stylers': {
	                'visibility': 'off'
	            }
	        }, {
	            'featureType': 'manmade',
	            'elementType': 'all',
	            'stylers': {
	                'color': '#d1d1d1'
	            }
	        }, {
	            'featureType': 'local',
	            'elementType': 'all',
	            'stylers': {
	                'color': '#d1d1d1'
	            }
	        }, {
	            'featureType': 'arterial',
	            'elementType': 'labels',
	            'stylers': {
	                'visibility': 'off'
	            }
	        }, {
	            'featureType': 'boundary',
	            'elementType': 'all',
	            'stylers': {
	                'color': '#fefefe'
	            }
	        }, {
	            'featureType': 'building',//调整建筑物颜色
	            'elementType': 'all',
	            'stylers': {
	                'color': '#d1d1d1'
	            }
	        }, {
	            'featureType': 'label',
	            'elementType': 'labels.text.fill',
	            'stylers': {
	                'color': '#999999'
	            }
	        }];
		}
		//热力图
		 var myChart3 = echarts.init(document.getElementById('mapDiv'));
				var convertData = function (data) {
				    var res = [];
				    if(data != undefined){
				    	for (var i = 0; i < data.length; i++) {
					        var geoCoord = geoCoordMap[data[i].name];
					        if (geoCoord) {
					            res.push(geoCoord.concat(data[i].value));
					        }
					    }
				    }
				    return res;
				};
				var option1 = {
				    title: {
				        left: 'center',
				        textStyle: {
				            color: '#fff'
				        }
				    },
				    backgroundColor: '#404a59',
				    legend: {
				        orient: 'vertical',
				        left: 'left',
				        data:['口头合作','利益合作','口头冲突','利益冲突'],
				    },
				    visualMap: [
				                { 
				                    min: 0,
				                    max: 500,
				                    splitNumber: 5,
				                    inRange: {
				                        color: ['#FFB5B5','#CE0000']
				                    },
				                    textStyle: {
				                        color: '#fff'
				                    }, 
				                    seriesIndex:0,
				                    show:false
				                },
				               { 
				                    min: 0,
				                    max: 500,
				                    splitNumber: 5,
				                    inRange: {
				                        color: ['#FFFFCE','#E1E100']
				                    },
				                    textStyle: {
				                        color: '#fff'
				                    },
				                    seriesIndex:1,
				                    show:false
				                },
				                { 
				                    min: 0,
				                    max: 500,
				                    splitNumber: 5,
				                    inRange: {
				                        color: ['#C7C7E2','#484891']
				                    },
				                    textStyle: {
				                        color: '#fff'
				                    }, 
				                    seriesIndex:2,
				                    show:false
				                },
				                { 
				                    min: 0,
				                    max: 500,
				                    splitNumber: 5,
				                    inRange: {
				                        color: ['#A8FF24','#467500']
				                    },
				                    textStyle: {
				                        color: '#fff'
				                    }, 
				                    seriesIndex:3,
				                    show:false
				                }
				            ],
				    bmap: {
			               center: [104.114129, 37.550339],
			               zoom: 1,
			               roam: true,
			               mapStyle: {
			                   styleJson: bgcolor
			               }
			           },
			           series: [
			                    {
			                    name: '口头合作',
			                    type: 'heatmap',
			                    coordinateSystem: 'bmap',
			                    data: convertData(data1)
			                    },
			                    {
			                        name: '利益合作',
			                        type: 'heatmap',
			                        coordinateSystem: 'bmap',
			                        data: convertData(data2)
			                    },
			                    {
			                        name: '口头冲突',
			                        type: 'heatmap',
			                        coordinateSystem: 'bmap',
			                        data: convertData(data3)
			                    },
			                     {
			                        name: '利益冲突',
			                        type: 'heatmap',
			                        coordinateSystem: 'bmap',
			                        data: convertData(data4)
			                    }]
				};
				myChart3.setOption(option1);
	}
	function eventRGQuery(){
	 	var configName = document.getElementById("configName").value;
	 	var selects = document.getElementsByName("isSaveConfig"); 
	 	var moduleCode = $("#moduleCode").val();
	 	var isSaveConfig;
	 	$(".artificial_radio").each(function(){
	 		  if($(this).is(":checked")){
	 			isSaveConfig=$(this).val();
	 	        }
	 	   });
	         if (isSaveConfig==0) { 
	         	if(!configName==null||!configName==""){
	             	startLoad();
	             	$("#RGFL").val(moduleCode);
	             	$("#modelType").val(moduleCode);
	             	var formData = $("#eventQueryForm").serialize();
	             	$.ajax({
	             		url: '<%=basePath %>/config/renGongQuery',
	             		type: 'POST',
	             		data: formData,
	             		dataType:"json",
	             		success: function(data){
	             			//  1： 表示后台人工查询成功，并且返回到前台
	             			if(data=="1"){
	             				location.reload();
	             			}else if(data=="0"){
	             				alert("配置名称重复！！！");
	             			}else{
	             				rlop(data);
	             			}
	             			endLoad();	
	         	    	},
	         	    	error:function(data){
	         	    		endLoad();
	         	    		alert("人工查询配置异常，请到配置管理中查看。");
	         	    	}
	             	});
	             }else{
	             		alert("配置名称不能为空");
	             }
	         }else{
	         	startLoad();
	         	$("#RGFL").val(moduleCode);
	         	$("#modelType").val(moduleCode);
	         	var formData = $("#eventQueryForm").serialize();
	         	$.ajax({
	         		url: '<%=basePath %>/config/renGongQuery',
	         		type: 'POST',
	         		data: formData,
	         		dataType:"json",
	         		success: function(data){
	         			
	         			//  1： 表示后台人工查询成功，并且返回到前台
	         			if(data=="1"){
	         				location.reload();
	         			}else{
	         				rlop(data);
	         			}
	         			endLoad();	
	     	    	},
	     	    	error:function(data){
	     	    		endLoad();
	     	    		alert("人工查询配置异常，请到配置管理中查看。");
	     	    	}
	         	});
	         }
	 }
</script>
<jsp:include page="../updateUserPassword.jsp"/>
</body>
</html>