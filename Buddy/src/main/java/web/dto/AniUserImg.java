package web.dto;

public class AniUserImg {
	
	private int imgno;
	private String imgorigin;
	private String imgstored;
	private int imgsize;
	private int userno;
	
	public AniUserImg() {}

	public AniUserImg(int imgno, String imgorigin, String imgstored, int imgsize, int userno) {
		super();
		this.imgno = imgno;
		this.imgorigin = imgorigin;
		this.imgstored = imgstored;
		this.imgsize = imgsize;
		this.userno = userno;
	}

	@Override
	public String toString() {
		return "AniUserImg [imgno=" + imgno + ", imgorigin=" + imgorigin + ", imgstored=" + imgstored + ", imgsize="
				+ imgsize + ", userno=" + userno + "]";
	}

	public int getImgno() {
		return imgno;
	}

	public void setImgno(int imgno) {
		this.imgno = imgno;
	}

	public String getImgorigin() {
		return imgorigin;
	}

	public void setImgorigin(String imgorigin) {
		this.imgorigin = imgorigin;
	}

	public String getImgstored() {
		return imgstored;
	}

	public void setImgstored(String imgstored) {
		this.imgstored = imgstored;
	}

	public int getImgsize() {
		return imgsize;
	}

	public void setImgsize(int imgsize) {
		this.imgsize = imgsize;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	
	
	

}
