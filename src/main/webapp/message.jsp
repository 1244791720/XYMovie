<%@ page pageEncoding="utf-8" %>
<%@ page import="com.xymovie.po.User"%>
<%@ page import="com.xymovie.service.*"%>
<%
	String username = request.getParameter("username");
	User user = new User(username, "", "");
	Boolean b = UserService.isRepeatUserName(user);
	String message = "";
	if (b) {
		message = "用户名重复";
	}
%>
<%=message%>
