package com.xunke.das.system.dao;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.xunke.das.common.base.BaseDao;
import com.xunke.das.common.base.BaseDaoImpl;
import com.xunke.das.common.db.C3p0Utils;
import com.xunke.das.common.utils.MyUtil;
import com.xunke.das.system.bean.Role;
import com.xunke.das.system.bean.User;

public class UserDao extends BaseDaoImpl<User>{
	
	private RoleDao roleDao=new RoleDao();
   
	
	/**
	 * 新增用户
	 * @param user
	 * @return
	 * @author lhj
	 * @throws SQLException 
	 */
	public void insert(User user) throws Exception{
		StringBuilder sql=new StringBuilder();
		sql.append("INSERT INTO s_user(user_name, login_name, password, sex, birthday, address, login_fail_count, is_del, is_enable, create_time, create_id, update_time, update_id)");
		sql.append("VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		
		List<Object> list = MyUtil.getSqlValue(user);
		/*list.add(user.getUserName());
		list.add(user.getLoginName());
		list.add(user.getPassword());
		list.add(user.getSex());
		list.add(user.getBirthday());
		list.add(user.getAddress());
		list.add(user.getLoginFailCount());
		list.add(user.getIsDel());
		list.add(user.getIsEnable());
		list.add(user.getCreateTime());
		list.add(user.getCreateId());
		list.add(user.getUpdateTime());
		list.add(user.getUpdateId());*/
		
		Connection conn=C3p0Utils.getConnection();
		update(conn, sql.toString(),list.toArray() );
	}
	
	/**
	 * 根据id更新所有字段
	 * @param user 要更新user
	 * @return 更新了多少个
	 * @throws Exception 
	 */
	public int updateUser(User user) throws Exception{
		StringBuilder sql=new StringBuilder();
		sql.append("UPDATE s_user ");
		sql.append("SET user_name=?, login_name=?, password=?, sex=?, birthday=?, address=?, login_fail_count=?, is_del=?, is_enable=?, create_time=?, create_id=?, update_time=?, update_id=?");
		sql.append(" where id=?");
		List<Object> list=MyUtil.getSqlValue(user);
		list.add(user.getId());
		Connection conn=C3p0Utils.getConnection();
		return update(conn, sql.toString(), list.toArray());
	}
	
	/**
	 * 根据sql更新
	 * @param sql要运行的sql
	 * @param param 要传入的参数（包括ID）
	 * @return 更新的条数
	 * @throws Exception
	 */
	public int updateUserBySql(String sql,Object[]... param) throws Exception{
		Connection conn=C3p0Utils.getConnection();
		return update(conn, sql.toString(), param);
	}
	
	/**
	 * 根据sql删除
	 * @param sql要运行的sql
	 * @param param传入的参数
	 * @return 删除了多少条
	 * @throws Exception
	 */
	public int deleteUserBySql(String sql,Object[]... param) throws Exception{
		Connection conn=C3p0Utils.getConnection();
		return update(conn, sql.toString(), param);
	}
	
	/**
	 * 根据user中的属性删除相关的数据
	 * @param user 带有要删除的属性的user
	 * @return 删除了多少条
	 * @throws Exception
	 */
	public int deleteUser(User user) throws Exception{
		if(null==user){
			return 0;
		}
		StringBuilder sql=new StringBuilder("delete from s_user where 1=1 ");
		List<Object> list = new ArrayList<Object>();
		Class c=user.getClass();
		Field[] fs=c.getDeclaredFields();
		for(int i=0;i<fs.length;i++){
			fs[i].setAccessible(true);
			Object o=fs[i].get(user);
			if(!(null==o||MyUtil.emptyCase(o).equals(""))){
				list.add(o);
				sql.append("and ").append(MyUtil.humpToUnderline(fs[i].getName())).append("=?");
			}
		}
		Connection conn=C3p0Utils.getConnection();
		return update(conn, sql.toString(), list.toArray());
	}
	
	public List<User> queryBySql(String sql,Object... o ) throws SQLException{
		Connection conn=C3p0Utils.getConnection();
		return queryBeanList(conn,sql,o);
	}
	
	public List<User> queryUsers(User user) throws Exception{
		StringBuilder sql = new StringBuilder("select * from s_user where 1=1 ");
		List<Object> list = new ArrayList<Object>();
		Class c=user.getClass();
		Field[] fs=c.getDeclaredFields();
		for(int i=0;i<fs.length;i++){
			fs[i].setAccessible(true);
			Object o=fs[i].get(user);
			if(!(null==o||MyUtil.emptyCase(o).equals(""))){
				list.add(o);
				sql.append("and ").append(MyUtil.humpToUnderline(fs[i].getName())).append("=?");
			}
		}
		return queryBySql(sql.toString(), list.toArray());
	}
	
	public List<Role> getUserRoles(User user) throws Exception{
		List<Role> list = new ArrayList<Role>();
		StringBuilder sql = new StringBuilder("select c.* from s_user a ,s_role_user b,s_role c ");
		sql.append(" where a.id=b.user_id and b.role_id=c.id ");
		
		if(!MyUtil.emptyCase(user.getId()).equals("")){
			sql.append(" and user_id=? ");
			list=roleDao.queryBySql(sql.toString(),user.getId() );
		}else{
			List<User> users=queryUsers(user);
			User u=users.get(0);
			list=roleDao.queryBySql(sql.toString(), u.getId());
		}
		return list;
	}
}
