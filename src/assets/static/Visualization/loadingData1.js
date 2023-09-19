function startLoad(){
	$('body').loading({
		loadingWidth:240,
		name:'lay',
		discription:'',
		direction:'column',
		type:'origin',
		originDivWidth:40,
		originDivHeight:40,
		originWidth:6,
		originHeight:6,
		smallLoading:false,
		loadingBg:'rgba(0,0,0,0.5)',
		loadingMaskBg:'rgba(0,0,0,0.2)'
	});
}
function endLoad(){
	removeLoading('lay');
}