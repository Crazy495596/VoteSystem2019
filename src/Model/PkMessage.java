package Model;

import java.util.Date;

public class PkMessage {
	private Integer messageId;
	private Integer messPkid;
	private Integer messSingerid;
	private String messMusic;
	private Date addtime;
    private String remork;
	public Integer getMessageId() {
		return messageId;
	}
	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}
	public Integer getMessPkid() {
		return messPkid;
	}
	public void setMessPkid(Integer messPkid) {
		this.messPkid = messPkid;
	}
	public Integer getMessSingerid() {
		return messSingerid;
	}
	public void setMessSingerid(Integer messSingerid) {
		this.messSingerid = messSingerid;
	}
	public String getMessMusic() {
		return messMusic;
	}
	public void setMessMusic(String messMusic) {
		this.messMusic = messMusic;
	}
	public Date getAddtime() {
		return addtime;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}
	public String getRemork() {
		return remork;
	}
	public void setRemork(String remork) {
		this.remork = remork;
	}
    
}
