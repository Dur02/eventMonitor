//document.write("<script src='../static/js/lib/JQueryPKG.js'></script>");
var Login={
	loginout:function(){
		/*$.PKG.Get(null, 'auth/doLoginout', function(){
			window.parent.location.href=$.PKG.BaseUrl;
		});*/
	},
	toUpdatePassword:function(){
		$(window.parent.frames["mainhtml"].document).find(".popup55").css({"display":"block"});
		$(window.parent.frames["mainhtml"].document).find("#userInfodiv").css({"display":"block"});
		var hgt = $(window.parent.frames["mainhtml"].document).height();
		$(window.parent.frames["mainhtml"].document).find(".maskLaye").css({"display":"block","height":hgt});
		$(window.parent.frames["mainhtml"].document).find(".upd_popup").css("display","block");
	}
		
}