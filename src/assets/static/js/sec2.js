"use strict"
/*window.onload = window.onresize = function(){
	var bodyH = $(window).height();
	alert(bodyH)
	$(".index_bottom").height(bodyH - 50 );
	$(".data").height(bodyH - 50 );
	$(".tab").css({"position":"fixed","left":"0","bottom":"0"});
}*/
$(function (){
	var bodyH = $(window).height();
	$(".index_bottom").height(bodyH - 50 );
	$(".data").height(bodyH - 50 );
	$(".tab").css({"position":"fixed","left":"0","bottom":"0"});
	window.onresize=function (){
		var bodyH = $(window).height();
		$(".index_bottom").height(bodyH - 50 );
		$(".data").height(bodyH - 50 );
		$(".tab").css({"position":"fixed","left":"0","bottom":"0"});
	}
})
function domReady(fn){
	if(document.addEventListener){
		document.addEventListener("DOMContentLoad",function(){
			fn && fn();
		},false);
	}else{
		document.attachEvent("onreadystatechange",function(){
			fn && fn();
		})
	}
};
$(document).ready(function(){
	// 预设点切换
	$("#tab_ul li").click(function(){
		$(this).addClass("active").siblings().removeClass("active");
		$(".tab .tab_down").eq($(this).index()).addClass("show").siblings().removeClass("show");
		$(".manual").removeClass("manual_act");
	});
	$(".manual").on("click",function (){
		$("#tab_ul li").removeClass("active");
		$(".tab .people_tab_down").addClass("show").siblings().removeClass("show");
		$(this).addClass("manual_act")
	})
	// 预设点隐藏显示
	
	var windowHeight=$(window).height();
	var tab1=$(".tab").height();
	var scrollTop=$(window).scrollTop();
	var num=33;
	$(".ul_xl").click(function(){
		if($(".tab_div").css("display") == "block"){
			$(this).removeClass("ul_xl2").addClass("ul_xl");
			$(".tab_div").css("display","none");
		}else{
			$(this).removeClass("ul_xl").addClass("ul_xl2");
			$(".tab_div").css("display","block");
		}
	})	
	
	// 图表切换
	$(".export_img_2").click(function(){
		if($(".data").css("display") == "block"){
			$(this).removeClass("export_img_2").addClass("export_img");
			$(".data").removeClass("show").css("display","none");
			$(".data2").css("display","block");
		}else{
			$(this).removeClass("export_img").addClass("export_img_2");
			$(".data").css("display","block");
			$(".data2").css("display","none");
		}
	})
	// 移入显示页面介绍信息
	function show(){
		$(".info_box").css("display","block");
	};
	function yinc(){
		$(".info_box").css("display","none");
	}
	var timer = null;
	$(".info_img,.info_box").on({
		mouseenter:function(){
			// $(".info_box").css("display","block");
			clearInterval(timer);
			timer = setInterval(show,500);
		},
		mouseleave:function(){
			clearInterval(timer);
			timer = setInterval(yinc,500);
		}
	});

// 预设点每个li增加padding
	$(".tab_down_info li").children("div").css("padding","5px 0px");

// 表格各行颜色不同
	$(".table tbody").find("tr:odd").css("background","#20263a");
	$(".table tbody").find("tr:even").css("background","#1a1f2f");
// 挂起
	$(".table td").on("click",".gq",function(){
		if($(this).attr("src") == "../images/gq.png"){
			$(this).attr("src","../images/gq2.png");
		}else{
			$(this).attr("src","../images/gq.png");
		}
	});
// 日期
	/*$('.year').datepicker({
		format: 'yyyy', 
		weekStart: 1,
		autoclose: true, 
		orientation:" top auto",
		startView: 2, 
		maxViewMode: 2,
		minViewMode:2,
		forceParse: false, 
		language: 'zh-CN',
		// todayBtn : "linked", 
		// autoclose : true, 
		// todayHighlight : true, 
		// endDate : new Date() 
		// }).on('changeDate',function(e){ 
		// var startTime = e.date; 
		// $('.year').datepicker('setStartDate',startTime); 
	});*/
	/*$('.month').datepicker({
		format: 'mm', 
		weekStart: 1, 
		autoclose: true, 
		orientation:" top auto",
		startView: 1, 
		maxViewMode: 1,
		minViewMode:1,
		forceParse: false, 
		language: 'zh-CN'
		// todayBtn : "linked", 
		// autoclose : true, 
		// todayHighlight : true, 
		// endDate : new Date() 
		// }).on('changeDate',function(e){ 
		// var startTime = e.date; 
		// $('.month').datepicker('setStartDate',startTime); 
	});*/
	/*$('.day').datepicker({
		format: 'dd', 
		weekStart: 1,
		autoclose: true, 
		orientation:" top auto",
		startView: 0, 
		maxViewMode: 0,
		minViewMode:0,
		forceParse: false, 
		language: 'zh-CN'

		// todayBtn : "linked", 
		// autoclose : true, 
		// todayHighlight : true, 
		// endDate : new Date() 
		// }).on('changeDate',function(e){ 
		// var startTime = e.date; 
		// $('.day').datepicker('setStartDate',startTime); 
	});*/

	
// 配置
	/*
	$(".set_span").click(function(){
		var flag = $(this).index() + 1;
		$('#configFlag').val(($(this).index() + 1));
		$(this).addClass("set_span2").siblings().removeClass("set_span2");
		$(".index_bottom fieldset").eq($(this).index()).addClass("show").siblings().removeClass("show");
		
		var dt;
		if(1 == flag){
			dt = {type: 1};
		}else if(2 == flag){
			dt = {type: 2};
		}
		$.ajax({
			url:'../eventAnalyse/getEventCategoryListByType',
			type:'GET',
			data: dt,
			success:function(data){
				var content = '<option value="" selected="selected">全部</option>';
				var comboText = '<li class="option-item" data-index="0" data-value="">全部</li>';
				$.each(data, function(i, item){
					content += '<option value="' + item.categoryId + '">' + item.categoryName + '</option>';
					comboText += '<li class="option-item" data-index="' + (i+1) +'" data-value="' + item.categoryId + '">' + item.categoryName + '</li>';
				});
				$('#typeFilter').html(content);
				$('#typeFilter').siblings('.combo-dropdown').html(comboText);
			}
		});
	});
	*/
	/*
	 * 初始化配置事件
	 * */
	$('.set_span2').click();
/*新增配置不限制个数开始*/
	if($(".tab_ul").width() > $(".tab_ul_box").width()){
		$(".prev_btn").removeClass("none");
		$(".next_btn").removeClass("none");
	}
	var move_l_w = 0;
	var move_r_w = 0;
	var max_move_l_w = $(".tab_ul_box").width() - $(".tab_ul").width() ;
	
	$(".prev_btn").on("click",function (){
		move_l_w = parseInt($(".tab_ul").css("left"));
		move_r_w = parseInt($(".tab_ul").css("left"));
		move_r_w = move_r_w + 100;
		if(move_r_w >= 0){
			$(".tab_ul").stop().animate({"left":0+"px"});
		}else{
			$(".tab_ul").stop().animate({"left":move_r_w+"px"});
		}
	})
	
	$(".next_btn").on("click",function (){
		move_l_w = move_l_w - 100;
		if(move_l_w < max_move_l_w){
			$(".tab_ul").stop().animate({"left":max_move_l_w+"px"});
		}else{
			$(".tab_ul").stop().animate({"left":move_l_w+"px"});
		}
	})
	
	var _move=false;//移动标记  
	var _x;  
	    $(".tab_ul").click(function(){  
	        }).mousedown(function(e){  
	        _move=true;  
	        _x=e.pageX-parseInt($(".tab_ul").css("left"));  
	        $(".tab_ul").fadeTo(20, 0.5);
	    });  
	    $(document).mousemove(function(e){  
	        if(_move){  
	            var x=e.pageX-_x; 
	            if( x < max_move_l_w){
	            	$(".tab_ul").css({left:max_move_l_w});
	            }else if(x > 0){
	            	$(".tab_ul").css({left:0});
	            }else{
	            	$(".tab_ul").css({left:x});
	            }
	            
	        }  
	    }).mouseup(function(){  
	    _move=false;  
	    $(".tab_ul").fadeTo("fast", 1);
	  });  
//新增配置不限制个数结束	
	    
//鼠标移至图表处，ajax获取数据
	    
//	    鼠标移入显示模块介绍
    $(".help").on("mouseleave",".ques",function () {
		if($(this).children(".textarea").hasClass("none")){
			$(this).addClass("none");
	    	$(this).children(".textareaBox").removeClass("none");
	    	$(this).children(".textarea").addClass("none");
	    	$(this).children(".edit_box").children(".updateInfoButton").addClass("none");
	    	$(this).children(".edit_box").children(".returnInfoButton").addClass("none");
	    	$(this).children(".edit_box").children(".tubiaoErrorSpan").text("");
		}
    });
    //修改
    $(".help").on("click",".edit",function () {
    	var textarea_H = $(this).parent().siblings(".textareaBox").height();
    	var areaHtml = $(this).parent().siblings(".textareaBox").html();
    	$(this).parent().siblings(".textarea").removeClass("none").html(areaHtml).height(textarea_H);
    	$(this).parent().siblings(".textareaBox").addClass("none");
    	$(this).siblings(".updateInfoButton").removeClass("none");
    	$(this).siblings(".returnInfoButton").removeClass("none");
    	$.each($(this).parent().siblings(".textarea"), function(i, n){
	        autoTextarea($(n)[0]);
	    });
    	//光标至最后位置
    	setFocus($(this).parent().siblings(".textarea"));
    })
    //取消
    $(".help").on("click",".returnInfoButton",function () {
    	$(this).addClass("none");
    	$(this).siblings(".updateInfoButton").addClass("none");
    	$(this).parent().siblings(".textareaBox").removeClass("none");
    	$(this).parent().siblings(".textarea").addClass("none");
    })
});

//文本域获取焦点并光标移至最后
function setFocus(obj){
	var name = obj.val()
	obj.val("").focus().val(name); 
} 


function changeConfig(pt, flag){
	$('#configFlag').val(flag);
	$(pt).addClass("set_span2").siblings().removeClass("set_span2");
	$(".index_bottom fieldset").eq($(pt).index()).addClass("show").siblings().removeClass("show");
	
	var dt;
	if(1 == flag){
		dt = {type: 1};
	}else if(2 == flag){
		dt = {type: 2};
	}
	$.ajax({
		url:'../config/getEventCategoryListByType',
		type:'GET',
		data: dt,
		success:function(data){
			var content = '<option value="" selected="selected">全部</option>';
			var comboText = '<li class="option-item" data-index="0" data-value="">全部</li>';
			$.each(data, function(i, item){
				content += '<option value="' + item.categoryId + '">' + item.categoryName + '</option>';
				comboText += '<li class="option-item" data-index="' + (i+1) +'" data-value="' + item.categoryId + '">' + item.categoryName + '</li>';
			});
			$('#typeFilter').html(content);
			$('#typeFilter').siblings('.combo-dropdown').html(comboText);
		}
	});
}








