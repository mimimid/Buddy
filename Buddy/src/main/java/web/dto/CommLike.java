package web.dto;

public class CommLike {
	
	private int commLikeNo;
	private int commNo;
	private int userno;
	private int commLikeCk;
	
	public CommLike() {}

	public CommLike(int commLikeNo, int commNo, int userno, int commLikeCk) {
		super();
		this.commLikeNo = commLikeNo;
		this.commNo = commNo;
		this.userno = userno;
		this.commLikeCk = commLikeCk;
	}

	@Override
	public String toString() {
		return "CommLike [commLikeNo=" + commLikeNo + ", commNo=" + commNo + ", userno=" + userno + ", commLikeCk="
				+ commLikeCk + "]";
	}

	public int getCommLikeNo() {
		return commLikeNo;
	}

	public void setCommLikeNo(int commLikeNo) {
		this.commLikeNo = commLikeNo;
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

	public int getCommLikeCk() {
		return commLikeCk;
	}

	public void setCommLikeCk(int commLikeCk) {
		this.commLikeCk = commLikeCk;
	}
	
}
