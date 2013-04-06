<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@page import="com.database.xpf.first.db.ConDB" %>
<%@page import="java.sql.*" %>

<% 
	Connection conn = null;
	PreparedStatement ps = null;
	PreparedStatement ps2 = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	String sql = "select * from xpf_first_webcollection_kinds";
	String sql2 = "select * from xpf_first_webs";
	ConDB condb = new ConDB();
	try
	{
		conn = condb.getCon();
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery(sql);
		
		ps2 = conn.prepareStatement(sql2);
		rs2 = ps2.executeQuery(sql2);

%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ÍøÕ¾¹ÜÀí</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	
	
	<link href="xpf_first_css/xpf_first_manage_css.css" type="text/css" rel="stylesheet" />
	
	
	
	<script type="text/javascript">
	
	 
	
		function Opendiv(div1, div2)
		{
			document.getElementById(div1).style.display = 'block';
			document.getElementById(div2).style.display = 'block';
		}
		
		
		function Kindchange(i)
		{
			var name = "xpf_first_webcollection_kinds_name_" + i;
			var intro = "xpf_first_webcollection_kinds_introduction" + i;
			var pict = "xpf_first_webcollection_kinds_picture" + i;
			var iid = "id_" + i;
		//	var localObj = window.location;
		//	var path = localObj.pathname.split("/")[1];
			
		//	alert(document.getElementById(pict).value);
		//	var img_src = path + document.getElementById(pict).value;
			
			document.getElementById('xpf_first_webcollection_kinds_name').value = document.getElementById(name).value;
			document.getElementById('xpf_first_webcollection_kinds_introduction').value = document.getElementById(intro).value;
			document.getElementById('xpf_first_webcollection_kinds_picture').src = document.getElementById(pict).src;		 
			document.getElementById('id').value = document.getElementById(iid).value;
			
			Opendiv('xpf_first_manage_bg','xpf_first_kind_change');
		}
		
	</script>

  </head>
  
  <body>
  		<div id="xpf_first_manage_bg">
  		
  		</div>

		<div id="xpf_first_manage_manage_total">
		
				<div id="xpf_first_manage_manage_total_head">
					
				</div>
				
				<div id="xpf_first_manage_manage_total_body">
					
					<div id="xpf_first_manage_manage_total_body_kind">
						<input type="button" value="add" onclick="Opendiv('xpf_first_manage_bg','xpf_first_kind_add')" />
						<h2>ÍøÕ¾·ÖÀà</h2>
						<table border="2">
								<tr>
									<td>ÍøÕ¾·ÖÀàÃû³Æ</td>
									<td>ÍøÕ¾½éÉÜ</td>
									<td>ÍøÕ¾Í¼Æ¬</td>
									<td>ÍøÒ³Êı</td>
									<td>²Ù×÷</td>
								</tr>
								<% 
									int i = 0;
									while(rs.next())
									{
										String name = "xpf_first_webcollection_kinds_name_" + i;
										String intro = "xpf_first_webcollection_kinds_introduction" + i;
										String pict = "xpf_first_webcollection_kinds_picture" + i;
										String iid = "id_" + i;
									
								%>
								<tr>
									<td><input type="text" id="<%=name %>" value="<%=rs.getString("xpf_first_webcollection_kinds_name") %>" readonly /></td>
									<td><input type="text" id="<%=intro %>" value="<%=rs.getString("xpf_first_webcollection_kinds_introduction") %>" readonly /></td>
									<td><input type="hidden" value="<%=rs.getString("xpf_first_webcollection_kinds_picture") %>" /><img id="<%=pict %>" src="<%=(path + rs.getString("xpf_first_webcollection_kinds_picture")) %>" style="width:200; height:150;" /></td>
									<td><input type="text"  value="<%=rs.getString("xpf_first_webcollection_kinds_webs") %>" readonly /></td>
									<td><input type="hidden" id="<%=iid %>" value="<%=rs.getInt("id") %>" /><input type="button" id="<%=i %>" onclick="Kindchange(this.id)" value="ĞŞ¸Ä" /></td>
								</tr>
								<% 
										i++;
									}
								%>
								
						</table>
						
					</div>
					
					<div id="xpf_first_manage_manage_total_body_web">
						<input type="button" value="add" onclick="Opendiv('xpf_first_manage_bg','xpf_first_web_add')" />
						<h2>ÍøÕ¾</h2>
						<table border="2">
							<tr>
								<td>ÍøÕ¾Ãû³Æ</td>
								<td>ÍøÕ¾ÍøÖ·</td>
								<td>ÍøÕ¾ËùÊô·ÖÀà</td>
								<td>ÍøÕ¾logÍ¼Æ¬</td>
								<td>ÍøÕ¾½ØÍ¼</td>
								<td>ÍøÕ¾½éÉÜ</td>
								<td>²Ù×÷</td>
							</tr>
							<% 
								int j = 0;
								while(rs2.next())
								{
									String name = "xpf_first_webs_name_" + j;
									String address = "xpf_first_webs_address_" + j;
									String belongkinds = "xpf_first_webs_belongkinds_" + j;
									String logpic = "xpf_first_webs_logpicture_" + j;
									String webpic = "xpf_first_webs_webpic_" + j;
									String intro = "xpf_first_webs_introduction_" + j;
									String iid = "id_" + j;
								
							%>
							<tr>
								<td><input type="text" id="<%=name %>" value="<%=rs2.getString("xpf_first_webs_name") %>" readonly /></td>
								<td><input type="text" id="<%=address %>" value="<%=rs2.getString("xpf_first_webs_address") %>" readonly /></td>
								<td><input type="text" id="<%=belongkinds %>" value="<%=rs2.getString("xpf_first_webs_belongkinds") %>" readonly ></td>
								<td><img id="<%=logpic %>" src="<%=(path + rs2.getString("xpf_first_webs_logpicture")) %>" style="width:200px; height:150px;" /></td>
								<td><img id="<%=webpic %>" src="<%=(path + rs2.getString("xpf_first_webs_webpicture")) %>" style="width:200px; height:150px;" /></td>
								<td><input type="text" id="<%=intro %>" value="<%=rs2.getString("xpf_first_webs_introduction") %>" readonly /></td>
								<td><input type="hidden" id="<%=iid %>" value="<%=rs2.getInt("id") %>" /><input type="button" value="ĞŞ¸Ä" /></td>
							</tr>
							<% 
									j++;
								}
							%>
						</table>
					</div>
					
<% 
	}catch(Exception e)
	{
		e.printStackTrace();
	}finally
	{
		ps2.close();
		rs2.close();
		condb.toClose(rs, ps, conn);
	}
