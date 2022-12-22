package web.dto;

import java.util.Date;

public class DateFile {
	
	private int fileNo;
	private int dateNo;
	private String originName;
	private String storedName;
	private Date writeDate;
	
	public DateFile() {}

	public DateFile(int fileNo, int dateNo, String originName, String storedName, Date writeDate) {
		super();
		this.fileNo = fileNo;
		this.dateNo = dateNo;
		this.originName = originName;
		this.storedName = storedName;
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return "DateFile [fileNo=" + fileNo + ", dateNo=" + dateNo + ", originName=" + originName + ", storedName="
				+ storedName + ", writeDate=" + writeDate + "]";
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getDateNo() {
		return dateNo;
	}

	public void setDateNo(int dateNo) {
		this.dateNo = dateNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getStoredName() {
		return storedName;
	}

	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

}
