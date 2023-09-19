/**
 * 
 */
//菜单提示框
function addEle(disX,tex){
	$(".right-info").remove();
	var $div='<div class="right-info" style="position:absolute;left:0;top:'+disX+'px;">'+tex+'</div>'
	$("body").append($div);
}
function removeEle(){
	$(".right-info").remove();
}

//查询配置执行后结果所占数据库空间大小（这里主要是查询配置执行后结果的大小，忽略配置本身所占空间。）
function queryDataSpace(flag){
	$.ajax({
		url:'../config/queryDataSpace',
		data:{flag:flag},
		type: 'POST',
		dataType:"json",
		success: function(data){
			function $(id) {
	            return document.querySelector(id);
	        }
	        function hover(ele, left,display ,color, words, font) {  
	        	
	            //鼠标进
	            $(ele).onmouseover = function () {
	                $(".show-details").style.display = "block";
	                $(".show-details").style.left = left + 'px';
	                $(".show-details .in_one span").innerHTML = words.in_one;
	                $(".show-details .in_two span").innerHTML = words.in_two;
	                $(".show-details .in_three .span1").innerHTML = words.in_three;
	                $(".show-details .in_three").style.display = display; 
	                $(".show-details .in_three span").style.color = color;
	                $(".show-details .in_three .span2").innerHTML = font;               
	            };
	            //鼠标出
	            $(ele).onmouseout = function () {
	                $(".show-details").style.display = "none";
	            }
	        }
	        var size = data.dataSize;
	        hover('#anquan', 1225, 'block', 'green',  {in_one: '2G', in_two: size, in_three: 2-size},'剩余储存量 : ');
	        hover('#weixian', 1225, 'block', 'red' ,{in_one: '2G', in_two: size, in_three: size},'超出储存量 : ');
	        
	        if(data.dataSize>2){
				$("#weixian").style.display = "block";
				$("#anquan").style.display = "none";
			}else{
				$("#anquan").style.display = "block";
				$("#weixian").style.display = "none";
			}
		}
		
	})
}


//批量删除（正在执行的不能删除）
function delAll(){
	var ids = "";
	var isDel = true;
	var dataFlid = "";
	$(".table tbody :checkbox").each(function(){
		if($(this).prop("checked") == true){
			dataFlid += $(this).attr("data-flid")+",";
			ids += $(this).attr("data")+",";
			if($(this).attr("data-status")==1||$(this).attr("data-status")==4){//正在执行的和排队中的配置不能删除
				isDel = false;
				return false;
			}
		}
	});
	if(ids.length>0){
		if(isDel){
			var dt = {configId:1,flid:1};
			$.ajax({
				url: '../config/findDelConfigAuth',
				type: 'POST',
				data: dt,
				success: function(data){
					if(data.msg == 'nopermission'){
						win.alertEx('无删除权限');
					}else if(data.msg == 'ok'){
						 win.confirm('系统提示', '确定要删除配置信息吗?', function (r) {
				               if(r){
				            	   var dt2 = {ids:ids,flidIds:dataFlid};
				            	   $.ajax({
										url: '../config/delAllConfig',
										type: 'POST',
										data: dt2,
										success: function(data){
											if(data.msg == 'ok'){
												/*alert('删除成功');
												 showConfigList();*/
												 win.alert('系统提示', '配置批量删除成功',  function(){
													 showConfigList();
													 $("#infodiv").css("display","none");
												 });
												
											}else{
												win.alertEx("操作失败！");
											}
									  }
									});
				               }else{
				            	   win.alertEx("已取消");
				               }
				         });
					}else{
						win.alertEx("操作失败！");
					}
			  }
			});
		}else{
			win.alertEx("所勾选配置中含有【排队中】或者【执行中】的配置，请重新勾选");
		}
	}else{
		win.alertEx("请勾选需要删除的配置");
	}
	
}

//配置删除
function delConfig(id,ids){
		var dt = {configId:id,flid:ids};
		$.ajax({
			url: '../config/findDelConfigAuth',
			type: 'POST',
			data: dt,
			success: function(data){
				if(data.msg == 'nopermission'){
					win.alertEx('无删除权限');
				}else if(data.msg == 'ok'){
					
					 win.confirm('系统提示', '确定要删除配置信息吗?', function (r) {
			               if(r){
			            	   $.ajax({
									url: '../config/delConfig',
									type: 'POST',
									data: dt,
									success: function(data){
										if(data.msg == 'ok'){
											/*alert('删除成功');
											 showConfigList();*/
											 win.alert('系统提示', '配置删除成功',  function(){
												 showConfigList();
												 $("#infodiv").css("display","none");
											 });
											
										}else{
											win.alertEx("操作失败");
										}
								  }
								});
			               }else{
			            	   win.alertEx("已取消");
			               }
			         });
					/*if(confirm('确定要删除配置信息吗?')){
						
					}*/
				}else{
					win.alertEx("操作失败！");
				}
		  }
		});
}
//删除用户信息
function delUserConfig(id){
	win.confirm('系统提示', '确定要删除用户信息吗?', function (r) {
        if(r){
        	var dt = {id:id};
    		$.ajax({
    			url: '../user/delUserConfig',
    			type: 'POST',
    			data: dt,
    			success: function(data){
    				if(data.msg == 'ok'){
    					/*alert('删除成功!');
    					showConfigList();*/
    					win.alert('系统提示', '删除成功',  function(){
    						showConfigList();
						});
    					$("#infodiv").css("display","none");
    				}else if(data.msg == 'nopermission'){
    					win.alertEx('无删除权限');
    				}else if(data.msg == 'error'){
    					win.alertEx('系统异常，请联系系统管理员');
    				}
    			}
    		});
        }else{
        	win.alertEx("已取消");
        }
	 });
	/*if(confirm('确定要删除用户信息吗?')){
		var dt = {id:id};
		$.ajax({
			url: '../user/delUserConfig',
			type: 'POST',
			data: dt,
			success: function(data){
				if(data.msg == 'ok'){
					alert('删除成功!');
					showConfigList();
					$("#infodiv").css("display","none");
				}else if(data.msg == 'nopermission'){
					alert('无删除权限');
				}else if(data.msg == 'error'){
					alert('系统异常，请联系系统管理员');
				}
			}
		});
	}	*/
}
//修改配置的状态以及配置执行时间
function updateConfigStatus(id){
	$.ajax({
		url:'../config/updateConfigStatus',
		type: 'POST',
		data: {configId:id},
		success:function(data){
			if(data=="1"){
				win.alertEx("配置状态修改失败");
			}
			showConfigList();
		}
	});
	
}


//执行查询
function execQuery(id){
	var dt = {configId:id};
	var formId = "tijiao"+id;
	$.ajax({
		url:'../config/execQuery',
		type: 'POST',
		data: dt,
		beforeSend:function(){ //触发ajax请求开始时执行
			$("."+formId+"").attr('onclick','javascript:void();');//防止点击时多次提交
		},
		success: function(data){
			if(data.msg == 'complete'){
				showConfigList();
			}
			if(data.msg == 'error'){
				win.alertEx("预查询执行失败");
				$("."+formId+"").attr('onclick','javascript:execQuery('+id+');');//后台执行失败后放开约束
			}
		}
	});
}
//执行挂起 
function isShow(id,showId,fg){
	if(fg == "yes"){
		var dt = {configId:id,isShow:showId};
		$.ajax({
			url:'../config/isShow',
			type: 'POST',
			data: dt,
			dataType:"json",
			success: function(data1){
				if(data1.msg == 'complete'){
					showConfigList();
				}
			}
		});
	}else{
		win.alertEx("没有权限进行此项功能");
	}
}

