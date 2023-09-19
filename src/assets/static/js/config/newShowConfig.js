function updateConfigNew(ll){
	for(var i=0;i<ll;i++){
		for(var j=1;j<24;j++){
			var id = i+"newJJ"+j;
			var jj = $("."+id+"").html();
			if(jj!=undefined){
				var kk = jj.substring(0,jj.indexOf("&"));
				$("."+id+"").html(kk);
				$("."+id+"").attr("title",kk);
			}
		}
	}
	for(var j=0;j<ll;j++){
		for(var i=1;i<5;i++){
			var id = j+"newNUM"+i;
			var jj = $("."+id+"").html();
			$("."+id+"").html("");
			$("."+id+"").html(jj);
		}
	}
}