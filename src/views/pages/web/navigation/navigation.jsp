<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String basePath = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>导航</title>
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/loading/css/loading.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/style.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/sec2.css">
<link rel="stylesheet" href="<%=basePath %>/static/win_alert/window_zs.css"/><!-- 弹出提示框样式 -->
<style type="text/css">
	.index_bottom{
		height: 100%;
		padding: 0px!important;
		background-image: url(<%=basePath%>/static/css/img/bg_new.png);
		background-repeat: no-repeat;
		background-size: 100% 100%;
		position: relative;
		overflow-y: auto;
	}
	
	/* 美化滚动条 */
	.index_bottom::-webkit-scrollbar {/*滚动条整体样式*/
	    width: 4px;     /*高宽分别对应横竖滚动条的尺寸*/
	    height: 4px;
	}
	.index_bottom::-webkit-scrollbar-thumb {/*滚动条里面小方块*/
	    border-radius: 5px;
	    -webkit-box-shadow: inset 0 0 5px rgba(0,0,0,0.2);
	    background:#06477b;
	}
	.index_bottom::-webkit-scrollbar-track {/*滚动条里面轨道*/
	    -webkit-box-shadow: inset 0 0 5px rgba(0,0,0,0.2);
	    border-radius: 0;
	    background:#11203d;
	}
	
	/*左上角导航字体位置*/
	.title {
	    margin-top: 0px
	}
	.country_sort {
	    width: 16%;
	    height: 38px;
	    background: url(../static/images/zhengjian.png) no-repeat center center;
	    background-size: 100% 100%;
	    margin: 0 auto;
	    text-align: center;
	    line-height: 38px;
	}
   .country_sort span:nth-child(1) {
	    height: 14px;
	    font-size: 14px;
	    font-family: SimSun;
	    font-weight: bold;
	    color: rgba(255, 255, 255, 1);
	    line-height: 38px;
	    margin: 0 42px 0 33px;
	}
	.bor{
	    width: 95%;
	    margin: 0px auto;
	    background-color: #10192E;
        border: 0px solid #ccc !important;
	}
	/*tab样式*/
	.module_box{
		width: 31%;    
		margin-left: 18px;
		margin-bottom: 8px;
		float: left;
		background-color: #1A1F31;
	    border-radius: 5px;
   		border: 1px solid #4C5367;
   		padding: 5px;
		margin-top: 26px;
	}
	
	.module_box:hover{
   		border: 1px solid #00C1DE;
	}
	
	.imgbox{
		height:294px!important;
	    padding: 5px 5px;
	}
	.moduleImg{
		width: 100%;
   	    height: 300px;
	}
	.nameBox{
	    margin-top: 12px;
		height:15px;
		padding-left: 10px;
	    font-size: 16px;
	    color: #00C1DE;
	    font-weight: bold;
	}
	.descBox{
	    color: #afbbd6;
	    height: 72px;
	    font-size: 14px;
	    padding-left: 9px;
	    padding-top: 8px;
        margin-top: 8px;
        line-height: 23px;
        overflow-y: auto
	}
	.descBox::-webkit-scrollbar {/*滚动条整体样式*/
	    width: 4px;     /*高宽分别对应横竖滚动条的尺寸*/
	    height: 4px;
	}
	.descBox::-webkit-scrollbar-thumb {/*滚动条里面小方块*/
	    border-radius: 5px;
	    -webkit-box-shadow: inset 0 0 5px rgba(0,0,0,0.2);
	    background:#06477b;
	}
	.descBox::-webkit-scrollbar-track {/*滚动条里面轨道*/
	    -webkit-box-shadow: inset 0 0 5px rgba(0,0,0,0.2);
	    border-radius: 0;
	    background:#11203d;
	}
	.mg_b {
    	margin-bottom: 31px!important;
	}
