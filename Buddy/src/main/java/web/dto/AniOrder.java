package web.dto;

public class AniOrder {
	
	private String orderno;
	private int price;
	private int productno;
	private int userno;
	private int amount;
	private int totalprice;
	private String productname;
	private String pimgstored;
	private String name; //주문자
	private String phone; //주문자 휴대폰
	private String postno;
	private String address;
	private String detailaddress;
	private String recipient; //수령인
	private String reciphone; //수령인 휴대폰
	
	
	public AniOrder() {}


	public AniOrder(String orderno, int price, int productno, int userno, int amount, int totalprice,
			String productname, String pimgstored, String name, String phone, String postno, String address,
			String detailaddress, String recipient, String reciphone) {
		super();
		this.orderno = orderno;
		this.price = price;
		this.productno = productno;
		this.userno = userno;
		this.amount = amount;
		this.totalprice = totalprice;
		this.productname = productname;
		this.pimgstored = pimgstored;
		this.name = name;
		this.phone = phone;
		this.postno = postno;
		this.address = address;
		this.detailaddress = detailaddress;
		this.recipient = recipient;
		this.reciphone = reciphone;
	}


	@Override
	public String toString() {
		return "AniOrder [orderno=" + orderno + ", price=" + price + ", productno=" + productno + ", userno=" + userno
				+ ", amount=" + amount + ", totalprice=" + totalprice + ", productname=" + productname + ", pimgstored="
				+ pimgstored + ", name=" + name + ", phone=" + phone + ", postno=" + postno + ", address=" + address
				+ ", detailaddress=" + detailaddress + ", recipient=" + recipient + ", reciphone=" + reciphone + "]";
	}


	public String getOrderno() {
		return orderno;
	}


	public void setOrderno(String orderno) {
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


	public String getProductname() {
		return productname;
	}


	public void setProductname(String productname) {
		this.productname = productname;
	}


	public String getPimgstored() {
		return pimgstored;
	}


	public void setPimgstored(String pimgstored) {
		this.pimgstored = pimgstored;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
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


	public String getRecipient() {
		return recipient;
	}


	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}


	public String getReciphone() {
		return reciphone;
	}


	public void setReciphone(String reciphone) {
		this.reciphone = reciphone;
	}


	

	


	
	
	


	
	
	

}
