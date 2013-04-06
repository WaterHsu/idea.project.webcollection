<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@page import="com.database.xpf.first.db.ConDB" %>
<%@page import="java.sql.*" %>

<% 
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String sql = "select * from xpf_first_webcollection_kinds";
	ConDB condb = new ConDB();
	
	try
	{
		conn = condb.getCon();
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery(sql);
	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	
	<link rel="stylesheet" type="text/css" href="xpf_first_css/xpf_first_web.css"></link>

	<script type="text/javascript" src="xpf_first_js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="xpf_first_js/xpf_first_web.js"></script>
	
  </head>
  
  <body>
    <div class="galleryContainer">
  
        <% 
        	while(rs.next())
        	{
        %>
        <div class="galleryImage">
        	<img src="<%=(path + rs.getString("xpf_first_webcollection_kinds_picture")) %>" style="width:325" />
        	<div class="info">
        		<h2><%=rs.getString("xpf_first_webcollection_kinds_name") %></h2>
        		<p><%=rs.getString("xpf_first_webcollection_kinds_introduction") %></p>
        	</div>
        	<div style="text-align:right;">
        		<a href="">进入>></a>
        	</div>
        </div>
        <% 
        	}
        %>
 
 <% 
 	}catch(Exception e)
	{
		e.printStackTrace();
	}finally
	{
		condb.toClose(rs, ps, conn);
	}
 %>
        
    </div>
  </body>
</html>
