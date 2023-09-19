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
    <title>对比分析</title>
    <link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
    <link rel="stylesheet" href="<%=basePath%>/static/css/style.css">
    <link rel="stylesheet" id="main_link" href="<%=basePath%>/static/css/sec2.css">
    <!-- 即时查询日期 -->
    <link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.standalone.css">
    <link rel="stylesheet" href="<%=basePath%>/static/lib/pagination.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/css/combo.select.css">
    <link rel="stylesheet" href="<%=basePath%>/static/css/perfect-scrollbar.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-datepicker.standalone.css">
    <link rel="stylesheet" href="<%=basePath%>/static/lib/pagination.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css"
          href="<%=basePath%>/static/Visualization/base/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/base/base.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/static/Visualization/css/event_result.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/Visualization/css/contrastmap.css" type="text/css"
          media="screen"/>
    <link rel="stylesheet" id="main_link" href="<%=basePath%>/static/css/sec2.css">
    <link rel="stylesheet" href="<%=basePath %>/static/win_alert/window_zs.css"/><!-- 弹出提示框样式 -->
    <link rel="stylesheet" href="<%=basePath %>/static/css/eventConfig.css"/>

    <!-- 两种皮肤切换 -->
    <c:if test="${bgFlag == null or bgFlag == 1}">
        <link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css"/>
        <link rel="stylesheet" href="<%=basePath %>/static/css/sec2.css">
        <link rel="stylesheet" href="<%=basePath %>/static/css/hsCheckData.css"/>
    </c:if>
    <c:if test="${bgFlag == 2}">
        <link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.min.css"/>
        <link rel="stylesheet" href="<%=basePath %>/static/css/sec2_2.css">
        <link rel="stylesheet" href="<%=basePath %>/static/css/hsCheckData2.css"/>
    </c:if>
    <script src="<%=basePath%>/static/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/static/js/echarts/map2/echarts.js"></script>
    <script type="text/javascript" src="<%=basePath%>/static/js/echarts/map/china.js"></script>

    <script src="<%=basePath%>/static/lib/jquery.pagination.js"></script>
    <script type="text/javascript" src="<%=basePath%>/static/js/hsCheckData.js"></script>
    <style>
        .index_bottom {
            background: url(<%=basePath %>/static/images/beij.png) no-repeat;
            background-size: 100%;
        }

        .show_height {
            height: 635.953px !important;
        }

        .show {
            width: 100%;
            /* min-height:635.953px !important; */
            padding-top: 1.6%;
            padding-left: 1.86%
        }

        .out_box {
            position: relative;
            height: 125%;
            width: 97.5%;
            border: 1px solid #404248;
        }

        .middle_box {
            position: absolute;
            width: 18.3%;
            height: 3.14%;
            left: 0.9%;
            top: 1.7%;
            color: white;
        }

        .city {
            display: inline-block;
            height: 26px;
            width: 73px;
            transform: skew(20deg);
            border-radius: 3px;
            border: 1.3px solid #00aeff;
            background-color: #024a73;
            cursor: pointer;
            margin-left: -6px;
        }

        .city1 {
            display: inline-block;
            margin-left: 25px;
            margin-top: 3px;
            transform: skew(-20deg);
            margin-top: 2.5px;
        }

        .Province {
            display: inline-block;
            height: 26px;
            width: 73px;
            transform: skew(20deg);
            border-radius: 3px;
            border: 1.3px solid #00aeff;
            background-color: #1683c1;
            cursor: pointer;
            margin-left: -7px;

        }

        .Province1 {
            display: inline-block;
            margin-left: 25px;
            margin-top: 3px;
            transform: skew(-20deg);
            color: #28e0f7;
            margin-top: 2.5px;
        }

        .country {
            display: inline-block;
            height: 26px;
            width: 73px;
            transform: skew(20deg);
            border-radius: 3px;
            border: 1px solid #00aeff;
            background-color: #00aeff;
        }

        .country1 {
            display: inline-block;
            margin-left: 25px;
            margin-top: 3px;
            transform: skew(-20deg);
        }

        .world {
            display: inline-block;
            height: 26px;
            width: 73px;
            transform: skew(20deg);
            border-radius: 3px;
            border: 1px solid #00aeff;
            background-color: #024a73;
            margin-right: 7px;
        }

        .world1 {
            display: inline-block;
            margin-left: 25px;
            margin-top: 3px;
            transform: skew(-20deg);
        }

        .trapezoid {
            font-size: 14px;
            font-family: SimSun;
            font-weight: bold;
            position: absolute;
            left: 75px;
            top: 10px;
        }

        .middle_box1 {
            position: absolute;
            width: 14.6%;
            height: 5.7%;
            left: 41%;
            top: -2px;
            color: white;
            border: #383e54 solid 0px;
            background: url(<%=basePath %>/static/images/ti_1.png) no-repeat;
        }

        .bottom_box {
            position: absolute;
            width: 19.6%;
            border: 1px solid #133154;
            right: 2.1%;
            bottom: 3.6%;
            z-index： 1000;
            border: 1px solid #134e8b;
        }

        .first {
            width: 100%;
            height: 36px;
            border: 2px solid #134e8b;
            background: #102941;
            line-height: 36px;

        }

        .first span {
            color: #01f0e9;
            font-size: 16px;
            margin-left: 13px;
            margin-top: 6px;
        }

        .second {
            width: 100%;
            height: 37px;
            background: #102941;
            position: absolute;

        }

        .span_1 {
            width: 16.6px;
            height: 16.6px;
            background: linear-gradient(#00cb90, #0088e7);
            float: left;
            margin-top: 10px;
            margin-left: 10px;
        }

        .third {
            width: 100%;
            height: 37px;
            background: #102941;
            position: absolute;
            top: 69px;
        }

        .span_2 {
            height: 37px;
            color: #FFF;
            float: left;
            margin-left: 10px;
        }

        .back_pic {
            position: absolute;
            height: 91%;
            width: 97.5%;
            margin-left: 1%;
            margin-top: 3%;
        }

        .list {
            width: 100%;
            height: 37px;
            line-height: 37px;
            background: #102941;
        }

        .bar_chart {
            position: absolute;
            height: 44%;
            width: 97.5%;
            margin-left: 1%;
            margin-top: 19%;
        }

        .bar_png {
            position: absolute;
            height: 35%;
            width: 97.5%;
            margin-left: 1%;
            margin-top: 3%;
        }

        .nodata_image {
            top: 112%;
            left: 50%;
            position: absolute;
            margin-top: -290px;
            margin-left: -190px;
            height: 231px;
        }

        /* 美化滚动条 */
        .tab_div {
            overflow: auto;
        }

        .tab_div::-webkit-scrollbar {
            width: 10px;
            height: 10px;
            background-color: #1b2334;
        }

        .tab_div::-webkit-scrollbar-thumb {
            background-color: #1d2334 !important;
            border-radius: 10px !important;
        }

        .tab_div::-webkit-scrollbar-thumb:hover {
            background-color: #777 !important;
        }

        .tab_div::-webkit-scrollbar-track {
            background: #1b2334;
            box-shadow: inset 0 0 6px #333 !important;
            border-radius: 10px !important;
        }
    </style>
</head>
<body>
<div class="index_top clearfix">
    <h3 class="fl title">事件库分析 > 对比展示</h3>
    <input type="hidden" id="moduleCode" value="${moduleCode}">
</div>
<div class="index_bottom">
    <div class="data show show_height">
        <!-- 填充内容 -->
        <div class="out_box">
            <div class="middle_box">
						<span class="world">
						<span class="world1">世界</span>
						</span>
                <span class="country" style="display: none">
						<span class="country1" id="country">国家</span>
						</span>
                <span class="Province"" style="display: none">
                <span class="Province1">州省</span>
                </span>
                <span class="city" style="display: none">
						<span class="city1">城市</span>
						</span>
            </div>
            <div class="middle_box1">
						<span class="trapezoid">
						地理对比图
						</span>
            </div>
            <div class="back_pic" id="word_echart"></div>
            <div class="bar_png" style="display: none"></div>
            <div class="bar_chart" id="bar_echart" style="display: none"></div>

            <div class="bottom_box">
                <div class="first">
                    <span>所有日期事件对比</span>
                </div>
            </div>
        </div>
    </div>
    <c:if test="${typeList.size()>0 }">
    <input type="hidden" id="PZLength" value="${typeList.size()}"/>
    </c:if>
    <!-- 条件tab页 st -->
    <div class="tab">
        <div class="change_box">
            <span class="ul_xl"></span>
            <span class="prev_btn none"></span>
            <span class="next_btn none"></span>
            <div class="tab_ul_box">
                <ul id="tab_ul" class="tab_ul clearfix">
                    <c:forEach items="${typeList }" var="t" varStatus="indx">
                        <c:if test="${indx.index eq 0 }">
                            <li class="active mgl-30" onclick="render(${t.configId});">${t.configName }</li>
                        </c:if>
                        <c:if test="${indx.index ne 0 }">
                            <li class="" onclick="render(${t.configId});">${t.configName }</li>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
            <c:if test="${sessionScope.LOGINUSER.roleId  != 3 }">
                <p class="manual">即时查询</p>
            </c:if>
        </div>
        <div class="tab_div">
            <!-- 遍历配置集合 -->
            <c:forEach items="${typeList }" var="t" varStatus="indx">
            <c:if test="${indx.index eq 0 }">
            <div class="tab_down show">
                </c:if>
                <c:if test="${indx.index ne 0 }">
                <div class="tab_down">
                    </c:if>
                    <ul class="tab_down_info">
                        <li class="clearfix">
                            <div class="td1 fl"><p class="time_png fl"></p><b>日期属性：</b></div>
                            <c:forEach items="${t.dateInfo }" var="tt">
                                <div class='add_date clearfix'>
                                    <div class='clearfix' style="margin-left:140px;">
                                        <div class='td2 fl b_e_date'>起止日期</div>
                                        <div class='td3_2 fl'>
                                            <label class='lab2' for=''><input class='inp_selc' name='stDates'
                                                                              type='text' readonly
                                                                              value='${tt.stDate}'/></label>
                                        </div>
                                        <div class='fl width18'></div>
                                        <div class='td3_2 fl'>
                                            <label class='lab2' for=''><input class='inp_selc' name='edDates'
                                                                              type='text' readonly
                                                                              value='${tt.edDate}'/></label>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <div>
                                <div class="high_search" style="margin-top: -40px;">高级查询</div>
                            </div>
                        </li>
                        <!-- 数据源 -->
                        <!-- 根据是否为二次回溯显示或隐藏数据源 -->
                        <c:if test="${t.relationId == undefined || t.relationId == null }">
                            <li class="clearfix"><!-- style="height:31px;" -->
                                <div class="td1 fl"><p class="weight_png fl"></p><b>数据源：</b></div>
                                <div class="td5_event fl"><input class="dataSourceType1" type="radio"
                                                                 onclick="return false"
                                <c:if test="${t.dataSourceType eq 1}"> checked="checked"</c:if> value="1"><label
                                        for="radio1"> 数据源一</label></div>
                                <div class="td5_event fl"><input class="dataSourceType2" type="radio"
                                                                 onclick="return false"
                                <c:if test="${t.dataSourceType eq 2}"> checked="checked"</c:if> value="2"><label
                                        for="radio2"> 数据源二</label></div>
                                <div class="td5_event fl"><input class="dataSourceType3" type="radio"
                                                                 onclick="return false"
                                <c:if test="${t.dataSourceType eq 3}"> checked="checked"</c:if> value="3"><label
                                        for="radio3"> 数据源三</label></div>
                            </li>
                        </c:if>
                        <!-- 权重依据 -->
                        <li class="clearfix">
                            <div class="td1 fl"><p class="ids_png fl"></p><b>权重依据：</b></div>
                            <div class="td5_event fl"><input type="radio" onclick="return false"
                                                             name="weightFlag${t.configId }"
                            <c:if test="${t.weightFlag eq 1}"> checked="checked"</c:if> value="1"><label for="radio1">
                                事件数 </label></div>
                            <div class="td5_event fl"><input type="radio" onclick="return false"
                                                             name="weightFlag${t.configId }"
                            <c:if test="${t.weightFlag eq 2}"> checked="checked"</c:if> value="2"><label for="radio2">
                                文章数 </label></div>
                            <div class="td5_event fl"><input type="radio" onclick="return false"
                                                             name="weightFlag${t.configId }"
                            <c:if test="${t.weightFlag eq 3}"> checked="checked"</c:if> value="3"><label for="radio2">
                                信源数 </label></div>
                            <div class="td5_event fl"><input type="radio" onclick="return false"
                                                             name="weightFlag${t.configId }"
                            <c:if test="${t.weightFlag eq 4}"> checked="checked"</c:if> value="4"><label for="radio2">
                                事件数(去重) </label></div>
                        </li>
                        <div class="ulli">
                            <li class="clearfix zindex99">
                                <div class="td1 fl"><p class="people_png fl"></p><b>角色属性：</b></div>
                                <div class=" fl clearfix">
                                    <div class="td2_2 fl"><span class="span1">角色1</span></div>
                                    <div class="clearfix event_condtion4_two">
                                        <!-- "国家"角色属性值 -->
                                        <div class="fl guojiatb" style="width: 66px;margin-left: -10px;">国家(地区)
                                        </div>
                                        <div class="fl width138 clearfix">
                                            <div class="td3 fl">
												<span class="span_huixian ${indx.index}newJJ1">
														<c:forEach items="${t.actorInfo }" var="m">
                                                            ${m.actor1Countrycode}
                                                        </c:forEach>
												</span>
                                            </div>
                                        </div>
                                        <!-- "组织名"角色属性 -->
                                        <div class="fl bianmatb" style="width: 62px;">组织</div>
                                        <div class="fl width138 clearfix">
                                            <div class="td3 fl">
												<span class="span_huixian ${indx.index}newJJ2">
														<c:forEach items="${t.actorInfo }" var="m">
                                                            ${m.organizationcodeactor1}
                                                        </c:forEach>
												</span>
                                            </div>
                                        </div>

                                        <!-- "宗教1"角色属性 -->
                                        <div class="fl bianmatb">宗教1</div>
                                        <div class="fl width138 clearfix">
                                            <div class="td3 fl">
												<span class="span_huixian ${indx.index}newJJ3">
														<c:forEach items="${t.actorInfo }" var="m">
                                                            ${m.religion1CodeActor1}
                                                        </c:forEach>
												</span>
                                            </div>
                                        </div>

                                        <!-- "宗教2"角色属性 -->
                                        <div class="fl bianmatb">宗教2</div>
                                        <div class="fl width138 clearfix">
                                            <div class="td3 fl">
												<span class="span_huixian ${indx.index}newJJ4">
														 <c:forEach items="${t.actorInfo }" var="m">
                                                             ${m.religion2CodeActor1}
                                                         </c:forEach>
												</span>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="clearfix event_condtion4_one">
                                        <!-- "种族"角色属性 -->
                                        <div class="fl bianmatb">种族</div>
                                        <div class="fl width138 clearfix">
                                            <div class="td3 fl">
												<span class="span_huixian ${indx.index}newJJ5">
														<c:forEach items="${t.actorInfo }" var="m">
                                                            ${m.ethnicCodeactor1}
                                                        </c:forEach>
												</span>
                                            </div>
                                        </div>


                                        <!-- "种类1"角色属性 -->
                                        <div class="fl bianmatb" style="width: 62px;">种类1</div>
                                        <div class="fl width138 clearfix">
                                            <div class="td3 fl">
												<span class="span_huixian ${indx.index}newJJ6">
														 <c:forEach items="${t.actorInfo }" var="m">
                                                             ${m.typeCode1actor1}
                                                         </c:forEach>
												</span>
                                            </div>
                                        </div>


                                        <!-- "种类2"角色属性 -->
                                        <div class="fl bianmatb">种类2</div>
                                        <div class="fl width138 clearfix">
                                            <div class="td3 fl">
												<span class="span_huixian ${indx.index}newJJ7">
														<c:forEach items="${t.actorInfo }" var="m">
                                                            ${m.typeCode2actor1}
                                                        </c:forEach>
												</span>
                                            </div>
                                        </div>


                                        <!-- "种类3"角色属性 -->
                                        <div class="fl bianmatb">种类3</div>
                                        <div class="fl width138 clearfix">
                                            <div class="td3 fl">
												<span class="span_huixian ${indx.index}newJJ8">
														<c:forEach items="${t.actorInfo }" var="m">
                                                            ${m.typeCode3actor1}
                                                        </c:forEach>
												</span>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 角色一地理类型下拉框 -->
                                    <div class="clearfix event_condtion4_one">

                                        <div class="fl bianmatb">地理类型</div>
                                        <div class="fl width138 clearfix">
                                            <div class="td3 fl">
											<span class="span_huixian">
												<c:forEach items="${t.eventGeoDl }" var="tt">
                                                    ${tt.actor1Geographictype==1?'国家(地区)':tt.actor1Geographictype==2?'州省':tt.actor1Geographictype==3?'城市':''}
                                                </c:forEach>
											</span>
                                            </div>
                                        </div>
                                        <div class="clearfix event_condtion4_one">
                                            <!-- 角色1地理位置-国家-->
                                            <div class="fl guojiatb" style="margin-top: -10px;width: 62px;">国家/州省
                                            </div>
                                            <div class="fl width138 clearfix" style="margin-top: -9px;">
                                                <div class="td3 fl">
													<span class="span_huixian ${indx.index}newJJ9">
															<c:forEach items="${t.actorInfo }" var="m">
                                                                ${m.geographyCountryactor1}
                                                            </c:forEach>
													</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tishi_tb">逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用(
                                            )表示一个主体优先级,例如 (A && B && !D)||C
                                        </div>
                                        <div style="margin-left: -7px;width: 63px;float: left;padding-top: 1px;">
                                            地理全称
                                        </div>
                                        <div class="radio_box">
										<span class="condition_info_graph_ids2 fl"
                                              style="width: 500px;margin-left: 4px;" id="eventKeyWordactor1"
                                              name="eventKeyWordactor1">
                                                ${t.eventKeyWords.keywordsactor1}
                                        </span>
                                        </div>
                                        <div style="margin-left: 10px;float: left;"><input type="checkbox"
                                                                                           onclick="return false;"
                                                                                           style="vertical-align: middle;margin: 0 0 0 0;"
                                                                                           value="0" <c:if
                                                test="${t.eventKeyWords.eventKeyWordactor1IsBig eq 0}"> checked</c:if>>区分大小写
                                        </div>
                                    </div>

                                    <div class=" fl clearfix">
                                        <div class="clearfix event_condtion4_three">
                                            <div class="td2_2 fl"><span class="span1">角色2</span></div>
                                            <!-- "国家"角色属性值 -->
                                            <div class="fl guojiatb" style="width: 66px;margin-left: -10px;">
                                                国家(地区)
                                            </div>
                                            <div class="fl width138 clearfix">
                                                <div class="td3 fl">
												<span class="span_huixian ${indx.index}newJJ10">
														<c:forEach items="${t.actorInfo }" var="m">
                                                            ${m.actor2Countrycode}
                                                        </c:forEach>
												</span>
                                                </div>
                                            </div>

                                            <!-- "组织名"角色属性 -->
                                            <div class="fl bianmatb" style="width: 62px;">组织</div>
                                            <div class="fl width138 clearfix">
                                                <div class="td3 fl">
												<span class="span_huixian ${indx.index}newJJ11">
														<c:forEach items="${t.actorInfo }" var="m">
                                                            ${m.organizationcodeactor2}
                                                        </c:forEach>
												</span>
                                                </div>
                                            </div>

                                            <!-- "宗教1"角色属性 -->
                                            <div class="fl bianmatb">宗教1</div>
                                            <div class="fl width138 clearfix">
                                                <div class="td3 fl">
												<span class="span_huixian ${indx.index}newJJ12">
														<c:forEach items="${t.actorInfo }" var="m">
                                                            ${m.religion1CodeActor2}
                                                        </c:forEach>
												</span>
                                                </div>
                                            </div>


                                            <!-- "宗教2"角色属性 -->
                                            <div class="fl bianmatb">宗教2</div>
                                            <div class="fl width138 clearfix">
                                                <div class="td3 fl">
												<span class="span_huixian ${indx.index}newJJ13">
														<c:forEach items="${t.actorInfo }" var="m">
                                                            ${m.religion2CodeActor2}
                                                        </c:forEach>
												</span>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="clearfix event_condtion4_one">
                                            <!-- "种族"角色属性 -->
                                            <div class="fl bianmatb">种族</div>
                                            <div class="fl width138 clearfix">
                                                <div class="td3 fl">
												<span class="span_huixian ${indx.index}newJJ14">
														<c:forEach items="${t.actorInfo }" var="m">
                                                            ${m.ethnicCodeactor2}
                                                        </c:forEach>
												</span>
                                                </div>
                                            </div>
                                            <!-- "种类1"角色属性 -->
                                            <div class="fl bianmatb" style="width: 62px;">种类1</div>
                                            <div class="fl width138 clearfix">
                                                <div class="td3 fl">
												<span class="span_huixian ${indx.index}newJJ15">
														<c:forEach items="${t.actorInfo }" var="m">
                                                            ${m.typeCode1actor2}
                                                        </c:forEach>
												</span>
                                                </div>
                                            </div>
                                            <!-- "种类2"角色属性 -->
                                            <div class="fl bianmatb">种类2</div>
                                            <div class="fl width138 clearfix">
                                                <div class="td3 fl">
												<span class="span_huixian ${indx.index}newJJ16">
														<c:forEach items="${t.actorInfo }" var="m">
                                                            ${m.typeCode2actor2}
                                                        </c:forEach>
												</span>
                                                </div>
                                            </div>

                                            <!-- "种类3"角色属性 -->
                                            <div class="fl bianmatb">种类3</div>
                                            <div class="fl width138 clearfix">
                                                <div class="td3 fl">
												<span class="span_huixian ${indx.index}newJJ17">
														<c:forEach items="${t.actorInfo }" var="m">
                                                            ${m.typeCode3actor2}
                                                        </c:forEach>
												</span>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 角色二地理类型下拉框 -->
                                        <div class="clearfix event_condtion4_one">

                                            <div class="fl guojiatb">地理类型</div>
                                            <div class="fl width138 clearfix">
                                                <div class="td3 fl">
													<span class="span_huixian">
														<c:forEach items="${t.eventGeoDl }" var="tt">
                                                            ${tt.actor2Geographictype==1?'国家(地区)':tt.actor2Geographictype==2?'州省':tt.actor2Geographictype==3?'城市':''}
                                                        </c:forEach>
													</span>
                                                </div>
                                            </div>
                                            <div class="clearfix event_condtion4_one">
                                                <!-- 角色2地理位置-国家-->
                                                <div class="fl guojiatb" style="margin-top: -10px;width: 62px;">
                                                    国家/州省
                                                </div>
                                                <div class="fl width138 clearfix" style="margin-top: -9px;">
                                                    <div class="td3 fl">
															<span class="span_huixian ${indx.index}newJJ18">
																	<c:forEach items="${t.actorInfo }" var="m">
                                                                        ${m.geographyCountryactor2}
                                                                    </c:forEach>
															</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tishi_tb">逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用(
                                                )表示一个主体优先级,例如 (A && B && !D)||C
                                            </div>
                                            <div style="margin-left: -7px;width: 63px;float: left;padding-top: 1px;">
                                                地理全称
                                            </div>
                                            <div class="radio_box">
												<span class="condition_info_graph_ids2 fl"
                                                      style="width: 500px;margin-left: 4px;" id="eventKeyWordactor2">
                                                        ${t.eventKeyWords.keywordsactor2}
                                                </span>
                                            </div>
                                            <div style="margin-left: 10px;float: left;"><input type="checkbox"
                                                                                               onclick="return false;"
                                                                                               style="vertical-align: middle;margin: 0 0 0 0;"
                                                                                               value="0" <c:if
                                                    test="${t.eventKeyWords.eventKeyWordactor2IsBig eq 0}">
                                                                                               checked</c:if>>区分大小写
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="clearfix" id="eventProperty">
                                <div class="td1 fl"><p class="event_property_png fl"></p><b class="sjsx">事件属性：</b>
                                </div>
                                <div class=" fl clearfix">
                                    <div class="td2_2 fl"><span class="span1">类型</span></div>
                                    <div class="clearfix event_condtion4_two">
                                        <!--大类-->
                                        <div class="fl guojiatb">大类</div>
                                        <div class="fl width138 clearfix">
                                            <div class="td3 fl">
												<span class="span_huixian ${indx.index}newJJ19">
														<c:forEach items="${t.eventInfo }" var="m">
                                                            ${m.quadClassData}
                                                        </c:forEach>
												</span>
                                            </div>
                                        </div>
                                        <input type="hidden" name="eventAttrs" value="1"/>

                                        <!-- 根类 -->
                                        <div class="fl bianmatb" style="width: 62px;">根类</div>
                                        <div class="fl width138 clearfix">
                                            <div class="td3 fl">
											<span class="span_huixian ${indx.index}newJJ20">
													<c:forEach items="${t.eventInfo }" var="m">
                                                        ${m.rootEventData}
                                                    </c:forEach>
											</span>
                                            </div>
                                        </div>

                                        <!-- 基类 -->
                                        <div class="fl bianmatb">基类</div>
                                        <div class="fl width138 clearfix">
                                            <div class="td3 fl">
											<span class="span_huixian ${indx.index}newJJ21">
												<c:forEach items="${t.eventInfo }" var="m">
                                                    ${m.baseEventData}
                                                </c:forEach>
											</span>
                                            </div>
                                        </div>

                                        <!-- 全事件 -->
                                        <div class="fl bianmatb">子类</div>
                                        <div class="fl width138 clearfix">
                                            <div class="td3 fl">
											<span class="span_huixian ${indx.index}newJJ22">
													<c:forEach items="${t.eventInfo }" var="m">
                                                        ${m.codeEventData}
                                                    </c:forEach>
											</span>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 发生地 -->
                                    <div class="clearfix">
                                        <div class="clearfix event_condtion4_three">
                                            <div class="td2_2 fl"><span class="span1">发生地</span></div>
                                            <!-- 发生地国家 -->
                                            <div class="fl bianmatb">地理类型</div>
                                            <div class="fl width138 clearfix">
                                                <div class="td3 fl">
												<span class="span_huixian">
													<c:forEach items="${t.eventGeoDl }" var="tt">
                                                        ${tt.geographictype==1?'国家(地区)':tt.geographictype==2?'州省':tt.geographictype==3?'城市':''}
                                                    </c:forEach>
												</span>
                                                </div>
                                            </div>
                                            <div class="fl guojiatb" style="width: 62px;">国家/州省</div>
                                            <div class="fl width138 clearfix">
                                                <div class="td3 fl">
												<span class="span_huixian ${indx.index}newJJ23">
														<c:forEach items="${t.eventInfo }" var="m">
                                                            ${m.geographyCountryactor}
                                                        </c:forEach>
												</span>
                                                </div>
                                            </div>
                                            <div style="margin-bottom:2px;margin-top: 27px;margin-left: 143px;">
                                                逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用(
                                                )表示一个主体优先级,例如 (A && B && !D)||C
                                            </div>
                                            <div style="float: left;margin-left: 87px;">地理全称</div>
                                            <div class="radio_box clearfix">
											<span class="condition_info_graph_ids2 fl"
                                                  style="width: 500px;margin-left: 6px;" id="eventKeyWordactor">
                                                    ${t.eventKeyWords.keywordsactor}
                                            </span>
                                                <div style="margin-left: 10px;float: left;"><input type="checkbox"
                                                                                                   onclick="return false;"
                                                                                                   style="vertical-align: middle;margin: 0 0 0 0;"
                                                                                                   value="0" <c:if
                                                        test="${t.eventKeyWords.eventKeyWordactorIsBig eq 0}">
                                                                                                   checked</c:if>>区分大小写
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 其他 -->
                                        <div class=" fl clearfix">
                                            <div class="clearfix event_condtion4_three">
                                                <div class="td2_2 fl"><span class="span1">其他</span></div>
                                                <div class="fl bianmatb">源URL</div>
                                                <div class="fl width138 clearfix">
                                                    <div class="td3 fl">
												<span class="span_huixian">
													<c:forEach items="${t.eventInfo }" var="m">
                                                        ${m.sourceUrl }
                                                    </c:forEach>
												</span>
                                                    </div>
                                                </div>

                                                <div class="fl bianmatb">情感值</div>
                                                <div class="fl width138 clearfix">
                                                    <div class="fl width138">
												<span class="default_span fl ${indx.index}newNUM1">
													<c:forEach items="${t.eventInfo }" var="m">
                                                        ${m.stavgTone}
                                                    </c:forEach>
												</span>
                                                        <span class="fl">—</span>
                                                        <span class="default_span fl ${indx.index}newNUM2">
													<c:forEach items="${t.eventInfo }" var="m">
                                                        ${m.edavgTone}
                                                    </c:forEach>
												</span>
                                                    </div>
                                                </div>

                                                <div class="fl bianmatb">影响度</div>
                                                <div class="fl width138 clearfix">
                                                    <div class="fl width138">
												<span class="default_span fl ${indx.index}newNUM3">
													<c:forEach items="${t.eventInfo }" var="m">
                                                        ${m.stgoldsteinScale}
                                                    </c:forEach>
												</span>
                                                        <span class="fl">—</span>
                                                        <span class="default_span fl ${indx.index}newNUM4">
													<c:forEach items="${t.eventInfo }" var="m">
                                                        ${m.edgoldsteinScale}
                                                    </c:forEach>
												</span>
                                                    </div>
                                                </div>
                                                <!-- 是否为根类 7-->
                                                <div class="fl bianmatb" style="width: 56px;">是否根类</div>
                                                <div class="width272 fl clearfix">
                                                    <div class="fl width138" style="width: 80px;">
                                                        <div class="td3 fl">
													<span class="span_huixian" style="width: 50px;">
														<c:forEach items="${t.eventInfo }" var="m">
                                                            ${m.isRoot==1?'是':m.isRoot==0?'否':''}
                                                        </c:forEach>
													</span>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </li>
                        </div>
                    </ul>
                    <!-- 各个tab的属性案例 -->
                    <div class="test_triangle_border property_case">
                        <div class="popup1 case_con">
                            <span class="tri"><em></em></span>
                            <div class="case_top">
                                <img src="<%=basePath%>/static/images/propertyCase.png"><span>属性案例</span>
                            </div>
                            <table>
                                <tr>
                                    <td><font class="sbFont">GLOBALEVENTID</font> : 454094217</td>
                                    <td><font class="sbFont">DATEADDED :</font> 20181011</td>
                                    <td><font class="sbFont">Actor1Code :</font> CAN</td>
                                    <td><font class="sbFont">Actor1Name :</font> CANADIAN</td>
                                    <td><font class="sbFont">Actor1CountryCode :</font> CAN</td>
                                </tr>
                                <tr>
                                    <td><font class="sbFont">Actor1KnownGroupCode :</font> IRC</td>
                                    <td><font class="sbFont">Actor1EthnicCode :</font> kur</td>
                                    <td><font class="sbFont">Actor1Religion1Code :</font> CHR</td>
                                    <td><font class="sbFont">Actor1Religion2Code :</font> SUN</td>
                                    <td><font class="sbFont">Actor1Type1Code :</font> UAF</td>
                                </tr>
                                <tr>
                                    <td><font class="sbFont">Actor1Type2Code :</font> HRI</td>
                                    <td><font class="sbFont">Actor1Type3Code :</font> GOV</td>
                                    <td><font class="sbFont">Actor2Code :</font> GBRGOV</td>
                                    <td><font class="sbFont">Actor2Name :</font> UNITED KINGDOM</td>
                                    <td><font class="sbFont">Actor2CountryCode :</font> GBR</td>
                                </tr>
                                <tr>
                                    <td><font class="sbFont">Actor2KnownGroupCode :</font> IRC</td>
                                    <td><font class="sbFont">Actor2EthnicCode :</font> kur</td>
                                    <td><font class="sbFont">Actor2Religion1Code :</font> CHR</td>
                                    <td><font class="sbFont">Actor2Religion2Code :</font> SUN</td>
                                    <td><font class="sbFont">Actor2Type1Code :</font> UAF</td>
                                </tr>
                                <tr>
                                    <td><font class="sbFont">Actor2Type2Code :</font> HRI</td>
                                    <td><font class="sbFont">Actor2Type3Code :</font> GOV</td>
                                    <td><font class="sbFont">IsRootEvent :</font> 1</td>
                                    <td><font class="sbFont">EventCode :</font> 35</td>
                                    <td><font class="sbFont">EventBaseCode :</font> 12</td>
                                </tr>
                                <tr>
                                    <td><font class="sbFont">EventRootCode :</font> 13</td>
                                    <td><font class="sbFont">QuadClass :</font> 3</td>
                                    <td><font class="sbFont">GoldsteinScale :</font> -6.5</td>
                                    <td><font class="sbFont">NumMentions :</font> 23</td>
                                    <td><font class="sbFont">NumSources :</font> 33</td>
                                </tr>
                                <tr>
                                    <td><font class="sbFont">NumArticles :</font> 22</td>
                                    <td><font class="sbFont">AvgTone :</font> 0.55555555555555</td>
                                    <td><font class="sbFont">Actor1Geo_Type :</font> 3</td>
                                    <td><font class="sbFont">Actor1Geo_FullName :</font> Oakland Community College,
                                        Michigan, United S
                                    </td>
                                    <td><font class="sbFont">Actor1Geo_CountryCode :</font> US</td>
                                </tr>
                                <tr>
                                    <td><font class="sbFont">Actor1Geo_ADM1Code :</font> USMI</td>
                                    <td><font class="sbFont">Actor1Geo_Lat :</font> 42.4928000</td>
                                    <td><font class="sbFont">Actor1Geo_Long :</font> -83.3705000</td>
                                    <td><font class="sbFont">Actor1Geo_FeatureID :</font> 633876</td>
                                    <td><font class="sbFont">Actor2Geo_Type :</font> 3</td>
                                </tr>
                                <tr>
                                    <td><font class="sbFont">Actor2Geo_Type :</font> 3</td>
                                    <td><font class="sbFont">Actor2Geo_FullName :</font> Oakland Community College,
                                        Michigan, United S
                                    </td>
                                    <td><font class="sbFont">Actor2Geo_CountryCode :</font> US</td>
                                    <td><font class="sbFont">Actor2Geo_ADM1Code :</font> USMI</td>
                                    <td><font class="sbFont">Actor2Geo_Lat :</font> 42.4928000</td>
                                </tr>
                                <tr>
                                    <td><font class="sbFont">Actor2Geo_Long :</font> -83.3705000</td>
                                    <td><font class="sbFont">Actor2Geo_FeatureID :</font> 633876</td>
                                    <td><font class="sbFont">ActionGeo_Type :</font> 3</td>
                                    <td><font class="sbFont">ActionGeo_FullName :</font> Oakland Community College,
                                        Michigan, United S
                                    </td>
                                    <td><font class="sbFont">ActionGeo_CountryCode :</font> US</td>
                                </tr>
                                <tr>
                                    <td><font class="sbFont">ActionGeo_ADM1Code :</font> USMI</td>
                                    <td><font class="sbFont">ActionGeo_Lat :</font> 42.4928000</td>
                                    <td><font class="sbFont">ActionGeo_Long :</font> -83.3705000</td>
                                    <td><font class="sbFont">ActionGeo_FeatureID :</font> 633876</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><font class="sbFont">SOURCEURL :</font>
                                        http://www.independent.ie/world-news/europe/calais-crisis-hits-fever-pitch-in-catandmouse-with-migrants-31419889.html
                                    </td>
                                </tr>
                            </table>
                            <div class="gjcx_al_box">
                                <table class="gjcx_al_tb">
                                    <tr>
                                        <td><font class="sbFont">关键字提示 :</font> 并 and,或 or,等于 =,不等于 !=,大于等于
                                            >=,小于等于 <=,模糊匹配 like,模糊不匹配 not like,范围查询 in,不在范围查询
                                            not in
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><font class="sbFont">案例SQL :</font> (ActionGeo_FullName like '%china%' or
                                            ActionGeo_FullName not like '%white House%') or Actor1Code not
                                            in('CAN','CHN') and ActionGeo_Type in (3,4,5)
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <textarea class="texthtml" name="customQuery" readonly>${t.customQuery}</textarea>
                        </div>
                    </div>
                </div>
                </c:forEach>
                <!-- 即时查询 -->
                <div class="tab_down people_tab_down">
                    <form id="eventQueryForm" action="../config/renGongQuery" method="post">
                        <input type="hidden" name="flid" id="RGFL">
                        <input type="hidden" name="priority" value="1"/>
                        <input type="hidden" name="configFlag" value="1"/>
                        <input type="hidden" name="configCategoriesStr" id="modelType"/>
                        <input type="hidden" name="remark" value="即时查询"/>
                        <ul class="tab_down_info">
                            <li class="clearfix">
                                <div class="date_box clearfix">
                                    <div class="td1 fl">
                                        <p class="time_png fl"></p>
                                        <b>日期属性：</b>
                                    </div>
                                    <div style="position:absolute; left:226px; top:-20px">当前数据库时间范围：<span
                                            id="stDateSpan"></span>至<span id="edDateSpan"></span></div>
                                    <div class="clearfix">
                                        <div class="td2 fl b_e_date">起止日期</div>
                                        <div class="td3_2 fl">
                                            <label class="lab2" for=""><input class="inp_selc day1" name="stDates"
                                                                              type="text" readonly
                                                                              id="stDates"/></label>
                                        </div>
                                        <div class="td3_2 fl" style="margin-right:0px;">
                                            <label class="lab2" for=""><input class="inp_selc day2" name="edDates"
                                                                              type="text" readonly
                                                                              id="edDates"/></label>
                                        </div>
                                        <div class="add_date_btn"></div>
                                        <div>
                                            <div class="high_search" style="margin-top: -3px;">高级查询</div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <!-- 数据源 -->
                            <li class="clearfix"><!-- style="height:31px;" -->
                                <div class="td1 fl"><p class="weight_png fl"></p><b>数据源：</b></div>
                                <div class="td5_event fl"><input class="dataSourceType1" id="radios1" type="radio"
                                                                 name="dataSourceType" checked="checked"
                                                                 value="1"><label for="radios1"> 数据源一</label></div>
                                <div class="td5_event fl"><input class="dataSourceType2" id="radios2" type="radio"
                                                                 name="dataSourceType" value="2"><label for="radios2">
                                    数据源二</label></div>
                                <div class="td5_event fl"><input class="dataSourceType3" id="radios3" type="radio"
                                                                 name="dataSourceType" value="3"><label for="radios3">
                                    数据源三</label></div>
                            </li>
                            <!-- 权重依据 -->
                            <li class="clearfix">
                                <div class="td1 fl"><p class="ids_png fl"></p><b>权重依据：</b></div>
                                <div class="td5_event fl"><input id="radio1" type="radio" name="weightFlag"
                                                                 checked="checked" value="1"><label for="radio1">
                                    事件数</label></div>
                                <div class="td5_event fl"><input id="radio2" type="radio" name="weightFlag"
                                                                 value="2"><label for="radio2"> 文章数</label></div>
                                <div class="td5_event fl"><input id="radio3" type="radio" name="weightFlag"
                                                                 value="3"><label for="radio3"> 信源数</label></div>
                                <div class="td5_event fl"><input id="radio4" type="radio" name="weightFlag"
                                                                 value="4"><label for="radio4"> 事件数(去重)</label>
                                </div>
                            </li>
                            <div class="ulli">
                                <li class="clearfix zindex99" id="actorModel">
                                    <div class="td1 fl"><p class="people_png fl"></p><b>角色属性：</b></div>
                                    <div class="fl clearfix">
                                        <div class="td2_2 fl"><span class="span1">角色1</span></div>
                                        <div class="clearfix event_condtion4_two">
                                            <!-- "国家"角色属性值 -->
                                            <div class="fl guojiatb" style="width: 66px;margin-left: -10px;">
                                                国家(地区)
                                            </div>
                                            <div class="width-150 fl" id="actor1Countrycode"></div>
                                            <input type="hidden" id="countrycodeactor1" name="countrycodeactor1"/>
                                            <input type="hidden" name="actor1Attrs" value="1"/>
                                            <!-- "组织名"角色属性 -->
                                            <div class="fl bianmatb" style="width: 62px;">组织</div>
                                            <div class="fl clearfix">
                                                <div class="width-150 fl" id="actor1organizationcode"></div>
                                                <input type="hidden" id="organizationcodeactor1"
                                                       name="organizationcodeactor1"/>
                                            </div>
                                            <input type="hidden" name="actor1Attrs" value="2"/>

                                            <!-- "宗教1"角色属性 -->
                                            <div class="fl bianmatb">宗教1</div>
                                            <div class="fl clearfix">
                                                <div class="width-150 fl" id="actor1Religion1Code1"></div>
                                                <input type="hidden" id="religion1CodeActor1"
                                                       name="religion1CodeActor1"/>
                                            </div>
                                            <input type="hidden" name="actor1Attrs" value="3"/>
                                            <!-- "宗教2"角色属性 -->
                                            <div class="fl bianmatb">宗教2</div>
                                            <div class="fl clearfix">
                                                <div class="width-150 fl" id="actor1Religion1Code2"></div>
                                                <input type="hidden" id="religion2CodeActor1"
                                                       name="religion2CodeActor1"/>
                                            </div>
                                            <input type="hidden" name="actor1Attrs" value="4"/>
                                        </div>
                                        <div class="clearfix" style=" margin-left:82px; margin-top:10px;">
                                            <!-- "种族"角色属性 -->
                                            <div class="fl bianmatb">种族</div>
                                            <div class="fl clearfix">
                                                <div class="width-150 fl" id="actor1EthnicCode"></div>
                                                <input type="hidden" id="ethnicCodeactor1" name="ethnicCodeactor1"/>
                                            </div>
                                            <input type="hidden" name="actor1Attrs" value="5"/>
                                            <!-- "种类1"角色属性 -->
                                            <div class="fl bianmatb" style="width: 62px;">种类1</div>
                                            <div class="fl clearfix">
                                                <div class="width-150 fl" id="actor1TypeCode1"></div>
                                                <input type="hidden" id="typeCode1actor1" name="typeCode1actor1"/>
                                            </div>
                                            <input type="hidden" name="actor1Attrs" value="6"/>
                                            <!-- "种类2"角色属性 -->
                                            <div class="fl bianmatb">种类2</div>
                                            <div class="fl clearfix">
                                                <div class="width-150 fl" id="actor1TypeCode2"></div>
                                                <input type="hidden" id="typeCode2actor1" name="typeCode2actor1"/>
                                            </div>
                                            <input type="hidden" name="actor1Attrs" value="7"/>
                                            <!-- "种类3"角色属性 -->
                                            <div class="fl bianmatb">种类3</div>
                                            <div class="fl clearfix">
                                                <div class="width-150 fl" id="actor1TypeCode3"></div>
                                                <input type="hidden" id="typeCode3actor1" name="typeCode3actor1"/>
                                            </div>
                                            <input type="hidden" name="actor1Attrs" value="8"/>
                                        </div>
                                        <!-- 角色一地理类型下拉框 -->
                                        <div class="clearfix event_condtion4_one">

                                            <div class="fl guojiatb">地理类型</div>
                                            <div class="fl clearfix">
                                                <div class="dowebok26 width-150">
                                                    <select id="actor1Geographictype" name="actor1Geographictype">
                                                        <option value="0" selected="selected">请选择</option>
                                                        <option value="1">国家(地区)</option>
                                                        <option value="2">州省</option>
                                                        <option value="3">城市</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="clearfix event_condtion4_two">
                                                <!-- 角色1地理位置-国家-->
                                                <div class="fl guojiatb" style="width: 62px;">国家/州省</div>
                                                <div id="actor1geographyCountry" class="width-150"></div>
                                                <input type="hidden" id="geographyCountryactor1"
                                                       name="geographyCountryactor1"/>
                                            </div>
                                            <div class="tishi_tb_js">逻辑运算符:&&表示"且", || 表示"或", !
                                                (英文)表示"非",可以用( )表示一个主体优先级,例如 (A && B && !D)||C
                                            </div>
                                            <div style="margin-left: -7px;width: 63px;float: left;padding-top: 1px;">
                                                地理全称
                                            </div>
                                            <div class="radio_box">
                                                <input class="condition_info_graph_ids2 fl" style="width: 500px;"
                                                       type="text" id="eventKeyWordactor1" name="eventKeyWordactor1"
                                                       onblur="validateKeyWords(this)"/>
                                                <span id="keywordSpanactor1"
                                                      style="position:relative;left:20px;width:40px;color: red"></span>
                                            </div>
                                            <div style="margin-left: 10px;float: left;"><input type="checkbox"
                                                                                               style="vertical-align: middle;margin: 0 0 0 0;"
                                                                                               value="0" checked
                                                                                               name="eventKeyWordactor1IsBig">区分大小写
                                            </div>
                                        </div>
                                        <div class="fl clearfix">
                                            <div class="clearfix event_condtion4_three">
                                                <div class="td2_2 fl"><span class="span1">角色2</span></div>
                                                <!-- "国家"角色属性值 -->
                                                <div class="fl guojiatb" style="width: 66px;margin-left: -10px;">
                                                    国家(地区)
                                                </div>
                                                <div class="fl clearfix">
                                                    <div class="width-150 fl" id="actor2Countrycode"></div>
                                                    <input type="hidden" id="countrycodeactor2"
                                                           name="countrycodeactor2"/>
                                                </div>
                                                <input type="hidden" name="actor2Attrs" value="1"/>
                                                <!-- "组织名"角色属性 -->
                                                <div class="fl bianmatb" style="width: 62px;">组织</div>
                                                <div class="fl clearfix">
                                                    <div class="width-150 fl" id="actor2organizationcode"></div>
                                                    <input type="hidden" id="organizationcodeactor2"
                                                           name="organizationcodeactor2"/>
                                                </div>
                                                <input type="hidden" name="actor2Attrs" value="2"/>

                                                <!-- "宗教1"角色属性 -->
                                                <div class="fl bianmatb">宗教1</div>
                                                <div class="fl clearfix">
                                                    <div class="width-150 fl" id="actor2Religion1Code1"></div>
                                                    <input type="hidden" id="religion1CodeActor2"
                                                           name="religion1CodeActor2"/>
                                                </div>
                                                <input type="hidden" name="actor2Attrs" value="3"/>

                                                <!-- "宗教2"角色属性 -->
                                                <div class="fl bianmatb">宗教2</div>
                                                <div class="fl clearfix">
                                                    <div class="width-150 fl" id="actor2Religion1Code2"></div>
                                                    <input type="hidden" id="religion2CodeActor2"
                                                           name="religion2CodeActor2"/>
                                                </div>
                                                <input type="hidden" name="actor2Attrs" value="4"/>
                                            </div>
                                            <div class="clearfix event_condtion4_one">
                                                <!-- "种族"角色属性 -->
                                                <div class="fl bianmatb">种族</div>
                                                <div class="fl clearfix">
                                                    <div class="width-150 fl" id="actor2EthnicCode"></div>
                                                    <input type="hidden" id="ethnicCodeactor2" name="ethnicCodeactor2"/>
                                                </div>
                                                <input type="hidden" name="actor2Attrs" value="5"/>
                                                <!-- "种类1"角色属性 -->
                                                <div class="fl bianmatb" style="width: 62px;">种类1</div>
                                                <div class="fl clearfix">
                                                    <div class="width-150 fl" id="actor2TypeCode1"></div>
                                                    <input type="hidden" id="typeCode1actor2" name="typeCode1actor2"/>
                                                </div>
                                                <input type="hidden" name="actor2Attrs" value="6"/>
                                                <!-- "种类2"角色属性 -->
                                                <div class="fl bianmatb">种类2</div>
                                                <div class="fl clearfix">
                                                    <div class="width-150 fl" id="actor2TypeCode2"></div>
                                                    <input type="hidden" id="typeCode2actor2" name="typeCode2actor2"/>
                                                </div>
                                                <input type="hidden" name="actor2Attrs" value="7"/>
                                                <!-- "种类3"角色属性 -->
                                                <div class="fl bianmatb">种类3</div>
                                                <div class="fl clearfix">
                                                    <div class="width-150 fl" id="actor2TypeCode3"></div>
                                                    <input type="hidden" id="typeCode3actor2" name="typeCode3actor2"/>
                                                </div>
                                                <input type="hidden" name="actor2Attrs" value="8"/>
                                            </div>
                                            <!-- 角色二地理类型下拉框 -->
                                            <div class="clearfix event_condtion4_one">

                                                <div class="fl guojiatb">地理类型</div>
                                                <div class="fl clearfix">
                                                    <div class="dowebok28 width-150">
                                                        <select id="actor2Geographictype" name="actor2Geographictype">
                                                            <option value="0" selected="selected">请选择</option>
                                                            <option value="1">国家(地区)</option>
                                                            <option value="2">州省</option>
                                                            <option value="3">城市</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="clearfix event_condtion4_two">
                                                    <!-- 角色2地理位置-国家-->
                                                    <div class="fl guojiatb" style="width: 62px;">国家/州省</div>
                                                    <div class="width-150" id="actor2geographyCountry"></div>
                                                    <input type="hidden" id="geographyCountryactor2"
                                                           name="geographyCountryactor2"/>
                                                </div>
                                                <div class="tishi_tb_js">逻辑运算符:&&表示"且", || 表示"或", !
                                                    (英文)表示"非",可以用( )表示一个主体优先级,例如 (A && B && !D)||C
                                                </div>
                                                <div style="margin-left: -7px;width: 63px;float: left;padding-top: 1px;">
                                                    地理全称
                                                </div>
                                                <div class="radio_box">
                                                    <input class="condition_info_graph_ids2 fl" style="width: 500px;"
                                                           type="text" id="eventKeyWordactor2" name="eventKeyWordactor2"
                                                           onblur="validateKeyWords(this)"/>
                                                    <span id="keywordSpanactor2"
                                                          style="position:relative;left:20px;width:40px;color: red"></span>
                                                </div>
                                                <div style="margin-left: 10px;float: left;"><input type="checkbox"
                                                                                                   style="vertical-align: middle;margin: 0 0 0 0;"
                                                                                                   value="0" checked
                                                                                                   name="eventKeyWordactor2IsBig">区分大小写
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </li>
                                <!-- 事件属性 -->
                                <li class="clearfix" id="eventProperty">
                                    <div class="td1 fl"><p class="event_property_png fl"></p><b
                                            style="line-height:15px;">事件属性：</b></div>
                                    <div class="fl clearfix" style="width:954px;">
                                        <div class="td2_2 fl"><span class="span1">类型</span></div>
                                        <div class="clearfix fl">
                                            <!-- 大类-->
                                            <div class="fl guojiatb">大类</div>
                                            <div class="fl clearfix">
                                                <div class="width-150 fl" id="quadClass"></div>
                                                <input type="hidden" id="quadClassData" name="quadClassData"/>
                                            </div>
                                            <input type="hidden" name="eventAttrs" value="1"/>
                                            <!-- 根类 -->
                                            <div class="fl bianmatb" style="width: 62px;">根类</div>
                                            <div class="fl clearfix">
                                                <div class="width-150 fl" id="rootEvent"></div>
                                                <input type="hidden" id="rootEventData" name="rootEventData"/>
                                            </div>
                                            <input type="hidden" name="eventAttrs" value="2"/>

                                            <!-- 基类 -->
                                            <div class="fl bianmatb">基类</div>
                                            <div class="fl clearfix">
                                                <div class="width-150 fl" id="baseEvent"></div>
                                                <input type="hidden" id="baseEventData" name="baseEventData"/>
                                            </div>
                                            <input type="hidden" name="eventAttrs" value="3"/>

                                            <!-- 全事件 -->
                                            <div class="fl bianmatb">全事件</div>
                                            <div class="fl clearfix">
                                                <div class="width-150 fl" id="eventCode"></div>
                                                <input type="hidden" id="codeEventData" name="codeEventData"/>
                                            </div>
                                            <input type="hidden" name="eventAttrs" value="4"/>
                                        </div>
                                        <!-- 发生地 -->
                                        <div class="fl clearfix" style="margin-left: -82px;">
                                            <div class="clearfix fl event_condtion4_three">
                                                <div class="td2_2 fl"><span class="span1">发生地</span></div>
                                                <div class="fl guojiatb">地理类型</div>
                                                <div class="fl clearfix">
                                                    <div class="dowebok29 width-150">
                                                        <select id="actorGeographictype" name="Geographictype">
                                                            <option value="0" selected="selected">请选择</option>
                                                            <option value="1">国家(地区)</option>
                                                            <option value="2">州省</option>
                                                            <option value="3">城市</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <!-- 发生地国家 -->
                                                <div class="fl guojiatb" style="width: 62px;">国家/州省</div>
                                                <div class="fl clearfix">
                                                    <div class="width-150" id="actorgeographyCountry"></div>
                                                    <input type="hidden" id="geographyCountryactor"
                                                           name="geographyCountryactor"/>
                                                </div>
                                                <input type="hidden" name="eventAttrs" value="6"/>
                                                <div style="margin-bottom:2px;margin-top: 38px;margin-left: 139px;">
                                                    逻辑运算符:&&表示"且", || 表示"或", ! (英文)表示"非",可以用(
                                                    )表示一个主体优先级,例如 (A && B && !D)||C
                                                </div>
                                                <div style="float: left;margin-left: 87px;">地理全称</div>
                                                <div class="fl">
                                                    <input class="condition_info_graph_ids2 fl"
                                                           style="width: 500px;margin-left: 3px;" type="text"
                                                           id="eventKeyWordactor" name="eventKeyWordactor"
                                                           onblur="validateKeyWords(this)"/>
                                                    <span id="keywordSpanactor"
                                                          style="position:relative;left:20px;width:40px;color: red"></span>
                                                </div>
                                                <div style="margin-left: 10px;float: left;"><input type="checkbox"
                                                                                                   style="vertical-align: middle;margin: 0 0 0 0;"
                                                                                                   value="0" checked
                                                                                                   name="eventKeyWordactorIsBig">区分大小写
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 其他 -->
                                        <div class="fl clearfix">
                                            <div class="clearfix fl event_condtion4_three">
                                                <div class="td2_2 fl"><span class="span1">其他</span></div>
                                                <!-- 源URL -->
                                                <div class="fl bianmatb">源URL</div>
                                                <div class="fl clearfix">
                                                    <div class="fl width-150">
                                                        <input type="hidden" name="eventAttrs" value="8"/>
                                                        <input class="default_input2" id="eventAttr8"
                                                               style="width: 150px;" type="text" name="eventAttrValues"
                                                               value=""/>
                                                    </div>
                                                </div>
                                                <!-- 情感值 -->
                                                <div class="fl bianmatb">情感值</div>
                                                <div class="fl width116 clearfix">
                                                    <div class="fl width116">
                                                        <input type="hidden" name="eventAttrs" value="9"/>
                                                        <input style="width:50px;" id="eventAttr9"
                                                               class="default_input2 fl" type="text" value="-100"
                                                               name="eventAttrValues" onblur="validateEventAttr9()"/>
                                                        <span class="fl">—</span>
                                                        <input type="hidden" name="eventAttrs" value="10"/>
                                                        <input style="width:50px;" id="eventAttr10"
                                                               class="default_input2 fl" type="text" value="100"
                                                               name="eventAttrValues" onblur="validateEventAttr10()"/>
                                                        <span id="spang" style="display:none;float: right;"><img
                                                                src="<%=basePath %>/static/images/delete.png"
                                                                style="margin-top: -2px;"></img></span>
                                                    </div>
                                                </div>
                                                <!-- 影响度 -->
                                                <div class="fl bianmatb">影响度</div>
                                                <div class="fl width116 clearfix">
                                                    <div class="fl width116">
                                                        <input type="hidden" name="eventAttrs" value="11"/>
                                                        <input style="width:42px;" id="eventAttr11"
                                                               class="default_input2 fl" type="text" value="-10"
                                                               name="eventAttrValues" onblur="validateEventAttr11()"/>
                                                        <span class="fl">—</span>
                                                        <input type="hidden" name="eventAttrs" value="12"/>
                                                        <input style="width:42px;" id="eventAttr12"
                                                               class="default_input2 fl" type="text" value="10"
                                                               name="eventAttrValues" onblur="validateEventAttr12()"/>
                                                        <span id="spanh" style="display:none;float: right;"><img
                                                                src="<%=basePath %>/static/images/delete.png"
                                                                style="margin-top: -2px;"></img></span>
                                                    </div>
                                                </div>
                                                <!-- 是否为根类 -->
                                                <div class="fl bianmatb">是否根类</div>
                                                <div class="fl clearfix">
                                                    <div class="fl width116" style="width:80px;">
                                                        <div class="dowebok19 sec_gen">
                                                            <input type="hidden" name="eventAttrs" value="7"/>
                                                            <select name="eventAttrValues" id="eventAttr7">
                                                                <option value="-1" selected="selected">请选择</option>
                                                                <option value="0">否</option>
                                                                <option value="1">是</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="clearfix">
                                    <div class="fr">
                                        <div style=" float:left; margin-right:10px; margin-top:4px;">保存配置：<input
                                                class="artificial_radio oldRadio" name="isSaveConfig" id="isSaveConfig"
                                                value="0" type="radio" onclick="$('#rgConfigName').show()">是<input
                                                class="artificial_radio oldRadio" type="radio" name="isSaveConfig"
                                                value="1" checked onclick="$('#rgConfigName').hide()">否
                                        </div>
                                        <div style=" float:left; margin-right:10px;display: none; margin-top:4px;"
                                             id="rgConfigName">配置名称：<input class="default_input"
                                                                               style="padding: 1px 8px;" type="text"
                                                                               id="configName" name="configName"></div>
                                        <div style=" float:left;"><input class="submit2" type="button"
                                                                         onclick="eventRGQuery(1)" value="提交"></div>
                                    </div>
                                </li>
                            </div>
                        </ul>
                        <!-- 高级查询 -->
                        <div class="test_triangle_border property_case">
                            <div class="popup1 case_con">
                                <span class="tri"><em></em></span>
                                <div class="case_top">
                                    <img src="<%=basePath%>/static/images/propertyCase.png"><span>属性案例2</span>
                                </div>
                                <table>
                                    <tr>
                                        <td><font class="sbFont">GLOBALEVENTID</font> : 454094217</td>
                                        <td><font class="sbFont">DATEADDED :</font> 20181011</td>
                                        <td><font class="sbFont">Actor1Code :</font> CAN</td>
                                        <td><font class="sbFont">Actor1Name :</font> CANADIAN</td>
                                        <td><font class="sbFont">Actor1CountryCode :</font> CAN</td>
                                    </tr>
                                    <tr>
                                        <td><font class="sbFont">Actor1KnownGroupCode :</font> IRC</td>
                                        <td><font class="sbFont">Actor1EthnicCode :</font> kur</td>
                                        <td><font class="sbFont">Actor1Religion1Code :</font> CHR</td>
                                        <td><font class="sbFont">Actor1Religion2Code :</font> SUN</td>
                                        <td><font class="sbFont">Actor1Type1Code :</font> UAF</td>
                                    </tr>
                                    <tr>
                                        <td><font class="sbFont">Actor1Type2Code :</font> HRI</td>
                                        <td><font class="sbFont">Actor1Type3Code :</font> GOV</td>
                                        <td><font class="sbFont">Actor2Code :</font> GBRGOV</td>
                                        <td><font class="sbFont">Actor2Name :</font> UNITED KINGDOM</td>
                                        <td><font class="sbFont">Actor2CountryCode :</font> GBR</td>
                                    </tr>
                                    <tr>
                                        <td><font class="sbFont">Actor2KnownGroupCode :</font> IRC</td>
                                        <td><font class="sbFont">Actor2EthnicCode :</font> kur</td>
                                        <td><font class="sbFont">Actor2Religion1Code :</font> CHR</td>
                                        <td><font class="sbFont">Actor2Religion2Code :</font> SUN</td>
                                        <td><font class="sbFont">Actor2Type1Code :</font> UAF</td>
                                    </tr>
                                    <tr>
                                        <td><font class="sbFont">Actor2Type2Code :</font> HRI</td>
                                        <td><font class="sbFont">Actor2Type3Code :</font> GOV</td>
                                        <td><font class="sbFont">IsRootEvent :</font> 1</td>
                                        <td><font class="sbFont">EventCode :</font> 35</td>
                                        <td><font class="sbFont">EventBaseCode :</font> 12</td>
                                    </tr>
                                    <tr>
                                        <td><font class="sbFont">EventRootCode :</font> 13</td>
                                        <td><font class="sbFont">QuadClass :</font> 3</td>
                                        <td><font class="sbFont">GoldsteinScale :</font> -6.5</td>
                                        <td><font class="sbFont">NumMentions :</font> 23</td>
                                        <td><font class="sbFont">NumSources :</font> 33</td>
                                    </tr>
                                    <tr>
                                        <td><font class="sbFont">NumArticles :</font> 22</td>
                                        <td><font class="sbFont">AvgTone :</font> 0.55555555555555</td>
                                        <td><font class="sbFont">Actor1Geo_Type :</font> 3</td>
                                        <td><font class="sbFont">Actor1Geo_FullName :</font> Oakland Community College,
                                            Michigan, United S
                                        </td>
                                        <td><font class="sbFont">Actor1Geo_CountryCode :</font> US</td>
                                    </tr>
                                    <tr>
                                        <td><font class="sbFont">Actor1Geo_ADM1Code :</font> USMI</td>
                                        <td><font class="sbFont">Actor1Geo_Lat :</font> 42.4928000</td>
                                        <td><font class="sbFont">Actor1Geo_Long :</font> -83.3705000</td>
                                        <td><font class="sbFont">Actor1Geo_FeatureID :</font> 633876</td>
                                        <td><font class="sbFont">Actor2Geo_Type :</font> 3</td>
                                    </tr>
                                    <tr>
                                        <td><font class="sbFont">Actor2Geo_Type :</font> 3</td>
                                        <td><font class="sbFont">Actor2Geo_FullName :</font> Oakland Community College,
                                            Michigan, United S
                                        </td>
                                        <td><font class="sbFont">Actor2Geo_CountryCode :</font> US</td>
                                        <td><font class="sbFont">Actor2Geo_ADM1Code :</font> USMI</td>
                                        <td><font class="sbFont">Actor2Geo_Lat :</font> 42.4928000</td>
                                    </tr>
                                    <tr>
                                        <td><font class="sbFont">Actor2Geo_Long :</font> -83.3705000</td>
                                        <td><font class="sbFont">Actor2Geo_FeatureID :</font> 633876</td>
                                        <td><font class="sbFont">ActionGeo_Type :</font> 3</td>
                                        <td><font class="sbFont">ActionGeo_FullName :</font> Oakland Community College,
                                            Michigan, United S
                                        </td>
                                        <td><font class="sbFont">ActionGeo_CountryCode :</font> US</td>
                                    </tr>
                                    <tr>
                                        <td><font class="sbFont">ActionGeo_ADM1Code :</font> USMI</td>
                                        <td><font class="sbFont">ActionGeo_Lat :</font> 42.4928000</td>
                                        <td><font class="sbFont">ActionGeo_Long :</font> -83.3705000</td>
                                        <td><font class="sbFont">ActionGeo_FeatureID :</font> 633876</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td><font class="sbFont">SOURCEURL :</font>
                                            http://www.independent.ie/world-news/europe/calais-crisis-hits-fever-pitch-in-catandmouse-with-migrants-31419889.html
                                        </td>
                                    </tr>
                                </table>
                                <div class="gjcx_al_box">
                                    <table class="gjcx_al_tb">
                                        <tr>
                                            <td><font class="sbFont">关键字提示 :</font> 并 and,或 or,等于 =,不等于
                                                !=,大于等于 >=,小于等于 <=,模糊匹配 like,模糊不匹配 not like,范围查询
                                                in,不在范围查询 not in
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><font class="sbFont">案例SQL :</font> (ActionGeo_FullName like '%china%'
                                                or ActionGeo_FullName not like '%white House%') or Actor1Code not
                                                in('CAN','CHN') and ActionGeo_Type in (3,4,5)
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <textarea class="texthtml" id="customQuery" name="customQuery"></textarea>
                                <div class="fr" style="margin-top: 6px;color:rgb(189, 202, 230);">
                                    <div style=" float:left; margin-right:10px; margin-top:4px;">保存配置：<input
                                            class="artificial_radio newRadio" name="isSaveConfig2" id="isSaveConfig2"
                                            value="0" type="radio" onclick="$('#rgConfigName2').show()">是<input
                                            class="artificial_radio newRadio" type="radio" name="isSaveConfig2"
                                            value="1" checked onclick="$('#rgConfigName2').hide()">否
                                    </div>
                                    <div style=" float:left; margin-right:10px;display: none; margin-top:4px;"
                                         id="rgConfigName2">配置名称：<input class="default_input"
                                                                            style="padding: 1px 8px;" type="text"
                                                                            id="configName2" name="configName2"></div>
                                    <div style=" float:left;"><input class="submit2" type="button"
                                                                     onclick="eventRGQuery(2)" value="提交"></div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <jsp:include page="../updateUserPassword.jsp"/>
