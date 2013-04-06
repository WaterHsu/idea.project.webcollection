package com.database.xpf.first.manage.login;

import com.database.xpf.first.db.*;
import java.sql.*;

public class Compare 
{
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private ConDB condb = new ConDB();
	
	public int check(User user)
	{
		int key = 0;
		
		try
		{
			conn = condb.getCon();
			ps = conn.prepareStatement("select * from xpf_first_manage_users where xpf_first_manage_users_username = '" +user.getXpf_first_manage_users_username()+ "'");
		
			rs = ps.executeQuery("select * from xpf_first_manage_users where xpf_first_manage_users_username = '" + user.getXpf_first_manage_users_username()+ "'");
			
			if(rs.next())
			{
				if(rs.getString("xpf_first_manage_users_password").equals(user.getXpf_first_manage_users_password()))
				{
					key = 1;
				}
				else
				{
					key = 2;
				}
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally
		{
			condb.toClose(rs, ps, conn);
		}
		
		return key;
	}
}
