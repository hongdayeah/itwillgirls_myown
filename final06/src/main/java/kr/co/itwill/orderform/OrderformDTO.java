package kr.co.itwill.orderform;

public class OrderformDTO {

	private int order_no;
	private int tot_price;
	private int order_cnt;
	private String payc;
	private String p_id;
	
	public OrderformDTO() {}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

	public int getTot_price() {
		return tot_price;
	}

	public void setTot_price(int tot_price) {
		this.tot_price = tot_price;
	}

	public int getOrder_cnt() {
		return order_cnt;
	}

	public void setOrder_cnt(int order_cnt) {
		this.order_cnt = order_cnt;
	}

	public String getPayc() {
		return payc;
	}

	public void setPayc(String payc) {
		this.payc = payc;
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	@Override
	public String toString() {
		return "OrderformDTO [order_no=" + order_no + ", tot_price=" + tot_price + ", order_cnt=" + order_cnt
				+ ", payc=" + payc + ", p_id=" + p_id + "]";
	}
}//class end
