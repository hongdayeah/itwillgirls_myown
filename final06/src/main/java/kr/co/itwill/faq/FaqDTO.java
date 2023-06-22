package kr.co.itwill.faq;

public class FaqDTO {

	private int f_no;
	private String f_cate;
	private String f_question;
	private String f_answer;
	
	public FaqDTO() {}

	public int getF_no() {
		return f_no;
	}

	public void setF_no(int f_no) {
		this.f_no = f_no;
	}

	public String getF_cate() {
		return f_cate;
	}

	public void setF_cate(String f_cate) {
		this.f_cate = f_cate;
	}

	public String getF_question() {
		return f_question;
	}

	public void setF_question(String f_question) {
		this.f_question = f_question;
	}

	public String getF_answer() {
		return f_answer;
	}

	public void setF_answer(String f_answer) {
		this.f_answer = f_answer;
	}

	@Override
	public String toString() {
		return "faqDTO [f_no=" + f_no + ", f_cate=" + f_cate + ", f_question=" + f_question + ", f_answer=" + f_answer
				+ "]";
	}
	
	
}
