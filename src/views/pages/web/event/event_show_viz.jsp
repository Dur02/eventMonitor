<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
    String basePath = request.getContextPath();
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>事件展示</title>
    <link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
    <link rel="stylesheet" href="<%=basePath %>/static/css/style.css">
    <link rel="stylesheet" href="<%=basePath %>/static/css/sec2.css">

    <!--人工查询 -->
    <link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css">
    <link rel="stylesheet" href="<%=basePath %>/static//lib/pagination.css"/>
    <link rel="stylesheet" href="<%=basePath %>/static/css/combo.select.css">
    <link rel="stylesheet" href="<%=basePath %>/static/css/perfect-scrollbar.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/css/bootstrap.min.css"/>
    <!-- 影响情感值样式的css -->
    <link rel="stylesheet" href="<%=basePath %>/static/win_alert/window_zs.css"/><!-- 弹出提示框样式 -->
    <script src="<%=basePath%>/static/js/jquery-1.9.1.min.js"></script>
    <script src="<%=basePath%>/static/lib/jquery.pagination.js"></script>
    <script src="<%=basePath%>/static/js/config/config.js"></script>
    <script src="<%=basePath%>/static/layui/layui.js"></script>
    <link rel="stylesheet" href="<%=basePath%>/static/layui/css/layui.css">
    <!-- 两种皮肤切换 -->
    <c:if test="${bgFlag == null or bgFlag == 1}">
    <link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css"/>
    <link rel="stylesheet" href="<%=basePath %>/static/css/sec2.css">
    <link rel="stylesheet" href="<%=basePath %>/static/css/hsCheckData.css"/>
    <script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
    </c:if>
    <c:if test="${bgFlag == 2}">
    <link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.min.css"/>
    <link rel="stylesheet" href="<%=basePath %>/static/css/sec2_2.css">
    <link rel="stylesheet" href="<%=basePath %>/static/css/hsCheckData2.css"/>
    <script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
    </c:if>
    <link rel="stylesheet" href="<%=basePath %>/static/css/event2.css"/>
    <link rel="stylesheet" href="<%=basePath %>/static/css/event_show2.css"/>
    <style type="text/css">
        .layui-table th {
            text-align: left;
            font-weight: 800 !important;
        }

        .layui-table-page {
            text-align: right !important;
        }

        .layui-laypage .layui-laypage-curr .layui-laypage-em {
            background-color: #26B !important;
        }

        .layui-table-tool {
            background-color: #344063 !important;
            border: 1px solid #666 !important;
        }

        .layui-table-tool .layui-inline[lay-event] {
            background-color: #00c1de !important;
            border: 0px solid #ccc;
        }

        .layui-table-header {
            background-color: #344063 !important;
        }

        .table .layui-table-header .layui-table th {
            background: #344063 !important;
            color: #616161;
        }

        .layui-table-cell .laytable-cell-1-0-0 span {
            color: #fff;
        }

        .layui-table tbody tr {
            background-color: #1b2334;
        }

        .layui-table tbody tr:nth-child(2n) {
            background-color: #1b2334 !important;
        }

        .layui-table tbody td {
            border: 1px solid #666 !important;
            color: #fff !important;
        }

        .layui-table thead tr th {
            border: 1px solid #666 !important;
            color: #fff !important;
        }

        /* 美化滚动条  */
        .layui-table-body::-webkit-scrollbar {
            width: 10px;
            height: 10px;
            background-color: #1b2334;
        }

        .layui-table-body::-webkit-scrollbar-thumb {
            background-color: #333 !important;
            border-radius: 10px !important;
        }

        .layui-table-body::-webkit-scrollbar-thumb:hover {
            background-color: #777 !important;
        }

        .layui-table-body::-webkit-scrollbar-track {
            background: #1b2334;
            box-shadow: inset 0 0 6px #333 !important;
            border-radius: 10px !important;
        }

        .layui-table tr:hover {
            background: #1b2334 !important;
        }

        .layui-laypage a, .layui-laypage span {
            background: #1d2334 !important;
            color: #fff !important;
            border: 1px solid #aaaaee !important;
            border-radius: 3px;
            margin: 0 4px !important;
            height: 20px !important;
            line-height: 20px !important;
        }

        .layui-laypage-em {
            background: #1d2334 !important;
        }

        .layui-laypage-limits, .layui-laypage-btn, .layui-laypage-skip input {
            background: #1d2334 !important;
            color: #fff;
            height: 20px !important;
            line-height: 20px !important;
        }

        .layui-laypage select {
            border-color: #aaaaee !important;
        }

        .layui-laypage-limits {
            border: none !important;
        }

        .layui-laypage-limits select {
            background: #1d2334 !important;
            color: #fff;
            padding: 0 !important;
        }

        .layui-box .layui-laypage-skip {
            border: none !important;
        }

        .layui-laypage input, .layui-laypage button {
            border-color: #aaaaee !important;
        }

        .layui-table-tool-panel {
            background: #1d2334 !important;
            border: 1px solid #1b2334;
        }

        .layui-table-page {
            text-align: right !important;
            border-top: 1px;
            /* position: fixed;
            bottom: 37px;*/
        }

        .layui-form-checkbox[lay-skin=primary] span {
            color: #eee;
        }

        .layui-table-tool-panel li:hover {
            background: #666 !important;
        }

        .layui-table-box {
            position: relative;
            height: 95%;

        }

        .layui-table-view {
            height: 100%;
        }

        .table {
            height: 94%;
        }

        .layui-table-body {
            position: relative;
            overflow: auto;
            margin-right: -1px;
            margin-bottom: -1px;
            height: calc(100% - 30px) !important;
            /*width: 1746px;*/
        }

        .layui-table-box::-webkit-scrollbar {
            /*  width: 10px; */
            height: 10px;
            /*background-color: #ddd;*/
        }

        /*滑块*/
        .layui-table-box::-webkit-scrollbar-thumb {
            background-color: #333;
            /*  border-radius: 10px; */
        }

        .layui-table-box::-webkit-scrollbar-thumb:hover {
            background-color: #777;
        }

        /*滑道*/
        .layui-table-box::-webkit-scrollbar-track {
            box-shadow: inset 0 0 6px #333;
            /*  border-radius: 10px; */
        }

        /* 弹出框样式 */
        .window-panel .content {
            color: black;
        }
    </style>
