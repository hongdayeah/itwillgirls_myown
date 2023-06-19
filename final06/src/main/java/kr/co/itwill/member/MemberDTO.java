package kr.co.itwill.member;

public class MemberDTO {

	private String p_id;
	private String p_passwd;
	private String p_name;
	private String p_birth;
	private int p_gender;
	private String p_tell;
	private String p_addr1;
	private String p_addr2;
	private String p_grade;
	private String p_date;
	
	public MemberDTO() {}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	public String getP_passwd() {
		return p_passwd;
	}

	public void setP_passwd(String p_passwd) {
		this.p_passwd = p_passwd;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_birth() {
		return p_birth;
	}

	public void setP_birth(String p_birth) {
		this.p_birth = p_birth;
	}

	public int getP_gender() {
		return p_gender;
	}

	public void setP_gender(int p_gender) {
		this.p_gender = p_gender;
	}

	public String getP_tell() {
		return p_tell;
	}

	public void setP_tell(String p_tell) {
		this.p_tell = p_tell;
	}

	public String getP_addr1() {
		return p_addr1;
	}

	public void setP_addr1(String p_addr1) {
		this.p_addr1 = p_addr1;
	}

	public String getP_addr2() {
		return p_addr2;
	}

	public void setP_addr2(String p_addr2) {
		this.p_addr2 = p_addr2;
	}

	public String getP_grade() {
		return p_grade;
	}

	public void setP_grade(String p_grade) {
		this.p_grade = p_grade;
	}

	public String getP_date() {
		return p_date;
	}

	public void setP_date(String p_date) {
		this.p_date = p_date;
	}

	@Override
	public String toString() {
		return "MemberDTO [p_id=" + p_id + ", p_passwd=" + p_passwd + ", p_name=" + p_name + ", p_birth=" + p_birth
				+ ", p_gender=" + p_gender + ", p_tell=" + p_tell + ", p_addr1=" + p_addr1 + ", p_addr2=" + p_addr2
				+ ", p_grade=" + p_grade + ", p_date=" + p_date + "]";
	}

}//class end
