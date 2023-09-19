var win = new function () {
    // 确认框和提示框宽度
    this.width = 280;

    // 确认框和提示框高度
    this.height = 150;

    // 手动关闭窗体
    this.close = function () {
        $('.win iframe').remove();
        $('.win').remove();
    };

    // 打开窗体
    /*this.open = function (width, height, title, url, closed) {
        this._close = function () {
            this.close();
            if ($.isFunction(closed)) closed();
        };
        var html = '<div class="win"><div class="mask-layer"></div><div class="window-panel"><iframe class="title-panel" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe><div class="title"><h3></h3></div><iframe class="body-panel" frameborder="0" marginheight="0" marginwidth="0" scrolling="auto" src=""></iframe></div></div>';
        var jq = $(html);
        jq.find(".window-panel").height(height).width(width).css("margin-left", -width / 2).css("margin-top", -height / 2);
        jq.find(".title").find(":header").html(title);
        jq.find(".body-panel").height(height - 36).attr("src", url);
        jq.appendTo('body').fadeIn();
        $(".win .window-panel").focus();
    };*/

    // 显示消息框
    function messageBox(html, title, message) {
        win.close();
        var jq = $(html);

        jq.find(".window-panel").height(win.height).width(win.width).css("margin-left", -win.width / 2).css("margin-top", -win.height / 2);
        jq.find(".title-panel").height(win.height);
        jq.find(".title").find(":header").html(title);
        jq.find(".body-panel").height(win.height - 36);
        jq.find(".content").html(message.replace('\r\n', '<br/>'));
        jq.appendTo('body').show();
        $(".win .w-btn:first").focus();
    }

    // 确认框
    this.confirm = function (title, message, selected) {
    	$("html,body").css({'overflow':'hidden'});//打开时隐藏滚动条
        this._close = function (r) {
            this.close();
            $("html,body").css({'overflow':'visible'});//关闭时显示滚动条
            if ($.isFunction(selected)) selected(r);
        };
        var html = '<div class="win">'
	        			+'<div class="mask-layer"></div>'
	        			+'<div class="window-panel">'
	        				+'<iframe class="title-panel" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>'
	        				+'<div class="title">'
	        					+'<h3></h3>'
	        				+'</div>'
	        				+'<div class="body-panel">'
	        					+'<p class="content"></p>'
	        					+'<p class="btns">'
				        			+'<button class="w-btn" tabindex="1" onclick="win._close(true);">确定</button>'
				        			+'<button class="w-btn" onclick="win._close(false);">取消</button>'
				        		+'</p>'
				        	+'</div>'
	        			+'</div>'
        			+'</div>';
        messageBox(html, title, message);
    };

    // 提示框
    this.alert = function (title, message, closed) {
    	
    	$("html,body").css({'overflow':'hidden'});//打开时隐藏滚动条
        this._close = function () {
        	$("html,body").css({'overflow':'visible'});//关闭时显示滚动条
            if ($.isFunction(closed)) {
            	this.close();
            	closed();
            }else{
            	this.close();
            };
        };

        var html = '<div class="win">'
        				+'<div class="mask-layer"></div>'
        					+'<div class="window-panel">'
        					+'<iframe class="title-panel" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>'
        					+'<div class="title">'
        						+'<h3></h3>'
        						+'</div>'
        						+'<div class="body-panel">'
        							+'<p class="content"></p>'
        							+'<p class="btns">'
        								+'<button class="w-btn" tabindex="1" onclick="win._close();">确定</button>'
        							+'</p>'
        						+'</div>'
        					+'</div>'
        				+'</div>';
        messageBox(html, title, message);
    }

    // 提示框
    this.alertEx = function (message) {
        this.alert('系统提示', message);
    }
    
};

//弹出框
/*window.alert = function(str){ 
	win.alert("系统提示",str,false);
}*/

