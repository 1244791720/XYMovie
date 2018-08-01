package com.xymovie.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xymovie.po.User;
import com.xymovie.service.UserService;

@Controller
@RequestMapping("/validate")
public class ValidateController {
	@RequestMapping("/userValidate")
	public String userValidate( Map<String, String> map, @Valid User user, Errors errors) {
		Boolean b = UserService.isRepeatUserName(user);
		if (errors.hasErrors() || b) {
			//获取错误信息
			List<FieldError> errorList = errors.getFieldErrors();
			for (FieldError e : errorList) {
				//map.put("errorFiled", e.getField());
				map.put("errorMessage", e.getDefaultMessage());
			}
			return "error";
		} else {
			UserService.addUser(user);
			map.put("username", user.getUsername());
			map.put("nickname", user.getNickname());
			return "success";
		}
	}
	
	@RequestMapping("/loginValidate")
	public String loginValidate( Map<String, String> map, User user) {
		Boolean b = UserService.validateUserByUsername(user);
		user = UserService.getUserByUsername(user);
		if (b) {
			map.put("username", user.getUsername());
			map.put("nickname", user.getNickname());
			return "loginSuccess";
		} 
		return "loginError";
		
	}
}
