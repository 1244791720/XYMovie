<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
		request.getServerPort() + request.getContextPath();
%>
<%
    String username = (String)request.getAttribute("username");
	String nickname = (String)request.getAttribute("nickname");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册成功页面</title>
<style type="text/css">
	#text {
		font-size:50px;
	}
</style>
</head>
<body>
	<div id="text"></div>
	<form action="<%=basePath%>/index.jsp" id = "a" method="post">
		<input type="hidden" name="username" value="<%=username%>">
		<input type="hidden" name="nickname" value="<%=nickname%>">
	</form>
</body>
<!-- 定时跳转脚本 -->
<script type="text/javascript">
	var time = 5;
	function init(){
		var text = document.getElementById('text')
		text.innerText = '恭喜你注册成功了，' + time + 's后跳转回主页面。'
		time--;
		if (time == 0) {
			var a = document.getElementById('a')
			a.submit();
		}
	    window.setTimeout('init()', 1000);
	}
	init()
</script>
</html>
