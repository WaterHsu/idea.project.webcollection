package com.database.xpf.first.manage.login;

public class User 
{
	private String xpf_first_manage_users_username;
	private String xpf_first_manage_users_password;
	
	public User(String xpf_first_manage_users_username, String xpf_first_manage_users_password)
	{
		this.xpf_first_manage_users_username = xpf_first_manage_users_username;
		this.xpf_first_manage_users_password = xpf_first_manage_users_password;
	}

	public String getXpf_first_manage_users_username() 
	{
		return xpf_first_manage_users_username;
	}

	public void setXpf_first_manage_users_username(
			String xpf_first_manage_users_username) {
		this.xpf_first_manage_users_username = xpf_first_manage_users_username;
	}

	public String getXpf_first_manage_users_password() {
		return xpf_first_manage_users_password;
	}

	public void setXpf_first_manage_users_password(
			String xpf_first_manage_users_password) {
		this.xpf_first_manage_users_password = xpf_first_manage_users_password;
	}
	
	
}
