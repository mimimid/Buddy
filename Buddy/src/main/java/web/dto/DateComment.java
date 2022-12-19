package web.dto;

import java.util.Date;

public class DateComment {
	
	private int cmNo;
	private int userno;
	private int dateNo;
	private String cmContent;
	private Date writeDate;
	private Date writeDateUpdate;
	
	private String userid;		//유저 아이디
	private String usernick;	//유저 닉네임
	
	public DateComment() {}

	public DateComment(int cmNo, int userno, int dateNo, String cmContent, Date writeDate, Date writeDateUpdate,
			String userid, String usernick) {
		super();
		this.cmNo = cmNo;
		this.userno = userno;
		this.dateNo = dateNo;
		this.cmContent = cmContent;
		this.writeDate = writeDate;
		this.writeDateUpdate = writeDateUpdate;
		this.userid = userid;
		this.usernick = usernick;
	}

	@Override
	public String toString() {
		return "DateComment [cmNo=" + cmNo + ", userno=" + userno + ", dateNo=" + dateNo + ", cmContent=" + cmContent
				+ ", writeDate=" + writeDate + ", writeDateUpdate=" + writeDateUpdate + ", userid=" + userid
				+ ", usernick=" + usernick + "]";
	}

	public int getCmNo() {
		return cmNo;
	}

	public void setCmNo(int cmNo) {
		this.cmNo = cmNo;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public int getDateNo() {
		return dateNo;
	}

	public void setDateNo(int dateNo) {
		this.dateNo = dateNo;
	}

	public String getCmContent() {
		return cmContent;
	}

	public void setCmContent(String cmContent) {
		this.cmContent = cmContent;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public Date getWriteDateUpdate() {
		return writeDateUpdate;
	}

	public void setWriteDateUpdate(Date writeDateUpdate) {
		this.writeDateUpdate = writeDateUpdate;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsernick() {
		return usernick;
	}

	public void setUsernick(String usernick) {
		this.usernick = usernick;
	}
	
}
