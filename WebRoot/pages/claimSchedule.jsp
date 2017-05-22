<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <title>理赔单状态查询</title>
   <!-- 公共css -->
<%@include file="common/commoncss.jsp"%>
<!-- 自定义css -->
<link href="../../pocForUser/css/claimSchedule.css" rel="stylesheet">


  </head>
  <body>
    <div id="wrapper">
<!-- 正文内容开始 -->
		<div id="page-wrapper">
			<div class="container-fluid">
			<div class="tableTool">
			<strong>理赔单 </strong>
			<div class="searchTool">
			<select id="searchCondition">
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
							<th>案件号</th>
							<th>车牌号</th>
							<th>定损金额</th>
							<th>申请时间</th>
							<th>状 态</th>
							<th>更多</th>
						</tr>
					</thead>
					<tbody id="tbody_claimSchedule">
						<tr><td class="noMessage"  colspan="7">没 有 任 何 信 息</td></tr>
					</tbody>
				</table>
				<div id="Pagination" class="pagination"></div>
				<div id="hiddenresult" style="display:none"></div>
			</div>
			</div>
			
			<!-- 理赔单详情 -->
	<div id="dialog" role="dialog" title="理赔单详情" class="ui-dialog ui-widget ui-widget-content ui-corner-all ui-front ui-dialog-buttons ui-draggable ui-resizable" style="min-width:440px;min-height: 19px; max-height: none; height: auto; display:none">
	    <h1>理赔申请表</h1>
	    <br>
	    
	    <div class="form-group form-group-inline">
		<div><span>案件号:</span></div>
		<label  class="form-control form-control-inline" id="caseid" ></label>
			   <!-- <span class="glyphicon glyphicon-star" aria-hidden="true"></span> -->
	    <div></div>
	    </div>
	    
	    <div class="form-group form-group-inline">
		<div><span>交强险保单号:</span></div>
		<label class="form-control form-control-inline" id="a1id"></label>
			   <div></div>
	    </div>
	    
	    <div class="form-group form-group-inline">
		<div><span>第三者责任险保单号:</span></div>
		<label type="text" class="form-control form-control-inline" id="a2id"></label>
			   <div></div>
	    </div>
	    
	    <div class="form-group form-group-inline">
		<div><span>被保险人:</span></div>
		<label class="form-control form-control-inline" id="recognizee"></label>
			   <div></div>
			   
	    </div>
	    
	    <div class="form-group form-group-inline">
		<div><span>车牌号码:</span></div>
		<label type="text" class="form-control form-control-inline" id="plateNumber"></label>
			   <div></div>
	    </div>
	    
	    <div class="form-group form-group-inline">
		<div><span>出险时间:</span></div>
		<label class="form-control form-control-inline" id="caseTime" ></label>
			   <div></div>
	    </div>
	    
	    <div class="form-group form-group-inline">
		<div><span>出险地点:</span></div>
		<label class="form-control form-control-inline" id="casePlace"></label>
			   <div></div>
	    </div>
	    
	    <div class="form-group form-group-inline">
		<div><span>报案人:</span></div>
		<label class="form-control form-control-inline" id="reportPerson" ></label>
			   <div></div>
	    </div>
	    
	    <div class="form-group form-group-inline">
		<div><span>报案时间:</span></div>
		<label class="form-control form-control-inline" id="reportTime" ></label>
			   <div></div>
	    </div>
	    
	    
	    <div class="form-group form-group-inline">
		<div><span>报案人联系电话:</span></div>
		<label class="form-control form-control-inline" id="reportPersonMobile"></label>
			   <div></div>
	    </div>
	    
	    <div class="form-group form-group-inline">
		<div><span>驾驶员:</span></div>
		<label  class="form-control form-control-inline" id="driver"></label>
			   <div></div>
	    </div>
	    
	    <div class="form-group form-group-inline">
		<div><span>联系电话:</span></div>
		<label class="form-control form-control-inline" id="driverMobile" ></label>
		<div></div>
	    </div>
	    
	    <div class="form-group">
	    <h2>案件描述</h2>
		<textarea id="caseDescribe" name="caseDescribe" class="form-control"></textarea>
	    </div>    
	    
	      <div class="form-group">
	    <h2>审批原因</h2>
		<textarea id="reason" name="reason" class="form-control"></textarea>
	    </div>    
	    </div>
			<!-- 理赔单详情结束 -->
			<!-- 正文内容结束 -->
			<%@include file="common/common.jsp" %>	
			</div>
  </body>
  <!-- 公共js -->
    <%@include file="common/commonjs.jsp"%>
 <!--   <!-- Common js -->
  <script src='../../pocForUser/js/common.js'></script>
  <!--  自定义js-->
 <script src='../../pocForUser/js/claimSchedule.js'></script> 
</html>
