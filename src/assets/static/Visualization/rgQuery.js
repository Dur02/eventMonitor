//获取根路径
function getBasePath() {
    var obj = window.location;
    var contextPath = obj.pathname.split("/")[1];
    var basePath = obj.protocol + "//" + obj.host + "/" + contextPath;
    return basePath;
}

function eventRGQuery(obj) {
    getActorSelectData();
    var configName = document.getElementById("configName").value;
    var moduleCode = $("#moduleCode").val();
    var isSaveConfig;

    function evet() {
        $("#RGFL").val(moduleCode);
        $("#modelType").val(moduleCode);
        if (obj == 1) {//普通查询，清空高级查询内容
            $("#customQuery").val("");
            $(".oldRadio").each(function () {
                if ($(this).is(":checked")) {
                    isSaveConfig = $(this).val();
                }
            });
            if (moduleCode == 39) {//国家关系模块条件特殊
                var actor1countryname = $("#actor1Countrycode").attr("title");
                var actor2countryname = $("#actor2Countrycode").attr("title");
                if (actor1countryname == "" || actor2countryname == "" || actor1countryname == undefined || actor2countryname == undefined) {
                    endLoad();
                    win.alertEx("国家关系模块，角色一和角色二的国家编码为必填项");
                    return false;
                }
            }
        }
        var formData = $("#eventQueryForm").serialize();
        if (obj == 2) {//高级查询，需要的条件有  基本信息  和时间属性
            if (moduleCode == 39) {//国家关系模块条件特殊
                endLoad();
                win.alertEx("国家关系模块不适合高级查询");
                return false;
            }
            $(".newRadio").each(function () {
                if ($(this).is(":checked")) {
                    isSaveConfig = $(this).val();
                }
            });
            configName = $("#configName2").val();
            var dd = $("#eventQueryForm").serializeArray();
            formData = {};
            formData.configName = configName;
            formData.configCategoriesStr = moduleCode;
            formData.flid = moduleCode;
            formData.isSaveConfig = isSaveConfig;
            for (var i = 0; i < dd.length; i++) {
                if (dd[i].name == "stDates") {//开始时间
                    formData.stDates = dd[i].value;
                }
                if (dd[i].name == "edDates") {//结束时间
                    formData.edDates = dd[i].value;
                }
                if (dd[i].name == "constantly") {//是否实时
                    formData.constantly = dd[i].value;
                }
                if (dd[i].name == "customQuery") {//高级查询输入内容
                    formData.customQuery = dd[i].value;
                }
                if (dd[i].name == "remark") {//备注
                    formData.remark = dd[i].value;
                }
                if (dd[i].name == "priority") {//优先级
                    formData.priority = dd[i].value;
                }
                /*if(dd[i].name=="isPrivate"){//权限
                    formData.isPrivate = dd[i].value;
                }*/
                if (dd[i].name == "configFlag") {//配置类型
                    formData.configFlag = dd[i].value;
                }
                if (dd[i].name == "weightFlag") {//权重依据
                    formData.weightFlag = dd[i].value;
                }
                if (dd[i].name == "valueWeight") {//统计依据 （比重，数据）
                    formData.valueWeight = dd[i].value;
                }
                if (dd[i].name == "dataSourceType") {//数据源
                    formData.dataSourceType = dd[i].value;
                }
            }
        }
        if (isSaveConfig == 0) {
            //校验配置名称的格式
            var reg = /^[^/\\|]*$/;
            if (!reg.test(configName)) {
                win.alertEx("配置名称不能包含以下任何字符: /  \\  | ");
                return;
            }
            if (configName.length > 30) {
                win.alertEx("输入名称超过最大长度");
                return;
            }
            if (configName != null && configName != "" && configName.trim().length != 0) {
                startLoad();

                $.ajax({
                    url: getBasePath() + '/config/renGongQuery',
                    type: 'POST',
                    data: formData,
                    dataType: "json",
                    success: function (data) {
                        endLoad();
                        if (data.msg == "error") {
                            win.alertEx("配置处理失败");
                            return;
                        }
                        //  1： 表示后台人工查询成功，并且返回到前台
                        if (data == "1") {
                            location.reload();
                        } else if (data == "0") {
                            win.alertEx("配置名称重复");
                        } else {
                            renderData(data);
                        }

                    }
                });
            } else {
                win.alertEx("配置名称不能为空");
            }
        } else {
            startLoad();
            $.ajax({
                url: getBasePath() + '/config/renGongQuery',
                type: 'POST',
                data: formData,
                dataType: "json",
                success: function (data) {
                    endLoad();
                    if (data.msg == "error") {
                        win.alertEx("配置处理失败");
                        return;
                    }
                    //  1： 表示后台人工查询成功，并且返回到前台
                    if (data == "1") {
                        location.reload();
                    } else {
                        renderData(data);
                    }
                }
            });
        }
    }

    if (moduleCode == 6 || moduleCode == 10 || moduleCode == 11 || moduleCode == 14 || moduleCode == 3 || moduleCode == 40) {//中间表模块和首页   /国家事件监测
        evet();
    } else if ($("#keywordSpanactor1").text() == "" && $("#keywordSpanactor2").text() == "" && $("#keywordSpanactor").text() == "" && $("#spang").css("display") == "none" && $("#spanh").css("display") == "none") {
        evet();
    } else {
        endLoad();
        win.alertEx("配置信息错误");
    }
}

