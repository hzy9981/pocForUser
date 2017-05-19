<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <title>定损单查看</title>
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
				
				<!-- 定损单详情 -->
				<div id="dialog" role="dialog" title="定损单详情" class="ui-dialog ui-widget ui-widget-content ui-corner-all ui-front ui-dialog-buttons ui-draggable ui-resizable" style="width: 120px; min-height: 19px; max-height: none; height: auto; display:none">
						<h4>
							<strong>定损单详情</strong>
						</h4>
						<!-- 第一部分表单填写 -->
						<div>
							<div class="form-control">
								<label>车辆车牌:</label> <label id="plateNumber"></label>
							</div>
							<div class="form-control">
								<label>申请用户:</label> <label id="applyUser"></label>
							</div>
							<div class="form-control">
								<label>用户电话:</label> <label id="applyUserPhone"></label>
							</div>
							<div class="form-control">
								<label>金额:</label> <label id="sum"></label>
							</div>
							<div class="form-control">
								<label>定损描述:</label>
							</div>
							<div class="form-control">
								<textarea id="describe"></textarea>
							</div>
						</div>
						<!-- 第二部分图片上传 -->
						<div style="margin-top:70px;">
							<div class="form-group" id="caseIma">
								<label class="control-label">案例图片</label>
								<label>
								</label>
							</div>
							<!-- 图片缩略图展示 -->
                            <div class="showimg"></div>
							<!-- 缩略图展示结束 -->
						</div>
					</div>
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
