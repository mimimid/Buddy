package web.dto;

public class Nlike {

	private int blikeno;
	private int boardno;
	private String userno;
	
	public int getBlikeno() {
		return blikeno;
	}
	public void setBlikeno(int blikeno) {
		this.blikeno = blikeno;
	}
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public String getUserno() {
		return userno;
	}
	public void setUserno(String userno) {
		this.userno = userno;
	}
	
	@Override
	public String toString() {
		return "Blike [blikeno=" + blikeno + ", boardno=" + boardno + ", userno=" + userno + "]";
	}
	
	public Nlike(int blikeno, int boardno, String userno) {
		super();
		this.blikeno = blikeno;
		this.boardno = boardno;
		this.userno = userno;
	}
	
	public Nlike() {
		super();
	}
	
	
	
}