</body>

<script src="<%=basePath%>/static/lib/jquery.pagination.js"></script>
<script src="<%=basePath%>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath%>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath%>/static/js/bootstrap-select.min.js"></script>
<script src="<%=basePath%>/static/js/jquery.combo.select.js"></script>
<script src="<%=basePath%>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath%>/static/js/perfect-scrollbar.js"></script>
<script src="<%=basePath%>/static/js/sec2.js"></script>
<script type="text/javascript">
    var bodyH = $(window).height();
    $(".index_bottom").height(bodyH - 50);
    $(".data").height(bodyH - 50);
</script>
<script type="text/javascript"
        src="<%=basePath%>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript"
        src="<%=basePath%>/static/Visualization/base/base.js"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/amcharts.js"
        type="text/javascript"></script>
<script
        src="<%=basePath%>/static/Visualization/js/amcharts/themes/light.js"
        type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amchart_util.js"
        type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/ammap.js"
        type="text/javascript"></script>
<script src="<%=basePath%>/static/Visualization/js/ammap_util.js"
        type="text/javascript"></script>
<script
        src="<%=basePath%>/static/Visualization/js/amcharts/export/export.js"
        type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/leaflet.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/tile.stamen.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/underscore-min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/javascript.util.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/jsts.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/leaflet-dvf.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/leaflet.dvf.experimental.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/js/leaflet/countryData.min.js"></script>
