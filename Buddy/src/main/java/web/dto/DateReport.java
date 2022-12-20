package web.dto;

import java.util.Date;

public class DateReport {

	private int dReportNo;
	private int userno;
	private int dateNo;
	private String dateReportContent;
	private Date reportWriteDate;
	private int reCkNo;
	
	//조인테이블
	private String reCkName;
	
	public DateReport() {}

	public DateReport(int dReportNo, int userno, int dateNo, String dateReportContent, Date reportWriteDate, int reCkNo,
			String reCkName) {
		super();
		this.dReportNo = dReportNo;
		this.userno = userno;
		this.dateNo = dateNo;
		this.dateReportContent = dateReportContent;
		this.reportWriteDate = reportWriteDate;
		this.reCkNo = reCkNo;
		this.reCkName = reCkName;
	}

	@Override
	public String toString() {
		return "DateReport [dReportNo=" + dReportNo + ", userno=" + userno + ", dateNo=" + dateNo
				+ ", dateReportContent=" + dateReportContent + ", reportWriteDate=" + reportWriteDate + ", reCkNo="
				+ reCkNo + ", reCkName=" + reCkName + "]";
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

	public Date getReportWriteDate() {
		return reportWriteDate;
	}

	public void setReportWriteDate(Date reportWriteDate) {
		this.reportWriteDate = reportWriteDate;
	}

	public int getReCkNo() {
		return reCkNo;
	}

	public void setReCkNo(int reCkNo) {
		this.reCkNo = reCkNo;
	}

	public String getReCkName() {
		return reCkName;
	}

	public void setReCkName(String reCkName) {
		this.reCkName = reCkName;
	}

}
