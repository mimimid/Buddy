package web.dto;

import java.util.Date;

public class AniReview {
	
	private int reviewno;
	private String reviewcontent;
	private Date insertdate;
	private int productno;
	private int userno;
	private String usernick;
	
	public AniReview() {}

	public AniReview(int reviewno, String reviewcontent, Date insertdate, int productno, int userno, String usernick) {
		super();
		this.reviewno = reviewno;
		this.reviewcontent = reviewcontent;
		this.insertdate = insertdate;
		this.productno = productno;
		this.userno = userno;
		this.usernick = usernick;
	}

	@Override
	public String toString() {
		return "AniReview [reviewno=" + reviewno + ", reviewcontent=" + reviewcontent + ", insertdate=" + insertdate
				+ ", productno=" + productno + ", userno=" + userno + ", usernick=" + usernick + "]";
	}

	public int getReviewno() {
		return reviewno;
	}

	public void setReviewno(int reviewno) {
		this.reviewno = reviewno;
	}

	public String getReviewcontent() {
		return reviewcontent;
	}

	public void setReviewcontent(String reviewcontent) {
		this.reviewcontent = reviewcontent;
	}

	public Date getInsertdate() {
		return insertdate;
	}

	public void setInsertdate(Date insertdate) {
		this.insertdate = insertdate;
	}

	public int getProductno() {
		return productno;
	}

	public void setProductno(int productno) {
		this.productno = productno;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public String getUsernick() {
		return usernick;
	}

	public void setUsernick(String usernick) {
		this.usernick = usernick;
	}

	
	
	

}
