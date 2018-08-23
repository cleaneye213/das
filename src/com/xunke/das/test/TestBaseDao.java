package com.xunke.das.test;

import java.util.List;

import org.junit.Test;

import com.xunke.das.system.bean.User;
import com.xunke.das.system.dao.UserDao;

public class TestBaseDao {

	@Test
	public void testUserInsert() throws Exception{
		User user=new User();
		user.setAddress("中青");
		new UserDao().insert(user); 
		
	}
	
	@Test
	public void testUserUpdate() throws Exception{
		User user=new User();
		user.setAddress("中青");
		user.setId(2);
		new UserDao().updateUser(user); 
	}
	
	@Test
	public void testDeleteUser() throws Exception{
		User user=new User();
		user.setAddress("中青");
		user.setSex("1");
		new UserDao().deleteUser(user); 
	}
	
	@Test
	public void testQueryUser() throws Exception{
		User user=new User();
		List<User> list = new UserDao().queryUsers(user); 
		for(User u:list){
			System.out.println(u.toString());
		}
	}
	
}
