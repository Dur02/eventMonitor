<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<%
    String basePath = request.getContextPath();
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>新闻展示</title>
    <style>
        .title {
            margin-top: 0 !important;
        }
    </style>
    <link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
    <link rel="stylesheet" href="<%=basePath %>/static/css/style.css">
    <link rel="stylesheet" href="<%=basePath %>/static/css/sec2.css">

    <!--人工查询 -->
    <link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css">
    <link rel="stylesheet" href="<%=basePath %>/static/lib/pagination.css"/>
    <link rel="stylesheet" href="<%=basePath %>/static/css/combo.select.css">
    <link rel="stylesheet" href="<%=basePath %>/static/css/perfect-scrollbar.css"/>
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
    <link rel="stylesheet" href="<%=basePath %>/static/css/common.css"/>
    <link rel="stylesheet" href="<%=basePath %>/static/css/news_viz.css"/>
    <link rel="stylesheet" href="<%=basePath %>/static/css/event_show_viz.css"/>
    <style>
        .tab_down_info {
            padding: 17px 20px 0;
        }

        .page-total {
            color: #9E9E9E;
            border: 1px solid #aaaaee;
            height: 19px;
            margin-top: 11px;
            margin-left: 12px;
            border-radius: 3px;
            padding: 1px 7px 0 8px;
        }

        .layui-laypage .layui-laypage-curr .layui-laypage-em {
            background-color: #26B !important;
        }

        .pup-lable {
            line-height: 11px;
            white-space: nowrap;
            overflow: hidden;
            width: 200px !important;
            text-overflow: ellipsis;
        }

        .tab_div {
            overflow: hidden !important;
        }

        .artificial_radio {
            margin-bottom: 4px !important;
        }

        .main {
            height: calc(100% - -8px);
            background-image: url(<%=basePath%>/static/css/img/bg_new.png);
        }

        .news_container {
            width: 98.28%;
            height: 85%;
            border: 1px solid #3e3c3c;
            background: #1b233461;
            margin: 10px auto;
            overflow: hidden;
            position: relative;
            overflow-y: auto;
        }

        .news_content h5 {
            width: 400px;
            color: #00BCD4;
            font-size: 18px;
            text-overflow: ellipsis;
            white-space: nowrap;
            font-family: "microsoft yahei", sans-serif;
            cursor: pointer;
            text-decoration: none;
            overflow: hidden;
        }

        .news_content {
            margin: 32px 35px 0;
            border-bottom: 1px solid #2f2d2d;
        }

        .news_content .and {
            color: #929292;
            margin: 20px 0;
        }

        .news_content .and .url {
            color: #ffeb3b;
        }

        .news_content .and .time {
            color: #929292;
        }

        .news_content p {
            color: #f9f9f9;
            height: 40px;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .layui-table-page {
            text-align: right !important;
        }

        .layui-laypage .layui-laypage-curr .layui-laypage-em {
            background-color: #00BCD4 !important;
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
            color: #fff;
            background-color: #1b2334 !important;
        }

        .news_content .but button {
            width: 52px;
            height: 18px;
            border: 1px solid #287fcb;
            color: #00BCD4;
            background: transparent;
            float: right;
        }

        .pop_up {
            width: 64.17%;
            height: 82.33%;
            background-color: #1b2334;
            border-radius: 20px;
            border: solid 1px #0485bf;
            font-family: MicrosoftYaHei, sans-serif;
            color: #666666;
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            margin: auto;
            display: none;
        }

        .pop_up h5 {
            font-size: 18px;
            margin: 25px auto;
            color: #00BCD4;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            text-align: center;
        }

        .pup_url {
            margin-left: 30px;
            line-height: 12px;
        }

        .pop_up .list ul li label:first-child {
            color: #b1b1b1;
        }

        .pup_url label:first-child {
            color: #b1b1b1;
        }

        #s_au {
            line-height: 11px;
            white-space: nowrap;
            overflow: hidden;
            width: 200px !important;
            text-overflow: ellipsis;
            color: #FFEB3B;
        }

        #i_sn {
            color: #b1b1b1
        }

        #o_gt {
            color: #b1b1b1
        }

        #s_pt {
            color: #b1b1b1
        }

        #o_url {
            color: #b1b1b1
        }

        .pop_up .list_text {
            width: calc(93.31% - 66px);
            height: calc(54.1% - 38px);
            padding: 22px 36px 16px 30px;
            background-color: #1b2334;
            color: #fff;
            border: solid 1px #093c65;
            line-height: 20px;
            overflow: auto;
            margin-top: 16px;
        }

        /*滚动条整体高宽*/
        .news_container::-webkit-scrollbar {
            width: 12px;
        }

        /*滑快*/
        .news_container::-webkit-scrollbar-thumb {
            background-color: #084c82;
            border-radius: 10px;
        }

        .news_container::-webkit-scrollbar-thumb:hover {
            background-color: #084c82;
        }


        /*滑道*/
        .news_container::-webkit-scrollbar-track {
            box-shadow: inset 0 0 6px #1b2334 !important;
            border-radius: 20px !important;
            background: #1b2334 !important;
        }

        /*弹框的滚动条*/
        /*滚动条整体高宽*/
        #s_cont::-webkit-scrollbar {
            width: 12px;
        }

        /*滑快*/
        #s_cont::-webkit-scrollbar-thumb {
            background-color: #084c82;
            border-radius: 10px;
        }

        #s_cont::-webkit-scrollbar-thumb:hover {
            background-color: #084c82;
        }


        /*滑道*/
        #s_cont::-webkit-scrollbar-track {
            box-shadow: inset 0 0 6px #1b2334 !important;
            border-radius: 20px !important;
            background: #1b2334 !important;
        }

        /* 弹出框美化 */
        .window-panel .title {
            width: 92.9%;
        }

        .window-panel .content {
            color: black;
        }


    </style>
