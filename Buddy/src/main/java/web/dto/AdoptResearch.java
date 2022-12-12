package web.dto;

import java.util.Date;

public class AdoptResearch {
	private int adoptNo;
	private String answer1;
	private String answer2;
	private String answer3;
	private String answer4;
	private String answer5;
	private String answer6;
	private String answer7;
	private String answer8;
	private String checking;
	private int answerHit;
	private Date adoptDate;
	
	public AdoptResearch() {	}

	public AdoptResearch(int adoptNo, String answer1, String answer2, String answer3, String answer4, String answer5,
			String answer6, String answer7, String answer8, String checking, int answerHit, Date adoptDate) {
		super();
		this.adoptNo = adoptNo;
		this.answer1 = answer1;
		this.answer2 = answer2;
		this.answer3 = answer3;
		this.answer4 = answer4;
		this.answer5 = answer5;
		this.answer6 = answer6;
		this.answer7 = answer7;
		this.answer8 = answer8;
		this.checking = checking;
		this.answerHit = answerHit;
		this.adoptDate = adoptDate;
	}

	@Override
	public String toString() {
		return "AdoptResearch [adoptNo=" + adoptNo + ", answer1=" + answer1 + ", answer2=" + answer2 + ", answer3="
				+ answer3 + ", answer4=" + answer4 + ", answer5=" + answer5 + ", answer6=" + answer6 + ", answer7="
				+ answer7 + ", answer8=" + answer8 + ", checking=" + checking + ", answerHit=" + answerHit
				+ ", adoptDate=" + adoptDate + "]";
	}

	public int getAdoptNo() {
		return adoptNo;
	}

	public void setAdoptNo(int adoptNo) {
		this.adoptNo = adoptNo;
	}

	public String getAnswer1() {
		return answer1;
	}

	public void setAnswer1(String answer1) {
		this.answer1 = answer1;
	}

	public String getAnswer2() {
		return answer2;
	}

	public void setAnswer2(String answer2) {
		this.answer2 = answer2;
	}

	public String getAnswer3() {
		return answer3;
	}

	public void setAnswer3(String answer3) {
		this.answer3 = answer3;
	}

	public String getAnswer4() {
		return answer4;
	}

	public void setAnswer4(String answer4) {
		this.answer4 = answer4;
	}

	public String getAnswer5() {
		return answer5;
	}

	public void setAnswer5(String answer5) {
		this.answer5 = answer5;
	}

	public String getAnswer6() {
		return answer6;
	}

	public void setAnswer6(String answer6) {
		this.answer6 = answer6;
	}

	public String getAnswer7() {
		return answer7;
	}

	public void setAnswer7(String answer7) {
		this.answer7 = answer7;
	}

	public String getAnswer8() {
		return answer8;
	}

	public void setAnswer8(String answer8) {
		this.answer8 = answer8;
	}

	public String getChecking() {
		return checking;
	}

	public void setChecking(String checking) {
		this.checking = checking;
	}

	public int getAnswerHit() {
		return answerHit;
	}

	public void setAnswerHit(int answerHit) {
		this.answerHit = answerHit;
	}

	public Date getAdoptDate() {
		return adoptDate;
	}

	public void setAdoptDate(Date adoptDate) {
		this.adoptDate = adoptDate;
	}

}
