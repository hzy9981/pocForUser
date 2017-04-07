<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
String base_Path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 公共css -->
<%@include file="common/commoncss.jsp"%>
<!-- 自定义css -->
<link href="<%=base_Path%>css/showPolicy.css" rel="stylesheet">
</head>
<body>
	<div id="wrapper">
<!-- 正文内容开始 -->
		<div id="page-wrapper">
			<div class="container-fluid">
			<div class="tableTool">
			<strong>保单展示 </strong>
			<div class="searchTool">
			<select id="searchCondition">
			<option value="poid">保单号</option>
			<option value="policyType">保单类型</option>
			<option value="recognizee">保险人</option>
			<option value="plateNumber">车牌号</option>
			<option value="sum">保单金额</option>
			<option value="valid">生效中</option>
			<option value="invalid">已失效</option>
			</select>
			<input id="searchContent" type="text" placeholder="请输入搜索的内容">
			<button id="btn_Search" class="red icon-search btn btn-primary">搜索</button>
			</div>
			</div>
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
						    <th>序号</th>
							<th>保单号</th>
							<th>保单类型</th>
							<th>保险人</th>
							<th>车牌号</th>
							<th>保单金额</th>
							<th>起始时间</th>
							<th>结束时间</th>
						</tr>
					</thead>
					<tbody id="tbody_showAllPolicyByUser">
						<tr><td class="noMessage"  colspan="8">没 有 任 何 信 息</td></tr>
					</tbody>
				</table>
				<div id="Pagination" class="pagination"></div>
				<div id="hiddenresult" style="display:none"></div>
			</div>
		</div>
		<!-- 正文内容结束 -->
		 <%@include file="common/common.jsp" %>	
	</div>
</body>
 <!-- 公共js -->
 <%@include file="common/commonjs.jsp"%>
<!--        Common js  -->
  <script src='../../pocForUser/js/common.js'></script>
 	<!-- 自定义js -->
 <script src='../../pocForUser/js/showPolicy.js'></script>
</html>