%>
					
				</div>
				
				<div id="xpf_first_manage_manage_total_foot">
				
				</div>
		
		</div> 
		
		
		<div id="xpf_first_kind_add" style="display:none">
			<form  method="post" action="Addkind" enctype="multipart/form-data">
				<table>
					<tr>
						<td>ÍøÕ¾·ÖÀàÃû³Æ:</td>
						<td><input type="text" name="xpf_first_webcollection_kinds_name" /></td>
					</tr>
					<tr>
						<td>ÍøÕ¾·ÖÀàlogÍ¼Æ¬:</td>
						<td><input type="file" name="xpf_first_webcollection_kinds_picture" /></td>
					</tr>
					<tr>
						<td>ÍøÕ¾·ÖÀà½éÉÜ:</td>
						<td>
							<textarea name="xpf_first_webcollection_kinds_introduction"></textarea>
						</td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Ìí&nbsp;&nbsp;¼Ó" /></td>
					</tr>
				</table>
			</form>
		</div>  	
		
		
		<div id="xpf_first_kind_change" style="display:none">
			<form>
				<table border="2">
					<tr>
						<td>ÍøÕ¾·ÖÀàÃû³Æ</td>
						<td><input type="text" id="xpf_first_webcollection_kinds_name" name="xpf_first_webcollection_kinds_name" /></td>
					</tr>
					<tr>
						<td>ÍøÕ¾½éÉÜ</td>
						<td><textarea id="xpf_first_webcollection_kinds_introduction" name="xpf_first_webcollection_kinds_introduction" ></textarea></td>
					</tr>
					<tr>
						<td>ÍøÕ¾Í¼Æ¬</td>
						<td><img id="xpf_first_webcollection_kinds_picture" style="height:200px; width:300px;" /><input type="file" name="xpf_first_webcollection_kinds_picture" ></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="hidden" id="id" name="id" ><input type="submit" value="ĞŞ&nbsp;&nbsp;¸Ä" /></td>
					</tr>
				</table>
			</form>
		</div>    
		
		
		<div id="xpf_first_web_add" style="display:none">
			<form method="post" action="Addweb" enctype="multipart/form-data">
				<table>
					<tr>
						<td>ÍøÕ¾Ãû³Æ</td>
						<td><input type="text" name="xpf_first_webs_name" /></td>
					</tr>
					<tr>
						<td>ÍøÕ¾ÍøÖ·</td>
						<td><input type="text" name="xpf_first_webs_address" ></td>
					</tr>
					<tr>
						<td>ÍøÕ¾ËùÊô·ÖÀà</td>
						<td><input type="text" name="xpf_first_webs_belongkinds" /></td>
					</tr>
					<tr>
						<td>ÍøÕ¾logÍ¼Æ¬</td>
						<td><input type="file" name="xpf_first_webs_logpicture" /></td>
					</tr>
					<tr>
						<td>ÍøÕ¾½ØÍ¼</td>
						<td><input type="file" name="xpf_first_webs_webpicture" ></td>
					</tr>
					<tr>
						<td>ÍøÕ¾½éÉÜ</td>
						<td><textarea name="xpf_first_webs_introduction"></textarea></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Ìí¼Ó" ></td>
					</tr>
				</table>
			</form>
		</div>

  </body>
</html>
