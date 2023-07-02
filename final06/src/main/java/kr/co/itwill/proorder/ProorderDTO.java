package kr.co.itwill.proorder;

public class ProorderDTO {

	private String order_prodetailno;
	private int pro_fee;
	private String order_no;
	private String pro_obj;
	private int pro_cnt;
	private String pro_name;
	
	public ProorderDTO() {}

	public String getOrder_prodetailno() {
		return order_prodetailno;
	}

	public void setOrder_prodetailno(String order_prodetailno) {
		this.order_prodetailno = order_prodetailno;
	}

	public int getPro_fee() {
		return pro_fee;
	}

	public void setPro_fee(int pro_fee) {
		this.pro_fee = pro_fee;
	}

	public String getOrder_no() {
		return order_no;
	}

	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}

	public String getPro_obj() {
		return pro_obj;
	}

	public void setPro_obj(String pro_obj) {
		this.pro_obj = pro_obj;
	}

	public int getPro_cnt() {
		return pro_cnt;
	}

	public void setPro_cnt(int pro_cnt) {
		this.pro_cnt = pro_cnt;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	@Override
	public String toString() {
		return "ProorderDTO [order_prodetailno=" + order_prodetailno + ", pro_fee=" + pro_fee + ", order_no=" + order_no
				+ ", pro_obj=" + pro_obj + ", pro_cnt=" + pro_cnt + ", pro_name=" + pro_name + "]";
	}
}//class end
