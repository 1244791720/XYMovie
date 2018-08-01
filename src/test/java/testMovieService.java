import java.io.IOException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.junit.Test;

import com.xymovie.mapper.MovieMapper;
import com.xymovie.mapper.UserMapper;
import com.xymovie.po.DetailPage;
import com.xymovie.po.Movie;
import com.xymovie.po.User;
import com.xymovie.service.DetailPageService;
import com.xymovie.service.MovieService;
import com.xymovie.util.MovieUtil;
import com.xymovie.util.OpenSqlSession;

public class testMovieService {
	
	@Test
	public void testAddMovie() throws IOException {
		MovieService.addMovieList();
	}
	
	@Test
	public void testMovieDatabase() throws IOException {
		SqlSession s = OpenSqlSession.getSqlSession();
		MovieMapper mm =  s.getMapper(MovieMapper.class);
		Movie movie = new Movie("title","source","");
		mm.addMovie(movie);
		
		s.commit();
	}
	
	@Test
	public void testUserDatabase() throws IOException {
		SqlSession s = OpenSqlSession.getSqlSession();
		UserMapper mm =  s.getMapper(UserMapper.class);
		User user = new User("title","source", "");
		mm.addUser(user);
		
		s.commit();
	}
	
	@Test
	public void testHttpclient() throws IOException {
		String s = "http://www.dytt8.net/html/gndy/dyzz/20171218/55832.html";
		String html = MovieUtil.getDocumentByHttpClient(s);
		Document document1 = Jsoup.parse(html);
		//Document document1 = MovieUtil.getDocumentByJsoup(s);
		Elements element = document1.select("#Zoom table tbody tr td a");
		String movieDescribe = document1.select("#Zoom").toString();
		//movieDescribe = new String(movieDescribe.getBytes(), "utf-8");
		String movieSource = element.attr("href");
		System.out.println(movieDescribe);
	}
	
	@Test
	public void testGetMovieList() {
		List<Movie> ml = MovieService.getMovieListFromDatabase();
		System.out.println(ml);
	}
	
	@Test
	public void testGetMovie() {
		String movieTitle = "一纸婚约.HD.1080p.国语中字.mp4";
		SqlSession s = OpenSqlSession.getSqlSession();
		MovieMapper mm =  s.getMapper(MovieMapper.class);
		
		
		Movie m = mm.getMovieByMovieTitle(movieTitle);
		if (m == null) {
			System.out.println("null");
		} else {
			System.out.println(m);
		}
	}
	
	@Test
	public void testgetMovieListPerPage() {
		DetailPage detailPage = new DetailPage(10, 1);
		List<Movie> ml = MovieService.getMovieListPerPage(detailPage);
		System.out.println(ml);
	}
	
	@Test
	public void testGetPageNum() {
		int pageNum = DetailPageService.getPageNum();
		System.out.println(pageNum);
	}
}
