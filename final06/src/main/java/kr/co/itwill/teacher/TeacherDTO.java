package kr.co.itwill.teacher;

import org.springframework.web.multipart.MultipartFile;

public class TeacherDTO {
	private String t_code;
	private String t_name;
	private String t_phone;
	private String t_birth;
	private int t_gender;
	private String t_photo;
	private long t_photosize;
	
	public TeacherDTO() {}
	//첨부된 파일을 저장하기 위해 (createForm.jsp 참조)
	
	//1)스프링 파일 객체 멤버변수 선언
	//<input type='file' name='t_photoMF'>
	private MultipartFile t_photoMF;
	
	//2)getter와 setter함수 작성
	public MultipartFile getT_photoMF() {
		return t_photoMF;
	}

	public void setT_photoMF(MultipartFile t_photoMF) {
		this.t_photoMF = t_photoMF;
	}
	/////////////////////////////////////////

	public String getT_code() {
		return t_code;
	}

	public void setT_code(String t_code) {
		this.t_code = t_code;
	}

	public String getT_name() {
		return t_name;
	}

	public void setT_name(String t_name) {
		this.t_name = t_name;
	}

	public String getT_phone() {
		return t_phone;
	}

	public void setT_phone(String t_phone) {
		this.t_phone = t_phone;
	}

	public String getT_birth() {
		return t_birth;
	}

	public void setT_birth(String t_birth) {
		this.t_birth = t_birth;
	}

	public int getT_gender() {
		return t_gender;
	}

	public void setT_gender(int t_gender) {
		this.t_gender = t_gender;
	}

	public String getT_photo() {
		return t_photo;
	}

	public void setT_photo(String t_photo) {
		this.t_photo = t_photo;
	}

	public long getT_photosize() {
		return t_photosize;
	}

	public void setT_photosize(long t_photosize) {
		this.t_photosize = t_photosize;
	}

	@Override
	public String toString() {
		return "TeacherDTO [t_code=" + t_code + ", t_name=" + t_name + ", t_phone=" + t_phone + ", t_birth=" + t_birth
				+ ", t_gender=" + t_gender + ", t_photo=" + t_photo + ", t_photosize=" + t_photosize + ", t_photoMF="
				+ t_photoMF + "]";
	}
}
