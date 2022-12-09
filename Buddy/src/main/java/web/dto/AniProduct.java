package web.dto;

public class AniProduct {
	
	private int productno;
	private String productname;
	private String content;
	private int price;
	private int amount;
	private String kind;
	private String category;
	private String pimgstored;
	private int reviewcount;
	private int userno;
	
	public AniProduct() {}

	public AniProduct(int productno, String productname, String content, int price, int amount, String kind,
			String category, String pimgstored, int reviewcount, int userno) {
		super();
		this.productno = productno;
		this.productname = productname;
		this.content = content;
		this.price = price;
		this.amount = amount;
		this.kind = kind;
		this.category = category;
		this.pimgstored = pimgstored;
		this.reviewcount = reviewcount;
		this.userno = userno;
	}

	@Override
	public String toString() {
		return "AniProduct [productno=" + productno + ", productname=" + productname + ", content=" + content
				+ ", price=" + price + ", amount=" + amount + ", kind=" + kind + ", category=" + category
				+ ", pimgstored=" + pimgstored + ", reviewcount=" + reviewcount + ", userno=" + userno + "]";
	}

	public int getProductno() {
		return productno;
	}

	public void setProductno(int productno) {
		this.productno = productno;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getPimgstored() {
		return pimgstored;
	}

	public void setPimgstored(String pimgstored) {
		this.pimgstored = pimgstored;
	}

	public int getReviewcount() {
		return reviewcount;
	}

	public void setReviewcount(int reviewcount) {
		this.reviewcount = reviewcount;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	
	
	
	
	
	
	
	
	
	

}
