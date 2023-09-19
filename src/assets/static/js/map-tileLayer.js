//共有五种样式：其中两种默认样式：OSMCarto,OSMBright；三种可视化样式：OSMDark,OSMLight,OSMWhite 

//获取高亮地图
function getLighLayer(){
	var lightLayer = new L.tileLayer('http://111.205.121.86:8086/OSMLight/{z}/{x}/{y}.png', {zIndex: 5,minZoom:2});
	return lightLayer;
}
//高对比地图
function getOSMWhiteLayer(){
	var OSMWhiteLayer = new L.tileLayer('http://111.205.121.86:8086/OSMWhite/{z}/{x}/{y}.png', {zIndex: 5,minZoom:2});
	return OSMWhiteLayer;
	L.tileLayer.china
}
//获取高黑地图
function getDarkLayer(){
	var darkLayer = new L.tileLayer('http://111.205.121.86:8086/OSMDark/{z}/{x}/{y}.png',{minZoom:2});
	return darkLayer;
}

function getOSMCartoLayer(){
	var oSMCartoLayer = new L.tileLayer('http://111.205.121.86:8086/OSMCarto/{z}/{x}/{y}.png',{minZoom:2});
	return oSMCartoLayer;
}

function getOSMBrightLayer(){
	// var oSMBrightLayer = new L.tileLayer('http://111.205.121.86:8086/OSMBright/{z}/{x}/{y}.png',{minZoom:2});
	var oSMBrightLayer = new L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png',{minZoom:2});
	return oSMBrightLayer;
}