//修改回显数据
function editConfig(id, categoryName,flid,scheduleState,minDate,maxDate,stringType){
	
	if(stringType=="two"){//二次回溯产生的子配置，隐藏数据源和日期提示语，还有实时监测选择框
		$("#dateRange").hide();
		$("#dataSourceType").hide();
		$("#nowTimeLi").hide();
	}else{
		$("#dateRange").show();
		$("#dataSourceType").show();
		$("#nowTimeLi").show();
	}
	
	//清空下拉多选框
	$(".checkBoxSelect").attr("data-id",'');
	$(".checkBoxSelect").attr("text",'');
	$(".checkBoxSelect").attr("title",'');
	/*$("#actor1organizationcode").attr("data-id",'');
	$("#actor1organizationcode").attr("text",'');
	$("#actor1organizationcode").attr("title",'');*/
	getSelectCom();
	//控制页面div
	$("#infodiv").show();
	//修改时，提交按钮显现，添加时提交按钮隐藏
	if(scheduleState==2){//执行成功
		$('.event_type').removeAttr('onclick');
		$('.atlas_type').removeAttr('onclick');
		$(".pos_shadow").css("display","block");
		$(".pos_shadow2").css("display","none");
		$("#scheduleState1").css("display","block");
		$("#scheduleState2").css("display","block");
	}else if(scheduleState==4||scheduleState==1){//排队中和执行中
		$(".pos_shadow").css("display","none");
		$(".pos_shadow2").css("display","block");
		$("#scheduleState1").css("display","none");
		$("#scheduleState2").css("display","none");
	}
	else{
		$(".pos_shadow2").css("display","none");
		$(".pos_shadow").css("display","none");
		$("#scheduleState1").css("display","block");
		$("#scheduleState2").css("display","block");
		//$("#event_type").attr('onclick','dianji()');
		//$("#atlas_type").attr('onclick','graphDianji()');
		//20190716 zhg修改，只要是修改，不允许修改配置类型，禁用点击事件
		$('.event_type').removeAttr('onclick');
		$('.atlas_type').removeAttr('onclick');
	}
	if(stringType=="relation"){
		if(scheduleState==0){//待执行
			$("#allTypesName").attr('onclick','dianji()');
		}else{
			$("#allTypesName").removeAttr('onclick');
		}
	}
	var dt = {configId: id};
	$.ajax({
		url: '../config/getMainConfigVO',
		type: 'GET',
		data: dt,
		async:false,
		success: function(resu){
			var data = resu.data;
			if(resu.msg=="nopermission"){
				$(".pos_shadow").css("display","none");
				$(".pos_shadow2").css("display","block");
				$("#scheduleState1").css("display","none");
			}
			if(data != null){
				getSelectCom();
				//回溯配置的回显
				if(data.isRelation==1){//是否为关联配置
					var pzTypes = data.pzTypes;
					var allTypes = [];
					var allTypesName = [];
					for(var i=0;i<pzTypes.split(",").length;i++){
						$('.pz_list_box input[name="pzTypes"]').each(function(){
							if(pzTypes.split(",")[i] == $(this).val()){
								$(this).prop('checked', true);
								allTypes.push($(this).val());
								allTypesName.push($(this).parent().text().replace(/\s/g,""));
							}
						});
					}
					allTypes = allTypes.join(",");
					allTypesName = allTypesName.join(",");
					$("#allTypesName").val(allTypesName);
					$("#allTypesName").attr("title",allTypesName);
					$(".pzTypes").val(allTypes);
				}
				if(data.remark != null && data.remark != undefined){
					$('#remark').val(data.remark);
				}
				//根据pzid查询相关信息
				if(1 == data.configFlag){
					//根据所选数据源对时间范围、开始时间、结束时间插件的范围重新定义
					if(data.dataSourceType != null && data.dataSourceType != undefined){
						if(stringType == "relation"){
							selectYearMonthDay(data.dataSourceType);
							if(data.dateInfo == undefined){//日期条件不存在，则需要在这一步把两个日期框置空
								$('#stDates').val("");
								$('#edDates').val("");
								$('#gkgStDate').val("");
								$('#gkgEdDate').val("");
							}
						}else{
							if(data.dataSourceType == 1){
								$(".dataSourceType1").prop('checked','true');
								updateConfigMaxDate = configDate.maxDate1;
								updateConfigMinDate = configDate.minDate1;
							}else if(data.dataSourceType == 2){
								$(".dataSourceType2").prop('checked','true');
								updateConfigMaxDate = configDate.maxDate2;
								updateConfigMinDate = configDate.minDate2;
							}else{
								$(".dataSourceType3").prop('checked','true');
								updateConfigMaxDate = configDate.maxDate3;
								updateConfigMinDate = configDate.minDate3;
							}
							//提示结束时间赋值
							$("#edDateSpan").html(updateConfigMaxDate);
							$("#stDateSpan").html(updateConfigMinDate);
							//重置时间插件的时间范围 注意：必须放置setDate之前
							$('.day1').datepicker('setStartDate',updateConfigMinDate); 
							$('.day2').datepicker('setEndDate',updateConfigMaxDate);
						}
					}
					
					$('.set_span').eq(0).click();
					//填充事件属性值
					$('.aa').val(data.configId);
					$('#configName').val(data.configName);
					$('#isPrivate').val(data.isPrivate);
					//事件展示的权重填值
					if(flid==34){
						$("#stNumMentions").val(data.stNumMentions);
						$("#edNumMentions").val(data.edNumMentions);
						$("#stNumArticles").val(data.stNumArticles);
						$("#edNumArticles").val(data.edNumArticles);
						$("#stNumSources").val(data.stNumSources);  
						$("#edNumSources").val(data.edNumSources);  
						$("#quanzhongkuang").show();
						$("#quanzhong").hide();
					}else{
						$("#quanzhongkuang").hide();
						$("#quanzhong").show();
					}
					//国家关系展示,参数子表
					if(flid==39){
						if(data.countryRelationParameter!=undefined){
							$("#yearNorm1").val(data.countryRelationParameter.yearNorm1);
							$("#monthNorm1").val(data.countryRelationParameter.monthNorm1);
							$("#weekNorm1").val(data.countryRelationParameter.weekNorm1);
							$("#dateNorm1").val(data.countryRelationParameter.dateNorm1);
							$("#yearNorm2").val(data.countryRelationParameter.yearNorm2);
							$("#monthNorm2").val(data.countryRelationParameter.monthNorm2);
							$("#weekNorm2").val(data.countryRelationParameter.weekNorm2);
							$("#dateNorm2").val(data.countryRelationParameter.dateNorm2);
						}
						$("#countryRelation").show();
					}else{
						$("#countryRelation").hide();
					}
					//事件类型设置选中状态
					$('#popup_ul_event input[type=checkbox]').each(function(){
						if(data.configCategory == $(this).val()){
							$(this).prop('checked', true);
						}else{
							$(this).prop('checked', false);
						}
					});
					$('#typeIds').val(data.configCategory);
					$('#event_type').val(categoryName);
					$('#yxj').val(data.priority);
					var conditionFW = 1;
					//类型展示（6） 国家状态展示（11） 国家稳定分析（10）国家情感分析（14）首页（3）
					if(flid==6||flid==10||flid==11||flid==14){
						conditionFW = 3
						//$("#actorModel").hide();
						//$("#eventProperty").hide();
					}/*else if(flid == 3){
						conditionFW = 2;
					}*/
					//判断条件范围
					if(conditionFW==1){//全部条件
						$("#eventProperty").show();
						$("#actorModel").show();
						
					}/*else if(conditionFW == 2){//时间+事件类型+权重
						$("#actorModel").hide();
						$("#eventProperty").show();
						$(".homeNotShow").hide();
						
					}*/else if(conditionFW == 3){//时间+权重
						$("#actorModel").hide();
						$("#eventProperty").hide();
					}
					//年月日截取为年月
					/*if(conditionFW == 2){
						startMinTime = startMinTime.substring(0,7);
						endMaxTime = endMaxTime.substring(0,7);
					}
					$("#edDateSpan").html(endMaxTime);
					$("#stDateSpan").html(startMinTime);*/
					/*//判断是否为首页
					if(flid==3){
						$(".now").show();
					}else{
						$(".now").hide();
					}*/
					//判断选中的是否有32（事件时间线） 比重    新加的模块统计比重：类型时间演化（5）国家事件监测（40） 地理时间演化（8，后更名为地理事件分析）情感稳定分析（41）
					if(flid==32||flid==5||flid==40||flid==8||flid==41){
						$("#bizhong").show();
					}else{
						$("#bizhong").hide();
					}
					//权限选中状态
					$('#isPrivate option').each(function(){
						if(data.isPrivate == $(this).val()){
							$(this).parent().siblings('input[type=text]').val($(this).html());
							$(this).attr('selected', true);
						}else{
							$(this).attr('selected', false);
						}
					});
					//实时监测选中状态
					$('#nowTime option').each(function(){
						if(data.nowTime == $(this).val()){
							$(this).parent().siblings('input[type=text]').val($(this).html());
							$(this).attr('selected', true);
						}else{
							$(this).attr('selected', false);
						}
					});
					//关键字回显
					if(data.eventKeyWords != null){
						//if(data.eventKeyWords.keywordsactor != null && data.eventKeyWords.keywordsactor != ""){
							$('#eventKeyWordactor').val(data.eventKeyWords.keywordsactor);
						//}
						//if(data.eventKeyWords.keywordsactor1 != null && data.eventKeyWords.keywordsactor1 != ""){
							$('#eventKeyWordactor1').val(data.eventKeyWords.keywordsactor1);
						//}
						//if(data.eventKeyWords.keywordsactor2 != null && data.eventKeyWords.keywordsactor2 != ""){
							$('#eventKeyWordactor2').val(data.eventKeyWords.keywordsactor2);
						//}
						if(data.eventKeyWords.eventKeyWordactorIsBig==1){
							$("input[name=eventKeyWordactorIsBig]").prop("checked",false);
						}else{
							$("input[name=eventKeyWordactorIsBig]").prop("checked",true);
						}
						if(data.eventKeyWords.eventKeyWordactor1IsBig==1){
							$("input[name=eventKeyWordactor1IsBig]").prop("checked",false);
						}else{
							$("input[name=eventKeyWordactor1IsBig]").prop("checked",true);
						}
						if(data.eventKeyWords.eventKeyWordactor2IsBig==1){
							$("input[name=eventKeyWordactor2IsBig]").prop("checked",false);
						}else{
							$("input[name=eventKeyWordactor2IsBig]").prop("checked",true);
						}
					}
					
					//角色1回显
					if(data.actorInfo != null){
						getSelectCom();
						if(data.actorInfo[0].actor1Countrycode != null){
							var name,code;
							var str = data.actorInfo[0].actor1Countrycode;
							name = str.substring(0,str.indexOf("&&"));
							code = str.substring(str.indexOf("&&") +2, str.length);
							//alert(name)
							//alert(code);
							//alert(str);
							$("#actor1Countrycode").attr("title",name);
							$("#actor1Countrycode").attr("data-id",code);
							$("#actor1Countrycode").attr("html",name);
						}
						if(data.actorInfo[0].organizationcodeactor1 != null){
							var name,code;
							var str = data.actorInfo[0].organizationcodeactor1;
							name = str.substring(0,str.indexOf("&&"));
							code = str.substring(str.indexOf("&&") +2, str.length);
							$("#actor1organizationcode").attr("title",name);
							$("#actor1organizationcode").attr("data-id",code);
						}
						if(data.actorInfo[0].religion1CodeActor1 != null){
							var name,code;
							var str = data.actorInfo[0].religion1CodeActor1;
							name = str.substring(0,str.indexOf("&&"));
							code = str.substring(str.indexOf("&&") +2, str.length);
							$("#actor1Religion1Code1").attr("title",name);
							$("#actor1Religion1Code1").attr("data-id",code);
						}
						if(data.actorInfo[0].religion2CodeActor1 != null){
							var name,code;
							var str = data.actorInfo[0].religion2CodeActor1;
							name = str.substring(0,str.indexOf("&&"));
							code = str.substring(str.indexOf("&&") +2, str.length);
							$("#actor1Religion1Code2").attr("title",name);
							$("#actor1Religion1Code2").attr("data-id",code);
						}
						if(data.actorInfo[0].ethnicCodeactor1 != null){
							var name,code;
							var str = data.actorInfo[0].ethnicCodeactor1;
							name = str.substring(0,str.indexOf("&&"));
							code = str.substring(str.indexOf("&&") +2, str.length);
							$("#actor1EthnicCode").attr("title",name);
							$("#actor1EthnicCode").attr("data-id",code);
						}
						if(data.actorInfo[0].typeCode1actor1 != null){
							var name,code;
							var str = data.actorInfo[0].typeCode1actor1;
							name = str.substring(0,str.indexOf("&&"));
							code = str.substring(str.indexOf("&&") +2, str.length);
							$("#actor1TypeCode1").attr("title",name);
							$("#actor1TypeCode1").attr("data-id",code);
						}
						if(data.actorInfo[0].typeCode2actor1 != null){
							var name,code;
							var str = data.actorInfo[0].typeCode2actor1;
							name = str.substring(0,str.indexOf("&&"));
							code = str.substring(str.indexOf("&&") +2, str.length);
							$("#actor1TypeCode2").attr("title",name);
							$("#actor1TypeCode2").attr("data-id",code);
						}
						if(data.actorInfo[0].typeCode3actor1 != null){
							var name,code;
							var str = data.actorInfo[0].typeCode3actor1;
							name = str.substring(0,str.indexOf("&&"));
							code = str.substring(str.indexOf("&&") +2, str.length);
							$("#actor1TypeCode3").attr("title",name);
							$("#actor1TypeCode3").attr("data-id",code);
						}
						if(data.actorInfo[0].geographyCountryactor1 != null){
							var name,code;
							var str = data.actorInfo[0].geographyCountryactor1;
							name = str.substring(0,str.indexOf("&&"));
							code = str.substring(str.indexOf("&&") +2, str.length);
							$("#actor1geographyCountry").attr("title",name);
							$("#actor1geographyCountry").attr("data-id",code);
						}
						//角色二
						if(data.actorInfo[0].actor2Countrycode != null){
							var name,code;
							var str = data.actorInfo[0].actor2Countrycode;
							name = str.substring(0,str.indexOf("&&"));
							code = str.substring(str.indexOf("&&") +2, str.length);
							$("#actor2Countrycode").attr("title",name);
							$("#actor2Countrycode").attr("data-id",code);
						}
						if(data.actorInfo[0].organizationcodeactor2 != null){
							var name,code;
							var str = data.actorInfo[0].organizationcodeactor2;
							name = str.substring(0,str.indexOf("&&"));
							code = str.substring(str.indexOf("&&") +2, str.length);
							$("#actor2organizationcode").attr("title",name);
							$("#actor2organizationcode").attr("data-id",code);
						}
						if(data.actorInfo[0].religion1CodeActor2 != null){
							var name,code;
							var str = data.actorInfo[0].religion1CodeActor2;
							name = str.substring(0,str.indexOf("&&"));
							code = str.substring(str.indexOf("&&") +2, str.length);
							$("#actor2Religion1Code1").attr("title",name);
							$("#actor2Religion1Code1").attr("data-id",code);
						}
						if(data.actorInfo[0].religion2CodeActor2 != null){
							var name,code;
							var str = data.actorInfo[0].religion2CodeActor2;
							name = str.substring(0,str.indexOf("&&"));
							code = str.substring(str.indexOf("&&") +2, str.length);
							$("#actor2Religion1Code2").attr("title",name);
							$("#actor2Religion1Code2").attr("data-id",code);
						}
						if(data.actorInfo[0].ethnicCodeactor2 != null){
							var name,code;
							var str = data.actorInfo[0].ethnicCodeactor2;
							name = str.substring(0,str.indexOf("&&"));
							code = str.substring(str.indexOf("&&") +2, str.length);
							$("#actor2EthnicCode").attr("title",name);
							$("#actor2EthnicCode").attr("data-id",code);
						}
						if(data.actorInfo[0].typeCode1actor2 != null){
							var name,code;
							var str = data.actorInfo[0].typeCode1actor2;
							name = str.substring(0,str.indexOf("&&"));
							code = str.substring(str.indexOf("&&") +2, str.length);
							$("#actor2TypeCode1").attr("title",name);
							$("#actor2TypeCode1").attr("data-id",code);
						}
						if(data.actorInfo[0].typeCode2actor2 != null){
							var name,code;
							var str = data.actorInfo[0].typeCode2actor2;
							name = str.substring(0,str.indexOf("&&"));
							code = str.substring(str.indexOf("&&") +2, str.length);
							$("#actor2TypeCode2").attr("title",name);
							$("#actor2TypeCode2").attr("data-id",code);
						}
						if(data.actorInfo[0].typeCode3actor2 != null){
							var name,code;
							var str = data.actorInfo[0].typeCode3actor2;
							name = str.substring(0,str.indexOf("&&"));
							code = str.substring(str.indexOf("&&") +2, str.length);
							$("#actor2TypeCode3").attr("title",name);
							$("#actor2TypeCode3").attr("data-id",code);
						}
						if(data.actorInfo[0].geographyCountryactor2 != null){
							var name,code;
							var str = data.actorInfo[0].geographyCountryactor2;
							name = str.substring(0,str.indexOf("&&"));
							code = str.substring(str.indexOf("&&") +2, str.length);
							$("#actor2geographyCountry").attr("title",name);
							$("#actor2geographyCountry").attr("data-id",code);
						}
					}
					//事件属性回显
					if(data.eventInfo != null){
						if(data.eventInfo[0].sourceUrl != null){
							$("#eventAttr8").attr("value", data.eventInfo[0].sourceUrl);
						}
						if(data.eventInfo[0].stavgTone != null){
							$("#eventAttr9").attr("value", data.eventInfo[0].stavgTone);
						}
						if(data.eventInfo[0].edavgTone != null){
							$("#eventAttr10").attr("value", data.eventInfo[0].edavgTone);
						}
						if(data.eventInfo[0].stgoldsteinScale != null){
							$("#eventAttr11").attr("value", data.eventInfo[0].stgoldsteinScale);
						}
						if(data.eventInfo[0].edgoldsteinScale != null){
							$("#eventAttr12").attr("value", data.eventInfo[0].edgoldsteinScale);
						}
						if(data.eventInfo[0].quadClassData != null){
							var name,code;
							var str = data.eventInfo[0].quadClassData;
							if(str.length > 0){
								name = str.substring(0,str.indexOf("&&"));
								code = str.substring(str.indexOf("&&") +2, str.length);
							}
							$("#quadClass").attr("title",name);
							$("#quadClass").attr("data-id",code);
						}
						if(data.eventInfo[0].rootEventData != null){
							var name,code;
							var str = data.eventInfo[0].rootEventData;
							if(str.length > 0){
								name = str.substring(0,str.indexOf("&&"));
								code = str.substring(str.indexOf("&&") +2, str.length);
							}
							$("#rootEvent").attr("title",name);
							$("#rootEvent").attr("data-id",code);
						}
						if(data.eventInfo[0].baseEventData != null){
							var name,code;
							var str = data.eventInfo[0].baseEventData;
							if(str.length > 0){
								name = str.substring(0,str.indexOf("&&"));
								code = str.substring(str.indexOf("&&") +2, str.length);
							}
							$("#baseEvent").attr("title",name);
							$("#baseEvent").attr("data-id",code);
						}
						if(data.eventInfo[0].codeEventData != null){
							var name,code;
							var str = data.eventInfo[0].codeEventData;
							if(str.length > 0){
								name = str.substring(0,str.indexOf("&&"));
								code = str.substring(str.indexOf("&&") +2, str.length);
							}
							$("#eventCode").attr("title",name);
							$("#eventCode").attr("data-id",code);
						}
						if(data.eventInfo[0].geographyCountryactor != null){
							var name,code;
							var str = data.eventInfo[0].geographyCountryactor;
							if(str.length > 0){
								name = str.substring(0,str.indexOf("&&"));
								code = str.substring(str.indexOf("&&") +2, str.length);
							}
							$("#actorgeographyCountry").attr("title",name);
							$("#actorgeographyCountry").attr("data-id",code);
						}
						if(data.eventInfo[0].isRoot != null){
//							var isRoot = data.eventInfo[0].isRoot;
//							if(isRoot == 0){
//								alert(1);
//								//$("#eventAttr7").attr("value", isRoot.toString);
//								$("#eventAttr7").attr('selected', "selected");
//							}else if(isRoot == 1){
//								alert(2);
//								//$("#eventAttr7").attr("value", isRoot.toString);
//								$("#eventAttr7").attr('selected', "selected");
////								//权限选中状态
////								$('#isPrivate option').each(function(){
////								if(data.isPrivate == $(this).val()){
////									$(this).parent().siblings('input[type=text]').val($(this).html());
////									$(this).attr('selected', true);
////								}else{
////									$(this).attr('selected', false);
////								}
////								});
//							}
							$('#eventAttr7 option').each(function(){
								if(data.eventInfo[0].isRoot == $(this).val()){
									$(this).parent().siblings('input[type=text]').val($(this).html());
									$(this).attr('selected', true);
								}else{
									$(this).attr('selected', false);
								}
							});
						}
					}
					//新增加的地理信息
					if(data.eventGeoDl != null){
						$('#actor1Geographictype option').each(function(){
							if(data.eventGeoDl[0].actor1Geographictype == $(this).val()){
								$(this).parent().siblings('input[type=text]').val($(this).html());
								$(this).attr('selected', true);
							}else{
								$(this).attr('selected', false);
							}
						});
						$('#actor2Geographictype option').each(function(){
							if(data.eventGeoDl[0].actor2Geographictype == $(this).val()){
								$(this).parent().siblings('input[type=text]').val($(this).html());
								$(this).attr('selected', true);
							}else{
								$(this).attr('selected', false);
							}
						});
						$('#actorGeographictype option').each(function(){
							if(data.eventGeoDl[0].geographictype == $(this).val()){
								$(this).parent().siblings('input[type=text]').val($(this).html());
								$(this).attr('selected', true);
							}else{
								$(this).attr('selected', false);
							}
						});
						if(data.eventGeoDl[0].eventactor1necessaryKey != null){
							$('#eventactor1necessaryKey').val(data.eventGeoDl[0].eventactor1necessaryKey);
						}
						if(data.eventGeoDl[0].eventactor1atLeastOneKey != null){
							$('#eventactor1atLeastOneKey').val(data.eventGeoDl[0].eventactor1atLeastOneKey);
						}
						if(data.eventGeoDl[0].eventactor1exclusiveKey != null){
							$('#eventactor1exclusiveKey').val(data.eventGeoDl[0].eventactor1exclusiveKey);
						}
						
						if(data.eventGeoDl[0].eventactor2necessaryKey != null){
							$('#eventactor2necessaryKey').val(data.eventGeoDl[0].eventactor2necessaryKey);
						}
						if(data.eventGeoDl[0].eventactor2atLeastOneKey != null){
							$('#eventactor2atLeastOneKey').val(data.eventGeoDl[0].eventactor2atLeastOneKey);
						}
						if(data.eventGeoDl[0].eventactor2exclusiveKey != null){
							$('#eventactor2exclusiveKey').val(data.eventGeoDl[0].eventactor2exclusiveKey);
						}
						
						if(data.eventGeoDl[0].eventnecessaryKey != null){
							$('#eventnecessaryKey').val(data.eventGeoDl[0].eventnecessaryKey);
						}
						if(data.eventGeoDl[0].eventactor1atLeastOneKey != null){
							$('#eventatLeastOneKey').val(data.eventGeoDl[0].eventatLeastOneKey);
						}
						if(data.eventGeoDl[0].eventactor1exclusiveKey != null){
							$('#eventexclusiveKey').val(data.eventGeoDl[0].eventexclusiveKey);
						}
					}
					//事件时间属性设置值
	                //indexs = 0;
					if(data.dateInfo != null){
						var dateInfoSize = data.dateInfo.length;
						if(dateInfoSize == 1){
							if(flid==12){//对比分析，针对于 对比分析 模块中只有一组日期
								$(".add_date_btn").show();
							}else{
								$(".add_date_btn").hide();
							}
							$("#appendDatas").remove();
							var nums = $(".add_date").length;
							for(var i=1;i<nums;i++){
								var pdid = 'appendDatas' + i;
								$("#" + pdid + "").remove();
							}
							//回显时间
							$('#stDates').val(data.dateInfo[0].stDate);
							$('#edDates').val(data.dateInfo[0].edDate);
							if(stringType=="two"){
								$('.day1').datepicker('setStartDate',data.dateInfo[0].stDate); 
								$('.day2').datepicker('setEndDate',data.dateInfo[0].edDate);
							}
							//时间插件赋值
							$('.day1').datepicker('setDate',data.dateInfo[0].stDate); 
							$('.day2').datepicker('setDate',data.dateInfo[0].edDate); 
							//首页是否是实时且为未执行
							/*if(data.dateInfo[0].edDate==1){
								$(".now").addClass("now_act");
								var date = new Date();
							    var seperator1 = "-";
							    var seperator2 = ":";
							    var month = date.getMonth() + 1;
							    var strDate = date.getDate();
							    if (month >= 1 && month <= 9) {
							        month = "0" + month;
							    }
							    if (strDate >= 0 && strDate <= 9) {
							        strDate = "0" + strDate;
							    }
							    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
							            + " " + date.getHours() + seperator2 + date.getMinutes();
								$('#edDates').val(currentdate);
							}else{
								if(data.dateInfo[0].edDate.length>10){
									$(".now").addClass("now_act");
								}
								$('#edDates').val(data.dateInfo[0].edDate);
							}*/
							
							/*$('.day1').val(data.dateInfo[0].stDate);
							$('.day2').val(data.dateInfo[0].edDate);*/
							
								/*$('.day1').datepicker({
						    		format: 'yyyy-mm-dd', 
						    		weekStart: 0,
						    		autoclose: true, 
						    		orientation:" top auto",
						    		startView: 0,
									maxViewMode: 2,
									minViewMode:0,
						    		forceParse: false, 
						    		language: 'zh-CN',
						    		startDate: '${minDate[2]}',
						    		endDate : '${maxDate[2]}',
						    	}).on('changeDate',function(e){  
						    		    if($(this).val() > $('.day2').val()){
						    		    	$('.day2').val($(this).val());
						    		    }
						    		    var startTime = e.date; 
						    		    $('.day2').datepicker('setStartDate',startTime);  
						    		});
						    	
						    	$('.day2').datepicker({
						    		format: 'yyyy-mm-dd', 
						    		weekStart: 0,
						    		autoclose: true, 
						    		orientation:" top auto",
						    		startView: 0,
									maxViewMode: 2,
									minViewMode:0,
						    		forceParse: false, 
						    		language: 'zh-CN',
						    		startDate: '${minDate[2]}',
						    		endDate : '${maxDate[2]}'
						    	}).on('changeDate',function(e){  
						    			if($(this).val() < $('.day1').val()){
						    				$('.day1').val($(this).val());
						    			}
						    		    var endTime = e.date;  
						    		    $('.day1').datepicker('setEndDate',endTime);  
						    	});*/
						}else {
							$(".add_date_btn").show();
							var eventTimeNum = $(".addEventDate").length;
							for(var i=1;i<=eventTimeNum;i++){
								var pdid = 'appendDatas' + i;
								$("#" + pdid + "").remove();
								$(".addEventDate").remove();
							}
							var data_html = "";
							for(var i=1;i<dateInfoSize;i++){
								//拼接div
								data_html +="<div class='add_date clearfix addEventDate' id='appendDatas"+i+"'>"+
							                    "<div class='td1 fl'>"+
							                        "<p class='fl'></p>"+
							                        "<b></b>"+
							                    "</div>"+
							                    "<div class='clearfix'>"+
							                        "<div class='td2 fl b_e_date'>起止日期</div>"+
							                        "<div class='td3_2 fl'>"+
							                            "<label class='lab2' for=''><input class='inp_selc day1"+i+"' name='stDates'  type='text' readonly value='"+data.dateInfo[i].stDate+"' id='stDate"+i+"'/></label>"+
							                        "</div>"+
							                        "<div class='fl width18'></div>"+
							                        "<div class='td3_2 fl'>"+
							                            "<label class='lab2' for=''><input class='inp_selc day2"+i+"' name='edDates'  type='text' readonly value='"+data.dateInfo[i].edDate+"' id='edDate"+i+"'/></label>"+
							                        "</div>"+
							                        "<div class='del_date_btn'></div>"+
							                   " </div>"+
							                "</div>";
							}
							$(".date_box").append(data_html);
							
							for(var i=1;i<dateInfoSize;i++){
								$('.day1'+i).datepicker({
						    		format: 'yyyy-mm-dd', 
						    		weekStart: 0,
						    		autoclose: true, 
						    		orientation:" top auto",
						    		startView: 0,
									maxViewMode: 2,
									minViewMode:0,
						    		forceParse: false, 
						    		language: 'zh-CN',
						    		startDate: minDate,
						    		endDate : maxDate,
						    	}).on('changeDate',function(e){
						    			var day2 = $(this).parent().parent().next().next().children().children().val();
						    		    if($(this).val() > day2){
						    		    	$(this).parent().parent().next().next().children().children().val($(this).val());
						    		    }
						    		    var startTime = e.date; 
						    		    $(this).parent().parent().next().next().children().children().datepicker('setStartDate',startTime);  
						    		});
						    	
						    	$('.day2'+i).datepicker({
						    		format: 'yyyy-mm-dd', 
						    		weekStart: 0,
						    		autoclose: true, 
						    		orientation:" top auto",
						    		startView: 0,
									maxViewMode: 2,
									minViewMode:0,
						    		forceParse: false, 
						    		language: 'zh-CN',
						    		startDate: minDate,
						    		endDate : maxDate
						    	}).on('changeDate',function(e){
						    			var day1 = $(this).parent().parent().prev().prev().children().children().val();
						    			if($(this).val() < day1){
						    				$(this).parent().parent().prev().prev().children().children().val($(this).val());
						    			}
						    		    var endTime = e.date;  
						    		    $(this).parent().parent().prev().prev().children().children().datepicker('setEndDate',endTime);  
						    	});
							}
							//第一个时间段回显时间
							$('#stDates').val(data.dateInfo[0].stDate);
							$('#edDates').val(data.dateInfo[0].edDate);
							//第一个时间段插件赋值
							$('#stDates').datepicker('setDate',data.dateInfo[0].stDate); 
							$('#edDates').datepicker('setDate',data.dateInfo[0].edDate);
							//第二个时间段插件开始设置值
							for(var i=1;i<dateInfoSize;i++){
								$('#stDate'+i).val(data.dateInfo[i].stDate);
								$('#edDate'+i).val(data.dateInfo[i].edDate);
								
								$('#stDate'+i).datepicker('setDate',data.dateInfo[i].stDate); 
								$('#edDate'+i).datepicker('setDate',data.dateInfo[i].edDate);
							}
						}
					}
					//统计依据设置值
					if(1 == data.staticbasic){
						$('.tjradio1').prop('checked', true);
						$('.tjradio2').prop('checked', false);
					}else if(2 == data.staticbasic){
						$('.tjradio2').prop('checked', true);
						$('.tjradio1').prop('checked', false);
					}
					//权重依据设置值
					if(1 == data.weightFlag){
						$('#radio1').prop('checked', true);//$("#radio1").prop("checked",true);
						$('#radio2').prop('checked', false);
						$('#radio3').prop('checked', false);
						$('#radio4').prop('checked', false);
					}else if(2 == data.weightFlag){
						$('#radio1').prop('checked', false);
						$('#radio3').prop('checked', false);
						$('#radio4').prop('checked', false);
						$('#radio2').prop('checked', true);
					}else if(3 == data.weightFlag){
						$('#radio1').prop('checked', false);
						$('#radio2').prop('checked', false);
						$('#radio4').prop('checked', false);
						$('#radio3').prop('checked', true);
					}else if(4 == data.weightFlag){
						$('#radio1').prop('checked', false);
						$('#radio2').prop('checked', false);
						$('#radio3').prop('checked', false);
						$('#radio4').prop('checked', true);
					}
					//回显高级查询语句
					if(data.customQuery!="" && data.customQuery!=undefined){
						$('.ulli').hide();
						$('.property_case').show();
						$('.high_search').css('background','#0087fd');
						$("#customQuery").val(data.customQuery);
					}else{
						$('.high_search').css('background','none');
						$('.ulli').show();
						$('.property_case').hide();
					}
					//设置节点阀值
					$('#threshold1').val(data.nodeThreshold);
					$('#threshold2').val(data.edgeThreshold);
				}else if(2 == data.configFlag){
					
					//根据所选数据源对时间范围、开始时间、结束时间插件的范围重新定义
					if(data.dataSourceType != null && data.dataSourceType != undefined){
						if(stringType == "relation"){
							selectYearMonthDay2(data.dataSourceType);
						}else{
							if(data.dataSourceType == 1){
								$(".dataSourceType1").prop('checked','true');
								updateConfigMaxDate = configDate.maxDate1;
								updateConfigMinDate = configDate.minDate1;
							}else if(data.dataSourceType == 2){
								$(".dataSourceType2").prop('checked','true');
								updateConfigMaxDate = configDate.maxDate2;
								updateConfigMinDate = configDate.minDate2;
							}else{
								$(".dataSourceType3").prop('checked','true');
								updateConfigMaxDate = configDate.maxDate3;
								updateConfigMinDate = configDate.minDate3;
							}
							//提示结束时间赋值
							$("#edDateSpan").html(updateConfigMaxDate);
							$("#stDateSpan").html(updateConfigMinDate);
							//重置时间插件的时间范围 注意：必须放置setDate之前
							$('.day1').datepicker('setStartDate',updateConfigMinDate); 
							$('.day2').datepicker('setEndDate',updateConfigMaxDate);
						}
					}
					
					$("#leaderKeyWord").val(data.leaderName);
					$('.set_span').eq(1).click();
					$('.aa').val(data.configId);
					$('#configName').val(data.configName);
					$('#atlas_type').val(categoryName);
					$('#yxj').val(data.priority);
					//回显高级查询语句
					$("#customQuery").val(data.customQuery);
					//图谱时间线显示比重
					if(flid==31){
						$("#bizhong").show();
					}else{
						$("#bizhong").hide();
					}
					//统计依据设置值
					if(1 == data.staticbasic){
						$('.tjradio1').prop('checked', true);
						$('.tjradio2').prop('checked', false);
					}else if(2 == data.staticbasic){
						$('.tjradio2').prop('checked', true);
						$('.tjradio1').prop('checked', false);
					}
					//图谱展示  数据回显
					if(flid==35){
						$("#baodaoshu").show();
						$("#quanzhong2").hide();
						$("#stNUMARTS").val(data.stNUMARTS);
						$("#edNUMARTS").val(data.edNUMARTS);
					}else{
						$("#baodaoshu").hide();
						$("#quanzhong2").show();
					}
				/*//  16:领导人情感分析    
					if(flid==16){
						$("#guanjianzi").hide();
						$("#yu").hide();
						$("#yuzhi").hide();
						$("#lingdaoren").hide();
						$("#riqi").show();
						$("#quanzhong").show();
						$("#tone").hide();
						$("#tone1").hide();
						$("#tone2").hide();
						$("#IDs").hide();
					}
					// 27国家状态 
					if(flid==27){
						$("#guanjianzi").hide();
						$("#yu").hide();
						$("#yuzhi").hide();
						$("#lingdaoren").hide();
						$("#riqi").show();
						$("#quanzhong").show();
						$("#tone").hide();
						$("#tone1").hide();
						$("#tone2").hide();
						$("#IDs").hide();
					}*/
					/*//25实体地理网络   
					if(flid==25){
						$("#yuzhi").show();
						$("#guanjianzi").show();
						$("#yu").hide();
						$("#lingdaoren").hide();
						$("#riqi").show();
						$("#quanzhong").show();
						$("#tone").hide();
						$("#tone1").hide();
						$("#tone2").hide();
						$("#IDs").hide();
					}*/
					//17 领导人标签云
					/*if(flid==17){
						$("#lingdaoren").show();
						$("#guanjianzi").hide();
						$("#yu").hide();
						$("#yuzhi").hide();
						$("#riqi").show();
						$("#quanzhong").show();
						$("#tone").show();
						$("#tone1").show();
						$("#tone2").show();
						$("#IDs").show();
					}*/
					//18-22 、29 时间线系列 28国家冲突分析
					if(flid==18||flid==19||flid==20||flid==21||flid==22||flid==29||flid==26||flid==28){
						$("#yu").hide();
						$("#yuzhi").hide();
						$("#riqi").show();
						$("#quanzhong").show();
						$("#guanjianzi").show();
						$("#lingdaoren").hide();
						$("#tone").show();
						$("#tone1").show();
						$("#tone2").show();
						$("#IDs").show();
					}
					//  23实体网络图    24 实体标签云  
					if(flid==24||flid==23){
						$("#yu").show();
						$("#yuzhi").hide();
						$("#riqi").show();
						$("#quanzhong").show();
						$("#guanjianzi").show();
						$("#lingdaoren").hide();
						$("#tone").show();
						$("#tone1").show();
						$("#tone2").show();
						$("#IDs").show();
					}
					//图谱  国家态势感知30
					if(flid==30){
						$("#yu").hide();
						$("#yuzhi").hide();
						$("#riqi").show();
						$("#quanzhong").show();
						$("#guanjianzi").show();
						$("#lingdaoren").hide();
						$("#tone").show();
						$("#tone1").show();
						$("#tone2").show();
						$("#IDs").show();
					}
					//权限选中状态
					$('#isPrivate option').each(function(){
						if(data.isPrivate == $(this).val()){
							$(this).parent().siblings('input[type=text]').val($(this).html());
							$(this).attr('selected', true);
						}else{
							$(this).attr('selected', false);
						}
					});
					//实时监测选中状态
					$('#nowTime option').each(function(){
						if(data.nowTime == $(this).val()){
							$(this).parent().siblings('input[type=text]').val($(this).html());
							$(this).attr('selected', true);
						}else{
							$(this).attr('selected', false);
						}
					});
					//图谱类型 选择状态
					$('#popup_ul_atlas input[type=checkbox]').each(function(){
						if(data.configCategory == $(this).val()){
							$(this).prop('checked', true);
						}else{
							$(this).prop('checked', false);
						}
					});
					$('#typeIds').val(data.configCategory);
					if(data.remark != null && data.remark != undefined){
						$('#gkgRemark').val(data.remark);
					}
					//填充日期搜索信息
					if(data.dateInfo != null){
						if(data.dateInfo.length>1){//多个时间段（暂时没有，先注释）
							
						}else{//一组时间段
							$(".add_date_btn").hide();
							var gkgTimeNum = $(".addGkgDate").length;
							for(var i=1;i<=gkgTimeNum;i++){
								var pdid = 'appendGkgTime' + i;
								$("#" + pdid + "").remove();
							}
							if(data.dateInfo[0].stDate != null){
								$('#gkgStDate').val(data.dateInfo[0].stDate);
							}
							if(data.dateInfo[0].edDate != null){
								$('#gkgEdDate').val(data.dateInfo[0].edDate);
							}
							if(stringType=="two"){
								$('#gkgStDate').datepicker('setStartDate',data.dateInfo[0].stDate); 
								$('#gkgEdDate').datepicker('setEndDate',data.dateInfo[0].edDate);
							}
							$('#gkgStDate').datepicker('setDate',data.dateInfo[0].stDate);
							$('#gkgEdDate').datepicker('setDate',data.dateInfo[0].edDate);
						}
					}
					//关键字回显
					if(data.gkgAllCondition != null && data.gkgAllCondition != undefined){
						//if(data.gkgAllCondition.countsKeyWord != undefined){
							$("#countsKeyWord").val(data.gkgAllCondition.countsKeyWord);
						//}
						//if(data.gkgAllCondition.themesKeyWord != undefined){
							$("#themesKeyWord").val(data.gkgAllCondition.themesKeyWord);
						//}
						//if(data.gkgAllCondition.locationsKeyWord != undefined){
							$("#locationsKeyWord").val(data.gkgAllCondition.locationsKeyWord);
						//}
						//if(data.gkgAllCondition.personsKeyWord != undefined){
							$("#personsKeyWord").val(data.gkgAllCondition.personsKeyWord);
						//}
						//if(data.gkgAllCondition.organizationsKeyWord != undefined){
							$("#organizationsKeyWord").val(data.gkgAllCondition.organizationsKeyWord);
						//}
						if(data.gkgAllCondition.webCountry != undefined){
							var name,code;
							var str = data.gkgAllCondition.webCountry;
							name = str.substring(0,str.indexOf("&&"));
							code = str.substring(str.indexOf("&&") +2, str.length);
							$("#webCountry").attr("title",name);
							$("#webCountry").attr("data-id",code);
							$("#webCountry").html(name);
						}
						if(data.gkgAllCondition.countsIsBig==1){
							$("input[name=countsIsBig]").prop("checked",false);
						}else{
							$("input[name=countsIsBig]").prop("checked",true);
						}
						if(data.gkgAllCondition.themesIsBig==1){
							$("input[name=themesIsBig]").prop("checked",false);
						}else{
							$("input[name=themesIsBig]").prop("checked",true);
						}
						if(data.gkgAllCondition.locationsIsBig==1){
							$("input[name=locationsIsBig]").prop("checked",false);
						}else{
							$("input[name=locationsIsBig]").prop("checked",true);
						}
						if(data.gkgAllCondition.personsIsBig==1){
							$("input[name=personsIsBig]").prop("checked",false);
						}else{
							$("input[name=personsIsBig]").prop("checked",true);
						}
						if(data.gkgAllCondition.organizationsIsBig==1){
							$("input[name=organizationsIsBig]").prop("checked",false);
						}else{
							$("input[name=organizationsIsBig]").prop("checked",true);
						}
						
					}
					//填充词云里面词语的来源
					if(data.wordSourceType != null && data.wordSourceType != undefined){
						$('input[name=wordSourceType]').each(function(){
							if(data.wordSourceType == $(this).val()){
								$(this).prop("checked", true);
							}else{
								$(this).prop("checked", false);
							}
						});
					}
					//领导人名单
					if(data.leaderName != null && data.leaderName != undefined){
						$('#graph_leader option').each(function(){
							if(data.leaderName == $(this).val()){
								$(this).parent().siblings('input[type=text]').val($(this).html());
								$(this).attr('selected', true);
							}else{
								$(this).attr('selected', false);
							}
						});
						//回显领导人关键字
						if(data.leaderKeyWord != null && data.leaderKeyWord !=""){
							$("#leaderKeyWord").val(data.leaderKeyWord);
						}
					}
					//填充权重依据
					if(data.weightFlag != null && data.weightFlag != undefined){
						$('input[name=gkgWeightFlag]').each(function(){
							if(data.weightFlag == $(this).val()){
								$(this).prop("checked", true);
							}else{
								$(this).prop("checked", false);
							}
						});
					}
					//回显图谱-情感值条件
					if(data.gkgToneConfigInfo != undefined){
						for(var i in data.gkgToneConfigInfo){
							var gkgToneConfigInfo = data.gkgToneConfigInfo[i];
							if(gkgToneConfigInfo.sxID==1){
								$("#avgtone").prop("checked", true);
								$("#avgtone1").val(gkgToneConfigInfo.qsSXZ);
								$("#avgtone2").val(gkgToneConfigInfo.jsSXZ);
								$(".avg").css("display","block");
							}else if(gkgToneConfigInfo.sxID==2){
								$("#Positive").prop("checked", true);
								$("#Positive1").val(gkgToneConfigInfo.qsSXZ);
								$("#Positive2").val(gkgToneConfigInfo.jsSXZ);
								$(".pos").css("display","block");
							}else if(gkgToneConfigInfo.sxID==3){
								$("#Negative").prop("checked", true);
								$("#Negative1").val(gkgToneConfigInfo.qsSXZ);
								$("#Negative2").val(gkgToneConfigInfo.jsSXZ);
								$(".neg").css("display","block");
							}else if(gkgToneConfigInfo.sxID==4){
								$("#Polarity").prop("checked", true);
								$("#Polarity1").val(gkgToneConfigInfo.qsSXZ);
								$("#Polarity2").val(gkgToneConfigInfo.jsSXZ);
								$(".pol").css("display","block");
							}else if(gkgToneConfigInfo.sxID==5){
								$("#Activitytone").prop("checked", true);
								$("#Activitytone1").val(gkgToneConfigInfo.qsSXZ);
								$("#Activitytone2").val(gkgToneConfigInfo.jsSXZ);
								$(".act").css("display","block");
							}else if(gkgToneConfigInfo.sxID==6){
								$("#Grouptone").prop("checked", true);
								$("#Grouptone1").val(gkgToneConfigInfo.qsSXZ);
								$("#Grouptone2").val(gkgToneConfigInfo.jsSXZ);
								$(".gro").css("display","block");
							}
						}
					}
					//回显高级查询语句
					if(data.customQuery!="" && data.customQuery!=undefined){
						$('.ulli').hide();
						$('.property_case').show();
						$('.high_search').css('background','#0087fd');
						$("#customQuery").val(data.customQuery);
					}else{
						$('.high_search').css('background','none');
						$('.ulli').show();
						$('.property_case').hide();
					}
					//回显事件ID列表
					$("#ids").val(data.ids);
				}else if(36 == data.configFlag){//新闻查询条件回显
					//新闻查询条件回显			
					//关联分析中的新闻回溯配置或者是新闻配置中新增的配置，根据sourceTpye获取对应的时间范围以及配置对应的值即可
					var min_s_pt;
					var max_s_pt;
					var min_o_gt;
					var max_o_gt;
					if(stringType != "two"){//关联分析-新闻回溯配置+新闻配置产生的一般配置
						var dataRange;
						//根据数据源将数据源切换的单选框框进行回显
						var sourceType = data.dataSourceType;
						if(sourceType == 1){
							dataRange = newsDateRange.dateType1;
							$(".dataSourceType_news1").prop('checked','true');
						}else if(sourceType == 2){
							dataRange = newsDateRange.dateType2;
							$(".dataSourceType_news2").prop('checked','true');
						}else if(sourceType == 3){
							dataRange = newsDateRange.dateType3;
							$(".ddataSourceType_news3").prop('checked','true');
						}
						//根据选中的数据源将对应的日期范围给发布时间、采集事件的开始时间、结束时间进行赋值
						 min_s_pt = dataRange.min_s_pt;
						 max_s_pt = dataRange.max_s_pt;
						
						 min_o_gt = dataRange.min_o_gt;
						 max_o_gt = dataRange.max_o_gt;
					}else{
						min_s_pt = data.newsInfo.newsStDate_f;
						max_s_pt = data.newsInfo.newsEdDate_f;
						
						min_o_gt = data.newsInfo.newsStDate_c;
						max_o_gt = data.newsInfo.newsEdDate_c;
					}
					//如果为事件或者是图谱回溯的新闻配置，将时间范围和开始结束时间保持一致即可
					$('#newsStDate_f').datepicker('setStartDate',min_s_pt);  
					$('#newsStDate_f').datepicker('setEndDate',max_s_pt);  
					$('#newsEdDate_f').datepicker('setStartDate',min_s_pt);  
					$('#newsEdDate_f').datepicker('setEndDate',max_s_pt);

					$('#newsStDate_c').datepicker('setStartDate',min_o_gt);  
					$('#newsStDate_c').datepicker('setEndDate',max_o_gt);  
					$('#newsEdDate_c').datepicker('setStartDate',min_o_gt);  
					$('#newsEdDate_c').datepicker('setEndDate',max_o_gt); 
					
					//将采集时间、发布时间的值赋给时间插件以及input框
					if(data.newsInfo.newsStDate_c != null){
						$('#newsStDate_c').val(data.newsInfo.newsStDate_c);
						$('#newsStDate_c').datepicker('setDate',data.newsInfo.newsStDate_c); 
					}
					if(data.newsInfo.newsEdDate_c != null){
						$('#newsEdDate_c').val(data.newsInfo.newsEdDate_c);
						$('#newsEdDate_c').datepicker('setDate',data.newsInfo.newsEdDate_c); 
					}
					if(data.newsInfo.newsStDate_f != null){
						$('#newsStDate_f').val(data.newsInfo.newsStDate_f);
						$('#newsStDate_f').datepicker('setDate',data.newsInfo.newsStDate_f); 
					}
					if(data.newsInfo.newsEdDate_f != null){
						$('#newsEdDate_f').val(data.newsInfo.newsEdDate_f);
						$('#newsEdDate_f').datepicker('setDate',data.newsInfo.newsEdDate_f); 
					}

					$('.aa').val(data.configId);
					$('#configName').val(data.configName);
					$('#atlas_type').val(categoryName);
					$('#yxj').val(data.priority);
					
					//权限选中状态
					$('#isPrivate option').each(function(){
						if(data.isPrivate == $(this).val()){
							$(this).parent().siblings('input[type=text]').val($(this).html());
							$(this).attr('selected', true);
						}else{
							$(this).attr('selected', false);
						}
					});
					//实时监测选中状态
					$('#nowTime option').each(function(){
						if(data.nowTime == $(this).val()){
							$(this).parent().siblings('input[type=text]').val($(this).html());
							$(this).attr('selected', true);
						}else{
							$(this).attr('selected', false);
						}
					});
					//新闻类型 选择状态
					$('#popup_ul_atlas input[type=checkbox]').each(function(){
						if(data.configCategory == $(this).val()){
							$(this).prop('checked', true);
						}else{
							$(this).prop('checked', false);
						}
					});
					$('#typeIds').val(data.configCategory);
					if(data.remark != null && data.remark != undefined){
						$('#newsRemark').val(data.remark);
					}
					if(data.newsInfo.newsStDate_c != null){
						$('#newsStDate_c').val(data.newsInfo.newsStDate_c);
						$('#newsStDate_c').datepicker('setDate',data.newsInfo.newsStDate_c); 
					}
					if(data.newsInfo.newsEdDate_c != null){
						$('#newsEdDate_c').val(data.newsInfo.newsEdDate_c);
						$('#newsEdDate_c').datepicker('setDate',data.newsInfo.newsEdDate_c); 
					}
					if(data.newsInfo.newsStDate_f != null){
						$('#newsStDate_f').val(data.newsInfo.newsStDate_f);
						$('#newsStDate_f').datepicker('setDate',data.newsInfo.newsStDate_f); 
					}
					if(data.newsInfo.newsEdDate_f != null){
						$('#newsEdDate_f').val(data.newsInfo.newsEdDate_f);
						$('#newsEdDate_f').datepicker('setDate',data.newsInfo.newsEdDate_f); 
					}
					$("#title").val(data.newsInfo.title);
					$("#writer").val(data.newsInfo.writer);
					$("#website").val(data.newsInfo.website);
					$("#contents").val(data.newsInfo.contents);
					$("#oUrl").val(data.newsInfo.oUrl);
					//gxb 回显模糊查询字段是否区分大小写
					if(data.newsInfo.writerIsBig==1){
						$("input[name=writerIsBig]").prop("checked",false);
					}else{
						$("input[name=writerIsBig]").prop("checked",true);
					}
					if(data.newsInfo.websiteIsBig==1){
						$("input[name=websiteIsBig]").prop("checked",false);
					}else{
						$("input[name=websiteIsBig]").prop("checked",true);
					}
					if(data.newsInfo.oUrlIsBig==1){
						$("input[name=oUrlIsBig]").prop("checked",false);
					}else{
						$("input[name=oUrlIsBig]").prop("checked",true);
					}
					if(data.newsInfo.titleIsBig==1){
						$("input[name=titleIsBig]").prop("checked",false);
					}else{
						$("input[name=titleIsBig]").prop("checked",true);
					}
					if(data.newsInfo.contentsIsBig==1){
						$("input[name=contentsIsBig]").prop("checked",false);
					}else{
						$("input[name=contentsIsBig]").prop("checked",true);
					}
				}
			}
			getSelectCom();
			if(stringType=='clone'){//配置复制功能
				$("#event_type").attr('onclick','dianji()');
				$("#atlas_type").attr('onclick','graphDianji()');
				//把回显过来的configid给覆盖掉，这样点击提交的时候，后台才会判断是添加操作
				$('.aa').val("");
				//把配置名称置空，因为不允许出现同一种类型下2个重名的配置
				$('#configName').val("");
				$('#remark').val("配置复制产生");
				$('#newsRemark').val("配置复制产生");
				$('#gkgRemark').val("配置复制产生");
				$("#yxj").val(1);
			}
		}
	});
}
function ckeckValue(){//图谱配置提交的时候对数据的校验
	var spana = $("#spana").css("display");
	var spanb = $("#spanb").css("display");
	var spanc = $("#spanc").css("display");
	var spand = $("#spand").css("display");
	var spane = $("#spane").css("display");
	var spanf = $("#spanf").css("display");
	if(spana=="none"&&spanb=="none"&&spanc=="none"&&spand=="none"&&spane=="none"&&spand=="none"&&$(".gkgKeyWordSpan").text() ==""&& $("#IDspan").text()==""){
		return true;
	}else{
		return false;
	}
}
/**
 * 图谱增加和修改（后台判断执行具体操作）
 */
