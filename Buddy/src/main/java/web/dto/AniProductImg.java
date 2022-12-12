package web.dto;

public class AniProductImg {

	private int pimgno;
	private String pimgorigin;
	private String pimgstored;
	private int pimgsize;
	private int productno;
	
	
	public AniProductImg() {}


	public AniProductImg(int pimgno, String pimgorigin, String pimgstored, int pimgsize, int productno) {
		super();
		this.pimgno = pimgno;
		this.pimgorigin = pimgorigin;
		this.pimgstored = pimgstored;
		this.pimgsize = pimgsize;
		this.productno = productno;
	}


	@Override
	public String toString() {
		return "AniProductImg [pimgno=" + pimgno + ", pimgorigin=" + pimgorigin + ", pimgstored=" + pimgstored
				+ ", pimgsize=" + pimgsize + ", productno=" + productno + "]";
	}


	public int getPimgno() {
		return pimgno;
	}


	public void setPimgno(int pimgno) {
		this.pimgno = pimgno;
	}


	public String getPimgorigin() {
		return pimgorigin;
	}


	public void setPimgorigin(String pimgorigin) {
		this.pimgorigin = pimgorigin;
	}


	public String getPimgstored() {
		return pimgstored;
	}


	public void setPimgstored(String pimgstored) {
		this.pimgstored = pimgstored;
	}


	public int getPimgsize() {
		return pimgsize;
	}


	public void setPimgsize(int pimgsize) {
		this.pimgsize = pimgsize;
	}


	public int getProductno() {
		return productno;
	}


	public void setProductno(int productno) {
		this.productno = productno;
	}
	
	
}
