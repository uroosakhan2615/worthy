package com.worthy.web;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.worthy.dao.UserDAOImpl;
import com.worthy.entity.User;

public class LoginAction extends ActionSupport implements SessionAware {

	private static final long serialVersionUID = -3434561352924343132L;

	// Generate getters and setters....
	private String userId, userPass, msg;
	private SessionMap<String, Object> sessionMap;
	private UserDAOImpl userDao = new UserDAOImpl();
	
	@Override
	public void setSession(Map<String, Object> map) {
		sessionMap = (SessionMap<String, Object>) map;
	}

	@Override
	public String execute() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession(true);
		
		User user=userDao.findByUserName(userId);
		
		if (userId != null) {
			if(user.getPassword().equals(userPass)){
				sessionMap.put("userId", user.getId());
				sessionMap.put("username", user.getUserName());
				return SUCCESS;
			}
			else {
				msg = "Invalid Password";
				return "LOGIN";
			}
		} else {

			String getSessionAttr = (String) session.getAttribute("userId");
			System.out.println("AAAAA "+getSessionAttr);

			if (getSessionAttr != null) {

				return "SUCCESS";

			} else {
				return "LOGIN";
			}
		}
	}

	public String logout() {
		
		sessionMap.remove("userId");
		sessionMap.invalidate();
		
		return "LOGOUT";
	}

	public SessionMap<String, Object> getSessionMap() {
		return sessionMap;
	}

	public void setSessionMap(SessionMap<String, Object> sessionMap) {
		this.sessionMap = sessionMap;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

}