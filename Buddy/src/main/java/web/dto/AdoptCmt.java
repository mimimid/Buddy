package web.dto;

import java.util.Date;

public class AdoptCmt {
	private int procmtNo;
	private int userno;
	private int aniNo;
	private String procmtContent;
	private Date procmtDate;
	private int procmtGroup;
	private int procmtSorts;
	private int procmtDepth;
	
	public AdoptCmt() {}

	public AdoptCmt(int procmtNo, int userno, int aniNo, String procmtContent, Date procmtDate, int procmtGroup,
			int procmtSorts, int procmtDepth) {
		super();
		this.procmtNo = procmtNo;
		this.userno = userno;
		this.aniNo = aniNo;
		this.procmtContent = procmtContent;
		this.procmtDate = procmtDate;
		this.procmtGroup = procmtGroup;
		this.procmtSorts = procmtSorts;
		this.procmtDepth = procmtDepth;
	}

	@Override
	public String toString() {
		return "AdoptCmt [procmtNo=" + procmtNo + ", userno=" + userno + ", aniNo=" + aniNo + ", procmtContent="
				+ procmtContent + ", procmtDate=" + procmtDate + ", procmtGroup=" + procmtGroup + ", procmtSorts="
				+ procmtSorts + ", procmtDepth=" + procmtDepth + "]";
	}

	public int getProcmtNo() {
		return procmtNo;
	}

	public void setProcmtNo(int procmtNo) {
		this.procmtNo = procmtNo;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public int getAniNo() {
		return aniNo;
	}

	public void setAniNo(int aniNo) {
		this.aniNo = aniNo;
	}

	public String getProcmtContent() {
		return procmtContent;
	}

	public void setProcmtContent(String procmtContent) {
		this.procmtContent = procmtContent;
	}

	public Date getProcmtDate() {
		return procmtDate;
	}

	public void setProcmtDate(Date procmtDate) {
		this.procmtDate = procmtDate;
	}

	public int getProcmtGroup() {
		return procmtGroup;
	}

	public void setProcmtGroup(int procmtGroup) {
		this.procmtGroup = procmtGroup;
	}

	public int getProcmtSorts() {
		return procmtSorts;
	}

	public void setProcmtSorts(int procmtSorts) {
		this.procmtSorts = procmtSorts;
	}

	public int getProcmtDepth() {
		return procmtDepth;
	}

	public void setProcmtDepth(int procmtDepth) {
		this.procmtDepth = procmtDepth;
	}
	

}
