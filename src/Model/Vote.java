package Model;

import java.util.Date;

public class Vote {
  
    private Integer voteId;
	private Integer votePkmessid;
    private String voteIp;
    private Date addtime;
    private String remork;
	public Integer getVoteId() {
		return voteId;
	}
	public void setVoteId(Integer voteId) {
		this.voteId = voteId;
	}
	public Integer getVotePkmessid() {
		return votePkmessid;
	}
	public void setVotePkmessid(Integer votePkmessid) {
		this.votePkmessid = votePkmessid;
	}
	public String getVoteIp() {
		return voteIp;
	}
	public void setVoteIp(String voteIp) {
		this.voteIp = voteIp;
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