function gkgSub(obj){///789456
	if($("#isRelation").val()==1){//关联配置，才会绕弯子取值
		if(getTwoData() == 0){
			win.alertEx('回溯配置类型不能为空');
			return false;
		}
	}
	//虚拟字段获取值
	var geographyname = $("#webCountry").attr("title");
	var code = $("#webCountry").attr("data-id");
	if(geographyname != "" && code != undefined && code != "" && code != undefined){
		var geographyCountry = geographyname + "&&" + code;
		$("#webCountry1").val(geographyCountry);
	}
	
	var categoriesStr = $('#typeIds').val();
	var configName = $('#configName').val();
	var Grouptone1 =$("#Grouptone1").val();
	var Grouptone2 =$("#Grouptone2").val();
	var Activitytone1 =$("#Activitytone1").val();
	var Activitytone2 =$("#Activitytone2").val();
	var Polarity1 =$("#Polarity1").val();
	var Polarity2 =$("#Polarity2").val();
	var Negative1 =$("#Negative1").val();
	var Negative2 =$("#Negative2").val();
	var Positive1 =$("#Positive1").val();
	var Positive2 =$("#Positive2").val();
	var avgtone1 =$("#avgtone1").val();
	var avgtone2 =$("#avgtone2").val();
	//校验配置名称的格式
	var reg = /^[^/\\|]*$/;
	if(!reg.test(configName)){
		win.alertEx("配置名称不能包含以下任何字符: /  \\  | ");
		endLoad();
		return;
	}
	if(configName.length > 30){
		win.alertEx("输入名称超过最大长度");
		endLoad();
		return;
	}
	if(checkEmpty(configName) || checkEmpty(categoriesStr)||configName.trim().length==0){
		endLoad();
		win.alertEx('配置名称及配置类型不能为空');
		/*$('body').dialog({
			type:'defalut',
			title:'提示',
			discription:'配置名称及配置类型不能为空!'
		});*/
	}else{
		var yxjspan = $("#yxjspan").css("display");
		if(ckeckValue()&&yxjspan=="none"){
			if(obj==1){//普通查询，清空高级查询内容
				$("#customQuery").text("");
			}
			var formData=$("#gkgConfigForm").serialize();
			if(obj==2){//高级查询
				var dd = $("#gkgConfigForm").serializeArray();
				formData = {};
				formData.configName = configName;
				formData.configCategoriesStr = categoriesStr;
				for(var i=0;i<dd.length;i++){
					if(dd[i].name=="configId"){//配置id
						formData.configId = dd[i].value;
					}
					if(dd[i].name=="gkgStDate"){//开始时间
						formData.gkgStDate = dd[i].value;
					}
					if(dd[i].name=="gkgEdDate"){//结束时间
						formData.gkgEdDate = dd[i].value;
					}
					if(dd[i].name=="bgFlag"){//背景颜色
						formData.bgFlag = dd[i].value;
					}
					if(dd[i].name=="customQuery"){//高级查询输入内容
						formData.customQuery = dd[i].value;
					}
					if(dd[i].name=="gkgRemark"){//备注
						formData.gkgRemark = dd[i].value;
					}
					if(dd[i].name=="priority"){//优先级
						formData.priority = dd[i].value;
					}
					if(dd[i].name=="isPrivate"){//权限
						formData.isPrivate = dd[i].value;
					}
					if(dd[i].name=="nowTime"){//实时监测
						formData.nowTime = dd[i].value;
					}
					if(dd[i].name=="dataSourceType"){//数据源
						formData.dataSourceType = dd[i].value;
					}
					if(dd[i].name=="configFlag"){//配置类型
						formData.configFlag = dd[i].value;
					}
					if(dd[i].name=="gkgWeightFlag"){//权重依据
						formData.gkgWeightFlag = dd[i].value;
					}
					if(dd[i].name=="valueWeight"){//统计依据 （比重，数据）
						formData.valueWeight = dd[i].value;
					}
					if(dd[i].name=="queryRelationEntry"){//关联分析的回溯入口
						formData.queryRelationEntry = dd[i].value;
					}
					if(dd[i].name=="pzTypes"){//关联分析的回溯配置类型
						formData.pzTypes = dd[i].value;
					}
					if(dd[i].name=="isRelation"){//关联分析
						formData.isRelation = dd[i].value;
					}
				}
			}
			
			$.ajax({
				url: '../config/validateDuplicate',
				type: 'post',
				data: formData,
				success: function(data){
					if(data.msg == 'noRepeat'){
						if(data.data==1){
							$.ajax({
								url: '../config/updateConfigInfo',
								type: 'post',
								data: formData,
								success: function(aa){
									 endLoad();
									 if(aa == 'success'){
										 /*alert("配置修改成功");
										 showConfigList();
										 $("#infodiv").css("display","none");*/
										 win.alert('系统提示', '配置修改成功',  function(){
											 location.reload();
											 //showConfigList();
											 $("#infodiv").css("display","none");
										 });
									  }else{
										  win.alertEx("配置修改失败");
									   }
								}
							}); 
						}else{
							$.ajax({
								url: '../config/saveConfigInfo',
								type: 'post',
								data: formData,
								success: function(aa){
									 endLoad();
									 if(aa == 'success'){
										/* alert("配置添加成功");
										 location.reload();*/
										 win.alert('系统提示', '配置添加成功',  function(){
											 location.reload();
										 });
										 }else{
											 win.alertEx("配置添加失败");
										 }
									 //alert("配置添加成功");
									 
								}
							}); 
						}
					}else if(data.msg == 'repeat'){
						endLoad();
						win.alertEx('配置名称重复!');
					}else{
						endLoad();
						win.alertEx('系统异常，请联系系统管理员!');
					}
				}
			});
		}else{
			endLoad();
			win.alertEx("配置信息错误");	
		}
	}
}
//用于关联分析中的获取公共值
function getTwoData(){
	$(".configName2").val($("#configName").val());
	$(".relationEntry2").val($("#relationEntry option:selected").val());
	$(".isPrivate2").val($("#isPrivate option:selected").val());
	$(".remark2").val($("#remark").val());
	var pzTypes = $(".pzTypes").val();
	if(checkEmpty(pzTypes)){
		return 0;
	}else{
		return 1;
	}
}

