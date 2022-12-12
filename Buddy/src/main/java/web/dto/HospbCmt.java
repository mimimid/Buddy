package web.dto;

import java.util.Date;

public class HospbCmt {

	private int hbCmtNo;
	private String hbCmtContent;
	private Date hbCmtWritedate;
	private int hbCmtBundle;
	private int hbCmtSort;
	private int hbCmtDepth;
	private int isDeleted;
	private String userid;
	private int hbno;
	private int userno;
	
	
	
	public HospbCmt() {	}



	public HospbCmt(int hbCmtNo, String hbCmtContent, Date hbCmtWritedate, int hbCmtBundle, int hbCmtSort,
			int hbCmtDepth, int isDeleted, String userid, int hbno, int userno) {
		super();
		this.hbCmtNo = hbCmtNo;
		this.hbCmtContent = hbCmtContent;
		this.hbCmtWritedate = hbCmtWritedate;
		this.hbCmtBundle = hbCmtBundle;
		this.hbCmtSort = hbCmtSort;
		this.hbCmtDepth = hbCmtDepth;
		this.isDeleted = isDeleted;
		this.userid = userid;
		this.hbno = hbno;
		this.userno = userno;
	}



	@Override
	public String toString() {
		return "HospbCmt [hbCmtNo=" + hbCmtNo + ", hbCmtContent=" + hbCmtContent + ", hbCmtWritedate=" + hbCmtWritedate
				+ ", hbCmtBundle=" + hbCmtBundle + ", hbCmtSort=" + hbCmtSort + ", hbCmtDepth=" + hbCmtDepth
				+ ", isDeleted=" + isDeleted + ", userid=" + userid + ", hbno=" + hbno + ", userno=" + userno + "]";
	}



	public int getHbCmtNo() {
		return hbCmtNo;
	}



	public void setHbCmtNo(int hbCmtNo) {
		this.hbCmtNo = hbCmtNo;
	}



	public String getHbCmtContent() {
		return hbCmtContent;
	}



	public void setHbCmtContent(String hbCmtContent) {
		this.hbCmtContent = hbCmtContent;
	}



	public Date getHbCmtWritedate() {
		return hbCmtWritedate;
	}



	public void setHbCmtWritedate(Date hbCmtWritedate) {
		this.hbCmtWritedate = hbCmtWritedate;
	}



	public int getHbCmtBundle() {
		return hbCmtBundle;
	}



	public void setHbCmtBundle(int hbCmtBundle) {
		this.hbCmtBundle = hbCmtBundle;
	}



	public int getHbCmtSort() {
		return hbCmtSort;
	}



	public void setHbCmtSort(int hbCmtSort) {
		this.hbCmtSort = hbCmtSort;
	}



	public int getHbCmtDepth() {
		return hbCmtDepth;
	}



	public void setHbCmtDepth(int hbCmtDepth) {
		this.hbCmtDepth = hbCmtDepth;
	}



	public int getIsDeleted() {
		return isDeleted;
	}



	public void setIsDeleted(int isDeleted) {
		this.isDeleted = isDeleted;
	}



	public String getUserid() {
		return userid;
	}



	public void setUserid(String userid) {
		this.userid = userid;
	}



	public int getHbno() {
		return hbno;
	}



	public void setHbno(int hbno) {
		this.hbno = hbno;
	}



	public int getUserno() {
		return userno;
	}



	public void setUserno(int userno) {
		this.userno = userno;
	}
	
	
	
	
}
