package web.dto;

public class HospbLike {

	private int hblikeNo;
	private int hbno;
	private int userno;
	private int hblikeCheck;
	
	public HospbLike() {	}

	public HospbLike(int hblikeNo, int hbno, int userno, int hblikeCheck) {
		super();
		this.hblikeNo = hblikeNo;
		this.hbno = hbno;
		this.userno = userno;
		this.hblikeCheck = hblikeCheck;
	}

	@Override
	public String toString() {
		return "HospbLike [hblikeNo=" + hblikeNo + ", hbno=" + hbno + ", userno=" + userno + ", hblikeCheck="
				+ hblikeCheck + "]";
	}

	public int getHblikeNo() {
		return hblikeNo;
	}

	public void setHblikeNo(int hblikeNo) {
		this.hblikeNo = hblikeNo;
	}

	public int getHbno() {
		return hbno;
	}

	public void setHbno(int hbno) {
		this.hbno = hbno;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public int getHblikeCheck() {
		return hblikeCheck;
	}

	public void setHblikeCheck(int hblikeCheck) {
		this.hblikeCheck = hblikeCheck;
	}
	
	
	
}
