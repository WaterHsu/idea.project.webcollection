package com.database.xpf.first.manage.collection;


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


public class Addkind extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException
	{
		String xpf_first_webcollection_kinds_name = null;
		String xpf_first_webcollection_kinds_introduction = null;
		SmartUpload smartupload = new SmartUpload();
		String serverName = request.getServerName();
		
		try
		{
			smartupload.initialize(getServletConfig(), request, response);
			smartupload.setMaxFileSize(30000000);
			smartupload.setAllowedFilesList("gif,GIF,jpg,JPG,bmp,BMP,png,PNG");
			smartupload.upload();
			
			for(int i = 0; i < smartupload.getFiles().getCount(); i++)
			{
				com.jspsmart.upload.File file = smartupload.getFiles().getFile(i);
				String fileExt = (String)file.getFileExt();
				Date date = new Date();
				long Time = date.getTime();
				String path = (String)("/upImage/kind/" + Time + "." + fileExt);
				
				xpf_first_webcollection_kinds_name = smartupload.getRequest().getParameter("xpf_first_webcollection_kinds_name");
				xpf_first_webcollection_kinds_introduction = smartupload.getRequest().getParameter("xpf_first_webcollection_kinds_introduction");
				
				file.saveAs(path, SmartUpload.SAVE_VIRTUAL);
				
				Kind kind = new Kind(xpf_first_webcollection_kinds_name, xpf_first_webcollection_kinds_introduction, path, null);
				Updatedatabase updatedatabase = new Updatedatabase();
				
				updatedatabase.Update(1, kind);
				
				response.sendRedirect("manage/manage.jsp");
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
	//	response.sendRedirect("manage/manage.jsp");
	}

}
