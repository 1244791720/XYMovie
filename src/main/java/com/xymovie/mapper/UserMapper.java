package com.xymovie.mapper;

import com.xymovie.po.User;

public interface UserMapper {
	
	public void addUser(User user);

	public User findUserByUsername(User user);
}
