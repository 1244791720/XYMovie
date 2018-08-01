<%@page import="com.xymovie.service.MovieService"%>
<%@page import="java.util.*"%>
<%@page import="com.xymovie.po.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
	request.getServerPort() + request.getContextPath();

	//List<Movie> ml = MovieService.getMovieListFromDatabase();
	int currentPage = 2;
	currentPage = Integer.parseInt(request.getParameter("currentPage"));
	
	DetailPage detailPage = new DetailPage(10,currentPage);
	List<Movie> ml = MovieService.getMovieListPerPage(detailPage);
	String nickname = request.getParameter("nickname");
%>
<style>
	#title{
		padding-top: 80px;
	}
</style>
<div id="title">
	<table class="table" id="table_DetailsPage">
		<tr class="row" >
			<td class="col-sm-4">电影名称</td>
			<td class="col-sm-4">电影下载链接</td>
			<td class="col-sm-4">电影详情页面</td>
		</tr>
<%
		for (Movie m : ml) {
%>
			<tr class="row">
				<td class="col-md-4"><%=m.getMovieTitle()%></td>	
				<td class="col-md-4"><%=m.getMovieSource()%></td>			
			    <td class="col-md-4"><a href="<%=basePath%>/movie/movieDetailsPage<%=m.getMovieTitle()%>.html">详情页面</a></td>			
			</tr>
<% 
		}
%>
	</table>
</div>



<script type="text/javascript">

/*验证是否登录*/
var as = document.querySelectorAll("#table_DetailsPage a")
for (a of as) {
	if (<%=nickname%> == null) {
		 a.onclick = function() {
			 alert("请登录，没有账号请注册！！！")	
			 return false; 
		}
	} else {
		 a.onclick = function() {
			 return true; 
		 }
	 }
}

</script>
