package com.xymovie.util;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class OpenSqlSession {
	public static SqlSession getSqlSession() {
		ApplicationContext ac =  new ClassPathXmlApplicationContext("spring/applicationContext-dao.xml");
		SqlSessionFactory sf = (SqlSessionFactory) ac.getBean("sqlSessionFactory");
		SqlSession s = sf.openSession();
		return s;
	}
}
