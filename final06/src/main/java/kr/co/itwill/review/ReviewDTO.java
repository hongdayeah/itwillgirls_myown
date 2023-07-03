package kr.co.itwill.review;

public class ReviewDTO {
	private int rev_no;
	private String rev_con;
	private String rev_regdt;
	private String p_id;
	private String pro_obj;
	private String p_passwd;
	
	public ReviewDTO() {}

	public int getRev_no() {
		return rev_no;
	}

	public void setRev_no(int rev_no) {
		this.rev_no = rev_no;
	}

	public String getRev_con() {
		return rev_con;
	}

	public void setRev_con(String rev_con) {
		this.rev_con = rev_con;
	}

	public String getRev_regdt() {
		return rev_regdt;
	}

	public void setRev_regdt(String rev_regdt) {
		this.rev_regdt = rev_regdt;
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	public String getPro_obj() {
		return pro_obj;
	}

	public void setPro_obj(String pro_obj) {
		this.pro_obj = pro_obj;
	}

	public String getP_passwd() {
		return p_passwd;
	}

	public void setP_passwd(String p_passwd) {
		this.p_passwd = p_passwd;
	}

	@Override
	public String toString() {
		return "ReviewDTO [rev_no=" + rev_no + ", rev_con=" + rev_con + ", rev_regdt=" + rev_regdt + ", p_id=" + p_id
				+ ", pro_obj=" + pro_obj + ", p_passwd=" + p_passwd + "]";
	}
}//class end