<body>
<div class="index_top clearfix">
    <h3 class="fl title">新闻库分析 > 新闻展示</h3>
</div>
<div class="index_bottom" style="padding-top: 0;">
    <input type="hidden" id="moduleCode" value="${moduleCode}">
    <div class="main">
        <div class="event_option">
        </div>
        <div class="news_container" id="newsList">
            <!-- <div class="news_content">
                <h5>Latest breaking news <span>ava</span>ilable as free video on demandfree video on deman</h5>
                <div class="and">
                    网站：
                    <span class="url">www.fgfhjjh</span> 发布时间：
                    <span class="time">2018-08-28 20:09:09</span>
                </div>
                <p>
                    Sfghjju hbjbhj hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj
                    hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj
                    hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv
                </p>
                <div class="but"><button>查看详情</button></div>
            </div>
            <div class="news_content">
                <h5>Latest breaking news <span>ava</span>ilable as free video on demandfree video on deman</h5>
                <div class="and">
                    网站：
                    <span class="url">www.fgfhjjh</span> 发布时间：
                    <span class="time">2018-08-28 20:09:09</span>
                </div>
                <p>
                    Sfghjju hbjbhj hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj
                    hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj
                    hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv
                </p>
                <div class="but"><button>查看详情</button></div>
            </div>
            <div class="news_content">
                <h5>Latest breaking news <span>ava</span>ilable as free video on demandfree video on deman</h5>
                <div class="and">
                    网站：
                    <span class="url">www.fgfhjjh</span> 发布时间：
                    <span class="time">2018-08-28 20:09:09</span>
                </div>
                <p>
                    Sfghjju hbjbhj hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj
                    hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj
                    hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv Sfghjju hbjbhj hj sdfghj ojkjna sdfg hjk sdfghj tyhhb xcfv
                </p>
                <div class="but"><button>查看详情</button></div>
            </div> -->
        </div>
        <div style="display: flex;float: right;  margin-right: 13px;">
            <div id="newsPage"></div>
            <div class="page-total"></div>
        </div>

    </div>
    <div class="pop_up">
        <img class="off" src="<%=basePath %>/static/images/off.png" alt="">
        <h5 id="s_title"></h5>
        <div class="list">
            <ul style="margin-left: -31px;" class="list_detail fl">
                <li>
                    <label for="s_au">作者：</label>
                    <label class="pup-lable" style="width: 127px;" id="s_au"></label>
                </li>
                <li>
                    <label for="i_sn">网站：</label>
                    <label class="pup-lable" id="i_sn"></label>
                </li>
            </ul>
            <ul style="margin-right: 60px;" class="list_detail3 fl">
                <li>
                    <label for="o_gt">采集时间：</label>
                    <label id="o_gt"></label>
                </li>
                <li>
                    <label for="s_pt">发布时间：</label>
                    <label id="s_pt"></label>
                </li>
            </ul>
        </div>
        <div class="pup_url">
            <label for="o_url">对应URL：</label>
            <label style="cursor: pointer;" onclick="openUrl(this)" id="o_url"></label>
        </div>
        <div id="s_cont" class="list_text"></div>
        <div class="list_url">
            <p class="fl" style="color: #b1b1b1">图片URL地址集合：</p>
            <ul id="s_pic" class="fl"></ul>
        </div>
    </div>
    <jsp:include page="news_tab1.jsp"/>
