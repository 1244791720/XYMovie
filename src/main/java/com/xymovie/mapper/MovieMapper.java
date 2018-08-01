package com.xymovie.mapper;

import java.util.List;

import com.xymovie.po.DetailPage;
import com.xymovie.po.Movie;

public interface MovieMapper {
	
	public void addMovie(Movie movie);
	
	public List<Movie> getMovieList();
	
	public Movie getMovieByMovieTitle(String movieTitle);
	
	public List<Movie> getMovieListPerPage(DetailPage detailPage);

	public int getPageNum();
	
}
