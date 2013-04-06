package com.database.xpf.first.manage.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Checklogin extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String xpf_first_manage_users_username = request.getParameter("xpf_first_manage_users_username");
		xpf_first_manage_users_username = new String(xpf_first_manage_users_username.getBytes("iso-8859-1"), "utf-8");
		String xpf_first_manage_users_password = request.getParameter("xpf_first_manage_users_password");
		xpf_first_manage_users_password = new String(xpf_first_manage_users_password.getBytes("iso-8859-1"), "utf-8");
	
		User user = new User(xpf_first_manage_users_username, xpf_first_manage_users_password);
		
		HttpSession session = request.getSession();
		
		Compare compare = new Compare();
		
		int key = compare.check(user);
		
		if(key == 0)
		{
			session.setAttribute("xpf_first_manage_login", "nouser");
			response.sendRedirect("manage/login.jsp");
		}
		else if(key == 1)
		{
			session.setAttribute("xpf_first_manage_login", "loginok");
			response.sendRedirect("manage/login.jsp");
		}
		else if(key == 2)
		{
			session.setAttribute("xpf_first_manage_login", "wrongpassword");
			response.sendRedirect("manage/login.jsp");
		}
	}
}
