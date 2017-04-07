$(function(){
	addActive_claimApplication();
	scrollToBottom();
	showClaimApplication();
	ensureReal();
	claimReset();
	validateClaimApplicationForm();
});


function addActive_claimApplication(){
	$(".collapse ul li a[href='claimApplication.jsp']").parent().addClass("active");
}

//将须知拖到底部才能进行下一步操作
function scrollToBottom(){
	$("#style-scrollbar").scroll(function(){
		if($(this).scrollTop()>=1000){
			$('#btn_AlreadyRead').removeAttr("disabled"); 
		}
	});
}

//隐藏须知,显示理赔申请表 
function showClaimApplication(){
	$('#btn_AlreadyRead').click(function(){
		$("#announcements").fadeOut();
		$("#div_ClaimApplication").fadeIn();
	});
}

//只有确认所填为属实(checkbox勾选)才能提交表单
function ensureReal(){
	$("#ensureReal").click(function(){
		if($(this).is(':checked')){
			$("#claimSubmit").removeAttr("disabled");
		}
		else{
			$("#claimSubmit").attr("disabled","disabled");
		}
	});
}

//重置表单
function claimReset(){
	$("#claimReset").click(function(){
		$("form")[0].reset();//jquery并没有重置表单的方法,只能使用dom
	});
}

//对表单填写内容进行初步校验
function validateClaimApplicationForm(){
          $("#claimApplicationForm").validate({
        	 rules:{
        		 caseid:{
        			 required:true,
        		 },
        		 a1id:{
        			 required:true,
        		 },
        		 a2id:{
        			 required:true,
        		 },
        		 plateNumber:{
        			 required:true
        		 }
        	 },
        	 messages:{
        		 caseid:{
        			 required:"",
        		 },
        		 a1id:{
        			 required:"",
        		 },
        		 a2id:{
        			 required:"",
        		 },
        		 plateNumber:{
        			 required:""
        		 }
        	 },
        errorPlacement:function(error,element){  //决定错误信息要放在哪里的方法，error是label对象，element是当前验证的输入框对象
            error.addClass('glyphicon glyphicon-remove');
            $(".form-group-inline").children().eq(2).html();
            //element.siblings("div").eq(1).empty().html(error);
            error.appendTo(element.siblings("div").eq(1));
         },
        	 submitHandler:function(){
        	 $.ajax({
        			url:"/pocForUser/insertClaim",
        			type:"POST",
        			data:$("#claimApplicationForm").serialize(),
        			success:function(){
        				alert(1);
        			},
        			error:function(data,XMLHttpRequest, textStatus, errorThrown){
        				alert("服务器异常请稍后再试");
        			}
        			
        		 });
          }
});
}

