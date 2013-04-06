package com.database.xpf.first.manage.web;

import java.io.IOException;
import java.io.PrintWriter;



import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.*;
import java.util.regex.*;
import java.io.*;
import com.jspsmart.upload.*;


public class Addweb extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException
	{
		String xpf_first_webs_name = null;
		String xpf_first_webs_address = null;
		String xpf_first_webs_belongkinds = null;
		String xpf_first_webs_introduction = null;
		String pathoflogpic = null;
		String pathofwebpic = null;
		SmartUpload smartupload = new SmartUpload();
		
		
		try
		{
			smartupload.initialize(getServletConfig(), request, response);
			smartupload.setMaxFileSize(30000000);
			smartupload.setAllowedFilesList("gif,GIF,jpg,JPG,bmp,BMP,png,PNG");
			smartupload.upload();
			
			Date date = new Date();
			long Time = date.getTime();
			
			pathoflogpic = (String)("/upImage/web/log/" + Time + "." + smartupload.getFiles().getFile(0).getFileExt());
			smartupload.getFiles().getFile(0).saveAs(pathoflogpic, SmartUpload.SAVE_VIRTUAL);
			
			pathofwebpic = (String)("/upImage/web/web/" + Time + "." + smartupload.getFiles().getFile(1).getFileExt());
			smartupload.getFiles().getFile(1).saveAs(pathofwebpic, SmartUpload.SAVE_VIRTUAL);
			
			for(int i = 0; i < smartupload.getFiles().getCount(); i++)
			{
				xpf_first_webs_name = smartupload.getRequest().getParameter("xpf_first_webs_name");
				xpf_first_webs_address = smartupload.getRequest().getParameter("xpf_first_webs_address");
				xpf_first_webs_belongkinds = smartupload.getRequest().getParameter("xpf_first_webs_belongkinds");
				xpf_first_webs_introduction = smartupload.getRequest().getParameter("xpf_first_webs_introduction");
				
				Web web = new Web(xpf_first_webs_name, xpf_first_webs_address, xpf_first_webs_belongkinds, pathoflogpic, pathofwebpic, xpf_first_webs_introduction);
				Updatedatabase updatedatabase = new Updatedatabase();
				updatedatabase.Update(1, web);
				
				
				break;
			}
			
			response.sendRedirect("manage/manage.jsp");
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
}
