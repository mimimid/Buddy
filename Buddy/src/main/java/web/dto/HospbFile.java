package web.dto;

public class HospbFile {

	private int hbfileno;
	private String 	hbfileoriginname;
	private String 	hbfilestoredname;
	private int hbfilesize;
	private int hbno;
	
	
	public HospbFile() {	}


	public HospbFile(int hbfileno, String hbfileoriginname, String hbfilestoredname, int hbfilesize, int hbno) {
		super();
		this.hbfileno = hbfileno;
		this.hbfileoriginname = hbfileoriginname;
		this.hbfilestoredname = hbfilestoredname;
		this.hbfilesize = hbfilesize;
		this.hbno = hbno;
	}


	@Override
	public String toString() {
		return "HospbFile [hbfileno=" + hbfileno + ", hbfileoriginname=" + hbfileoriginname + ", hbfilestoredname="
				+ hbfilestoredname + ", hbfilesize=" + hbfilesize + ", hbno=" + hbno + "]";
	}


	public int getHbfileno() {
		return hbfileno;
	}


	public void setHbfileno(int hbfileno) {
		this.hbfileno = hbfileno;
	}


	public String getHbfileoriginname() {
		return hbfileoriginname;
	}


	public void setHbfileoriginname(String hbfileoriginname) {
		this.hbfileoriginname = hbfileoriginname;
	}


	public String getHbfilestoredname() {
		return hbfilestoredname;
	}


	public void setHbfilestoredname(String hbfilestoredname) {
		this.hbfilestoredname = hbfilestoredname;
	}


	public int getHbfilesize() {
		return hbfilesize;
	}


	public void setHbfilesize(int hbfilesize) {
		this.hbfilesize = hbfilesize;
	}


	public int getHbno() {
		return hbno;
	}


	public void setHbno(int hbno) {
		this.hbno = hbno;
	}
	
	
	
	
}
