package web.dto;

import java.util.Date;

public class HospitalReview {

	private int hospReviewNo;
	private String hospReviewContent;
	private double hospStarrating;
	private Date hospReviewWritedate;
	private int hospReviewLikecnt;
	private String animal;
	private String userid;
	private String usernick;
	private int hospNo;
	private int userno;
	
	
	
	public HospitalReview() {	}



	public HospitalReview(int hospReviewNo, String hospReviewContent, double hospStarrating, Date hospReviewWritedate,
			int hospReviewLikecnt, String animal, String userid, String usernick, int hospNo, int userno) {
		super();
		this.hospReviewNo = hospReviewNo;
		this.hospReviewContent = hospReviewContent;
		this.hospStarrating = hospStarrating;
		this.hospReviewWritedate = hospReviewWritedate;
		this.hospReviewLikecnt = hospReviewLikecnt;
		this.animal = animal;
		this.userid = userid;
		this.usernick = usernick;
		this.hospNo = hospNo;
		this.userno = userno;
	}



	@Override
	public String toString() {
		return "HospitalReview [hospReviewNo=" + hospReviewNo + ", hospReviewContent=" + hospReviewContent
				+ ", hospStarrating=" + hospStarrating + ", hospReviewWritedate=" + hospReviewWritedate
				+ ", hospReviewLikecnt=" + hospReviewLikecnt + ", animal=" + animal + ", userid=" + userid
				+ ", usernick=" + usernick + ", hospNo=" + hospNo + ", userno=" + userno + "]";
	}



	public int getHospReviewNo() {
		return hospReviewNo;
	}



	public void setHospReviewNo(int hospReviewNo) {
		this.hospReviewNo = hospReviewNo;
	}



	public String getHospReviewContent() {
		return hospReviewContent;
	}



	public void setHospReviewContent(String hospReviewContent) {
		this.hospReviewContent = hospReviewContent;
	}



	public double getHospStarrating() {
		return hospStarrating;
	}



	public void setHospStarrating(double hospStarrating) {
		this.hospStarrating = hospStarrating;
	}



	public Date getHospReviewWritedate() {
		return hospReviewWritedate;
	}



	public void setHospReviewWritedate(Date hospReviewWritedate) {
		this.hospReviewWritedate = hospReviewWritedate;
	}



	public int getHospReviewLikecnt() {
		return hospReviewLikecnt;
	}



	public void setHospReviewLikecnt(int hospReviewLikecnt) {
		this.hospReviewLikecnt = hospReviewLikecnt;
	}



	public String getAnimal() {
		return animal;
	}



	public void setAnimal(String animal) {
		this.animal = animal;
	}



	public String getUserid() {
		return userid;
	}



	public void setUserid(String userid) {
		this.userid = userid;
	}



	public String getUsernick() {
		return usernick;
	}



	public void setUsernick(String usernick) {
		this.usernick = usernick;
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
