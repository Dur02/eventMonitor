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
    <title>事件配置</title>
    <!-- 弹出层需引进，并放在所有css上面，以避免冲突 -->
    <link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
    <link rel="stylesheet" href="<%=basePath %>/static/css/animate.css">
    <!-- 弹出层需引进结束 -->
    <link rel="stylesheet" href="<%=basePath %>/static/css/dialog.css">
    <link rel="stylesheet" href="<%=basePath %>/static/css/style.css"/>
    <link rel="stylesheet" href="<%=basePath %>/static/css/eventConfig.css"/>

    <link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.min.css"/>
    <link rel="stylesheet" href="<%=basePath %>/static/lib/pagination.css"/>
    <link rel="stylesheet" href="<%=basePath %>/static/css/combo.select.css">
    <link rel="stylesheet" href="<%=basePath %>/static/css/perfect-scrollbar.css"/>
    <link rel="stylesheet" href="<%=basePath %>/static/win_alert/window.css"/><!-- 弹出提示框样式 -->
    <link rel="stylesheet" href="<%=basePath %>/static/css/waringhover.css"/><!-- 内存大小移入样式 -->
    <style type="text/css">
        .combo-dropdown li {
            float: left;
            width: 100%;
        }

        .hcd_main_border {
            position: absolute !important;
        }

        .newFuxuankuang {
            vertical-align: middle;
        }
    </style>
    <script src="<%=basePath %>/static/js/jquery-1.9.1.min.js"></script>
    <script src="<%=basePath %>/static/js/jquery.mousewheel.js"></script>
    <script src="<%=basePath %>/static/js/perfect-scrollbar.js"></script>
    <script src="<%=basePath %>/static/lib/jquery.pagination.js"></script>
    <script src="<%=basePath %>/static/js/bootstrap-datepicker.min.js"></script>
    <script src="<%=basePath %>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
    <script src="<%=basePath %>/static/js/bootstrap-select.min.js"></script>
    <script src="<%=basePath %>/static/js/jquery.combo.select.js"></script>
    <script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
    <%--<script type="text/javascript" src="<%=basePath%>/static/js/comboBoxData/geoCountryCode.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/comboBoxData/countryCode.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/comboBoxData/organizationcode.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/comboBoxData/baseEvent.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/comboBoxData/ethnicCode.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/comboBoxData/eventCode.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/comboBoxData/quadClass.js"></script>
 <script type="text/javascript" src="<%=basePath%>/static/js/comboBoxData/religionCode.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/comboBoxData/rootEvent.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/comboBoxData/typeCode.js"></script>
--%>
    <script type="text/javascript" src="<%=basePath%>/static/js/hsCheckData.js"></script>
    <!-- 弹出层-->
    <script src="<%=basePath %>/static/js/dialog.js"></script>
    <!-- 两种皮肤切换 -->
    <c:if test="${bgFlag == null or bgFlag == 1}">
        <!-- 日期插件的两种样式 -->
        <link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css"/>
        <link rel="stylesheet" href="<%=basePath %>/static/css/sec2.css"/>
        <script src="<%=basePath %>/static/js/sec2.js"></script>
        <script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
        <link rel="stylesheet" href="<%=basePath %>/static/css/hsCheckData.css"/>
    </c:if>
    <c:if test="${bgFlag == 2}">
        <link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.min.css"/>
        <link rel="stylesheet" href="<%=basePath %>/static/css/sec2_2.css"/>
        <script src="<%=basePath %>/static/js/sec2_2.js"></script>
        <script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
        <link rel="stylesheet" href="<%=basePath %>/static/css/hsCheckData2.css"/>
    </c:if>
    <style>
        .protect {
            margin-right: 5px;
        }

        /* 美化滚动条 */
        .index_bottom {
            overflow: auto;
        }

        .index_bottom::-webkit-scrollbar {
            width: 10px;
            height: 10px;
            background-color: #1b2334;
        }

        .index_bottom::-webkit-scrollbar-thumb {
            background-color: #1d2334 !important;
            border-radius: 10px !important;
        }

        .index_bottom::-webkit-scrollbar-thumb:hover {
            background-color: #777 !important;
        }

        .index_bottom::-webkit-scrollbar-track {
            background: #1b2334;
            box-shadow: inset 0 0 6px #333 !important;
            border-radius: 10px !important;
        }

    </style>
</head>
<body class="peizhi_bg">

