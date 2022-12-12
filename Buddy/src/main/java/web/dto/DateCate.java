package web.dto;

public class DateCate {

	private int dateCateNo;
	private String dateCateName;
	
	public DateCate() {}
	public DateCate(int dateCateNo, String dateCateName) {
		super();
		this.dateCateNo = dateCateNo;
		this.dateCateName = dateCateName;
	}

	@Override
	public String toString() {
		return "DateCate [dateCateNo=" + dateCateNo + ", dateCateName=" + dateCateName + "]";
	}

	public int getDateCateNo() {
		return dateCateNo;
	}

	public void setDateCateNo(int dateCateNo) {
		this.dateCateNo = dateCateNo;
	}

	public String getDateCateName() {
		return dateCateName;
	}

	public void setDateCateName(String dateCateName) {
		this.dateCateName = dateCateName;
	}
	
}
