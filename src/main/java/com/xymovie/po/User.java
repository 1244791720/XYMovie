package com.xymovie.po;

import javax.validation.constraints.Pattern;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;

@Component
public class User {
	@NotEmpty(message = "用户名不能为空")
	@Pattern(regexp = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$", message = "请输入正确的邮箱地址")
	private String username;
	
	@NotEmpty(message = "密码不能为空")
	@Pattern(regexp = "^[a-zA-Z0-9_-]{4,16}$", message = "密码过于简单")
	private String password;
	
	@NotEmpty(message = "昵称不能为空")
	private String nickname;
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	public User(String username, String password, String nickname) {
		super();
		this.username = username;
		this.password = password;
		this.nickname = nickname;
	}
	public User() {
		super();
	}
	
}
