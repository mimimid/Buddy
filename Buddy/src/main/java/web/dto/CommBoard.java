package web.dto;

import java.util.Date;

public class CommBoard {
	
	private int commNo;
	private String cateAnimal;
	private String cateContent;
	private String commTitle;
	private String commContent;
	private String commWriterNick;
	private Date commWritedate;
	private Date commUpdate;
	private int commHit;
	private int commLikeCnt;
	private int commCmtCnt;
	private int userno;
	
	public CommBoard() {}

	public CommBoard(int commNo, String cateAnimal, String cateContent, String commTitle, String commContent,
			String commWriterNick, Date commWritedate, Date commUpdate, int commHit, int commLikeCnt, int commCmtCnt,
			int userno) {
		super();
		this.commNo = commNo;
		this.cateAnimal = cateAnimal;
		this.cateContent = cateContent;
		this.commTitle = commTitle;
		this.commContent = commContent;
		this.commWriterNick = commWriterNick;
		this.commWritedate = commWritedate;
		this.commUpdate = commUpdate;
		this.commHit = commHit;
		this.commLikeCnt = commLikeCnt;
		this.commCmtCnt = commCmtCnt;
		this.userno = userno;
	}

	@Override
	public String toString() {
		return "CommBoard [commNo=" + commNo + ", cateAnimal=" + cateAnimal + ", cateContent=" + cateContent
				+ ", commTitle=" + commTitle + ", commContent=" + commContent + ", commWriterNick=" + commWriterNick
				+ ", commWritedate=" + commWritedate + ", commUpdate=" + commUpdate + ", commHit=" + commHit
				+ ", commLikeCnt=" + commLikeCnt + ", commCmtCnt=" + commCmtCnt + ", userno=" + userno + "]";
	}

	public int getCommNo() {
		return commNo;
	}

	public void setCommNo(int commNo) {
		this.commNo = commNo;
	}

	public String getCateAnimal() {
		return cateAnimal;
	}

	public void setCateAnimal(String cateAnimal) {
		this.cateAnimal = cateAnimal;
	}

	public String getCateContent() {
		return cateContent;
	}

	public void setCateContent(String cateContent) {
		this.cateContent = cateContent;
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

	public String getCommWriterNick() {
		return commWriterNick;
	}

	public void setCommWriterNick(String commWriterNick) {
		this.commWriterNick = commWriterNick;
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

	public int getCommLikeCnt() {
		return commLikeCnt;
	}

	public void setCommLikeCnt(int commLikeCnt) {
		this.commLikeCnt = commLikeCnt;
	}

	public int getCommCmtCnt() {
		return commCmtCnt;
	}

	public void setCommCmtCnt(int commCmtCnt) {
		this.commCmtCnt = commCmtCnt;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}
	
}
