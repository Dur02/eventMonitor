<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<title>图谱-情感分析  </title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="shortcut icon" type="image/x-icon" href="<%=basePath%>/static/Visualization/base/ico.png"/>
<link rel="stylesheet" href="<%=basePath%>/static/css/style.css">
<!--人工查询 -->
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath %>/static//lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath %>/static/css/combo.select.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/perfect-scrollbar.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/base/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/base/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/base/base.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/css/event_result.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/js/amcharts/export/export.css"/>
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window_zs.css"/><!-- 弹出提示框样式 -->
<link rel="stylesheet" href="<%=basePath %>/static/css/hsCheckData.css"/>
<!-- 两种皮肤切换 -->
<c:if test="${bgFlag == null or bgFlag == 1}">
	<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css"/>
	<link rel="stylesheet" href="<%=basePath %>/static/css/sec2.css">
	<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
	<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.min.css"/>
	<link rel="stylesheet" href="<%=basePath %>/static/css/sec2_2.css">
	<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
</c:if>
<style type="text/css">
	.index_bottom {
		background: url(<%=basePath %>/static/images/beij.png) no-repeat;
		background-size:  100%;	
	}
	.outBox {
		    height: 94%;
		    width: 98%;
		    position: relative;
		    margin: 9px 0 0 1%;
	}
	.inBox {
		height: 47%;
		width: 100%;
		position: absolute;
		border: 1px solid #54628a;
	    background-color: #1b233489;		
	}
	.inBox1 {
		height: 51%;
	    width: 100%;
	    position: absolute;
	    border: 1px solid #54628a;
	    top: 49%;
	    background-color: #1b233489;
	}
	
	.inBox_0 {
		height: 13%;
	    width: 15%;
	    position: absolute;
	    top: 0px;
	    left: 42%;
		
		background: url(<%=basePath %>/static/images/short_111.png) no-repeat;
	}
	.inBox_1 {
		    height: 78.5%;
		    width: 30%;
		    position: absolute;
		    top: 69px;
		    left: 1.3%;
		    border: 1px solid #54628a;
	        
	}
	.inBox_2 {
		    height: 78.7%;
		    width: 67%;
		    position: absolute;
		    top: 69px;
		    left: 32%;
	}
	.inBox_3 {
		    height: 10%;
		    width: 13%;
		    position: absolute;
		    top: 33px;
		    padding-left: 25px;
		    padding-top: 7px;
		    color: #fff;
		    left: 86%;
	}
	.inBox_C3 {
		height: 10%;
	    width: 13%;
	    position: absolute;
	    top: 30px;
	    left: 85%;
	    padding-left: 25px;
	    padding-top: 7px;
	    color: #fff;
	}
	.span_0 {
		color: #FFF;
		font-size: 23px;
		font-family: SimSun;
		font-weight: bold;
		position: absolute;
		top: 5px;
		left: 22%;
	}
	.span_1 {
		color: #FFF;
		font-size: 12px;
		font-weight: bold;
		position: absolute;
		top: 35px;
		left: 24%;
	    margin-top: -25px;
	}
	.span_2 {
		color: red;
		font-size: 32px;
		font-family: SimSun;
		font-weight: bold;
		position: absolute;
		top: 16px;
		left: 41%;
	    margin-top: -21px;
	}
	.heart {
		    height: 189.53px;
		    width: 572.98px;
		    position: absolute;
		    top: 72px;
		    left: 2%;
		    background-color: #1b2334;
	}
	.heart1 {
		    height: 231.53px;
		    width: 572.98px;
		    position: absolute;
		    top: 51px;
		    left: 0%;
	}
	.circle {
	    width: 15px;
	    height: 15px;
	    border: 1px solid rgba(0,193,222,1);
	    border-radius: 50%;
	    display: inline-block;
        margin-bottom: -2px;
    	margin-left: 2px;
    	cursor:pointer;
	}
	.circleon {
	    background: rgba(0,193,222,1);
	}
	.ecircle {
	    width: 15px;
	    height: 15px;
	    border: 1px solid rgba(0,193,222,1);
	    border-radius: 50%;
	    display: inline-block;
	    margin-bottom: -2px;
    	margin-left: 2px;
    	cursor:pointer;
	}
	.ecircleon {
	    background: rgba(0,193,222,1);
	}
