package web.dto;

import java.util.Date;

public class DateBoard {

	private int dateNo;
	private int userno;
	private int dateCate;			//조인 카테고리 넘버
	private String dateCateName;	//조인 카테고리이름
	private String title;
	private String content;
	private String loc;
	private String hit;
	private Date writeDate;
	private int commCount;
	private int likeCount;

	public DateBoard() {}

	public DateBoard(int dateNo, int userno, int dateCate, String dateCateName, String title, String content,
			String loc, String hit, Date writeDate, int commCount, int likeCount) {
		super();
		this.dateNo = dateNo;
		this.userno = userno;
		this.dateCate = dateCate;
		this.dateCateName = dateCateName;
		this.title = title;
		this.content = content;
		this.loc = loc;
		this.hit = hit;
		this.writeDate = writeDate;
		this.commCount = commCount;
		this.likeCount = likeCount;
	}

	@Override
	public String toString() {
		return "DateBoard [dateNo=" + dateNo + ", userno=" + userno + ", dateCate=" + dateCate + ", dateCateName="
				+ dateCateName + ", title=" + title + ", content=" + content + ", loc=" + loc + ", hit=" + hit
				+ ", writeDate=" + writeDate + ", commCount=" + commCount + ", likeCount=" + likeCount + "]";
	}

	public int getDateNo() {
		return dateNo;
	}

	public void setDateNo(int dateNo) {
		this.dateNo = dateNo;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public int getDateCate() {
		return dateCate;
	}

	public void setDateCate(int dateCate) {
		this.dateCate = dateCate;
	}

	public String getDateCateName() {
		return dateCateName;
	}

	public void setDateCateName(String dateCateName) {
		this.dateCateName = dateCateName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	public String getHit() {
		return hit;
	}

	public void setHit(String hit) {
		this.hit = hit;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getCommCount() {
		return commCount;
	}

	public void setCommCount(int commCount) {
		this.commCount = commCount;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
}
