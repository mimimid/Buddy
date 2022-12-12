package web.dto;

public class HospitalReviewLike {

	private int hospReviewLikeNo;
	private int hospReviewNo;
	private int hospReviewLikeChk;
	private int hospNo;
	private int userno;
	
	public HospitalReviewLike() {	}

	public HospitalReviewLike(int hospReviewLikeNo, int hospReviewNo, int hospReviewLikeChk, int hospNo, int userno) {
		super();
		this.hospReviewLikeNo = hospReviewLikeNo;
		this.hospReviewNo = hospReviewNo;
		this.hospReviewLikeChk = hospReviewLikeChk;
		this.hospNo = hospNo;
		this.userno = userno;
	}

	@Override
	public String toString() {
		return "HospitalReviewLike [hospReviewLikeNo=" + hospReviewLikeNo + ", hospReviewNo=" + hospReviewNo
				+ ", hospReviewLikeChk=" + hospReviewLikeChk + ", hospNo=" + hospNo + ", userno=" + userno + "]";
	}

	public int getHospReviewLikeNo() {
		return hospReviewLikeNo;
	}

	public void setHospReviewLikeNo(int hospReviewLikeNo) {
		this.hospReviewLikeNo = hospReviewLikeNo;
	}

	public int getHospReviewNo() {
		return hospReviewNo;
	}

	public void setHospReviewNo(int hospReviewNo) {
		this.hospReviewNo = hospReviewNo;
	}

	public int getHospReviewLikeChk() {
		return hospReviewLikeChk;
	}

	public void setHospReviewLikeChk(int hospReviewLikeChk) {
		this.hospReviewLikeChk = hospReviewLikeChk;
	}

	public int getHospNo() {
		return hospNo;
	}

	public void setHospNo(int hospNo) {
		this.hospNo = hospNo;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}
	
	
	
	
}
