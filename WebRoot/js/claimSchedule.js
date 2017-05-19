$(function(){
	addActive_index();
	claimSchedule();
	$("#btn_Search").click(function(){
		searchClaimSchedule();
	});
});

function addActive_index(){
		$(".collapse ul li a[href='claimSchedule.jsp']").parent().addClass("active");
}

var claimSchedule =function(){
	$.ajax({
		url:"/pocForUser/showClaims",
		type:"POST",
		dataType:"json",
		success:function(data){
			if(data!=""){
			var tableInfo ="";
			var i=1;
			$.each(data,function(i,claim){
				i++;
				tableInfo +="<tr><td>" +i+"</td>"+
				"<td>"+claim['caseid'] +"</td>"+
				"<td>"+claim['plateNumber'] +"</td>"+
				"<td>"+"¥"+claim['assess']['sum'] +"</td>"+
				"<td>"+claim['claimTime'] +"</td>"+
				"<td>"+claim['status'] +"</td>"+
				"<td><a href='#' onclick='showClaim(this);' abc='"+claim['caseid']+"'>详 情</a></td></tr>";
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
	$("#tbody_claimSchedule").empty().html(new_content); //装载对应分页的内容
	return false;
};

var searchClaimSchedule = function(){
	var searchCondition = $("#searchCondition").val().trim();
	var searchContent = $("#searchContent").val().trim();
	if(searchContent==""||searchContent==null){
		claimSchedule();
	}
	else{
	$.ajax({
		url:"/pocForUser/showClaims",
		type:"POST",
		data:searchCondition+"="+searchContent,
		dataType:"json",
		success:function(data){
			if(data == ""){
				 $("#tbody_claimSchedule").empty()
			}
			else if(data!=""){
			var tableInfo ="";
			var i=1;
			$.each(data,function(i,claim){
				i++;
				tableInfo +="<tr><td>" +i+"</td>"+
				"<td>"+claim['caseid'] +"</td>"+
				"<td>"+claim['plateNumber'] +"</td>"+
				"<td>"+"¥"+claim['assess']['sum'] +"</td>"+
				"<td>"+claim['claimTime'] +"</td>"+
				"<td>"+claim['status'] +"</td>"+
				"<td><a href='#' onclick='showClaim(this);' abc='"+claim['caseid']+"'>详 情</a></td></tr>";
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

var showClaim =function(a){
	var target = $(a).attr("abc");
	$.ajax({
		url:"/pocForUser/showClaims",
		type:"POST",
		data:{
			caseid:target
		},
		dataType:"json",
		success:function(data){
			if(data!=""){
				var obj = data[0];
				$("#caseid").html(obj.caseid);
				$("#a1id").html(obj.a1id);
				$("#a2id").html(obj.a2id);
				$("#recognizee").html(obj.applyUser);
				$("#casePlace").html(obj.casePlace);
				$("#caseTime").html(obj.caseTime);
				$("#claimTime").html(obj.claimTime);
				$("#driver").html(obj.driver);
				$("#driverMobile").html(obj.driverMobile);
				$("#reportPerson").html(obj.reportPerson);
				$("#reportPersonMobile").html(obj.reportPersonMobile);
				$("#plateNumber").html(obj.plateNumber);
				$("#reportTime").html(obj.reportTime);
				$("#caseDescribe").html(obj.caseDescribe);
			$("#dialog").dialog(); 
			};
		},
		error:function(data,XMLHttpRequest, textStatus, errorThrow){
				alert("服务器index未响应,请重新操作");
	    },
	});
};