<script src="<%=basePath%>/static/Visualization/js/amcharts/serial.js" type="text/javascript"></script>
<script src="<%=basePath%>/static/js/map-tileLayer.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
<c:if test="${bgFlag == null or bgFlag == 1}">
    <script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
    <script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
</c:if>
<!-- 即时查询js -->
<script src="<%=basePath %>/static/Visualization/rgQuery.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/config/newShowConfig.js"></script>
<script src="<%=basePath %>/static/js/config/config.js"></script>
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<script type="text/javascript">
    /*
		（1）国家地图按照原逻辑实现
		（2）州省数据是否要按地图展示，name全部不为空或者至少有一个不为空的的情况就是有州省的echarts可拿对应的国家地图展示、全部为null.这个国家的州省不支持地图显示、
	*/
    var mapName = "world";
    var countryName = "";
    var cname = "";
    var area = "国家";

    $('.high_search').on('click', function () {
        $('.ulli').toggle();
        $('.property_case').toggle();
        if ($('.property_case').css('display') == "block") {
            $('.high_search').css('background', '#0087fd')
        } else {
            $('.high_search').css('background', 'none')
        }
    })

    function selectYearMonthDay() {
        //添加起止日期
        data_html = "<div class='add_date clearfix addEventDate'>" +
            "<div class='td1 fl'>" +
            "<p class='fl'></p>" +
            "<b></b>" +
            "</div>" +
            "<div class='clearfix'>" +
            "<div class='td2 fl b_e_date'>起止日期</div>" +
            "<div class='td3_2 fl'>" +
            "<label class='lab2' for=''><input class='inp_selc day1' name='stDates' type='text' readonly value='" + configMinDate + "'/></label>" +
            "</div>" +
            "<div class='fl width18'></div>" +
            "<div class='td3_2 fl'>" +
            "<label class='lab2' for=''><input class='inp_selc day2' name='edDates' type='text' readonly value='" + configMaxDate + "'/></label>" +
            "</div>" +
            "<div class='del_date_btn' style='margin-left: -20px;'></div>" +
            " </div>" +
            "</div>";

        //提示结束时间赋值
        $("#edDateSpan").html(configMaxDate);
        $("#stDateSpan").html(configMinDate);
        //重置时间插件的时间范围 注意：必须放置setDate之前
        $('.day1').datepicker('setStartDate', configMinDate);
        $('.day2').datepicker('setEndDate', configMaxDate);
        //将时间范围的最大值、最小值放在开始时间和结束时间
        $('.day1').datepicker('setDate', configMinDate);
        $('.day2').datepicker('setDate', configMaxDate);
        $("#stDates").val(configMinDate);
        $("#edDates").val(configMaxDate);
    }

    $(function () {
        //配置页面取默认的最大日期和最小日期
        configDate = ${configDate};
        configMaxDate = configDate.maxDate1;
        configMaxDate = configMaxDate.substring(0, 4) + "-" + configMaxDate.substring(4, 6) + "-" + configMaxDate.substring(6, 8);
        configMinDate = configDate.minDate1;
        configMinDate = configMinDate.substring(0, 4) + "-" + configMinDate.substring(4, 6) + "-" + configMinDate.substring(6, 8);
        //下拉框多选框数据
        countryCode = ${countryCode};
        organizationcode = ${organizationcode};
        ethnicCode = ${ethnicCode};
        religionCode = ${religionCode};
        typeCode = ${typeCode};
        quadClass = ${quadClass};
        rootEvent = ${rootEvent};
        baseEvent = ${baseEvent};
        eventCode = ${eventCode};
        geoCountryCode = ${geoCountryCode};
        //下拉框多选框加载
        getSelectCom();
        //处理配置
        handleConfigs();
        var ll = $("#PZLength").val();
        //回显改变值
        updateConfigNew(ll);
        //美化滚动条
        glorifyComboSelect();
        //提示结束时间赋值
        $(".add_date_btn").show();

        $(".add_date_btn").on("click", function () {
            $(".date_box").append(data_html);

            $('.day1').datepicker({
                format: 'yyyy-mm-dd',
                weekStart: 0,
                autoclose: true,
                orientation: "auto",
                startView: 0,
                maxViewMode: 2,
                minViewMode: 0,
                forceParse: false,
                language: 'zh-CN',
                startDate: configMinDate,
                endDate: configMaxDate
            }).on('changeDate', function (e) {
                if ($(this).val() > $('.day2').val()) {
                    $('.day2').val($(this).val());
                }
                var startTime = e.date;
                $('.day2').datepicker('setStartDate', startTime);
            });
            $('.day2').datepicker({
                format: 'yyyy-mm-dd',
                weekStart: 0,
                autoclose: true,
                orientation: "auto",
                startView: 0,
                maxViewMode: 2,
                minViewMode: 0,
                forceParse: false,
                language: 'zh-CN',
                startDate: configMinDate,
                endDate: configMaxDate
            }).on('changeDate', function (e) {
                if ($(this).val() < $('.day1').val()) {
                    $('.day1').val($(this).val());
                }
                var endTime = e.date;
                $('.day1').datepicker('setEndDate', endTime);
            });
        });
        $(".date_box").on("click", ".del_date_btn", function () {
            $(this).parent().parent().remove();
        });
        $('.day1').datepicker({
            format: 'yyyy-mm-dd',
            weekStart: 0,
            autoclose: true,
            orientation: "auto",
            startView: 0,
            maxViewMode: 2,
            minViewMode: 0,
            forceParse: false,
            language: 'zh-CN',
            startDate: configMinDate,
            endDate: configMaxDate
        }).on('changeDate', function (e) {
            if ($(this).val() > $('.day2').val()) {
                $('.day2').val($(this).val());
            }
            var startTime = e.date;
            $('.day2').datepicker('setStartDate', startTime);
        });
        $('.day2').datepicker({
            format: 'yyyy-mm-dd',
            weekStart: 0,
            autoclose: true,
            orientation: "auto",
            startView: 0,
            maxViewMode: 2,
            minViewMode: 0,
            forceParse: false,
            language: 'zh-CN',
            startDate: configMinDate,
            endDate: configMaxDate
        }).on('changeDate', function (e) {
            if ($(this).val() < $('.day1').val()) {
                $('.day1').val($(this).val());
            }
            var endTime = e.date;
            $('.day1').datepicker('setEndDate', endTime);
        });
        selectYearMonthDay();
    });


    //加载配置对应的结果信息
    function render(configId) {
        startLoad();
        $.ajax({
            url: '<%=basePath%>/search/event_situational_viz/' + configId,
            type: 'POST',
            dataType: "json",
            success: function (data) {
                if (data == "-1") {
                    endLoad();
                    win.alertEx("获取结果信息数据失败");
                }
                renderData(data);
                endLoad();
                //左侧菜单栏 扩大缩小后重新渲染图表
                window.onresize = function () {
                    renderData(data);
                }
            }
        });
    }

    var flag = 1;
    var worldData = [];//世界地图中国家数据
    var stateData = {};//国家地图中州省数据
    var cityData = {};//国家地图中城市的数据和对应的经纬度
    var dateData = [];//事件时间段
    var tipData = {};//时间对应的事件数
    //将结果数据（预查询、即时查询）渲染
    function renderData(data) {
        worldData = data.worldData;//世界地图中国家数据
        stateData = data.stateData;//国家地图中州省数据
        cityData = data.cityData;//国家地图中城市的数据和对应的经纬度
        dateData = data.dateData;//事件时间段[]
        tipData = data.tipData;//时间对应的事件数
        /* worldData=[ { "name" : "China", "value" : 111732 }];
    	stateData={"China":[{"name":'北京',"chName":"beijing",value:200},{"name":"河北","chName":"hebie",value:1200}]};
    	cityData={
    					"cityData": {
    						"China": [{
    							"name": "北京",
    							"value": 200
    						}, {
    							"name": "河北",
    							"value": 1200
    						}, {
    							"name": "张家口",
    							"value": 200
    						}, {
    							"name": "石家庄",
    							"value": 400
    						}, {
    							"name": "保定",
    							"value": 200
    						}]
    					},
    					"geoData": {
    						"China": {
    							"石家庄": [114.48, 38.03],
    							"莱芜": [117.67, 36.19],
    							"常德": [111.69, 29.05],
    							"保定": [115.48, 38.85],
    							"张家口": [114.87, 40.82]
    						}
    					}
    				};
    	 dateData=['20181012-20181031事件数','20181012-20181031事件数','20181012-20181031事件数','20181012-20181031事件数','20181012-20181031事件数'];
    	 tipData={
    					"China": {
    						"平均对比度": 111732,
    						"20181012-20181013事件数": 152,
    						"20181012-2018103事件数": 168,
    						"201810-201810事件数": 699,
    						"201811-201810事件数": 699,
    						"201812-201810事件数": 699
    					},
    					"河北": {
    						"平均对比度": 1117,
    						"20181012-20181031事件数": 32,
    						"2018101-2018103事件数": 28
    					},
    					"张家口": {
    						"平均对比度": 117,
    						"20181012-20181031事件数": 32
    					}
    				};
    	  */
        flag = 1;
        $('.world').click();
        //字体填充
        $('.bottom_box').empty();
        if (dateData != undefined) {
            for (let i = 0; i < dateData.length; i++) {
                let box = $('<div class="list">' +
                    '<span class="span_1"></span>' +
                    '<span class="span_2">' + dateData[i] + '</span>' +
                    '</div>');
                $('.bottom_box').append(box);
            }
        }
    }

    //定义全局的地图echarts变量，并绑定点击事件，防止每次调用showMap方法，绑定多次点击事件
    var myChart_map = echarts.init(document.getElementById('word_echart'));
    myChart_map.on('click', function (worldParam) {
        cname = worldParam.name;
        if (cname == '') {
            win.alertEx("无相关数据");
            return;
        }
        flag = 1;
        area = "州省";
        if (cname.length > 6) {
            var cnameStr = cname.substring(0, 6);
            //$("#country").append('<div class="place" title="'+cname+'">'+cnameStr+'</div>');
            $("#country").html(cnameStr);
        } else {
            //$(".places").append('<div class="place">'+cname+'</div>');
            $("#country").html(cname);
        }
        countryName = cname.split(' ').join('_');
        $('.city').css("background-color", "#024a73");
        $('.city1').css("color", "#FFF");
        $('.Province').css("background-color", "#1683c1");
        $('.Province1').css("color", "#28e0f7");
        $('.country').show();
        $('.Province').show();
        $('.city').show();
        if (cname == "North Korea") {
            cname = "Korea, North"
        }
        if (cname == "South Korea") {
            cname = "Korea, South"
        }
        if (cname == "Czechia") {
            cname = "Czech Republic"
        }
        if (cname == "W.Sahara") {
            cname = "Western Sahara"
        }
        if (cname == "The Netherlands") {
            cname = "Netherlands"
        }
        if (cname == "Guinea-Bissau") {
            cname = "Equatorial Guinea"
        }
        if (cname == "Congo-Brazzaville") {
            cname = "Congo, Republic of the"
        }
        if (cname == "Congo-Kinshasa") {
            cname = "Congo, Republic of the"
        }
        if (stateData == undefined) {
            stateData = {};
        }
        var stateCountryData = stateData[cname];//国家州省数据
        var cityOfcountryData = cityData.cityData;
        var cityCountryData = cityOfcountryData[cname];

        if (stateCountryData == undefined) {
            stateCountryData = [];
        }
        if (cityCountryData == undefined) {
            cityCountryData = [];
        }
        var bs = 0;
        var cs = 0;
        if (countryName == "Côte_d'Ivoire" || countryName == "New_Caledonia" || countryName == "W._Sahara") {
            $("#word_echart").css("display", "none");
            $("#bar_echart").css("display", "block");
            var imgHTM = '<img class="nodata_image" src="../../static/images/map_none.png">';
            $(".bar_png").append(imgHTM);
            $(".bar_png").css("display", "block");
            //州省判断
            for (var i = 0; i < stateCountryData.length; i++) {
                var name = stateCountryData[i].name;
                if (name != "" || name != undefined) {
                    bs++;
                }
            }
            //城市判断
            for (var i = 0; i < cityCountryData.length; i++) {
                var name = cityCountryData[i].name;
                if (name != "" || name != undefined) {
                    cs++;
                }
            }
            if (bs == 0 && cs == 0) {
                win.alertEx("无相关数据");
            } else {
                showBar(stateCountryData);
            }
        } else {
            //州省判断
            for (var i = 0; i < stateCountryData.length; i++) {
                var name = stateCountryData[i].name;
                if (name != "" || name != undefined) {
                    bs++;
                }
            }
            //城市判断
            for (var i = 0; i < cityCountryData.length; i++) {
                var name = cityCountryData[i].name;
                if (name != "" || name != undefined) {
                    cs++;
                }
            }
            if (bs == 0 && cs == 0) {
                win.alertEx("无相关数据");
            } else if (bs != 0) {
                showMap(flag, countryName, stateCountryData);
            } else if (bs == 0) {
                showBar(stateCountryData);
            }
        }
    });

    function showMap(flag, name, data, geoCoordMap) {
        //世界地图option所需要数据
        if (data == undefined) {
            var data = [];
        }
        var nameMap = {}
        var jsons = '../../static/js/worldJson/' + name + '.json';
        $.get(jsons, function (getJson) {
            //将name改写为china，调用china.js中的注册中国各省市，解决南海不显示问题
            if (name == "China") {
                name = "china";
            }
            echarts.registerMap(name, getJson);
            var countrySum = [];
            if (flag == 1) {//世界
                var maxIndex = 0;
                for (var i = 0; i < data.length; i++) {
                    var d1 = {
                        name: data[i].name,
                        value: data[i].value
                    };
                    if (maxIndex < (data[i].value * 1)) {
                        maxIndex = (data[i].value * 1);
                    }
                    countrySum.push(d1);
                }
            } else {//某国家地图
                var maxValue = 0;
                for (var i = 0; i < data.length; i++) {
                    if (maxValue < (data[i].value * 1)) {
                        maxValue = (data[i].value * 1);
                    }
                }
                var convertData = function (data) {
                    var res = [];
                    for (var i = 0; i < data.length; i++) {
                        var geoCoord = geoCoordMap[data[i].name];
                        if (geoCoord) {
                            res.push({
                                name: data[i].name,
                                value: geoCoord.concat(data[i].value)
                            });
                        }
                    }
                    return res;
                };
                //散点坐标
                var option1 = {
                    visualMap: {
                        min: 0,
                        max: maxValue,
                        left: 'left',
                        top: 'bottom',
                        text: ['高', '低'],
                        calculable: true,
                        seriesIndex: [1],
                        inRange: {
                            color: ['lightskyblue', 'yellow', 'orangered', 'red'],
                            symbolSize: [2, 20]
                        },
                        textStyle: {
                            color: '#fff',
                        }
                    },
                    tooltip: {
                        trigger: 'item',
                        enterable: true,
                        formatter: function (params) {
                            var name = params.name;
                            var chName = params.data.chName;
                            if (chName == undefined) {
                                chName = name;
                            }
                            var seriesIndex = params.seriesIndex;
                            var tipHtmls = '';
                            if (seriesIndex == 0) {
                                var area = "城市";
                                tipHtmls = '<div style="width: 397px;height: 100%;border:1px solid #22aeef;backgroundColor:#1c2338,border-radius: 10px;opacity: 0.8;background:#1c2338">' +
                                    '<div style="width: 354px;border: 2px solid #126e9e;margin:10px 0 10px 20px">' +
                                    '<div style="height: 27px;width: 354px;background:#22aeef">' +
                                    '<span style="color:#FFF; margin: 9px 0 0 90px">Name</span>' +
                                    '<span style="color:#FFF; margin: 9px 0 0 127px">Value</span>' +
                                    '</div>' +
                                    '<div style="height: 27px;width: 354px;">' +
                                    '<span style="text-align:center;color:#FFF;width: 223px;height: 25px;border: 1px solid #126e9e;display: inline-block">' + area + '</span>' +
                                    '<span style="text-align:center;color:#FFF;width: 129px;height: 25px;border-top: 1px solid #126e9e;;border-bottom: 1px solid #126e9e;display: inline-block;margin-left:-5px">' + params.name + '</span>' +
                                    '</div>';
                            } else {
                                var area = "州省";
                                tipHtmls = '<div style="width: 397px;height: 100%;border:1px solid #22aeef;backgroundColor:#1c2338,border-radius: 10px;opacity: 0.8;background:#1c2338">' +
                                    '<div style="width: 354px;border: 2px solid #126e9e;margin:10px 0 10px 20px">' +
                                    '<div style="height: 27px;width: 354px;background:#22aeef">' +
                                    '<span style="color:#FFF; margin: 9px 0 0 90px">Name</span>' +
                                    '<span style="color:#FFF; margin: 9px 0 0 127px">Value</span>' +
                                    '</div>' +
                                    '<div style="height: 27px;width: 354px;">' +
                                    '<span style="text-align:center;color:#FFF;width: 223px;height: 25px;border: 1px solid #126e9e;display: inline-block">' + area + '</span>' +
                                    '<span style="text-align:center;color:#FFF;width: 129px;height: 25px;border-top: 1px solid #126e9e;;border-bottom: 1px solid #126e9e;display: inline-block;margin-left:-5px">' + params.name + '</span>' +
                                    '</div>' +
                                    '<div style="height: 27px;width: 354px;">' +
                                    '<span style="text-align:center;color:#FFF;width: 223px;height: 25px;border: 1px solid #126e9e;display: inline-block">中文名称</span>' +
                                    '<span style="text-align:center;color:#FFF;width: 129px;height: 25px;border-top: 1px solid #126e9e;;border-bottom: 1px solid #126e9e;display: inline-block;margin-left:-5px">' + chName + '</span>' +
                                    '</div>';
                            }

                            var paramsData = tipData[name];
                            for (var b in paramsData) {
                                tipHtmls +=
                                    '<div style="height: 27px;width: 354px;">' +
                                    '<span style="text-align:center;color:#FFF;width: 224px;height: 26px;border-bottom: 1px solid #126e9e;border-right: 1px solid #126e9e;display: inline-block">' + b + '</span>' +
                                    '<span style="text-align:center;color:#FFF;width: 128px;height: 26px;border-bottom: 1px solid #126e9e;display: inline-block;margin-left:-5px">' + paramsData[b] + '</span>' +
                                    '</div>';
                            }
                            console.log(tipHtmls);
                            return tipHtmls;
                        }
                    },
                    geo: {
                        map: name,
                        zoom: 1.2,
                        label: {
                            normal: {
                                show: false,
                                color: '#c1c4c8'
                            },
                            emphasis: {
                                show: false,
                                color: '#292929'
                            }
                        },
                        roam: true,
                        itemStyle: {
                            normal: {
                                borderColor: 'rgba(37, 88, 184, 0.8)', // 区域边框颜色
                                areaColor: '#323c48',// 区域颜色,
                            }
                        }
                    },
                    series: [
                        {
                            name: '',
                            type: 'effectScatter',
                            coordinateSystem: 'geo',
                            data: convertData(data),
                            symbolSize: 10,
                            showEffectOn: 'render',
                            rippleEffect: {
                                brushType: 'stroke'
                            },
                            hoverAnimation: true,
                            label: {
                                normal: {
                                    formatter: '{b}',
                                    position: 'right',
                                    show: false
                                },
                                emphasis: {
                                    show: true
                                }
                            },
                            itemStyle: {
                                normal: {
                                    color: '#05C3F9',
                                    shadowBlur: 10,
                                    shadowColor: '#05C3F9'
                                }
                            }
                        },
                        {
                            type: 'map',
                            mapType: name,
                            geoIndex: 0,
                            label: {
                                normal: {
                                    show: true
                                },
                                emphasis: {
                                    show: true
                                }
                            },
                            itemStyle: {
                                normal: {
                                    areaColor: '#323c48',
                                    borderColor: 'rgba(37, 88, 184, 0.8)'
                                },
                                emphasis: {
                                    areaColor: '',
                                    borderColor: '#fff'
                                }
                            },
                            data: data
                        }]
                }
            }
            var option = {
                tooltip: {
                    trigger: 'item',
                    textStyle: {
                        fontSize: '18'
                    },
                    formatter: function (params) {
                        var name = params.name;
                        var tipHtml = '';
                        if (name != null && name != '') {
                            tipHtml = '<div style="width: 397px;height: 100%;border:1px solid #22aeef;backgroundColor:#1c2338,border-radius: 10px;opacity: 0.8;background:#1c2338">' +
                                '<div style="width: 354px;height: 30%;border: 2px solid #126e9e;margin:10px 0 10px 20px">' +
                                '<div style="height: 27px;width: 354px;background:#22aeef">' +
                                '<span style="color:#FFF; margin: 9px 0 0 90px">Name</span>' +
                                '<span style="color:#FFF; margin: 9px 0 0 127px">Value</span>' +
                                '</div>' +
                                '<div style="height: 27px;width: 354px;">' +
                                '<span style="text-align:center;color:#FFF;width: 223px;height: 25px;border: 1px solid #126e9e;display: inline-block">' + area + '</span>' +
                                '<span style="text-align:center;color:#FFF;width: 129px;height: 25px;border-top: 1px solid #126e9e;;border-bottom: 1px solid #126e9e;display: inline-block;margin-left:-5px">' + params.name + '</span>' +
                                '</div>';
                            var paramsData = tipData[name];
                            for (var b in paramsData) {
                                tipHtml +=
                                    '<div style="height: 27px;width: 354px;">' +
                                    '<span style="text-align:center;color:#FFF;width: 224px;height: 26px;border-bottom: 1px solid #126e9e;border-right: 1px solid #126e9e;display: inline-block">' + b + '</span>' +
                                    '<span style="text-align:center;color:#FFF;width: 128px;height: 26px;border-bottom: 1px solid #126e9e;display: inline-block;margin-left:-5px">' + paramsData[b] + '</span>' +
                                    '</div>';
                            }
                        } else {
                            tipHtml = "无数据";
                        }
                        return tipHtml;
                    }
                },
                grid: {
                    show: false
                },
                visualMap: {
                    min: 0,
                    max: maxIndex,
                    left: 'left',
                    text: ['高', '低'],
                    zoom: 1.2,
                    show: true,
                    colorLightness: [0.2, 100],
                    dimension: 0,
                    calculable: true,
                    inRange: {
                        color: ['lightskyblue', 'yellow', 'orangered', 'red'],
                        symbolSize: [2, 20]
                    },
                    textStyle: {
                        color: '#fff',
                    }
                },
                xAxis: [{
                    type: 'value',
                    boundaryGap: false,
                    splitLine: {
                        show: false
                    },
                    axisLine: {
                        show: false
                    },
                    axisTick: {
                        show: false
                    },
                }],
                yAxis: [{
                    show: false,
                    type: 'category',
                    data: name,
                    inverse: true,
                    axisTick: {
                        alignWithLabel: true
                    }
                }],
                series: [{
                    z: 1,
                    zoom: 1.2,
                    name: ("分布", "") + '数量',
                    type: 'map',
                    map: name,
                    itemStyle: {
                        normal: {
                            areaColor: '#323c48',
                            borderColor: 'rgba(37, 88, 184, 0.8)'
                        },
                        emphasis: {
                            areaColor: '',
                            borderColor: '#fff'
                        }
                    },
                    label: {
                        normal: {
                            show: false
                        },
                        emphasis: {
                            show: false
                        }
                    },
                    roam: true,
                    data: countrySum
                }],
            };
            if (flag == 1) {//世界地图
                myChart_map.clear();
                myChart_map.setOption(option);
            } else {
                myChart_map.clear();
                myChart_map.setOption(option1);
            }
            //每次渲染完remove掉城市中州省的对象
            if (name != "world") {
                var cityOfcountryData = cityData["cityData"];
                //某个国家对应的城市数据
                var cityCountryData = cityOfcountryData[name];

                if (cityCountryData == undefined) {
                    var cityCountryData = [];
                }
                //州省数据
                if (stateData == undefined) {
                    stateData = {};
                }
                //某个国家的州省数据
                var stateCountryData = stateData[name];
                //构造一个remove的方法
                Array.prototype.remove = function (val) {
                    var index = this.indexOf(val);
                    if (index > -1) {
                        this.splice(index, 1);
                    }
                };
                //循环的去删除
                for (var i = 0; i < stateCountryData.length; i++) {
                    cityCountryData.remove(stateCountryData[i]);
                }
            }
        });
    }

    //省州城市字体样式切换
    $('.Province').click(function () {
        $('.city').css("background-color", "#024a73");
        $('.city1').css("color", "#FFF");
        $('.Province').css("background-color", "#1683c1");
        $('.Province1').css("color", "#28e0f7");
        flag = 1;
        area = "州省";
        if (stateData == undefined) {
            stateData = {};
        }
        var stateCountryData = stateData[cname];//国家州省数据
        if (stateCountryData == undefined) {
            var stateCountryData = [];
        }
        if (countryName == "Côte_d'Ivoire" || countryName == "New_Caledonia" || countryName == "W._Sahara") {
            $("#word_echart").css("display", "none");
            $("#bar_echart").css("display", "block");
            var imgHTM = '<img class="nodata_image" src="../../static/images/map_none.png">';
            $(".bar_png").append(imgHTM);
            $(".bar_png").css("display", "block");
            showBar(stateCountryData);
        } else {
            var bs = 0;
            //州省判断
            for (var i = 0; i < stateCountryData.length; i++) {
                var name = stateCountryData[i].name;
                if (name != "" || name != undefined) {
                    bs++;
                }
            }
            if (bs != 0) {
                showMap(flag, countryName, stateCountryData);
            } else {
                showBar(stateCountryData);
            }

        }
    })
    $('.city').click(function () {
        flag = 2;
        area = "城市";
        $('.Province').css("background-color", "#024a73");
        $('.Province1').css("color", "#FFF");
        $('.city').css("background-color", "#1683c1");
        $('.city1').css("color", "#28e0f7");
        if (cityData == undefined) {
            cityData = {};
        }
        //城市的统计数据
        var cityOfcountryData = cityData["cityData"];
        //某个国家对应的城市数据
        var cityCountryData = cityOfcountryData[cname];
        //城市的经纬度数据
        var cityGeoData = cityData.geoData;
        //某个国家对应的经纬度数据
        var geoCoordMap = cityGeoData[cname];

        if (cityCountryData == undefined) {
            var cityCountryData = [];
        }
        //州省数据
        if (stateData == undefined) {
            stateData = {};
        }
        //某个国家的州省数据
        var stateCountryData = stateData[cname];

        for (var i = 0; i < stateCountryData.length; i++) {
            cityCountryData.push(stateCountryData[i]);
        }
        if (countryName == "Côte_d'Ivoire" || countryName == "New_Caledonia" || countryName == "W._Sahara") {
            $("#word_echart").css("display", "none");
            $("#bar_echart").css("display", "block");
            var imgHTM = '<img class="nodata_image" src="../../static/images/map_none.png">';
            $(".bar_png").append(imgHTM);
            $(".bar_png").css("display", "block");
            showBar(cityCountryData);
        } else {
            showMap(flag, countryName, cityCountryData, geoCoordMap);
        }
    })
    $('.world').click(function () {
        $(".country").hide();
        $(".Province").hide();
        $(".city").hide();
        flag = 1;
        area = "国家（地区名称）";
        $("#word_echart").css("display", "block");
        $("#bar_echart").css("display", "none");
        $(".bar_png").css("display", "none");
        showMap(flag, mapName, worldData);

    })

    //柱状图
    function showBar(stateCountryData) {
        var xData = [];
        var yData = [];
        for (var i = 0; i < stateCountryData.length; i++) {
            var name = stateCountryData[i].chName;
            var value = stateCountryData[i].value;
            xData.push(name);
            yData.push(value);
        }
        var showBar_chart = echarts.init(document.getElementById('bar_echart'));
        var option = {
            tooltip: { //提示框组件
                show: true,
                formatter: '{b}<br />{a0}: {c0}',
                axisPointer: {
                    type: 'shadow',
                    label: {
                        backgroundColor: '#6a7985'
                    }
                },
                textStyle: {
                    color: '#fff',
                    fontStyle: 'normal',
                    fontFamily: '微软雅黑',
                    fontSize: 12,
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: [
                {
                    type: 'category',
                    data: xData,
                    axisLabel: { //坐标轴刻度标签的相关设置。
                        textStyle: {
                            color: '#078ceb',
                            fontStyle: 'normal',
                            fontFamily: '微软雅黑',
                            fontSize: 12,
                        },
                        rotate: 0,
                    },
                    axisTick: {//坐标轴刻度相关设置。
                        show: false,
                    },
                    axisLine: {//坐标轴轴线相关设置
                        lineStyle: {
                            color: '#fff',
                            opacity: 0.2
                        }
                    },
                    splitLine: { //坐标轴在 grid 区域中的分隔线。
                        show: false,
                    }
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    splitNumber: 5,
                    axisLabel: {
                        textStyle: {
                            color: '#a8aab0',
                            fontStyle: 'normal',
                            fontFamily: '微软雅黑',
                            fontSize: 12,
                        }
                    },
                    axisLine: {
                        show: false
                    },
                    axisTick: {
                        show: false
                    },
                    splitLine: {
                        show: true,
                        lineStyle: {
                            color: ['#fff'],
                            opacity: 0.06
                        }
                    }

                }
            ],
            series: [
                {
                    name: '总数量',
                    type: 'bar',
                    data: yData,
                    barWidth: 10,
                    barGap: 0,//柱间距离
                    label: {//图形上的文本标签
                        normal: {
                            show: true,
                            position: 'top',
                            textStyle: {
                                color: '#a8aab0',
                                fontStyle: 'normal',
                                fontFamily: '微软雅黑',
                                fontSize: 12,
                            },
                        },
                    },
                    itemStyle: {
                        normal: {
                            show: true,
                            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                offset: 0,
                                color: '#1a98f8'
                            }, {
                                offset: 1,
                                color: '#7049f0'
                            }]),
                            barBorderRadius: 50,
                            borderWidth: 0,
                        }
                    },
                }
            ]
        };

        showBar_chart.setOption(option);
        //调节echarts图表自适应
        window.onresize = function () {
            showBar_chart.resize();
        }
    }

</script>
</html>