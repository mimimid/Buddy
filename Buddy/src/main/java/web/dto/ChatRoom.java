package web.dto;

public class ChatRoom {
	
	private int chatroomno;
	private String createUser;
	private String anotherUser;
	private String chatroomName;
	
	public int getChatroomno() {
		return chatroomno;
	}
	public void setChatroomno(int chatroom_no) {
		this.chatroomno = chatroom_no;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public String getAnotherUser() {
		return anotherUser;
	}
	public void setAnotherUser(String anotherUser) {
		this.anotherUser = anotherUser;
	}
	public String getChatroomName() {
		return chatroomName;
	}
	public void setChatroomName(String chatroomName) {
		this.chatroomName = chatroomName;
	}
	@Override
	public String toString() {
		return "ChatRoom [chatroomno=" + chatroomno + ", createUser=" + createUser + ", anotherUser=" + anotherUser
				+ ", chatroomName=" + chatroomName + "]";
	}
	public ChatRoom(int chatroomno, String createUser, String anotherUser, String chatroomName) {
		super();
		this.chatroomno = chatroomno;
		this.createUser = createUser;
		this.anotherUser = anotherUser;
		this.chatroomName = chatroomName;
	}
	public ChatRoom() {
		super();
	}
	
	

}
