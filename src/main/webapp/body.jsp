<%@page import="com.xymovie.service.DetailPageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
	request.getServerPort() + request.getContextPath();
	int pageNum = DetailPageService.getPageNum();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="myCarousel" class="carousel slide " >
	<!-- 轮播（Carousel）指标 -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
		<li data-target="#myCarousel" data-slide-to="3"></li>
	</ol>
	<!-- 轮播（Carousel）项目 -->
	<div class="carousel-inner">
		<div class="item active">
			<img src="img/slider/slive1.jpg" alt="First slide">
		</div>
		<div class="item">
			<img src="img/slider/slive2.jpg" alt="Second slide">
		</div>
		<div class="item">
			<img src="img/slider/slive3.jpg" alt="Third slide">
		</div>
		<div class="item">
			<img src="img/slider/slive4.jpg" alt="fourth slide">
		</div>
	</div>
	<!-- 轮播（Carousel）导航 -->
	<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		<span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		<span class="sr-only">Next</span>
	</a>
</div>
<div id="body_containner"></div>
<div class="text-center">
	<ul class="pagination">
    <li id="laquo"><a href="#title">&laquo;</a></li>
    <li id="raquo"><a href="#title">&raquo;</a></li>
</ul>
</div>

<script type="text/javascript">
var currentPage = '1'

/*创建列表*/
var generateList = (initialPage, listNum) => {
	var i = initialPage
	while (i <= listNum) {
		var pagination = document.querySelector(".pagination")
		var raquo = document.getElementById("raquo")
		var li = document.createElement("li")
		li.innerHTML = '<a class="list" href="#title">' + i + '</a>'
		pagination.insertBefore(li,raquo)
		i++
	}
}

/*	ajax */
var ajaxPage = function(currentPage) {

	var	xmlhttp;

	if (window.XMLHttpRequest){
		//	IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
		xmlhttp=new	XMLHttpRequest();
	} else {
	// IE6,	IE5	浏览器执行代码
		xmlhttp=new	ActiveXObject("Microsoft.XMLHTTP");
	}

	var	url	= '<%=basePath%>/body_containner.jsp'
	var div = document.getElementById("body_containner")
	xmlhttp.onreadystatechange=function() {
		if (xmlhttp.readyState == 4	&& xmlhttp.status == 200) {
			div.innerHTML = xmlhttp.responseText
		}
	}
	xmlhttp.open('post', url, true)
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	if (currentPage == null) {
		currentPage = 1
	}
	xmlhttp.send("currentPage=" + currentPage)
}

/*给 a 标签 加上 active类*/
var addAjax = () => {
	var pagination_as = document.querySelectorAll(".text-center .list")
	for (var a of pagination_as) {

		a.onfocus = function() {
			var pagination_as = document.querySelectorAll(".text-center .list")
			for (var a of pagination_as) {
				a.parentNode.className = ""
			}
			var li = this.parentNode
			li.className = "active"
			console.log(li.className)
			currentPage = this.innerText
			ajaxPage(currentPage)
			return false
		}

		if (a.innerText == currentPage) {
			a.parentNode.className = "active"
		}
	}


}

/*分页列表开始结束＋1*/
var updateListUp = (o) => {
	currentPage++
	if (currentPage > <%=pageNum%>) {
		currentPage = <%=pageNum%>
	}

	var pagination_as = document.querySelectorAll(".list")
	for (a of pagination_as) {
		a.parentNode.removeChild(a)
	}
	o.initialPage++
	o.listNum++
	if (o.listNum <= <%=pageNum%>) {
		generateList(o.initialPage, o.listNum)
	} else {
		o.initialPage = <%=pageNum%> - 10
		o.listNum = <%=pageNum%>
		generateList(o.initialPage, o.listNum)
	}

    /*给 a 标签 加上 active类*/
    addAjax()

	ajaxPage(currentPage)
}

/*分页列表开始结束-1*/
var updateListDown = (o) => {

    currentPage--
	if (currentPage <= 1) {
		currentPage = 1
	}

	var pagination_as = document.querySelectorAll(".list")
	for (a of pagination_as) {
		a.parentNode.removeChild(a)
	}
	o.initialPage--
	o.listNum--

	if (o.initialPage >= 1) {
		console.log('dsadasdas')
		generateList(o.initialPage, o.listNum)
	} else {
		o.initialPage = 1
		o.listNum = 10
		generateList(o.initialPage, o.listNum)
	}

    /*给 a 标签 加上 active类*/
    addAjax()

    ajaxPage(currentPage)
}

var updateList = () => {
	
    var o = {
		initialPage : 1,
		listNum : 10,
		setInitialPage : function(initialPage, listNum) {
			this.initialPage = initialPage
			this.listNum = listNum
		}
	}

	o.setInitialPage(o.initialPage, o.listNum)
	generateList(o.initialPage, o.listNum)


	var raquo = document.getElementById('raquo')
	var laquo = document.getElementById('laquo')
	raquo.onclick = () => {
		if (isLogin()) {
			updateListUp(o)
		} else {
       		alert("未登录用户不能翻开下一页，请先登录")
   		}
	}

	laquo.onclick = () => {
		if (isLogin()) {
			updateListDown(o)
		} else {
       		alert("未登录用户不能翻开上一页，请先登录")
   		}
		
	}
 


}

window.onload = function() {

	ajaxPage("1")
   
    updateList()

    addAjax()

}
</script>
