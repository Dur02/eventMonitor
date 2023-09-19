<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<base hre>
<title>监测系统</title>
<link rel="stylesheet" href="<%=basePath %>/static/css/style.css">
<link rel="stylesheet" id="main_link" href="<%=basePath %>/static/css/sec2.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="<%=basePath %>/static/lib/pagination.css" />
<script src="<%=basePath %>/static/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath %>/static/lib/jquery.pagination.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script>
$(document).ready(function(){
	// 分页

	//这是一个非常简单的demo实例，让列表元素分页显示
	//回调函数的作用是显示对应分页的列表项内容
	//回调函数在用户每次点击分页链接的时候执行
	//参数page_index{int整型}表示当前的索引页
	var initPagination = function() {
		var num_entries = 10; //页数 
		// 创建分页
		$("#Pagination").pagination(num_entries, {
			num_edge_entries: 1, //边缘页数
			num_display_entries: 4, //主体页数
			callback: pageselectCallback,
			items_per_page:1 //每页显示1项
		});
	 }();
	 
	function pageselectCallback(page_index, jq){
		var new_content = $("#hiddenresult div.result:eq("+page_index+")").clone();
		$("#Searchresult").empty().append(new_content); //装载对应分页的内容
		return false;
	};
})
</script>
</head>
<body>
	<div class="index_top clearfix">
		<h3 class="fl title">事件分析 > 事件对比分析</h3>
		<div class="title_r fr">
			<span class="export_img_2" title="图表切换"></span>
			<span class="info_img"></span>
			<ul class="info_box">
				<li><span>数据：</span>事件数据库</li>
				<li><span>描述：</span>反映一段时间内，某地发生的事件的对比情况</li>
				<li><span>输入：</span>对比信息，事件编码，阈值信息</li>
				<li><span>介绍：</span>ttajkasdasdfa asdfasdf asdfa啊发生的发生地阿打法的疯狂拉升地方案的发生发生的法律看见俺十分啊发生的发生地发沙发</li>
			</ul>
		</div>
	</div>
	<div class="index_bottom">
		<div class="img_data show">
			<img src="<%=basePath %>/static/images/sjdbfx.png" alt="">
		</div>
		<div class="table_data">
			<table class="table">
				<thead>
					<tr>
						<th>序号</th>
						<th>排序</th>
						<th>挂起</th>
						<th>事件名称</th>
						<th>事件分类</th>
						<th>创建人</th>
						<th>创建日期</th>
						<th>备注信息</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td><span class="sort sort1">1</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>2</td>
						<td><span class="sort sort2">2</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>3</td>
						<td><span class="sort sort3">3</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>3</td>
						<td><span class="sort sort7">4</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>5</td>
						<td><span class="sort sort7">5</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>6</td>
						<td><span class="sort sort7">6</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>7</td>
						<td><span class="sort sort7">7</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>8</td>
						<td><span class="sort sort7">8</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>9</td>
						<td><span class="sort sort7">9</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>10</td>
						<td><span class="sort">10</span></td>
						<td></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state2.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>11</td>
						<td><span class="sort sort10">11</span></td>
						<td><img class="gq" src="<%=basePath %>/static/images/gq2.png" alt="挂起"></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state1.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
					<tr>
						<td>12</td>
						<td><span class="sort">12</span></td>
						<td><!-- <img class="gq" src="<%=basePath %>/static/images/gq.png" alt="挂起"> --></td>
						<td>南海多国热点</td>
						<td>事件对比分析</td>
						<td>admin</td>
						<td>2016-12-12</td>
						<td>南海与美国和周边国家态势分析</td>
						<td><img src="<%=basePath %>/static/images/state3.png"/></td>
						<td>
							<img class="set" src="<%=basePath %>/static/images/set.png"/>
							<img class="del" src="<%=basePath %>/static/images/del.png"/>
						</td>
					</tr>
				</tbody>
			</table>
			<div id="Pagination" class="pagination"><!-- 这里显示分页 --></div>
			<div id="Searchresult">分页初始化完成后这里的内容会被替换。</div>
		</div>
		<div class="tab">
			<span class="ul_xl"></span>
			<ul id="tab_ul" class="tab_ul clearfix">
				<li class="active mgl-30">预设热点A<b></b><span></span></li>
				<li class="">预设热点B<b></b><span></span></li>
				<li>预设热点C<b></b><span></span></li>
				<li class="manual">人工输入查询<b></b></li>
			</ul>
			<div class="tab_div">
				<!-- 预设点A -->
				<div class="tab_down show">
					<ul class="tab_down_info">
						<li class="clearfix">
							<div class="td1 fl"><p class="time_png fl"></p><b>日期属性：</b></div>
							<div class="td2 fl"><span class="date">年</span><span class="active_span">月</span><span>日</span></div>
							<div class="td3 fl"><span>2014</span>年<span>12</span>月<span>12</span>日</div>
							<div class="td4 fl"></div>
							<div class="td3 fl"><span>2014</span>年<span>12</span>月<span>31</span>日</div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="people_png fl"></p><b>角色属性：</b></div>
							<div class="width544 fl clearfix">
								<div class="td2_2 fl"><span class="span1">角色1</span></div>
								<div class="td3 fl"><span class="w_138">土库曼斯坦</span>国家</div>
								<div class="td4 fl"></div>
								<div class="td3 fl"><span class="w_138">PekingaCinefege</span>编码</div>
							</div>
							<!-- <div class="td4_2 fl"><span class="weight">vs</span></div> -->
							<div class="width450 fl clearfix">
								<div class="td2_2 fl"><span class="span2">角色2</span></div>
								<div class="td3 fl"><span class="w_138">土库曼斯坦</span>国家</div>
								<div class="td4 fl"></div>
								<div class="td3 fl"><span class="w_138">PekingaCinefege</span>编码</div>
							</div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="event_png fl"></p><b>事件属性：</b></div>
							<div class="width254 fl clearfix">
								<div class="td2_2 fl"><span class="span1">基事件编码</span></div>
								<div class="td3 fl"><span class="w_138">fight</span></div>
							</div>
							<div class="td4 fl"></div>
							<div class="width254 fl clearfix">
								<div class="td2_2 fl"><span class="span1">根事件编码</span></div>
								<div class="td3 fl"><span class="w_138">fight</span></div>
							</div>
							<div class="td4 fl"></div>
							<div class="width254 fl clearfix">
								<div class="td2_2 fl"><span class="span1">事件发生位置</span></div>
								<div class="td3 fl"><span class="w_138">fight</span></div>
							</div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="weight_png fl"></p><b>权重依据：</b></div>
							<div class="td5 fl"><input id="radio1" type="radio"><label for="radio1"> 事件出现次数</label></div>
							<div class="td5 fl"><input id="radio2" type="radio"><label for="radio2"> 出现该事件的文章数</label></div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="threshold_png fl"></p><b>事件阈值过滤：</b></div>
							<div class="td5 fl">节点阈值 <span>200</span></div>
							<div class="td5 fl">边阈值 <span>100000</span></div>
						</li>
					</ul>
				</div>
				<!-- 预设点B -->
				<div class="tab_down">
					<ul class="info">
						<li class="clearfix">
							<div class="td1 fl"><p class="time_png fl"></p><b>日期属性：</b></div>
							<div class="td2 fl"><span class="date">年</span><span class="active_span">月</span><span>日</span></div>
							<div class="td3 fl"><span>2014</span>年<span>12</span>月<span>12</span>日</div>
							<div class="td4 fl"></div>
							<div class="td3 fl"><span>2014</span>年<span>12</span>月<span>31</span>日</div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="people_png fl"></p><b>角色属性：</b></div>
							<div class="width544 fl clearfix">
								<div class="td2_2 fl"><span class="span1">角色1</span></div>
								<div class="td3 fl"><span class="w_138">土库曼斯坦</span>国家</div>
								<div class="td4 fl"></div>
								<div class="td3 fl"><span class="w_138">PekingaCinefege</span>编码</div>
							</div>
							<!-- <div class="td4_2 fl"><span class="weight">vs</span></div> -->
							<div class="width450 fl clearfix">
								<div class="td2_2 fl"><span class="span2">角色2</span></div>
								<div class="td3 fl"><span class="w_138">土库曼斯坦</span>国家</div>
								<div class="td4 fl"></div>
								<div class="td3 fl"><span class="w_138">PekingaCinefege</span>编码</div>
							</div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="event_png fl"></p><b>事件属性：</b></div>
							<div class="width254 fl clearfix">
								<div class="td2_2 fl"><span class="span1">基事件编码</span></div>
								<div class="td3 fl"><span class="w_138">fight</span></div>
							</div>
							<div class="td4 fl"></div>
							<div class="width254 fl clearfix">
								<div class="td2_2 fl"><span class="span1">根事件编码</span></div>
								<div class="td3 fl"><span class="w_138">fight</span></div>
							</div>
							<div class="td4 fl"></div>
							<div class="width254 fl clearfix">
								<div class="td2_2 fl"><span class="span1">事件发生位置</span></div>
								<div class="td3 fl"><span class="w_138">fight</span></div>
							</div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="weight_png fl"></p><b>权重依据：</b></div>
							<div class="td5 fl"><input id="radio1" type="radio"><label for="radio1"> 事件出现次数</label></div>
							<div class="td5 fl"><input id="radio2" type="radio"><label for="radio2"> 出现该事件的文章数</label></div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="threshold_png fl"></p><b>事件阈值过滤：</b></div>
							<div class="td5 fl">节点阈值 <span>200</span></div>
							<div class="td5 fl">边阈值 <span>100000</span></div>
						</li>
					</ul>
				</div>
				<!-- 预设点C -->
				<div class="tab_down">
					<ul class="info">
						<li class="clearfix">
							<div class="td1 fl"><p class="time_png fl"></p><b>日期属性：</b></div>
							<div class="td2 fl"><span class="date">年</span><span class="active_span">月</span><span>日</span></div>
							<div class="td3 fl"><span>2014</span>年<span>12</span>月<span>12</span>日</div>
							<div class="td4 fl"></div>
							<div class="td3 fl"><span>2014</span>年<span>12</span>月<span>31</span>日</div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="people_png fl"></p><b>角色属性：</b></div>
							<div class="width544 fl clearfix">
								<div class="td2_2 fl"><span class="span1">角色1</span></div>
								<div class="td3 fl"><span class="w_138">土库曼斯坦</span>国家</div>
								<div class="td4 fl"></div>
								<div class="td3 fl"><span class="w_138">PekingaCinefege</span>编码</div>
							</div>
							<!-- <div class="td4_2 fl"><span class="weight">vs</span></div> -->
							<div class="width450 fl clearfix">
								<div class="td2_2 fl"><span class="span2">角色2</span></div>
								<div class="td3 fl"><span class="w_138">土库曼斯坦</span>国家</div>
								<div class="td4 fl"></div>
								<div class="td3 fl"><span class="w_138">PekingaCinefege</span>编码</div>
							</div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="event_png fl"></p><b>事件属性：</b></div>
							<div class="width254 fl clearfix">
								<div class="td2_2 fl"><span class="span1">基事件编码</span></div>
								<div class="td3 fl"><span class="w_138">fight</span></div>
							</div>
							<div class="td4 fl"></div>
							<div class="width254 fl clearfix">
								<div class="td2_2 fl"><span class="span1">根事件编码</span></div>
								<div class="td3 fl"><span class="w_138">fight</span></div>
							</div>
							<div class="td4 fl"></div>
							<div class="width254 fl clearfix">
								<div class="td2_2 fl"><span class="span1">事件发生位置</span></div>
								<div class="td3 fl"><span class="w_138">fight</span></div>
							</div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="weight_png fl"></p><b>权重依据：</b></div>
							<div class="td5 fl"><input id="radio1" type="radio"><label for="radio1"> 事件出现次数</label></div>
							<div class="td5 fl"><input id="radio2" type="radio"><label for="radio2"> 出现该事件的文章数</label></div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="threshold_png fl"></p><b>事件阈值过滤：</b></div>
							<div class="td5 fl">节点阈值 <span>200</span></div>
							<div class="td5 fl">边阈值 <span>100000</span></div>
						</li>
					</ul>
				</div>
				<!-- 人工输入查询 -->
				<div class="tab_down">
					<ul class="info">
						<li class="clearfix">
							<div class="td1 fl"><p class="time_png fl"></p><b>日期属性：</b></div>
							<div class="td2 fl"><span class="date">年</span><span class="active_span">月</span><span>日</span></div>
							<div class="td3_2 fl"><input class="year" type="text" value="2014"/>年<input class="month mon_dat" type="text" value="12"/>月<input class="day mon_dat" type="text" value="31"/>日</div>
							<div class="td4 fl"></div>
							<div class="td3_2 fl"><input class="year" type="text" value="2014"/>年<input class="month mon_dat" type="text" value="12"/>月<input class="day mon_dat" type="text" value="31"/>日</div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="people_png fl"></p><b>角色属性：</b></div>
							<div class="width544 fl clearfix">
								<div class="td2_2 fl"><span class="span1">角色1</span></div>
								<div class="td3_2 fl"><input class="w_138" type="text" value="土库曼斯坦"/>国家</div>
								<div class="td4 fl"></div>
								<div class="td3_2 fl"><input class="w_138" type="text" value="PekingaCinefege"/>编码</div>
							</div>
							<!-- <div class="td4_2_inp fl"></div> -->
							<div class="width490 fl clearfix">
								<div class="td2_2 fl"><span class="span2">角色1</span></div>
								<div class="td3_2 fl"><input class="w_138" type="text" value="土库曼斯坦"/>国家</div>
								<div class="td4 fl"></div>
								<div class="td3_2 fl"><input class="w_138" type="text" value="PekingaCinefege"/>编码</div>
							</div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="event_png fl"></p><b>事件属性：</b></div>
							<div class="width272 fl clearfix">
								<div class="td2_2 fl"><span class="span1">基事件编码</span></div>
								<div class="td3_2_2 fl"><input type="text" value="fight"/></div>
							</div>
							<!-- <div class="td4 fl"><span></span></div>
							<div class="td4 fl"><span></span></div> -->
							<div class="width272 fl clearfix">
								<div class="td2_2 fl"><span class="span1">根事件编码</span></div>
								<div class="td3_2_2 fl"><input type="text" value="fight"/></div>
							</div>
							<!-- <div class="td4 fl"><span></span></div> -->
							<div class="width272 fl clearfix">
								<div class="td2_2 fl"><span class="span1">事件发生位置</span></div>
								<div class="td3_2_2 fl"><input type="text" value="fight"/></div>
							</div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="weight_png fl"></p><b>权重依据：</b></div>
							<div class="td5 fl"><input id="radio1" type="radio" checked="checked"><label for="radio1"> 事件出现次数</label></div>
							<div class="td5 fl"><input id="radio2" type="radio"><label for="radio2"> 出现该事件的文章数</label></div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="threshold_png fl"></p><b>事件阈值过滤：</b></div>
							<div class="td5 fl">节点阈值 <input id="reduce1" class="reduce" type="button" value="-" /><input id="threshold1" class="threshold" type="text" value="200"/><input id="add1" class="add" type="button" value="+" /></div>


							<div class="td5 fl">边阈值 <input id="reduce2" class="reduce" type="button" value="-" /><input id="threshold2" class="threshold" type="text" value="100000"/><input id="add2" class="add" type="button" value="+" /></div>
						</li>
						<li><input class="submit" type="button" value="提交"></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
<script src="<%=basePath %>/static/js/sec2.js"></script>
<script src="<%=basePath %>/static/js/yuzhi.js"></script>
</body>
</html>