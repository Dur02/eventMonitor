(function($){  
	$.PKG={
//		BaseUrl:"http://192.168.1.126:8080/monitorsystem/",
//		BaseUrl:"http://111.205.121.93:9001/monitorsystem/",
		BaseUrl:"http://172.16.40.24:8080/monitorsystem/",
//		BaseUrl:"http://202.108.211.71:50013/monitorsystem/",
		Get:function(data,url,callback){
			var options={};
			if(data){
				$.extend(options, data);
			}
			$.PKG.ajax("get",options,url,callback);
		},
		Get2:function(data,url,callback){
			var options={};
			if(data){
				$.extend(options, data);
			}
			$.PKG.ajax2("get",options,url,callback);
		},
		GetJSON:function(data,url,callback){
			var options={};
			if(data){
				$.extend(options, data);
			}
			$.PKG.ajaxJson("get",options,url,callback);
		},
		ajaxJson:function(type,data,url,callback){
			$.ajax({ 
			  url:url,
			  data:data,
			  type:"get",
			  dataType: "json",
			  timeout:3000,
			  success: function(data){
                callback(data);
              },
              error:function(){
              	callback("1111");
              }
			});
		},
		Post:function(data,url,callback){
			var options={};
			if(data){
				$.extend(options, data);
			}
			$.PKG.ajax("post",options,url,callback);
		},
		Post2:function(data,url,callback){
			var options={};
			if(data){
				$.extend(options, data);
			}
			$.PKG.ajax2("post",options,url,callback);
		},
		ajax:function(type,data,url,callback){
			$.ajax({
			  url: $.PKG.BaseUrl+url,
			  data:data,
			  type:type,
			  dataType: "json",
			  contentType:"application/json",               
              data:JSON.stringify(data),
			  timeout:3000,
			  success: function(data){
                callback(data);
              },
              error:function(){
              	callback("服务器错误，请求失败！");
              }
			});
		},
		ajax2:function(type,data,url,callback){
			$.ajax({ 
			  url: url,
			  data:data,
			  async:false,
			  type:type,
			  dataType: "json",              
              data:data,
			  timeout:3000,
			  success: function(data){
                callback(data);
              },
              error:function(){
              	callback("服务器错误，请求失败！");
              }
			});
		}
	};
})(jQuery);   