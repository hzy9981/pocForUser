$(function(){
	addActive_index();
	showAssess();
	$("#btn_Search").click(function(){
		searchAssess();
	});
});



function addActive_index(){
		$(".collapse ul li a[href='showAssess.jsp']").parent().addClass("active");
}

var showAssess =function(){
	$.ajax({
		url:"/pocForUser/showAssess",
		type:"POST",
		dataType:"json",
		success:function(data){
			if(data!=""){
			var tableInfo ="";
			var i=1;
			$.each(data,function(i,assess){
				i++;
				tableInfo +="<tr><td>" +i+"</td>"+
				"<td>"+assess['asid'] +"</td>"+
				"<td>"+assess['caseid'] +"</td>"+
				"<td>"+assess['plateNumber'] +"</td>"+
				"<td>"+"¥"+assess['sum'] +"</td>"+
				"<td>"+assess['assessor'] +"</td>"+
				"<td>"+assess['assessTime'] +"</td>"+
				"<td><a href='#' onclick='showDialog(this);' abc='"+assess['asid']+"'>详 情</a></td></tr>";
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

var pageselectCallback =function(page_index, jq){
	var new_content = "";
	for(var i=(page_index*10);i>=(page_index*10)&&i<(page_index+1)*10;i++){
		new_content+="<tr>"+$("#hiddenresult tr:eq("+i+")").html()+"</tr>";
	}
	$("#tbody_showAssess").empty().html(new_content); //装载对应分页的内容
	return false;
};

var searchAssess = function(){
	var searchCondition = $("#searchCondition").val().trim();
	var searchContent = $("#searchContent").val().trim();
	if(searchContent==""||searchContent==null){
	showAssess();
	}
	else{
	$.ajax({
		url:"/pocForUser/showAssess",
		type:"POST",
		data:searchCondition+"="+searchContent,
		dataType:"json",
		success:function(data){
			if(data == ""){
				 $("#tbody_showAssess").empty()
			}
			else if(data!=""){
			var tableInfo ="";
			var i=1;
			$.each(data,function(i,assess){
				i++;
				tableInfo +="<tr><td>" +i+"</td>"+
				"<td>"+assess['asid'] +"</td>"+
				"<td>"+assess['caseid'] +"</td>"+
				"<td>"+assess['plateNumber'] +"</td>"+
				"<td>"+"¥"+assess['sum'] +"</td>"+
				"<td>"+assess['assessor'] +"</td>"+
				"<td>"+assess['assessTime'] +"</td>"+
				"<td><a href='#' onclick='showDialog(this);' abc='"+assess['asid']+"'>详 情</a></td></tr>";
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
	}
}

var showDialog = function(a){
	var target = $(a).attr("abc");
	$.ajax({
		url:"/pocForUser/showAssess",
		type:"POST",
		data:{
			asid:target
		},
		dataType:"json",
		success:function(data){
			if(data!=""){
				var obj = data[0];
				$("#plateNumber").html(obj.plateNumber);
				$("#applyUserPhone").html(obj.applyUserPhone);
				$("#applyUser").html(obj.applyUser);
				$("#sum").html(obj.sum);
				$("#describe").html(obj.describe);
				$("#dialog").dialog(); 
			}
		},
		error:function(data,XMLHttpRequest, textStatus, errorThrow){
			alert("服务器index未响应,请重新操作");
    },
	})
}