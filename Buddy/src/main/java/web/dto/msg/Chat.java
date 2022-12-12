package web.dto.msg;

public class Chat {
	
	private int chatno;
	private String recv;
	private String sent;
	private String msg;
	private int chatroomno;
	private MessageType type;
	
	public enum MessageType {
		ENTER, OUT, TALK;
	}
	
	
	public Chat() {
		super();
	}


	public int getChatno() {
		return chatno;
	}


	public void setChatno(int chatno) {
		this.chatno = chatno;
	}


	public String getRecv() {
		return recv;
	}


	public void setRecv(String recv) {
		this.recv = recv;
	}


	public String getSent() {
		return sent;
	}


	public void setSent(String sent) {
		this.sent = sent;
	}


	public String getMsg() {
		return msg;
	}


	public void setMsg(String msg) {
		this.msg = msg;
	}


	public int getChatroomno() {
		return chatroomno;
	}


	public void setChatroomno(int chatroomno) {
		this.chatroomno = chatroomno;
	}


	public MessageType getType() {
		return type;
	}


	public void setType(MessageType type) {
		this.type = type;
	}


	public Chat(int chatno, String recv, String sent, String msg, int chatroomno, MessageType type) {
		super();
		this.chatno = chatno;
		this.recv = recv;
		this.sent = sent;
		this.msg = msg;
		this.chatroomno = chatroomno;
		this.type = type;
	}


}
