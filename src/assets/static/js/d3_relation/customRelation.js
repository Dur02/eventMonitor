
//2、610行添加3个全局变量nodeCircle,linkLine,lineText;
var nodeCircle, linkLine, lineText	    
var center_x = 0, center_y = 0;
var zoom = 1;

//渲染关联图初始化
function initRelation(nodeData,relationData,containerID,initCustomScale,translateWidth,translateHeight,nodes,maxLinkValue,minLinkValue){
	
	$('#' + containerID).css('opacity',0);
    var links = [];
    for(var i = 0, j = relationData.length; i < j; i ++) {
        links.push({
            "source" : relationData[i]["key1"],
            "target" : relationData[i]["key2"],
            "value" : relationData[i]["value"]
		});
	}

	// 初始化
	setTimeout(function() {//不调用此方法会报错
		initialize({"nodes":nodes,"relations":links});
	}, 10);

    //节点值的最大最小值
	var maxNodeValue = 0;
	var minNodeValue = 10000;
	
	//根据节点个数计算斥力的力度
	var forceChargeValue = -20000;
	if(nodes.length < 200){
		forceChargeValue = -100000
	}else if(nodes.length < 400){
		forceChargeValue = -50000
	}else if(nodes.length < 600){
		forceChargeValue = -20000
	}else if(nodes.length > 600){
		forceChargeValue = -10000
	}
    for(var key in nodeData) {
        var item = nodeData[key];
        var numItem = parseInt(item);
        if(numItem > maxNodeValue) {
            maxNodeValue = numItem;
        } 
        if(numItem <= minNodeValue) {
           minNodeValue = numItem;
        }
    }

    const width = $("#"+containerID).width();
    const height = $("#"+containerID).height();
    if(initCustomScale == '' || initCustomScale == undefined){
    	initCustomScale = 0.3;
    }
    const initScale = initCustomScale;//初始化时图形比例   
    let draging = false;
	
	const nodeTextFontSize = 30; //节点文字大小
	const lineTextFontSize = 100;//连线文字大小

	const nodeLevel = 5; //节点值划分的区间数
	const linkLevel = 4; //连接线值划分的区间数
	const nodeConf = {
	    //边框颜色
	    strokeColor : {
	       '1': 'rgb(234, 52, 31)',
	       '2': 'rgb(194, 40, 22)',
	       '3': 'rgb(146, 30, 16)',
	       '4': 'rgb(35, 148, 206)',
	       '5': 'rgb(66, 78, 210)'
	    },
		//圆半径
	    radius : {
	       '1': 35,
	       '2': 40,
	       '3': 45,
	       '4': 50,
	       '5': 55
	    },
		//背景色
		backgroundColor : {
            '3': 'rgb(234, 52, 31)',
            '4': 'rgb(194, 40, 22)',
            '5': 'rgb(146, 30, 16)',
            '1': 'rgb(35, 148, 206)',
            '2': 'rgb(66, 78, 210)'
		}
	};

	const lineConf = {
	    lineColor : {
            // '1': 'rgb(234, 52, 31)',
            // '2': 'rgb(194, 40, 22)',
            // '3': 'rgb(146, 30, 16)',
            // '4': 'rgb(35, 148, 206)'
            '1': 'white',
            '2': 'yellow',
            '3': 'green',
            '4': 'red'
		}
	}
	
	// 力导向图
	const force = d3.layout.force()
	    .size([width, height]) // 画布的大小
	    .linkDistance(60) // 连线长度
	    .charge(forceChargeValue); // 排斥/吸引，值越小越排斥
	
	// 全图缩放器
	zoom = d3.behavior.zoom()
	    .scaleExtent([0.1, 10]) //缩放范围
	    .on('zoom', zoomFn);
	
	// 节点拖拽器（使用 d3.behavior.drag 节点拖动失效）
	const drag = force.drag()
	    .origin(d => d)
	    .on('dragstart', dragstartFn)
	    .on('drag', dragFn)
	    .on('dragend', dragendFn);
	
	// SVG
	const svg = d3.select('#'+containerID).append('svg')
	    .attr('width', width)
	    .attr('height', height)
	    .append('g')
	    .call(zoom)
	    .on('dblclick.zoom', null);
	
	// 缩放层（位置必须在 container 之前）
	const zoomOverlay = svg.append('rect')
	    .attr('width', width)
	    .attr('height', height)
	    .style('fill', 'none')
	    .style('pointer-events', 'all');
	
	const container = svg.append('g')
	    .attr('transform', 'translate(' + width * translateWidth + ',' + height * translateHeight + ')scale(' + initScale + ')')   //初始化图的显示大小
	    .attr('class', 'container');
	
	// 初始化
	function initialize(resp) {
	    let {
	        nodes,
	        relations
	    } = resp;

	    // 生成 nodes map
	    nodesMap = genNodesMap(nodes);
	    // 构建 nodes（不能直接使用 api 中的 nodes）
	    nodes = d3.values(nodesMap);
	    // 起点和终点相同的关系映射
	    linkMap = genLinkMap(relations);
	    // 构建 links
	    const links = genLinks(relations);
	
	    // 绑定力导向图数据
	    force
	        .nodes(nodes) // 设定节点数组
	        .links(links); // 设定连线数组
	
	    // 开启力导向布局
	    force.start();
	    
	    // 手动快速布局
	    for (let i = 0, n = 1000; i < n; ++i) {
	        force.tick();
	    }
	
	    // 停止力布局
	    force.stop();
	    var max_x = -10000;
	    var max_y = -10000;
	    var min_x = 100000;
	    var min_y = 100000;
	    var max_value = 0;

	    // 固定所有节点
	    nodes.forEach(node => {
	        node.fixed = true;
	        if(node.x >= max_x) {
	        	max_x = node.x;
	        }
	        if(node.x <= min_x) {
	        	min_x = node.x;
	        }
	        if(node.y >= max_y) {
	        	max_y = node.y;
	        }
	        if(node.y <= min_y) {
	        	min_y = node.y;
	        }
	        
	        if(node.value >= max_value) {
	        	center_x = node.x;
	        	center_y = node.y;
	        }	        
	    });
	
	    // 节点连线    
	    linkLine = container.selectAll('.link')
	        .data(force.links())
	        .enter()
	        .append('path')
	        .attr('class', 'link')
	        .attr({
	            'd': link => genLinkPath(link),
	            'id': link => 'link-' + link.id,
	        })
	        .style('stroke',link => lineConf["lineColor"][getLinkLevel(link, minLinkValue, maxLinkValue, linkLevel)]);
	
	    // 连线的文字
	    lineText = container.append('g').selectAll('.linetext')
	        .data(force.links())
	        .enter()
	        .append('text')
	        .style('font-size', lineTextFontSize)   //连线文字大小
            .style('fill', 'red')					//连线文字颜色
	        .attr({
	            'class': 'linetext',
	            'dx': link => getLineTextDx(link),
	            'dy': 5
	        });
	
	    lineText.append('textPath')
            .attr('xlink:href', link => '#link-' + link.id)
	        .text(link => link.value);
	
	    // 节点（圆）
	    nodeCircle = container.append('g')
	        .selectAll('.node')
	        .data(force.nodes())
	        .enter()
	        .append('g')
	        .style('cursor', 'pointer')
	        .attr('class', 'node')
	        .attr('cx', node => node.x)
	        .attr('cy', node => node.y)
	        .call(drag); // 节点可拖动
	
	    nodeCircle.append('circle')
	        .style('fill', node=> nodeConf["backgroundColor"][getNodeLevel(node, minNodeValue, maxNodeValue, nodeLevel)]) //节点背景色
	        .style('stroke', node=> nodeConf["strokeColor"][getNodeLevel(node, minNodeValue, maxNodeValue, nodeLevel)])	//节点边框颜色
	        .style('stroke-width', 3)			//节点边框宽度
	        .attr('class', 'node-circle')
	        .attr('r', 56)						//节点圆半径
        //将鼠标移动事件添加到g标签上
        //5、878行将鼠标事件添加到g标签
        nodeCircle.on('mouseover', function (currNode) {
        	//6、880行添加条件
			//如果结点是隐藏的不触发鼠标移入事件
			if($(this).css('opacity') == 0) {
				return;
			}
            //鼠标移动到节点
            $(".gxt_tooltip").empty();
            $(".gxt_tooltip").append(currNode.name + (nodeData[currNode.name] ? '：' + nodeData[currNode.name] : ''));
            $(".gxt_tooltip").css({top:15+event.pageY,left:15+event.pageX});
            $(".gxt_tooltip").show();
            if (draging) {
                return;
            }
            toggleNode(nodeCircle, currNode, true);
            toggleLine(linkLine, currNode, true);
            toggleLineText(lineText, currNode, true);
        }).on('mousemove', function (currNode) {
        	//7、897行添加条件
            //如果结点是隐藏的不触发鼠标移入事件
            if($(this).css('opacity') == 0) {
                return;
            }
            //鼠标移动重新定位提示窗位置
            $(".gxt_tooltip").css({top:15+event.pageY,left:15+event.pageX});
        }).on('mouseout', function (currNode) {
        	//8、905行添加条件
            //如果结点是隐藏的不触发鼠标移入事件
            if($(this).css('opacity') == 0) {
                return;
            }
            //鼠标移出节点
            $(".gxt_tooltip").hide();
            if (draging) {
                return;
            }
            toggleNode(nodeCircle, currNode, false);
            toggleLine(linkLine, currNode, false);
            toggleLineText(lineText, currNode, false);
        })
	
	    // 节点文字
	    const nodeText = nodeCircle.append('text')
	        .attr('class', 'nodetext')
	        .style('font-size', nodeTextFontSize)
	        .style('font-weight', 400)
	        .style('fill', '#fff')
	        .attr('text-anchor', 'middle')
	        .attr('dy', '.35em')
	        .attr('title', function ({
	            name
	        }) {
	            return name;
	        })
	        .attr('x', function ({
	            name
	        }) {
	            return textBreaking(d3.select(this), name);
	        });
	
	    // 更新力导向图
	    function tick() {
	        // 节点位置
	        nodeCircle.attr('transform', node => 'translate(' + node.x + ',' + node.y + ')');
	        // 连线路径
	        linkLine.attr('d', link => genLinkPath(link));
	        // 连线文字位置
	        lineText.attr('dx', link => getLineTextDx(link));
	        // 连线文字角度 
	        lineText.attr('transform', function (link) {
	            return getLineTextAngle(link, this.getBBox());
	        });
	    }

	    // 更新力导向图
	    // 注意1：必须调用一次 tick （否则，节点会堆积在左上角）
	    // 注意2：调用位置必须在 nodeCircle, nodeText, linkLine, lineText 后
	    setTimeout(function() {
	        tick();
	    }, 10);
	
	    // 监听力学图运动事件，更新坐标
	    force.on('tick', tick);
	    force.on('end',function() {
	    	//渲染结束调用
	    	//设置偏移
	    	zoom.translate([width /2 - center_x, height /2 - center_y]);
	    	setTimeout(function() {
	    		$('#' + containerID).css('opacity',1);
	    	},1);
	    })
	
	}
	
	function genLinks(relations) {
	    const indexHash = {};
	    
	    return relations.map(function ({
	        source,
	        target,
	        value
	    }, i) {
	        const linkKey = source + '-' + target;
	        const count = linkMap[linkKey];
	        if (indexHash[linkKey]) {
	            indexHash[linkKey] -= 1;
	        } else {
	            indexHash[linkKey] = count - 1;
	        }
	        
	        return {
	            id : i,
	            source: nodesMap[source],
	            target: nodesMap[target],
	            value,
	            count: linkMap[linkKey],
	            index: indexHash[linkKey]
	        }
	    })
	}
	
	function genLinkMap(relations) {
	    const hash = {};
	    relations.map(function ({
	        source,
	        target,
	        value
	    }) {
	        const key = source + '-' + target;
	        if (hash[key]) {
	            hash[key] += 1;
	            hash[key + '-label'] += '、' + value;
	        } else {
	            hash[key] = 1;
	            hash[key + '-label'] = value;
	        }
	    });
	    return hash;
	}

    function genNodesMap(nodes) {
        const hash = {};
        for(var i = 0,j = nodes.length; i < j; i ++) {
            item = nodes[i];
            hash[item] = {"name":item,"id":i};
        }
        return hash;
    }

	// 生成关系连线路径
	function genLinkPath(link) {
	
	    let sx = link.source.x;
	    let tx = link.target.x;
	    let sy = link.source.y;
	    let ty = link.target.y;
	    
	    return 'M' + sx + ',' + sy + ' L' + tx + ',' + ty;
	}

	function zoomFn() {
	    const {
	        translate,
	        scale
	    } = d3.event;
	    container.attr('transform', 'translate(' + translate + ')scale(' + scale * initScale + ')');
	}
	
	function dragstartFn(d) {
	    draging = true;
	    d3.event.sourceEvent.stopPropagation();
	    force.start();
	}
	
	function dragFn(d) {
	    draging = true;
	    d3.select(this)
	        .attr('cx', d.x = d3.event.x)
	        .attr('cy', d.y = d3.event.y);
	}
	
	function dragendFn(d) {
	    draging = false;
	    force.stop();  
	}
	
	function isLinkLine(node, link) {
	    return link.source.name == node.name || link.target.name == node.name;
	}
	
	function isLinkNode(currNode, node) {
	    if (currNode.name === node.name) {
	        return true;
	    }
	    return linkMap[currNode.name + '-' + node.name] || linkMap[node.name + '-' + currNode.name];
	}


	/**
	 * 节点文字布局
	 */
	function textBreaking(d3text, text) {
	    text += '';
	    const len = text.length;
	    if (len <= 4) {
	        d3text.append('tspan')
	            .attr('x', 0)
	            .attr('y', 2)
	            .text(text);
	    } else {
	        const topText = text.substring(0, 4);
	        const midText = text.substring(4, 9);
	        let botText = text.substring(9, len);
	        let topY = -22;
	        let midY = 8;
	        let botY = 34;
	        if (len <= 10) {
	            topY += 10;
	            midY += 10;
	        } else {
	            botText = text.substring(9, 11) + '...';
	        }
	
	        d3text.text('');
	        d3text.append('tspan')
	            .attr('x', 0)
	            .attr('y', topY)
	            .text(function () {
	                return topText;
	            });
	        d3text.append('tspan')
	            .attr('x', 0)
	            .attr('y', midY)
	            .text(function () {
	                return midText;
	            });
	        d3text.append('tspan')
	            .attr('x', 0)
	            .attr('y', botY)
	            .text(function () {
	                return botText;
	            });
	    }
	}

    /**
     * 获取连接线上的文字在连接线的位置
     * @param link 连接线
     * @returns {number}
     */
	function getLineTextDx(link) {
	    const sr = 56;
	    const sx = link.source.x;
	    const sy = link.source.y;
	    const tx = link.target.x;
	    const ty = link.target.y;
	
	    const distance = Math.sqrt(Math.pow(tx - sx, 2) + Math.pow(ty - sy, 2));
	
	    var text = link.value + '';
	    const textLength = text.length;
	    const deviation = 8; // 调整误差
	    const dx = (distance - sr - textLength * lineTextFontSize) / 2 + deviation;
	
	    return dx;
	}

	function getLineTextAngle(d, bbox) {
	    if (d.target.x < d.source.x) {
	        const {
	            x,
	            y,
	            width,
	            height
	        } = bbox;
	        const rx = x + width / 2;
	        const ry = y + height / 2;
	        return 'rotate(180 ' + rx + ' ' + ry + ')';
	    } else {
	        return 'rotate(0)';
	    }
	}
	
	function toggleNode(nodeCircle, currNode, isHover) {
		//创建满足过滤条件的结点数组和线数组
        var filterNode = [], filterLine = [];
        //获取值范围
        var startNum = $("#minRelationNum").val();
        var endNum = $("#maxRelationNum").val();
        //获取满足条件的线和结点
        linkLine.filter(function (link) {
            if(link.value >= startNum && link.value <= endNum) {
                filterLine.push(link.id);
                filterNode.push(link.target.id);
                filterNode.push(link.source.id);
            }
        })
		
	   if (isHover) {
            //鼠标移入触发
            nodeCircle
                .style('opacity', function (node) {
                    //如果在满足过滤条件的数组内透明度设置为0.1，否则设置为隐藏
					if(filterNode.indexOf(node.id) != -1) {
					    return 0.1;
					} else {
					    return 0;
					}
                })
                .filter(function (node){
                    if($(this).css('opacity') == 0) {
                        //结点本身是隐藏的，不进行下面的设置，保持隐藏
                        return false;
					} else {
                       if(isLinkNode(currNode, node)) {
                           //如果和鼠标移入的结点在一条线上面
						   //判断线的值，满足过滤条件返回true，进行下面的属性设置，不满足过滤条件返回false，不继续执行
                           if(linkMap[currNode.name + '-' + node.name + '-label']) {
                              if(linkMap[currNode.name + '-' + node.name + '-label'] >= startNum && linkMap[currNode.name + '-' + node.name + '-label'] < endNum) {
                                  return true;
							  } else {
                                  return false;
							  }
						   } else if(linkMap[node.name + '-' + currNode.name + '-label']) {
                               if(linkMap[node.name + '-' + currNode.name + '-label'] >= startNum && linkMap[node.name + '-' + currNode.name + '-label'] < endNum) {
                                   return true;
                               } else {
                                   return false;
                               }
                           }
                           return true;
					   } else {
                           //和鼠标移入的结点没有关系，直接返回false
                           return false;
					   }
					}

                }).style('opacity', 1);
        } else {
            //鼠标移出触发
            nodeCircle.style('opacity', function (node) {
                //判断结点是否在满足过滤条件的结点数组内，满足设置透明度为1，不满足隐藏
                if(filterNode.indexOf(node.id) != -1) {
                    return 1;
                } else {
                    return 0;
                }
            });
        }
	
	}
	
	function toggleLine(linkLine, currNode, isHover) {
		
		//创建满足过滤条件的线数组
        var filterLink = [];
        //获取值范围
        var startNum = $("#minRelationNum").val();
        var endNum = $("#maxRelationNum").val();
        //获取满足条件的线
        linkLine.filter(function (link) {
            if(link.value >= startNum && link.value <= endNum) {
                filterLink.push(link.id);
            }
        })
		
	    if (isHover) {
            // 鼠标移入触发
            linkLine
                .style('opacity', function (link) {
                    //连线满足过滤条件，透明度设置为0.1，否则隐藏连接线
                    if(filterLink.indexOf(link.id) != -1) {
                        return 0.1;
                    } else {
                        return 0;
                    }
                })
                .filter(function (link) {
					if($(this).css('opacity') == 0) {
					    //连接线是隐藏的，返回false，不进行属性设置
					    return false;
					} else {
                       if(isLinkLine(currNode, link)) {
                           //是和鼠标移入的结点关联的线，返回true，设置透明度为1
                           return true;
					   } else {
                           //是和鼠标移入的结点关联的线，返回false，不进行属性设置，透明度保持为0.1
                           return false;
					   }
					}
                })
                .style('opacity', 1)
                .classed('link-active', true);
        } else {
            // 鼠标移出连线恢复样式
            linkLine
                .style('opacity', function (link) {
                    ////连线满足过滤条件，透明度设置为1，否则隐藏连接线
                    if(filterLink.indexOf(link.id) != -1) {
                        return 1;
                    } else {
                        return 0;
                    }
                })
                .classed('link-active', false);
        }
	}
	
	function toggleLineText(lineText, currNode, isHover) {
        //创建满足过滤条件的线数组
        var filterLink = [];
        //获取值范围
        var startNum = $("#minRelationNum").val();
        var endNum = $("#maxRelationNum").val();
        //获取满足条件的线
        linkLine.filter(function (link) {
            if(link.value >= startNum && link.value <= endNum) {
                filterLink.push(link.id);
            }
        })
        if (isHover) {
            // 鼠标移入只显示相连连线文字
            lineText
                .style('fill-opacity',function(link) {
                    if(filterLink.indexOf(link.id) != -1) {
                        //文字在满足过滤条件的线上
                        //文字在和鼠标移入的结点相关联的线上，透明度设置为1，否则隐藏
                        if(isLinkLine(currNode, link)) {
                            return 1.0;
						} else {
                            return 0;
						}
					} else {
                        //文字不在满足过滤条件的线上，隐藏
                        return 0;
					}
				})
        } else {
            // 鼠标移出显示所有连线文字
            lineText
                .style('fill-opacity', function (link) {
                    //文字是否在满足过滤条件的线上，在的话设置透明度为1，否则隐藏
                    if(filterLink.indexOf(link.id) != -1) {
						return 1.0;
                    } else {
                        return 0;
                    }
                });
        }
	}

    /**
     * 获取节点的等级
     * @param node  节点
     * @param min   节点值的最小值
     * @param max	 节点值的最大值
     * @param sectionNum  节点值分几个区间
     * @returns {number}
     */
	function getNodeLevel(node, min, max, sectionNum) {
	    var temp = max - min;
		var level = nodeData[node.name] ? Math.floor((parseInt(nodeData[node.name]) * sectionNum - min * sectionNum)  / temp) + (parseInt(nodeData[node.name]) == max ? 0 : 1): 1;
        console.log("node level :  " + level);
		return level;
    }

    /**
	 * 获取连接线的等级
     * @param link  连接线
     * @param min   连接线值的最小值
     * @param max	 连接线值的最大值
     * @param sectionNum  连接线值分几个区间
     * @returns {number}
     */
    function getLinkLevel(link,min, max, sectionNum) {
        var temp = max - min;
	    var level = Math.floor((link.value * sectionNum - min * sectionNum) / temp) + (link.value == max ? 0 : 1);
	    console.log("link level :  " + link.value + "--" + level);
		return level;
    }

    function centerNode(zoom) {
        var scale = zoom.scale();
        x = width / 2;
        y = height / 2;
        d3.select('g').transition()
            .duration(0.3)
            .attr("transform", "translate(" + x + "," + y + ")scale(" + scale + ")");
        zoom.scale(scale);
        zoom.translate([x, y]);
    }
    
    //3、1361行添加点击事件
	//行添加点击事件
	$(".filterBtn").on("click",function () {
	    filterData();
	})
	
	//4、1365行添加过滤方法
	//添加过滤方法
	function filterData() {
		//创建满足过滤条件的结点和线数组
		var filterNode = [], filterLink = [];
		//获取值范围
		var startNum = $("#minRelationNum").val();
		var endNum = $("#maxRelationNum").val();
		//获取满足条件的线和结点
		linkLine.filter(function (link) {
			if(link.value >= startNum && link.value <= endNum) {
				filterLink.push(link.id);
				filterNode.push(link.target.id);
				filterNode.push(link.source.id);
			}
		})
		nodeCircle.style('opacity', function (node) {
			//如果结点满足过滤条件，设置透明度为1，否则隐藏
			if(filterNode.indexOf(node.id) != -1) {
				return 1;
			} else {
				return 0;
			}
		});

		linkLine.style('opacity', function (link) {
			//如果连线满足过滤条件，设置透明度为1，否则隐藏
			if(filterLink.indexOf(link.id) != -1) {
				return 1;
			} else {
				return 0;
			}
		}).classed('link-active', false);

		lineText.style('fill-opacity', function (link) {
			//如果文字所在的线满足过滤条件，设置透明度为1，否则隐藏
			if(filterLink.indexOf(link.id) != -1) {
				return 1.0;
			} else {
				return 0;
			}
		});
	}
}

