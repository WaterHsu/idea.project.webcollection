package com.database.xpf.first.manage.web;


import com.database.xpf.first.db.*;
import java.sql.*;


public class Updatedatabase 
{
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ConDB condb = new ConDB();
	
	
	public void Update(int key, Web web)
	{
		//System.out.println("in update");
		switch(key)
		{
		case 1:
			String sql = "insert into xpf_first_webs(xpf_first_webs_name, xpf_first_webs_address, xpf_first_webs_belongkinds, xpf_first_webs_logpicture, xpf_first_webs_webpicture, xpf_first_webs_introduction) values(?,?,?,?,?,?)";
			Addweb(sql, web);
			break;
		}
	}
	
	public void Addweb(String sql, Web web)
	{
		//System.out.println("in addweb");
		try
		{
			conn = condb.getCon();
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, web.getXpf_first_webs_name());
			ps.setString(2, web.getXpf_first_webs_address());
			ps.setString(3, web.getXpf_first_webs_belongkinds());
			ps.setString(4, web.getXpf_first_webs_logpicture());
			ps.setString(5, web.getXpf_first_webs_webpicture());
			ps.setString(6, web.getXpf_first_webs_introduction());
			ps.execute();
			
			PreparedStatement ps2 = null;
			PreparedStatement ps3 = null;
			ResultSet rs = null;
			
			ps2 = conn.prepareStatement("select * from xpf_first_webcollection_kinds where xpf_first_webcollection_kinds_name = '" +web.getXpf_first_webs_belongkinds()+ "'");
			rs = ps2.executeQuery("select * from xpf_first_webcollection_kinds where xpf_first_webcollection_kinds_name = '" +web.getXpf_first_webs_belongkinds()+ "'");
			
			int webs = 0;
			while(rs.next())
			{
				webs = rs.getInt("xpf_first_webcollection_kinds_webs");
			}
			webs++;
			
			ps3 = conn.prepareStatement("update xpf_first_webcollection_kinds set xpf_first_webcollection_kinds_webs = " +webs+ " where  xpf_first_webcollection_kinds_name = '" +web.getXpf_first_webs_belongkinds()+ "'");
			ps3.executeUpdate("update xpf_first_webcollection_kinds set xpf_first_webcollection_kinds_webs = " +webs+ " where  xpf_first_webcollection_kinds_name = '" +web.getXpf_first_webs_belongkinds()+ "'");
		
			ps2.close();
			ps3.close();
			rs.close();
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally
		{
			condb.toClose(null, ps, conn);
		}
	}
}
