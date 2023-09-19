(function ($) {
    $.fn.hsCheckData = function (options) {
        //定义一个默认的对象
    	var defaults = {
            isShowCheckBox: false,
            minCheck: 0,
            maxCheck: 0,
            data: null,
			defText:null
        };
    	//合并defaults和options对象值
        var opts = $.extend(defaults, options);
        //方法向被选元素添加一个类。
        $(this).addClass("hsCheckData");
		if(opts.defText !=null){
			$(this).text(opts.defText);
			var defArray=opts.defText.split('-');
			var dataid="";
			
			for(var i=0;i<defArray.length;i++){
				dataid+=setDefCode(defArray[i])+"-";
			}
			dataid=dataid.substr(0,dataid.length-1);
			$(this).attr('data-id',dataid);
		}
		//根据name查找对应id
		function setDefCode(deftext){
			var defId="";
			for (var i = 0; i < opts.data.length; i++) {
                for (var key in opts.data[i]) {
                    if (opts.data[i][key].toString().indexOf("object") == -1) {
                       if(opts.data[i][key]==deftext){
						  return Object.keys(opts.data[i]);//以数组形式返回key[,,,]
					   }
                    } else {
						var jsonTmp=opts.data[i][key];
						for(var k=0;k<jsonTmp.length;k++){
							for (var key in jsonTmp[k]) {
								if(jsonTmp[k][key]==deftext){
						  return Object.keys(jsonTmp[k]);
					   }
							}
						}
                    }

                }
            }
		}
        var id = $(this).attr("id");
        $(this).click(function () {
            if ($('#' + id + "_hcd").length > 0) {
                $('#' + id + "_hcd").remove();
                $('#' + id).removeClass('hsCjeckData_check');
                return false;
            }
            $(this).addClass("hsCjeckData_check");
            var mainHtml = "<div id='" + id + "_hcd' class='hcd_main_border'>";
            //1、筛选input
            var filterHtml = filterHtmlFun();
            //2、数据列表
            var dataListHtml = dataListHtmlFun();
            //3、确定按钮
            var btnHtml = buttonHtml();
            mainHtml += filterHtml + dataListHtml + btnHtml + "</div>";
            //4、输出选择框
            //$("body").append(mainHtml);
            $(this).append(mainHtml);
            //5、设置悬浮位置和大小、默认值
            var width = $(this).outerWidth();
            var height = $(this).outerHeight();
            var y = $(this).offset().top;
            var x = $(this).offset().left;
            var scrollTop = $(".tab_div").scrollTop();
            $('#' + id + '_input').css("width", (width - 14));
            $('#' + id + '_hcd').css("width", (width - 2));
        	$('#' + id + '_hcd')
        	.css("left", 0)
    		.css("top", height);

            //判断是否存在已经选择的
            setCheckData();//1
            //6、绑定事件
            $('.exsitChild').click(function () {
            	setCheckData();//2
                if ($(this).parent().nextAll("ul").is(":hidden")) {
                    $(this).addClass("exsitChild_check");
                } else {
                    $(this).removeClass("exsitChild_check");
                }
                $(this).parent().nextAll("ul").toggle();
                return false;
            });
            $("[name='dataliCheck']").click(function (e) {
                e.stopPropagation();//该方法将停止事件的传播，阻止它被分派到其他 Document 节点。在事件传播的任何阶段都可以调用它
            });
            $("[name='childcheckbox']").click(function (e) {
                e.stopPropagation();
            });
            $('#' + id + '_input').click(function(e) {
            	e.stopPropagation();
            });
            $("[name='datali']>div").click(function () {
                if (!opts.isShowCheckBox) {
                    $('.hcd_dataList :checkbox').prop("checked", false);
                    $(this).children('input[type="checkbox"]').prop("checked", true);
                    var data_id = "";
                    var tit = "";
                    var data_value = "";
                    data_id = $(this).children('input[type="checkbox"]').val();
                    data_value = $(this).children('input[type="checkbox"]').nextAll("span").text();
                    $('#' + id).attr('data-id', data_id).text(data_value);
                    $('#' + id).attr('tit', '');
                    $('#' + id + "_hcd").remove();
                    $('#' + id).removeClass('hsCjeckData_check');
                } else {
                    if ($(this).children('input[type="checkbox"]').is(":checked")) {
                        $(this).children('input[type="checkbox"]').prop("checked", false);
                    } else {
                        $(this).children('input[type="checkbox"]').prop("checked", true);
                    }
                }
                return false;
            });
            if (!opts.isShowCheckBox) {
                $('#' + id + '_btn').hide();
            } else {
                $("#" + id + "_btn").click(function () {
                	var data_id = "";
                    var data_value = "";
                    var idold = "";
            		var valueold = "";
            		var idin = "";
            		var valuein = "";
            		var tit = "";
            		if ($('#' + id + '_input').val() == "") {	//如果搜索框为空
            			$('#' + id + '_hcd').find('input[type="checkbox"]').each(function (index, element) {	//循环checkbox
                            if ($(this).prop("checked")) {		//如果选中进行拼接
                                data_id += $(this).val() + "-";
                                data_value += $(this).nextAll("span").text() + ",";
                            }
                        });
            			$('#' + id).attr("tit", data_value);
            			data_id = data_id.substr(0, data_id.length - 1);			//切除最后一个“-”
                        data_value = data_value.substr(0, data_value.length - 1);   //切除最后一个“,”
            		}else{										//如果搜索框不为空
            			$('#' + id + '_hcd').find('input[type="checkbox"]').each(function (index, element) {	//循环checkbox
                            if ($(this).prop("checked")) {	//如果选中进行拼接
                            	/*if($('#' + id).attr("data-id") != "" && $('#' + id).attr("data-id") != undefined){	//如果div里面有值
                            		if($('#' + id).attr("data-id").indexOf($(this).val()) == -1){//如果值里面没有所选中的CheckBox
                            			data_id += $(this).val() + "-";
                                        data_value += $(this).nextAll("span").text() + ",";
                            		}
                            		var str = $('#' + id).attr("data-id");
                            		var arrStr = str.split(',');
                            		for(var i in arrStr){
                            			if(arrStr[i] != $(this).val()){//如果值里面没有所选中的CheckBox
                                			data_id += $(this).val() + "-";
                                            data_value += $(this).nextAll("span").text() + ",";
                                		}
                            		}
                            	}else{
                            		data_id += $(this).val() + "-";
                                    data_value += $(this).nextAll("span").text() + ",";
                            	}*/
                            	data_id += $(this).val() + "-";
                                data_value += $(this).nextAll("span").text() + ",";
                            }else{
                            	if($('#' + id).attr("tit") != "" && $('#' + id).attr("tit") != undefined){
                            		if($('#' + id).attr("tit").indexOf($(this).nextAll("span").text()) > -1){
                            			if($('#' + id).attr("tit").indexOf($(this).nextAll("span").text() + ",") > -1){
                            				var aid = $('#' + id).attr("tit");
                            				$('#' + id).attr("tit",aid.replace($(this).nextAll("span").text() + ",","").replace(/\s+/g,""));
                            			}else{
                            				var aid = $('#' + id).attr("tit");
                            				$('#' + id).attr("tit",aid.replace($(this).nextAll("span").text(),"").replace(/\s+/g,""));
                            			}
                            			if($('#' + id).attr("data-id").indexOf($(this).val() + "-") > -1){
                            				$('#' + id).attr("data-id", $('#' + id).attr("data-id").replace($(this).val() + "-","").replace(/\s+/g,""));
                            			}else{
                            				$('#' + id).attr("data-id", $('#' + id).attr("data-id").replace($(this).val(),"").replace(/\s+/g,""));
                            			}
                            		}
                            	}
                            }
            			});
            			if($('#' + id).attr("tit") != "" && $('#' + id).attr("tit") != undefined){
                        	var a = $('#' + id).attr("tit");
                        	$('#' + id).attr("tit", data_value + a);
                        }else{
                        	$('#' + id).attr("tit", data_value);
                        }
            			 if(($('#' + id).attr("data-id") != undefined && $('#' + id).attr("data-id") != "")){
                         	idold = $('#' + id).attr("data-id");
                         	valueold = $('#' + id).attr("tit");
                         }
            			 data_id = data_id.substr(0, data_id.length - 1);
                         data_value = data_value.substr(0, data_value.length - 1);
            		}
                    if(idold != "" && valueold != ""){
                    	if(data_value != ""){
                    		var valuename = data_value.split(",");
                        	for(var i=0; i < valuename.length; i++){
                        		if(valueold.indexOf(valuename[i]) == -1){
                        			valueold += valuename[i] + "," + valueold;
                        		}
                        	}
                    	}
                    	valuein = valueold;
                    	idin = data_id + "-" +idold;
                    }else{
                    	idin = data_id;
                    	valuein = data_value;
                    }
                    if(idin.substring(0,1) == "-"){
                    	idin = idin.substring(1,idin.length);
                    }
                    if(valuein.substring(0,1) == ","){
                    	valuein = valuein.substring(1,valuein.length);
                    }
                    if(idin.substring(idin.length-1,idin.length) == "-"){
                    	idin = idin.substring(0,idin.length-1);
                    }
                    if(valuein.substring(valuein.length-1,valuein.length) == ","){
                    	valuein = valuein.substring(0,valuein.length - 1);
                    }
                   if(valuein != ""){
	                	var aa = valuein.split(",");
	                    var bb = aa.unique3();
	                    var cc = "";
	                    for(var i=0; i < bb.length; i++){
	                    	cc += bb[i] + ","
	                	}
	                	if(cc.length > 12){
	                    	word = cc.substring(0,11) + "...";
	                	}else{
	                		word = cc;
	                	}
	                	$('#' + id).attr('data-id', idin).text(word).attr('title',valuein);
	                	
	                }else{
	                	$('#' + id).attr('data-id', idin).text(valuein).attr('title',valuein);
	                }
                    $('#' + id + "_hcd").remove();
                    $('#' + id).removeClass('hsCjeckData_check');
                    return false;
                    //alert("确定");
                    //document.click();
                	//$("#" + id + "_close").click();
                });
            }
            //筛选
            $('#' + id + '_input').keyup(function () {//当按下按键时,执行
                if ($(this).val() != "") {
                    var filterHtml = "<ul>";
                    var getFilterHtml = getFilterHtmlFun($(this).val());
                    filterHtml += getFilterHtml + "</ul>";
                    $('#' + id + "_hcd").children(".hcd_dataList").html(filterHtml);
                    $("[name='childcheckbox']").click(function (e) {
                        e.stopPropagation();//不再派发事件
                    });
                    $("[name='datali']>div").click(function () {
                        if (!opts.isShowCheckBox) {
                            $('.hcd_dataList :checkbox').prop("checked", false);
                            $(this).children('input[type="checkbox"]').prop("checked", true);
                            var data_id = "";
                            var data_value = "";
                            data_id = $(this).children('input[type="checkbox"]').val();
                            data_value = $(this).children('input[type="checkbox"]').nextAll("span").text();
                            $('#' + id).attr('data-id', data_id).text(data_value);
                            $('#' + id + "_hcd").remove();
                            $('#' + id).removeClass('hsCjeckData_check');
                        } else {
                            if ($(this).children('input[type="checkbox"]').is(":checked")) {
                                $(this).children('input[type="checkbox"]').prop("checked", false);//设置属性值
                            } else {
                                $(this).children('input[type="checkbox"]').prop("checked", true);
                            }
                        }
                        return false;
                    });
                    setCheckData();
                } else {
                    $('#' + id + "_hcd").children(".hcd_dataList").html(dataListHtmlFun());
                    setCheckData();
                }
            });
            return false;
        });
        setShowData();
        //点击空白选择框消失
        $(document).click(function (e) {//事件对象
            var clickEle = $(e.target).attr('id');//target 事件属性可返回事件的目标节点
            var clickName = $(e.target).attr('name');
            if (clickEle == id + "_input" || clickEle == id + "_hcd" || clickName == 'datali') {
                return false;
            }
            $('#' + id + "_hcd").remove();
            $('#' + id).removeClass('hsCjeckData_check');
        });
        //筛选input
        function filterHtmlFun() {
            var html = "<div class='hcd_filter'>";
            html += "<input type='text' id='" + id + "_input' class='hcd_filter_input'/>";
            html += "</div>";
            return html;
        }
        //生成数据列表
        function dataListHtmlFun() {
            var html = "<div class='hcd_dataList'>"
            //1、解析json数据
            var data = getDataHtml();
            html += data + "</div>"
            return html;
        }
        //绑定默认值
        function setCheckData() {
            if ($('#' + id).attr("data-id") != undefined && $('#' + id).attr("data-id") != "") {
            	var data_id = $('#' + id).attr("data-id");
            	if(data_id == undefined){
                	return
                }else{
	                var dataidArray = data_id.split('-');
                }
                for (var i = 0; i < dataidArray.length; i++) {
                    $('#' + id + "_hcd")
                        .find('.hcd_dataList input[value="' + dataidArray[i] + '"]')
                        .prop("checked", true);
                }
            }
        }
        //设置显示默认值
        function setShowData() {
            if ($('#' + id).attr("data-id") != undefined && $('#' + id).attr("data-id") != "") {
                var data_id = $('#' + id).attr("data-id");
                var dataidArray = data_id.split('-');
                var text = "";
                for (var i = 0; i < dataidArray.length; i++) {
                    text += getName(opts.data, dataidArray[i]) + ",";
                }
                if(text.length>12){
                	text = text.substring(0,11) + "...";
                }
                $('#' + id).text(text);
            }else{
            	$('#' + id).text('');
            }
            
        }
        //获取名称
        function getName(json, jsonId) {
            for (var i = 0; i < json.length; i++) {
                for (var key in json[i]) {
                	if(key != ""){
                		if (key == jsonId) {
                			
                			return json[i][key];
                		} else if (jsonId.indexOf(key) > -1) {
                			return getName(json[i]["childCity"], jsonId);
                		}
                	}
                }
            }
        }
        //解析Json并生成html
        function getDataHtml() {
            var html = "<ul>"
            var childIsNUll = true;
            for (var i = 0; i < opts.data.length; i++) {
                if ("childCity" in opts.data[i]) {
                    childIsNUll = false;
                }
                for (var key in opts.data[i]) {
                    if (opts.data[i][key].toString().indexOf("object") == -1) {
                        if (childIsNUll == false) {
                            html += "<li class='ec' name='datali'><div><a class='exsitChild'></a>";
                            if (opts.isShowCheckBox) {
                                html += "<input type='checkbox' name='dataliCheck' value='" + key + "'/>";
                            } else {
                                html += "<input type='checkbox' style='display:none' name='dataliCheck' value='" + key + "'/>";
                            }
                            html += "<span>" + opts.data[i][key] + "</span></div > ";
                            childIsNUll = true
                        } else {
                            html += "<li  name='datali'><div>";
                            if (opts.isShowCheckBox) {
                                html += "<input type='checkbox' name='dataliCheck' value='" + key + "'/>";
                            } else {
                                html += "<input type='checkbox' style='display:none' name='dataliCheck' value='" + key + "'/>";
                            }
                            html += "<span>" + opts.data[i][key] + "</span>";
                            html += "</div></li>"
                        }
                    } else {
                        html += childDataHtml(opts.data[i][key]);
                        html += "</li>"
                    }
                }
            }
            html += "</ul>";
            return html;
        }
        //解析子项
        function childDataHtml(json) {
            var html = "<ul style='display:none;padding-left:20px;'>";
            for (var i = 0; i < json.length; i++) {
                for (var key in json[i]) {
                    html += "<li name='datali'><div>";
                    if (opts.isShowCheckBox) {
                        html += "<input name='childcheckbox' type='checkbox' value='" + key + "'/>";
                    } else {
                        html += "<input name='childcheckbox' style='display:none' type='checkbox' value='" + key + "'/>";
                    }
                    html += "<span>" + json[i][key] + "</span></div ></li > ";
                }
            }
            return html + "</ul>";
        }
        
        function buttonHtml() {
            var html = "<div class='hcd_btn_div'>";
            html += "<button type='button' id='" + id + "_btn' class='hcd_btn'>确定</button>";
            html += "<button type='button' id='" + id + "_close' class='hcd_btn'>关闭</button>";
            html += "</div>";
            return html;
        }
        //过滤父项目
        function getFilterHtmlFun(filterInput) {
            var html = "";
            for (var i = 0; i < opts.data.length; i++) {
                for (var key in opts.data[i]) {
                    if (opts.data[i][key].indexOf(filterInput) > -1) {
                        html += "<li name='datali'><div>";
                        if (opts.isShowCheckBox) {
                            html += "<input name='childcheckbox' type='checkbox' value='" + key + "'/>";
                        } else {
                            html += "<input name='childcheckbox' style='display:none' type='checkbox' value='" + key + "'/>";
                        }
                        html += "<span>" + opts.data[i][key] + "</span></div ></li > ";
                    } else {
                        html += getChildFilterHtmlFun(opts.data[i][key], filterInput);
                    }
                }
            }
            return html;
        }
        function getChildFilterHtmlFun(json, filterInput) {
            var html = "";
            for (var i = 0; i < json.length; i++) {
                for (var key in json[i]) {
                    if (json[i][key].indexOf(filterInput) > -1) {
                        html += "<li name='datali'><div>";
                        if (opts.isShowCheckBox) {
                            html += "<input name= 'childcheckbox' name= 'dataliCheck' type= 'checkbox' value= '" + key + "' />";
                        } else {
                            html += "<input name= 'childcheckbox' name= 'dataliCheck' style='display:none' type= 'checkbox' value= '" + key + "' />";
                        }
                        html += "<span>" + json[i][key] + "</span></div ></li > ";
                    }
                }
            }
            return html;
        }
    };
    Array.prototype.unique3 = function(){
   	 var res = [];
   	 var json = {};
   	 for(var i = 0; i < this.length; i++){
   	  if(!json[this[i]]){
   	   res.push(this[i]);
   	   json[this[i]] = 1;
   	  }
   	 }
   	 return res;
   	}
})(jQuery);