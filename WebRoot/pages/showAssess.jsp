<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 <!-- 公共css -->
<%@include file="common/commoncss.jsp"%>
<!-- 自定义css -->
<link href="../../pocForUser/css/showAssess.css" rel="stylesheet">

  </head>
  
  <body>
   <div id="wrapper">
<!-- 正文内容开始 -->
		<div id="page-wrapper">
			<div class="container-fluid">
			<div class="tableTool">
			<strong>定损单 </strong>
			<div class="searchTool">
			<select id="searchCondition">
			<option value="asid">定损单号</option>
			<option value="caseid">案件号</option>
			<option value="plateNumber">车牌号</option>
			</select>
			<input id="searchContent" type="text" placeholder="请输入搜索的内容">
			<button id="btn_Search" class="red icon-search btn btn-primary">搜索</button>
			</div>
			</div>
			<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
						    <th>序号</th>
							<th>定损单号</th>
							<th>案件号</th>
							<th>车牌号</th>
							<th>定损金额</th>
							<th>定损人</th>
							<th>定损时间</th>
							<th>详情</th>
						</tr>
					</thead>
					<tbody id="tbody_showAssess">
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
 <!--   <!-- Common js -->
  <script src='../../pocForUser/js/common.js'></script>
  <!--  自定义js-->
 <script src='../../pocForUser/js/showAssess.js'></script> 
</html>
