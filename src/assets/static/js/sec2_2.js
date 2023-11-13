"use strict"
/*window.onload = function(){
	var bodyH = $(window).height();
	$(".index_bottom").height(bodyH - 50 );
	$(".data").height(bodyH - 50 );
	$(".tab").css({"position":"absolute","left":"0","bottom":"0"});
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
	//	人工查询
	$(".manual").on("click",function (){
		$("#tab_ul li").removeClass("active");
		$(".tab .people_tab_down").addClass("show").siblings().removeClass("show");
		$(this).addClass("manual_act")
	})
	// 预设点隐藏显示
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
		if($(".img_data").css("display") == "block"){
			$(this).removeClass("export_img_2").addClass("export_img");
			$(".img_data").removeClass("show").css("display","none");
			$(".table_data").css("display","block");
		}else{
			$(this).removeClass("export_img").addClass("export_img_2");
			$(".img_data").css("display","block");
			$(".table_data").css("display","none");
		}
	});
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
	$(".table_box tbody").find("tr:odd").css("background","#fff");
	$(".table_box tbody").find("tr:even").css("background","#f1f4f8");
// 挂起
	$(".table td").on("click",".gq",function(){
		if($(this).attr("src") == "../images/gq.png"){
			$(this).attr("src","../images/gq2.png");
		}else{
			$(this).attr("src","../images/gq.png");
		}
	});


// 日期
	$('.year').datepicker({
		format: 'yyyy', 
		weekStart: 1, 
		autoclose: true, 
		orientation:" top auto",
		startView: 2, 
		maxViewMode: 2,
		minViewMode:2,
		forceParse: false, 
		language: 'zh-CN' 
	});
	$('.month').datepicker({
		format: 'mm', 
		weekStart: 1, 
		autoclose: true, 
		orientation:" top auto",
		startView: 1, 
		maxViewMode: 1,
		minViewMode:1,
		forceParse: false, 
		language: 'zh-CN' 
	});
	$('.day').datepicker({
		format: 'dd', 
		weekStart: 1, 
		autoclose: true, 
		orientation:" top auto",
		startView: 0, 
		maxViewMode: 0,
		minViewMode:0,
		forceParse: false, 
		language: 'zh-CN' 
	});

	
// 配置  configFlag隐藏域置值
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
//				var content = '<select><option value="" selected="selected">全部</option>';
				var content = '<option value="" selected="selected">全部</option>';
				var comboText = '<li class="option-item" data-index="0" data-value="">全部</li>';
				$.each(data, function(i, item){
					content += '<option value="' + item.categoryId + '">' + item.categoryName + '</option>';
					comboText += '<li class="option-item" data-index="' + (i+1) +'" data-value="' + item.categoryId + '">' + item.categoryName + '</li>';
				});
//				content += '</select>';
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
//    鼠标移入显示模块介绍
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
})


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





