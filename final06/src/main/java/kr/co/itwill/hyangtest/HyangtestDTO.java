package kr.co.itwill.hyangtest;

public class HyangtestDTO {

	private int htest_no;
	private String htest_name;
	private int htest_code;
	
	public HyangtestDTO() {}

	public int getHtest_no() {
		return htest_no;
	}

	public void setHtest_no(int htest_no) {
		this.htest_no = htest_no;
	}

	public String getHtest_name() {
		return htest_name;
	}

	public void setHtest_name(String htest_name) {
		this.htest_name = htest_name;
	}

	public int getHtest_code() {
		return htest_code;
	}

	public void setHtest_code(int htest_code) {
		this.htest_code = htest_code;
	}

	@Override
	public String toString() {
		return "HyangtestDTO [htest_no=" + htest_no + ", htest_name=" + htest_name + ", htest_code=" + htest_code + "]";
	}
}//class end
