package com.xunke.das.system.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.xunke.das.common.base.BaseServlet;
import com.xunke.das.common.base.PageBean;
import com.xunke.das.common.db.C3p0Utils;
import com.xunke.das.common.utils.GsonUtils;
import com.xunke.das.system.bean.User;
import com.xunke.das.system.service.UserService;
import com.xunke.das.system.service.UserService_bak;

/**
 * 
 * @author zwl
 *
 */
@WebServlet("/userServlet")
public class UserServlet extends BaseServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 189906650295152382L;

	private UserService userService = new UserService();

	public void queryUserPage(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String startStr = req.getParameter("start");
		String lengthStr = req.getParameter("length");
		String drawStr = req.getParameter("draw");
		
		String userName=req.getParameter("userName");
		String loginName=req.getParameter("loginName");
		
		StringBuffer sql = new StringBuffer("select * from s_user where 1=1 ");
		StringBuffer sql2 = new StringBuffer("select count(1) from s_user where 1=1 ");
		if(StringUtils.isNotEmpty(userName)){
			sql.append(" and user_name like ?");
			sql2.append(" and user_name like ?");
		}
		if(StringUtils.isNotEmpty(loginName)){
			sql.append(" and login_name like ?");
			sql2.append(" and login_name like ?");
		}
		sql.append(" limit ?,?");
		
		PageBean<User> pageBean = new PageBean<>(startStr, lengthStr, drawStr);
		
		userService.queryUserPage(pageBean,sql.toString(),sql2.toString());
		resp.getWriter().write(GsonUtils.toJson(pageBean));
	}

}
