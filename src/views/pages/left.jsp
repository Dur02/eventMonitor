<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String basePath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>监测系统-左侧菜单</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/static/css/style.css">
    <link rel="stylesheet" id="left_link" type="text/css" href="<%=basePath%>/static/css/left.css">
    <link rel="stylesheet" id="left_link2" type="text/css" href="<%=basePath%>/static/css/sec2.css">
</head>
<body>
<div class="l-menu-box">
    <div class="shrinkageBar">
        <span>|||</span>
    </div>
    <div class="menu-wrap">
        <!-- 导航 -->
        <div class="menu-title menu-title-index cf two_li_active" id="index"
             onclick="parent.mainhtml.location='../navigation/toNavigation'" title="">
            <span class="fl sj0_btn"></span>
            <span class="fl">导航</span>
        </div>
        <!-- 态势监测 -->
        <div class="menu-title cf">
            <span class="fl triangle-down"></span>
            <span class="fl">态势监测</span>
        </div>
        <ul class="menu-items">
            <li class="cf two_li" onclick="parent.mainhtml.location='../search/event/home2?bgFlag=1'">
                <span class="fl sj0_btn"></span>
                <a class="fl" href="javascript:;">总体态势</a>
            </li>
            <li class="cf two_li" onclick="parent.mainhtml.location='../search/event/event_country_monitor?bgFlag=1'">
                <span class="fl sj_show"></span>
                <a class="fl" href="javascript:;">国家事件监测</a>
            </li>
            <li class="cf two_li" onclick="parent.mainhtml.location='../search/graph/graph_leader_tone_viz?bgFlag=1'">
                <span class="fl sj14_btn"></span>
                <a class="fl" href="javascript:;">人物监测</a>
            </li>
        </ul>
        <!-- 事件分析 -->
        <div class="menu-title cf">
            <span class="fl triangle-down"></span>
            <span class="fl">事件库分析</span>
        </div>
        <ul class="menu-items">
            <li class="cf two_li" onclick="parent.mainhtml.location='../search/event/event_show_viz?bgFlag=1'">
                <span class="fl sj_show"></span>
                <a class="fl" href="javascript:;">事件展示</a>
            </li>
            <li class="cf two_li" onclick="parent.mainhtml.location='../search/event/event_timeline_viz?bgFlag=1'">
                <span class="fl sj14_btn"></span>
                <a class="fl" href="javascript:;">事件时间线</a>
            </li>
            <li class="cf two_li" onclick="parent.mainhtml.location='../search/event/event_geo_net_viz?bgFlag=1'">
                <span class="fl sj1_btn"></span>
                <a class="fl" href="javascript:;">地理网络</a>
            </li>
            <li class="cf two_li" onclick="parent.mainhtml.location='../search/event/event_timeline_type_viz?bgFlag=1'">
                <span class="fl sj2_btn"></span>
                <a class="fl" href="javascript:;">类型时间演化</a>
            </li>
            <!--
                暂时不要删除
            <li class="cf two_li" onclick="parent.mainhtml.location='../search/event/event_type_viz?bgFlag=1'">
                <span class="fl sj3_btn"></span>
                <a class="fl"   href="javascript:;">类型展示</a>
            </li> -->
            <li class="cf two_li" onclick="parent.mainhtml.location='../search/event/event_heat_viz?bgFlag=1'">
                <span class="fl sj4_btn"></span>
                <a class="fl" href="javascript:;">热点发生地展示</a>
            </li>
            <li class="cf two_li" onclick="parent.mainhtml.location='../search/event/event_timeline_geo_viz?bgFlag=1'">
                <span class="fl sj5_btn"></span>
                <a class="fl" href="javascript:;">情感稳定发生地分析</a>
            </li>
            <li class="cf two_li" onclick="parent.mainhtml.location='../search/event/event_tone_scale_viz?bgFlag=1'">
                <span class="fl sj14_btn"></span>
                <a class="fl" href="javascript:;">情感稳定事件分析</a>
            </li>
            <li class="cf two_li" onclick="parent.mainhtml.location='../search/event/event_actor_viz?bgFlag=1'">
                <span class="fl sj6_btn"></span>
                <a class="fl" href="javascript:;">事件角色展示</a>
            </li>
            <!--
                暂时不要删除
            <li class="cf two_li" onclick="parent.mainhtml.location='../search/event/event_country_scale_viz?bgFlag=1'">
                <span class="fl sj7_btn"></span>
                <a class="fl"  href="javascript:;">国家稳定分析</a>
            </li> -->
            <!--
                    暂时不要删除
             <li class="cf two_li" onclick="parent.mainhtml.location='../search/event/event_country_tone_viz?bgFlag=1'">
                 <span class="fl sj8_btn"></span>
                 <a class="fl"  href="javascript:;">国家情感分析</a>
             </li> -->
            <!--
                暂时不要删除
            <li class="cf two_li" onclick="parent.mainhtml.location='../search/event/event_country_viz?bgFlag=1'">
                <span class="fl sj9_btn"></span>
                <a class="fl"  href="javascript:;">国家状态展示</a>
            </li> -->
            <li class="cf two_li" onclick="parent.mainhtml.location='../search/event/event_situational_viz?bgFlag=1'">
                <span class="fl sj10_btn"></span>
                <a class="fl" href="javascript:;">对比分析</a>
            </li>
            <!--
                暂时不要删除
            <li class="cf two_li" onclick="parent.mainhtml.location='../search/event/event_info_viz?bgFlag=1'">
                <span class="fl sj11_btn"></span>
                <a class="fl"  href="javascript:;">事件发生地展示</a>
            </li> -->
            <!--
                暂时不要删除
            <li class="cf two_li" onclick="parent.mainhtml.location='../search/event/event_news_viz?bgFlag=1'">
                <span class="fl sj14_btn"></span>
                <a class="fl"  href="javascript:;">事件新闻展示</a>
            </li> -->
            <li class="cf two_li"
                onclick="parent.mainhtml.location='../search/event/event_country_relation_viz?bgFlag=1'">
                <span class="fl sj14_btn"></span>
                <a class="fl" href="javascript:;">国家关系展示</a>
            </li>
        </ul>
        <div class="menu-title cf">
            <span class="fl triangle-down"></span>
            <span class="fl">图谱库分析</span>
        </div>
        <ul class="menu-items">
            <li class="cf two_li" onclick="parent.mainhtml.location='../search/graph/graph_show_viz?bgFlag=1'">
                <span class="fl gkg_show"></span>
                <a class="fl" href="javascript:;">图谱展示</a>
            </li>
            <li class="cf two_li" onclick="parent.mainhtml.location='../search/graph/graph_timeline_viz?bgFlag=1'">
                <span class="fl tp15_btn"></span>
                <a class="fl" href="javascript:;">图谱时间线</a>
            </li>
            <!--
                暂时不要删除
            <li class="cf two_li" onclick="parent.mainhtml.location='../search/graph/graph_leader_tone_viz?bgFlag=1'">
                <span class="fl tp1_btn"></span>
                <a class="fl"  href="javascript:;">人物情感分析</a>
            </li> -->
            <!-- <li class="cf two_li" onclick="parent.mainhtml.location='../search/graph/graph_head_wordcloud_viz?bgFlag=1'">
                <span class="fl tp2_btn"></span>
                <a class="fl"  href="javascript:;">人物头像标签云</a>
            </li> -->
            <li class="cf two_li"
                onclick="parent.mainhtml.location='../search/graph/graph_person_timeline_viz?bgFlag=1'">
                <span class="fl tp6_btn"></span>
                <a class="fl" href="javascript:;">人物分析</a>
            </li>
            <li class="cf two_li"
                onclick="parent.mainhtml.location='../search/graph/graph_organization_timeline_viz?bgFlag=1'">
                <span class="fl tp3_btn"></span>
                <a class="fl" href="javascript:;">组织分析</a>
            </li>
            <li class="cf two_li"
                onclick="parent.mainhtml.location='../search/graph/graph_theme_timeline_viz?bgFlag=1'">
                <span class="fl tp8_btn"></span>
                <a class="fl" href="javascript:;">主题分析</a>
            </li>
            <li class="cf two_li" onclick="parent.mainhtml.location='../search/graph/graph_tone_timeline_viz?bgFlag=1'">
                <span class="fl tp7_btn"></span>
                <a class="fl" href="javascript:;">情感分析</a>
            </li>
            <li class="cf two_li"
                onclick="parent.mainhtml.location='../search/graph/graph_country_timeline_viz?bgFlag=1'">
                <span class="fl tp4_btn"></span>
                <a class="fl" href="javascript:;">地域分析</a>
            </li>
            <li class="cf two_li"
                onclick="parent.mainhtml.location='../search/graph/graph_conflict_timeline_viz?bgFlag=1'">
                <span class="fl tp5_btn"></span>
                <a class="fl" href="javascript:;">counts分析</a>
            </li>
            <li class="cf two_li"
                onclick="parent.mainhtml.location='../search/graph/graph_website_analysis_viz?bgFlag=1'">
                <span class="fl tp4_btn"></span>
                <a class="fl" href="javascript:;">网站分析</a>
            </li>
            <!-- <li class="cf two_li" onclick="parent.mainhtml.location='../search/graph/graph_net_viz?bgFlag=1'">
                <span class="fl tp9_btn"></span>
                <a class="fl"  href="javascript:;">实体展示</a>
            </li>
            <li class="cf two_li" onclick="parent.mainhtml.location='../search/graph/graph_word_cloud_viz?bgFlag=1'">
                <span class="fl tp10_btn"></span>
                <a class="fl"  href="javascript:;">标签云</a>
            </li>
            <li class="cf two_li" onclick="parent.mainhtml.location='../search/graph/graph_geo_net_viz?bgFlag=1'">
                <span class="fl tp11_btn"></span>
                <a class="fl"  href="javascript:;">地理网络</a>
            </li>
            <li class="cf two_li" onclick="parent.mainhtml.location='../search/graph/graph_heat_viz?bgFlag=1'">
                <span class="fl tp12_btn"></span>
                <a class="fl"  href="javascript:;">热点显示</a>
            </li>
            <li class="cf two_li" onclick="parent.mainhtml.location='../search/graph/graph_countryshow_viz?bgFlag=1'">
                <span class="fl tp13_btn"></span>
                <a class="fl"  href="javascript:;">国家状态展示</a>
            </li>
            <li class="cf two_li" onclick="parent.mainhtml.location='../search/graph/graph_conflict_viz?bgFlag=1'">
                <span class="fl tp14_btn"></span>
                <a class="fl"  href="javascript:;">国家冲突分析</a>
            </li> -->
        </ul>
        <div class="menu-title cf">
            <span class="fl triangle-down"></span>
            <span class="fl">新闻库分析</span>
        </div>
        <ul class="menu-items">
            <li class="cf two_li" onclick="parent.mainhtml.location='../search/news/news_show_viz?bgFlag=1'">
                <span class="fl news_show"></span>
                <a class="fl" href="javascript:;">新闻展示</a>
            </li>
            <li class="cf two_li" onclick="parent.mainhtml.location='../search/news/news_analysis_viz?bgFlag=1'">
                <span class="fl news_ana"></span>
                <a class="fl" href="javascript:;">新闻分析</a>
            </li>
