package kr.co.itwill.protime;

public class ProtimeDTO {

	private String pro_code;
	private String pro_time;
	private String pro_obj;
	private String class_code;
	private String t_code;
	
	public ProtimeDTO() {}

	public String getPro_code() {
		return pro_code;
	}

	public void setPro_code(String pro_code) {
		this.pro_code = pro_code;
	}

	public String getPro_time() {
		return pro_time;
	}

	public void setPro_time(String pro_time) {
		this.pro_time = pro_time;
	}

	public String getPro_obj() {
		return pro_obj;
	}

	public void setPro_obj(String pro_obj) {
		this.pro_obj = pro_obj;
	}

	public String getClass_code() {
		return class_code;
	}

	public void setClass_code(String class_code) {
		this.class_code = class_code;
	}

	public String getT_code() {
		return t_code;
	}

	public void setT_code(String t_code) {
		this.t_code = t_code;
	}

	@Override
	public String toString() {
		return "ProtimeDTO [pro_code=" + pro_code + ", pro_time=" + pro_time + ", pro_obj=" + pro_obj + ", class_code="
				+ class_code + ", t_code=" + t_code + "]";
	}
	
}//class end
