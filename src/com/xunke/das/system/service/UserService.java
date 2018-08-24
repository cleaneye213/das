package com.xunke.das.system.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.xunke.das.common.base.BaseDao;
import com.xunke.das.common.base.BaseService;
import com.xunke.das.common.base.PageBean;
import com.xunke.das.common.db.C3p0Utils;
import com.xunke.das.common.utils.BeanToSqlUtils;
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
public class UserService extends BaseService<User, UserDao>{

	private UserDao dao = new UserDao();
	private RoleDao roleDao = new RoleDao();
	private RoleUserDao roleUserDao = new RoleUserDao();
	
	@Override
	public String getBeanSql() {
		return BeanToSqlUtils.querySql(User.class);
	}

	@Override
	public UserDao getDao() {
		return dao;
	}

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
	
	/**
	 * 分页查询用户列表
	 * @param pageBean
	 * @return
	 * @throws Exception
	 */
	public PageBean<User> queryUserPage(PageBean<User> pageBean,String sql,String countSql) throws Exception {
		Connection conn = C3p0Utils.getConnection();

		Object cVal = getSigleCloumnVal(C3p0Utils.getConnection(), countSql);
		int total=0;
		if (cVal != null) {
			total=Integer.parseInt(String.valueOf(cVal).replace("null", "0"));
		}
		List<User> queryUser = queryUser(sql, new Object[] { pageBean.getStart(), pageBean.getLength() });

		pageBean.setAaData(queryUser);
		pageBean.setiTotalDisplayRecords(total);
		pageBean.setiTotalRecords(total);
		
		C3p0Utils.closeConnection(conn);
		return pageBean;
	}

}
