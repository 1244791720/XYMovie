package com.xymovie.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpStatus;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.xymovie.po.Movie;





public class MovieUtil {

public static String getDocumentByHttpClient(String url) {
	
	 String html = new String();
	    HttpGet httpget = new HttpGet(url);     //创建Http请求实例，URL 如：https://cd.lianjia.com/
	    // 模拟浏览器，避免被服务器拒绝，返回返回403 forbidden的错误信息
	    httpget.setHeader("User-Agent", 
	    "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36");
	    RequestConfig requestConfig = RequestConfig.custom()  
                .setConnectionRequestTimeout(5000)  
                .setConnectTimeout(5000)  
                .setSocketTimeout(5000)  
                .build();  
	    httpget.setConfig(requestConfig);
	    CloseableHttpResponse response = null;
	    CloseableHttpClient httpclient = HttpClients.createDefault();   // 使用默认的HttpClient
	    
	    try {
	        response = httpclient.execute(httpget);
	        if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {     // 返回 200 表示成功
	            html = EntityUtils.toString(response.getEntity(), "gb2312");     // 获取服务器响应实体的内容
	        }
	    } catch (IOException e) {
	        e.printStackTrace();
	    } finally {
	        if (response != null) {
	            try {
	                response.close();
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	    return html;
}

public static Document getDocumentByJsoup(String url) throws IOException {
		
		Document document = Jsoup.connect(url).get();
		
		return document;
	}

//获取电影网页地址列表
	public static List<String> getMovieHtml(Document document){
		
		List<String> list = new ArrayList<String>();
		Elements elements  =document.select(".co_content2 a");
		
		for(Element e: elements) {
			
			String s = e.attr("href");
			
			if(s != "") {
				s = "http://www.dytt8.net" + s;
				list.add(s);
			}
		}
		
		return list;
		
	}


//获取电影对象
	public static List<Movie> getMovie(List<String> list) throws IOException{
		//Test test = new Test();
		Document document1 = null;
		
		List<Movie> listMovie = new ArrayList<>();
		
		for(String s : list) {
			String html = getDocumentByHttpClient(s);
			document1 = Jsoup.parse(html);
			Elements element = document1.select("#Zoom table tbody tr td a");
			String movieDescribe = document1.select("#Zoom").toString();
			String movieSource = element.attr("href");
			if(movieSource.contains("ftp")) {
				Movie movie = new Movie();
				movie.setMovieSource(movieSource);
				String movieTitle = movieSource.substring(57);
				movie.setMovieTitle(movieTitle);
				movie.setMovieDescribe(movieDescribe);
				listMovie.add(movie);
			}	
		}
		return listMovie;
	}
}