/**
 * 事件增加和修改（后台判断执行具体操作）
 */
function eventSub(obj){
	if($("#isRelation").val()==1){//关联配置，才会绕弯子取值
		if(getTwoData() == 0){
			win.alertEx('回溯配置类型不能为空!');
			return false;
		}
	}
	startLoad();
	getActorSelectData();
	var categoriesStr = $('#typeIds').val();
	var configName = $('#configName').val();
	if(obj==1){//普通查询，清空高级查询内容
		$("#customQuery").text("");
	}
	var ss=$("#configForm").serialize();
	var EventAttr9 =$("#eventAttr9").val();
	var EventAttr10 =$("#eventAttr10").val();
	var EventAttr11 =$("#eventAttr11").val();
	var EventAttr12 =$("#eventAttr12").val();
	
	//判断配置名称格式\
	var reg = /^[^/\\|]*$/;
	if(!reg.test(configName)){
		endLoad();
		win.alertEx("配置名称不能包含以下任何字符:  /  \\  | ");
		return false;
	}
	if(configName.length > 30){
		endLoad();
		win.alertEx("输入名称超过最大长度！！！");
		return false;
	}
	if(checkEmpty(configName) || checkEmpty(categoriesStr) || configName.trim().length==0){
		endLoad();
		win.alertEx('配置名称或配置类型不能为空!');
	}else{
		//判断是否包含事件-新闻展示模块 编码为33 并判断该条件对应eventid集过大
		var typeIds = categoriesStr.split(",");
		var isEventNewsflag = false; 
		var isContions39 = false;
		for(var i=0;i<typeIds.length;i++){
			if(typeIds[i]==33){
				isEventNewsflag = true;
			}
			if(typeIds[i]==39){//是否包含国家关系模块，该模块比较特殊，需要确认角色一编码和角色二编码是否为空
				isContions39 = true;
			}
		}
		var isInsert = false;
		if(isEventNewsflag){
			$.ajax({
				url: '../config/validateEventNewsCondtion',
				async: false,
				type: 'post',
				data: ss,
				dataType:'json',
				success: function(result){
					 if(!result.flag){
						 win.alertEx("新闻展示对应的结果集超过最大限制");
						endLoad();
					 }else{
						 isInsert = true;
					 }
				}
			});
		}else{
			isInsert = true;
		}
		if(obj==1){
			if(isContions39){
				var actor1countryname = $("#actor1Countrycode").attr("title");
				var actor2countryname = $("#actor2Countrycode").attr("title");
				if(actor1countryname==""||actor2countryname==""){
					endLoad();
					win.alertEx("所选模块包含国家关系，角色一和角色二的国家编码为必填项");
					return false;
				}
			}
		}
		if(obj==2){//高级查询，需要的条件有  基本信息  和时间属性
			if(isContions39){
				endLoad();
				win.alertEx("所选模块包含国家关系，该模块不适合高级查询");
				return false;
			}
			var dd = $("#configForm").serializeArray();
			ss = {};
			ss.configName = configName;
			ss.configCategoriesStr = categoriesStr;
			for(var i=0;i<dd.length;i++){
				if(dd[i].name=="configId"){//配置id
					ss.configId = dd[i].value;
				}
				if(dd[i].name=="stDates"){//开始时间
					ss.stDates = dd[i].value;
				}
				if(dd[i].name=="edDates"){//结束时间
					ss.edDates = dd[i].value;
				}
				if(dd[i].name=="bgFlag"){//背景颜色
					ss.bgFlag = dd[i].value;
				}
				if(dd[i].name=="customQuery"){//高级查询输入内容
					ss.customQuery = dd[i].value;
				}
				if(dd[i].name=="remark"){//备注
					ss.remark = dd[i].value;
				}
				if(dd[i].name=="priority"){//优先级
					ss.priority = dd[i].value;
				}
				if(dd[i].name=="isPrivate"){//权限
					ss.isPrivate = dd[i].value;
				}
				if(dd[i].name=="nowTime"){//实时监测
					ss.nowTime = dd[i].value;
				}
				if(dd[i].name=="dataSourceType"){//数据源
					ss.dataSourceType = dd[i].value;
				}
				if(dd[i].name=="configFlag"){//配置类型
					ss.configFlag = dd[i].value;
				}
				if(dd[i].name=="weightFlag"){//权重依据
					ss.weightFlag = dd[i].value;
				}
				if(dd[i].name=="valueWeight"){//统计依据 （比重，数据）
					ss.valueWeight = dd[i].value;
				}
				if(dd[i].name=="queryRelationEntry"){//关联分析的回溯入口
					ss.queryRelationEntry = dd[i].value;
				}
				if(dd[i].name=="pzTypes"){//关联分析的回溯配置类型
					ss.pzTypes = dd[i].value;
				}
				if(dd[i].name=="isRelation"){//关联分析
					ss.isRelation = dd[i].value;
				}
			}
		}
		if(isInsert){
			if($("#keywordSpanactor1").text()== "" && $("#keywordSpanactor2").text()== "" && $("#keywordSpanactor").text()== "" && $("#spang").css("display")=="none"&&$("#spanh").css("display")=="none"&&$("#yxjspan").css("display")=="none"){
				$.ajax({
					url: '../config/validateDuplicate',
					async: false,
					type: 'post',
					data: ss,
					success: function(data){
						if(data.msg == 'noRepeat'){
							if(data.data==1){
								$.ajax({
									url: '../config/updateConfigInfo',
									async: false,
									type: 'post',
									data: ss,
									success: function(aa){
										 endLoad();
										 if(aa == 'success'){
											 //showConfigList();
											 //alert("配置修改成功");
											 win.alert('系统提示', '配置修改成功',  function(){
												 location.reload();
												 //showConfigList();
												 $("#infodiv").css("display","none");
											 });
										}else{
											win.alertEx("配置修改失败");
										}
									}
								}); 
							}else{
								$.ajax({
									url: '../config/saveConfigInfo',
									async: false,
									type: 'post',
									data: ss,
									success: function(aa){
										 endLoad();
										 if(aa == 'success'){
											 //alert("配置添加成功");
											 //location.reload();
											 win.alert('系统提示', '配置添加成功',  function(){
												 location.reload();
											 });
										 }else{
											 win.alertEx("配置添加失败");
										 }
									},error:function(result){
										win.alertEx("配置添加失败");
									}
								}); 
								
							}
							
						}else if(data.msg == 'repeat'){
							endLoad();
							win.alertEx('配置名称重复!');
						}else{
							endLoad();
							win.alertEx('系统异常，请联系系统管理员!');
						}
					}
				});
			}else{
				 endLoad();
				 win.alertEx("配置信息错误");
			}
		}
		
	}
}

