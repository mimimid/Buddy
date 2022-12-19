package web.dto;

public class DateLike {

	private int dLikeNo;
	private int userno;
	private int dateNo;

	public DateLike() {}

	public DateLike(int dLikeNo, int userno, int dateNo) {
		super();
		this.dLikeNo = dLikeNo;
		this.userno = userno;
		this.dateNo = dateNo;
	}

	@Override
	public String toString() {
		return "DateLike [dLikeNo=" + dLikeNo + ", userno=" + userno + ", dateNo=" + dateNo + "]";
	}

	public int getdLikeNo() {
		return dLikeNo;
	}

	public void setdLikeNo(int dLikeNo) {
		this.dLikeNo = dLikeNo;
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
	
}
