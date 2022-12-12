package web.dto;

public class HospitalPic {

	private int hpicNo;
	private String hpicOriginName;
	private String 	hpicStoredName;
	private int hpicSize;
	private int hospNo;
	
	
	public HospitalPic() {	}


	public HospitalPic(int hpicNo, String hpicOriginName, String hpicStoredName, int hpicSize, int hospNo) {
		super();
		this.hpicNo = hpicNo;
		this.hpicOriginName = hpicOriginName;
		this.hpicStoredName = hpicStoredName;
		this.hpicSize = hpicSize;
		this.hospNo = hospNo;
	}


	@Override
	public String toString() {
		return "HospitalPic [hpicNo=" + hpicNo + ", hpicOriginName=" + hpicOriginName + ", hpicStoredName="
				+ hpicStoredName + ", hpicSize=" + hpicSize + ", hospNo=" + hospNo + "]";
	}


	public int getHpicNo() {
		return hpicNo;
	}


	public void setHpicNo(int hpicNo) {
		this.hpicNo = hpicNo;
	}


	public String getHpicOriginName() {
		return hpicOriginName;
	}


	public void setHpicOriginName(String hpicOriginName) {
		this.hpicOriginName = hpicOriginName;
	}


	public String getHpicStoredName() {
		return hpicStoredName;
	}


	public void setHpicStoredName(String hpicStoredName) {
		this.hpicStoredName = hpicStoredName;
	}


	public int getHpicSize() {
		return hpicSize;
	}


	public void setHpicSize(int hpicSize) {
		this.hpicSize = hpicSize;
	}


	public int getHospNo() {
		return hospNo;
	}


	public void setHospNo(int hospNo) {
		this.hospNo = hospNo;
	}

	

	
	
}
