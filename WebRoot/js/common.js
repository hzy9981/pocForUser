window.onload=function(){
	common_getLoginedUserId();
};

//判断是否有登陆的cookie,有的话就正常运行,没有的话就跳转至登录界面
function common_getLoginedUserId(){
	var loginedUserId = $.cookie("loginedUserId");
	if(loginedUserId==null){
		location.href = "../../pocForUser/pages/login.jsp";
	}else{
		$("#loginedUserId").html(" "+$.cookie("loginedUserId")+" ");
	}
} 