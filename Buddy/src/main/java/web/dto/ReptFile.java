package web.dto;

public class ReptFile {
	private int rfileNo;
	private int reptNo;
	private String rfileOrigin;
	private String rfileStored;
	
	public ReptFile() {	}

	public ReptFile(int rfileNo, int reptNo, String rfileOrigin, String rfileStored) {
		super();
		this.rfileNo = rfileNo;
		this.reptNo = reptNo;
		this.rfileOrigin = rfileOrigin;
		this.rfileStored = rfileStored;
	}

	@Override
	public String toString() {
		return "ReptFile [rfileNo=" + rfileNo + ", reptNo=" + reptNo + ", rfileOrigin=" + rfileOrigin + ", rfileStored="
				+ rfileStored + "]";
	}

	public int getRfileNo() {
		return rfileNo;
	}

	public void setRfileNo(int rfileNo) {
		this.rfileNo = rfileNo;
	}

	public int getReptNo() {
		return reptNo;
	}

	public void setReptNo(int reptNo) {
		this.reptNo = reptNo;
	}

	public String getRfileOrigin() {
		return rfileOrigin;
	}

	public void setRfileOrigin(String rfileOrigin) {
		this.rfileOrigin = rfileOrigin;
	}

	public String getRfileStored() {
		return rfileStored;
	}

	public void setRfileStored(String rfileStored) {
		this.rfileStored = rfileStored;
	}
	
	
}