</div>
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
        //处理配置
        handleConfigs();
        //美化滚动条
        glorifyComboSelect();

        //弹出框关闭
        $('.off').click(function () {
            //$('.pop_up').removeClass('turn_on')
            $('.pop_up').css("display", "none");
        })

    });

    //新闻弹出框
    function detail(_id) {
        startLoad();
        $.ajax({
            url: '${pageContext.request.contextPath}/news/getNewsById',
            type: 'post',
            data: {'id': _id, "pzid": render_pzid},
            dataType: 'json',
            success: function (result) {
                if (result.flag) {
                    var news = result.news;
                    if (news != null) {
                        $("#s_title").text(news.s_title);
                        $("#i_sn").text(handleData(news.i_sn));
                        $("#i_bn").text(handleData(news.i_bn));
                        $("#o_url").text(handleData(news.o_url));
                        $("#s_au").text(handleData(news.s_au));
                        var s_ex = news.s_ex;
                        //抽取配置版本：1自动；大于1：人工配置的版本
                        if (s_ex === 1) {
                            s_ex = '自动';
                        } else if (s_ex > 1) {
                            s_ex = '人工配置';
                        } else {
                            s_ex = '暂无';
                        }
                        $("#s_ex").text(s_ex);
                        $("#o_gt").text(handleData(news.formt_o_gt));
                        $("#s_pt").text(handleData(news.formt_s_pt));
                        let s_pic_html = '';
                        const s_pic = news.s_pic;
                        if (s_pic !== null && s_pic.length > 0) {
                            for (var i = 0; i < s_pic.length; i++) {
                                s_pic_html += "<li>" + s_pic[i] + "</li>";
                            }
                        }
                        $("#s_cont").html(handleData(news.s_cont));
                        $("#s_pic").html(s_pic_html);
                        $('.pop_up').css("display", "block");
                    } else {
                        win.alertEx("该源数据已删除，无法获取该条新闻信息");
                    }

                }
                endLoad();
            }, error: function () {
                endLoad();
            }
        });
    }

    //处理undefined null ''数据
    function handleData(data) {
        if (data === undefined || data === null || data === '') {
            data = '暂无'
        }
        return data;
    }

    //新窗口打开连接
    function openUrl(obj) {
        window.open($(obj).text());
    }

    //定义全局的配置ID,获取配置信息中的数据源信息（关联配置的用拼接表名、新闻配置产生的用对应的数据源）
    var render_pzid;

    //根据配置pid获取数据并渲染图表
    function render(configId) {
        render_pzid = configId;
        startLoad();
        $.ajax({
            url: '<%=basePath %>/search/news_show_viz/' + configId,
            type: 'POST',
            dataType: "json",
            success: function (data) {
                if (data === "-1") {
                    endLoad();
                    win.alertEx("获取结果信息数据失败");
                } else {
                    renderData(data);
                    endLoad();
                }
            },
            error: function (data) {
                win.alertEx("获取结果信息数据的格式不正确");
            }
        });
    }

    function initDataPage(pageIndex, pageSize, news_total, newsList) {
        let newListLength = newsList.length;
        let news_html = '';
        let st_index;
        if (pageIndex === 1) {
            st_index = 0;
        } else {
            st_index = (pageIndex - 1) * pageSize;
        }
        var ed_index = 0;
        if (newListLength !== 0) {
            ed_index = pageIndex * pageSize;
            if (ed_index > newListLength) {
                ed_index = newListLength;
            }
        }

        for (var i = st_index; i < ed_index; i++) {
            news_html += '<div class="news_content">' +
                '<h5 onclick="detail(\'' + newsList[i]._id + '\')">' + (i + 1) + '. ' + newsList[i].s_title + '</h5>' +
                '<div class="and">网站：' +
                '<span class="url">' + handleData(newsList[i].i_sn) + '</span> 发布时间：<span class="time">' + newsList[i].formt_s_pt + '</span>' +
                '</div>' +
                '<p>' + newsList[i].s_cont + '</p>' +
                '<div class="but"><button onclick="detail(\'' + newsList[i]._id + '\')">查看详情</button></div>' +
                '</div>';
        }
        $("#newsList").html(news_html);
        //分页
        layui.use(['laypage', 'layer'], function () {
            $(".page-total").text("共 " + news_total + " 条");
            const laypage = layui.laypage;
            const layer = layui.layer;
            laypage.render({
                elem: 'newsPage',
                count: newListLength,
                theme: 'fr',
                prev: '<',
                next: '>',
                //last:'共 '+total+'条',//自定义尾页的标签显示总记录数
                curr: pageIndex,
                limit: pageSize,
                layout: ['prev', 'page', 'next', 'limit', 'skip'],
                jump: function (obj, first) {
                    $(".layui-laypage-limits").css("display", "none");
                    if (!first) {
                        initDataPage(obj.curr, obj.limit, news_total, newsList)
                    }
                }
            });
        })
    }

    //渲染图表
    function renderData(data) {
        var news_total = data.news_total;
        var newsList = data.news_list;

        initDataPage(1, 20, news_total, newsList);

    }


</script>
</html>