<form id="configForm" action="../config/saveConfigInfo" method="post">

    <div class="index_top pos_fix">
        <h3 class="fl title" style="margin:0px;">配置管理 > 事件配置 </h3>
        <div class="title_r fr" style="display:none;">
            <span class="set_span set_span2" onclick="changeConfig(this, 1);">事件配置</span>
        </div>
    </div>
    <input type="hidden" id="typeIds" name="configCategoriesStr"/>
    <input type="hidden" class="relationId" name="relationId"/><!-- 关联配置id，用于区别二次回溯产生的配置 -->
    <input type="hidden" id="isAgain" name="isAgain"/><!-- 是否为二次回溯，区别关联分析产生的子配置进行二次回溯-->
    <input type="hidden" id="configCategory" name="configCategory"/>
    <input type="hidden" id="pageIndexNew" value="0"/>
    <input type="hidden" id="constantly" name="constantly" value="0"></input>
    <!-- 事件配置 -->
    <div class="index_bottom">
        <div class="table_box">
            <ul class="table_ul mgl-30 clearfix">

                <li>配置名称：<input type="text" id="s_configName"/></li>
                <li>
                    <div style="float: left; line-height: 20px;">类型筛选：</div>
                    <div class="fl clearfix" style="float: left; height:20px;">
                        <div class="dowebok0">
                            <select id="typeFilter" name="configCategory">
                                <option value="" selected="selected">全部</option>
                                <c:forEach items="${categoryList}" var="category" varStatus="indx">
                                    <option value="${category.categoryId}">${category.categoryName}</option>
                                    <br/>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </li>
                <li>
                    <div style="float: left; line-height: 20px;">配置状态：</div>
                    <div class="fl clearfix" style="float: left; height:20px;">
                        <div class="dowebok0">
                            <select id="scheduleStateFilter">
                                <option value="">全部</option>
                                <option value="0">待执行</option>
                                <br/>
                                <option value="1">执行中</option>
                                <br/>
                                <option value="4">排队中</option>
                                <br/>
                                <option value="2">执行完成</option>
                                <br/>
                                <option value="3">执行失败</option>
                                <br/>
                            </select>
                        </div>
                    </div>
                </li>
                <li>创建人：<input type="text" id="s_creator"/></li>
                <li><input class="seach_btn" type="button" value="查询" onclick="cx()"></li>
                <li><input type="button" class="addbutton" value="新增配置" onclick="addConfig();"></li>
                <li><input type="button" class="addbutton" value="批量删除" onclick="delAll();"></li>

                <li class="waring"><img id="weixian"
                                        style="vertical-align: -webkit-baseline-middle; display: none; cursor: pointer;"
                                        src="<%=basePath %>/static/images/caution.png"></li>
                <li class="protect"><img id="anquan"
                                         style="vertical-align: -webkit-baseline-middle;display: none;cursor: pointer;"
                                         src="<%=basePath %>/static/images/not_caution.png"></li>
                <div class="show-details">
                    <ul>
                        <li class="in_one">
                            最大存储量：<span></span>
                        </li>
                        <li class="in_two">
                            当前存储量：<span></span>
                        </li>
                        <li class="in_three">
                            <span class="span2"></span><span class="span1"></span>
                        </li>
                    </ul>
                </div>


            </ul>

            <table class="table">
                <thead>
                <tr>
                    <th style="padding: 0 !important;width: 53px;"><input type="checkbox" id="newAllcheck"
                                                                          style="vertical-align:middle;">全选
                    </th>
                    <th>序号</th>
                    <th>排序</th>
                    <th>挂起</th>
                    <th>配置名称</th>
                    <th>配置分类</th>
                    <th>创建人</th>
                    <th>权限</th>
                    <th>创建日期</th>
                    <th>备注信息</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
            <div id="Pagination" class="pagination"><!-- 这里显示分页 --></div>
        </div>

        <input type="hidden" id="configFlag" name="configFlag" value="1"/>
        <input type="hidden" class="aa" value="" name="configId"/>
        <input type="hidden" id="isPrivate1" value="2" name="isPrivate1"/>
        <input type="hidden" name="bgFlag" value="${bgFlag}" id="bgFlag"/>
        <div class="tab2 clearfix w-position" style="display:none; position:relative;" id="infodiv">
            <div class="pos_shadow2"></div>
            <fieldset class="show" id="eventInfo">
                <!-- 用于区分事件配置及图谱配置 -->
                <ul class="table_ul clearfix">
                    <li>
                        <div class="td1_2 fl"><p class="info_png fl"></p><b>基本信息：</b></div>
                    </li>
                    <li>配置名称：<input type="text" name="configName" id="configName"/></li>
                    <li>配置类型：<input id="event_type" class="event_type" type="text" name="event_type"
                                        onclick="dianji()" readonly/></li>
                    <li>备注信息：<input type="text" name="remark" id="remark"/></li>
                    <li class="clearfix">优先级：<input style="width:20px;" type="text" name="priority" value="1"
                                                       id="yxj" onblur="jiaoyan()"/>
                        <span id="yxjspan" style="display:none;float: right;"><img
                                src="<%=basePath %>/static/images/delete.png" style="margin-top: -2px;"></img></span>
                    </li>
                    <li>权限：
                        <div style="width: 60px; display: inline-block;">
                            <select class="fl" id="isPrivate" name="isPrivate">
                                <option value="1">私有</option>
                                <option value="2">公开</option>
                            </select>
                        </div>
                    </li>
                    <li id="nowTimeLi" style="margin-right:0px;">实时监测：
                        <div style="width: 60px; display: inline-block;">
                            <select class="fl" id="nowTime" name="nowTime">
                                <option value="1">否</option>
                                <option value="2">是</option>
                            </select>
                        </div>
                    </li>
                </ul>
                <!-- 分界线 -->
                <div class="hr"></div>
                <div class="tab_down2" id="event">
                    <div class="high_search_con" style="margin-top: 30px;    margin-bottom: 20px;">
                        <ul class="tab_down_info">
                            <li class="clearfix">
                                <div class="date_box clearfix">
                                    <div class="td1 fl">
                                        <p class="time_png fl"></p>
                                        <b>日期属性：</b>
                                    </div>
                                    <div style="position:absolute; left:226px; top:-20px" id="dateRange">当前数据库时间范围：<span
                                            id="stDateSpan"></span>至<span id="edDateSpan"></span></div>
                                    <div class="clearfix" style="width: 95%;">
                                        <div class="td2 fl b_e_date">起止日期</div>
                                        <div class="td3_2 fl">
                                            <label class="lab2" for=""><input class="inp_selc day1" name="stDates"
                                                                              type="text" readonly
                                                                              id="stDates"/></label>
                                        </div>
                                        <div class="td3_2 fl">
                                            <label class="lab2" for=""><input class="inp_selc day2" name="edDates"
                                                                              type="text" readonly
                                                                              id="edDates"/></label>
                                        </div>
                                        <div class="now" id="shishi" style="display: none;">实时</div>
                                        <div class="add_date_btn" style="margin-left: 19px;"></div>
                                    </div>
                                    <div class="high_search" style="margin-top: -17px;">高级查询</div>
                                </div>
                            </li>
                            <!-- 数据源 -->
                            <li class="clearfix" id="dataSourceType"><!-- style="height:31px;" -->
                                <div class="td1 fl"><p class="weight_png fl"></p><b>数据源：</b></div>
                                <div class="td5_event fl"><input class="dataSourceType dataSourceType1" type="radio"
                                                                 id="radios1" name="dataSourceType" checked="checked"
                                                                 value="1"><label for="radios1"> 数据源一</label></div>
                                <div class="td5_event fl"><input class="dataSourceType dataSourceType2" type="radio"
                                                                 id="radios2" name="dataSourceType" value="2"><label
                                        for="radios2"> 数据源二</label></div>
                                <div class="td5_event fl"><input class="dataSourceType dataSourceType3" type="radio"
                                                                 id="radios3" name="dataSourceType" value="3"><label
                                        for="radios3"> 数据源三</label></div>
                            </li>
                            <!-- 权重依据 -->
                            <li class="clearfix" id="quanzhong"><!-- style="height:31px;" -->
                                <div class="td1 fl"><p class="ids_png fl"></p><b>权重依据：</b></div>
                                <div class="td5_event fl"><input id="radio1" type="radio" name="weightFlag"
                                                                 checked="checked" value="1"><label for="radio1">
                                    事件数</label></div>
                                <div class="td5_event fl"><input id="radio2" type="radio" name="weightFlag"
                                                                 value="2"><label for="radio2"> 文章数</label></div>
                                <div class="td5_event fl"><input id="radio3" type="radio" name="weightFlag"
                                                                 value="3"><label for="radio3"> 信源数</label></div>
                                <div class="td5_event fl" style="width:89px;"><input id="radio4" type="radio"
                                                                                     name="weightFlag" value="4"><label
                                        for="radio4"> 事件数(去重)</label></div>
                            </li>
                            <!-- 比重 -->
                            <li class="clearfix" id="bizhong" style="display: none;">
                                <div class="td1 fl"><p class="tjyj_png fl"></p><b>统计依据：</b></div>
                                <div class="td5_event fl"><input class="tjradio1" type="radio" id="tjradio1"
                                                                 name="valueWeight" checked="checked" value="1"><label
                                        for="tjradio1"> 比重</label></div>
                                <div class="td5_event fl"><input class="tjradio2" type="radio" id="tjradio2"
                                                                 name="valueWeight" value="2"><label for="tjradio2">
                                    数量</label></div>
                            </li>
                            <div class="ulli">
                                <li class="clearfix zindex99" id="countryRelation" style="display: none;">
                                    <div class="td1 fl"><p class="event_property_png fl"
                                                           style="margin-top: 0 !important;"></p><b>参数设置：</b></div>
                                    <div class="fl clearfix">
                                        <div class="td2_2 fl"><span class="span1">国家关系</span></div>
                                        <div class="fl">
                                            年参数一：<input style="width:20px;" class="default_input norm1" type="text"
                                                            name="yearNorm1" id="yearNorm1"/> 年参数二：<input
                                                style="width:20px;" class="default_input norm2" type="text"
                                                name="yearNorm2" id="yearNorm2"/>
                                            月参数一：<input style="width:20px;" class="default_input norm1" type="text"
                                                            name="monthNorm1" id="monthNorm1"/> 月参数二：<input
                                                style="width:20px;" class="default_input norm2" type="text"
                                                name="monthNorm2" id="monthNorm2"/>
                                            周参数一：<input style="width:20px;" class="default_input norm1" type="text"
                                                            name="weekNorm1" id="weekNorm1"/> 周参数二：<input
                                                style="width:20px;" class="default_input norm2" type="text"
                                                name="weekNorm2" id="weekNorm2"/>
                                            天参数一：<input style="width:20px;" class="default_input norm1" type="text"
                                                            name="dateNorm1" id="dateNorm1"/> 天参数二：<input
                                                style="width:20px;" class="default_input norm2" type="text"
                                                name="dateNorm2" id="dateNorm2"/>
                                        </div>
                                        <img class="hoverImg" src="<%=basePath %>/static/images/detail.png"
                                             style="margin-top: 3px;margin-left: 15px;">
                                        <span style="display: none;">国家关系参数值，非必填项。（只能填入数字）</span>
                                    </div>
                                </li>
                                <li class="clearfix zindex99" id="actorModel">
                                    <div class="td1 fl"><p class="people_png fl"></p><b>角色属性：</b></div>
                                    <div class="fl clearfix">
                                        <div class="td2_2 fl"><span class="span1">角色1</span></div>
                                        <div class="clearfix event_condtion4_two">
                                            <!-- "国家"角色属性值 -->
                                            <div class="fl guojia" style="width: 58px;margin-left: -10px;">国家(地区)
                                            </div>
                                            <div class="width-150 fl checkBoxSelect" id="actor1Countrycode">
                                                <!-- <div id="a1" style="overflow:hidden; white-space:nowrap;"></div> -->
                                            </div>
                                            <input type="hidden" id="countrycodeactor1" name="countrycodeactor1"/>
                                            <input type="hidden" name="actor1Attrs" value="1"/>
                                            <!-- "组织名"角色属性 -->
                                            <div class="fl bianma" style="width: 54px;">组织</div>
                                            <div class="fl clearfix">
                                                <div class="width-150 fl checkBoxSelect"
                                                     id="actor1organizationcode"></div>
                                                <input type="hidden" id="organizationcodeactor1"
                                                       name="organizationcodeactor1"/>
                                            </div>
                                            <input type="hidden" name="actor1Attrs" value="2"/>

                                            <!-- "宗教1"角色属性 -->
                                            <div class="fl bianma">宗教1</div>
                                            <div class="fl clearfix">
                                                <div class="width-150 fl checkBoxSelect"
                                                     id="actor1Religion1Code1"></div>
                                                <input type="hidden" id="religion1CodeActor1"
                                                       name="religion1CodeActor1"/>
                                            </div>
                                            <input type="hidden" name="actor1Attrs" value="3"/>
                                            <!-- "宗教2"角色属性 -->
                                            <div class="fl bianma">宗教2</div>
                                            <div class="fl clearfix">
                                                <div class="width-150 fl checkBoxSelect"
                                                     id="actor1Religion1Code2"></div>
                                                <input type="hidden" id="religion2CodeActor1"
                                                       name="religion2CodeActor1"/>
                                            </div>
                                            <input type="hidden" name="actor1Attrs" value="4"/>
                                        </div>
                                        <div class="clearfix" style=" margin-left:82px; margin-top:10px;">
                                            <!-- "种族"角色属性 -->
                                            <div class="fl bianma">种族</div>
                                            <div class="fl clearfix">
                                                <div class="width-150 fl checkBoxSelect" id="actor1EthnicCode"></div>
                                                <input type="hidden" id="ethnicCodeactor1" name="ethnicCodeactor1"/>
                                            </div>
                                            <input type="hidden" name="actor1Attrs" value="5"/>
                                            <!-- "种类1"角色属性 -->
                                            <div class="fl bianma" style="width: 54px;">种类1</div>
                                            <div class="fl clearfix">
                                                <div class="width-150 fl checkBoxSelect" id="actor1TypeCode1"></div>
                                                <input type="hidden" id="typeCode1actor1" name="typeCode1actor1"/>
                                            </div>
                                            <input type="hidden" name="actor1Attrs" value="6"/>
                                            <!-- "种类2"角色属性 -->
                                            <div class="fl bianma">种类2</div>
                                            <div class="fl clearfix">
                                                <div class="width-150 fl checkBoxSelect" id="actor1TypeCode2"></div>
                                                <input type="hidden" id="typeCode2actor1" name="typeCode2actor1"/>
                                            </div>
                                            <input type="hidden" name="actor1Attrs" value="7"/>
                                            <!-- "种类3"角色属性 -->
                                            <div class="fl bianma">种类3</div>
                                            <div class="fl clearfix">
                                                <div class="width-150 fl checkBoxSelect" id="actor1TypeCode3"></div>
                                                <input type="hidden" id="typeCode3actor1" name="typeCode3actor1"/>
                                            </div>
                                            <input type="hidden" name="actor1Attrs" value="8"/>
                                        </div>
                                        <!-- 角色一地理种类下拉框 -->
                                        <div class="clearfix event_condtion4_one">
                                            <div class="fl guojia">地理类型</div>
                                            <div class="fl clearfix">
                                                <div class="dowebok27 width-150">
                                                    <select id="actor1Geographictype" name="actor1Geographictype">
                                                        <option value="0" selected="selected">请选择</option>
                                                        <option value="1">国家(地区)</option>
                                                        <option value="2">州省</option>
                                                        <option value="3">城市</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="fl guojia" style="width: 54px;">国家/州省</div>
                                            <div id="actor1geographyCountry" class="width-150 checkBoxSelect"></div>
                                            <input type="hidden" id="geographyCountryactor1"
                                                   name="geographyCountryactor1"/>

                                            <!-- <div class="fl guojia">必须包含</div>
									<div class="fl clearfix">
										<input type="text" class="default_input" id="eventactor1necessaryKey" name="eventactor1necessaryKey" style="width: 132px"/>
									</div>
									<div class="fl guojia">不能包含</div>
									<div class="fl clearfix">
										<input type="text" class="default_input" id="eventactor1atLeastOneKey" name="eventactor1atLeastOneKey" style="width: 132px"/>
									</div>
									<div class="fl guojia">至少一个</div>
									<div class="fl clearfix">
										<input type="text" class="default_input" id="eventactor1exclusiveKey" name="eventactor1exclusiveKey" style="width: 132px"/>
									</div> -->

                                        </div>
                                        <div class="clearfix event_condtion4_two">
                                            <!-- 角色1地理位置-国家-->
                                            <div style="margin-bottom:3px;margin-left: 56px;">逻辑运算符:&&表示"且", ||
                                                表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如 (A && B &&
                                                !D)||C
                                            </div>
                                            <div style="margin-left: -7px;width: 63px;float: left;padding-top: 4px;">
                                                地理全称
                                            </div>
                                            <div class="radio_box flearfix" style="float: left;">
                                                <input class="condition_info_graph_ids2 fl" style="width: 500px;"
                                                       type="text" id="eventKeyWordactor1" name="eventKeyWordactor1"
                                                       onblur="validateKeyWords(this)"/>
                                                <span id="keywordSpanactor1"
                                                      style="position:relative;left:20px;width:40px;color: red"></span>
                                            </div>
                                            <div style="padding: 3px;margin-left: 10px;float: left;"><input
                                                    type="checkbox" style="vertical-align: middle;" value="0" checked
                                                    name="eventKeyWordactor1IsBig">区分大小写
                                            </div>
                                        </div>
                                        <div class="fl clearfix">
                                            <div class="clearfix event_condtion4_three">
                                                <div class="td2_2 fl"><span class="span1">角色2</span></div>
                                                <!-- "国家"角色属性值 -->
                                                <div class="fl guojia" style="width: 58px;margin-left: -10px;">
                                                    国家(地区)
                                                </div>
                                                <div class="fl clearfix">
                                                    <div class="width-150 fl checkBoxSelect" id="actor2Countrycode">
                                                    </div>
                                                    <input type="hidden" id="countrycodeactor2"
                                                           name="countrycodeactor2"/>
                                                </div>
                                                <input type="hidden" name="actor2Attrs" value="1"/>
                                                <!-- "组织名"角色属性 -->
                                                <div class="fl bianma" style="width: 54px;">组织</div>
                                                <div class="fl clearfix">
                                                    <div class="width-150 fl checkBoxSelect"
                                                         id="actor2organizationcode"></div>
                                                    <input type="hidden" id="organizationcodeactor2"
                                                           name="organizationcodeactor2"/>
                                                </div>
                                                <input type="hidden" name="actor2Attrs" value="2"/>

                                                <!-- "宗教1"角色属性 -->
                                                <div class="fl bianma">宗教1</div>
                                                <div class="fl clearfix">
                                                    <div class="width-150 fl checkBoxSelect"
                                                         id="actor2Religion1Code1"></div>
                                                    <input type="hidden" id="religion1CodeActor2"
                                                           name="religion1CodeActor2"/>
                                                </div>
                                                <input type="hidden" name="actor2Attrs" value="3"/>

                                                <!-- "宗教2"角色属性 -->
                                                <div class="fl bianma">宗教2</div>
                                                <div class="fl clearfix">
                                                    <div class="width-150 fl checkBoxSelect"
                                                         id="actor2Religion1Code2"></div>
                                                    <input type="hidden" id="religion2CodeActor2"
                                                           name="religion2CodeActor2"/>
                                                </div>
                                                <input type="hidden" name="actor2Attrs" value="4"/>
                                            </div>
                                            <div class="clearfix event_condtion4_one">
                                                <!-- "种族"角色属性 -->
                                                <div class="fl bianma">种族</div>
                                                <div class="fl clearfix">
                                                    <div class="width-150 fl checkBoxSelect"
                                                         id="actor2EthnicCode"></div>
                                                    <input type="hidden" id="ethnicCodeactor2" name="ethnicCodeactor2"/>
                                                </div>
                                                <input type="hidden" name="actor2Attrs" value="5"/>
                                                <!-- "种类1"角色属性 -->
                                                <div class="fl bianma" style="width: 54px;">种类1</div>
                                                <div class="fl clearfix">
                                                    <div class="width-150 fl checkBoxSelect" id="actor2TypeCode1"></div>
                                                    <input type="hidden" id="typeCode1actor2" name="typeCode1actor2"/>
                                                </div>
                                                <input type="hidden" name="actor2Attrs" value="6"/>
                                                <!-- "种类2"角色属性 -->
                                                <div class="fl bianma">种类2</div>
                                                <div class="fl clearfix">
                                                    <div class="width-150 fl checkBoxSelect" id="actor2TypeCode2"></div>
                                                    <input type="hidden" id="typeCode2actor2" name="typeCode2actor2"/>
                                                </div>
                                                <input type="hidden" name="actor2Attrs" value="7"/>
                                                <!-- "种类3"角色属性 -->
                                                <div class="fl bianma">种类3</div>
                                                <div class="fl clearfix">
                                                    <div class="width-150 fl checkBoxSelect" id="actor2TypeCode3"></div>
                                                    <input type="hidden" id="typeCode3actor2" name="typeCode3actor2"/>
                                                </div>
                                                <input type="hidden" name="actor2Attrs" value="8"/>
                                            </div>
                                            <!-- 角色二地理种类下拉框 -->
                                            <div class="clearfix event_condtion4_one">
                                                <div class="fl guojia">地理类型</div>
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
                                                <!-- 角色2地理位置-国家-->
                                                <div class="fl guojia" style="width: 54px;">国家/州省</div>
                                                <div class="width-150 checkBoxSelect" id="actor2geographyCountry"></div>
                                                <input type="hidden" id="geographyCountryactor2"
                                                       name="geographyCountryactor2"/>
                                                <!-- <div class="fl guojia">必须包含</div>
											<div class="fl clearfix">
												<input type="text" class="default_input" id="eventactor2exclusiveKey" name="eventactor2necessaryKey" style="width: 132px"/>
											</div>
											<div class="fl guojia">不能包含</div>
											<div class="fl clearfix">
												<input type="text" class="default_input" id="eventactor2atLeastOneKey" name="eventactor2atLeastOneKey" style="width: 132px"/>
											</div>
											<div class="fl guojia">至少一个</div>
											<div class="fl clearfix">
												<input type="text" class="default_input" id="eventactor2exclusiveKey" name="eventactor2exclusiveKey" style="width: 132px"/>
											</div> -->

                                            </div>
                                            <div class="clearfix event_condtion4_two">
                                                <div style="margin-bottom:3px;margin-left: 56px;">
                                                    逻辑运算符:&&表示“且”,||表示“或”,!(英文)表示“非”,可以用(
                                                    )表示一个主体优先级,例如 :(A && B && !D)||C
                                                </div>
                                                <div style="margin-left: -7px;width: 63px;float: left;padding-top: 4px;">
                                                    地理全称
                                                </div>
                                                <div class="radio_box" style="float: left;">
                                                    <input class="condition_info_graph_ids2 fl" style="width: 500px;"
                                                           type="text" id="eventKeyWordactor2" name="eventKeyWordactor2"
                                                           onblur="validateKeyWords(this)"/>
                                                    <span id="keywordSpanactor2"
                                                          style="position:relative;left:20px;width:40px;color: red"></span>
                                                </div>
                                                <div style="padding: 3px;margin-left: 10px;float: left;"><input
                                                        type="checkbox" style="vertical-align: middle;" value="0"
                                                        checked name="eventKeyWordactor2IsBig">区分大小写
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <!-- 事件属性 -->
                                <li class="clearfix" id="eventProperty">
                                    <div class="td1 fl"><p class="event_property_png fl"></p><b
                                            style="line-height:15px;">事件属性：</b></div>
                                    <div class="fl clearfix checkBoxSelect" style="width:954px;">
                                        <div class="td2_2 fl"><span class="span1">类型</span></div>
                                        <div class="clearfix fl">
                                            <!-- 大类-->
                                            <div class="fl guojia">大类</div>
                                            <div class="fl clearfix">
                                                <div class="width-150 fl checkBoxSelect" id="quadClass"></div>
                                                <input type="hidden" id="quadClassData" name="quadClassData"/>
                                            </div>
                                            <input type="hidden" name="eventAttrs" value="1"/>
                                            <!-- 根类 -->
                                            <div class="fl bianma" style="width: 54px;">根类</div>
                                            <div class="fl clearfix">
                                                <div class="width-150 fl checkBoxSelect" id="rootEvent"></div>
                                                <input type="hidden" id="rootEventData" name="rootEventData"/>
                                            </div>
                                            <input type="hidden" name="eventAttrs" value="2"/>

                                            <!-- 基类 -->
                                            <div class="fl bianma">基类</div>
                                            <div class="fl clearfix">
                                                <div class="width-150 fl checkBoxSelect" id="baseEvent"></div>
                                                <input type="hidden" id="baseEventData" name="baseEventData"/>
                                            </div>
                                            <input type="hidden" name="eventAttrs" value="3"/>

                                            <!-- 全事件 -->
                                            <div class="fl bianma">子类</div>
                                            <div class="fl clearfix">
                                                <div class="width-150 fl checkBoxSelect" id="eventCode"></div>
                                                <input type="hidden" id="codeEventData" name="codeEventData"/>
                                            </div>
                                            <input type="hidden" name="eventAttrs" value="4"/>
                                        </div>
                                        <!-- 地理全名 -->
                                        <div class="fl clearfix homeNotShow" style="margin-left: -82px;">
                                            <div class="clearfix fl event_condtion4_three">
                                                <div class="td2_2 fl"><span class="span1">发生地</span></div>
                                                <div class="fl guojia">地理类型</div>
                                                <div class="fl clearfix">
                                                    <div class="dowebok28 width-150">
                                                        <select id="actorGeographictype" name="Geographictype">
                                                            <option value="0" selected="selected">请选择</option>
                                                            <option value="1">国家(地区)</option>
                                                            <option value="2">州省</option>
                                                            <option value="3">城市</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <!-- 发生地国家 -->
                                                <div class="fl guojia" style="width: 54px;">国家/州省</div>
                                                <div class="fl clearfix">
                                                    <div class="width-150 checkBoxSelect"
                                                         id="actorgeographyCountry"></div>
                                                    <input type="hidden" id="geographyCountryactor"
                                                           name="geographyCountryactor"/>
                                                </div>
                                                <input type="hidden" name="eventAttrs" value="6"/>

                                            </div>
                                        </div>

                                        <div class="clearfix fl event_condtion4_two homeNotShow" style="">
                                            <div style="margin-bottom:3px;margin-left: 56px;">逻辑运算符:&&表示"且", ||
                                                表示"或", ! (英文)表示"非",可以用( )表示一个主体优先级,例如 (A && B &&
                                                !D)||C
                                            </div>
                                            <div style="margin-left: -7px;width: 63px;float: left;padding-top: 4px;">
                                                地理全称
                                            </div>
                                            <div class="fl" style="float: left;">
                                                <input class="condition_info_graph_ids2 fl" style="width: 500px;"
                                                       type="text" id="eventKeyWordactor" name="eventKeyWordactor"
                                                       onblur="validateKeyWords(this)"/>
                                                <span id="keywordSpanactor"
                                                      style="position:relative;left:20px;width:40px;color: red"></span>
                                            </div>
                                            <div style="padding: 3px;margin-left: 10px;float: left;"><input
                                                    type="checkbox" style="vertical-align: middle;" value="0" checked
                                                    name="eventKeyWordactorIsBig">区分大小写
                                            </div>
                                        </div>
                                        <!-- 其他 -->
                                        <div class="fl clearfix homeNotShow">
                                            <div class="clearfix fl event_condtion4_three">
                                                <div class="td2_2 fl"><span class="span1">其他</span></div>
                                                <!-- 源URL -->
                                                <div class="fl bianma">源URL</div>
                                                <div class="fl clearfix">
                                                    <div class="fl width-150">
                                                        <input type="hidden" name="eventAttrs" value="8"/>
                                                        <input class="default_input" id="eventAttr8"
                                                               style="width: 131px;" type="text"
                                                               name="eventAttrValues"/>
                                                    </div>
                                                </div>
                                                <!-- 情感值 -->
                                                <div class="fl bianma">情感值</div>
                                                <div class="fl width160 clearfix">
                                                    <div class="fl width160">
                                                        <input type="hidden" name="eventAttrs" value="9"/>
                                                        <input style="width:42px;" id="eventAttr9"
                                                               class="default_input fl" type="text" value="-100"
                                                               name="eventAttrValues" onblur="validateEventAttr9()"/>
                                                        <span class="fl ljX">—</span>
                                                        <input type="hidden" name="eventAttrs" value="10"/>
                                                        <input style="width:42px;" id="eventAttr10"
                                                               class="default_input fl" type="text" value="100"
                                                               name="eventAttrValues" onblur="validateEventAttr10()"/>
                                                        <span id="spang" style="display:none;float: right;"><img
                                                                src="<%=basePath %>/static/images/delete.png"
                                                                style="margin-top: -2px;"></img></span>
                                                    </div>
                                                </div>
                                                <!-- 影响度 -->
                                                <div class="fl bianma">影响度</div>
                                                <div class="fl width160 clearfix">
                                                    <div class="fl width160">
                                                        <input type="hidden" name="eventAttrs" value="11"/>
                                                        <input style="width:42px;" id="eventAttr11"
                                                               class="default_input fl" type="text" value="-10"
                                                               name="eventAttrValues" onblur="validateEventAttr11()"/>
                                                        <span class="fl ljX">—</span>
                                                        <input type="hidden" name="eventAttrs" value="12"/>
                                                        <input style="width:42px;" id="eventAttr12"
                                                               class="default_input fl" type="text" value="10"
                                                               name="eventAttrValues" onblur="validateEventAttr12()"/>
                                                        <span id="spanh" style="display:none;float: right;"><img
                                                                src="<%=basePath %>/static/images/delete.png"
                                                                style="margin-top: -2px;"></img></span>
                                                    </div>
                                                </div>
                                                <!-- 是否为根类 -->
                                                <div class="fl bianma">是否根类</div>
                                                <div class="fl clearfix">
                                                    <div class="fl width138" style="width:80px;">
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
                                <!-- <li class="clearfix">
								<div class="td1 fl"><p class="weight_png fl"></p><b>高级查询：</b></div>
								<div class="clearfix fl event_condtion4_two homeNotShow">
									<div style="margin-left: -7px;width: 63px;float: left;padding-top: 4px;">自定义查询</div>
									<div class="fl" style="float: left;">
										<input class="condition_info_graph_ids2 fl" style="width: 500px;" type="text" id="customQuery" name="customQuery"/>
									</div>
								</div>
							</li> -->
                                <!-- 权重依据 范围-->
                                <li class="clearfix" id="quanzhongkuang" style="display: none;">
                                    <div class="td1 fl" id="newquanzhongkuang"><p class="weight_png fl"></p>
                                        <b>权重值：</b></div>
                                    <div class="fl bianmatb">事件数</div>
                                    <div class="fl clearfix">
                                        <div class="fl" style="width:149px !important;">
                                            <input style="width:42px;" class="default_input2 fl" type="text"
                                                   id="stNumMentions" name="stNumMentions"/>
                                            <span class="fl ljX_1">—</span>
                                            <input style="width:42px;" class="default_input2 fl" type="text"
                                                   id="edNumMentions" name="edNumMentions"/>
                                        </div>
                                    </div>
                                    <div class="fl bianmatb">文章数</div>
                                    <div class="fl clearfix">
                                        <div class="fl" style="width:149px !important;">
                                            <input style="width:42px;" class="default_input2 fl" type="text"
                                                   id="stNumArticles" name="stNumArticles"/>
                                            <span class="fl ljX_1">—</span>
                                            <input style="width:42px;" class="default_input2 fl" type="text"
                                                   id="edNumArticles" name="edNumArticles"/>
                                        </div>
                                    </div>
                                    <div class="fl bianmatb">信源数</div>
                                    <div class="fl clearfix">
                                        <div class="fl" style="width:149px !important;">
                                            <input style="width:42px;" class="default_input2 fl" type="text"
                                                   id="stNumSources" name="stNumSources"/>
                                            <span class="fl ljX_1">—</span>
                                            <input style="width:42px;" class="default_input2 fl" type="text"
                                                   id="edNumSources" name="edNumSources"/>
                                        </div>
                                    </div>
                                </li>
                                <li class="clearfix"><input class="submit" type="button" onclick="eventSub(1);"
                                                            value="提交" id="scheduleState1"></li>
                            </div>
                        </ul>


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
                                    <!-- <tr>
										<td><font class="sbFont">关键字提示 :</font> 并 and,或 or,等于 =,不等于 !=,大于等于 >=,小于等于 <=,模糊匹配 like,模糊不匹配  not like,范围查询 in,不在范围查询 not in</td>
									</tr>
									<tr>
										<td><font class="sbFont">案例SQL :</font> (ActionGeo_FullName like '%china%' or ActionGeo_FullName not like '%white House%') or Actor1Code not in('CAN','CHN') and ActionGeo_Type in (3,4,5)</td>
									</tr> -->
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
                                <textarea class="texthtml" id="customQuery" name="customQuery"
                                          placeholder="内容可以参考案例SQL"></textarea>
                                <div class="sub"><input class="submit" type="button" onclick="eventSub(2);"
                                                        style="bottom: 0px;right: 0px;position: relative;" value="提交"
                                                        id="scheduleState2"></div>
                                <div class="clearfloat"></div>
                            </div>
                        </div>
                    </div>
                    <div class="pos_shadow"></div>
                </div>
            </fieldset>
        </div>


    </div>
