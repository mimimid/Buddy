package web.dto;

import java.util.Date;

public class CommFile {
	
	private int commFileNo;
	private int commNo;
	private String commFileOriginname;
	private String commFileStoredname;
	private int commFileSize;
	private Date commFileWritedate;
	
	public CommFile() {}

	public CommFile(int commFileNo, int commNo, String commFileOriginname, String commFileStoredname, int commFileSize,
			Date commFileWritedate) {
		super();
		this.commFileNo = commFileNo;
		this.commNo = commNo;
		this.commFileOriginname = commFileOriginname;
		this.commFileStoredname = commFileStoredname;
		this.commFileSize = commFileSize;
		this.commFileWritedate = commFileWritedate;
	}

	@Override
	public String toString() {
		return "CommFile [commFileNo=" + commFileNo + ", commNo=" + commNo + ", commFileOriginname="
				+ commFileOriginname + ", commFileStoredname=" + commFileStoredname + ", commFileSize=" + commFileSize
				+ ", commFileWritedate=" + commFileWritedate + "]";
	}

	public int getCommFileNo() {
		return commFileNo;
	}

	public void setCommFileNo(int commFileNo) {
		this.commFileNo = commFileNo;
	}

	public int getCommNo() {
		return commNo;
	}

	public void setCommNo(int commNo) {
		this.commNo = commNo;
	}

	public String getCommFileOriginname() {
		return commFileOriginname;
	}

	public void setCommFileOriginname(String commFileOriginname) {
		this.commFileOriginname = commFileOriginname;
	}

	public String getCommFileStoredname() {
		return commFileStoredname;
	}

	public void setCommFileStoredname(String commFileStoredname) {
		this.commFileStoredname = commFileStoredname;
	}

	public int getCommFileSize() {
		return commFileSize;
	}

	public void setCommFileSize(int commFileSize) {
		this.commFileSize = commFileSize;
	}

	public Date getCommFileWritedate() {
		return commFileWritedate;
	}

	public void setCommFileWritedate(Date commFileWritedate) {
		this.commFileWritedate = commFileWritedate;
	}
	
}
