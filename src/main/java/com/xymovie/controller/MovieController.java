package com.xymovie.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xymovie.po.DetailPage;
import com.xymovie.po.Movie;
import com.xymovie.service.MovieService;

@Controller
@RequestMapping("/movie")
public class MovieController {

	/* 跳转到电影详情页 */
	@RequestMapping("/movieDetailsPage{movieTitle}.html")
	public String movieDetailsPage(@PathVariable("movieTitle") String movieTitle, Map<String, String> map ) {
		
		Movie m = MovieService.getMovieByMovieTitle(movieTitle);
		String s = m.getMovieDescribe();
		map.put("movieDescribe", s);
		
		return "moviePage";
	}
	
	/*分页第几页
	@RequestMapping("/#{currentPage}")
	public String getMovieListPerPage(@PathVariable("currentPage") int currentPage, HttpServletRequest res) {
		DetailPage detailPage = new DetailPage(10, currentPage);
		List<Movie> ml = MovieService.getMovieListPerPage(detailPage);
		res.setAttribute("movieList", ml);
		return "body_containner";
	}*/
}
