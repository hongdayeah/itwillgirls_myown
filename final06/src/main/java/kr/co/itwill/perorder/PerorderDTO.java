package kr.co.itwill.perorder;

public class PerorderDTO {

	private String order_perdetailno;
	private int per_fee;
	private String seat_no;
	private String order_no;
	private String per_code;
	private String per_name;
	private int per_cnt;
	private String p_id;
	
	public PerorderDTO() {}

	public String getOrder_perdetailno() {
		return order_perdetailno;
	}

	public void setOrder_perdetailno(String order_perdetailno) {
		this.order_perdetailno = order_perdetailno;
	}

	public int getPer_fee() {
		return per_fee;
	}

	public void setPer_fee(int per_fee) {
		this.per_fee = per_fee;
	}

	public String getSeat_no() {
		return seat_no;
	}

	public void setSeat_no(String seat_no) {
		this.seat_no = seat_no;
	}

	public String getOrder_no() {
		return order_no;
	}

	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}

	public String getPer_code() {
		return per_code;
	}

	public void setPer_code(String per_code) {
		this.per_code = per_code;
	}

	public String getPer_name() {
		return per_name;
	}

	public void setPer_name(String per_name) {
		this.per_name = per_name;
	}

	public int getPer_cnt() {
		return per_cnt;
	}

	public void setPer_cnt(int per_cnt) {
		this.per_cnt = per_cnt;
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	@Override
	public String toString() {
		return "PerorderDTO [order_perdetailno=" + order_perdetailno + ", per_fee=" + per_fee + ", seat_no=" + seat_no
				+ ", order_no=" + order_no + ", per_code=" + per_code + ", per_name=" + per_name + ", per_cnt="
				+ per_cnt + ", p_id=" + p_id + "]";
	}
}//class end
