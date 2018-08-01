package com.xymovie.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.xymovie.mapper.MovieMapper;
import com.xymovie.util.OpenSqlSession;

@Service
public class DetailPageService {
	
	public static int getPageNum() {
		SqlSession s = OpenSqlSession.getSqlSession();
		MovieMapper mm =  s.getMapper(MovieMapper.class);
		return (mm.getPageNum() / 10)+ 1;
	}
}
