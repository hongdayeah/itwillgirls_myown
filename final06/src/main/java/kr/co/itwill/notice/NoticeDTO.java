package kr.co.itwill.notice;

public class NoticeDTO {

	private int not_no;
	private String not_cate;
	private String not_sub;
	private String not_con;
	private String not_regdt;
	private String not_filename;
	
	public NoticeDTO() {}

	public int getNot_no() {
		return not_no;
	}

	public void setNot_no(int not_no) {
		this.not_no = not_no;
	}

	public String getNot_cate() {
		return not_cate;
	}

	public void setNot_cate(String not_cate) {
		this.not_cate = not_cate;
	}

	public String getNot_sub() {
		return not_sub;
	}

	public void setNot_sub(String not_sub) {
		this.not_sub = not_sub;
	}

	public String getNot_con() {
		return not_con;
	}

	public void setNot_con(String not_con) {
		this.not_con = not_con;
	}

	public String getNot_regdt() {
		return not_regdt;
	}

	public void setNot_regdt(String not_regdt) {
		this.not_regdt = not_regdt;
	}

	public String getNot_filename() {
		return not_filename;
	}

	public void setNot_filename(String not_filename) {
		this.not_filename = not_filename;
	}

	@Override
	public String toString() {
		return "NoticeDTO [not_no=" + not_no + ", not_cate=" + not_cate + ", not_sub=" + not_sub + ", not_con="
				+ not_con + ", not_regdt=" + not_regdt + ", not_filename=" + not_filename + "]";
	}
	
	
	
}//class ends
