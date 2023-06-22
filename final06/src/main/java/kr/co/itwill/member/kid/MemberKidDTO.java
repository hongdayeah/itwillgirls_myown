package kr.co.itwill.member.kid;

public class MemberKidDTO {

	private long kno;
	private String k_name;
	private String k_birth;
	private int k_gender;
	private String p_id;
	private String typename;
	
	
	public MemberKidDTO() {}
	
	
	public long getKno() {
		return kno;
	}
	
	public void setKno(long kno) {
		this.kno = kno;
	}
	public String getK_name() {
		return k_name;
	}
	public void setK_name(String k_name) {
		this.k_name = k_name;
	}
	public String getK_birth() {
		return k_birth;
	}
	public void setK_birth(String k_birth) {
		this.k_birth = k_birth;
	}
	public int getK_gender() {
		return k_gender;
	}
	public void setK_gender(int k_gender) {
		this.k_gender = k_gender;
	}
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}

	@Override
	public String toString() {
		return "MemberKidDTO [kno=" + kno + ", k_name=" + k_name + ", k_birth=" + k_birth + ", k_gender=" + k_gender
				+ ", p_id=" + p_id + ", typename=" + typename + "]";
	}
	
}//class end