<body style="background:#101010;">
<div class="index_top clearfix">
    <h3 class="fl title">事件库分析 > 事件展示</h3>
</div>
<div class="index_bottom">
    <div class="event_main" style="margin-top: -17px;height: 95%">
        <input type="hidden" id="moduleCode" value="${moduleCode}">
        <!-- <div class="event_option">
            <ul class="fl eve">
                <li class="active" onclick="reloadTable('1')">事件库一</li>
                <li onclick="reloadTable('2')">事件库二</li>
                <li onclick="reloadTable('3')">事件库三</li>
            </ul>
            <button class="fr" style="cursor: pointer;" onclick="ExportData()">导出</button>
        </div> -->
        <div class="table tabs">
            <table class="layui-table" id="dataTable" lay-filter="dataTable"></table>
        </div>
    </div>

    <jsp:include page="event_tab1.jsp"></jsp:include>
</div>
<input type="hidden" value="1" id="dataType">
<jsp:include page="../updateUserPassword.jsp"/>
</body>
<!-- 人工查询功能的日期 -->
<script src="<%=basePath %>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-select.min.js"></script>
<script src="<%=basePath %>/static/js/jquery.combo.select.js"></script>
<script src="<%=basePath %>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath %>/static/js/perfect-scrollbar.js"></script>
<script src="<%=basePath %>/static/js/sec2.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
<c:if test="${bgFlag == null or bgFlag == 1}">
    <script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
    <script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