<%--            <li class="cf two_li" onclick="parent.mainhtml.location='../search/news/news_event_analysis_viz?bgFlag=1'">--%>
<%--                <span class="fl news_ana"></span>--%>
<%--                <a class="fl" href="javascript:;">新闻事件分析结果</a>--%>
<%--            </li>--%>
            <li class="cf two_li" onclick="parent.mainhtml.location='../search/news/news_website_analysis?bgFlag=1'">
                <span class="fl tp4_btn"></span>
                <a class="fl" href="javascript:;">网站分析</a>
            </li>
        </ul>
        <!-- 除宾客用户外 -->
        <c:if test="${sessionScope.LOGINUSER.roleId ne 3 }">
            <div class="menu-title menu-title-index cf" id="user"
                 onclick="parent.mainhtml.location='../relationAnalysis/toRelationAnalysis?bgFlag=1'">
                <span class="fl yonghu"></span>
                <span class="fl">关联分析</span>
            </div>
        </c:if>
        <!-- 预警预测 -->
        <div class="menu-title menu-title-index cf" onclick="ycyj()">
            <span class="fl yj0_btn"></span>
            <span class="fl">预警预测</span>
        </div>
        <!-- 数据管理 -->
        <c:if test="${sessionScope.LOGINUSER.roleId  eq 1 }">
            <div class="menu-title cf">
                <span class="fl triangle-down"></span>
                <span class="fl">数据管理</span>
            </div>
            <ul class="menu-items">
                <!-- <li class="cf" id="eventShowList" onclick="parent.mainhtml.location='../dataStatistics/eventShow?bgFlag=1'">
                    <span class="fl insertCounts"></span>
                    <a class="fl"  href="javascript:;">事件展示</a>
                </li>
                <li class="cf" id="graphShowList" onclick="parent.mainhtml.location='../dataStatistics/graphShow?bgFlag=1'">
                    <span class="fl insertCounts"></span>
                    <a class="fl"  href="javascript:;">图谱展示</a>
                </li>
                <li class="cf" id="newsShowList" onclick="parent.mainhtml.location='../dataStatistics/newsShow?bgFlag=1'">
                    <span class="fl insertCounts"></span>
                    <a class="fl"  href="javascript:;">新闻展示</a>
                </li> -->
                <li class="cf" id="insertDBCounts"
                    onclick="parent.mainhtml.location='../dataStatistics/insertDBCounts?bgFlag=1'">
                    <span class="fl tp15_btn"></span>
                    <a class="fl" href="javascript:;">入库量统计</a>
                </li>
                <li class="cf" onclick="parent.mainhtml.location='../modelManager/toModelManager?bgFlag=1'">
                    <span class="fl insertCounts"></span>
                    <a class="fl" href="javascript:;">中间表管理</a>
                </li>
                <!--
                    此功能模块去掉
                <li class="cf" id="netNewsCounts" onclick="parent.mainhtml.location='../dataStatistics/netNewsCounts?bgFlag=1'">
                    <span class="fl newsCounts"></span>
                    <a class="fl">网站新闻量统计</a>
                </li> -->
            </ul>
        </c:if>
        <!-- 配置管理 -->
        <!-- 除宾客用户外 -->
        <c:if test="${sessionScope.LOGINUSER.roleId ne 3 }">
            <div class="menu-title cf">
                <span class="fl triangle-down"></span>
                <span class="fl">配置管理</span>
            </div>
            <ul class="menu-items">
                <li class="cf" id="config1" onclick="parent.mainhtml.location='../config/toEventConfig?bgFlag=1'">
                    <span class="fl pzycs_btn3"></span>
                    <a class="fl" href="javascript:;">事件配置</a>
                </li>
                <li class="cf" id="config2" onclick="parent.mainhtml.location='../config/toGraphConfig?bgFlag=1'">
                    <span class="fl pzycs_btn4"></span>
                    <a class="fl">图谱配置</a>
                </li>
                <li class="cf" id="config3" onclick="parent.mainhtml.location='../config/toNewsConfig?bgFlag=1'">
                    <span class="fl news_con"></span>
                    <a class="fl">新闻配置</a>
                </li>
