package dto;

import java.sql.Date;

public class MembersDTO {
	
	private String userid;
	private String userpw;
	private String username;
	private Date userbirth;
	private String userpnum;
	/**
	 * @return the userid
	 */
	public String getUserid() {
		return userid;
	}
	/**
	 * @param userid the userid to set
	 */
	public void setUserid(String userid) {
		this.userid = userid;
	}
	/**
	 * @return the userpw
	 */
	public String getUserpw() {
		return userpw;
	}
	/**
	 * @param userpw the userpw to set
	 */
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}
	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}
	/**
	 * @return the userbirth
	 */
	public Date getUserbirth() {
		return userbirth;
	}
	/**
	 * @param userbirth the userbirth to set
	 */
	public void setUserbirth(Date userbirth) {
		this.userbirth = userbirth;
	}
	/**
	 * @return the userpnum
	 */
	public String getUserpnum() {
		return userpnum;
	}
	/**
	 * @param userpnum the userpnum to set
	 */
	public void setUserpnum(String userpnum) {
		this.userpnum = userpnum;
	}
	

}
