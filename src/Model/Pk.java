package Model;

import java.util.Date;

public class Pk {
    
    private Integer pkId;
    private String pkName;
    private String pkStatus;
    private String pkTurn;
    private String pkType;
    private Date addtime;
    private String remork;
	public Integer getPkId() {
		return pkId;
	}
	public void setPkId(Integer pkId) {
		this.pkId = pkId;
	}
	public String getPkName() {
		return pkName;
	}
	public void setPkName(String pkName) {
		this.pkName = pkName;
	}
	public String getPkStatus() {
		return pkStatus;
	}
	public void setPkStatus(String pkStatus) {
		this.pkStatus = pkStatus;
	}
	public String getPkTurn() {
		return pkTurn;
	}
	public void setPkTurn(String pkTurn) {
		this.pkTurn = pkTurn;
	}
	public String getPkType() {
		return pkType;
	}
	public void setPkType(String pkType) {
		this.pkType = pkType;
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