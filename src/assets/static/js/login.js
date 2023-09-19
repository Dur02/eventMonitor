function getBasePath() {
    var obj = window.location;
    var contextPath = obj.pathname.split("/")[1];
    var basePath = obj.protocol + "//" + obj.host + "/" + contextPath;
    return basePath;
}

var Login = {
    login: function () {
        var dt = {
            loginname: $('#usr').val(),
            password: $('#pwd').val()
        };
        /*$.PKG.Post(dt, 'login/doLogin', function(data){
            if(data.code == 1){
                window.location.href=$.PKG.BaseUrl + "main/toShow";
            }else{
                alert('用户名或密码错误，请重新登录!!');
            }
        });*/
        $.ajax({
            url: getBasePath() + '/login/doLogin',
            type: 'POST',
            data: dt,
            dataType: "json",
            success: function (data) {
                if (data.code == 1) {
                    window.location.href = getBasePath() + "/main/toShow";
                } else {
                    win.alertEx('用户名或密码错误，请重新输入');
                }
            }
        });

    }

}
