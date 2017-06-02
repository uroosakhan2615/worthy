package com.worthy.dao;

import java.util.List;

import com.worthy.entity.User;

public interface UserDAO {

	public void saveOrUpdateUser(User user);
	public List<User> listUser();
	public User listUserById(int userId);
	public void deleteUser(int userId);
}
