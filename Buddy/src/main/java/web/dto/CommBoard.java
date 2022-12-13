package web.dto;

import java.util.Date;

public class CommBoard {
	
	private int commNo;
	private String cateAni;
	private String cateCon;
	private String commTitle;
	private String commContent;
	private Date commWritedate;
	private Date commUpdate;
	private int commHit;
	private int commLike;
	private int userno;
	
	public CommBoard() {}

	public CommBoard(int commNo, String cateAni, String cateCon, String commTitle, String commContent,
			Date commWritedate, Date commUpdate, int commHit, int commLike, int userno) {
		super();
		this.commNo = commNo;
		this.cateAni = cateAni;
		this.cateCon = cateCon;
		this.commTitle = commTitle;
		this.commContent = commContent;
		this.commWritedate = commWritedate;
		this.commUpdate = commUpdate;
		this.commHit = commHit;
		this.commLike = commLike;
		this.userno = userno;
	}

	@Override
	public String toString() {
		return "CommBoard [commNo=" + commNo + ", cateAni=" + cateAni + ", cateCon=" + cateCon + ", commTitle="
				+ commTitle + ", commContent=" + commContent + ", commWritedate=" + commWritedate + ", commUpdate="
				+ commUpdate + ", commHit=" + commHit + ", commLike=" + commLike + ", userno=" + userno + "]";
	}

	public int getCommNo() {
		return commNo;
	}

	public void setCommNo(int commNo) {
		this.commNo = commNo;
	}

	public String getCateAni() {
		return cateAni;
	}

	public void setCateAni(String cateAni) {
		this.cateAni = cateAni;
	}

	public String getCateCon() {
		return cateCon;
	}

	public void setCateCon(String cateCon) {
		this.cateCon = cateCon;
	}

	public String getCommTitle() {
		return commTitle;
	}

	public void setCommTitle(String commTitle) {
		this.commTitle = commTitle;
	}

	public String getCommContent() {
		return commContent;
	}

	public void setCommContent(String commContent) {
		this.commContent = commContent;
	}

	public Date getCommWritedate() {
		return commWritedate;
	}

	public void setCommWritedate(Date commWritedate) {
		this.commWritedate = commWritedate;
	}

	public Date getCommUpdate() {
		return commUpdate;
	}

	public void setCommUpdate(Date commUpdate) {
		this.commUpdate = commUpdate;
	}

	public int getCommHit() {
		return commHit;
	}

	public void setCommHit(int commHit) {
		this.commHit = commHit;
	}

	public int getCommLike() {
		return commLike;
	}

	public void setCommLike(int commLike) {
		this.commLike = commLike;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}
	
}
