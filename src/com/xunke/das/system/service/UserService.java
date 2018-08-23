package com.xunke.das.system.service;

import java.util.ArrayList;
import java.util.List;

import com.xunke.das.system.bean.Role;
import com.xunke.das.system.bean.RoleUser;
import com.xunke.das.system.bean.User;
import com.xunke.das.system.dao.RoleDao;
import com.xunke.das.system.dao.RoleUserDao;
import com.xunke.das.system.dao.UserDao;

/**
 *
 * @File name: UserServiceNew.java
 * @Description:
 * @Create on: 2018年8月18日 下午3:17:26
 * @LinkPage :
 * @ChangeList --------------------------------------------------- Date Editor
 *             ChangeReasons
 *
 *
 */
public class UserService {

	private UserDao dao = new UserDao();
	private RoleDao roleDao = new RoleDao();
	private RoleUserDao roleUserDao = new RoleUserDao();

	public void insertUser(User user) throws Exception {
		dao.insert(user);
	}

	public int deleteUser(User user) throws Exception {
		return dao.deleteUser(user);
	}

	public int deleteUserById(String id) throws Exception {
		return dao.deleteUserBySql("delete from s_user where id=?", new Object[] { id });
	}

	public int deleteUserBySql(String sql, Object... param) throws Exception {
		return dao.deleteUserBySql(sql, param);
	}

	public int updateUser(String sql, Object... param) throws Exception {
		return dao.updateUserBySql(sql, param);
	}

	public List<User> queryUser(String sql, Object... param) throws Exception {
		return dao.queryBySql(sql, param);
	}

	public List<User> queryUser(User user) throws Exception {
		return dao.queryUsers(user);
	}

	public List<User> queryUserAndRole(String sql, Object... param) throws Exception {
		List<User> list = dao.queryBySql(sql, param);
		for (User u : list) {
			u.setRoles(dao.getUserRoles(u));
		}
		return list;
	}

	// 查当前用户及所有的权限
	public List<User> queryUserAndRole(User user) throws Exception {
		List<User> list = dao.queryUsers(user);// 根据条件查这个用户
		for (User u : list) {// 取出用户中的权限，拼起来
			u.setRoles(dao.getUserRoles(u));
		}
		return list;
	}
}
