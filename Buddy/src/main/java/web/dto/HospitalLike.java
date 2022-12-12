package web.dto;

public class HospitalLike {

	private int hospLikeNo;
	private int hospNo;
	private int userno;
	private int hospLikeChk;
	
	
	public HospitalLike() {	}


	public HospitalLike(int hospLikeNo, int hospNo, int userno, int hospLikeChk) {
		super();
		this.hospLikeNo = hospLikeNo;
		this.hospNo = hospNo;
		this.userno = userno;
		this.hospLikeChk = hospLikeChk;
	}


	@Override
	public String toString() {
		return "HospitaLike [hospLikeNo=" + hospLikeNo + ", hospNo=" + hospNo + ", userno=" + userno + ", hospLikeChk="
				+ hospLikeChk + "]";
	}


	public int getHospLikeNo() {
		return hospLikeNo;
	}


	public void setHospLikeNo(int hospLikeNo) {
		this.hospLikeNo = hospLikeNo;
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


	public int getHospLikeChk() {
		return hospLikeChk;
	}


	public void setHospLikeChk(int hospLikeChk) {
		this.hospLikeChk = hospLikeChk;
	}
	
	
	
}
