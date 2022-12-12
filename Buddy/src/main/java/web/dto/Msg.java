package web.dto;

import java.util.Date;

public class Msg {
	
	private int msgno;
	private String recv;
	private String sent;
	private String content;
	private Date sentDate;
	
	public int getNo() {
		return msgno;
	}
	public void setNo(int no) {
		this.msgno = no;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getSentDate() {
		return sentDate;
	}
	public void setSentDate(Date sentDate) {
		this.sentDate = sentDate;
	}
	@Override
	public String toString() {
		return "Msg [no=" + msgno + ", recv=" + recv + ", sent=" + sent + ", content=" + content + ", sentDate=" + sentDate
				+ "]";
	}
	public Msg(int no, String recv, String sent, String content, Date sentDate) {
		super();
		this.msgno = no;
		this.recv = recv;
		this.sent = sent;
		this.content = content;
		this.sentDate = sentDate;
	}
	public Msg() {
		super();
	}
	
	

}