</form>
<div id="shadow" class="shadow"></div>
<!-- 事件分类选择弹出层 -->
<div class="popup">
    <div class="popup_t">
        <h3 class="popup_h3 fl">事件分类</h3>
        <label class="check_z" for=""><input id="sec_all_event" class="sec_all" type="checkbox"> 全选</label>
    </div>
    <div class="popup_m">
        <ul id="popup_ul_event" class="popup_ul  clearfix">
            <c:forEach items="${categoryList}" var="category" varStatus="indx">
                <li><label for="event${indx.index + 1}"><input id="event${indx.index + 1}" type="checkbox"
                                                               value="${category.categoryId}"> ${category.categoryName}
                </label></li>
            </c:forEach>
        </ul>
    </div>
    <div class="popup_b">
        <p class="fr">
            <span id="save_event" class="save">确定</span>
            <span class="cancel">取消</span>
        </p>
    </div>
</div>
<script src="<%=basePath %>/static/js/config/config.js"></script>
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框脚本 -->
<%--
<script src="<%=basePath %>/static/js/layui/layui.js"></script>
 --%>
<script>
    //情感值校验
    function aaa() {
        $(this).siblings(".down").css({"display": "block"});
    };
    $('.high_search').on('click', function () {
        $('.ulli').toggle();
        $('.property_case').toggle();
        if ($('.property_case').css('display') == "block") {
            $('.high_search').css('background', '#0087fd')
        } else {
            $('.high_search').css('background', 'none')
        }
    })

    //zcm mark st
    function addConfig(string) {
        //消除一些没有必要的值
        $(".relationId").val("");
        $("#isAgain").val(0);

        //高级查询复位
        $('.high_search').css('background', 'none');
        $('.ulli').show();
        $('.property_case').hide();

        $("#sec_all_event").prop("checked", false);
        getSelectCom();
        $(".pos_shadow").css("display", "none");
        $(".pos_shadow2").css("display", "none");
        $(".aa").val("");
        $("#customQuery").val("");
        $("#actorModel").show();
        $("#shishi").hide();
        $("#eventProperty").show();
        $("#bizhong").hide();
        $("#eventKeyWordactor1").val("");
        $("#eventKeyWordactor2").val("");
        $("#eventKeyWordactor").val("");
        $(".add_date_btn").hide();
        var eventTimeNum = $(".addEventDate").length;
        for (var i = 1; i <= eventTimeNum; i++) {
            var pdid = 'appendDatas' + i;
            $("#" + pdid + "").remove();
            $(".addEventDate").remove();
        }
        $("#infodiv").show();
        $("#event_type").attr('onclick', 'dianji()');
        $("input[name='configName']").val("");
        $("input[name='priority']").val("1");
        $("input[name='event_type']").val("");
        $("input[name='remark']").val("");
        $("#dateRange").show();
        //数据源显示
        $("#dataSourceType").show();
        $('#popup_ul_event input[type=checkbox]').each(function () {
            $(this).prop('checked', false);
        });
        //权重
        $(".tjradio1").prop("checked", true);
        $("#radio1").prop("checked", true);
        //角色1属性
        $("#actor1Countrycode").attr("title", "");
        $("#actor1Countrycode").attr("data-id", "");
        $("#actor1Countrycode").attr("tit", "");
        $("#actor1Countrycode").html("");

        $("#actor1organizationcode").attr("title", "");
        $("#actor1organizationcode").attr("data-id", "");
        $("#actor1organizationcode").attr("tit", "");
        $("#actor1organizationcode").html("");

        $("#actor1Religion1Code1").attr("title", "");
        $("#actor1Religion1Code1").attr("data-id", "");
        $("#actor1Religion1Code1").attr("tit", "");
        $("#actor1Religion1Code1").html("");

        $("#actor1Religion1Code2").attr("title", "");
        $("#actor1Religion1Code2").attr("data-id", "");
        $("#actor1Religion1Code2").attr("tit", "");
        $("#actor1Religion1Code2").html("");

        $("#actor1EthnicCode").attr("title", "");
        $("#actor1EthnicCode").attr("data-id", "");
        $("#actor1EthnicCode").attr("tit", "");
        $("#actor1EthnicCode").html("");

        $("#actor1TypeCode1").attr("title", "");
        $("#actor1TypeCode1").attr("data-id", "");
        $("#actor1TypeCode1").attr("tit", "");
        $("#actor1TypeCode1").html("");

        $("#actor1TypeCode2").attr("title", "");
        $("#actor1TypeCode2").attr("data-id", "");
        $("#actor1TypeCode2").attr("tit", "");
        $("#actor1TypeCode2").html("");

        $("#actor1TypeCode3").attr("title", "");
        $("#actor1TypeCode3").attr("data-id", "");
        $("#actor1TypeCode3").attr("tit", "");
        $("#actor1TypeCode3").html("");

        $("#actor1geographyCountry").attr("title", "");
        $("#actor1geographyCountry").attr("data-id", "");
        $("#actor1geographyCountry").attr("tit", "");
        $("#actor1geographyCountry").html("");
        //角色二
        $("#actor2Countrycode").attr("title", "");
        $("#actor2Countrycode").attr("data-id", "");
        $("#actor2Countrycode").attr("tit", "");
        $("#actor2Countrycode").html("");

        $("#actor2organizationcode").attr("title", "");
        $("#actor2organizationcode").attr("data-id", "");
        $("#actor2organizationcode").attr("tit", "");
        $("#actor2organizationcode").html("");

        $("#actor2Religion1Code1").attr("title", "");
        $("#actor2Religion1Code1").attr("data-id", "");
        $("#actor2Religion1Code1").attr("tit", "");
        $("#actor2Religion1Code1").html("");

        $("#actor2Religion1Code2").attr("title", "");
        $("#actor2Religion1Code2").attr("data-id", "");
        $("#actor2Religion1Code2").attr("tit", "");
        $("#actor2Religion1Code2").html("");

        $("#actor2EthnicCode").attr("title", "");
        $("#actor2EthnicCode").attr("data-id", "");
        $("#actor2EthnicCode").attr("tit", "");
        $("#actor2EthnicCode").html("");

        $("#actor2TypeCode1").attr("title", "");
        $("#actor2TypeCode1").attr("data-id", "");
        $("#actor2TypeCode1").attr("tit", "");
        $("#actor2TypeCode1").html("");

        $("#actor2TypeCode2").attr("title", "");
        $("#actor2TypeCode2").attr("data-id", "");
        $("#actor2TypeCode2").attr("tit", "");
        $("#actor2TypeCode2").html("");

        $("#actor2TypeCode3").attr("title", "");
        $("#actor2TypeCode3").attr("data-id", "");
        $("#actor2TypeCode3").attr("tit", "");
        $("#actor2TypeCode3").html("");

        $("#actor2geographyCountry").attr("title", "");
        $("#actor2geographyCountry").attr("data-id", "");
        $("#actor2geographyCountry").attr("tit", "");
        $("#actor2geographyCountry").html("");

        $("#quadClass").attr("title", "");
        $("#quadClass").attr("data-id", "");
        $("#quadClass").attr("tit", "");
        $("#quadClass").html("");

        $("#rootEvent").attr("title", "");
        $("#rootEvent").attr("data-id", "");
        $("#rootEvent").attr("tit", "");
        $("#rootEvent").html("");

        $("#baseEvent").attr("title", "");
        $("#baseEvent").attr("data-id", "");
        $("#baseEvent").attr("tit", "");
        $("#baseEvent").html("");

        $("#eventCode").attr("title", "");
        $("#eventCode").attr("data-id", "");
        $("#eventCode").attr("tit", "");
        $("#eventCode").html("");

        $("#actorgeographyCountry").attr("title", "");
        $("#actorgeographyCountry").attr("data-id", "");
        $("#actorgeographyCountry").attr("tit", "");
        $("#actorgeographyCountry").html("");

        //权重框
        $("#stNumMentions").val("");
        $("#edNumMentions").val("");
        $("#stNumArticles").val("");
        $("#edNumArticles").val("");
        $("#stNumSources").val("");
        $("#edNumSources").val("");
        getSelectCom();
        //事件属性
        $("#eventAttr8").val("");
        $("#eventAttr9").val("-100");
        $("#eventAttr10").val("100");
        $("#eventAttr11").val("-10");
        $("#eventAttr12").val("10");
        validateEventAttr9();
        validateEventAttr10();
        validateEventAttr11();
        validateEventAttr12();
        jiaoyan();
        $("#isPrivate option").each(function () {
            if ($(this).val() == 1) {
                $(this).parent().siblings('input[type=text]').val("私有");
                $(this).attr('selected', true);
            } else {
                $(this).attr('selected', false);
            }
        });
        $("#nowTime option").each(function () {
            if ($(this).val() == 1) {
                $(this).parent().siblings('input[type=text]').val("否");
                $(this).attr('selected', true);
            } else {
                $(this).attr('selected', false);
            }
        });
        $("#eventAttr7 option").each(function () {
            if ($(this).val() == "-1") {
                $(this).parent().siblings('input[type=text]').val("请选择");
                $(this).attr('selected', true);
            } else {
                $(this).attr('selected', false);
            }
        });
        //三个地理位置重置
        $("#actor1Geographictype option").each(function () {
            if ($(this).val() == "0") {
                $(this).parent().siblings('input[type=text]').val("请选择");
                $(this).attr('selected', true);
            } else {
                $(this).attr('selected', false);
            }
        });
        $("#actor2Geographictype option").each(function () {
            if ($(this).val() == "0") {
                $(this).parent().siblings('input[type=text]').val("请选择");
                $(this).attr('selected', true);
            } else {
                $(this).attr('selected', false);
            }
        });
        $("#actorGeographictype option").each(function () {
            if ($(this).val() == "0") {
                $(this).parent().siblings('input[type=text]').val("请选择");
                $(this).attr('selected', true);
            } else {
                $(this).attr('selected', false);
            }
        });
        $("#scheduleState1").css("display", "block");
        //国家关系8个参数值置空
        $("#yearNorm1").val("");
        $("#monthNorm1").val("");
        $("#weekNorm1").val("");
        $("#dateNorm1").val("");
        $("#yearNorm2").val("");
        $("#monthNorm2").val("");
        $("#weekNorm2").val("");
        $("#dateNorm2").val("");
        //3个大小写选中
        $("input[name=eventKeyWordactorIsBig]").prop("checked", true);
        $("input[name=eventKeyWordactor1IsBig]").prop("checked", true);
        $("input[name=eventKeyWordactor2IsBig]").prop("checked", true);
        //将新增加的日期全部删除
        $(".add_date").remove();
        if (string != 'two') {
            //默认数据源一点击
            setTimeout(function () {
                $(".dataSourceType1").click();
            }, 1000);
        }

    }

    var rs = null;

    function showConfigList() {
        var configName = $('#s_configName').val();
        var creator = $('#s_creator').val();
        var configCategory = $('#typeFilter').val();
        var pageIndexNew = $('#pageIndexNew').val();
        var type = null;
        var scheduleState = $('#scheduleStateFilter').val();
        var configFlag = $('#configFlag').val();
        var dt = {
            pageIndex: pageIndexNew,
        };
        if (configName != null && configName != '') {
            dt['configName'] = configName;
        }
        if (creator != null && creator != '') {
            dt['creator'] = creator;
        }
        if (configCategory != null && configCategory != '') {
            dt['configCategory'] = configCategory;
        }
        if (scheduleState != null && scheduleState != '') {
            dt['scheduleState'] = scheduleState;
        }
        if (configFlag != null && configFlag != '') {
            dt['configFlag'] = configFlag;
        }
        $.ajax({
            url: '../config/getConfigList',
            type: 'POST',
            data: dt,
            success: function (data) {
                var pageSize = data.pageSize;
                var totalRows = data.total;
                var pageIndex = data.pageIndex;
                rs = data.data;
                $("#configCategory").val(data.configCategory);
                $("#typeFilter").val(data.configCategory);
                $("#Pagination").pagination(totalRows, {
                    callback: pageselectCallback,
                    current_page: pageIndex,
                    num_display_entries: 4, //主体页数
                    items_per_page: pageSize, //每页显示1项
                    num_edge_entries: 2 //边缘页数
                });
                //防止浏览器input框记忆数据，必须放在加载完数据后
                $(":input").attr("autocomplete", "off")
            }
        });
    }

    function pageselectCallback(pageIndex, jq) {
        $("#pageIndexNew").val(pageIndex);
        initData(pageIndex);
    }

    function initData(pageIndex) {
        var tbodys = '';
        var configName = $('#s_configName').val();
        var creator = $('#s_creator').val();
        var configCategory = $('#typeFilter').val();
        var scheduleState = $('#scheduleStateFilter').val();
        var configFlag = $('#configFlag').val();
        var dt = {
            pageIndex: pageIndex
        };
        if (configName != null && configName != '') {
            dt['configName'] = configName;
        }
        if (creator != null && creator != '') {
            dt['creator'] = creator;
        }
        if (configCategory != null && configCategory != '') {
            dt['configCategory'] = configCategory;
        }
        if (scheduleState != null && scheduleState != '') {
            dt['scheduleState'] = scheduleState;
        }
        if (configFlag != null && configFlag != '') {
            dt['configFlag'] = configFlag;
        }
        if (rs == null) {
            $.ajax({
                url: '../config/getConfigList',
                type: 'POST',
                data: dt,
                success: function (data) {
                    tbodys = packageConfigData(data.data);
                    $('.table tbody').html(tbodys);
                },
                error: function(xhr, status, error) {
                    // 处理错误
                    console.log('Ajax Error:', error);
                }
            });
        } else {
            tbodys = packageConfigData(rs);
            rs = null;
            $('.table tbody').html(tbodys);
        }
        return true;
    }

    function packageConfigData(rs) {

        //计算序号与分页是对应的数值
        var pageIndex_current = $('#pageIndexNew').val();
        var pageSize = 10;

        var tbody = '', trs = '';
        var exec1 = 'exec1';
        var exec2 = 'exec2';
        //处理执行图表两种皮肤的切换
        if (${bgFlag} == 2
    )
        {
            exec1 = "exec1_white";
            exec2 = "exec2_white";
        }
        var minDate = '${minDate[2] }';
        var maxDate = '${maxDate[2] }';

        $.each(rs, function (i, item) {
            trs += '<tr><td><input type="checkbox" class="newFuxuankuang" onclick="newFuxuankuang()" data=' + item.configId + ' data-status=' + item.scheduleState + ' data-flid=' + item.flid + '></td><td>' + (pageIndex_current * pageSize + i + 1) + '</td>';
            switch (item.priority) {
                case 1:
                    trs += '<td><span class="sort sort1">1</span></td>';
                    break;
                case 2:
                    trs += '<td><span class="sort sort2">2</span></td>';
                    break;
                case 3:
                    trs += '<td><span class="sort sort3">3</span></td>';
                    break;
                default:
                    trs += '<td><span class="sort sort7">' + item.priority + '</span></td>';
                    break;
            }
            //根据皮肤ID切换图片
            <%-- if(${bgFlag} == null || ${bgFlag} == 1){
			if(item.isShow == 1){
				trs += '<td><img class="gq" onclick="isShow('+ item.configId +',\''+ item.isShow +'\',\''+ item.scheduleState +'\')" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>';
			}else if(item.isShow == 2){
				trs += '<td><img class="gq" onclick="isShow('+ item.configId +',\''+ item.isShow +'\',\''+ item.scheduleState +'\')" src="<%=basePath %>/static/images/gq2.png" alt="挂起"></td>';
			}
		}else{
			if(item.isShow == 1){
				trs += '<td><img class="gq" onclick="isShow('+ item.configId +',\''+ item.isShow +'\',\''+ item.scheduleState +'\')" src="<%=basePath %>/static/images/gq2.png" alt="挂起"></td>';
			}else if(item.isShow == 2){
				trs += '<td><img class="gq" onclick="isShow('+ item.configId +',\''+ item.isShow +'\',\''+ item.scheduleState +'\')" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>';
			}
		} --%>
            if (item.isShow == 1) {
                if (${sessionScope.LOGINUSER.roleId}==1
            )
                {//管理员最高权限
                    trs += '<td><img class="gq" onclick="isShow(' + item.configId + ',\'' + item.isShow + '\',\'yes\')" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>';
                }
            else
                if (${sessionScope.LOGINUSER.id} == item.creatorId
            )
                {
                    trs += '<td><img class="gq" onclick="isShow(' + item.configId + ',\'' + item.isShow + '\',\'yes\')" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>';
                }
            else
                {
                    trs += '<td><img class="gq" onclick="isShow(' + item.configId + ',\'' + item.isShow + '\',\'no\')" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>';
                }
            } else if (item.isShow == 2) {
                if (${sessionScope.LOGINUSER.roleId}==1
            )
                {//管理员最高权限
                    trs += '<td><img class="gq" onclick="isShow(' + item.configId + ',\'' + item.isShow + '\',\'yes\')" src="<%=basePath %>/static/images/gq2.png" alt="挂起"></td>';
                }
            else
                if (${sessionScope.LOGINUSER.id} == item.creatorId
            )
                {
                    trs += '<td><img class="gq" onclick="isShow(' + item.configId + ',\'' + item.isShow + '\',\'yes\')" src="<%=basePath %>/static/images/gq2.png" alt="挂起"></td>';
                }
            else
                {
                    trs += '<td><img class="gq" onclick="isShow(' + item.configId + ',\'' + item.isShow + '\',\'no\')" src="<%=basePath %>/static/images/gq2.png" alt="挂起"></td>';
                }
            }


            trs += '<td>' + item.configName + '</td>';
            trs += '<td>' + item.categoryName + '</td>';
            if (item.creator == undefined) {
                trs += '<td></td>';
            } else {
                trs += '<td>' + item.creator + '</td>';
            }
            if (item.isPrivate == 1) {
                trs += '<td>私有</td>';
            } else {
                trs += '<td>公开</td>';
            }
            trs += '<td>' + item.createDate + '</td>';
            trs += '<td>' + item.remark + '</td>';
            if (item.scheduleState == 0) {
                trs += '<td><img title="待执行" src="<%=basePath %>/static/images/state2.png"/></td>';
            } else if (item.scheduleState == 1) {
                trs += '<td><img title="执行中" src="<%=basePath %>/static/images/state4.png"/></td>';
            } else if (item.scheduleState == 2) {
                trs += '<td><img title="执行成功" src="<%=basePath %>/static/images/state1.png"/></td>';
            } else if (item.scheduleState == 3) {
                trs += '<td><img title="执行失败" src="<%=basePath %>/static/images/state3.png"/></td>';
            } else if (item.scheduleState == 4) {
                trs += '<td><img title="排队中" src="<%=basePath %>/static/images/state5.png"/></td>';
            }
            if (item.scheduleState == 2) {//执行成功
                if (${sessionScope.LOGINUSER.roleId}==2
            )
                {//普通用户没有下载数据功能
                    trs += '<td style="position:relative;"><img title="执行成功" class="set" src="<%=basePath %>/static/images/exec3.png"/>';
                    if (item.relationId != null && item.relationId != undefined) {
                        trs += '<img title="修改" class="set" src="<%=basePath %>/static/images/set.png" onclick="editConfig(' + item.configId + ',\'' + item.categoryName + '\',\'' + item.flid + '\',\'' + item.scheduleState + '\',\'' + minDate + '\',\'' + maxDate + '\',\'two\')"/>';
                    } else {
                        trs += '<img title="修改" class="set" src="<%=basePath %>/static/images/set.png" onclick="editConfig(' + item.configId + ',\'' + item.categoryName + '\',\'' + item.flid + '\',\'' + item.scheduleState + '\',\'' + minDate + '\',\'' + maxDate + '\')"/>';
                    }
                    trs += '<img title="删除" class="set" onclick="delConfig(' + item.configId + ',' + item.flid + ')" src="<%=basePath %>/static/images/del.png"/>';
                    if (item.relationId == null || item.relationId == undefined) {//非二次回溯的配置有配置复制功能，二次回溯的配置没有此功能
                        trs += '<img title="配置复制" class="set" onclick="cloneConfig(' + item.configId + ',\'' + item.categoryName + '\',\'' + item.flid + '\')" src="<%=basePath %>/static/images/clone.png"/>';
                    }
                    trs += '</td>';
                }
            else
                {
                    trs += '<td style="position:relative;"><img title="执行成功" class="set" src="<%=basePath %>/static/images/exec3.png"/>';
                    if (item.relationId != null && item.relationId != undefined) {
                        trs += '<img title="修改" class="set" src="<%=basePath %>/static/images/set.png" onclick="editConfig(' + item.configId + ',\'' + item.categoryName + '\',\'' + item.flid + '\',\'' + item.scheduleState + '\',\'' + minDate + '\',\'' + maxDate + '\',\'two\')"/>';
                    } else {
                        trs += '<img title="修改" class="set" src="<%=basePath %>/static/images/set.png" onclick="editConfig(' + item.configId + ',\'' + item.categoryName + '\',\'' + item.flid + '\',\'' + item.scheduleState + '\',\'' + minDate + '\',\'' + maxDate + '\')"/>';
                    }
                    trs += '<img title="下载" class="set xiazai" src="<%=basePath %>/static/images/xiazai.png"/><img title="删除" class="set" onclick="delConfig(' + item.configId + ',' + item.flid + ')" src="<%=basePath %>/static/images/del.png"/>';
                    if (item.paths != undefined) {
                        trs += '<div class="down" >';
                        for (var i = 0; i < item.paths.length; i++) {
                            trs += '<p class="down_p" onclick=dowoladFile(' + item.paths[i].id + ')>' + item.paths[i].dataTypeName + '</p>'
                        }
                        trs += '</div>';
                    }
                    if (item.relationId != null && item.relationId != undefined && item.isAgain == 0) {//判断是否是回溯配置产生的子配置并且是没有进行二次回溯的配置
                        trs += '<img title="二次回溯" class="set" src="<%=basePath%>/static/images/begin_remountTo.png" onclick="twoRelationConfig(' + item.configId + ')">';
                    }
                    if (item.relationId == null || item.relationId == undefined) {//非二次回溯的配置有配置复制功能，二次回溯的配置没有此功能
                        trs += '<img title="配置复制" class="set" onclick="cloneConfig(' + item.configId + ',\'' + item.categoryName + '\',\'' + item.flid + '\')" src="<%=basePath %>/static/images/clone.png"/>';
                    }
                    trs += '</td>';
                }
            } else if (item.scheduleState == 1) {//执行中
                trs += '<td><img title="执行" class="set tijiao' + item.configId + '" src="<%=basePath %>/static/images/' + exec1 + '.png" />';
                if (item.relationId != null && item.relationId != undefined) {
                    trs += '<img title="修改" class="set" src="<%=basePath %>/static/images/set.png" onclick="editConfig(' + item.configId + ',\'' + item.categoryName + '\',\'' + item.flid + '\',\'' + item.scheduleState + '\',\'' + minDate + '\',\'' + maxDate + '\',\'two\')"/>';
                } else {
                    trs += '<img title="修改" class="set" src="<%=basePath %>/static/images/set.png" onclick="editConfig(' + item.configId + ',\'' + item.categoryName + '\',\'' + item.flid + '\',\'' + item.scheduleState + '\',\'' + minDate + '\',\'' + maxDate + '\')"/>';
                }
                if (${sessionScope.LOGINUSER.roleId} == 1
            )
                {//管理员才有下载数据功能
                    trs += '<img title="下载" class="set xiazai" src="<%=basePath %>/static/images/xiazai.png"/>';
                }
                trs += '<img title="删除" class="set" src="<%=basePath %>/static/images/del.png"/>';
                if (item.relationId == null || item.relationId == undefined) {//非二次回溯的配置有配置复制功能，二次回溯的配置没有此功能
                    trs += '<img title="配置复制" class="set" onclick="cloneConfig(' + item.configId + ',\'' + item.categoryName + '\',\'' + item.flid + '\')" src="<%=basePath %>/static/images/clone.png"/>';
                }
                trs += '<img title="强制停止" class="set" onclick="stopTask(' + item.configId + ')" src="<%=basePath %>/static/images/stopTask.png"/></td>';
            } else if (item.scheduleState == 4) {//排队中
                trs += '<td><img title="执行" class="set tijiao' + item.configId + '" src="<%=basePath %>/static/images/' + exec1 + '.png" />';
                if (item.relationId != null && item.relationId != undefined) {
                    trs += '<img title="修改" class="set" src="<%=basePath %>/static/images/set.png" onclick="editConfig(' + item.configId + ',\'' + item.categoryName + '\',\'' + item.flid + '\',\'' + item.scheduleState + '\',\'' + minDate + '\',\'' + maxDate + '\',\'two\')"/>';
                } else {
                    trs += '<img title="修改" class="set" src="<%=basePath %>/static/images/set.png" onclick="editConfig(' + item.configId + ',\'' + item.categoryName + '\',\'' + item.flid + '\',\'' + item.scheduleState + '\',\'' + minDate + '\',\'' + maxDate + '\')"/>';
                }
                if (${sessionScope.LOGINUSER.roleId} == 1
            )
                {//管理员才有下载数据功能
                    trs += '<img title="下载" class="set xiazai" src="<%=basePath %>/static/images/xiazai.png"/>';
                }
                trs += '<img title="删除" class="set" src="<%=basePath %>/static/images/del.png"/>';
                if (item.relationId == null || item.relationId == undefined) {//非二次回溯的配置有配置复制功能，二次回溯的配置没有此功能
                    trs += '<img title="配置复制" class="set" onclick="cloneConfig(' + item.configId + ',\'' + item.categoryName + '\',\'' + item.flid + '\')" src="<%=basePath %>/static/images/clone.png"/>';
                }
                trs += '<img title="强制停止" class="set" onclick="stopTask(' + item.configId + ')" src="<%=basePath %>/static/images/stopTask.png"/></td>';
            } else {
                <%-- trs += '<td><img title="执行" class="set tijiao'+item.configId+'" src="<%=basePath %>/static/images/'+exec2+'.png" onclick="updateConfigStatus('+ item.configId +')"/>'; --%>
                trs += '<td><img title="执行" class="set tijiao' + item.configId + '" src="<%=basePath %>/static/images/' + exec2 + '.png" onclick="execQuery(' + item.configId + ')"/>';
                if (item.relationId != null && item.relationId != undefined) {
                    trs += '<img title="修改" class="set" src="<%=basePath %>/static/images/set.png" onclick="editConfig(' + item.configId + ',\'' + item.categoryName + '\',\'' + item.flid + '\',\'' + item.scheduleState + '\',\'' + minDate + '\',\'' + maxDate + '\',\'two\')"/>';
                } else {
                    trs += '<img title="修改" class="set" src="<%=basePath %>/static/images/set.png" onclick="editConfig(' + item.configId + ',\'' + item.categoryName + '\',\'' + item.flid + '\',\'' + item.scheduleState + '\',\'' + minDate + '\',\'' + maxDate + '\')"/>';
                }
                if (${sessionScope.LOGINUSER.roleId} == 1
            )
                {//管理员才有下载数据功能
                    trs += '<img title="下载" class="set xiazai" src="<%=basePath %>/static/images/xiazai.png"/>';
                }
                trs += '<img title="删除" class="set" onclick="delConfig(' + item.configId + ',' + item.flid + ')" src="<%=basePath %>/static/images/del.png"/>';
                if (item.relationId == null || item.relationId == undefined) {//非二次回溯的配置有配置复制功能，二次回溯的配置没有此功能
                    trs += '<img title="配置复制" class="set" onclick="cloneConfig(' + item.configId + ',\'' + item.categoryName + '\',\'' + item.flid + '\')" src="<%=basePath %>/static/images/clone.png"/>';
                }
                trs += '</td>';
            }
            trs += '</tr>';
        });
        tbody += trs;
        return tbody;
    }

    function newFuxuankuang() {
        var chknum = $(".table tbody :checkbox").size();
        var chk = 0;
        $(".table tbody :checkbox").each(function () {
            if ($(this).prop("checked") == true) {
                chk++;
            }
        });
        if (chk == chknum) {
            $("#newAllcheck").prop("checked", true);
        } else {
            $("#newAllcheck").prop("checked", false);
        }
    }

    $("#newAllcheck").on('click', function () {
        $(".table tbody :checkbox").each(function () {
            $(this).prop("checked", $("#newAllcheck").prop("checked"));
        });

    });

    showConfigList();
