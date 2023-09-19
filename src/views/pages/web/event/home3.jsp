<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String basePath = request.getContextPath();
%>
<%  
	session.setAttribute("selectekey",  2);  //把b放到session里，命名为a，  
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>XX安全检测系统_main</title>
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
<script src="<%=basePath%>/static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/echarts.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/bmap.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=53oVIOgmSIejwV7EfphPgTynOZbIiVYu"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/echarts/map/world.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
	<div class="shy_top" >
		<input type="hidden" id="moduleCode" value="${moduleCode}">
		<input type="hidden" id="djpzid" value="0"/>
		<h3 class="fl title" style="line-height:12px;">首页</h3>
		<ul class="chart_change">
			<li id="worldclick">地球仪</li>
			<li class="act" id="worldclick2">散点图</li>
			<li id="worldclick3">热力图</li>
		</ul>
	</div>
	<div class="index_bottom" style="padding:0px;padding-top:38px; margin-top:0px;">
		<div style="height:98%; width:100%;" id="mapDiv"></div>
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
<script src="<%=basePath%>/static/js/sec2.js"></script>
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
		/* $("#worldclick2").on("click",function (){
			$(this).addClass("act").siblings().removeClass("act");
			window.location.href='../search/home3?bgFlag='+${bgFlag};
		}); */
		$("#worldclick3").on("click",function (){
			$(this).addClass("act").siblings().removeClass("act");
			window.location.href='../search/home4?bgFlag='+${bgFlag}+'&&pzid='+$("#djpzid").val();
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
	})
	var data,geoCoordMap;
	//实时查询散点图数据
	function worldmapRender(){
		startLoad();
		$.ajax({
			url:'<%=basePath%>/home/findscatterdiagram',
			type:'get',
			dataType:'json',
			success:function(data){
				sdop(data);
				endLoad();
			},
			error:function(data){
				alert("加载数据时出现未知错误");
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
			 var resultcode = 'sdt';
				$.ajax({
					url:'<%=basePath%>/search/homedata?configId='+configId+'&resultcode='+resultcode,
					type: 'Get',
					dataType:"json",
					success:function(data){
						if(data != null || data != undefined || data.length >0){
							sdop(data);
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
	function sdop(data){
		if(data.r1 != undefined){
			data11 = data.r1.r11;
			data12 = data.r1.r12;
		}
		if(data.r2 != undefined){
			data21 = data.r2.r21;
			data22 = data.r2.r22;
		}
		if(data.r3 != undefined){
			data31 = data.r3.r31;
			data32 = data.r3.r32;
		}
		if(data.r4 != undefined){
			data41 = data.r4.r41;
			data42 = data.r4.r42;
		}
		geoCoordMap = data.geoCoordMap;
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
		var convertData = function (data) {
			var res = [];
			if(data != undefined){
				for (var i = 0; i < data.length; i++) {
						var geoCoord = geoCoordMap[data[i].name];
			               if (geoCoord) {
			                   res.push({
			                       name: data[i].name,
			                       value: geoCoord.concat(data[i].value)
			                   });
			               }
		         } 
			}
	         return res;
	       };
	       var myChart2 = echarts.init(document.getElementById('mapDiv'));
	       option = {
	           tooltip : {
	               trigger: 'item',
	               formatter: '类型:{a} 地点:{b} 经纬度:{c}'
	           },
	           legend: {
	        	   orient: 'vertical',
			       x: 'left',
	               data:['口头合作','利益合作','口头冲突','利益冲突'],
	               textStyle: {
	                   color: '#aaa'
	               }
	           },
	           bmap: {
	               center: [104.114129, 37.550339],
	               zoom: 1,
	               roam: true,
	               mapStyle: {
	                   styleJson: bgcolor
	               }
	           },
	           series : [
	               {
	                   name: '口头合作',
	                   type: 'scatter',
	                   coordinateSystem: 'bmap',
	                   data: convertData(data11),
	                   symbolSize: function (val) {
	                	   var value = val[2].substring(val[2].indexOf(":") + 1,val[2].length);
	                	   var newvalue;
	                	   if(value > 0 && value <= 100){
	                		   newvalue = value / 5;
	                	   }else if(value > 100 && value <= 1000){
	                		   newvalue = value / 50;
	                	   }else if(value > 1000 && value <= 10000){
	                		   newvalue = value / 500;
	                	   }else if(value > 10000){
	                		   newvalue = value / 5000;
	                	   }
	                       return newvalue;
	                   },
	                   label: {
	                       normal: {
	                           formatter: '{b}',
	                           position: 'right',
	                           show: false
	                       },
	                       emphasis: {
	                           show: true
	                       }
	                   },
	                   itemStyle: {
	                       normal: {
	                           color: '#ff4b34'
	                       }
	                   }
	               },
	               {
	                   name: '口头合作',
	                   type: 'effectScatter',
	                   coordinateSystem: 'bmap',
	                   data: convertData(data12), 
	                   symbolSize: function (val) {
	                	   var value = val[2].substring(val[2].indexOf(":") + 1,val[2].length);
	                	   var newvalue;
	                	   if(value > 0 && value <= 100){
	                		   newvalue = value / 5;
	                	   }else if(value > 100 && value <= 1000){
	                		   newvalue = value / 50;
	                	   }else if(value > 1000 && value <= 10000){
	                		   newvalue = value / 500;
	                	   }else if(value > 10000){
	                		   newvalue = value / 5000;
	                	   }
	                       return newvalue;
	                   },
	                   showEffectOn: 'render',
	                   rippleEffect: {
	                       brushType: 'stroke'
	                   },
	                   hoverAnimation: true,
	                   label: {
	                       normal: {
	                           formatter: '{b}',
	                           position: 'right',
	                           show: false
	                       }
	                   },
	                   itemStyle: {
	                       normal: {
	                           color: '#ff4b34',
	                           shadowBlur: 10,
	                           shadowColor: '#333'
	                       }
	                   },
	                   zlevel: 1
	               },
	               {
	                   name: '利益合作',
	                   type: 'scatter',
	                   coordinateSystem: 'bmap',
	                   data: convertData(data21),
	                   symbolSize: function (val) {
	                	   var value = val[2].substring(val[2].indexOf(":") + 1,val[2].length);
	                	   var newvalue;
	                	   if(value > 0 && value <= 100){
	                		   newvalue = value / 5;
	                	   }else if(value > 100 && value <= 1000){
	                		   newvalue = value / 20;
	                	   }else if(value > 1000 && value <= 10000){
	                		   newvalue = value / 500;
	                	   }else if(value > 10000){
	                		   newvalue = value / 5000;
	                	   }
	                       return newvalue;
	                   },
	                   label: {
	                       normal: {
	                           formatter: '{b}',
	                           position: 'right',
	                           show: false
	                       },
	                       emphasis: {
	                           show: true
	                       }
	                   },
	                   itemStyle: {
	                       normal: {
	                           color: '#faf702'
	                       }
	                   }
	               },
	               {
	                   name: '利益合作',
	                   type: 'effectScatter',
	                   coordinateSystem: 'bmap',
	                   data: convertData(data22),
	                   symbolSize: function (val) {
	                	   var value = val[2].substring(val[2].indexOf(":") + 1,val[2].length);
	                	   var newvalue;
	                	   if(value > 0 && value <= 100){
	                		   newvalue = value / 5;
	                	   }else if(value > 100 && value <= 1000){
	                		   newvalue = value / 50;
	                	   }else if(value > 1000 && value <= 10000){
	                		   newvalue = value / 500;
	                	   }else if(value > 10000){
	                		   newvalue = value / 5000;
	                	   }
	                       return newvalue;
	                   },
	                   showEffectOn: 'render',
	                   rippleEffect: {
	                       brushType: 'stroke'
	                   },
	                   hoverAnimation: true,
	                   label: {
	                       normal: {
	                           formatter: '{b}',
	                           position: 'right',
	                           show: true
	                       }
	                   },
	                   itemStyle: {
	                       normal: {
	                           color: '#faf702',
	                           shadowBlur: 10,
	                           shadowColor: '#333'
	                       }
	                   },
	                   zlevel: 1
	               },
	               {
	                   name: '口头冲突',
	                   type: 'scatter',
	                   coordinateSystem: 'bmap',
	                   data: convertData(data31),
	                   symbolSize: function (val) {
	                	   var value = val[2].substring(val[2].indexOf(":") + 1,val[2].length);
	                	   var newvalue;
	                	   if(value > 0 && value <= 100){
	                		   newvalue = value / 5;
	                	   }else if(value > 100 && value <= 1000){
	                		   newvalue = value / 50;
	                	   }else if(value > 1000 && value <= 10000){
	                		   newvalue = value / 500;
	                	   }else if(value > 10000){
	                		   newvalue = value / 5000;
	                	   }
	                       return newvalue;
	                   },
	                   label: {
	                       normal: {
	                           formatter: '{b}',
	                           position: 'right',
	                           show: false
	                       },
	                       emphasis: {
	                           show: true
	                       }
	                   },
	                   itemStyle: {
	                       normal: {
	                           color: '#00fafd'
	                       }
	                   }
	               },
	               {
	                   name: '口头冲突',
	                   type: 'effectScatter',
	                   coordinateSystem: 'bmap',
	                   data: convertData(data32),
	                   symbolSize: function (val) {
	                	   var value = val[2].substring(val[2].indexOf(":") + 1,val[2].length);
	                	   var newvalue;
	                	   if(value > 0 && value <= 100){
	                		   newvalue = value / 5;
	                	   }else if(value > 100 && value <= 1000){
	                		   newvalue = value / 50;
	                	   }else if(value > 1000 && value <= 10000){
	                		   newvalue = value / 500;
	                	   }else if(value > 10000){
	                		   newvalue = value / 5000;
	                	   }
	                       return newvalue;
	                   },
	                   showEffectOn: 'render',
	                   rippleEffect: {
	                       brushType: 'stroke'
	                   },
	                   hoverAnimation: true,
	                   label: {
	                       normal: {
	                           formatter: '{b}',
	                           position: 'right',
	                           show: true
	                       }
	                   },
	                   itemStyle: {
	                       normal: {
	                           color: '#00fafd',
	                           shadowBlur: 10,
	                           shadowColor: '#333'
	                       }
	                   },
	                   zlevel: 1
	               },
	               {
	                   name: '利益冲突',
	                   type: 'scatter',
	                   coordinateSystem: 'bmap',
	                   data: convertData(data41),
	                   symbolSize: function (val) {
	                	   var value = val[2].substring(val[2].indexOf(":") + 1,val[2].length);
	                	   var newvalue;
	                	   if(value > 0 && value <= 100){
	                		   newvalue = value / 5;
	                	   }else if(value > 100 && value <= 1000){
	                		   newvalue = value / 50;
	                	   }else if(value > 1000 && value <= 10000){
	                		   newvalue = value / 300;
	                	   }else if(value > 10000){
	                		   newvalue = value / 5000;
	                	   }
	                       return newvalue;
	                   },
	                   label: {
	                       normal: {
	                           formatter: '{b}',
	                           position: 'right',
	                           show: false
	                       },
	                       emphasis: {
	                           show: true
	                       }
	                   },
	                   itemStyle: {
	                       normal: {
	                           color: '#2eff50'
	                       }
	                   }
	               },
	               {
	                   name: '利益冲突',
	                   type: 'effectScatter',
	                   coordinateSystem: 'bmap',
	                   data: convertData(data42),
	                   symbolSize: function (val) {
	                	   var value = val[2].substring(val[2].indexOf(":") + 1,val[2].length);
	                	   var newvalue;
	                	   if(value > 0 && value <= 100){
	                		   newvalue = value / 5;
	                	   }else if(value > 100 && value <= 1000){
	                		   newvalue = value / 50;
	                	   }else if(value > 1000 && value <= 10000){
	                		   newvalue = value / 500;
	                	   }else if(value > 10000){
	                		   newvalue = value / 5000;
	                	   }
	                       return newvalue;
	                   },
	                   showEffectOn: 'render',
	                   rippleEffect: {
	                       brushType: 'stroke'
	                   },
	                   hoverAnimation: true,
	                   label: {
	                       normal: {
	                           formatter: '{b}',
	                           position: 'right',
	                           show: true
	                       }
	                   },
	                   itemStyle: {
	                       normal: {
	                           color: '#2eff50',
	                           shadowBlur: 10,
	                           shadowColor: '#333'
	                       }
	                   },
	                   zlevel: 1
	               }
	           ]
	       };
	       myChart2.setOption(option);
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
                 				sdop(data);
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
             				sdop(data);
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

<!-- AK--53oVIOgmSIejwV7EfphPgTynOZbIiVYu-->



