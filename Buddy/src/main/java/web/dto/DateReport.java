package web.dto;

public class DateReport {

	private int dReportNo;
	private int userno;
	private int dateNo;
	private String dateReportContent;
	
	public DateReport() {}

	public DateReport(int dReportNo, int userno, int dateNo, String dateReportContent) {
		super();
		this.dReportNo = dReportNo;
		this.userno = userno;
		this.dateNo = dateNo;
		this.dateReportContent = dateReportContent;
	}

	@Override
	public String toString() {
		return "DateReport [dReportNo=" + dReportNo + ", userno=" + userno + ", dateNo=" + dateNo
				+ ", dateReportContent=" + dateReportContent + "]";
	}

	public int getdReportNo() {
		return dReportNo;
	}

	public void setdReportNo(int dReportNo) {
		this.dReportNo = dReportNo;
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

	public String getDateReportContent() {
		return dateReportContent;
	}

	public void setDateReportContent(String dateReportContent) {
		this.dateReportContent = dateReportContent;
	}
	
}
