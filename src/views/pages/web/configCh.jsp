<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>XX安全检测系统_main</title>
<link rel="stylesheet" href="<%=basePath %>/static/css/style.css">
<link rel="stylesheet" id="main_link3" href="<%=basePath %>/static/css/sec2_2.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/bootstrap-datepicker.standalone.min.css">
<link rel="stylesheet" href="<%=basePath %>/static/lib/pagination.css" />
<link rel="stylesheet" href="<%=basePath %>/static/css/combo.select.css">
<link rel="stylesheet" href="<%=basePath %>/static/css/perfect-scrollbar.css"/>

<script src="<%=basePath %>/static/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath %>/static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath %>/static/js/perfect-scrollbar.js"></script>

<script src="<%=basePath %>/static/lib/jquery.pagination.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath %>/static/js/bootstrap-select.min.js"></script>
<script src="<%=basePath %>/static/js/jquery.combo.select.js"></script>
<script>
$(document).ready(function(){
	// 分页

	//这是一个非常简单的demo实例，让列表元素分页显示
	//回调函数的作用是显示对应分页的列表项内容
	//回调函数在用户每次点击分页链接的时候执行
	//参数page_index{int整型}表示当前的索引页
	var initPagination = function() {
		var num_entries = 10; //页数 $("#hiddenresult div.result").length
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
	<div class="index_top pos_fix">
		<h3 class="fl title">配置与参数</h3>
		<div class="title_r fr">
			<span class="set_span set_span2">事件配置</span>
			<span class="set_span">图谱配置</span>
		</div>
	</div>
	<div class="index_bottom pdt38">
		<div class="table_box">
			<ul class="table_ul mgl-30 clearfix">
				<li>事件名称：<input type="text"/></li>
				<li>类型筛选：<input type="text"/></li>
				<li>配置人：<input type="text"/></li>
				<li><input class="seach_btn" type="button" value="查询"></li>
			</ul>
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
						<td><span class="sort sort4">4</span></td>
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
						<td><span class="sort sort5">5</span></td>
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
						<td><span class="sort sort6">6</span></td>
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
						<td><span class="sort sort8">8</span></td>
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
						<td><span class="sort sort9">9</span></td>
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
						<td><span class="sort"></span></td>
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
						<td><span class="sort sort10"></span></td>
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
						<td><span class="sort"></span></td>
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
		<div class="tab2">
			<fieldset class="show">
				<!-- <legend class="legend">南海多国热点</legend> -->
				<ul class="table_ul clearfix">
					<li><div class="td1_2 fl"><p class="info_png fl"></p><b>信息描述：</b></div></li>
					<li>事件名称：<input type="text"/></li>
					<li>事件类型：<input class="event_type" type="text"/></li>
					<li>备注信息：<input type="text"/></li>
				</ul>
				<div class="hr"></div>
				<div class="tab_down2">
					<ul class="tab_down_info">
						<li class="clearfix">
							<div class="td1 fl"><p class="time_png fl"></p><b>日期属性：</b></div>
							<div class="td2 fl">
								<span class="date">年</span><span class="date">月</span><span class="date active_span">日</span>
							</div>
							<div class="td3_2 fl">
								<label class="lab0 yc" for=""><input class="inp_selc year1" type="text" value="2014"/></label>
								<label class="lab1 yc" for=""><input class="inp_selc month1" type="text" value="2014-12"/></label>
								<label class="lab2" for=""><input class="inp_selc day1" type="text" value="2014-12-01"/></label>
							</div>
							<div class="fl width18"></div>
							<div class="td3_2 fl">
								<label class="lab0 yc" for=""><input class="inp_selc year2" type="text" value="2014"/></label>
								<label class="lab1 yc" for=""><input class="inp_selc month2" type="text" value="2014-12"/></label>
								<label class="lab2" for=""><input class="inp_selc day2" type="text" value="2014-12-01"/></label>
							</div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="people_png fl"></p><b>角色属性：</b></div>
							<div class="width544 fl clearfix">
								<div class="td2_2 fl"><span class="span1">角色1</span></div>
								<div class="fl width138 clearfix">
									<div class="dowebok">
										<select>
											<option value="">国家</option>
											<option value="中国">中国</option>
											<option value="美国">美国</option>
											<option value="小日本">小日本</option>
											<option value="巴基斯坦">巴基斯坦</option>
											<option value="英国">英国</option>
											<option value="法国">法国</option>
											<option value="俄罗斯">俄罗斯</option>
											<option value="西班牙">西班牙</option>
											<option value="泰国">泰国</option>
											<option value="越南">越南</option>
											<option value="缅甸">缅甸</option>
											<option value="韩国">韩国</option>
											<option value="朝鲜">朝鲜</option>
											<option value="印度">印度</option>
											<option value="埃塞俄比亚">埃塞俄比亚</option>
											<option value="蒙古">蒙古</option>
											<option value="梵蒂冈">梵蒂冈</option>
											<option value="菲律宾">菲律宾</option>
										</select>
									</div>
								</div>
								<div class="fl guojia">国家</div>

								<div class="fl width138 clearfix">
									<div class="dowebok2">
										<select>
											<option value="">编码</option>
											<option value="中国">中国</option>
											<option value="美国">美国</option>
											<option value="小日本">小日本</option>
											<option value="巴基斯坦">巴基斯坦</option>
											<option value="英国">英国</option>
											<option value="法国">法国</option>
											<option value="俄罗斯">俄罗斯</option>
											<option value="西班牙">西班牙</option>
											<option value="泰国">泰国</option>
											<option value="越南">越南</option>
											<option value="缅甸">缅甸</option>
											<option value="韩国">韩国</option>
											<option value="朝鲜">朝鲜</option>
											<option value="印度">印度</option>
											<option value="埃塞俄比亚">埃塞俄比亚</option>
											<option value="蒙古">蒙古</option>
											<option value="梵蒂冈">梵蒂冈</option>
											<option value="菲律宾">菲律宾</option>
										</select>
									</div>
								</div>
								<div class="fl bianma">编码</div>
							</div>
							<div class="width544 fl clearfix">
								<div class="td2_2 fl"><span class="span1">角色2</span></div>
								<div class="fl width138 clearfix">
									<div class="dowebok3">
										<select>
											<option value="">国家</option>
											<option value="中国">中国</option>
											<option value="美国">美国</option>
											<option value="小日本">小日本</option>
											<option value="巴基斯坦">巴基斯坦</option>
											<option value="英国">英国</option>
											<option value="法国">法国</option>
											<option value="俄罗斯">俄罗斯</option>
											<option value="西班牙">西班牙</option>
											<option value="泰国">泰国</option>
											<option value="越南">越南</option>
											<option value="缅甸">缅甸</option>
											<option value="韩国">韩国</option>
											<option value="朝鲜">朝鲜</option>
											<option value="印度">印度</option>
											<option value="埃塞俄比亚">埃塞俄比亚</option>
											<option value="蒙古">蒙古</option>
											<option value="梵蒂冈">梵蒂冈</option>
											<option value="菲律宾">菲律宾</option>
										</select>
									</div>
								</div>
								<div class="fl guojia">国家</div>

								<div class="fl width138 clearfix">
									<div class="dowebok4">
										<select>
											<option value="">编码</option>
											<option value="中国">中国</option>
											<option value="美国">美国</option>
											<option value="小日本">小日本</option>
											<option value="巴基斯坦">巴基斯坦</option>
											<option value="英国">英国</option>
											<option value="法国">法国</option>
											<option value="俄罗斯">俄罗斯</option>
											<option value="西班牙">西班牙</option>
											<option value="泰国">泰国</option>
											<option value="越南">越南</option>
											<option value="缅甸">缅甸</option>
											<option value="韩国">韩国</option>
											<option value="朝鲜">朝鲜</option>
											<option value="印度">印度</option>
											<option value="埃塞俄比亚">埃塞俄比亚</option>
											<option value="蒙古">蒙古</option>
											<option value="梵蒂冈">梵蒂冈</option>
											<option value="菲律宾">菲律宾</option>
										</select>
									</div>
								</div>
								<div class="fl bianma">编码</div>
							</div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="event_png fl"></p><b>事件属性：</b></div>
							<div class="width272 fl clearfix">
								<div class="td2_2 fl"><span class="span1">基事件编码</span></div>
								<div class="fl width138">
									<div class="dowebok5">
											<select>
												<option value="">国家</option>
												<option value="中国">中国</option>
												<option value="美国">美国</option>
												<option value="小日本">小日本</option>
												<option value="巴基斯坦">巴基斯坦</option>
												<option value="英国">英国</option>
												<option value="法国">法国</option>
												<option value="俄罗斯">俄罗斯</option>
												<option value="西班牙">西班牙</option>
												<option value="泰国">泰国</option>
												<option value="越南">越南</option>
												<option value="缅甸">缅甸</option>
												<option value="韩国">韩国</option>
												<option value="朝鲜">朝鲜</option>
												<option value="印度">印度</option>
												<option value="埃塞俄比亚">埃塞俄比亚</option>
												<option value="蒙古">蒙古</option>
												<option value="梵蒂冈">梵蒂冈</option>
												<option value="菲律宾">菲律宾</option>
											</select>
									</div>
								</div>
							</div>
							<div class="width272 fl clearfix">
								<div class="td2_2 fl"><span class="span1">根事件编码</span></div>
								<div class="fl width138">
									<div class="dowebok6">
										<select>
											<option value="">国家</option>
											<option value="中国">中国</option>
											<option value="美国">美国</option>
											<option value="小日本">小日本</option>
											<option value="巴基斯坦">巴基斯坦</option>
											<option value="英国">英国</option>
											<option value="法国">法国</option>
											<option value="俄罗斯">俄罗斯</option>
											<option value="西班牙">西班牙</option>
											<option value="泰国">泰国</option>
											<option value="越南">越南</option>
											<option value="缅甸">缅甸</option>
											<option value="韩国">韩国</option>
											<option value="朝鲜">朝鲜</option>
											<option value="印度">印度</option>
											<option value="埃塞俄比亚">埃塞俄比亚</option>
											<option value="蒙古">蒙古</option>
											<option value="梵蒂冈">梵蒂冈</option>
											<option value="菲律宾">菲律宾</option>
										</select>
									</div>
								</div>
							</div>
							<div class="width272 fl clearfix">
								<div class="td2_2 fl"><span class="span1">事件发生位置</span></div>
								<div class="fl width138">
									<div class="dowebok7">
										<select>
											<option value="">国家</option>
											<option value="中国">中国</option>
											<option value="美国">美国</option>
											<option value="小日本">小日本</option>
											<option value="巴基斯坦">巴基斯坦</option>
											<option value="英国">英国</option>
											<option value="法国">法国</option>
											<option value="俄罗斯">俄罗斯</option>
											<option value="西班牙">西班牙</option>
											<option value="泰国">泰国</option>
											<option value="越南">越南</option>
											<option value="缅甸">缅甸</option>
											<option value="韩国">韩国</option>
											<option value="朝鲜">朝鲜</option>
											<option value="印度">印度</option>
											<option value="埃塞俄比亚">埃塞俄比亚</option>
											<option value="蒙古">蒙古</option>
											<option value="梵蒂冈">梵蒂冈</option>
											<option value="菲律宾">菲律宾</option>
										</select>
									</div>
								</div>
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
			</fieldset>
			<fieldset>
				<ul class="table_ul clearfix">
					<li><div class="td1_2 fl"><p class="info_png fl"></p><b>信息描述：</b></div></li>
					<li>事件名称：<input type="text"/></li>
					<li>事件类型：<input class="atlas_type"  type="text"/></li>
					<li>备注信息：<input type="text"/></li>
				</ul>
				<div class="hr"></div>
				<div class="tab_down2">
					<ul class="tab_down_info">
						<li class="clearfix">
							<div class="td1 fl"><p class="time_png fl"></p><b>日期属性：</b></div>
							<div>当前数据库时间范围：<span>2013-03-01</span>至<span>2016-12-12</span></div>
							<div class="width250 fl clearfix">
								<div class="fl"><span class="beg_time fl">开始时间</span></div>
								<div class="td3_2 fl">
									<label class="lab2" for=""><input class="inp_selc day1" type="text" value="2014-12-01"/></label>
								</div>
							</div>
							<div class="fl clearfix">
								<div class="fl"><span class="end_time fl">结束时间</span></div>
								<div class="td3_2 fl">
									<label class="lab2" for=""><input class="inp_selc day2" type="text" value="2014-12-01"/></label>
								</div>
							</div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="threshold_png fl"></p><b>关键字搜索条件：</b></div>
							<div >您必须指定检索的关键词，用逗号隔开；在检索中，以下三个查询条件之间是“AND”关系</div>
							<div class="fl">
								<div class="condition fl">必须包含以下所有关键词</div>
								<input class="condition_info fl" type="text" value="淘宝，京东" />
							</div>
							<div class="fl condition_box2">
								<div class="condition fl">不能包含以下关键词</div>
								<input class="condition_info fl" type="text" value="阿里巴巴" />
							</div>
							<div class="fl  condition_box3">
								<div class="condition fl">包含至少一个以下关键词</div>
								<input class="condition_info fl" type="text" value="淘宝" />
							</div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="weight_png fl"></p><b>域：</b></div>
							<div>词云里面词语的来源</div>
							<div class="radio_box">
								<form action="">
									<label for="1"><input type="radio" id="1" name="1" /> 人物</label>
									<label for="2"><input type="radio" id="2" name="1" /> 组织</label>
									<label for="3"><input type="radio" id="3" name="1" /> 主题</label>
									<label for="4"><input type="radio" id="4" name="1" /> 国家</label>
									<label for="5"><input type="radio" id="5" name="1" /> 城市</label>
								</form>
							</div>
						</li>
						<li class="clearfix">
							<div class="td1 fl"><p class="weight_png fl"></p><b>权重依据：</b></div>
							<div class="radio_box">
								<form action="">
									<label for="6"><input type="radio" id="6" name="1" /> 事件出现次数</label>
									<label for="7"><input type="radio" id="7" name="1" /> 出现该事件的文章数</label>
								</form>
							</div>
						</li>
						<li><input class="submit" type="button" value="提交"></li>
					</ul>
				</div>
			</fieldset>
		</div>
	</div>
<div id="shadow" class="shadow"></div>
<div class="popup">
	<div class="popup_t">
		<h3 class="popup_h3 fl">事件分类</h3>
		<label class="check_z" for=""><input id="sec_all" class="sec_all"  type="checkbox" >&nbsp全选</label>
	</div>
	<div class="popup_m">
		<ul id="popup_ul" class="popup_ul  clearfix">
			<li><label for="event0"><input id="event0" type="checkbox" >&nbsp首页展示</label></li>
			<li><label for="event1"><input id="event1" type="checkbox" >&nbsp网络展示</label></li>
			<li><label for="event2"><input id="event2" type="checkbox" >&nbsp类型事件演化</label></li>
			<li><label for="event3"><input id="event3" type="checkbox" >&nbsp类型展示</label></li>
			<li><label for="event4"><input id="event4" type="checkbox" >&nbsp热点展示</label></li>
			<li><label for="event5"><input id="event5" type="checkbox" >&nbsp对比展示</label></li>
			<li><label for="event6"><input id="event6" type="checkbox" >&nbsp地理时间演化</label></li>
			<li><label for="event7"><input id="event7" type="checkbox" >&nbsp国家角色展示</label></li>
			<li><label for="event8"><input id="event8" type="checkbox" >&nbsp国家稳定分析</label></li>
			<li><label for="event9"><input id="event9" type="checkbox" >&nbsp国家状态展示</label></li>
			<li><label for="event10"><input id="event10" type="checkbox" >&nbsp国家态势感知</label></li>
			<li><label for="event11"><input id="event11" type="checkbox" >&nbsp信息展示</label></li>
			<li><label for="event12"><input id="event12" type="checkbox" >&nbsp回溯分析</label></li>
			<li><label for="event13"><input id="event13" type="checkbox" >&nbsp综合展示</label></li>
		</ul>
	</div>
	<div class="popup_b">
		<p class="fr">
			<span class="save">保存</span>
			<span class="cancel">取消</span>
		</p>
	</div>
</div>
<div class="popup2">
	<div class="popup_t">
		<h3 class="popup_h3 fl">事件分类</h3>
		<label class="check_z" for=""><input id="sec_all" class="sec_all"  type="checkbox" >&nbsp全选</label>
	</div>
	<div class="popup_m">
		<ul id="atlas_ul" class="popup_ul clearfix">
			<li><label for="atlas1"><input id="atlas1" type="checkbox" >&nbsp领导人情感分析</label></li>
			<li><label for="atlas2"><input id="atlas2" type="checkbox" >&nbsp领导人头像标签云</label></li>
			<li><label for="atlas3"><input id="atlas3" type="checkbox" >&nbsp时间线-组织</label></li>
			<li><label for="atlas4"><input id="atlas4" type="checkbox" >&nbsp时间线-情感</label></li>
			<li><label for="atlas5"><input id="atlas5" type="checkbox" >&nbsp时间线-地理</label></li>
			<li><label for="atlas6"><input id="atlas6" type="checkbox" >&nbsp时间线-冲突</label></li>
			<li><label for="atlas7"><input id="atlas7" type="checkbox" >&nbsp时间线-人物</label></li>
			<li><label for="atlas8"><input id="atlas8" type="checkbox" >&nbsp时间线-主题</label></li>
			<li><label for="atlas9"><input id="atlas9" type="checkbox" >&nbsp实体网络图展示</label></li>
			<li><label for="atlas10"><input id="atlas10" type="checkbox" >&nbsp实体标签云展示</label></li>
			<li><label for="atlas11"><input id="atlas11" type="checkbox" >&nbsp实体地理网络展示</label></li>
			<li><label for="atlas12"><input id="atlas12" type="checkbox" >&nbsp实体地理热点展示</label></li>
			<li><label for="atlas13"><input id="atlas13" type="checkbox" >&nbsp国家状态展示</label></li>
			<li><label for="atlas14"><input id="atlas14" type="checkbox" >&nbsp国家冲突分析</label></li>
			<li><label for="atlas15"><input id="atlas15" type="checkbox" >&nbsp国家综合展示1</label></li>
			<li><label for="atlas16"><input id="atlas16" type="checkbox" >&nbsp国家综合展示2</label></li>
		</ul>
	</div>
	<div class="popup_b">
		<p class="fr">
			<span class="save">保存</span>
			<span class="cancel">取消</span>
		</p>
	</div>
</div>
<script id="tet" src="<%=basePath %>/static/js/sec2_2.js"></script>
<script src="<%=basePath %>/static/js/yuzhi.js"></script>
<script>
$(function(){
	$('select').comboSelect();
// 下拉框 每一个下拉框对应一个ID，然后调用perfectScrollbar美化滚动条
	$(".dowebok ul").attr("id","description");
	$(".dowebok2 ul").attr("id","description2");
	$(".dowebok3 ul").attr("id","description3");
	$(".dowebok4 ul").attr("id","description4");
	$(".dowebok5 ul").attr("id","description5");
	$(".dowebok6 ul").attr("id","description6");
	$(".dowebok7 ul").attr("id","description7");
	$('#description').perfectScrollbar({
      wheelSpeed: 20,
      wheelPropagation: false
    });
	$('#description2').perfectScrollbar({
      wheelSpeed: 20,
      wheelPropagation: false
    });
    $('#description3').perfectScrollbar({
      wheelSpeed: 20,
      wheelPropagation: false
    });
	$('#description4').perfectScrollbar({
      wheelSpeed: 20,
      wheelPropagation: false
    });
    $('#description5').perfectScrollbar({
      wheelSpeed: 20,
      wheelPropagation: false
    });
    $('#description6').perfectScrollbar({
      wheelSpeed: 20,
      wheelPropagation: false
    });
    $('#description7').perfectScrollbar({
      wheelSpeed: 20,
      wheelPropagation: false
    });


	// 选择年月日
	$('.day1').datepicker({
		format: 'yyyy-mm-dd', 
		weekStart: 0,
		autoclose: true, 
		orientation:" top auto",
		startView: 0,
		maxViewMode: 2,
		minViewMode:0,
		forceParse: false, 
		language: 'zh-CN',
		endDate : new Date(),
	}).on('changeDate',function(e){  
		    var startTime = e.date;  
		    $('.day2').datepicker('setStartDate',startTime);  
		});
	$('.day1').datepicker('setStartDate','2014-12-01'); 

	$('.day2').datepicker({
		format: 'yyyy-mm-dd', 
		weekStart: 0,
		autoclose: true, 
		orientation:" top auto",
		startView: 0,
		maxViewMode: 2,
		minViewMode:0,
		forceParse: false, 
		language: 'zh-CN',
		endDate : new Date()
	}).on('changeDate',function(e){  
		    var endTime = e.date;  
		    $('.day1').datepicker('setEndDate',endTime);  
		}); 

////////////////////////////////////////////////////////////////////////////

	// 控制选择年月日
	$(".td2 .date").on("click",function(){
		$(this).addClass("active_span").siblings().removeClass("active_span");
	});
	$(".td2 .date:eq(0)").on("click",function(){
		$(".lab1,.lab2").css("display","none");
		$(".lab0").css("display","inline-block");

		$('.year1').datepicker({
			format: 'yyyy', 
			weekStart: 0,
			autoclose: true, 
			orientation:" top auto",
			startView: 2, 
			maxViewMode: 2,
			minViewMode:2,
			forceParse: false, 
			language: 'zh-CN',
			endDate : new Date(),
		}).on('changeDate',function(e){  
		    var startTime = e.date;  
		    $('.year2').datepicker('setStartDate',startTime);  
		}); 
		$('.year1').datepicker('setStartDate','2012');
		// ///////
		$('.year2').datepicker({
			format: 'yyyy', 
			weekStart: 0,
			autoclose: true, 
			orientation:" top auto",
			startView: 2, 
			maxViewMode: 2,
			minViewMode:2,
			forceParse: false, 
			language: 'zh-CN',
			endDate : new Date()
		}).on('changeDate',function(e){  
		    var endTime = e.date;  
		    $('.year').datepicker('setEndDate',endTime);  
		}); 



	});
	$(".td2 .date:eq(1)").on("click",function(){
		$(".lab0").css("display","none");
		$(".lab1").css("display","inline-block");
		$(".lab2").css("display","none");

		$('.month1').datepicker({
			format: 'yyyy-mm', 
			weekStart: 0, 
			autoclose: true, 
			orientation:" top auto",
			startView: 1, 
			maxViewMode: 2,
			minViewMode:1,
			forceParse: false, 
			language: 'zh-CN',
		}).on('changeDate',function(e){  
		    var startTime = e.date;  
		    $('.month2').datepicker('setStartDate',startTime);  
		});
		$('.month1').datepicker('setStartDate','2014-12');

		$('.month2').datepicker({
			format: 'yyyy-mm', 
			weekStart: 0, 
			autoclose: true, 
			orientation:" top auto",
			startView: 1, 
			maxViewMode: 2,
			minViewMode:1,
			forceParse: false, 
			language: 'zh-CN',
		}).on('changeDate',function(e){  
		    var endTime = e.date;  
		    $('.month1').datepicker('setEndDate',endTime);  
		});
	});
	$(".td2 .date:eq(2)").on("click",function(){
		$(".lab0").css("display","none");
		$(".lab1").css("display","none");
		$(".lab2").css("display","inline-block");

		$('.day').datepicker({
			format: 'yyyy-mm-dd', 
			weekStart: 0,
			autoclose: true, 
			orientation:" top auto",
			startView: 0,
			maxViewMode: 2,
			minViewMode:0,
			forceParse: false, 
			language: 'zh-CN',
		});
		$('.day').datepicker('setStartDate','2014-12-01');
	});


///////////////////////////////////////////////


	$(".input_select").click(function(){
		var ul = $(".dropdown ul");
		if(ul.css("display") == "none"){
			ul.slideDown("fast");
		}else{
			ul.slideUp("fast");
		}
	});

	$(".dropdown ul li a").click(function(){
		var txt = $(this).text();
		$(".input_select").val(txt);
		$(".dropdown ul").hide();
	});

	var bodyScrH = document.body.scrollHeight;
	$(".event_type").focus(function(){
		$(".shadow").height(bodyScrH);
		$(".shadow").css("display","block");
		$(".popup").css("display","block");
	});
	$(".atlas_type").focus(function(){
		$(".shadow").height(bodyScrH);
		$(".shadow").css("display","block");
		$(".popup2").css("display","block");
	});

	$(".shadow").on('click',function(){
		$(".shadow").css("display","none");
		$(".popup").css("display","none");
		$(".popup2").css("display","none");

	});

	$(".cancel").on('click',function(){
		$(".shadow").css("display","none");
		$(".popup").css("display","none");
		$(".popup2").css("display","none");
	});

	$(".sec_all").on('click',function(){
		if(this.checked){
			$(".popup_ul :checkbox").prop("checked",true);
		}else{
			$(".popup_ul :checkbox").prop("checked",false);
		}
	});
	$(".popup_ul :checkbox").on('click',function(){
		allCheck();
	})

})
	
	function allCheck(){
		var chknum = $(".popup_ul :checkbox").size();
		var chk = 0;
		$(".popup_ul :checkbox").each(function(){
			if($(this).prop("checked") == true){
				chk++;
			}
		});
		if(chk == chknum){
			$("#sec_all").prop("checked",true);
		}else{
			$("#sec_all").prop("checked",false);
		}
	};
	
</script>
</body>
</html>