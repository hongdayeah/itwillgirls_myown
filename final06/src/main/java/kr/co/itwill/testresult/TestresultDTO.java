package kr.co.itwill.testresult;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

public class TestresultDTO {
	
	private String p_id;
	private String k_name;
	private String typename;
	
	public TestresultDTO() {}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	public String getK_name() {
		return k_name;
	}

	public void setK_name(String k_name) {
		this.k_name = k_name;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	@Override
	public String toString() {
		return "TestresultDTO [p_id=" + p_id + ", k_name=" + k_name + ", typename=" + typename + "]";
	}
	
}//class end