</c:if>
<!-- 人工查询js -->
<script src="<%=basePath %>/static/Visualization/rgQuery.js"></script>
<script src="<%=basePath%>/static/js/map-tileLayer.js" type="text/javascript"></script>
<!-- 计算显示图的高度 -->
<script src="<%=basePath%>/static/js/chartHeight.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框js脚本 -->
<script type="text/javascript">
    $(function () {
        $(".quanzhong").hide();
        $(".quanzhongkuang").show();
        //处理配置
        handleConfigs();

        //美化滚动条
        glorifyComboSelect();
        $(".quanzhongkuang").show();
    });

    function render(configId) {
        startLoad();
        /* layui.use('table',function(){
           var table = layui.table;
           table.render({});
       }); */
        /*  layui.use('table',function(){
             startLoad();
             var table = layui.table;
             table.reload('dataTable',{
                 method:'post',
                 where:{'configId':configId},
                 page:{curr:1},
                 done:function(res){
                     hideDiv(res.allTotal);
                     endLoad();
                 }
             });
         }); */
        $.ajax({
            url: '<%=basePath%>/search/event_show_viz/' + configId,
            type: 'POST',
            dataType: "json",
            async: false,
            success: function (data) {
                if (data == "-1") {
                    endLoad();
                    win.alertEx("加载失败");
                }
                showTable(data.eventData, data.eventAllNum);
                endLoad();
            }
        });
    }

    //这个方法是即时查询统一调用的方法名称
    function renderData(data) {
        var da = data.eventInfoData;
        var num = data.allTotal;
        showTable(da, num);
    }

    function showTable(data, num) {
        layui.use('table', function () {
            var table = layui.table;
            table.render({
                elem: '#dataTable',
                toolbar: true,
                cols: [[
                    {type: 'numbers', 'align': 'center', width: 60, title: '序号'},
                    {field: 'GLOBALEVENTID', width: 100, title: '事件ID', style: 'font-size:16px;'},
                    {field: 'SQLDATE', width: 100, title: '日期'},
                    {field: 'fractionDate', width: 100, title: '时间比例'},
                    {field: 'quadClassString', width: 100, title: '大类事件'},
                    {field: 'eventRootCodeString', width: 100, title: '根事件'},
                    {field: 'eventBaseCodeString', width: 100, title: '基事件'},
                    {field: 'eventCodeString', width: 100, title: '事件编码'},
                    {field: 'isRootEvent', width: 100, templet: '#showIsRoot', title: '是否根类'},
                    {field: 'numSources', width: 100, title: '来源数'},
                    {field: 'numArticles', width: 100, title: '文章数'},
                    {field: 'goldsteinScale', width: 100, title: '影响度'},
                    {field: 'avgTone', width: 100, title: '情感值'},
                    {field: 'actor1Code', width: 100, title: '角色—编码'},
                    {field: 'actor1Name', width: 100, title: '角色—实名'},
                    {field: 'actor1CountryCode', width: 100, title: '角色—国家'},
                    {field: 'actor1KnownGroupCode', width: 100, title: '角色—组织'},
                    {field: 'actor1EthnicCode', width: 100, title: '角色—种族'},
                    {field: 'actor1Religion1Code', width: 100, title: '角色—宗教1'},
                    {field: 'actor1Religion2Code', width: 100, title: '角色—宗教2'},
                    {field: 'actor1Type1Code', width: 100, title: '角色—种类1'},
                    {field: 'actor1Type2Code', width: 100, title: '角色—种类2'},
                    {field: 'actor1Type3Code', width: 100, title: '角色—种类3'},
                    {field: 'actor1Geo_Type', width: 100, templet: '#showGeo1Type', title: '角色—地理种类'},
                    {field: 'actor1Geo_CountryCode', width: 100, title: '角色—地理国家编码'},
                    {field: 'actor1Geo_ADM1Code', width: 100, title: '角色—地理省份编码'},
                    {field: 'actor1Geo_FullName', width: 100, title: '角色—地理全名'},
                    {field: 'actor1Geo_Lat', width: 100, title: '角色—经度'},
                    {field: 'actor1Geo_Long', width: 100, title: '角色—纬度'},
                    {field: 'actor1Geo_FeatureID', width: 100, title: '角色—地理ID'},
                    {field: 'actor2Code', width: 100, title: '角色二编码'},
                    {field: 'actor2Name', width: 100, title: '角色二实名'},
                    {field: 'actor2CountryCode', width: 100, title: '角色二国家（编码）'},
                    {field: 'actor2KnownGroupCode', width: 100, title: '角色二组织'},
                    {field: 'actor2EthnicCode', width: 100, title: '角色二种族'},
                    {field: 'actor2Religion1Code', width: 100, title: '角色二宗教1'},
                    {field: 'actor2Religion2Code', width: 100, title: '角色二宗教2'},
                    {field: 'actor2Type1Code', width: 100, title: '角色二种类1'},
                    {field: 'actor2Type2Code', width: 100, title: '角色二种类2'},
                    {field: 'actor2Type3Code', width: 100, title: '角色二种类3'},
                    {field: 'actor2Geo_Type', width: 100, templet: '#showGeo2Type', title: '角色二地理种类'},
                    {field: 'actor2Geo_CountryCode', width: 100, title: '角色二地理国家编码'},
                    {field: 'actor2Geo_ADM1Code', width: 100, title: '角色二地理省份编码'},
                    {field: 'actor2Geo_FullName', width: 100, title: '角色二地理全名'},
                    {field: 'actor2Geo_Lat', width: 100, title: '角色二经度'},
                    {field: 'actor2Geo_Long', width: 100, title: '角色二纬度'},
                    {field: 'actor2Geo_FeatureID', width: 100, title: '角色二地理ID'},
                    {field: 'actionGeo_CountryCode', width: 100, title: '事件发生地国家（编码）'},
                    {field: 'actionGeo_ADM1Code', width: 100, title: '事件发生地州省（编码）'},
                    {field: 'actionGeo_FullName', width: 100, title: '事件发生地地理全名'},
                    {field: 'actionGeo_Lat', width: 100, title: '事件发生地经度'},
                    {field: 'actionGeo_Long', width: 100, title: '事件发生地纬度'},
                    {field: 'actionGeo_FeatureID', width: 100, title: '事件发生地地理ID'},
                    {field: 'DATEADDED', width: 100, title: '入库时间'},
                    {field: 'SOURCEURL', width: 100, title: '源URL'}
                ]],
                data: data,
                page: true,
                limit: 30,
                done: function (res) {
                    hideDiv(num);
                    var arr = document.getElementsByClassName("layui-inline");
                    arr[2].parentNode.removeChild(arr[2])
                    arr[1].parentNode.removeChild(arr[1])
                    //$('th').css({'font-size':'16px!important'})
                }
            })
        })
    }

    function hideDiv(obj) {
        $(".layui-laypage-count").hide();
        $(".layui-laypage-limits").hide();
        var html = '<span style="padding:0 4px; border:1px solid #e6e6e6;">共' + obj + '条</span>';
        $('.layui-laypage').append(html);
    }

    //包装查询条件
    function packData() {
        getActorSelectData();
        var dataType = $("#dataType").val();
        var formData = $("#eventQueryForm").serializeArray();
        var contions = {};
        for (var i = 0; i < formData.length; i++) {
            var name = formData[i].name;
            var value = formData[i].value;
            contions[name] = value;
        }
        contions.dataType = dataType * 1;
        var stNumMentions = $("#stNumMentions").val();
        var edNumMentions = $("#edNumMentions").val();
        var stNumArticles = $("#stNumArticles").val();
        var edNumArticles = $("#edNumArticles").val();
        var stNumSources = $("#stNumSources").val();
        var edNumSources = $("#edNumSources").val();
        contions.stNumMentions = stNumMentions * 1;
        contions.edNumMentions = edNumMentions * 1;
        contions.stNumArticles = stNumArticles * 1;
        contions.edNumArticles = edNumArticles * 1;
        contions.stNumSources = stNumSources * 1;
        contions.edNumSources = edNumSources * 1;
        return contions;
    }

    //导出数据
    function ExportData() {
        startLoad();
        var contions = packData();//根据查询条件导出
        console.log(contions);
        $.ajax({
            url: '${pageContext.request.contextPath}/dataManage/creatEventFile',
            type: 'post',
            data: contions,
            dataType: 'json',
            success: function (result) {
                var fileName = result.fileName;
                var obj = {};
                obj.fileName = fileName;
                var str = JSON.stringify(obj);
                window.location.href = "${pageContext.request.contextPath}/dataManage/exportEventData?param=" + encodeURI(encodeURI(str));
                endLoad();
            }

        });
    }

    function queryData() {
        startLoad();
        var contions = packData();
        layui.use('table', function () {
            startLoad();
            var table = layui.table;
            table.reload('dataTable', {
                method: 'post',
                where: contions,
                page: {curr: 1},
                done: function (res) {
                    hideDiv(res.allTotal);
                    endLoad();
                }
            });
        });
    }

    //切换数据库操作
    function reloadTable(obj) {
        var contions = {};
        if (obj == 1) {//数据库一
            contions.dataType = 1;
            $("#dataType").val(1);
        } else if (obj == 2) {//数据库二
            contions.dataType = 2;
            layer.msg("数据源尚未提供");
            return false;
            $("#dataType").val(2);
        } else {//数据库三
            contions.dataType = 3;
            layer.msg("数据源尚未提供");
            return false;
            $("#dataType").val(3);
        }
        layui.use('table', function () {
            startLoad();
            var table = layui.table;
            table.reload('dataTable', {
                method: 'post',
                where: contions,
                page: {curr: 1},
                done: function (res) {
                    hideDiv(res.allTotal);
                    endLoad();
                }
            });
        });
    }
</script>
<script type="text/html" id="showIsRoot">
    {{# if(d.isRootEvent==0){ }}
    否
    {{# }else if(d.isRootEvent==1){ }}
    是
    {{# } }}
</script>
<script type="text/html" id="showGeo1Type">
    {{# if(d.actor1Geo_Type==1){ }}
    国家
    {{# }else if(d.actor1Geo_Type==2){ }}
    州省
    {{# }else if(d.actor1Geo_Type==3){ }}
    城市
    {{# }else if(d.actor1Geo_Type==4){ }}
    城市
    {{# }else if(d.actor1Geo_Type==5){ }}
    州省
    {{# } }}
</script>
<script type="text/html" id="showGeo2Type">
    {{# if(d.actor2Geo_Type==1){ }}
    国家
    {{# }else if(d.actor2Geo_Type==2){ }}
    州省
    {{# }else if(d.actor2Geo_Type==3){ }}
    城市
    {{# }else if(d.actor2Geo_Type==4){ }}
    城市
    {{# }else if(d.actor2Geo_Type==5){ }}
    州省
    {{# } }}
</script>
</html>