/**
 * 校验是否为空
 * @param param
 * @returns {Boolean}
 */
function checkEmpty(param){
	if(param == null || param == undefined || param == '')
		return true;
	return false;
}
//获取根路径
function getBasePath(){ 
	var obj=window.location; 
	var contextPath=obj.pathname.split("/")[1]; 
	var basePath=obj.protocol+"//"+obj.host+"/"+contextPath; 
	return basePath; 
}
//人工查询（即时查询）校验关键字
function validateKeyWordsRG(obj){
	$(obj).next().html("");
	var value = $(obj).val();
	var regKyeWord = /^.*$/;//正则判断&
	if(value !=""){
		if(value.length<256){//判断长度
			//ajax校验()
  			var gkgformData=$("#graphQueryForm").serializeArray();
  			var eventformData=$("#eventQueryForm").serializeArray();
  			var allData = {};
  			for(var i = 0;i<eventformData.length;i++){
  				if(eventformData[i].name=="eventKeyWordactor1"){
  					allData.eventKeyWordactor1 = eventformData[i].value;
  				}
  				if(eventformData[i].name=="eventKeyWordactor2"){
  					allData.eventKeyWordactor2 = eventformData[i].value;
  				}
  				if(eventformData[i].name=="eventKeyWordactor"){
  					allData.eventKeyWordactor = eventformData[i].value;
  				}
  			}
  			for(var i = 0;i<gkgformData.length;i++){
  				if(gkgformData[i].name=="countsKeyWord"){
  					allData.countsKeyWord = gkgformData[i].value;
  				}
  				if(gkgformData[i].name=="themesKeyWord"){
  					allData.themesKeyWord = gkgformData[i].value;
  				}
  				if(gkgformData[i].name=="locationsKeyWord"){
  					allData.locationsKeyWord = gkgformData[i].value;
  				}
  				if(gkgformData[i].name=="personsKeyWord"){
  					allData.personsKeyWord = gkgformData[i].value;
  				}
  				if(gkgformData[i].name=="organizationsKeyWord"){
  					allData.organizationsKeyWord = gkgformData[i].value;
  				}
  			}
  			//校验输入内容，括号是否正确
  			$.ajax({
		  		url:getBasePath()+'/config/validateAllCustomCondtion',
		  		type: 'POST',
		  		data: allData,
		  		dataType:"json",
		  		success: function(result){
		  			if(result.flag == false){
		  				$(obj).next().html("关键字格式不正确");
		  			}else{
		  				$(obj).next().html("");
		  			}
		  		}
		  	});
		}else{
			 $(obj).next().html("输入关键字超过最大长度！！！");
		}
		
	}
}
/**
 * 校验关键字
 */

function validateKeyWords(obj){
	$(obj).next().html("");
	var value = $(obj).val();
	var regKyeWord = /^.*$/;//正则判断&
	if(value !=""){
		if(value.length<256){//判断长度
			//ajax校验()
  			var gkgformData=$("#gkgConfigForm").serializeArray();
  			var eventformData=$("#configForm").serializeArray();
  			var allData = {};
  			for(var i = 0;i<eventformData.length;i++){
  				if(eventformData[i].name=="eventKeyWordactor1"){
  					allData.eventKeyWordactor1 = eventformData[i].value;
  				}
  				if(eventformData[i].name=="eventKeyWordactor2"){
  					allData.eventKeyWordactor2 = eventformData[i].value;
  				}
  				if(eventformData[i].name=="eventKeyWordactor"){
  					allData.eventKeyWordactor = eventformData[i].value;
  				}
  			}
  			for(var i = 0;i<gkgformData.length;i++){
  				if(gkgformData[i].name=="countsKeyWord"){
  					allData.countsKeyWord = gkgformData[i].value;
  				}
  				if(gkgformData[i].name=="themesKeyWord"){
  					allData.themesKeyWord = gkgformData[i].value;
  				}
  				if(gkgformData[i].name=="locationsKeyWord"){
  					allData.locationsKeyWord = gkgformData[i].value;
  				}
  				if(gkgformData[i].name=="personsKeyWord"){
  					allData.personsKeyWord = gkgformData[i].value;
  				}
  				if(gkgformData[i].name=="organizationsKeyWord"){
  					allData.organizationsKeyWord = gkgformData[i].value;
  				}
  			}
  			//校验输入内容，括号是否正确
  			$.ajax({
		  		url:getBasePath()+'/config/validateAllCustomCondtion',
		  		type: 'POST',
		  		data: allData,
		  		dataType:"json",
		  		success: function(result){
		  			if(result.flag == false){
		  				$(obj).next().html("关键字格式不正确");
		  			}else{
		  				$(obj).next().html("");
		  			}
		  		}
		  	});
		}else{
			 $(obj).next().html("输入关键字超过最大长度！！！");
		}
		
	}
}
function validateLeader(){
	  var  leaderName = $("#gkgName").val();
	  var  countryName = $("#isPrivate").val();
	  var aa=$("#aa").val();
      var dt = {leaderName:leaderName,leaderCountry:countryName,id:aa};
     
  	$.ajax({
  		url:'../leader/validateLeader',
  		type: 'POST',
  		data: dt,
  		dataType:"json",
  		success: function(data1){
  			if(data1.msg == '1'){
  			    if(data1.data == '2'){
  			    	//alert("用户名重复");
  			    	$("#span1").text("领导人为空 或者领导人重复");
  			    	//$("#span1").html("领导人为空 或者领导人重复");
  			    }else if(data1.data == '3'){
  			    	//alert("不重复 ");
  			    	$("#span1").text("");
  			    }else{
  			    	$("#span1").text("");
  			    }
  			}
  			
  		},
  		error:function(data){
		}
  	});
	
}

