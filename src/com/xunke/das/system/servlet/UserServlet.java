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
import com.xunke.das.common.base.BaseServlet;
import com.xunke.das.common.base.PageBean;
import com.xunke.das.system.bean.User;
import com.xunke.das.system.service.UserService;
import com.xunke.das.system.service.UserService_bak;

/**
 *
 * @File name:  UserServlet.java
 * @Description:   
 * @Create on:  2018年8月17日 下午7:52:23
 * @LinkPage :  
 * @ChangeList
 * ---------------------------------------------------
 * Date         Editor              ChangeReasons
 *
 *
 */
@WebServlet("/userServlet")
public class UserServlet extends BaseServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 189906650295152382L;

	private UserService userService=new UserService();
	
	public void queryUserPage(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		String startStr=req.getParameter("start");
		String lengthStr=req.getParameter("length");
		String drawStr=req.getParameter("draw");
		
		Integer start=0;
		Integer length=5;
		Integer draw=0;
		if(StringUtils.isNotBlank(startStr)){
			start=Integer.parseInt(startStr);
			length=Integer.parseInt(lengthStr);
		}
		if(StringUtils.isNotBlank(lengthStr)){
			length=Integer.parseInt(lengthStr);
		}
		if(StringUtils.isNotBlank(drawStr)){
			draw=Integer.parseInt(drawStr);
		}
		
		String sql="select * from s_user";
		sql+=" limit ?,?";
		
		List<User> queryUser = userService.queryUser(sql, new Object[]{start,length});
		
		
		PageBean<User> pageBean=new PageBean<>();
		pageBean.setsEcho(draw);
		pageBean.setAaData(queryUser);
		pageBean.setiTotalDisplayRecords(7);//查询select count(1) from s_user 条件跟上面查询一致
		pageBean.setiTotalRecords(7);
		
		Gson gson=new Gson();
		resp.getWriter().write(gson.toJson(pageBean));
	}
	
	
}