</style>
</head>
<body>
	<!-- 事件描述 -->
    <div class="index_top clearfix">
		<h3 class="fl title">图谱库分析 >情感分析</h3>
		<input type="hidden" id="moduleCode" value="${moduleCode}">
	</div>
	
	<div class="index_bottom">
		<!-- 显示图 -->
		<div class="data show">
			<!-- 补充内容 -->
	    	<div class = "outBox">
	    	<!-- 上 -->
	    		<div class = "inBox">
	    			<div class = "inBox_0">
	    				<span class = "span_0">情感值分析</span>
	    			</div>
	    			<!-- 左边盒子  -->
	    			<div class = "inBox_1">
	    				<span class = "span_1">
	    					情感均值：
	    				</span>
	    				<span class = "span_2" id="avgTone">
	    				</span>
	    				<div class = "heart1" id="aaa"></div>
	    			</div>
	    			<!-- 右边盒子  -->
	    			<div class = "inBox_2" id="toneLine_echarts">
	    				
	    			</div>
	    			<!-- 日期  -->
	    			<div class = "inBox_3">
	    			<span>时间粒度：</span>
							<span class="circle" value="3"></span><span>年</span><span class="circle" value="2"></span><span>月</span><span class="circle" value="4" id="week"></span><span>周</span><span class="circle circleon" value="1" id="day"></span><span>日</span>
	    			</div>
	    		</div>
	    		<!-- 下 -->
	    		<div class = "inBox1">
	    			<div class = "inBox_0">
	    				<span class = "span_0">词性值分析</span>
	    			</div>
	    			<!-- 左边盒子  -->
	    			<div class = "inBox_1" id="word_echarts">
	    			</div>
	    			<!-- 右边盒子  -->
	    			<div class = "inBox_2" id="wordLine_echarts">
	    				
	    			</div>
	    			<!-- 日期  -->
	    			<div class = "inBox_C3">
	    			 <span>时间粒度：</span>
							<span class="ecircle" value="3"></span><span>年</span><span class="ecircle" value="2"></span><span>月</span><span class="ecircle" value="4" id="allweek"></span><span>周</span><span class="ecircle ecircleon" value="1" id="allday"></span><span>日</span>
	    			</div>
	    		</div>
	    	</div>	
		</div>
		<!-- 显示表格结束 -->
		<!-- 页面底部收缩 -->
		<jsp:include page="graph_tab2.jsp"></jsp:include>
	</div>
		<!-- 页面底部收缩结束 -->
		<jsp:include page="../updateUserPassword.jsp"/>