//国家值发生变化（actor1,actor2,event）
function changeCountry(value,provinceId,province_description_dowebok_Id,actorGeoId){
	//清空option
	$("#"+provinceId+" option:gt(0)").remove();
	$("#description"+province_description_dowebok_Id+" li:gt(0)").remove();
	//获取发生地地理种类
	var actorGeotype = $("#"+actorGeoId).val();
	if(actorGeotype == 0){
		return;
	}else{
		$.ajax({
			url: getBasePath()+'/config/findProvinceCodeByCountryCode',
			type: 'post',
			data:{code:value,actorGeotype:actorGeotype},
			dataType:"json",
			success:function(data){
				if(data == ''){
					$("#"+province_description_dowebok_Id+" li:gt(0)").remove();
				}else{
					//新增option
					for(var i in data){
						$("#"+provinceId).append("<option value='"+data[i].code+"'>"+data[i].chName+"</option>");
						$('.dowebok'+province_description_dowebok_Id+' select').comboSelect();
						$(".dowebok"+province_description_dowebok_Id+" ul").attr("id","description"+province_description_dowebok_Id);
						$('#description'+province_description_dowebok_Id).perfectScrollbar({
					        wheelSpeed: 10,
					        wheelPropagation: false
					     });
					}
				}
				
			}
		});
	}
}
//角色1地理种类发生变化
function changeActor1Geo(value){
	var actor1GeoCountry = $("#actor1CountryGeoCode").val();
	if(actor1GeoCountry != 0){
		if(value==0){//请选择
			//清空option
			$("#actor1Province option:gt(0)").remove();
			$("#description24 li:gt(0)").remove();
		}else{//国家
			actor1ChangeCountry();
		}
	}
}

//校验ID集合以上两种情况混用222,333,444,209~333,333-444..
function validateIDs(){
	$("#IDspan").text("");
	var str = document.getElementById("ids").value;
	if(!str==""){
		if(str.substr(str.length-1)!=","){
			str+=",";
        	$("#ids").val(str);
		}
		var reg = /^(([\+]?[1-9]\d*[-][\+]?[1-9]\d*[,])|([\+]?[1-9]\d*[,]))*$/;
		if(reg.test(str)){
			$("#IDspan").text("");
			var result=str.split(",");
		    for(var i=0;i<result.length-1;i++){
		    	 if(result[i].indexOf("-") != -1){
		    		 var result1=result[i].split("-");
		    		   for(var j=0;j<result1.length;j++){
		    			 var result2=result1[0];
		    			 var result3=result1[1];
		    			if(result2>result3){
		    				$("#IDspan").text("ID集合输入值有误");
		    		    	$("#IDspan").css({color:"red"});
		    			}else{
		    				$("#IDspan").text("");
		    			}
		    	     }   
		    	 }
		    }
		}else{
			$("#IDspan").text("ID集合格式输入错误");
			$("#IDspan").css({color:"red"});
		}
	}
}



//平均情感校验
 function validate1(){
 	var avgtone1 =$("#avgtone1").val();
 	var avgtone2 =$("#avgtone2").val();
 	if(avgtone1!=""&&avgtone2!=""){
 		if(!isNaN(avgtone1)&&!isNaN(avgtone2)){
 			if(parseFloat(avgtone1) > parseFloat(avgtone2)){
 				$("#avgtone2").val(avgtone1);
 			}else{
 				$("#spana").css({display:"none"});
 			}
 		}else{
 			$("#spana").css({display:"block"});
 		}
 	}else{
 		$("#spana").css({display:"block"});
 	}
 }
 function validate11(){
 	var avgtone1 =$("#avgtone1").val();
 	var avgtone2 =$("#avgtone2").val();
 	if(avgtone1!=""&&avgtone2!=""){
 		if(!isNaN(avgtone1)&&!isNaN(avgtone2)){
 			if(parseFloat(avgtone1) > parseFloat(avgtone2)){
 				$("#avgtone2").val(avgtone1);
 			}else{
 				$("#spana").css({display:"none"});
 			}
 		}else{
 			$("#spana").css({display:"block"});
 		}
 	}else{
 		$("#spana").css({display:"block"});
 	}
 }
 //正向情感词比例校验
 function validate2(){
 	var Positive1 =$("#Positive1").val();
 	var Positive2 =$("#Positive2").val();
 	if(Positive1!=""&&Positive2!=""){
 		if(!isNaN(Positive1)&&!isNaN(Positive2)){
 			if(parseFloat(Positive1) > parseFloat(Positive2)){
 				$("#Positive2").val(Positive1);
 			}else{
 				$("#spanb").css({display:"none"});
 			}
 		}else{
 			$("#spanb").css({display:"block"});
 		}
 	}else{
 		$("#spanb").css({display:"block"});
 	}
 }
 function validate22(){
 	var Positive1 =$("#Positive1").val();
 	var Positive2 =$("#Positive2").val();
 	if(Positive1!=""&&Positive2!=""){
 		if(!isNaN(Positive1)&&!isNaN(Positive2)){
 			if(parseFloat(Positive1) > parseFloat(Positive2)){
 				$("#Positive2").val(Positive1);
 			}else{
 				$("#spanb").css({display:"none"});
 			}
 		}else{
 			$("#spanb").css({display:"block"});
 		}
 	}else{
 		$("#spanb").css({display:"block"});
 	}
 }
 //负情感词比例校验
 function validate3(){
 	var Negative1 =$("#Negative1").val();
 	var Negative2 =$("#Negative2").val();
 	if(Negative1!=""&&Negative2!=""){
 		if(!isNaN(Negative1)&&!isNaN(Negative2)){
 			if(parseFloat(Negative1) > parseFloat(Negative2)){
 				$("#Negative2").val(Negative1);
 			}else{
 				$("#spanc").css({display:"none"});
 			}
 		}else{
 			$("#spanc").css({display:"block"});
 		}
 	}else{
 		$("#spanc").css({display:"block"});
 	}
 }
 function validate33(){
 	var Negative1 =$("#Negative1").val();
 	var Negative2 =$("#Negative2").val();
 	if(Negative1!=""&&Negative2!=""){
 		if(!isNaN(Negative1)&&!isNaN(Negative2)){
 			if(parseFloat(Negative1) > parseFloat(Negative2)){
 				$("#Negative2").val(Negative1);s
 			}else{
 				$("#spanc").css({display:"none"});
 			}
 		}else{
 			$("#spanc").css({display:"block"});
 		}
 	}else{
 		$("#spanc").css({display:"block"});
 	}
 }
 //极性词比例校验
 function validate44(){
 	var Polarity1 =$("#Polarity1").val();
 	var Polarity2 =$("#Polarity2").val();
 	if(Polarity1!=""&&Polarity2!=""){
 		if(!isNaN(Polarity1)&&!isNaN(Polarity2)){
 			if(parseFloat(Polarity1) > parseFloat(Polarity2)){
 				$("#Polarity2").val(Polarity1);
 			}else{
 				$("#spand").css({display:"none"});
 			}
 			
 		}else{
 			$("#spand").css({display:"block"});
 		}
 	}else{
 		$("#spand").css({display:"block"});
 	}
 }
 function validate4(){
 	var Polarity1 =$("#Polarity1").val();
 	var Polarity2 =$("#Polarity2").val();
 	if(Polarity1!=""&&Polarity2!=""){
 		if(!isNaN(Polarity1)&&!isNaN(Polarity2)){
 			if(parseFloat(Polarity1) > parseFloat(Polarity2)){
 				$("#Polarity2").val(Polarity1);
 			}else{
 				$("#spand").css({display:"none"});
 			}
 		}else{
 			$("#spand").css({display:"block"});
 		}
 	}else{
 		$("#spand").css({display:"block"});
 	}
 }
 //活动词比例校验
 function validate5(){
 	var Activitytone1 =$("#Activitytone1").val();
 	var Activitytone2 =$("#Activitytone2").val();
 	if(Activitytone1!=""&&Activitytone2!=""){
 		if(!isNaN(Activitytone1)&&!isNaN(Activitytone2)){
 			if(parseFloat(Activitytone1) > parseFloat(Activitytone2)){
 				$("#Activitytone2").val(Activitytone1);
 			}else{
 				$("#spane").css({display:"none"});
 			}
 		}else{
 			$("#spane").css({display:"block"});
 		}
 	}else{
 		$("#spane").css({display:"block"});
 	}
 }
 function validate55(){
 	var Activitytone1 =$("#Activitytone1").val();
 	var Activitytone2 =$("#Activitytone2").val();
 	if(Activitytone1!=""&&Activitytone2!=""){
 		if(!isNaN(Activitytone1)&&!isNaN(Activitytone2)){
 			if(parseFloat(Activitytone1) > parseFloat(Activitytone2)){
 				$("#Activitytone2").val(Activitytone1);
 			}else{
 				$("#spane").css({display:"none"});
 			}
 		}else{
 			$("#spane").css({display:"block"});
 		}
 	}else{
 		$("#spane").css({display:"block"});
 	}
 }
 //代称比例校验
 function validate6(){
 	var Grouptone1 =$("#Grouptone1").val();
 	var Grouptone2 =$("#Grouptone2").val();
 	if(Grouptone1!=""&&Grouptone2!=""){
 		if(!isNaN(Grouptone1)&&!isNaN(Grouptone2)){
 			if(parseFloat(Grouptone1) > parseFloat(Grouptone2)){
 				$("#Grouptone2").val(Grouptone1);
 			}else{
 				$("#spanf").css({display:"none"});
 			}
 		}else{
 			$("#spanf").css({display:"block"});
 		}
 	}else{
 		$("#spanf").css({display:"block"});
 	}
 }
 function validate66(){
 	var Grouptone1 =$("#Grouptone1").val();
 	var Grouptone2 =$("#Grouptone2").val();
 	if(Grouptone1!=""&&Grouptone2!=""){
 		if(!isNaN(Grouptone1)&&!isNaN(Grouptone2)){
 			if(parseFloat(Grouptone1) > parseFloat(Grouptone2)){
 				$("#Grouptone2").val(Grouptone1);
 			}else{
 				$("#spanf").css({display:"none"});
 			}
 		}else{
 			$("#spanf").css({display:"block"});
 		}
 	}else{
 		$("#spanf").css({display:"block"});
 	}
 }
 //优先级校验
 function jiaoyan(){
		var value = $("#yxj").val();
		if(value!=""){
			if(isNaN(value)){
				$("#yxjspan").css({display:"block"});
			}else{
				$("#yxjspan").css({display:"none"});
			}
		}else{
			$("#yxjspan").css({display:"block"});
		}
	}
 
//事件模块的影响度和情感值校验
 function validateEventAttr9(){
		var EventAttr9 =$("#eventAttr9").val();
		var EventAttr10 =$("#eventAttr10").val();
		if(EventAttr9!=""&&EventAttr10!=""){
			if(!isNaN(EventAttr9)&&!isNaN(EventAttr10)){
				if(parseFloat(EventAttr9) > parseFloat(EventAttr10)){
					$("#eventAttr10").val(EventAttr9);
				}else{
					$("#spang").css({display:"none"});
				}
			}else{
				$("#spang").css({display:"block"});
			}
		}else{
			$("#spang").css({display:"block"});
		}
	}
	function validateEventAttr10(){
		var EventAttr9 =$("#eventAttr9").val();
		var EventAttr10 =$("#eventAttr10").val();
		if(EventAttr9!=""&&EventAttr10!=""){
			if(!isNaN(EventAttr9)&&!isNaN(EventAttr10)){
				if(parseFloat(EventAttr9) > parseFloat(EventAttr10)){
					$("#eventAttr10").val(EventAttr9);
				}else{
					$("#spang").css({display:"none"});
				}
			}else{
				$("#spang").css({display:"block"});
			}
		}else{
			$("#spang").css({display:"block"});
		}
	}
	//影响度校验
	function validateEventAttr11(){
		var EventAttr11 =$("#eventAttr11").val();
		var EventAttr12 =$("#eventAttr12").val();
		if(EventAttr11!=""&&EventAttr12!=""){
			if(!isNaN(EventAttr11)&&!isNaN(EventAttr12)){
				if(parseFloat(EventAttr11) > parseFloat(EventAttr12)){
					$("#eventAttr12").val(EventAttr11);
				}else{
					$("#spanh").css({display:"none"});
				}
			}else{
				$("#spanh").css({display:"block"});
			}
		}else{
			$("#spanh").css({display:"block"});
		}
	}
	function validateEventAttr12(){
		var EventAttr11 =$("#eventAttr11").val();
		var EventAttr12 =$("#eventAttr12").val();
		if(EventAttr11!=""&&EventAttr12!=""){
			if(!isNaN(EventAttr11)&&!isNaN(EventAttr12)){
				if(parseFloat(EventAttr11) > parseFloat(EventAttr12)){
					$("#eventAttr12").val(EventAttr11);
				}else{
					$("#spanh").css({display:"none"});
				}
			}else{
				$("#spanh").css({display:"block"});
			}
		}else{
			$("#spanh").css({display:"block"});
		}
	}
 
 
//处理配置
function handleConfigs(){
	if($('#tab_ul').children().length==0){
		//默认调用人工查询
		$(".manual").click();
	}else{
		//默认调用第一个配置
		$('#tab_ul').children().eq(0).click();
	}
	$(".manual").click(function(){
		$(".ul_xl").click();
	});
}
//控制Tone字段的显示问题
function gkgToneIsShow(){
	$('#avgtone').click(function(){
		if($('#avgtone').prop("checked")==true){
			  $(".avg").css("display","block");
		}else{
			$(".avg").css("display","none");
		}
	 });
	 $('#Positive').click(function(){
		 if($('#Positive').prop("checked")==true){
			  $(".pos").css("display","block");
		}else{
			$(".pos").css("display","none");
		}
	 });
	 $('#Negative').click(function(){
		 if($('#Negative').prop("checked")==true){
			  $(".neg").css("display","block");
		}else{
			$(".neg").css("display","none");
		}
	 });
	 $('#Polarity').click(function(){
		 if($('#Polarity').prop("checked")==true){
			  $(".pol").css("display","block");
		}else{
			$(".pol").css("display","none");
		}
	 });
	 $('#Activitytone').click(function(){
		 if($('#Activitytone').prop("checked")==true){
			  $(".act").css("display","block");
		}else{
			$(".act").css("display","none");
		}
	 });
	 $('#Grouptone').click(function(){
		 if($('#Grouptone').prop("checked")==true){
			  $(".gro").css("display","block");
		}else{
			$(".gro").css("display","none");
		}
	 });
}
//美化index_buttom滚动条
/*function index_bottom_perfectScrollbar(){
	$(".index_bottom").perfectScrollbar({wheelSpeed:10,wheelPropagation:false});
}*/

