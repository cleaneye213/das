/**
 * 
 */
package com.xunke.das.test;

import org.junit.Test;

import com.xunke.das.common.utils.BeanToSqlUtils;
import com.xunke.das.system.bean.User;

/** 
* @Description:
* @author: zwl
* @date: 2018年8月19日 下午4:30:58
*/
public class TestBeanToSql {

	@Test
	public void testInsertSql(){
		System.out.println("=============");
		String insertSql=BeanToSqlUtils.insertSql(User.class);
		System.out.println(insertSql);
		System.out.println("=============");
		
		User user=new User();
		String updateSql=BeanToSqlUtils.updateSql(user.getClass());
		System.out.println(updateSql);
		System.out.println("=============");
		
		System.out.println("=============");
		String querySql=BeanToSqlUtils.querySql(user.getClass());
		System.out.println(querySql);
		System.out.println("=============");
		
	}
}
