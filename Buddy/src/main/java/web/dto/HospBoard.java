package web.dto;

import java.util.Date;

public class HospBoard {

	private int hbno;
	private String hbcategory;
	private String hbtitle;
	private String  hbcontent;
	private Date hbwritedate;
	private Date hbupdate;
	private int hbtop;
	private int hbhit;
	private int hblike;
	private int hbcmtcnt;
	private String animal;
	private int userno;
	
	
	public HospBoard() {	}


	public HospBoard(int hbno, String hbcategory, String hbtitle, String hbcontent, Date hbwritedate, Date hbupdate,
			int hbtop, int hbhit, int hblike, int hbcmtcnt, String animal, int userno) {
		super();
		this.hbno = hbno;
		this.hbcategory = hbcategory;
		this.hbtitle = hbtitle;
		this.hbcontent = hbcontent;
		this.hbwritedate = hbwritedate;
		this.hbupdate = hbupdate;
		this.hbtop = hbtop;
		this.hbhit = hbhit;
		this.hblike = hblike;
		this.hbcmtcnt = hbcmtcnt;
		this.animal = animal;
		this.userno = userno;
	}


	@Override
	public String toString() {
		return "HospBoard [hbno=" + hbno + ", hbcategory=" + hbcategory + ", hbtitle=" + hbtitle + ", hbcontent="
				+ hbcontent + ", hbwritedate=" + hbwritedate + ", hbupdate=" + hbupdate + ", hbtop=" + hbtop
				+ ", hbhit=" + hbhit + ", hblike=" + hblike + ", hbcmtcnt=" + hbcmtcnt + ", animal=" + animal
				+ ", userno=" + userno + "]";
	}


	public int getHbno() {
		return hbno;
	}


	public void setHbno(int hbno) {
		this.hbno = hbno;
	}


	public String getHbcategory() {
		return hbcategory;
	}


	public void setHbcategory(String hbcategory) {
		this.hbcategory = hbcategory;
	}


	public String getHbtitle() {
		return hbtitle;
	}


	public void setHbtitle(String hbtitle) {
		this.hbtitle = hbtitle;
	}


	public String getHbcontent() {
		return hbcontent;
	}


	public void setHbcontent(String hbcontent) {
		this.hbcontent = hbcontent;
	}


	public Date getHbwritedate() {
		return hbwritedate;
	}


	public void setHbwritedate(Date hbwritedate) {
		this.hbwritedate = hbwritedate;
	}


	public Date getHbupdate() {
		return hbupdate;
	}


	public void setHbupdate(Date hbupdate) {
		this.hbupdate = hbupdate;
	}


	public int getHbtop() {
		return hbtop;
	}


	public void setHbtop(int hbtop) {
		this.hbtop = hbtop;
	}


	public int getHbhit() {
		return hbhit;
	}


	public void setHbhit(int hbhit) {
		this.hbhit = hbhit;
	}


	public int getHblike() {
		return hblike;
	}


	public void setHblike(int hblike) {
		this.hblike = hblike;
	}


	public int getHbcmtcnt() {
		return hbcmtcnt;
	}


	public void setHbcmtcnt(int hbcmtcnt) {
		this.hbcmtcnt = hbcmtcnt;
	}


	public String getAnimal() {
		return animal;
	}


	public void setAnimal(String animal) {
		this.animal = animal;
	}


	public int getUserno() {
		return userno;
	}


	public void setUserno(int userno) {
		this.userno = userno;
	}
	
	
	
}
