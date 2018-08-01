package com.xymovie.po;

import org.springframework.stereotype.Component;

@Component
public class Movie {

	private String movieTitle;  //电影名
	private String movieSource; //电影链接
	private String movieDescribe; //电影描述页面
	
	public Movie(String movieTitle, String movieSource, String movieDescribe) {
		super();
		this.movieTitle = movieTitle;
		this.movieSource = movieSource;
		this.movieDescribe = movieDescribe;
	}

	public Movie() {
		super();
	}

	

	public String getMovieTitle() {
		return movieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}

	public String getMovieSource() {
		return movieSource;
	}

	public void setMovieSource(String movieSource) {
		this.movieSource = movieSource;
	}

	public String getMovieDescribe() {
		return movieDescribe;
	}

	public void setMovieDescribe(String movieDescribe) {
		this.movieDescribe = movieDescribe;
	}

	@Override
	public String toString() {
		return "Movie [MovieTitle=" + movieTitle + ", MovieSource=" + movieSource + "]";
	}
	
	
}
