"use strict"
//tap menu show and hide
    var menu=new Menu();
    $(".l-menu-box .menu-title").bind("click",function (){
        menu.isHide.call(this)
    });
    //click menu
    $(".l-menu-box .menu-items li").bind("click",function (){
        menu.addBackground.call(this)
    });
    //shrinkageBar button
    $(".l-menu-box .shrinkageBar").bind("click",function (){
        menu.shrinkageBar.call(this)
    });
//    mouseover and mouseout right info show
    $(".l-menu-box .menu-title,.l-menu-box .menu-items li").hover(function (e){
        menu.rightInfo.call(this)
    },function (){
    	menu.removeELE.call(this)
    });
    //点击只有一级菜单，没有子菜单
    $(".menu-title-index").bind("click",function (){
    	$(".menu-title-index").removeClass("two_li_active active");
        $(this).addClass("two_li_active active");
        $(".l-menu-box .menu-items li").removeClass("two_li_active active");
        $(".l-menu-box .menu-items").hide()
    })

    function Menu(){
        this.display;
        this.zh=false;
        this.shrinkageBarW=$(".shrinkageBar").height();
        this.menuTitleLen=$(".l-menu-box .menu-title").length;
        this.menuTitle=$(".l-menu-box .menu-title").height()*this.menuTitleLen;
        this.lMenuBox=$(".l-menu-box").height();
        this.isHide=function (){
            var This=menu;
            This.display=$(this).next(".menu-items").css("display");
            This.lMenuBox=$(".l-menu-box").height();
            var currentUiH=$(this).next(".menu-items").height();
            $(".triangle-down").css("transform","rotate(0deg)");
            $(".menu-items li").removeClass("two_li_active active")
            if(This.display=="none"){
            	$(this).children(".triangle-down").css("transform","rotate(90deg)");
           }else{
        	   $(this).children(".triangle-down").css("transform","rotate(0deg)");
        	   $(this).next(".menu-items").hide(0);
        	   return false;
           }
            if((This.shrinkageBarW+This.menuTitle+currentUiH)>=This.lMenuBox){
                $(this).next(".menu-items").height(This.lMenuBox-This.menuTitle-This.shrinkageBarW);
            }else{
                $(this).next(".menu-items").css("height","auto")
            }
            $(this).next(".menu-items").stop().slideToggle().siblings(".menu-items").hide();
        };
        this.addBackground=function (){
        	$(".menu-title-index").removeClass("two_li_active active");
        	$(this).addClass("two_li_active active").siblings().removeClass("two_li_active active");
            /*$(this).addClass("active").siblings().removeClass("active");*/
        };
        this.shrinkageBar=function (){
            this.zh=!this.zh;
            if(this.zh){
                $(".l-menu-box").width(50);
                window.parent.left.cols = "50,*";
                $(this).children("span").css({"display":"block","transform":"rotate(90deg)"})
            }else{
                $(".l-menu-box").width(180);
                window.parent.left.cols = "180,*";
                $(this).children("span").css({"display":"block","transform":"rotate(180deg)"})
            }
        };
        this.rightInfo=function (){
            var lMenuBox= $(".l-menu-box").width();
            if(lMenuBox==50){
            	var disY=$(this).offset().top;
                var text=$(this).text();
                self.parent.frames["mainhtml"].addEle(disY,text);
            }
        }
        this.removeELE=function (){
        	var lMenuBox= $(".l-menu-box").width();
        	if(lMenuBox==50){
        		self.parent.frames["mainhtml"].removeEle();
        	}
        }
    }

	


