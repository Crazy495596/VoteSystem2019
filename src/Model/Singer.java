package Model;

import java.util.Date;

public class Singer {
   
    private Integer singerId;
    private String singerName;
    private String singerImg;
    private Integer singerSex;
    private Date addtime;
    private String remork;
	public Integer getSingerId() {
		return singerId;
	}
	public void setSingerId(Integer singerId) {
		this.singerId = singerId;
	}
	public String getSingerName() {
		return singerName;
	}
	public void setSingerName(String singerName) {
		this.singerName = singerName;
	}
	public String getSingerImg() {
		return singerImg;
	}
	public void setSingerImg(String singerImg) {
		this.singerImg = singerImg;
	}
	public Integer getSingerSex() {
		return singerSex;
	}
	public void setSingerSex(Integer singerSex) {
		this.singerSex = singerSex;
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