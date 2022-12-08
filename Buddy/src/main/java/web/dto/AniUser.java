package web.dto;

import java.util.Date;

public class AniUser {
	
	private int userno;
	private String userid;
	private String userpw;
	private String username;
	private String birth;
	private String phone;
	private String usernick;
	private String postno;
	private String gender;
	private String email;
	private String address;
	private String detailaddress;
	private String grade;
	private String imgorigin;
	
	public AniUser() {}

	public AniUser(int userno, String userid, String userpw, String username, String birth, String phone,
			String usernick, String postno, String gender, String email, String address, String detailaddress,
			String grade, String imgorigin) {
		super();
		this.userno = userno;
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.birth = birth;
		this.phone = phone;
		this.usernick = usernick;
		this.postno = postno;
		this.gender = gender;
		this.email = email;
		this.address = address;
		this.detailaddress = detailaddress;
		this.grade = grade;
		this.imgorigin = imgorigin;
	}

	@Override
	public String toString() {
		return "AniUser [userno=" + userno + ", userid=" + userid + ", userpw=" + userpw + ", username=" + username
				+ ", birth=" + birth + ", phone=" + phone + ", usernick=" + usernick + ", postno=" + postno
				+ ", gender=" + gender + ", email=" + email + ", address=" + address + ", detailaddress="
				+ detailaddress + ", grade=" + grade + ", imgorigin=" + imgorigin + "]";
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUsernick() {
		return usernick;
	}

	public void setUsernick(String usernick) {
		this.usernick = usernick;
	}

	public String getPostno() {
		return postno;
	}

	public void setPostno(String postno) {
		this.postno = postno;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getImgorigin() {
		return imgorigin;
	}

	public void setImgorigin(String imgorigin) {
		this.imgorigin = imgorigin;
	}

	
	
	
	
	

}