//美化滚动条
function glorifyComboSelect(){
	//美化滚动条
	$('select:not(.selectCounts)').comboSelect();//所有select标签中非class为selectCounts的标签
	//下拉框 每一个下拉框对应一个ID，然后调用perfectScrollbar美化滚动条
	$(".dowebok0 ul").attr("id","description0");
	$(".dowebok1 ul").attr("id","description1");
	$(".dowebok2 ul").attr("id","description2");
	$(".dowebok3 ul").attr("id","description3");
	$(".dowebok4 ul").attr("id","description4");
	$(".dowebok5 ul").attr("id","description5");
	$(".dowebok6 ul").attr("id","description6");
	$(".dowebok7 ul").attr("id","description7");
	$(".dowebok8 ul").attr("id","description8");
	$(".dowebok9 ul").attr("id","description9");
	$(".dowebok10 ul").attr("id","description10");
	$(".dowebok11 ul").attr("id","description11");
	$(".dowebok12 ul").attr("id","description12");
	$(".dowebok13 ul").attr("id","description13");
	$(".dowebok14 ul").attr("id","description14");
	$(".dowebok15 ul").attr("id","description15");
	$(".dowebok16 ul").attr("id","description16");
	$(".dowebok17 ul").attr("id","description17");
	$(".dowebok18 ul").attr("id","description18");
	$(".dowebok19 ul").attr("id","description19");
	$(".dowebok20 ul").attr("id","description20");
	$(".dowebok21 ul").attr("id","description21");
	$(".dowebok22 ul").attr("id","description22");
	$(".dowebok23 ul").attr("id","description23");
	$(".dowebok24 ul").attr("id","description24");
	$(".dowebok25 ul").attr("id","description25");
	$(".dowebok26 ul").attr("id","description26");

	$('#description0').perfectScrollbar({
	  wheelSpeed: 10,
	  wheelPropagation: false
	});
	$('#description1').perfectScrollbar({
	  wheelSpeed: 10,
	  wheelPropagation: false
	});
	$('#description2').perfectScrollbar({
	  wheelSpeed: 10,
	  wheelPropagation: false
	});
	$('#description3').perfectScrollbar({
	  wheelSpeed: 10,
	  wheelPropagation: false
	});
	$('#description4').perfectScrollbar({
	  wheelSpeed: 10,
	  wheelPropagation: false
	});
	$('#description5').perfectScrollbar({
	  wheelSpeed: 10,
	  wheelPropagation: false
	});
	$('#description6').perfectScrollbar({
	  wheelSpeed: 10,
	  wheelPropagation: false
	});
	$('#description7').perfectScrollbar({
	  wheelSpeed: 10,
	  wheelPropagation: false
	});
	$('#description8').perfectScrollbar({
	    wheelSpeed: 10,
	    wheelPropagation: false
	 });
	$('#description9').perfectScrollbar({
	    wheelSpeed: 10,
	    wheelPropagation: false
	 });
	$('#description10').perfectScrollbar({
	    wheelSpeed: 10,
	    wheelPropagation: false
	 });
	$('#description11').perfectScrollbar({
	    wheelSpeed: 10,
	    wheelPropagation: false
	 });
	$('#description12').perfectScrollbar({
	    wheelSpeed: 10,
	    wheelPropagation: false
	 });
	$('#description13').perfectScrollbar({
	    wheelSpeed: 10,
	    wheelPropagation: false
	 });
	$('#description14').perfectScrollbar({
	    wheelSpeed: 10,
	    wheelPropagation: false
	 });
	$('#description15').perfectScrollbar({
	    wheelSpeed: 10,
	    wheelPropagation: false
	 });
	$('#description16').perfectScrollbar({
	    wheelSpeed: 10,
	    wheelPropagation: false
	 });
	$('#description17').perfectScrollbar({
	    wheelSpeed: 10,
	    wheelPropagation: false
	 });
	$('#description18').perfectScrollbar({
	    wheelSpeed: 10,
	    wheelPropagation: false
	 });
	$('#description19').perfectScrollbar({
	    wheelSpeed: 10,
	    wheelPropagation: false
	 });
	$('#description20').perfectScrollbar({
	    wheelSpeed: 10,
	    wheelPropagation: false
	 });
	$('#description21').perfectScrollbar({
	    wheelSpeed: 10,
	    wheelPropagation: false
	 });
	$('#description22').perfectScrollbar({
	    wheelSpeed: 10,
	    wheelPropagation: false
	 });
	$('#description23').perfectScrollbar({
	    wheelSpeed: 10,
	    wheelPropagation: false
	 });
	$('#description24').perfectScrollbar({
	    wheelSpeed: 10,
	    wheelPropagation: false
	 });
	$('#description25').perfectScrollbar({
	    wheelSpeed: 10,
	    wheelPropagation: false
	 });
	$('#description26').perfectScrollbar({
	    wheelSpeed: 10,
	    wheelPropagation: false
	 });
}
//多选框加载数据
function getSelectCom(){
	//(角色1国家编码)
	$('#actor1Countrycode').hsCheckData({
		isShowCheckBox: true,
		data: countryCode
	});
	/*$('#a1').hsCheckData({
		isShowCheckBox: true,
	});*/
	//下拉框多选(角色一地理国家)
	$('#actor1geographyCountry').hsCheckData({
		isShowCheckBox: true,
		data: geoCountryCode
	});
	//(角色1组织编码)
	$('#actor1organizationcode').hsCheckData({
		isShowCheckBox: true,
		data: organizationcode
	});
	//(角色1宗教1)
	$('#actor1Religion1Code1').hsCheckData({
		isShowCheckBox: true,
		data: religionCode
	});
	//(角色1宗教2)
	$('#actor1Religion1Code2').hsCheckData({
		isShowCheckBox: true,
		data: religionCode
	});
	//(角色1种族)
	$('#actor1EthnicCode').hsCheckData({
		isShowCheckBox: true,
		data: ethnicCode
	});
	//(角色1种类1)
	$('#actor1TypeCode1').hsCheckData({
		isShowCheckBox: true,
		data: typeCode
	});
	//(角色1种类2)
	$('#actor1TypeCode2').hsCheckData({
		isShowCheckBox: true,
		data: typeCode
	});
	//(角色1种类3)
	$('#actor1TypeCode3').hsCheckData({
		isShowCheckBox: true,
		data: typeCode
	});
	
	//下拉框多选(角色2地理国家)
	$('#actor2geographyCountry').hsCheckData({
		isShowCheckBox: true,
		data: geoCountryCode
	});
	//(角色2国家编码)
	$('#actor2Countrycode').hsCheckData({
		isShowCheckBox: true,
		data: countryCode
	});
	//(角色2组织编码)
	$('#actor2organizationcode').hsCheckData({
		isShowCheckBox: true,
		data: organizationcode
	});
	//(角色2宗教1)
	$('#actor2Religion1Code1').hsCheckData({
		isShowCheckBox: true,
		data: religionCode
	});
	//(角色2宗教2)
	$('#actor2Religion1Code2').hsCheckData({
		isShowCheckBox: true,
		data: religionCode
	});
	//(角色2种族)
	$('#actor2EthnicCode').hsCheckData({
		isShowCheckBox: true,
		data: ethnicCode
	});
	//(角色2种类1)
	$('#actor2TypeCode1').hsCheckData({
		isShowCheckBox: true,
		data: typeCode
	});
	//(角色2种类2)
	$('#actor2TypeCode2').hsCheckData({
		isShowCheckBox: true,
		data: typeCode
	});
	//(角色2种类3)
	$('#actor2TypeCode3').hsCheckData({
		isShowCheckBox: true,
		data: typeCode
	});
	//大类
	$('#quadClass').hsCheckData({
		isShowCheckBox: true,
		data: quadClass
	});
	//根类
	$('#rootEvent').hsCheckData({
		isShowCheckBox: true,
		data: rootEvent
	});
	//基类
	$('#baseEvent').hsCheckData({
		isShowCheckBox: true,
		data: baseEvent
	});
	//全事件
	$('#eventCode').hsCheckData({
		isShowCheckBox: true,
		data: eventCode
	});
	//下拉框多选(事件属性发生地地理国家)
	$('#actorgeographyCountry').hsCheckData({
		isShowCheckBox: true,
		data: geoCountryCode
	});
}
//角色1下拉框获取值
function getActorSelectData(){
	//获取角色一国家编码div的值
	//var actor1countryname = $("#actor1Countrycode").html();
	var actor1countryname = $("#actor1Countrycode").attr("title");
	var actor1countrycode = $("#actor1Countrycode").attr("data-id");
	//console.log(actor1countryname);
	//console.log(actor1countrycode);
	if(actor1countryname != "" && actor1countryname != undefined && actor1countrycode && actor1countrycode != undefined){
		var actor1code = actor1countryname + "&&" + actor1countrycode;
		$("#countrycodeactor1").val(actor1code);
	}
	//获取角色一组织div的值
	var organizationname = $("#actor1organizationcode").attr("title");
	var organizationcode = $("#actor1organizationcode").attr("data-id");
	if(organizationname != "" && organizationname != undefined && organizationcode != "" && organizationcode != undefined ){
		var organizationactor1 = organizationname + "&&" + organizationcode;
		$("#organizationcodeactor1").val(organizationactor1);
	}
	//获取角色一宗教1div的值
	var actor1religionname1 = $("#actor1Religion1Code1").attr("title");
	var actor1religioncode1 = $("#actor1Religion1Code1").attr("data-id");
	if(actor1religionname1 != "" && actor1religionname1 != undefined && actor1religioncode1 != "" && actor1religioncode1 != undefined){
		var religionactor1 = actor1religionname1 + "&&" + actor1religioncode1;
		$("#religion1CodeActor1").val(religionactor1);
	}
	//获取角色一宗教2div的值
	var actor1religionname2 = $("#actor1Religion1Code2").attr("title");
	var actor1religioncode2 = $("#actor1Religion1Code2").attr("data-id");
	if(actor1religionname2 != "" && actor1religionname2 != undefined  && actor1religioncode2 != "" && actor1religioncode2 != undefined){
		var religionactor2 = actor1religionname2 + "&&" + actor1religioncode2;
		$("#religion2CodeActor1").val(religionactor2);
	}
	//获取角色一种族div的值
	var actor1Ethnicname = $("#actor1EthnicCode").attr("title");
	var actor1Ethniccode = $("#actor1EthnicCode").attr("data-id");
	if(actor1Ethnicname != "" && actor1Ethnicname != undefined && actor1Ethniccode != "" && actor1Ethniccode != undefined){
		var ethnicactor1 = actor1Ethnicname + "&&" + actor1Ethniccode;
		$("#ethnicCodeactor1").val(ethnicactor1);
	}
	//获取角色一种类1div的值
	var actor1typename1 = $("#actor1TypeCode1").attr("title");
	var actor1typecode1 = $("#actor1TypeCode1").attr("data-id");
	if(actor1typename1 != "" && actor1typename1 != undefined && actor1typecode1 != "" && actor1typecode1 != undefined){
		var typeactor1 = actor1typename1 + "&&" + actor1typecode1;
		$("#typeCode1actor1").val(typeactor1);
	}
	//获取角色一种类2div的值
	var actor1typename2 = $("#actor1TypeCode2").attr("title");
	var actor1typecode2 = $("#actor1TypeCode2").attr("data-id");
	if(actor1typename2 != "" && actor1typename2 != undefined && actor1typecode2 != "" && actor1typecode2 != undefined){
		var typeactor2 = actor1typename2 + "&&" + actor1typecode2;
		$("#typeCode2actor1").val(typeactor2);
	}
	//获取角色一种类3div的值
	var actor1typename3 = $("#actor1TypeCode3").attr("title");
	var actor1typecode3 = $("#actor1TypeCode3").attr("data-id");
	if(actor1typename3 != "" && actor1typecode3 != undefined && actor1typecode3 != "" && actor1typecode3 != undefined){
		var typeactor3 = actor1typename3 + "&&" + actor1typecode3;
		$("#typeCode3actor1").val(typeactor3);
	}
	//获取角色一地理国家div的值
	var geographyname = $("#actor1geographyCountry").attr("title");
	var code = $("#actor1geographyCountry").attr("data-id");
	if(geographyname != "" && code != undefined && code != "" && code != undefined){
		var geographyCountry = geographyname + "&&" + code;
		$("#geographyCountryactor1").val(geographyCountry);
	}
	
	//获取角色2国家编码div的值
	var actor2countryname = $("#actor2Countrycode").attr("title");
	var actor2countrycode = $("#actor2Countrycode").attr("data-id");
	if(actor2countryname != "" && actor2countryname != undefined  && actor2countrycode !="" && actor2countrycode != undefined ){
		var actor2code = actor2countryname + "&&" + actor2countrycode;
		$("#countrycodeactor2").val(actor2code);
	}
	//获取角色2组织div的值
	var organizationname = $("#actor2organizationcode").attr("title");
	var organizationcode = $("#actor2organizationcode").attr("data-id");
	if(organizationname != "" && organizationname != undefined && organizationcode != "" && organizationcode != undefined){
		var organizationactor2 = organizationname + "&&" + organizationcode;
		$("#organizationcodeactor2").val(organizationactor2);
	}
	//获取角色2宗教1div的值
	var actor2religionname1 = $("#actor2Religion1Code1").attr("title");
	var actor2religioncode1 = $("#actor2Religion1Code1").attr("data-id");
	if(actor2religionname1 != "" && actor2religionname1 != undefined && actor2religioncode1 != "" && actor2religioncode1 != undefined){
		var religionactor2 = actor2religionname1 + "&&" + actor2religioncode1;
		$("#religion1CodeActor2").val(religionactor2);
	}
	//获取角色2宗教2div的值
	var actor2religionname2 = $("#actor2Religion1Code2").attr("title");
	var actor2religioncode2 = $("#actor2Religion1Code2").attr("data-id");
	if(actor2religionname2 != "" && actor2religionname2 != undefined && actor2religioncode2 != "" && actor2religioncode2 != undefined){
		var religionactor2 = actor2religionname2 + "&&" + actor2religioncode2;
		$("#religion2CodeActor2").val(religionactor2);
	}
	//获取角色2种族div的值
	var actor2Ethnicname = $("#actor2EthnicCode").attr("title");
	var actor2Ethniccode = $("#actor2EthnicCode").attr("data-id");
	if(actor2Ethnicname != "" && actor2Ethnicname != undefined && actor2Ethniccode != "" && actor2Ethniccode != undefined){
		var ethnicactor2 = actor2Ethnicname + "&&" + actor2Ethniccode;
		$("#ethnicCodeactor2").val(ethnicactor2);
	}
	//获取角色2种类1div的值
	var actor2typename1 = $("#actor2TypeCode1").attr("title");
	var actor2typecode1 = $("#actor2TypeCode1").attr("data-id");
	if(actor2typename1 != "" && actor2typename1 != undefined && actor2typecode1 != "" && actor2typecode1 != undefined){
		var typeactor1 = actor2typename1 + "&&" + actor2typecode1;
		$("#typeCode1actor2").val(typeactor1);
	}
	//获取角色2种类2div的值
	var actor2typename2 = $("#actor2TypeCode2").attr("title");
	var actor2typecode2 = $("#actor2TypeCode2").attr("data-id");
	if(actor2typename2 != "" && actor2typename2 != undefined && actor2typecode2 != "" && actor2typecode2 != undefined){
		var typeactor2 = actor2typename2 + "&&" + actor2typecode2;
		$("#typeCode2actor2").val(typeactor2);
	}
	//获取角色2种类3div的值
	var actor2typename3 = $("#actor2TypeCode3").attr("title");
	var actor2typecode3 = $("#actor2TypeCode3").attr("data-id");
	if(actor2typename3 != "" && actor2typename3 != undefined && actor2typecode3 != "" && actor2typecode3 != undefined){
		var typeactor3 = actor2typename3 + "&&" + actor2typecode3;
		$("#typeCode3actor2").val(typeactor3);
	}
	//获取角色2地理国家div的值
	var geographyname = $("#actor2geographyCountry").attr("title");
	var code = $("#actor2geographyCountry").attr("data-id");
	if(geographyname != "" && code != undefined && code != "" && code != undefined){
		var geographyCountry = geographyname + "&&" + code;
		$("#geographyCountryactor2").val(geographyCountry);
	}
	//事件属性(大类)
	var quadClassname = $("#quadClass").attr("title");
	var quadClasscode = $("#quadClass").attr("data-id");
	if(quadClassname != "" && quadClassname != undefined && quadClasscode != "" && quadClasscode != undefined){
		var quadClass = quadClassname + "&&" + quadClasscode;
		$("#quadClassData").val(quadClass);
	}
	//事件属性(根类)
	var rootEventname = $("#rootEvent").attr("title");
	var rootEventcode = $("#rootEvent").attr("data-id");
	if(rootEventname != "" && rootEventname != undefined && rootEventcode != "" && rootEventcode != undefined){
		var rootClass = rootEventname + "&&" + rootEventcode;
		$("#rootEventData").val(rootClass);
	}
	//事件属性(基类)
	var baseEventname = $("#baseEvent").attr("title");
	var baseEventcode = $("#baseEvent").attr("data-id");
	if(baseEventname != "" && baseEventname != undefined && baseEventcode != "" && baseEventcode != undefined){
		var baseEvent = baseEventname + "&&" + baseEventcode;
		$("#baseEventData").val(baseEvent);
	}
	//事件属性(全事件)
	var eventCodename = $("#eventCode").attr("title");
	var eventCodecode = $("#eventCode").attr("data-id");
	if(eventCodename != "" && eventCodename != undefined && eventCodecode != "" && eventCodecode != undefined){
		var eventCode = eventCodename + "&&" + eventCodecode;
		$("#codeEventData").val(eventCode);
	}
	//事件属性(发生地)
	var geographyname = $("#actorgeographyCountry").attr("title");
	var code = $("#actorgeographyCountry").attr("data-id");
	if(geographyname != "" && geographyname != undefined && code != "" && code != undefined){
		var geographyCountry = geographyname + "&&" + code;
		$("#geographyCountryactor").val(geographyCountry);
	}
}
//配置页面下载数据
function dowoladFile(fileId){
	window.location.href="../config/downloadFile?fileId="+fileId;
}
//根据领导人名称获取对应关键字
function findLeaderKeyWordByName(obj){
	var value = $(obj).val();
	if(value !=0){
		$.ajax({
	  		url:getBasePath()+'/config/findLeaderKeyWordByName',
	  		type: 'POST',
	  		data: {"leaderName":value},
	  		success: function(data){
	  			$("#leaderKeyWord").val(data);
	  		}
	  	});
	}else{
		$("#leaderKeyWord").val('');
	}
}
//显示图表介绍内容
function showChartInfo(chartId,obj,moduleId,rid){
	var dom1 = $(obj)[0];
	if(dom1.innerHTML.length==0){
		var helpHtml='<div class="ques none"">'
			+'<span class="wb_arrow"></span>'	
			+'<textarea class="textarea none" onchange="valdateChartInfo(this)"></textarea>'
			+'<div  class="textareaBox"></div>';
		if(rid==1){
		helpHtml+='<div class="edit_box clearfix">'
						+'<span title="编辑" class="edit" onclick="helpEdite(this)"></span>'
						+'<span class="updateInfoButton none" onclick="updateChartInfo('+chartId+',this,'+moduleId+')">提交</span>'
						+'<span class="returnInfoButton none" >取消</span>'
						+'<span class="tips tubiaoErrorSpan" ></span>'
						+'</div>'
		}
		helpHtml+='</div>';       				
		dom1.innerHTML+=helpHtml; 
	}
	//判断是否已经显示
	if($(obj).children(".ques").hasClass("none")){
		$.ajax({
			url:getBasePath()+'/config/findChartInfoByMidAndCid',
			type: 'POST',
			dataType:"json",
			data:{'moduleId':moduleId,'chartId':chartId},
			success:function(data){
				$(obj).children(".ques").removeClass("none");
				var resultData ;
				if(data.result!= null && data.result!=undefined){
					resultData=data.result;
				}else{
					resultData=" ";
				}
				$(obj).children(".ques").children(".textareaBox").text(resultData);
			}
		});
	}
}

