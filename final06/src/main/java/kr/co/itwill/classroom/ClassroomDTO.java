package kr.co.itwill.classroom;

import org.springframework.stereotype.Component;

@Component
public class ClassroomDTO {

	private String class_code;
	private String class_name;
	private String class_img;
	private String class_exp;
	private int class_row;
	private int class_column;
	
	public ClassroomDTO() {}

	public String getClass_code() {
		return class_code;
	}

	public void setClass_code(String class_code) {
		this.class_code = class_code;
	}

	public String getClass_name() {
		return class_name;
	}

	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}

	public String getClass_img() {
		return class_img;
	}

	public void setClass_img(String class_img) {
		this.class_img = class_img;
	}

	public String getClass_exp() {
		return class_exp;
	}

	public void setClass_exp(String class_exp) {
		this.class_exp = class_exp;
	}

	public int getClass_row() {
		return class_row;
	}

	public void setClass_row(int class_row) {
		this.class_row = class_row;
	}

	public int getClass_column() {
		return class_column;
	}

	public void setClass_column(int class_column) {
		this.class_column = class_column;
	}

	@Override
	public String toString() {
		return "ClassroomDTO [class_code=" + class_code + ", class_name=" + class_name + ", class_img=" + class_img
				+ ", class_exp=" + class_exp + ", class_row=" + class_row + ", class_column=" + class_column + "]";
	}
}//class end