</script>
<script>
    $(function () {
        //定义全局时间范围变量
        configDate = {"maxDate1": "", "minDate1": "", "maxDate2": "", "minDate2": "", "maxDate3": "", "minDate3": ""};
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
            startDate: configDate.minDate1,
            endDate: configDate.maxDate1,
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
            startDate: configDate.minDate1,
            endDate: configDate.maxDate1
        }).on('changeDate', function (e) {
            if ($(this).val() < $('.day1').val()) {
                $('.day1').val($(this).val());
            }
            var endTime = e.date;
            $('.day1').datepicker('setEndDate', endTime);
        });
        //内存大小移入显示详细的功能
        queryDataSpace(1);
        //ajax获取数据源对应的日期范围
        findEventConfigDateRange();

        //下拉多选框数据
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
        //多选框加载数据
        getSelectCom();
        //配置页面下载框
        $(".table").on("mouseover", ".xiazai", function () {
            $(this).siblings(".down").css({"display": "block"});
            $(this).parent().parent().siblings().children().children(".down").css({"display": "none"});
        });
        $(".table").on("mouseleave", ".down", function () {
            $(this).css({"display": "none"});
        });
        $(".table").on("click", ".close_down", function () {
            $(this).parent(".down").css({"display": "none"});
        });

        $('select:not(.selectCounts)').comboSelect();//所有select标签中非class为selectCounts的标签
        //下拉框 每一个下拉框对应一个ID，然后调用perfectScrollbar美化滚动条
        $(".dowebok0 ul").attr("id", "description0");
        $(".dowebok1 ul").attr("id", "description1");
        $(".dowebok2 ul").attr("id", "description2");
        $(".dowebok3 ul").attr("id", "description3");
        $(".dowebok4 ul").attr("id", "description4");
        $(".dowebok5 ul").attr("id", "description5");
        $(".dowebok6 ul").attr("id", "description6");
        $(".dowebok7 ul").attr("id", "description7");
        $(".dowebok8 ul").attr("id", "description8");
        $(".dowebok9 ul").attr("id", "description9");
        $(".dowebok10 ul").attr("id", "description10");
        $(".dowebok11 ul").attr("id", "description11");
        $(".dowebok12 ul").attr("id", "description12");
        $(".dowebok13 ul").attr("id", "description13");
        $(".dowebok14 ul").attr("id", "description14");
        $(".dowebok15 ul").attr("id", "description15");
        $(".dowebok16 ul").attr("id", "description16");
        $(".dowebok17 ul").attr("id", "description17");
        $(".dowebok18 ul").attr("id", "description18");
        $(".dowebok19 ul").attr("id", "description19");
        $(".dowebok20 ul").attr("id", "description20");
        $(".dowebok21 ul").attr("id", "description21");
        $(".dowebok22 ul").attr("id", "description22");
        $(".dowebok23 ul").attr("id", "description23");
        $(".dowebok24 ul").attr("id", "description24");
        $(".dowebok25 ul").attr("id", "description25");
        $(".dowebok26 ul").attr("id", "description26");
        $(".dowebok27 ul").attr("id", "description27");
        $(".dowebok28 ul").attr("id", "description28");
        $(".dowebok29 ul").attr("id", "description29");

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
        $('#description27').perfectScrollbar({
            wheelSpeed: 10,
            wheelPropagation: false
        });
        $('#description28').perfectScrollbar({
            wheelSpeed: 10,
            wheelPropagation: false
        });
        $('#description29').perfectScrollbar({
            wheelSpeed: 10,
            wheelPropagation: false
        });
        /**
         * 点击实时
         */
        $(".now").on("click", function () {
            if ($(this).hasClass("now_act")) {
                $("#constantly").val(0);
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
                var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate;
                $("input[name='edDates']").val(currentdate);
                $(this).removeClass("now_act");
            } else {
                $("#constantly").val(1);
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
                    + " " + date.getHours() + seperator2 + toDou(date.getMinutes());
                $("input[name='edDates']").val(currentdate);
                $(this).addClass("now_act");
            }
        })

        function toDou(str) {
            var num;
            str >= 10 ? num = str : num = "0" + str;
            return num;
        };
        //添加起止日期段
        var h = 0;
        $(".add_date_btn").on("click", function () {
            b = h++;
            data_html = "<div class='add_date clearfix addDateClass addEventDate" + b + "'>" +
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
                "<div class='td3_2 fl' style='margin-right:0px;'>" +
                "<label class='lab2' for=''><input class='inp_selc day2' name='edDates' type='text' readonly value='" + configMaxDate + "'/></label>" +
                "</div>" +
                "<div class='del_date_btn' style='margin-left:39px;'></div>" +
                " </div>" +
                "</div>";
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
///////////////////////////////////////////////


        $(".input_select").click(function () {
            var ul = $(".dropdown ul");
            if (ul.css("display") == "none") {
                ul.slideDown("fast");
            } else {
                ul.slideUp("fast");
            }
        });

        $(".dropdown ul li a").click(function () {
            var txt = $(this).text();
            $(".input_select").val(txt);
            $(".dropdown ul").hide();
        });

        $(".shadow").on('click', function () {
            $(".shadow").css("display", "none");
            $(".popup").css("display", "none");
            $(".popup2").css("display", "none");

        });

        /* 事件,图谱类型多选、保存、取消 */
        $("#sec_all_event").on('click', function () {
            if (this.checked) {
                $("#popup_ul_event :checkbox").prop("checked", true);
            } else {
                $("#popup_ul_event :checkbox").prop("checked", false);
            }
        });

        $("#popup_ul_event :checkbox").on('click', function () {
            allCheck();
        });

        $("#sec_all_atlas").on('click', function () {
            if (this.checked) {
                $("#popup_ul_atlas :checkbox").prop("checked", true);
            } else {
                $("#popup_ul_atlas :checkbox").prop("checked", false);
            }
        });

        $("#popup_ul_atlas :checkbox").on('click', function () {
            allCheck2();
        });

        $(".cancel").on('click', function () {
            $(".shadow").css("display", "none");
            $(".popup").css("display", "none");
            $(".popup2").css("display", "none");
        });

        $("#save_event").on('click', function () {
            save_event();
        });

    })

    function dianji() {
        var bodyScrH = document.body.scrollHeight;
        $(".shadow").height(bodyScrH);
        $(".shadow").css("display", "block");
        $(".popup").css("display", "block");
    }

    function allCheck() {
        var chknum = $("#popup_ul_event :checkbox").size();
        var chk = 0;
        $("#popup_ul_event :checkbox").each(function () {
            if ($(this).prop("checked") == true) {
                chk++;
            }
        });
        if (chk == chknum) {
            $("#sec_all_event").prop("checked", true);
        } else {
            $("#sec_all_event").prop("checked", false);
        }
    };

    function allCheck2() {
        var chknum = $("#popup_ul_atlas :checkbox").size();
        var chk = 0;
        $("#popup_ul_atlas :checkbox").each(function () {
            if ($(this).prop("checked") == true) {
                chk++;
            }
        });
        if (chk == chknum) {
            $("#sec_all_atlas").prop("checked", true);
        } else {
            $("#sec_all_atlas").prop("checked", false);
        }
    };

    //保存配置类型
    function save_event() {
        //时间和权重:国家状态展示（11）和类型展示（6）   国家稳定分析（10） 国家情感分析（14）
        //时间、权重、事件属性类型:首页（3）
        //所有条件再加比重:事件-时间线（32）
        //有增加时间的按钮:对比分析（12）
        //所有查询条件:4 5 7 8 9 13
        //新增事件展示模块，需要显示权重值的范围选择框  事件展示（34）
        var flagp = 0;
        var flagnow = 0;
        var flagCountryRelation = 0;
        var flago = 0;
        var flagq = 0;
        var actorFlag = 0;
        var event_type_arr = [];
        var event_typeId_arr = [];
        var chk_value = [];
        //将选中的值放入到数组中
        $("#popup_ul_event :checkbox:checked").each(function () {
            chk_value.push($(this).val());
        });
        var conditionFW = 1;//条件范围 3为时间+权重、2为时间+权重+事件类型、1为所有的公共条件（除比重）都有
        var everyValue;
        //判断是否在第一级中(所有的公共条件（除比重）都有)
        var conditionFW1Flag = false;
        for (var i in chk_value) {
            tempValue = chk_value[i];
            if (tempValue == 4 || tempValue == 5 || tempValue == 7 || tempValue == 8 || tempValue == 9 || tempValue == 13 || tempValue == 12 || tempValue == 3) {
                conditionFW1Flag = true;
                conditionFW = 1;
                break;
            }
        }
        //判断是否在第二级中(时间+权重+事件类型)
        var confitionFW2Flag = false;
        if (!conditionFW1Flag) {
            for (var i in chk_value) {
                tempValue = chk_value[i];
                if (tempValue == 3) {
                    conditionFW = 2;
                    confitionFW2Flag = true;
                    break;
                }
            }
        }
        //判断是否在第三级中（时间+权重）国家状态展示（11）和类型展示（6）   国家稳定分析（10） 国家情感分析（14）国家事件监测（40）
        if (!conditionFW1Flag && !confitionFW2Flag) {
            for (var i in chk_value) {
                tempValue = chk_value[i];
                if (tempValue == 11 || tempValue == 6 || tempValue == 10 || tempValue == 14 || tempValue == 40) {
                    conditionFW = 3;
                    break;
                }
            }
        }

        $("#popup_ul_event :checkbox").each(function () {
            if ($(this).prop("checked") == true) {
                event_type_arr.push($(this).parent().text().replace(/\s/g, ""));
                event_typeId_arr.push($(this).val());
                //判断选中的中是否有12(事件国家态势感知)  添加按钮显示
                if ($(this).val() == 12) {
                    flagp = 1;
                    $(".add_date_btn").show();
                }
                //判断选中的是否有3（首页）  显示实时按钮（暂时注释）
                /* if($(this).val()==3){
					flagnow = 1;
				} */
                //国家关系展示，需要前台传入公式中的参数值
                if ($(this).val() == 39) {
                    flagCountryRelation = 1;
                }
                //判断选中的是否有32（事件时间线） 比重    新加的模块统计比重：类型时间演化（5） 国家事件监测（40） 地理时间演化（8，后更名为地理事件分析）情感稳定分析（41）
                if ($(this).val() == 32 || $(this).val() == 5 || $(this).val() == 40 || $(this).val() == 8 || $(this).val() == 41) {//用到比重的模块
                    flago = 1;
                }
                //判断选中的是否有事件展示（34）
                if ($(this).val() == 34) {//事件展示
                    flagq = 1;
                }

            }
            //查询选中类型的数量确定优先级
        })


        //判断条件的范围
        if (conditionFW == 1) {//全部条件
            $("#eventProperty").show();
            $("#actorModel").show();
            $(".high_search").show();
            $("#dataSourceType").show();
        } else if (conditionFW == 2) {//时间+事件类型+权重
            $("#actorModel").hide();
            $("#eventProperty").show();
            $(".homeNotShow").hide();
            $(".high_search").show();
            $("#dataSourceType").show();
        } else {//时间+权重
            $(".high_search").hide();
            $("#actorModel").hide();
            $("#eventProperty").hide();
            $("#dataSourceType").hide();
        }
        //判断比重标记
        if (flago == 1) {
            $("#bizhong").show();
        } else {
            $("#bizhong").hide();
        }
        //判断权重范围框
        if (flagq == 1 && event_typeId_arr.length == 1) {
            $("#quanzhongkuang").show();
            $("#quanzhong").hide();
        } else if (flagq == 1 && event_typeId_arr.length > 1) {
            $("#quanzhongkuang").show();
            $("#quanzhong").show();
        } else {
            $("#quanzhongkuang").hide();
            $("#quanzhong").show();
        }
        //判断起止日期的年月日或者是年月
        /* if(chk_value.length == 1 && conditionFW == 2){
			selectYearMonth();
		}else{
			selectYearMonthDay();
		} */

        /*
		暂时注释（原首页用到）
		if(flagnow==1){
			//操作实时按钮
			$(".now").show();
			$(".now").removeClass("now_act");
		}else{
			$(".now").hide();
		} */
        //判断添加按钮的标记
        if (flagp != 1) {
            $(".add_date_btn").hide();
            $(".addDateClass").remove();
        }
        if (flagCountryRelation == 1) {
            $("#countryRelation").show();
        } else {
            $("#countryRelation").hide();
        }
        event_type_str = event_type_arr.join(",");
        event_typeId_str = event_typeId_arr.join(",");
        $("#event_type").val(event_type_str);
        $("#typeIds").val(event_typeId_str);
        $(".shadow").css("display", "none");
        $(".popup").css("display", "none");
    };

    //选择年月日
    function selectYearMonthDay() {
        //提示结束时间赋值
        $("#edDateSpan").html(configMaxDate);
        $("#stDateSpan").html(configMinDate);

        //重置时间插件的时间范围 注意：必须放置setDate之前
        $('.day1').datepicker('setStartDate', configMinDate);
        $('.day2').datepicker('setEndDate', configMaxDate);
        //将时间范围的最大值、最小值放在开始时间和结束时间
        $('.day1').datepicker('setDate', configMinDate);
        $('.day2').datepicker('setDate', configMaxDate);

        $(".day1").val(configMinDate);
        $(".day2").val(configMaxDate);
    }

    //获取图谱配置的三套数据源的日期范围
    function findEventConfigDateRange() {
        $.ajax({
            url: '../config/findEventConfigDateRange',
            type: 'post',
            dataType: "json",
            success: function (data) {
                //提示开始和结束时间赋值
                configDate = data.configDate;
                configMaxDate = configDate.maxDate1;
                configMinDate = configDate.minDate1;
                //提示结束时间赋值
                $("#edDateSpan").html(configMaxDate);
                $("#stDateSpan").html(configMinDate);

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
                    endDate: configMaxDate,
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
            }
        })
    }

    //查询
    function cx() {
        $('#pageIndexNew').val(0);
        showConfigList();
    }

    //鼠标移入时显示信息
    $(".hoverImg").hover(function () {
        $(this).next().show();
    }, function () {
        $(this).next().hide();
    })
</script>
<jsp:include page="./updateUserPassword.jsp"/>
</body>
</html>