package web.dto;

public class AniOrder {
	
	private int orderno;
	private int price;
	private int productno;
	private int userno;
	private int amount;
	private int totalprice;
	private String pimgstored;
	private String username;
	private String userphone;
	private String postno;
	private String address;
	private String detailaddress;
	
	
	public AniOrder() {}


	public AniOrder(int orderno, int price, int productno, int userno, int amount, int totalprice, String pimgstored,
			String username, String userphone, String postno, String address, String detailaddress) {
		super();
		this.orderno = orderno;
		this.price = price;
		this.productno = productno;
		this.userno = userno;
		this.amount = amount;
		this.totalprice = totalprice;
		this.pimgstored = pimgstored;
		this.username = username;
		this.userphone = userphone;
		this.postno = postno;
		this.address = address;
		this.detailaddress = detailaddress;
	}


	@Override
	public String toString() {
		return "AniOrder [orderno=" + orderno + ", price=" + price + ", productno=" + productno + ", userno=" + userno
				+ ", amount=" + amount + ", totalprice=" + totalprice + ", pimgstored=" + pimgstored + ", username="
				+ username + ", userphone=" + userphone + ", postno=" + postno + ", address=" + address
				+ ", detailaddress=" + detailaddress + "]";
	}


	public int getOrderno() {
		return orderno;
	}


	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public int getProductno() {
		return productno;
	}


	public void setProductno(int productno) {
		this.productno = productno;
	}


	public int getUserno() {
		return userno;
	}


	public void setUserno(int userno) {
		this.userno = userno;
	}


	public int getAmount() {
		return amount;
	}


	public void setAmount(int amount) {
		this.amount = amount;
	}


	public int getTotalprice() {
		return totalprice;
	}


	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}


	public String getPimgstored() {
		return pimgstored;
	}


	public void setPimgstored(String pimgstored) {
		this.pimgstored = pimgstored;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getUserphone() {
		return userphone;
	}


	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}


	public String getPostno() {
		return postno;
	}


	public void setPostno(String postno) {
		this.postno = postno;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getDetailaddress() {
		return detailaddress;
	}


	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}
	
	
	
	


	
	
	

}
