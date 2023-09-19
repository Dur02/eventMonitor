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
    <title>总体态势</title>
    <link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
    <link rel="stylesheet" href="<%=basePath %>/static/css/style.css">
    <link rel="stylesheet" href="<%=basePath %>/static/css/sec2.css">
    <!--人工查询 -->
    <link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css">
    <link rel="stylesheet" href="<%=basePath %>/static//lib/pagination.css"/>
    <link rel="stylesheet" href="<%=basePath %>/static/css/combo.select.css">
    <link rel="stylesheet" href="<%=basePath %>/static/css/perfect-scrollbar.css"/>
    <link rel="shortcut icon" type="image/x-icon" href="<%=basePath %>/static/Visualization/base/ico.png"/>
    <link rel="stylesheet" type="text/css"
          href="<%=basePath %>/static/Visualization/base/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/base/base.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/base/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/css/event_result.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>/static/Visualization/js/amcharts/export/export.css"/>
    <link rel="stylesheet" href="<%=basePath %>/static/win_alert/window_zs.css"/><!-- 弹出提示框样式 -->
    <script src="<%=basePath%>/static/js/jquery-1.9.1.min.js"></script>
    <script src="<%=basePath%>/static/lib/jquery.pagination.js"></script>
    <script src="<%=basePath%>/static/js/config/config.js"></script>
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
    <style type="text/css">
        .index_bottom {
            background-image: url(<%=basePath%>/static/css/img/bg_new.png);
            background-repeat: no-repeat;
            background-size: 100% 100%;
            position: relative;
            overflow: hidden;
        }

        .box, #main {
            width: 100%;
            height: 100%;
        }

        #thermal { /*地球贴纸合并 ，必要*/
            background: url(<%=basePath%>/static/js/echarts/aaaa.png) no-repeat center;
            position: absolute !important;
            left: -22000px;
            width: 2048px;
            height: 1024px;
        }

        .scroll {
            height: 170px;
        }

        .index_chart {
            position: relative;
        }
    </style>
<body>
<div class="index_top clearfix">
    <h3 class="fl title">态势监测 > 总体态势</h3>
    <input type="hidden" id="moduleCode" value="${moduleCode}">
</div>
<div class="index_bottom">
    <!-- 前端在此编写框架代码 -->
    <!-- 放地球仪 -->
    <div id="main_map" class="index_chart">
        <div style="position:absolute; bottom:50px; left: 10px;">
            <img src="<%=basePath%>/static/css/img/mapColor.png">
            <span style="position:absolute; top:-20px; left: 0px; color:#fff;" id="max3DNum"></span>
            <span style="position:absolute; bottom:-20px; left: 0px; color:#fff;">0</span>
        </div>
        <div id="main"></div>
    </div>
    <!-- 放世界地图 -->
    <div id="world" class="index_chart none"></div>
    <!-- 右上角 -->
    <div id="rt" class="rt"></div>
    <!-- 右下角轮播 -->
    <div class="news_wrapper">
        <div class="news_box" id="hezuo">
            <div class="tab_box">
                <div class="tabl actL">合作事件</div>
                <div class="tabr">合作新闻</div>
            </div>
            <div id="scroll" class="scroll hezuo1">
                <ul id="el" class="news_list">
                </ul>
                <ul id="el2" class="news_list">
                </ul>
            </div>
            <div id="scroll2" class="scroll hezuo2">
                <ul id="el5" class="news_list">
                </ul>
                <ul id="el6" class="news_list">
                </ul>
            </div>
        </div>
        <div class="news_box" id="chongtu">
            <div class="tab_box">
                <div class="tabl actL">冲突事件</div>
                <div class="tabr">冲突新闻</div>
            </div>
            <div id="scroll3" class="scroll chongtu1">
                <ul id="el3" class="news_list">
                </ul>
                <ul id="el4" class="news_list">
                </ul>
            </div>
            <div id="scroll4" class="scroll chongtu2">
                <ul id="el7" class="news_list">
                </ul>
                <ul id="el8" class="news_list">
                </ul>
            </div>
        </div>
    </div>
    <!-- 条件tab页 -->
    <jsp:include page="event_tab1.jsp"></jsp:include>
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
<script type="text/javascript" src="<%=basePath %>/static/Visualization/base/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/loading/js/loading.js"></script>
<c:if test="${bgFlag == null or bgFlag == 1}">
    <script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData.js"></script>
</c:if>
<c:if test="${bgFlag == 2}">
    <script type="text/javascript" src="<%=basePath%>/static/Visualization/loadingData1.js"></script>
