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
	<style type="text/css">
		.tab_ul li.active{
			top:0px;
		}
	</style>
</c:if>
<%  
	session.setAttribute("selectekey",  1);  //把b放到session里，命名为a，  
%>  

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
	<div class="shy_top">
		<input type="hidden" id="moduleCode" value="${moduleCode}"/>
		<input type="hidden" id="djpzid" value="0"/>
		<h3 class="fl title" style="line-height:12px;">首页</h3>
		<!-- 地球仪暂时注释 -->
		<!-- <ul class="chart_change">
			<li class="act" id="worldclick">地球仪</li>
			<li id="worldclick2">散点图</li>
			<li id="worldclick3">热力图</li>
		</ul> -->
	</div>
	<div class="index_bottom" style="padding:0px;padding-top:38px; margin-top:0px;">
		<div style="height:97%; width:100%;" id="mapDiv">
		</div>
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
	<script src="<%=basePath%>/static/js/config/config.js"></script>
<script>
/*******************map******************/
require.config({
	packages: [{
       name: 'echarts-x',
       location: '<%=basePath %>/static/js/dep/echarts-x/src',
       main: 'echarts-x'
   }, {
       name: 'echarts',
       location: '<%=basePath %>/static/js/dep/echarts/src',
       main: 'echarts'
   },{
       name: 'zrender',
       location: '<%=basePath %>/static/js/dep/zrender/src',
       main: 'zrender'
   }, {
       name: 'qtek',
       location: '<%=basePath %>/static/js/dep/qtek/src',
              main: 'qtek.amd'
          }]
});
	$(function (){
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
		$("#worldclick2").on("click",function (){
			$(this).addClass("act").siblings().removeClass("act");
			window.location.href='../search/home3?bgFlag='+${bgFlag}+'&&pzid='+$("#djpzid").val();
		});
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
		$(".chart_change").on("click","li",function (){
			$(this).addClass("act").siblings().removeClass("act");
		})
	})
	
	 var data1,data2,data3,data4;
	 var myChart;
	 //然后就可以动态加载图表进行绘制
	 //实时查询地球仪数据
	 function worldmapRender(){
			startLoad();
			require([
					'echarts',
					'echarts-x',
					'echarts/chart/map',
					'echarts-x/chart/map3d'
			         ],function(ec){
					myChart = ec.init(document.getElementById('mapDiv'));
					$.ajax({
						url:'<%=basePath%>/home/findtelluriondata',
						type:'get',
						dataType:'json',
						success:function(data){
							haha(data);
							endLoad();
						},
						error:function(data){
							endLoad();
							alert("加载数据时出现未知错误");
						}
					});
			})
	}
	 //加载配置对应的数据
	 function render(configId){
		//如果configId为
		 if(configId == 0){
			 worldmapRender();
			 $("#djpzid").val(configId);
		 }else{
			 startLoad();
			 var oo = configId;
			 $("#djpzid").attr("value",oo);
			 require([
						'echarts',
						'echarts-x',
						'echarts/chart/map',
						'echarts-x/chart/map3d'
				         ],function(ec){
						myChart = ec.init(document.getElementById('mapDiv'));
						var resultcode = 'dqy';
						$.ajax({
							url:'<%=basePath%>/search/homedata?configId='+configId+'&resultcode='+resultcode,
							type: 'get',
							dataType:"json",
							success:function(data){
								if(data != null || data != undefined || data.length >0){
									haha(data);
								}
								endLoad();
							},
							error:function(data){
								endLoad();
								alert("该查询条件没有预处理,请先去配置页面进行预处理");
							}
						});
						//调节echarts图表自适应
					     window.onresize=function (){
					     	myChart.resize();
					     }
				})
		 }
	 }
	 function haha(data){
		 	data1 = data.r1;
			data2 = data.r2;
			data3 = data.r3;
			data4 = data.r4;
			if(${bgFlag} == 1){
				var option = {
						title: {
					        sublink: 'http://www.businessinsider.com/worlds-best-attractions-2013-6?op=1',
					        x: 'left',
					        y: 'top',
					        textStyle: {
					            color: 'white'
					        }
					    },
					    tooltip: {
					        formatter: '{b}'
					    },
					    color: ['#ff4b34', '#faf702', '#00fafd', '#2eff50'],
					    legend: {
					    	orient: 'vertical',
					        x: 'left',
					        data: ['口头合作','利益合作','口头冲突','利益冲突'],
					        textStyle: {
					            color: 'white'
					        },
					    },
					    series: [{
					        name: '口头合作',
					        type: 'map3d',
					        mapType: 'world',
					        hoverable: false,
					       	background:'<%=basePath %>/static/images/beijingse.png',
					        baseLayer: {
					            backgroundColor: '',
					            backgroundImage: '<%=basePath %>/static/js/dep/echarts-x/doc/example/asset/earth.jpg',
					            quality: 'high'
					        },
					        itemStyle: {
					            normal: {
					                label: {
					                    show: true
					                },
					                borderWidth: 1,
					                borderColor: 'yellow',
					                areaStyle: {
					                    color: 'rgba(0, 0, 0, 0)'
					                }
					            }
					        },
					        markPoint: {
					            symbol: 'image://<%=basePath %>/static/images/dw.png',
					            symbolSize:3,
					            large: false,
					            distance: 0,
					            orientationAngle: 90,
					            itemStyle: {
					                normal: {
					                    label: {
					                        show: false,
					                        formatter: '{b}',
					                        textStyle: {
					                            fontSize: 24,
					                            color: 'white'
					                        }
					                    }
					                }
					            },
					            data: data1
					        }
					    },
					   {
					        name: '利益合作',
					        type: 'map3d',
					        mapType: 'world',
					        hoverable: false,
					       	background:'<%=basePath %>/static/images/beijingse.png',
					        baseLayer: {
					            backgroundColor: '',
					            backgroundImage: '<%=basePath %>/static/js/dep/echarts-x/doc/example/asset/earth.jpg',
					            quality: 'high'
					        },
					        itemStyle: {
					            normal: {
					                label: {
					                    show: false
					                },
					                borderWidth: 1,
					                borderColor: 'yellow',
					                areaStyle: {
					                    color: 'rgba(0, 0, 0, 0)'
					                }
					            }
					        },
					        markPoint: {
					           symbol: 'image://<%=basePath %>/static/images/dw2.png',
					           symbolSize:3,
					            distance: 0,
					            orientationAngle: 90,
					            itemStyle: {
					                normal: {
					                    label: {
					                        show: false,
					                        formatter: '{b}',
					                        textStyle: {
					                            fontSize: 24,
					                            color: 'white'
					                        }
					                    }
					                }
					            },
					            data: data2
					        }
					    },
					   {
					        name: '口头冲突',
					        type: 'map3d',
					        mapType: 'world',
					        hoverable: false,
					       	background:'<%=basePath %>/static/images/beijingse.png',
					        baseLayer: {
					            backgroundColor: '',
					            backgroundImage: '<%=basePath %>/static/js/dep/echarts-x/doc/example/asset/earth.jpg',
					            quality: 'high'
					        },
					        itemStyle: {
					            normal: {
					                label: {
					                    show: false
					                },
					                borderWidth: 1,
					                borderColor: 'yellow',
					                areaStyle: {
					                    color: 'rgba(0, 0, 0, 0)'
					                }
					            }
					        },
					        markPoint: {
					            symbol: 'image://<%=basePath %>/static/images/dw3.png',
					            symbolSize: 3,
					            distance: 0,
					            orientationAngle: 90,
					            itemStyle: {
					                normal: {
					                    label: {
					                        show: false,
					                        formatter: '{b}',
					                        textStyle: {
					                            fontSize: 24,
					                            color: 'white'
					                        }
					                    }
					                }
					            },
					            data: data3
					        }
					    },
					   {
					        name: '利益冲突',
					        type: 'map3d',
					        mapType: 'world',
					        hoverable: false,
					       	background:'<%=basePath %>/static/images/beijingse.png',
					        baseLayer: {
					            backgroundColor: '',
					            backgroundImage: '<%=basePath %>/static/js/dep/echarts-x/doc/example/asset/earth.jpg',
					            quality: 'high'
					        },
					        itemStyle: {
					            normal: {
					                label: {
					                    show: false
					                },
					                borderWidth: 1,
					                borderColor: 'yellow',
					                areaStyle: {
					                    color: 'rgba(0, 0, 0, 0)'
					                }
					            }
					        },
					        markPoint: {
					            symbol: 'image://<%=basePath %>/static/images/dw4.png',
					            symbolSize: 3,
					            distance: 0,
					            orientationAngle: 90,
					            itemStyle: {
					                normal: {
					                    label: {
					                        show: false,
					                        formatter: '{b}',
					                        textStyle: {
					                            fontSize: 24,
					                            color: 'white'
					                        }
					                    }
					                }
					            },
					            data: data4
					        }
					    }]
				};
				myChart.setOption(option);
			}else if(${bgFlag} == 2){
				var option = {
						title: {
					        sublink: 'http://www.businessinsider.com/worlds-best-attractions-2013-6?op=1',
					        x: 'left',
					        y: 'top',
					        textStyle: {
					            color: 'white'
					        }
					    },
					    tooltip: {
					        formatter: '{b}'
					    },
					    color: ['#ff4b34', '#faf702', '#00fafd', '#2eff50'],
					    legend: {
					    	orient: 'vertical',
					        x: 'left',
					        data: ['口头合作','利益合作','口头冲突','利益冲突'],
					        textStyle: {
					            color: 'black'
					        }
					    },
					    series: [{
					        name: '口头合作',
					        type: 'map3d',
					        mapType: 'world',
					        hoverable: false,
					       	background:'<%=basePath %>/static/images/beijingse4.png',
					        baseLayer: {
					            backgroundColor: '',
					            backgroundImage: '<%=basePath %>/static/js/dep/echarts-x/doc/example/asset/earth.jpg',
					            quality: 'high'
					        },
					        itemStyle: {
					            normal: {
					                label: {
					                    show: false
					                },
					                borderWidth: 1,
					                borderColor: 'yellow',
					                areaStyle: {
					                    color: 'rgba(0, 0, 0, 0)'
					                }
					            }
					        },
					        markPoint: {
					           symbol: 'image://<%=basePath %>/static/images/dw.png',
					           symbolSize:3,
					            distance: 0,
					            orientationAngle: 90,
					            itemStyle: {
					                normal: {
					                    label: {
					                        show: false,
					                        formatter: '{b}',
					                        textStyle: {
					                            fontSize: 24,
					                            color: 'white'
					                        }
					                    }
					                }
					            },
					            data: data1
					        }
					    },
					   {
					        name: '利益合作',
					        type: 'map3d',
					        mapType: 'world',
					        hoverable: false,
					       	background:'<%=basePath %>/static/images/beijingse4.png',
					        baseLayer: {
					            backgroundColor: '',
					            backgroundImage: '<%=basePath %>/static/js/dep/echarts-x/doc/example/asset/earth.jpg',
					            quality: 'high'
					        },
					        itemStyle: {
					            normal: {
					                label: {
					                    show: false
					                },
					                borderWidth: 1,
					                borderColor: 'yellow',
					                areaStyle: {
					                    color: 'rgba(0, 0, 0, 0)'
					                }
					            }
					        },
					        markPoint: {
					           symbol: 'image://<%=basePath %>/static/images/dw2.png',
					           symbolSize:3,
					            distance: 0,
					            orientationAngle: 90,
					            itemStyle: {
					                normal: {
					                    label: {
					                        show: false,
					                        formatter: '{b}',
					                        textStyle: {
					                            fontSize: 24,
					                            color: 'white'
					                        }
					                    }
					                }
					            },
					            data: data2
					        }
					    },
					   {
					        name: '口头冲突',
					        type: 'map3d',
					        mapType: 'world',
					        hoverable: false,
					       	background:'<%=basePath %>/static/images/beijingse4.png',
					        baseLayer: {
					            backgroundColor: '',
					            backgroundImage: '<%=basePath %>/static/js/dep/echarts-x/doc/example/asset/earth.jpg',
					            quality: 'high'
					        },
					        itemStyle: {
					            normal: {
					                label: {
					                    show: false
					                },
					                borderWidth: 1,
					                borderColor: 'yellow',
					                areaStyle: {
					                    color: 'rgba(0, 0, 0, 0)'
					                }
					            }
					        },
					        markPoint: {
					            symbol: 'image://<%=basePath %>/static/images/dw3.png',
					            symbolSize: 3,
					            distance: 0,
					            orientationAngle: 90,
					            itemStyle: {
					                normal: {
					                    label: {
					                        show: false,
					                        formatter: '{b}',
					                        textStyle: {
					                            fontSize: 24,
					                            color: 'white'
					                        }
					                    }
					                }
					            },
					            data: data3
					        }
					    },
					   {
					        name: '利益冲突',
					        type: 'map3d',
					        mapType: 'world',
					        hoverable: false,
					       	background:'<%=basePath %>/static/images/beijingse4.png',
					        baseLayer: {
					            backgroundColor: '',
					            backgroundImage: '<%=basePath %>/static/js/dep/echarts-x/doc/example/asset/earth.jpg',
					            quality: 'high'
					        },
					        itemStyle: {
					            normal: {
					                label: {
					                    show: false
					                },
					                borderWidth: 1,
					                borderColor: 'yellow',
					                areaStyle: {
					                    color: 'rgba(0, 0, 0, 0)'
					                }
					            }
					        },
					        markPoint: {
					            symbol: 'image://<%=basePath %>/static/images/dw4.png',
					            symbolSize: 3,
					            distance: 0,
					            orientationAngle: 90,
					            itemStyle: {
					                normal: {
					                    label: {
					                        show: false,
					                        formatter: '{b}',
					                        textStyle: {
					                            fontSize: 24,
					                            color: 'white'
					                        }
					                    }
					                }
					            },
					            data: data4
					        }
					    }]
				};
				myChart.setOption(option);
				
			}
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
                 				haha(data);
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
             				haha(data);
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
<jsp:include page="../updateUserPassword.jsp"></jsp:include>
</body>
</html>