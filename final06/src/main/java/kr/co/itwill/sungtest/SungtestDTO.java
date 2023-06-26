package kr.co.itwill.sungtest;

public class SungtestDTO {

	private int stest_no;
	private String stest_name;
	private int stest_code;
	
	public SungtestDTO() {}

	public int getStest_no() {
		return stest_no;
	}

	public void setStest_no(int stest_no) {
		this.stest_no = stest_no;
	}

	public String getStest_name() {
		return stest_name;
	}

	public void setStest_name(String stest_name) {
		this.stest_name = stest_name;
	}

	public int getStest_code() {
		return stest_code;
	}

	public void setStest_code(int stest_code) {
		this.stest_code = stest_code;
	}

	@Override
	public String toString() {
		return "SungtestDTO [stest_no=" + stest_no + ", stest_name=" + stest_name + ", stest_code=" + stest_code + "]";
	}
	
}//class end
