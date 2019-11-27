function check_login(){
    var name=$("#user_name").val().trim();
    var pass=$("#password").val().trim();

    if(name=='' || pass==''){
        $("#login_form").removeClass('shake_effect');
        setTimeout(function()
        {
            $("#login_form").addClass('shake_effect')
        },1);
    }else {
        $.post('/admin/doLogin',{
            name:name,
            password:pass
        },function (data) {
            if(data>-1){
                $("#user_name").val("");
                $("#password").val("");
                $('#modalCss').remove();
                var css = new MODALit({
                    el: '#hiddenBtn',
                    width: 'large',
                    footer: false,
                    transition: 'zoom',
                    content:'<p style="text-align: center;font-size:40px;font-family:华文楷体;">登入成功请稍后<i class="fa fa-spinner fa-pulse"></i></p>',
                });
                css.modal.id = "modalCss";
                $('#hiddenBtn').click();
                setTimeout(function () {
                    window.location.href="/index.jsp";
                },2000);
            }else {
                $("#login_form").removeClass('shake_effect');
                setTimeout(function()
                {
                    $("#login_form").addClass('shake_effect')
                },1);
            }
        })
    }
}
function check_register(){
    var name = $("#r_user_name").val().trim();
    var pass = $("#r_password").val().trim();
    var phone = $("#r_phone").val().trim();
    var realName=$('#realname').val().trim();
    var sex=$('#sex').val().trim();
    var address=$('#address').val().trim();

    if(rCheckName() && rCheckPassword() && rCheckSex()
        && rCheckRealName() && rCheckPhone() && rCheckAddress()) {
        $.post("/admin/doRegister",{
            name:name,
            realname:realName,
            password:pass,
            sex:sex,
            address:address,
            phone:phone
        },function (data) {
            if(data>-1){
                $("#user_name").val("");
                $("#password").val("");
                setTimeout(function () {
                    window.location.href="/admin/index";
                },2000)
            }else {
                $("#login_form").removeClass('shake_effect');
                setTimeout(function()
                {
                    $("#login_form").addClass('shake_effect')
                },1);
            }
        })
    } else {
        $("#login_form").removeClass('shake_effect');
        setTimeout(function()
        {
            $("#login_form").addClass('shake_effect')
        },1);
    }
}


var rCheckAddress=function(){
    var address=$('#address').val().trim();
    if(address==undefined || address.length<1){
        return false;
    }else{
        return true;
    }
};


var rCheckPhone=function(){
    var phone = $("#r_phone").val().trim();
    if(phone==undefined || phone.length!=11 || isNaN(Number(phone))){
        return false;
    }else {
        return true;
    }
};

var rCheckRealName=function(){
    var realName=$('#realname').val().trim();
    if(realname==undefined || realname.length==0){
        return false;
    }else {
        return true;
    }
};

var rCheckSex=function(){
    var sex=$('#sex').val().trim();
    if(sex==undefined || (sex!="男" &&  sex!="女")){
        return false;
    }else {
        return true;
    }
};

var rCheckPassword=function(){
    var password = $("#r_password").val().trim();
    if(password==undefined || password.length<6 || password.length>28){
        return false;
    }else {
        return true;
    }
};

var rCheckName=function(){
    var name = $("#r_user_name").val().trim();
    if(name==undefined || name.length==0){
        return false;
    }else {
        return true;
    }
};
