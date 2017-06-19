package com.worthy.dao;

import java.util.List;

import com.worthy.entity.Event;
import com.worthy.entity.Roles;
import com.worthy.entity.User;
import com.worthy.entity.UserRoles;

public interface UserDAO {

	public void saveOrUpdateUser(User user);
	public List<User> listUser();
	public User listUserById(int userId);
	public void delet9eUser(int userId);
	public User getUserByEmailAndPassword(String email, String pass);
	public User findByUserName(String username);
	public List<UserRoles> getUserRolesByName(String email);
	public List<UserRoles> getUserRolesByUser(User user);
	public List<Event> getUserEvents(int userId);
	
}
