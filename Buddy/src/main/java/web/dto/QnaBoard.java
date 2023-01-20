package web.dto;

import java.util.Date;

public class QnaBoard {
	
	private int qnaNo;
	private int userno;
	private int qnaCateNo;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaWriteDate;
	private int qnaCkNo;
	
	//조인테이블컬럼
	private String qnaCateName;
	
	public QnaBoard() {}

	public QnaBoard(int qnaNo, int userno, int qnaCateNo, String qnaTitle, String qnaContent, Date qnaWriteDate,
			int qnaCkNo, String qnaCateName) {
		super();
		this.qnaNo = qnaNo;
		this.userno = userno;
		this.qnaCateNo = qnaCateNo;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaWriteDate = qnaWriteDate;
		this.qnaCkNo = qnaCkNo;
		this.qnaCateName = qnaCateName;
	}

	@Override
	public String toString() {
		return "QnaBoard [qnaNo=" + qnaNo + ", userno=" + userno + ", qnaCateNo=" + qnaCateNo + ", qnaTitle=" + qnaTitle
				+ ", qnaContent=" + qnaContent + ", qnaWriteDate=" + qnaWriteDate + ", qnaCkNo=" + qnaCkNo
				+ ", qnaCateName=" + qnaCateName + "]";
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public int getQnaCateNo() {
		return qnaCateNo;
	}

	public void setQnaCateNo(int qnaCateNo) {
		this.qnaCateNo = qnaCateNo;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public Date getQnaWriteDate() {
		return qnaWriteDate;
	}

	public void setQnaWriteDate(Date qnaWriteDate) {
		this.qnaWriteDate = qnaWriteDate;
	}

	public int getQnaCkNo() {
		return qnaCkNo;
	}

	public void setQnaCkNo(int qnaCkNo) {
		this.qnaCkNo = qnaCkNo;
	}

	public String getQnaCateName() {
		return qnaCateName;
	}

	public void setQnaCateName(String qnaCateName) {
		this.qnaCateName = qnaCateName;
	}
	
}
