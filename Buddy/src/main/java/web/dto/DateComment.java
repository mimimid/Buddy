package web.dto;

import java.util.Date;

public class DateComment {
	
	private int cmNo;
	private int userno;
	private int dateNo;
	private String cmContent;
	private Date writeDate;
	private Date writeDateUpdate;
	
	public DateComment() {}

	public DateComment(int cmNo, int userno, int dateNo, String cmContent, Date writeDate, Date writeDateUpdate) {
		super();
		this.cmNo = cmNo;
		this.userno = userno;
		this.dateNo = dateNo;
		this.cmContent = cmContent;
		this.writeDate = writeDate;
		this.writeDateUpdate = writeDateUpdate;
	}

	@Override
	public String toString() {
		return "DateComment [cmNo=" + cmNo + ", userno=" + userno + ", dateNo=" + dateNo + ", cmContent=" + cmContent
				+ ", writeDate=" + writeDate + ", writeDateUpdate=" + writeDateUpdate + "]";
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
	
}
