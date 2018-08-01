<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
		request.getServerPort() + request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>咸鱼电影网</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/body.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/header.css"/>
<script type="text/javascript" src="<%=basePath %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="body.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>
