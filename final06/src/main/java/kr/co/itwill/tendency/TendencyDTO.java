package kr.co.itwill.tendency;

public class TendencyDTO {

	private String typename;
	
	public TendencyDTO() {}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	@Override
	public String toString() {
		return "TendencyDTO [typename=" + typename + "]";
	}
	
}//class end
