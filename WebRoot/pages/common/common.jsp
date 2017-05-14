<%@ page language="java" import="com.poc.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String path_common = request.getContextPath();
String basePath_common = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path_common+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%-- <%@include file="commoncss.jsp"%> --%>
<!-- Custom CSS -->
    <link href="<%=basePath_common%>css/common/sb-admin.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">网上理赔系统</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
 
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i><span id="loginedUserId"> 未  命  名 </span><b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="<%=basePath_common%>pages/login.jsp"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li>
                        <a href="showPolicy.jsp"><i class="fa fa-fw fa-dashboard"></i>保 单 显 示</a>
                    </li>
                    <li>
                        <a href="showAssess.jsp"><i class="fa fa-fw fa-coffee"></i>定 损 查 看</a>
                    </li>
                    <li>
                        <a href="claimApplication.jsp"><i class="fa fa-fw fa-bar-chart-o"></i>理 赔 申 请</a>
                    </li>
                    <li>
                        <a href="claimSchedule.jsp"><i class="fa fa-fw fa-table"></i>理 赔 进 度 查 看</a>
                    </li>
                    <li>
                        <a href="questionAndAnswer.jsp"><i class="fa fa-fw fa-edit"></i>理 赔 咨 询</a>
                    </li>
                   <!--  <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i> Dropdown <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li>
                                <a href="#">Dropdown Item</a>
                            </li>
                            <li>
                                <a href="#">Dropdown Item</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="blank-page.html"><i class="fa fa-fw fa-file"></i> Blank Page</a>
                    </li>
                    <li>
                        <a href="index-rtl.html"><i class="fa fa-fw fa-dashboard"></i> RTL Dashboard</a>
                    </li> -->
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>
<%--  <%@include file="commonjs.jsp"%> --%>
</body>
<%--  <script src='<%=basePath%>js/common.js'></script>  --%>
</html>