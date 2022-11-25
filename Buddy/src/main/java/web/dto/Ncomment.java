package web.dto;

import java.util.Date;

public class Ncomment {
	
	private int ncmtno;
	private int noticeno;
	private String ncmtcontent;
	private String writer;
	private Date wDate;
	
	public int getNcmtno() {
		return ncmtno;
	}
	public void setNcmtno(int ncmtno) {
		this.ncmtno = ncmtno;
	}
	public int getNoticeno() {
		return noticeno;
	}
	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
	}
	public String getNcmtcontent() {
		return ncmtcontent;
	}
	public void setNcmtcontent(String ncmtcontent) {
		this.ncmtcontent = ncmtcontent;
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
		return "Ncomment [ncmtno=" + ncmtno + ", noticeno=" + noticeno + ", ncmtcontent=" + ncmtcontent + ", writer="
				+ writer + ", wDate=" + wDate + "]";
	}
	public Ncomment(int ncmtno, int noticeno, String ncmtcontent, String writer, Date wDate) {
		super();
		this.ncmtno = ncmtno;
		this.noticeno = noticeno;
		this.ncmtcontent = ncmtcontent;
		this.writer = writer;
		this.wDate = wDate;
	}
	public Ncomment() {
		super();
	}
	



}
