package com.xunke.das.common.base;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

/**
 * 基本的dao接口，提供基本的增、删、改、查、方法的定义
 * @author Administrator
 *
 * @param <T>
 */
public interface BaseDao<T>{
	
	
	List<T> queryBeanList(Connection conn,String sql,Object...params) throws SQLException;
	
	/**
	 * 获取单个
	 * @param conn
	 * @param sql
	 * @param params
	 * @return
	 */
    T getBy(Connection conn,String sql,Object...params) throws SQLException;
	
	/**
	 * 新增、修改、删除方法
	 * @param conn
	 * @param sql 新增、修改、删的sql
	 * @param params
	 * @return
	 */
	int update(Connection conn,String sql,Object...params) throws SQLException;
}
