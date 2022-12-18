package web.dto;

public class CommReport {
	
	private int commReportNo;
	private int commNo;
	private int userno;
	private String commReportContent;
	
	public CommReport() {}

	public CommReport(int commReportNo, int commNo, int userno, String commReportContent) {
		super();
		this.commReportNo = commReportNo;
		this.commNo = commNo;
		this.userno = userno;
		this.commReportContent = commReportContent;
	}

	@Override
	public String toString() {
		return "CommReport [commReportNo=" + commReportNo + ", commNo=" + commNo + ", userno=" + userno
				+ ", commReportContent=" + commReportContent + "]";
	}

	public int getCommReportNo() {
		return commReportNo;
	}

	public void setCommReportNo(int commReportNo) {
		this.commReportNo = commReportNo;
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

	public String getCommReportContent() {
		return commReportContent;
	}

	public void setCommReportContent(String commReportContent) {
		this.commReportContent = commReportContent;
	}
	
}
