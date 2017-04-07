$(function(){
	getLoginedUserId();
	addActive_index();
});

function getLoginedUserId(){
	var loginedUserId = $.cookie("loginedUserId");
	if(loginedUserId==null){
		location.href = "../../pocForUser/pages/login.jsp";
	}else{
		showAllPolicyByUserId(loginedUserId);
	}
}	
	//显示该用户名下的所有车辆的保单
var showAllPolicyByUserId =function(loginedUserId){
		$.ajax({
			url:"/pocForUser/showAllPolicyByUserId",
			type:"POST",
			dataType:"json",
			data:{
				uid:loginedUserId,
			},
			success:function(data){
				if(data!=""){
				var tableInfo ="";
				var i=1;
				$.each(data,function(i,policy){
					i++;
					tableInfo +="<tr><td>" +i+"</td>"+
					"<td>"+policy['poid'] +"</td>"+
					"<td>"+policy['policyType'] +"</td>"+
					"<td>"+policy['recognizee'] +"</td>"+
					"<td>"+policy['plateNumber'] +"</td>"+
					"<td>"+policy['sum'] +"</td>"+
					"<td>"+policy['startTime'] +"</td>"+
					"<td>"+policy['endTime'] +"</td></tr>";
				});
				$("#hiddenresult").html(tableInfo);
				$("#Pagination").pagination(data.length, {
					prev_text: "« 上一页",
	                next_text: "下一页 »",
					num_edge_entries: 1, //边缘页数
					num_display_entries: 4, //主体页数
					callback: pageselectCallback,
					items_per_page:10,//每页显示10项
				});
               //$("#tbody_showAllPolicyByUser").html(tableInfo);	
				};
			},
			error:function(data,XMLHttpRequest, textStatus, errorThrow){
					alert("服务器index未响应,请重新操作");
		    },
		});
	};
	
//当搜索条件改变时改变时	
	$(function(){
	$("#searchCondition").change(function(){
		alert($(this).val());
		if($(this).val()=="poid"){
			$("#searchContent").show();
		}
        if($(this).val()=="policyType"){
			
		}
        if($(this).val()=="recognizee"){
        	$("#searchContent").show();
        }
        if($(this).val()=="plateNumber"){
        	$("#searchContent").show();
        }
        if($(this).val()=="sum"){
	      
        }
        if($(this).val()=="valid"){
        	
        }
        if($(this).val()=="invalid"){
        	
        }
	});
});
	//分页callback函数
	var pageselectCallback =function(page_index, jq){
		var new_content = "";
		for(var i=(page_index*10);i>=(page_index*10)&&i<(page_index+1)*10;i++){
			new_content+="<tr>"+$("#hiddenresult tr:eq("+i+")").html()+"</tr>";
		}
		$("#tbody_showAllPolicyByUser").empty().html(new_content); //装载对应分页的内容
		return false;
	};
	
	function addActive_index(){
		$(".collapse ul li a[href='showPolicy.jsp']").parent().addClass("active");
	}
	