<%--                <li class="cf" id="config4" onclick="parent.mainhtml.location='../config/toNewsEventConfig?bgFlag=1'">--%>
<%--                    <span class="fl news_con"></span>--%>
<%--                    <a class="fl">新闻事件配置</a>--%>
<%--                </li>--%>
                <li class="cf" id="leaderPZ" onclick="parent.mainhtml.location='../config/toLeaderConfig?bgFlag=1'">
                    <span class="fl pzycs_btn2"></span>
                    <a class="fl" href="javascript:;">人物配置</a>
                </li>
            </ul>
        </c:if>
        <!-- 用户管理 -->
        <c:if test="${sessionScope.LOGINUSER.roleId  eq 1 }">
            <div class="menu-title menu-title-index cf" id="user"
                 onclick="parent.mainhtml.location='../user/toUserConfig?bgFlag=1'">
                <span class="fl yonghu"></span>
                <span class="fl">用户管理</span>
            </div>
        </c:if>
    </div>
</div>
<script src="<%=basePath%>/static/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>/static/js/left.js"></script>
<script>
    //预测预警
    function ycyj() {
        window.open("http://111.205.121.89:13703/worldmap/index/#");
    }

    /*window.onload = function(){
        var oContro_btn = document.getElementById('contro_btn');
        oContro_btn.onclick = function(){
            if(window.parent.document.getElementById("left").cols == "193,*"){
                window.parent.left.cols = "41,*";
            }else{
                window.parent.left.cols = "193,*";
            }
        };
    } */

</script>
</body>
</html>