</c:if>
<!-- 人工查询js -->
<script src="<%=basePath %>/static/Visualization/rgQuery.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/Visualization/downLoad.js"></script>
<!-- 计算显示图的高度 -->
<script src="<%=basePath%>/static/js/chartHeight.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框js脚本 -->
<script src="<%=basePath%>/static/js/echarts/map/echarts.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>/static/js/echarts/echarts-gl.min.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>/static/js/echarts/heatmap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>/static/js/echarts/map/world.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>/static/js/echarts/html2canvas.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    $(function () {
        //处理配置
        handleConfigs();
        //美化滚动条
        glorifyComboSelect();
        $("#rt").on("click", function () {
            if ($(this).hasClass("rt_act")) {
                $(this).removeClass("rt_act")
                $("#main_map").removeClass("none");
                $("#world").addClass("none");
                $("#thermal").removeClass("none");
            } else {
                $(this).addClass("rt_act")
                $("#main_map").addClass("none");
                $("#world").removeClass("none");
                $("#thermal").addClass("none");
                showPlan(planData, planMapData, planMaxNum);
            }
        })
        $(".tabl").on("click", function () {
            $(this).addClass("actL")
            $(this).siblings(".tabr").removeClass("actR")
            if ($(this).text() == "合作事件") {
                if (treeMapList1.length > 0) {
                    $("#hezuo").css("height", "210px");
                    $(".hezuo1").css("height", "170px");
                } else {
                    $("#hezuo").css("height", "60px");
                    $(".hezuo1").css("height", "20px");
                }
                $("#scroll").removeClass("none")
                $("#scroll2").addClass("none")
                $("#el").show();
            }
            if ($(this).text() == "冲突事件") {
                if (treeMapList2.length > 0) {
                    $("#chongtu").css("height", "210px");
                    $(".chongtu1").css("height", "170px");
                } else {
                    $("#chongtu").css("height", "60px");
                    $(".chongtu1").css("height", "20px");
                }
                $("#scroll3").removeClass("none")
                $("#scroll4").addClass("none")
                $("#el3").show();
            }
        })
        $(".tabr").on("click", function () {
            $(this).addClass("actR")
            $(this).siblings(".tabl").removeClass("actL")
            if ($(this).text() == "合作新闻") {
                if (treeMapsList1.length > 0) {
                    $("#hezuo").css("height", "210px");
                    $(".hezuo2").css("height", "170px");
                } else {
                    $("#hezuo").css("height", "60px");
                    $(".hezuo2").css("height", "20px");
                }
                $("#scroll").addClass("none")
                $("#scroll2").removeClass("none")
                $("#el5").show();
            }
            if ($(this).text() === "冲突新闻") {
                if (treeMapsList2.length > 0) {
                    $("#chongtu").css("height", "210px");
                    $(".chongtu2").css("height", "170px");
                } else {
                    $("#chongtu").css("height", "60px");
                    $(".chongtu2").css("height", "20px");
                }
                $("#scroll3").addClass("none")
                $("#scroll4").removeClass("none")
                $("#el7").show();
            }
        })

    });
    intervalList = [];

    function srcoll(scroll, el, el2) {
        var _scroll = document.getElementById(scroll),
            _inner1 = document.getElementById(el),
            _inner2 = document.getElementById(el2),
            speed = 20;
        _inner2.innerHTML = _inner1.innerHTML;

        function marquee() {
            if (_inner1.offsetHeight <= _scroll.scrollTop) {
                _scroll.scrollTop = 0
            } else {
                _scroll.scrollTop++;
            }
        }

        var interval = setInterval(marquee, speed);
        intervalList.push(interval);
        _scroll.onmouseover = function () {
            clearInterval(interval);
        }
        _scroll.onmouseout = function () {
            interval = setInterval(marquee, speed);
            intervalList.push(interval);
        }
    }

    var scrollFlag = 6;

    //根据配置pid获取数据并渲染图表
    function render(configId) {
        startLoad();
        $.ajax({
            url: '<%=basePath %>/search/home2/' + configId,
            type: 'POST',
            dataType: "json",
            success: function (data) {
                if (data == "-1") {
                    endLoad();
                    win.alertEx("获取结果信息数据失败");
                } else {
                    renderData(data);
                    if (treeMapList1.length > scrollFlag) {
                        srcoll("scroll", "el", "el2");//合作事件
                    }
                    if (treeMapsList1.length > scrollFlag) {
                        srcoll("scroll2", "el5", "el6");//合作新闻
                    }
                    if (treeMapList2.length > scrollFlag) {
                        srcoll("scroll3", "el3", "el4");//冲突事件
                    }
                    if (treeMapsList2.length > scrollFlag) {
                        srcoll("scroll4", "el7", "el8");//冲突新闻
                    }
                    endLoad();
                }
            }
        });
    }

    //渲染图表
    function renderData(data) {

        //切换配置的时候清空定时器
        for (var i = 0; i < intervalList.length; i++) {
            clearInterval(intervalList[i]);
        }
        var globeData = data.globeData;
        //人为补充0，防止地球仪上数据显示不出来
        var zeroMap = {"x": 0, "y": 0, "value": 0};
        globeData.push(zeroMap);
        var globeMaxNum = data.globeMaxNum;
        planMaxNum = data.planMaxNum;
        planData = data.planData;
        planMapData = data.planMapData;
        treeMapList1 = data.treeMapList1;//合作事件
        treeMapList2 = data.treeMapList2;//冲突事件
        treeMapsList1 = data.treeMapsList1;//合作新闻
        treeMapsList2 = data.treeMapsList2;//冲突新闻
        //以下的操作是关于切换配置后，对应的展示效果恢复到原始状态
        $("#main").removeClass("none");
        $("#world").addClass("none");
        $("#thermal").removeClass("none");
        $(".tabl").click();
        if ($("#rt").hasClass("rt_act")) {
            $("#rt").click();
        }
        // show3D(globeData, globeMaxNum);
        show3D();
        packUL(treeMapList1, treeMapsList1, treeMapList2, treeMapsList2);
    }

    //加载右侧轮播数据
    function packUL(data, data2, data3, data4) {
        $("#el").empty();
        $("#el2").empty();
        $("#el3").empty();
        $("#el4").empty();
        $("#el5").empty();
        $("#el6").empty();
        $("#el7").empty();
        $("#el8").empty();
        var lis = "";
        if (data.length > 0) {
            for (var i = 0; i < data.length; i++) {
                var sqlDate = data[i].date;
                lis += "<li class='newBg1'>" + sqlDate.substring(0, 4) + "年" + sqlDate.substring(4, 6) + "月" + sqlDate.substring(6, 8) + "日，在" + data[i].countryCode + "发生了“" + data[i].eventCode + "”事件</li>";
            }
        } else {
            lis += "<li class='newBg1'>暂无数据</li>";
        }
        $("#el").html(lis);//合作事件

        var lis2 = "";
        if (data2.length > 0) {
            for (var i = 0; i < data2.length; i++) {
                var sqlDate = data2[i].date;
                lis2 += "<li class='newBg1'>" + sqlDate.substring(0, 4) + "年" + sqlDate.substring(5, 7) + "月" + sqlDate.substring(8, 10) + "日， “" + data2[i].title + "”</li>";
            }
        } else {
            lis2 += "<li class='newBg1'>暂无数据</li>";
        }
        $("#el5").html(lis2);//合作新闻

        var lis3 = "";
        if (data3.length > 0) {
            for (var i = 0; i < data3.length; i++) {
                var sqlDate = data3[i].date;
                lis3 += "<li class='newBg2'>" + sqlDate.substring(0, 4) + "年" + sqlDate.substring(4, 6) + "月" + sqlDate.substring(6, 8) + "日，在" + data3[i].countryCode + "发生了“" + data3[i].eventCode + "”事件</li>";
            }
        } else {
            lis3 += "<li class='newBg2'>暂无数据</li>";
        }
        $("#el3").html(lis3);//冲突事件

        var lis4 = "";
        if (data4.length > 0) {
            for (var i = 0; i < data4.length; i++) {
                var sqlDate = data4[i].date;
                lis4 += "<li class='newBg2'>" + sqlDate.substring(0, 4) + "年" + sqlDate.substring(5, 7) + "月" + sqlDate.substring(8, 10) + "日， “" + data4[i].title + "”</li>";
            }
        } else {
            lis4 += "<li class='newBg2'>暂无数据</li>";
        }
        $("#el7").html(lis4);//冲突新闻
    }

    //加载平面散点图
    function showPlan(data, geoCoordMap, maxValue) {
        //数据
        var data_chart = echarts.init(document.getElementById('world'));

        /* var data = [
             {name: '海门', value: 1},
             {name: '招远', value: 2},
             {name: '武汉', value: 3},
             {name: '大庆', value: 4},
             {name:"阿坝",value:5},
        ];

        var maxValue = 5;

        var geoCoordMap = {
            "海门":[151.15,31.89],
            "招远":[120.38,37.35],
            "武汉":[184.31,30.52],
            "大庆":[195.03,46.58],
            "阿坝":[131.72,31.93],
        }; */

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

        option = {
            visualMap: {
                min: 0,
                max: maxValue,//动态控制
                left: 'left',
                bottom: '40',
                text: ['高', '低'], // 文本，默认为数值文本
                calculable: true,
                textStyle: {
                    color: '#fff'
                },
                inRange: {
                    color: ['lightskyblue', 'yellow', 'orangered'],
                    symbolSize: [2, 20]
                },
            },
            tooltip: {
                trigger: 'item',
                formatter: function (params) {
                    return params.name + ':' + params.value[2]
                }
            },
            geo: {
                map: 'world',
                label: {
                    emphasis: {
                        show: true
                    }
                },
                roam: true,
                itemStyle: {
                    normal: {
                        color: '#0958a0', //地图背景色
                        borderColor: 'rgba(100,149,237,1)' //省市边界线
                    },
                    emphasis: {
                        color: '#0a82ef' //悬浮背景
                    }
                }
            },
            series: [
                {
                    type: 'scatter',
                    coordinateSystem: 'geo',
                    data: convertData(data),
                    label: {
                        normal: {
                            formatter: '{b}',
                            position: 'right',
                            show: false
                        },
                        emphasis: {
                            show: false
                        }
                    },
                    itemStyle: {
                        normal: {
                            color: '#ddb926'
                        }
                    }
                },
                {
                    type: 'effectScatter',
                    coordinateSystem: 'geo',
                    data: convertData(data.sort(function (a, b) {
                        return b.value - a.value;
                    }).slice(0, 3)),
                    showEffectOn: 'render',
                    rippleEffect: {
                        brushType: 'fill'
                    },
                    hoverAnimation: true,
                    label: {
                        normal: {
                            formatter: '{b}',
                            position: 'right',
                            show: false
                        }
                    },
                    itemStyle: {
                        normal: {
                            color: '#f4e925',
                            shadowBlur: 10,
                            shadowColor: '#333'
                        }
                    },
                    zlevel: 1
                }
            ]
        };
        data_chart.setOption(option);
    }

    /*
        加载3D地球仪
    */
    function show3D(thermal, maxValue) {

        $("#max3DNum").text(maxValue);

        var NodeCan = null

        /*创建热力图*/
        function createHeatMap() {
            // 创建元素
            var heatDoc = document.createElement("div");
            heatDoc.setAttribute("id", "thermal");
            heatDoc.style.width = '2048px'
            heatDoc.style.height = '1024px'
            document.getElementById('main').appendChild(heatDoc)
            // 创建热力图对象
            var heatmap = h337.create({
                container: heatDoc,
                backgroundColor: 'rgba(0,0,0,0)',
                radius: 20,
                maxOpacity: .0,
                minOpacity: 0,
                blur: 0.75,
                gradient: {
                    '0.9': 'red',
                    '0.8': '#ff4e00',
                    '0.7': '#ff8400',
                    '0.6': '#ffc000',
                    '0.5': '#aa00ff',
                    '0.4': '#c6ff00',
                    '0.3': '#c6ff00',
                    '0.2': '#11e1fe'
                },
            });
            // 添加数据
            heatmap.setData({
                max: maxValue,
                data: thermal  //热力数据
            });
            NodeCan = heatDoc.children[0]
            return heatmap;
        }

        var heatMap1 = createHeatMap();
        /*地图贴纸和热力图合并*/
        var option = {
            backgroundColor: '#000',
            globe: {
                show: true,
                baseTexture: '<%=basePath%>/static/Visualization/img/map.png',       //地球贴图
                //heightTexture: 'img/aaaaaaaaaaaa.png',    //3d效果贴图
                displacementScale: 0.1,
                shading: 'color',
                environment: '',	   //星空效果背景贴图
                light: {
                    ambient: {
                        intensity: 1
                    },
                    main: {
                        intensity: 1
                    }
                },
                layers: [{
                    type: 'blend',
                    texture: NodeCan
                }],
                globeRadius: 100    // default:100 {Number}   地球半径，地球在dom容器里大小
            }
        }
        var domMap = echarts.init(document.getElementById('main'))
        domMap.setOption(option);
    }
</script>
</html>