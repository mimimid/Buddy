package web.dto.notice;

import java.util.Date;

public class Notice {

	private int noticeno;
	private String title;
	private String content;
	private int hit;
	private String writer;
	private Date wDate;
	
	
	public int getNoticeNo() {
		return noticeno;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeno = noticeNo;
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getwDate() {
		return wDate;
	}
	public void setwDate(Date wDate) {
		this.wDate = wDate;
	}
	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeno + ", title=" + title + ", content=" + content + ", hit=" + hit
				+ ", writer=" + writer + ", wDate=" + wDate + "]";
	}
	public Notice(int noticeNo, String title, String content, int hit, String writer, Date wDate) {
		super();
		this.noticeno = noticeNo;
		this.title = title;
		this.content = content;
		this.hit = hit;
		this.writer = writer;
		this.wDate = wDate;
	}
	public Notice() {
		super();
	}
	
	

	
}