function gkgRGQuery(obj) {
    //虚拟字段获取值
    var geographyname = $("#webCountry").attr("title");
    var code = $("#webCountry").attr("data-id");
    if (geographyname != "" && code != undefined && code != "" && code != undefined) {
        var geographyCountry = geographyname + "&&" + code;
        $("#webCountry1").val(geographyCountry);
    }

    var configName = document.getElementById("configName").value;
    var moduleCode = $("#moduleCode").val();
    var isSaveConfig;
    if (moduleCode == 17) {
        var nametext = $("#insert_leader input").val();
        var leaderName = document.getElementById("graph_leader").value;
        $("#leaderhide").val(nametext);
        if (leaderName == 0 && nametext == "") {
            win.alertEx("必须选择一个领导人");
            return;
        }
        //判断人物关键字是否格式正确
        if ($("#leaderKeywordSpan").text() != "") {
            return;
        }
    }

    function gkgt() {
        $("#RGFL").val(moduleCode);
        $("#modelType").val(moduleCode);
        if (obj == 1) {//普通查询，清空高级查询内容
            $("#customQuery").val("");
            $(".oldRadio").each(function () {
                if ($(this).is(":checked")) {
                    isSaveConfig = $(this).val();
                }
            });
        }
        var formData = $("#graphQueryForm").serialize();
        if (obj == 2) {//高级查询，需要的条件有  基本信息  和时间属性
            $(".newRadio").each(function () {
                if ($(this).is(":checked")) {
                    isSaveConfig = $(this).val();
                }
            });
            configName = $("#configName2").val();
            var dd = $("#graphQueryForm").serializeArray();
            formData = {};
            formData.configName = configName;
            formData.configCategoriesStr = moduleCode;
            formData.flid = moduleCode;
            formData.isSaveConfig = isSaveConfig;
            for (var i = 0; i < dd.length; i++) {
                if (dd[i].name == "gkgStDate") {//开始时间
                    formData.gkgStDate = dd[i].value;
                }
                if (dd[i].name == "gkgEdDate") {//结束时间
                    formData.gkgEdDate = dd[i].value;
                }
                if (dd[i].name == "customQuery") {//高级查询输入内容
                    formData.customQuery = dd[i].value;
                }
                if (dd[i].name == "gkgRemark") {//备注
                    formData.gkgRemark = dd[i].value;
                }
                if (dd[i].name == "priority") {//优先级
                    formData.priority = dd[i].value;
                }
                /*if(dd[i].name=="isPrivate"){//权限
                    formData.isPrivate = dd[i].value;
                }*/
                if (dd[i].name == "configFlag") {//配置类型
                    formData.configFlag = dd[i].value;
                }
                if (dd[i].name == "gkgWeightFlag") {//权重依据
                    formData.gkgWeightFlag = dd[i].value;
                }
                if (dd[i].name == "leaderName") {//领导人默认值
                    formData.leaderName = dd[i].value;
                }
                if (dd[i].name == "valueWeight") {//统计依据 （比重，数据）
                    formData.valueWeight = dd[i].value;
                }
                if (dd[i].name == "dataSourceType") {//数据源
                    formData.dataSourceType = dd[i].value;
                }
            }
        }
        if (isSaveConfig == 0) {
            //校验配置名称的格式
            var reg = /^[^/\\|]*$/;
            if (!reg.test(configName)) {
                win.alertEx("配置名称不能包含以下任何字符: /  \\  | ");
                return;
            }
            if (configName.length > 30) {
                win.alertEx("输入名称超过最大长度！！！");
                return;
            }
            if (configName != null && configName != "" && configName.trim().length != 0) {
                startLoad();

                $.ajax({
                    url: getBasePath() + '/config/renGongQuery',
                    type: 'POST',
                    data: formData,
                    dataType: "json",
                    success: function (data) {
                        endLoad();
                        if (data.msg == "error") {
                            win.alertEx("即时查询配置处理失败");
                            return;
                        }
                        //  1： 表示后台人工查询成功，并且返回到前台
                        if (data == "1") {
                            location.reload();
                        } else if (data == "0") {
                            win.alertEx("配置名称重复");
                        } else {
                            renderData(data);
                        }

                    }
                });
            } else {
                win.alertEx("配置名称不能为空");
            }
        } else {
            startLoad();
            $.ajax({
                url: getBasePath() + '/config/renGongQuery',
                type: 'POST',
                data: formData,
                dataType: "json",
                success: function (data) {
                    endLoad();
                    if (data.msg == "error") {
                        win.alertEx("即时查询配置处理失败");
                        return;
                    }
                    //  1： 表示后台人工查询成功，并且返回到前台
                    if (data == "1") {
                        location.reload();
                    } else {
                        renderData(data);
                    }

                }
            });
        }
    }

    if (moduleCode == 16 || moduleCode == 27) {//中间表模块
        gkgt();
    } else if (ckeckValue()) {//除中间表外需要校验情感值
        gkgt();
    } else {
        endLoad();
        win.alertEx("配置信息错误");
    }
}

