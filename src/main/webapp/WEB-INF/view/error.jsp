<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="org.springframework.validation.FieldError" %>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
		request.getServerPort() + request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>验证错误页面</title>
<%
	String errorMessage = (String)request.getAttribute("errorMessage");
%>
<style media="screen">
    #text {
        font-size: 50px;
    }
</style>
</head>
<body>
	<a href="<%=basePath%>/index.jsp" id='a'></a>
    <div id="text">
    	
    </div>
</body>
<script type="text/javascript">
	var time = 5;
	function init(){
		var text = document.getElementById('text')
		text.innerHTML = '很遗憾，注册失败...<br> 失败原因：${errorMessage} <br>' + time + 's后跳转回主页面。'
		if (<%=errorMessage%> == null) {
			text.innerHTML = '很遗憾，注册失败...<br> 失败原因：用户名重复 <br>' + time + 's后跳转回主页面。'
		}
		time--;
		if (time == 0) {
			var a = document.getElementById('a')
			a.click();
		}
	    window.setTimeout('init()', 1000);
	}
	init()
</script>
</html>
