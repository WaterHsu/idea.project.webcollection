package com.database.xpf.first.manage.collection;


import com.database.xpf.first.db.*;
import java.sql.*;

public class Updatedatabase 
{
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ConDB condb = new ConDB();
	
	
	public void Update(int key, Kind kind)
	{
		switch(key)
		{
		case 1:
			String sql = "insert into xpf_first_webcollection_kinds(xpf_first_webcollection_kinds_name, xpf_first_webcollection_kinds_introduction, xpf_first_webcollection_kinds_picture, xpf_first_webcollection_kinds_webs) values(?,?,?,?)";
			Addkind(sql, kind);
			break;
		}
	}
	
	private void Addkind(String sql, Kind kind)
	{
		try
		{
			conn = condb.getCon();
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, kind.getXpf_first_webcollection_kinds_name());
			ps.setString(2, kind.getXpf_first_webcollection_kinds_introduction());
			ps.setString(3, kind.getXpf_first_webcollection_kinds_picture());
			ps.setInt(4, 0);
			ps.execute();
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally
		{
			condb.toClose(null, ps, conn);
		}
	}
	
}
