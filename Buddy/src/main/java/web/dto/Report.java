package web.dto;

import java.util.Date;

public class Report {
	private int reptNo;
	private String adminid;
	private String reptTitle;
	private String reptContent;
	private Date reptDate;
	
	public Report() {	}

	public Report(int reptNo, String adminid, String reptTitle, String reptContent, Date reptDate) {
		super();
		this.reptNo = reptNo;
		this.adminid = adminid;
		this.reptTitle = reptTitle;
		this.reptContent = reptContent;
		this.reptDate = reptDate;
	}

	@Override
	public String toString() {
		return "Report [reptNo=" + reptNo + ", adminid=" + adminid + ", reptTitle=" + reptTitle + ", reptContent="
				+ reptContent + ", reptDate=" + reptDate + "]";
	}

	public int getReptNo() {
		return reptNo;
	}

	public void setReptNo(int reptNo) {
		this.reptNo = reptNo;
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getReptTitle() {
		return reptTitle;
	}

	public void setReptTitle(String reptTitle) {
		this.reptTitle = reptTitle;
	}

	public String getReptContent() {
		return reptContent;
	}

	public void setReptContent(String reptContent) {
		this.reptContent = reptContent;
	}

	public Date getReptDate() {
		return reptDate;
	}

	public void setReptDate(Date reptDate) {
		this.reptDate = reptDate;
	}
	
	
}