</style>
<body>
	<div class="index_top clearfix">
		<h3 class="fl title">导航</h3>
	</div>
	<div class="index_bottom">
		<div class="data show">
			<div class="row" style="margin-top: 52px!important;">
				<div class="col-md-12 mg_t mg_b">
	                <div class="col-md-12 bor" style="height: 520px;" >
	                	<div class="col-md-12">
	                			<h3 class="country_sort"><span>态势监测</span> 
	                		</h3>
						</div>
						<div style="width: 97%;margin:0 auto;">
							<div class="module_box" onclick="parent.mainhtml.location='../search/event/home2?bgFlag=1'">
								<div class="imgBox">
									<img class="moduleImg" src="<%=basePath%>/static/navigationImg/home2.png">
								</div>
								<div class="nameBox">
									总体态势
								</div>
								<div class="descBox">
									对事件态势(首页)的事件分布、合作事件、合作新闻、冲突事件、冲突新闻等进行查询统计分析。
								</div>
							</div>
							<div class="module_box" onclick="parent.mainhtml.location='../search/event/event_country_monitor?bgFlag=1'">
								<div class="imgBox">
									<img class="moduleImg" src="<%=basePath%>/static/navigationImg/event_country_monitor.png">
								</div>
								<div class="nameBox">
									国家事件监测
								</div>
								<div class="descBox">
									对事件发生地国家的4大类20根类、情感值、稳定性的统计分析。 
								</div>
							</div>
							<div class="module_box" onclick="parent.mainhtml.location='../search/graph/graph_leader_tone_viz?bgFlag=1'" >
								<div class="imgBox">
									<img class="moduleImg" src="<%=basePath%>/static/navigationImg/graph_leader_tone.png">
								</div>
								<div class="nameBox">
									人物监测
								</div>
								<div class="descBox">
									从情感的角度分析相关人物的语调状态。
								</div>
							</div>
						</div>
                    </div>
                </div>
                <div class="col-md-12 mg_t mg_b">
	                <div class="col-md-12 bor" style="height:1905px " >
	                	<div class="col-md-12">
	                			<h3 class="country_sort"><span>事件库分析</span> 
	                		</h3>
						</div>
						<div style="width: 97%;margin:0 auto;">
							<div class="module_box" onclick="parent.mainhtml.location='../search/event/event_show_viz?bgFlag=1'">
								<div class="imgBox">
									<img class="moduleImg" src="<%=basePath%>/static/navigationImg/event_show.png">
								</div>
								<div class="nameBox">
									事件展示
								</div>
								<div class="descBox">
									统计目标事件源数据的案例数据，按时间降序排列截取300条展示。
								</div>
							</div>
							<div class="module_box" onclick="parent.mainhtml.location='../search/event/event_timeline_viz?bgFlag=1'">
								<div class="imgBox">
									<img class="moduleImg" src="<%=basePath%>/static/navigationImg/event_timeline.png">
								</div>
								<div class="nameBox">
									事件时间线
								</div>
								<div class="descBox">
									从不同的时间粒度(月、日)分析发生事件的变化趋势，并支持比重和数量切换的统计依据。
								</div>
							</div>
							<div class="module_box" onclick="parent.mainhtml.location='../search/event/event_geo_net_viz?bgFlag=1'">
								<div class="imgBox">
									<img class="moduleImg" src="<%=basePath%>/static/navigationImg/event_geo_net.png">
								</div>
								<div class="nameBox">
									地理网络
								</div>
								<div class="descBox">
									从国家、州省、城市三个角度分析事件参与者（主体、受体）之间联系的紧密度。
								</div>
							</div>
						</div>
						<div style="width: 97%;margin:0 auto;">
							<div class="module_box" onclick="parent.mainhtml.location='../search/event/event_timeline_type_viz?bgFlag=1'">
								<div class="imgBox">
									<img class="moduleImg" src="<%=basePath%>/static/navigationImg/event_timeline_type.png">
								</div>
								<div class="nameBox">
									类型时间演化
								</div>
								<div class="descBox">
									以时间为单位，统计与时间对应的大类事件数、根类事件数，反映时间段内各事件类型的分布情况。展现形式包括大类时间线展示、根类时间演化展示。								</div>
							</div>
							<div class="module_box" onclick="parent.mainhtml.location='../search/event/event_heat_viz?bgFlag=1'">
								<div class="imgBox">
									<img class="moduleImg" src="<%=basePath%>/static/navigationImg/event_heat.png">
								</div>
								<div class="nameBox">
									热点发生地展示
								</div>
								<div class="descBox">
									热点展示	从国家、州省、城市三个角度分析事件发生地的事件分布情况，反映各个地区受到的政治活动的影响情况。展现形式包括热力图展示、热点地理展示。
								</div>
							</div>
							<div class="module_box" onclick="parent.mainhtml.location='../search/event/event_timeline_geo_viz?bgFlag=1'">
								<div class="imgBox">
									<img class="moduleImg" src="<%=basePath%>/static/navigationImg/event_timeline_geo.png">
								</div>
								<div class="nameBox">
									情感稳定发生地分析
								</div>
								<div class="descBox">
									从时间角度分析事件发生地的分布情况。展现形式包括国家事件热点图、国家事件稳定统计、国家事件稳定时间线、城市热点图、城市事件统计。
								</div>
							</div>
						</div>
						<div style="width: 97%;margin:0 auto;">
							<div class="module_box" onclick="parent.mainhtml.location='../search/event/event_tone_scale_viz?bgFlag=1'">
								<div class="imgBox">
									<img class="moduleImg" src="<%=basePath%>/static/navigationImg/event_tone_scale.png">
								</div>
								<div class="nameBox">
									情感稳定事件分析
								</div>
								<div class="descBox">
									从情感值和稳定性的纬度统计对应的事件数、均值、总值的分布情况，并统计对应的时间线趋势，反映事件的影响力。
								</div>
							</div>
						</div>
						<div style="width: 97%;margin:0 auto;">
							<div class="module_box" onclick="parent.mainhtml.location='../search/event/event_actor_viz?bgFlag=1'">
								<div class="imgBox">
									<img class="moduleImg" src="<%=basePath%>/static/navigationImg/event_actor.png">
								</div>
								<div class="nameBox">
									事件角色展示
								</div>
								<div class="descBox">
									从国家的角度分析事件参与者（发起者、接受者）的分布情况。展现形式包括国家角色地理展示、角色国家展示、角色类型展示、角色组织展示、角色宗教展示、角色种族展示。
								</div>
							</div>
							<div class="module_box" onclick="parent.mainhtml.location='../search/event/event_situational_viz?bgFlag=1'">
								<div class="imgBox">
									<img class="moduleImg" src="<%=basePath%>/static/navigationImg/event_situational.png">
								</div>
								<div class="nameBox">
									对比分析
								</div>
								<div class="descBox">
									从不同的时间段对国家、城市事件分布进行统计分析。展现形式包括地理对比展示。
								</div>
							</div>
							<div class="module_box" onclick="parent.mainhtml.location='../search/event/event_country_relation_viz?bgFlag=1'">
								<div class="imgBox">
									<img class="moduleImg" src="<%=basePath%>/static/navigationImg/event_country_relation.png">
								</div>
								<div class="nameBox">
									国家关系展示
								</div>
								<div class="descBox">
									从国家的角度分析事件参与者（发起者、接受者）的之间联系的紧密度。
								</div>
							</div>
						</div>
						
                    </div>
                </div>
                <div class="col-md-12 mg_t mg_b">
	                <div class="col-md-12 bor" style="height:1446px " >
	                	<div class="col-md-12">
	                			<h3 class="country_sort"><span>图谱库分析</span> 
	                		</h3>
						</div>
						<div style="width: 97%;margin:0 auto;">
							<div class="module_box" onclick="parent.mainhtml.location='../search/graph/graph_show_viz?bgFlag=1'">
								<div class="imgBox">
									<img class="moduleImg" src="<%=basePath%>/static/navigationImg/graph_show.png">
								</div>
								<div class="nameBox">
									图谱展示
								</div>
								<div class="descBox">
									统计目标图谱源数据的案例数据，按时间降序排列截取300条展示。
								</div>
							</div>
							<div class="module_box" onclick="parent.mainhtml.location='../search/graph/graph_timeline_viz?bgFlag=1'">
								<div class="imgBox">
									<img class="moduleImg" src="<%=basePath%>/static/navigationImg/graph_timeline.png">
								</div>
								<div class="nameBox">
									图谱时间线
								</div>
								<div class="descBox">
									从不同的时间粒度(月、日)分析发生图谱信息的变化趋势，并支持比重和数量切换的统计依据。
								</div>
							</div>
							<div class="module_box" onclick="parent.mainhtml.location='../search/graph/graph_person_timeline_viz?bgFlag=1'">
								<div class="imgBox">
									<img class="moduleImg" src="<%=basePath%>/static/navigationImg/graph_person_timeline.png">
								</div>
								<div class="nameBox">
									人物分析
								</div>
								<div class="descBox">
									统计与实体相关人物的紧密度。
								</div>
							</div>
						</div>
						<div style="width: 97%;margin:0 auto;">
							<div class="module_box" onclick="parent.mainhtml.location='../search/graph/graph_organization_timeline_viz?bgFlag=1'">
								<div class="imgBox">
									<img class="moduleImg" src="<%=basePath%>/static/navigationImg/graph_organization_timeline.png">
								</div>
								<div class="nameBox">
									组织分析
								</div>
								<div class="descBox">
									统计与实体相关组织的紧密度。
								</div>
							</div>
							<div class="module_box" onclick="parent.mainhtml.location='../search/graph/graph_theme_timeline_viz?bgFlag=1'">
								<div class="imgBox">
									<img class="moduleImg" src="<%=basePath%>/static/navigationImg/graph_theme_timeline.png">
								</div>
								<div class="nameBox">
									主题分析
								</div>
								<div class="descBox">
									统计与实体相关主题的紧密度。
								</div>
							</div>
							<div class="module_box" onclick="parent.mainhtml.location='../search/graph/graph_tone_timeline_viz?bgFlag=1'">
								<div class="imgBox">
									<img class="moduleImg" src="<%=basePath%>/static/navigationImg/graph_tone_timeline.png">
								</div>
								<div class="nameBox">
									情感分析
								</div>
								<div class="descBox">
									从平均情感值、正向情感值、负向情感值、极性词比例、活动词比例、代词比例这六个情感维度统计分析相关实体的情感状态。								
								</div>
							</div>
						</div>
						<div style="width: 97%;margin:0 auto;">
							<div class="module_box" onclick="parent.mainhtml.location='../search/graph/graph_country_timeline_viz?bgFlag=1'">
								<div class="imgBox">
									<img class="moduleImg" src="<%=basePath%>/static/navigationImg/graph_country_timeline.png">
								</div>
								<div class="nameBox">
									地域分析
								</div>
								<div class="descBox">
									统计与该实体相关的事件发生的地理位置（包括国家、城市）数量，反映该与该实体相关事件的地理分布情况。
								</div>
							</div>
							<div class="module_box" onclick="parent.mainhtml.location='../search/graph/graph_conflict_timeline_viz?bgFlag=1'">
								<div class="imgBox">
									<img class="moduleImg" src="<%=basePath%>/static/navigationImg/graph_conflict_timeline.png">
								</div>
								<div class="nameBox">
									Counts分析
								</div>
								<div class="descBox">
									统计与实现相关的特定事件类型以及特定事件发生的地理信息，反映与该实体相关的特定事件的地理分布情况。
								</div>
							</div>
							<div class="module_box" onclick="parent.mainhtml.location='../search/graph/graph_website_analysis_viz?bgFlag=1'">
								<div class="imgBox">
									<img class="moduleImg" src="<%=basePath%>/static/navigationImg/graph_website_analysis.png">
								</div>
								<div class="nameBox">
									网站分析
								</div>
								<div class="descBox">
									统计图谱数据的网站来源以及网站地域分布情况。
								</div>
							</div>
						</div>
                    </div>
                </div>
                <div class="col-md-12 mg_t mg_b">
	                <div class="col-md-12 bor" style="height: 520px;" >
	                	<div class="col-md-12">
	                			<h3 class="country_sort"><span>新闻库分析</span> 
	                		</h3>
						</div>
						<div style="width: 97%;margin:0 auto;">
							<div class="module_box" onclick="parent.mainhtml.location='../search/news/news_show_viz?bgFlag=1'">
								<div class="imgBox">
									<img class="moduleImg" src="<%=basePath%>/static/navigationImg/news_show.png">
								</div>
								<div class="nameBox">
									新闻展示
								</div>
								<div class="descBox">
									统计目标新闻源数据的案例数据，按时间降序排列截取300条展示。
								</div>
							</div>
							<div class="module_box" onclick="parent.mainhtml.location='../search/news/news_analysis_viz?bgFlag=1'">
								<div class="imgBox">
									<img class="moduleImg" src="<%=basePath%>/static/navigationImg/news_analysis.png">
								</div>
								<div class="nameBox">
									新闻分析
								</div>
								<div class="descBox">
									统计目标新闻的从情感、实体、聚类等方面进行分析，反映目标新闻的情感变化、涉及的人物、组织、地点以及事件聚类的分布情况。 
								</div>
							</div>
							<div class="module_box" onclick="parent.mainhtml.location='../search/news/news_website_analysis?bgFlag=1'">
								<div class="imgBox">
									<img class="moduleImg" src="<%=basePath%>/static/navigationImg/news_website_analysis.png">
								</div>
								<div class="nameBox">
									网站分析
								</div>
								<div class="descBox">
									统计新闻数据的网站来源以及网站地域分布情况。
								</div>
							</div>
						</div>
                    </div>
                </div>
            </div>
          </div>
         </div>
	<jsp:include page="../updateUserPassword.jsp"/>
</body>
<!-- 计算显示图的高度 -->	
<script src="<%=basePath%>/static/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>/static/js/chartHeight.js" type="text/javascript"></script>
<script src="<%=basePath %>/static/win_alert/window.js"></script><!-- 弹出提示框js脚本 -->
<script type="text/javascript">

</script>
</html>