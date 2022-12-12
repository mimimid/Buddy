package web.dto.notice;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Nfile {
	
	private int nfileno;
	private int noticeno;
	private String originname;
	private String storedname;
	private List<MultipartFile> itemImgList;
	
	
	
	public List<MultipartFile> getItemImgList() {
		return itemImgList;
	}
	public void setItemImgList(List<MultipartFile> itemImgList) {
		this.itemImgList = itemImgList;
	}
	
	
	public int getBfileno() {
		return nfileno;
	}
	public void setBfileno(int bfileno) {
		this.nfileno = bfileno;
	}
	public int getBoardno() {
		return noticeno;
	}
	public void setBoardno(int boardno) {
		this.noticeno = boardno;
	}
	public String getOriginName() {
		return originname;
	}
	public void setOriginName(String originname) {
		this.originname = originname;
	}
	public String getStoredName() {
		return storedname;
	}
	public void setStoredName(String storedname) {
		this.storedname = storedname;
	}
	@Override
	public String toString() {
		return "Bfile [bfileno=" + nfileno + ", boardno=" + noticeno + ", originname=" + originname + ", storedname="
				+ storedname + "]";
	}
	public Nfile(int bfileno, int boardno, String originname, String storedname) {
		super();
		this.nfileno = bfileno;
		this.noticeno = boardno;
		this.originname = originname;
		this.storedname = storedname;
	}
	public Nfile() {
		super();
	}
	


}
