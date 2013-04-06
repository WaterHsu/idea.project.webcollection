<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<% 
	int mark = 0;
	
	if(session.getAttribute("xpf_first_manage_login") != null)
	{
		if(session.getAttribute("xpf_first_manage_login").toString().equals("loginok"))
		{
			response.sendRedirect("manage.jsp");
		}
		else if(session.getAttribute("xpf_first_manage_login").toString().equals("nouser"))
		{
			mark = 2;
			session.setAttribute("xpf_first_manage_login", null);		
		}
		else if(session.getAttribute("xpf_first_manage_login").toString().equals("wrongpassword"))
		{
			mark = 3;
			session.setAttribute("xpf_first_manage_login", null);
		}
	}
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登陆</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
	
		#xpf_first_manage_login
		{
			width: 400px;
			height:300px;
			margin: 200px auto;
		}
		
	</style>
	
	
	<script>
		function ShowInformation()
		{
			var m = <%=mark%>;
			
			if(m == 2)
			{
				document.getElementById('xpf_first_manage_login_usernameinfo').innerHTML = "用户名不存在";
			}
			else if(m == 3)
			{
				document.getElementById('xpf_first_manage_login_passwordinfo').innerHTML = "密码错误";
			}
		}
	</script>

  </head>
  
  <body onload="ShowInformation()">
    
    	<div id="xpf_first_manage_login">
    		<form method="post" action="Checklogin">
    			<table border=1>
    				<tr>
    					<td>用户名:</td>
    					<td>
    						<input type="text" id="xpf_first_manage_users_username" name="xpf_first_manage_users_username" />
    						<div id="xpf_first_manage_login_usernameinfo"></div>
    					</td>
    				</tr>
    				<tr>
    					<td>密&nbsp;&nbsp;码:</td>
    					<td>
    						<input type="password" id="xpf_first_manage_users_password" name="xpf_first_manage_users_password" />
    						<div id="xpf_first_manage_login_passwordinfo"></div>
    					</td>
    				</tr>
    				<tr>
    					<td></td>
    					<td><input type="submit" value="登&nbsp;&nbsp;&nbsp;&nbsp;陆" /></td>
    				</tr>
    			</table>
    		</form>
    	</div>
    
  </body>
</html>
