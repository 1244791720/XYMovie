package com.xymovie.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.xymovie.mapper.UserMapper;
import com.xymovie.po.User;
import com.xymovie.util.OpenSqlSession;

@Service
public class UserService {
	public static void addUser(User user) {
		SqlSession s = OpenSqlSession.getSqlSession();
		UserMapper um = s.getMapper(UserMapper.class);
		um.addUser(user);
		s.commit();
	}

	public static Boolean validateUserByUsername(User user) {
		SqlSession s = OpenSqlSession.getSqlSession();
		UserMapper um = s.getMapper(UserMapper.class);
		User user1 = um.findUserByUsername(user);
		if(user1 == null) {
			user1 = new User("null","null","null");
		}
		Boolean b = user1.getUsername().equals(user.getUsername());
		if(b) {
			return true;
		}
		s.commit();
		return false;
	}
	
	public static User getUserByUsername(User user) {
		SqlSession s = OpenSqlSession.getSqlSession();
		UserMapper um = s.getMapper(UserMapper.class);
		User user1 = um.findUserByUsername(user);
		return user1;
	}
	
	public static Boolean isRepeatUserName(User user) {
		SqlSession s = OpenSqlSession.getSqlSession();
		UserMapper um = s.getMapper(UserMapper.class);
		User u = um.findUserByUsername(user);
		if (!(u == null)) {
			return true;
		}
		
		return false;
		
	}
}
