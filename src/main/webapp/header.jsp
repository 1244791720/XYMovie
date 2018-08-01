<%@page import="com.xymovie.service.UserService"%>
<%@page import="com.xymovie.po.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
	request.getServerPort() + request.getContextPath();
%>
<%
	String nickname = request.getParameter("nickname");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" dir="ltr">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <body>
        <!-- 导航栏 start -->
        <div>
        	<nav class="navbar navbar-default navbar-fixed-top clearfix" role="navigation">
        	    <div class="container-fluid">
        		    <div class="navbar-header">
        		        <a class="navbar-brand" href="#">咸鱼电影网</a>
        		    </div>
        	    	<ul class="nav navbar-nav navbar-left">
        	    		<li><a class="navbar-text" href="#">最新电影</a></li>
        	    		<li><a class="navbar-text" href="#">最热电影</a></li>
        	    	</ul>
        	    	<ul class="nav navbar-nav navbar-right" id="navUl">
        	    		<!-- 触发模态框   -->
        	    		<li><a class="navbar-text" href="#" data-toggle="modal" data-target="#myModal">注册</a></li>
        	    		<li><a class="navbar-text" href="#" data-toggle="modal" data-target="#myModal2" >登录</a></li>
        	    	</ul>
        	    </div>
        	</nav>

        </div>
        <!-- 导航栏 end -->
        <!-- 模态框 -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">注册</h4>
                    </div>
                    <div class="modal-body">
                    	<form role="form"  action="<%=basePath%>/validate/userValidate" method="get">
                    		<div class="row">
        	            		<div class="col-sm-3"></div>
        						<div class="form-group form-inline col-sm-6">
        				    		<label for="username" class="col-sm-4">用户名</label>
                                    <input name="username"class="col-sm-8"type="text" class="form-control" id="name" onchange="clickName()" placeholder="请输入邮箱地址">
        				  		</div>
                                <span class="error"></span>
                    		</div>
        			  		<div class="row">
        	            		<div class="col-sm-3"></div>
        						<div class="form-group form-inline col-sm-6" >
        				    		<label for="password" class="col-sm-4">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
        				    		<input name="password"class="col-sm-8"type="text" class="form-control" id="password" onchange="clickPassword()" placeholder="请输入密码">
        				  		</div>
                                <span class="error"></span>
                    		</div>
                    		<div class="row">
        	            		<div class="col-sm-3"></div>
        						<div class="form-group form-inline col-sm-6" >
        				    		<label for="nickname" class="col-sm-4">昵&nbsp;&nbsp;&nbsp;&nbsp;称</label>
        				    		<input name="nickname"class="col-sm-8"type="text" class="form-control" id="nickname" value="" onchange="clickNickname()" placeholder="请输入昵称">
        				  		</div>
                                <span class="error"></span>
                    		</div>
        			  		<div class="row">
        			  			<div class="col-sm-4"></div>
        			  			<button type="submit" class="btn btn-primary col-sm-4">注册</button>
        			  			<div class="col-sm-4"></div>
        			  		</div>
        				</form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>

        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">登录</h4>
                    </div>
                    <div class="modal-body">
                    	<form role="form"  action="<%=basePath%>/validate/loginValidate" method="post">
                    		<div class="row">
        	            		<div class="col-sm-3"></div>
        						<div class="form-group form-inline col-sm-6">
        				    		<label for="username" class="col-sm-4">用户名</label>
                                    <input name="username"class="col-sm-8"type="text" class="form-control" id="name" onblur="clickName()" placeholder="请输入邮箱地址">
        				  		</div>
                                <span class="error"></span>
                    		</div>
        			  		<div class="row">
        	            		<div class="col-sm-3"></div>
        						<div class="form-group form-inline col-sm-6" >
        				    		<label for="password" class="col-sm-4">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
        				    		<input name="password"class="col-sm-8"type="text" class="form-control" id="password" onblur="clickPassword()" placeholder="请输入密码">
        				  		</div>
                                <span class="error"></span>
                    		</div>
        			  		<div class="row">
        			  			<div class="col-sm-4"></div>
        			  			<button type="submit" class="btn btn-primary col-sm-4">登录</button>
        			  			<div class="col-sm-4"></div>
        			  		</div>
        				</form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
    </body>
    <script type="text/javascript">
        var log = console.log.bind(console)
        
         /* clickName */
        var clickName = function() {
	        var es = document.getElementsByClassName('error')
	        var e = es[0]
	        var u = document.getElementById('name')
	        var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/
		    if (!(validate(u, reg))) {
		       e.innerText = '请输入正确的邮箱地址'
		    } else {
		       e.innerText = ''
		    }

	        /* ajax */
	        var xmlhttp;
	        if (window.XMLHttpRequest)
	        {
	            //  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
	            xmlhttp=new XMLHttpRequest();
	        }
	        else
	        {
	            // IE6, IE5 浏览器执行代码
	            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	        }
	        var username = u.value
	        console.log('username:' + username)
	        var url = '<%=basePath%>/message.jsp'
	        
			xmlhttp.onreadystatechange=function() {
		        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
		        	console.log('xmlhttp.responseText:', xmlhttp.responseText)
			       	e.innerHTML = xmlhttp.responseText
		        }   
	        }
	        xmlhttp.open('post', url, true)
	        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	        xmlhttp.send("username=" + username + "&lname=Ford")
        }
        
        /* clickPassword */
        var clickPassword = function() {
            var es = document.getElementsByClassName('error')
            var e = es[1]
            var p = document.getElementById('password')
            var reg = /^[a-zA-Z0-9_-]{4,16}$/
            if (!(validate(p, reg))) {
                e.innerText = '密码过于简单'
            } else {
                e.innerText = ''
            }
        }

        /* clickNickname */
        var clickNickname = function() {
            var es = document.getElementsByClassName('error')
            var e = es[2]
            var p = document.getElementById('nickname')
            var flag = p.value == ''
            if (flag) {
                 e.innerText = '昵称不能为空'
            } else {
                 e.innerText = ''
            }
        }

        var validate = function(node, reg) {
            var value = node.value
            var flag = false
            if (value.match(reg) != null) {
                flag = true
            }
            return flag
        }

        var isLogin = function() {
            var flag = false;
            <%
                String username = request.getParameter("username");
                if (username != null) {
            %>
                flag = true
                var username = '<%=username%>'
            <%
                } else {
            %>
                flag = false
                log("no username")
            <%
                }
            %>
            return flag
        }

        //已登录，改变导航栏
        var changeNav = function() {
            var o = document.getElementById('navUl')
            if (isLogin()) {
                log('start')
                o.innerHTML =
                `<ul class="nav navbar-nav navbar-right" id="navUl">
                	<li>
                		<a class="navbar-text dropdown-toggle" data-toggle="dropdown" href="#">欢迎用户<span><%=nickname%><span></a>
                		<ul class="dropdown-menu">
                        <li><a href="#">我的收藏</a></li>
                        <li><a href="#">最近访问</a></li>
                    </ul>
                	</li>
                </ul>`
            }
        }
        changeNav()
    </script>
</html>