//修改图表展示内容
function updateChartInfo(chartId,obj,moduleId){
	var chartInfo = $(obj).parent().siblings(".textarea").val();
	 if(valdateChartInfo($(obj).parent().siblings(".textarea"))){
		$.ajax({
			url:getBasePath()+'/config/updateChartInfoByMidAndCid',
			type: 'POST',
			data:{'chartInfo':chartInfo,'moduleId':moduleId,'chartId':chartId},
			success:function(data){
				if(data==1){
					$(obj).addClass("none");
					$(obj).next().addClass("none");
					$(obj).parent().siblings(".textareaBox").text(chartInfo);
					$(obj).parent().siblings(".textareaBox").removeClass("none");
			    	$(obj).parent().siblings(".textarea").addClass("none");
				}else{
					$(obj).next().next().text("修改失败");
				}
			}
		});
	}
}
//校验图表展示内容
function valdateChartInfo(obj){
	var chartInfo = $(obj).val();
	 if(chartInfo.length<=255){
		 $(obj).next().next().children(".tips").text(""); 
		return true;
	}else{
		 $(obj).next().next().children(".tips").text("输入内容过长"); 
		return false;
	}
}
//大地图显示div隐藏
function isShowView(){
	var displayValue = $("#info-table").css("display");
	if(displayValue=="none"){
		$("#isShowView-image").attr("src",getBasePath()+"/static/images/mapInfoDown.png");
		$("#info-table").css("display","block");
	}else if(displayValue=="block"){
		$("#info-table").css("display","none");
		$("#isShowView-image").attr("src",getBasePath()+"/static/images/mapInfoUp.png");
	}
}
//取消大地图被选中的节点线
function qxMapSelectNode(){
	var checkBoxs = $(".leaflet-control-layers label input");
	for(var i in checkBoxs){
		if(checkBoxs[i].checked){
			$(checkBoxs[i]).click();
		}
	}
}
//新闻的添加配置以及修改配置
function newsSub(){
	if($("#isRelation").val()==1){//关联配置，才会绕弯子取值
		if(getTwoData() == 0){
			win.alertEx('回溯配置类型不能为空!');
			return false;
		}
	}
	var categoriesStr = $('#typeIds').val();
	var configName = $('#configName').val();
	if(checkEmpty(configName) || checkEmpty(categoriesStr)||configName.trim().length==0){
		endLoad();
		win.alertEx('配置名称及配置类型不能为空');
	}else{
		//校验配置名称的格式
		var reg = /^[^/\\|]*$/;
		if(!reg.test(configName)){
			win.alertEx("配置名称不能包含以下任何字符: /  \\  | ");
			endLoad();
			return;
		}
		if(configName.length > 30){
			win.alertEx("输入名称超过最大长度");
			endLoad();
			return;
		}
		//校验发布时间的开始时间、结束时间不能为空
		var newsStDate_f = $("#newsStDate_f").val();
		var newsEdDate_f = $("#newsEdDate_f").val();
		
		if(newsStDate_f =="" || newsEdDate_f==""){
			win.alertEx("发布起止时间不能为空");
			return;
		}
		//判断各个输入项的提示语为空禁止提交
		var keyWordSpanFlg = true;
		$(".newsKeyWordSpan").each(function(){
		    if($(this).text()!=''){
		    	keyWordSpanFlg = false;
			}
		});
		if(!keyWordSpanFlg){
			return;
		}
		
		var yxjspan = $("#yxjspan").css("display");
		if(yxjspan=="none"){
			var formData=$("#newsConfigForm").serialize(); 
			$.ajax({
				url: '../config/validateDuplicate',
				type: 'post',
				data: formData,
				success: function(data){
					if(data.msg == 'noRepeat'){
						if(data.data==1){
							$.ajax({
								url: '../config/updateConfigInfo',
								type: 'post',
								data: formData,
								success: function(aa){
									 endLoad();
									 if(aa == 'success'){
										 win.alert('系统提示', '配置修改成功',  function(){
											 showConfigList();
											 $("#infodiv").css("display","none");
										 });
									  }else{
										  win.alertEx("配置修改失败");
									   }
								}
							}); 
						}else{
							$.ajax({
								url: '../config/saveConfigInfo',
								type: 'post',
								data: formData,
								success: function(aa){
									 endLoad();
									 if(aa == 'success'){
										 win.alert('系统提示', '配置添加成功',  function(){
											 location.reload();
										 });
									 }else{
										 win.alertEx("配置添加失败");
									 }
								}
							}); 
						}
					}else if(data.msg == 'repeat'){
						endLoad();
						win.alertEx('配置名称重复!');
					}else{
						endLoad();
						win.alertEx('系统异常，请联系系统管理员!');
					}
				}
			});
		}else{
			endLoad();
			win.alertEx("配置信息错误");	
		}
	}
	
}

//鼠标移入时显示信息
$(".hoverImg").hover(function () {
    $(this).next().show();
}, function () {
	$(this).next().hide();
})

/**
 * 二次回溯
 */
function twoRelationConfig(id){
	$.ajax({
		url: '../relationAnalysis/getRelationConfigDate',
		type: 'post',
		data: {configId:id},
		dataType:'json',
		success: function(data){
			
			 if(data.msg == 'success'){
				 if(data.counts <= 0){//判断是否能进行二次回溯
					 win.alertEx("源数据不存在，不能进行二次回溯");
					 return;
				 }else{
					 //展开添加配置选项
					 addConfig('two');
					 //二次回溯配置赋值
					 $(".relationId").val(data.PZID);
					 $("#isAgain").val(1);
					 if(data.stDate != undefined){
						 //提示结束时间赋值
						 $("#stDateSpan").html(data.stDate);
						 $("#edDateSpan").html(data.edDate);
						 $('.day1').val(data.stDate);
						 $('.day2').val(data.edDate);
						 $('.day1').datepicker('setStartDate',data.stDate);
						 $('.day2').datepicker('setEndDate',data.edDate);
						 //选中数据源
						 if(data.dataSourceType == 1){
							 $(".dataSourceType1").prop('checked','true');
						 }else if(data.dataSourceType == 2){
							 $(".dataSourceType2").prop('checked','true');
						 }else if(data.dataSourceType == 3){
							 $(".dataSourceType3").prop('checked','true');
						 }
					 }
					 if(data.newsInfo != undefined){
						 var newsInfo = data.newsInfo;
						//发布时间的起止时间设置时间范围
						$('#newsStDate_f').datepicker('setStartDate',newsInfo.newsStDate_f);  
						$('#newsStDate_f').datepicker('setEndDate',newsInfo.newsEdDate_f);  
						$('#newsEdDate_f').datepicker('setStartDate',newsInfo.newsStDate_f);  
						$('#newsEdDate_f').datepicker('setEndDate',newsInfo.newsEdDate_f); 
						//发布起止时间设置默认值
						$('#newsStDate_f').val(newsInfo.newsStDate_f);
					    $('#newsEdDate_f').val(newsInfo.newsEdDate_f);
						$('#newsStDate_f').datepicker('setDate',newsInfo.newsStDate_f); 
						$('#newsEdDate_f').datepicker('setDate',newsInfo.newsEdDate_f); 
						//采集时间的起止时间设置时间范围
						$('#newsStDate_c').datepicker('setStartDate',newsInfo.newsStDate_c);  
						$('#newsStDate_c').datepicker('setEndDate',newsInfo.newsEdDate_c);  
						$('#newsEdDate_c').datepicker('setStartDate',newsInfo.newsStDate_c);  
						$('#newsEdDate_c').datepicker('setEndDate',newsInfo.newsEdDate_c); 
						//采集时间的起止时间设置默认值
						$("#newsStDate_c").val(newsInfo.newsStDate_c);
					    $("#newsEdDate_c").val(newsInfo.newsEdDate_c);
					    $('#newsStDate_c').datepicker('setDate',newsInfo.newsStDate_c); 
					    $('#newsEdDate_c').datepicker('setDate',newsInfo.newsEdDate_c);
					    //选中数据源
					    if(data.dataSourceType == 1){
							 $(".dataSourceType_news1").prop('checked','true');
						 }else if(data.dataSourceType == 2){
							 $(".dataSourceType_news2").prop('checked','true');
						 }else if(data.dataSourceType == 3){
							 $(".dataSourceType_news3").prop('checked','true');
						 }
					 }
					 $("#dataSourceType").hide();
					 $("#dateRange").show();
					 $('#remark').val("二次回溯产生子配置");
					 $('#newsRemark').val("二次回溯产生子配置");
					 $('#gkgRemark').val("二次回溯产生子配置");
				 }
			 }else{
				 win.alertEx("二次回溯配置操作失败");
			 }
		}
	});
}
//给定日期判断为某年那一周
function getWeekNum(d){
	var year = d.substring(0,4);
	var monther = d.substring(4,6);
	var day = d.substring(6,8);
	var date1 = new Date(year, parseInt(monther) - 1, day),
    date2 = new Date(year, 0, 1),
    d = Math.round((date1.valueOf() - date2.valueOf()) / 86400000);
	//var num = Math.ceil((d + ((date2.getDay() + 1) - 1)) / 7);
	var xq = date2.getDay();//每年的1月1日是星期几
	var weekNum = (xq+d-1)/7 <= 0 ? 1 : Math.ceil((xq+d-1)/7);
	//alert(year+"-"+num);
	return year+"-"+weekNum;
}
//配置复制功能，需要调用回显方法，然后把回显过来的configid给覆盖掉，这样点击提交的时候，后台才会判断是添加操作
function cloneConfig(id, categoryName, flid){
	//调用回显方法，这里需要注意的是，3  是专门写死的，并且是唯一不能改变的
	editConfig(id,categoryName,flid,3,null,null,'clone');
}
//字符串去掉左右字符
function trim(str){  
    return str.replace(/^(\s|\xA0)+|(\s|\xA0)+$/g, '');  
}

/**
 * 校验新闻关键字的格式是否正确
 */
function  validateNewsKeyWords(obj){
	
	var keyWords = trim($(obj).val());
	//判断非空
	if(keyWords.length >0){
		//判断文字长度
		if(trim(keyWords).length<1000){
			//判断格式是否符合
  			$.ajax({
		  		url:getBasePath()+'/config/validateNewsKeyWords',
		  		type: 'POST',
		  		data: {"keyWords":trim(keyWords)},
		  		dataType:"json",
		  		success: function(result){
		  			if(result.flag == false){
		  				if(result.mesg.length !=0){
		  					$(obj).next().html(result.mesg);
		  				}else{
		  					$(obj).next().html("关键字格式不正确");
		  				}
		  			}else{
		  				$(obj).next().html("");
		  			}
		  		}
		  	});
			
			
		}else{
			$(obj).next().html("输入关键字超过最大长度！！！");
		}
	}else{
		$(obj).next().html("");
	}
}

/*
将年月日数据转换为年、月、周数据(用于图谱时间线、事件时间线)
date_data：年月日（20180102）格式数据
len:截取的长度 月:6 、年:4、周:2
*/
function packDate(date_data,len){
	var date_new={};
for(var i=0;i<date_data.length;i++){
 	//截取日期到月
 	var key=date_data[i].key;
 	var dateValue=key.substring(0,len);
 	if(len==2){
 		dateValue = getWeekNum(key+"");
 	}
 	if(date_new[dateValue]!=undefined){
 		var nnn = date_new[dateValue];
 		date_new[dateValue] = nnn + date_data[i].value*1;
 	}else{
    	date_new[dateValue] = date_data[i].value*1;
 	}
 }
 var result = [];
 for(var obj in date_new){
		var d1={
			key:obj,
			value:date_new[obj].toFixed(2)
     	}	
		result.push(d1);
 }
 return result;
}
//切换数据源，对应切换数据库最大和最小日期
$(".dataSourceType").click(function(){ 
	var dataSource = $(this).val();
	if(dataSource == 1){//数据源一
		configMaxDate = configDate.maxDate1;
		configMinDate = configDate.minDate1;
	}else if(dataSource == 2){//数据源二
		configMaxDate = configDate.maxDate2;
		configMinDate = configDate.minDate2;
	}else{
		configMaxDate = configDate.maxDate3;
		configMinDate = configDate.minDate3;
	}
	selectYearMonthDay();
})
//配置强制停止
function stopTask(configId){
	win.confirm('系统提示', '配置正在排队或执行中，确定要强制停止吗？', function (r) {
        if(r){
        	$.ajax({
    			url:getBasePath()+'/config/stopTask',
    			type:"POST",
    			data:{"configId":configId},
    			dataType:"JSON",
    			success:function(data){
    				if(data.msg=="success"){
    					win.alertEx("配置强制停止成功");
    				}else{
    					win.alertEx("配置强制停止失败");
    				}
    				showConfigList();
    			}
    		})
        }else{
     	   win.alertEx("已取消");
        }
  });
}