//新闻模块 人工查询
function newsRGQuery() {
    const configName = document.getElementById("configName").value;
    const moduleCode = $("#moduleCode").val();
    let isSaveConfig;
    $(".artificial_radio").each(function () {
        if ($(this).is(":checked")) {
            isSaveConfig = $(this).val();
        }
    });


    //校验发布时间的开始时间、结束时间不能为空
    const newsStDate_f = $("#newsStDate_f").val();
    const newsEdDate_f = $("#newsEdDate_f").val();
    if (newsStDate_f === "" || newsEdDate_f === "") {
        win.alertEx("发布起止时间不能为空");
        return;
    }
    //判断各个输入项的提示语为空禁止提交
    let keyWordSpanFlg = true;
    $(".newsKeyWordSpan").each(function () {
        if ($(this).text() !== '') {
            keyWordSpanFlg = false;
        }
    });
    if (!keyWordSpanFlg) {
        return;
    }

    if (isSaveConfig === 0) {

        //校验配置名称的格式
        var reg = /^[^/\\|]*$/;
        if (!reg.test(configName)) {
            win.alertEx("配置名称不能包含以下任何字符: /  \\  | ");
            return;
        }
        if (configName.length > 30) {
            win.alertEx("输入名称超过最大长度！！！");
            return;
        }
        if (configName !== "" && configName.trim().length !== 0) {
            startLoad();
            $("#RGFL").val(moduleCode);
            $("#modelType").val(moduleCode);
            const formData = $("#newsQueryForm").serialize();
            $.ajax({
                url: getBasePath() + '/config/renGongQuery',
                type: 'POST',
                data: formData,
                dataType: "json",
                success: function (data) {
                    endLoad();
                    if (data.msg === "error") {
                        win.alertEx("配置处理失败");
                        return;
                    }
                    //  1： 表示后台人工查询成功，并且返回到前台
                    if (data === "1") {
                        location.reload();
                    } else if (data === "0") {
                        win.alertEx("配置名称重复！！！");
                    } else {
                        renderData(data);
                    }

                }
            });
        } else {
            win.alertEx("配置名称不能为空");
        }
    } else {
        startLoad();
        $("#RGFL").val(moduleCode);
        $("#modelType").val(moduleCode);
        const formData = $("#newsQueryForm").serialize();
        $.ajax({
            url: getBasePath() + '/config/renGongQuery',
            type: 'POST',
            data: formData,
            dataType: "json",
            success: function (data) {
                endLoad();
                if (data.msg === "error") {
                    win.alertEx("配置处理失败");
                    return;
                }
                //1： 表示后台人工查询成功，并且返回到前台
                if (data === "1") {
                    location.reload();
                } else {
                    renderData(data);
                }

            }
        });
    }

}
