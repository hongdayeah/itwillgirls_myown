package kr.co.itwill.rent;

public class RentDTO {

	private String rent_code;
	private String rent_date;
	private String rent_per;
	private String rent_group;
	private String rent_name;
	private String rent_phone;
	private String rent_email;
	private String class_code;
	private String rent2_date;
	private String rent_form;
	
	public RentDTO() {}

	public String getRent_code() {
		return rent_code;
	}

	public void setRent_code(String rent_code) {
		this.rent_code = rent_code;
	}

	public String getRent_date() {
		return rent_date;
	}

	public void setRent_date(String rent_date) {
		this.rent_date = rent_date;
	}

	public String getRent_per() {
		return rent_per;
	}

	public void setRent_per(String rent_per) {
		this.rent_per = rent_per;
	}

	public String getRent_group() {
		return rent_group;
	}

	public void setRent_group(String rent_group) {
		this.rent_group = rent_group;
	}

	public String getRent_name() {
		return rent_name;
	}

	public void setRent_name(String rent_name) {
		this.rent_name = rent_name;
	}

	public String getRent_phone() {
		return rent_phone;
	}

	public void setRent_phone(String rent_phone) {
		this.rent_phone = rent_phone;
	}

	public String getRent_email() {
		return rent_email;
	}

	public void setRent_email(String rent_email) {
		this.rent_email = rent_email;
	}

	public String getClass_code() {
		return class_code;
	}

	public void setClass_code(String class_code) {
		this.class_code = class_code;
	}

	public String getRent2_date() {
		return rent2_date;
	}

	public void setRent2_date(String rent2_date) {
		this.rent2_date = rent2_date;
	}

	public String getRent_form() {
		return rent_form;
	}

	public void setRent_form(String rent_form) {
		this.rent_form = rent_form;
	}

	@Override
	public String toString() {
		return "RentDTO [rent_code=" + rent_code + ", rent_date=" + rent_date + ", rent_per=" + rent_per
				+ ", rent_group=" + rent_group + ", rent_name=" + rent_name + ", rent_phone=" + rent_phone
				+ ", rent_email=" + rent_email + ", class_code=" + class_code + ", rent2_date=" + rent2_date
				+ ", rent_form=" + rent_form + "]";
	}
	
}
