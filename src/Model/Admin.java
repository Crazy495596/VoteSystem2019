package Model;

import java.util.Date;

public class Admin {

    private Integer adminId;
	private String adminName;
    private String password;
    private Date addtime;
    private Date lasttime;
    private String remork;
	public Integer getAdminId() {
		return adminId;
	}
	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getAddtime() {
		return addtime;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}
	public Date getLasttime() {
		return lasttime;
	}
	public void setLasttime(Date lasttime) {
		this.lasttime = lasttime;
	}
	public String getRemork() {
		return remork;
	}
	public void setRemork(String remork) {
		this.remork = remork;
	}

    

  
}