package com.worthy.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.worthy.beans.SearchBean;
import com.worthy.dao.StatefulDaoSupport;
import com.worthy.dao.StatefulDaoSupportImpl;
import com.worthy.dao.UserDAO;
import com.worthy.dao.UserDAOImpl;
import com.worthy.entity.Marquee;
import com.worthy.entity.User;

public class UserAction extends ActionSupport implements ModelDriven<User> {

	private static final long serialVersionUID = -6659925652584240539L;

	private User user = new User();
	private List<User> userList = new ArrayList<User>();
	private UserDAO userDAO = new UserDAOImpl();
	private StatefulDaoSupport statfulDao = new StatefulDaoSupportImpl();
	private User editUser;
	private SearchBean searhBean;
	private String msg;
	private String marqueename;
	private int userId;
	private String address;
	private String city;
	private int phoneno;
	private String email;
	
	
	public User getModel() {
		return user;
	}
	
	public String search()
	{	
		return SUCCESS;
	}
	
	public String admin()
	{	
		return SUCCESS;
	}
	
	public String getlogin()
	{	
		return SUCCESS;
	}
	
	
	public String login()
	{	
		User loginUser=userDAO.getUserByEmailAndPassword(user.getEmail(), user.getPassword());
		if(loginUser!=null){
			loginUser.getUserName().equals("Admin");
			return SUCCESS;
		}
		return ERROR;
	}
	
	
	public String searchMarqueeAction() {
		System.out.println(searhBean.getCapacity());
		System.out.println(searhBean.getCity());
		System.out.println(searhBean.getEventType());
		System.out.println(searhBean.getId());
		
		msg="Added Successfully";
		
		return SUCCESS;
	}
	
	/**
	 * To save or update user.
	 * @return String
	 */
	public String saveOrUpdate()
	{	
		userDAO.saveOrUpdateUser(user);
		return SUCCESS;
	}
	
	public String list()
	{
		userList = statfulDao.findAll(User.class);
		return SUCCESS;
	}
	
	//Get jsp page to edit marquee
	public String getEditUserJsp()
	{	
		editUser=statfulDao.findById(User.class, userId);
		return SUCCESS;
	}
	
	/**
	 * To delete a user.
	 * @return String
	 */
	public String delete()
	{
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
//		userDAO.deleteUser(Integer.parseInt(request.getParameter("id")));
		return SUCCESS;
	}
	
	/**
	 * To list a single user by Id.
	 * @return String
	 */
	public String edit()
	{
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		user = userDAO.listUserById(Integer.parseInt(request.getParameter("id")));
		return SUCCESS;
	}
	
	public String editUser()
	{	
		//statfulDao = new StatefulDaoSupportImpl();
		User userFromDb=statfulDao.findById(User.class, user.getId());
		if(userFromDb!=null){
			userFromDb.setUserName(user.getUserName());
			userFromDb.setEmail(user.getEmail());
			statfulDao.saveOrUpdate(userFromDb);
		}
		return SUCCESS;
	}
	
	public String deleteUser() {
		  User userToDelete=statfulDao.findById(User.class, userId);
		  if(userToDelete!=null){
			  statfulDao.delete(userToDelete);
			  return SUCCESS;
		  }
		  return ERROR;
		}
	/* -------------------------------- Getter Setter ------------------------------------- */
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public SearchBean getSearhBean() {
		return searhBean;
	}

	public void setSearhBean(SearchBean searhBean) {
		this.searhBean = searhBean;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getMarqueename() {
		return marqueename;
	}

	public void setMarqueename(String marqueename) {
		this.marqueename = marqueename;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getPhoneno() {
		return phoneno;
	}

	public void setPhoneno(int phoneno) {
		this.phoneno = phoneno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public StatefulDaoSupport getStatfulDao() {
		return statfulDao;
	}

	public void setStatfulDao(StatefulDaoSupport statfulDao) {
		this.statfulDao = statfulDao;
	}

	public User getEditUser() {
		return editUser;
	}

	public void setEditUser(User editUser) {
		this.editUser = editUser;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
}
