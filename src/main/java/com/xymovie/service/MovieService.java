package com.xymovie.service;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Service;

import com.xymovie.mapper.MovieMapper;
import com.xymovie.po.DetailPage;
import com.xymovie.po.Movie;
import com.xymovie.util.MovieUtil;
import com.xymovie.util.OpenSqlSession;

@Service
public class MovieService {
	public static void addMovieList() throws IOException{
		
		System.out.println("begin addMovieList");
		String url = "http://www.dytt8.net/";
		
		String html = MovieUtil.getDocumentByHttpClient(url);
		
		Document document = Jsoup.parse(html);
		
		List<String> list = MovieUtil.getMovieHtml(document);
		
		List<Movie> listMovie = MovieUtil.getMovie(list);
		
		SqlSession s = OpenSqlSession.getSqlSession();
		MovieMapper mm =  s.getMapper(MovieMapper.class);
		
		for (Movie m : listMovie) {
			mm.addMovie(m);
			s.commit();
		}
		
		System.out.println("over addMovieList");
		
	}
	
	public static List<Movie> getMovieListFromDatabase() {
		
		SqlSession s = OpenSqlSession.getSqlSession();
		MovieMapper mm =  s.getMapper(MovieMapper.class);
		
		return mm.getMovieList();
		
	}
	
	public static Movie getMovieByMovieTitle(String movieTitle) {
		
		SqlSession s = OpenSqlSession.getSqlSession();
		MovieMapper mm =  s.getMapper(MovieMapper.class);
		
		Movie movie = mm.getMovieByMovieTitle(movieTitle);
		return movie;
		
	}
	
	public static List<Movie> getMovieListPerPage(DetailPage detailPage) {
		
		SqlSession s = OpenSqlSession.getSqlSession();
		MovieMapper mm =  s.getMapper(MovieMapper.class);
		List<Movie> ml = mm.getMovieListPerPage(detailPage);
		return ml;
	}
	

	
}
