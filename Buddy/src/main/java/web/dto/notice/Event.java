package web.dto.notice;

public class Event {

	private String name;
	private String gift;
	private String address;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGift() {
		return gift;
	}
	public void setGift(String gift) {
		this.gift = gift;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "Event [name=" + name + ", gift=" + gift + ", address=" + address + "]";
	}
	public Event(String name, String gift, String address) {
		super();
		this.name = name;
		this.gift = gift;
		this.address = address;
	}
	public Event() {
		super();
	}
	
	
}
