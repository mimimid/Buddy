package web.dto;

import java.util.Date;

public class CommCmt {
	
	private int commCmtNo;
	private String commCmtContent;
	private String commCmtWriterNick;
	private Date commCmtWritedate;
	private Date commCmtUpdate;
	private int commCmtBundle;
	private int commCmtSort;
	private int commCmtDepth;
	private int commCmtDelete;
	private int commNo;
	private int userno;
	
	public CommCmt() {}

	public CommCmt(int commCmtNo, String commCmtContent, String commCmtWriterNick, Date commCmtWritedate,
			Date commCmtUpdate, int commCmtBundle, int commCmtSort, int commCmtDepth, int commCmtDelete, int commNo,
			int userno) {
		super();
		this.commCmtNo = commCmtNo;
		this.commCmtContent = commCmtContent;
		this.commCmtWriterNick = commCmtWriterNick;
		this.commCmtWritedate = commCmtWritedate;
		this.commCmtUpdate = commCmtUpdate;
		this.commCmtBundle = commCmtBundle;
		this.commCmtSort = commCmtSort;
		this.commCmtDepth = commCmtDepth;
		this.commCmtDelete = commCmtDelete;
		this.commNo = commNo;
		this.userno = userno;
	}

	@Override
	public String toString() {
		return "CommCmt [commCmtNo=" + commCmtNo + ", commCmtContent=" + commCmtContent + ", commCmtWriterNick="
				+ commCmtWriterNick + ", commCmtWritedate=" + commCmtWritedate + ", commCmtUpdate=" + commCmtUpdate
				+ ", commCmtBundle=" + commCmtBundle + ", commCmtSort=" + commCmtSort + ", commCmtDepth=" + commCmtDepth
				+ ", commCmtDelete=" + commCmtDelete + ", commNo=" + commNo + ", userno=" + userno + "]";
	}

	public int getCommCmtNo() {
		return commCmtNo;
	}

	public void setCommCmtNo(int commCmtNo) {
		this.commCmtNo = commCmtNo;
	}

	public String getCommCmtContent() {
		return commCmtContent;
	}

	public void setCommCmtContent(String commCmtContent) {
		this.commCmtContent = commCmtContent;
	}

	public String getCommCmtWriterNick() {
		return commCmtWriterNick;
	}

	public void setCommCmtWriterNick(String commCmtWriterNick) {
		this.commCmtWriterNick = commCmtWriterNick;
	}

	public Date getCommCmtWritedate() {
		return commCmtWritedate;
	}

	public void setCommCmtWritedate(Date commCmtWritedate) {
		this.commCmtWritedate = commCmtWritedate;
	}

	public Date getCommCmtUpdate() {
		return commCmtUpdate;
	}

	public void setCommCmtUpdate(Date commCmtUpdate) {
		this.commCmtUpdate = commCmtUpdate;
	}

	public int getCommCmtBundle() {
		return commCmtBundle;
	}

	public void setCommCmtBundle(int commCmtBundle) {
		this.commCmtBundle = commCmtBundle;
	}

	public int getCommCmtSort() {
		return commCmtSort;
	}

	public void setCommCmtSort(int commCmtSort) {
		this.commCmtSort = commCmtSort;
	}

	public int getCommCmtDepth() {
		return commCmtDepth;
	}

	public void setCommCmtDepth(int commCmtDepth) {
		this.commCmtDepth = commCmtDepth;
	}

	public int getCommCmtDelete() {
		return commCmtDelete;
	}

	public void setCommCmtDelete(int commCmtDelete) {
		this.commCmtDelete = commCmtDelete;
	}

	public int getCommNo() {
		return commNo;
	}

	public void setCommNo(int commNo) {
		this.commNo = commNo;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}
	
}