</body>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/echarts/echarts.js" ></script>
<!-- 人工查询功能的日期 -->
<script src="<%=basePath %>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-select.min.js"></script>
<script src="<%=basePath %>/static/js/jquery.combo.select.js"></script>
<script src="<%=basePath %>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath %>/static/js/perfect-scrollbar.js"></script>
<script src="<%=basePath%>/static/js/sec2.js"></script>
<script src="<%=basePath%>/static/lib/jquery.pagination.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/base/base.js"></script>
<script src="<%=basePath %>/static/js/config/config.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/echarts.js"></script>
<c:if test="${bgFlag == null or bgFlag == 1}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
<script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
</c:if>
<!-- 人工查询js -->
<script src="<%=basePath %>/static/Visualization/rgQuery.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/downLoad.js"></script>
<%-- <script src="<%=basePath %>/static/win_alert/window.js"> --%></script><!-- 弹出提示框脚本 -->
<script type="text/javascript" src="<%=basePath%>/static/js/hsCheckData.js"></script>
<script type="text/javascript">

	$(function(){
		
		//时间线数据力度切换方法
		function packToneDataType(len,ty){
			var date_news = {};
			for(var i=0;i<data_dic.length;i++){
				var date_str=data_dic[i].key;
        		var date_clas=date_str+"";
        		var date_class=date_clas.substring(0,len);
        		if(len==2){
        			date_class = getWeekNum(date_clas);
        		}
        		var q1 = data_dic[i].p_value;
            	var q2 = data_dic[i].n_value;
            	var q3 = data_dic[i].value;
            	if(ty=="world"){
            		q1 = data_dic[i].po_value;
                	q2 = data_dic[i].s_value;
                	q3 = data_dic[i].a_value;
            	}
        		if(date_news[date_class] != undefined){
        			var q11 = date_news[date_class].p_value;
                	var q22 = date_news[date_class].n_value;
                	var q33 = date_news[date_class].value;
                	if(ty=="world"){
                		q11 = data_dic[i].po_value;
                    	q22= data_dic[i].s_value;
                    	q33 = data_dic[i].a_value;
	                	date_news[date_class].po_value = q1 + q11;
	                	date_news[date_class].s_value = q2 + q22;
	                	date_news[date_class].a_value = q3 + q33;
                	}else{
	                	date_news[date_class].p_value = q1 + q11;
	                	date_news[date_class].n_value = q2 + q22;
	                	date_news[date_class].value = q3 + q33;
                	}
        		}else{
        			var date_new = {};
        			if(ty=="world"){
        				date_new.po_value = q1;
            			date_new.s_value = q2;
            			date_new.a_value = q3;
        			}else{
        				date_new.p_value = q1;
            			date_new.n_value = q2;
            			date_new.value = q3;
        			}
        			date_news[date_class] = date_new;
        		}
            }
       		var date_value=[];
            var quadclass_value=[];
            for(var obj in date_news){
            	var date_new = date_news[obj];
            	date_value.push(obj);
            	if(ty=="world"){
	            	var d1={
	           			key:obj,
	           			po_value:date_new.po_value.toFixed(3),
	           			s_value:date_new.s_value.toFixed(3),
	           			a_value:date_new.a_value.toFixed(3)
	            	}
	            	quadclass_value.push(d1);
            	}else{
	            	var d1={
	           			key:obj,
	           			p_value:date_new.p_value.toFixed(3),
	           			n_value:date_new.n_value.toFixed(3),
	           			value:date_new.value.toFixed(3)
	            	}
	            	quadclass_value.push(d1);
            	}
            }
            if(ty=="world"){
            	showWordLine(quadclass_value,date_value);
            }else{
	            showToneLine(quadclass_value,date_value);
            }
		}
		
		$('.circle').on('click',function(){
			$(this).addClass('circleon').siblings('.circle').removeClass('circleon');
			selectVal=$(this).attr('value');
			if(selectVal=="1"){
				showToneLine(data_dic,data_date)
			}
			if(selectVal=="2"){
				packToneDataType(6,"tone");
            }
			if(selectVal=="3"){
				packToneDataType(4,"tone");
            }
			if(selectVal=="4"){
				packToneDataType(2,"tone");
            }
		})
		//词性年月日切换
		$('.ecircle').on('click',function(){
			$(this).addClass('ecircleon').siblings('.ecircle').removeClass('ecircleon');
			selectVal=$(this).attr('value');
			if(selectVal=="1"){
				showWordLine(data_dic,data_date)
			}
			if(selectVal=="2"){
				packToneDataType(6,"world");
            }
			if(selectVal=="3"){
				packToneDataType(4,"world");
            }
			if(selectVal=="4"){
				packToneDataType(2,"world");
            }
		})
		//处理配置
		handleConfigs();
		//控制Tone字段的显示问题
		gkgToneIsShow();
		//美化滚动条
		glorifyComboSelect();
	});
	//加载配置对应的结果数据
	function render(configId){
		startLoad();
		$.ajax({
			url:'<%=basePath%>/search/graph_tone_timeline_viz/'+configId,
			type: 'POST',
			dataType:"json",
			success:function(data){
				if(data=="-1"){
					endLoad();
					win.alertEx("加载失败");
				}
				renderData(data);
				endLoad();
				//左侧菜单栏 扩大缩小后重新渲染图表
				window.onresize = function(){
					renderData(data);
				}
			}
		});
	}
	//将结果数据进行渲染图表
	var tone_dic;
	var tone2_dic;
	var data_dic;
	var data_date;
	function renderData(data){
		//真实数据
		tone_dic = data.tone_dic;
		tone2_dic = data.tone2_dic;
		data_dic = data.date_dic;
		data_date=data.date_data;
		
		$('#day').addClass('circleon').siblings('.circle').removeClass('circleon');
		$('#allday').addClass('ecircleon').siblings('.ecircle').removeClass('ecircleon');
		
		//负向情感值、正向情感值、平均情感值、极性词均值、活动词均值、代词均值
		showAvgTone(tone_dic);
		showBarWord(tone2_dic);
		showToneLine(data_dic,data_date);
		showWordLine(data_dic,data_date);
	}
	//组装数据
	function getDataByCat(cat,data){
        var len = data.length;
        var ret=[];
        for(var i =0 ;i<len;i++)
        {
            ret[i] = data[i][cat];
        }
        return ret;
    }
	//组装福相
	function getDataByCatF(cat,data){
        var len = data.length;
        var ret=[];
        for(var i =0 ;i<len;i++)
        {
            ret[i] = -1*data[i][cat];
        }
        return ret;
    }
	//情感值饼图
	function showAvgTone(tone_dic){
		var Xdata=[];
		var Ydata=[];
		for(var i=0;i<tone_dic.length;i++){
			var key=tone_dic[i].key;
			if(key!="情感均值"){
				Xdata.push(key);
				var value=tone_dic[i].value;
				d1={
					 name:key,
					 value:value
				   }
				Ydata.push(d1);
			}else{
				var value=tone_dic[i].value;
				if(value.indexOf("-")<0){
					$(".span_2").css("color","green");
				}
				$("#avgTone").html(value);
			}
			
		}
		var myChart = echarts.init(document.getElementById('aaa'));
		var option = {
			   // backgroundColor:'#fff',
			    tooltip: {
			        trigger: 'item',
			        formatter: "{b}: {c}，占比：{d}%",

			    },
			    legend: {
			        left:"20%",
			        top:1,
			        data:Xdata,
			                textStyle: {
			            color: '#fff'
			        }
			    },
			    series: [
			         
			        {
			            name:'情感值',
			            type:'pie',
			            radius: ['0', '70%'],
			            center:['40%','58%'],
			            color: [ '#0a800f','#e72325', '#98e002'],
			            label: {
			                normal: {
			                	/*formatter: function(params, ticket, callback) {
			                    	console.log(JSON.stringify(params));
			                    	 
			                        var total = 0; //总数量
			                        var percent = 0; //占比
			                        pieData.forEach(function(value, index, array) {
			                            total += value.value;
			                        });
			                        percent = ((params.value / total) * 100).toFixed(1);
			                        return  params.name + ':\n' + params.value + '(' + percent + '%)';
			                     }*/
			                	 formatter: '{b}: {c}\n占比：{d}%',
			                	 textStyle: {
						                color: "#f9f9f9",
						                fontSize:14
					             } 
			                }
			            },
			            data:Ydata
			        }
			    ]
			};
		 myChart.setOption(option);
	}
	//情感值折线图
	function showToneLine(data_dic,data_date){
   	    var timeline_chart = echarts.init(document.getElementById('toneLine_echarts'));
          var timeline_option = {
        		backgroundColor: '#1b233482',
          		toolbox: {
      		        feature: {
      		            dataZoom: {
      		                yAxisIndex: 'none'
      		            },
      		            restore: {},
      		            saveAsImage: {},
    		            dataView: {}
      		        }
      		    }, 
      		    dataZoom: [
      		        {
      		            start: 0
      		        },
      		      {
      		            type: 'slider',
      		          textStyle:{
    		        		color:"#fff"
    		        	}
      		            
      		        }
      		    ],
      		    tooltip: {
  			        trigger: "axis",
  			        axisPointer: { // 坐标轴指示器，坐标轴触发有效
  			            type: 'line', // 默认为直线，可选为：'line' | 'shadow'
  			        },
  			        /* formatter: '{b}<br />{a0}: {c0}<br />{a1}: {c1}<br />{a2}: {c2}<br />', */
  			        backgroundColor: 'rgba(0,0,0,0.7)', // 背景
  			        padding: [8, 10], //内边距
  			        extraCssText: 'box-shadow: 0 0 3px rgba(255, 255, 255, 0.4);', //添加阴影
  			    },
          	    legend: {
  			        textStyle: {
  			            color: '#fff',
  			            fontSize: '12'
  			        },
          	    	//selectedMode:false,
          	    	data:["正向情感值","负向情感值","平均情感值"]
          	    },
          	  grid: {
   		        left: '1%',
   		        right: '1%',
   		        bottom: '15%',
   		        top: '10%',
   		        containLabel: true,
   		        z: 22
   		    	},
          	    xAxis: [
          	        {
          	        	type: "category",
      			        axisLine: {
      			            lineStyle: {
      			                color: '#bac0c0'
      			            }
      			        },
      			        splitLine: {
      			            show: false
      			        },
      			        axisTick: {
      			            show: false
      			        },
      			        splitArea: {
      			            show: false
      			        },
      			        axisLabel: {
      			            inside: false,
      			            textStyle: {
      			                color: '#f9f9f9',
      			                fontWeight: 'normal',
      			                fontSize: '12',
      			            },
      			        },
          	            data: data_date
          	        }
          	    ],
          	    yAxis: [
          	        {
          	        	type: 'value',
       			        axisTick: {
       			            show: false
       			        },
       			        axisLine: {
       			            show: true,
       			            lineStyle: {
       			                color: '#bac0c0',
       			            }
       			        },
       			        splitLine: {
       			            show: false,
       			            lineStyle: {
       			                color: '#32346c ',
       			            }
       			        },
       			        axisLabel: {
       			            textStyle: {
       			                color: '#f9f9f9',
       			                fontWeight: 'normal',
       			                fontSize: '12',
       			            },
       			            formatter: '{value}',
       			        },
          	        }
          	    ],
          	    series:  [
                            {
                                name:'正向情感值',
                                type:'line',
                                data:getDataByCat('p_value',data_dic),
                                smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                symbolSize: 5,
                                symbol: 'circle',
                                itemStyle: {
            			            normal: {
            			            	color:'#0a800f',
            			                lineStyle: {
            			                    width: 1,
            			                    type: 'solid' //'dotted'虚线 'solid'实线
            			                },
            			                barBorderRadius: 0,
            			                label: {
            			                    show: false,
            			                }
            			            }
            			        },
                            },
                            {
                                name:"负向情感值",
                                type:'line',
                                data:getDataByCatF("n_value",data_dic),
                                smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                symbolSize: 5,
                                symbol: 'circle',
                                itemStyle: {
            			            normal: {
            			            	color:'#e32f46',
            			                lineStyle: {
            			                    width: 1,
            			                    type: 'solid' //'dotted'虚线 'solid'实线
            			                },
            			                barBorderRadius: 0,
            			                label: {
            			                    show: false,
            			                }
            			            }
            			        },
                            },
                            {
                                name:"平均情感值",
                                type:'line',
                                data:getDataByCat("value",data_dic),
                                smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                symbolSize:5,
                                symbol: 'circle',
                                itemStyle: {
            			            normal: {
            			            	color:'#1a9bfc',
            			                lineStyle: {
            			                    width: 1,
            			                    type: 'solid' //'dotted'虚线 'solid'实线
            			                },
            			                barBorderRadius: 0,
            			                label: {
            			                    show: false,
            			                }
            			            }
            			        },
                            }
                        ]
          	};
          timeline_chart.setOption(timeline_option);
	}
	//词性饼图
	function showBarWord(tone2_dic){
		var word_echarts = echarts.init(document.getElementById('word_echarts'));
		var valdata=[];//国家数据
		var namedata=[];//国家名称
		for(var i=0;i<tone2_dic.length;i++){
			var wordName=tone2_dic[i].key;
			var wordSum=tone2_dic[i].value;
			valdata.push(wordSum);
			namedata.push(wordName);
		}  
		option = {
			    //backgroundColor:"#080f15",
			    grid: {
			    	top: '5%',
			        left: '3%',
			        bottom: '5%',
			        right:"7",
			        containLabel: true
			    },
			    xAxis: {
			        axisTick: {
			            show: false
			        },
			        splitLine: {
			            show: false
			        },
			        splitArea: {
			            show: false
			        },
			        data: namedata,
			        axisLabel: {
			             formatter: function(value) {
			            	 var res = value;
			                 if(res.length >5) {
			                     res = res.substring(0, 3) + "..";
			                 }
			                 return res;
			            }, 
			            interval:0,
			            rotate:0,
			            fontSize: 12,
			            fontWeight: 100,
			            textStyle: {
			                color: '#f9f9f9',

			            }
			        },
			        axisLine: {
			            lineStyle: {
			                color: '#f9f9f9'
			            }
			        }
			    },
			    yAxis: {
			        axisTick: {
			            show: false
			        },
			        splitLine: {
			            show: false
			        },
			        splitArea: {
			            show: false
			        },
			        //min: 200,
			        axisLabel: {
			            textStyle: {
			                color: '#f9f9f9',
			                fontSize: 12,
			            }
			        },
			        axisLine: {
			            lineStyle: {
			                color: '#f9f9f9'
			            }
			        }
			    },
			    "tooltip": {
			      "trigger": "item",
			      "textStyle": {
			        "fontSize": 12
			      },
			      "formatter": "{b0}:{c0}"
			    },
			    series: {
			        type:"bar",
			        barWidth: 40,
			        itemStyle:{
			            normal:{
			                color:new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
			                    offset: 0,
			                    color: '#00b0ff'
			                }, {
			                    offset: 0.8,
			                    color: '#7052f4'
			                }], false)
			            }
			        },
			        // barWidth: 7,
			        data: valdata
			    }
			};
			word_echarts.setOption(option);
	}
	//词性折线图
	function showWordLine(data_dic,data_date){
   	    var wordLine_echarts = echarts.init(document.getElementById('wordLine_echarts'));
          var timeline_option = {
        		backgroundColor: '#1b233482',
          		toolbox: {
      		        feature: {
      		            dataZoom: {
      		                yAxisIndex: 'none'
      		            },
      		            restore: {},
      		            saveAsImage: {},
    		            dataView: {}
      		        }
      		    }, 
      		    dataZoom: [
      		        {
      		            start: 0
      		        },
      		      {
      		            type: 'slider',
      		          textStyle:{
    		        		color:"#fff"
    		        	}
      		            
      		        }
      		    ],
      		    tooltip: {
  			        trigger: "axis",
  			        axisPointer: { // 坐标轴指示器，坐标轴触发有效
  			            type: 'line', // 默认为直线，可选为：'line' | 'shadow'
  			        },
  			        /* formatter: '{b}<br />{a0}: {c0}<br />{a1}: {c1}<br />{a2}: {c2}<br />', */
  			        backgroundColor: 'rgba(0,0,0,0.7)', // 背景
  			        padding: [8, 10], //内边距
  			        extraCssText: 'box-shadow: 0 0 3px rgba(255, 255, 255, 0.4);', //添加阴影
  			    },
          	    legend: {
  			        textStyle: {
  			            color: '#fff',
  			            fontSize: '12'
  			        },
          	    	//selectedMode:false,
          	    	data:["极性词均值","活动词均值","代词均值"]
          	    },
          	  grid: {
   		        left: '1%',
   		        right: '1%',
   		        bottom: '15%',
   		        top: '10%',
   		        containLabel: true,
   		        z: 22
   		    	},
          	    xAxis: [
          	        {
          	        	type: "category",
      			        axisLine: {
      			            lineStyle: {
      			                color: '#bac0c0'
      			            }
      			        },
      			        splitLine: {
      			            show: false
      			        },
      			        axisTick: {
      			            show: false
      			        },
      			        splitArea: {
      			            show: false
      			        },
      			        axisLabel: {
      			            inside: false,
      			            textStyle: {
      			                color: '#f9f9f9',
      			                fontWeight: 'normal',
      			                fontSize: '12',
      			            },
      			        },
          	            data: data_date
          	        }
          	    ],
          	    yAxis: [
          	        {
          	        	type: 'value',
       			        axisTick: {
       			            show: false
       			        },
       			        axisLine: {
       			            show: true,
       			            lineStyle: {
       			                color: '#bac0c0',
       			            }
       			        },
       			        splitLine: {
       			            show: false,
       			            lineStyle: {
       			                color: '#32346c ',
       			            }
       			        },
       			        axisLabel: {
       			            textStyle: {
       			                color: '#f9f9f9',
       			                fontWeight: 'normal',
       			                fontSize: '12',
       			            },
       			            formatter: '{value}',
       			        },
          	        }
          	    ],
          	    series:  [
                            {
                                name:'极性词均值',
                                type:'line',
                                data:getDataByCat('po_value',data_dic),
                                smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                symbolSize: 5,
                                symbol: 'circle',
                                itemStyle: {
            			            normal: {
            			            	color:'#1a9bfc',
            			                lineStyle: {
            			                    width: 1,
            			                    type: 'solid' //'dotted'虚线 'solid'实线
            			                },
            			                barBorderRadius: 0,
            			                label: {
            			                    show: false,
            			                }
            			            }
            			        },
                            },
                            {
                                name:"活动词均值",
                                type:'line',
                                data:getDataByCat("a_value",data_dic),
                                smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                symbolSize: 5,
                                symbol: 'circle',
                                itemStyle: {
            			            normal: {
            			            	color:'#e32f46',
            			                lineStyle: {
            			                    width: 1,
            			                    type: 'solid' //'dotted'虚线 'solid'实线
            			                },
            			                barBorderRadius: 0,
            			                label: {
            			                    show: false,
            			                }
            			            }
            			        },
                            },
                            {
                                name:"代词均值",
                                type:'line',
                                data:getDataByCat("s_value",data_dic),
                                smooth: true, // 当为true时，就是光滑的曲线（默认为true）；当为false，就是折线不是曲线的了，那这个设为true，下面的（吃饭）数据中设置smooth为false，这个就不是光滑的曲线了。
                                symbolSize:5,
                                symbol: 'circle',
                                itemStyle: {
            			            normal: {
            			            	color:'#00c1de',
            			                lineStyle: {
            			                    width: 1,
            			                    type: 'solid' //'dotted'虚线 'solid'实线
            			                },
            			                barBorderRadius: 0,
            			                label: {
            			                    show: false,
            			                }
            			            }
            			        },
                            }
                        ]
          	};
          wordLine_echarts.setOption(timeline_option);
	}
</script>
</html>