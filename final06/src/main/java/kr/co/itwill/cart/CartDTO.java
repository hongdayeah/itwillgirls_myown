package kr.co.itwill.cart;

public class CartDTO {
	
	private int		cart_no;
	private String 	seat_no;
	private String 	p_id;
	private String	pro_code;
	private String 	per_code;
	private int 	k_no;
	private int  cart_cnt;
	private int cart_price;
	private String pro_name;
	private String per_name;
	private String order_no;
	
	public CartDTO() {}

	public int getCart_no() {
		return cart_no;
	}

	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}

	public String getSeat_no() {
		return seat_no;
	}

	public void setSeat_no(String seat_no) {
		this.seat_no = seat_no;
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	public String getPro_code() {
		return pro_code;
	}

	public void setPro_code(String pro_code) {
		this.pro_code = pro_code;
	}

	public String getPer_code() {
		return per_code;
	}

	public void setPer_code(String per_code) {
		this.per_code = per_code;
	}

	public int getK_no() {
		return k_no;
	}

	public void setK_no(int k_no) {
		this.k_no = k_no;
	}

	public int getCart_cnt() {
		return cart_cnt;
	}

	public void setCart_cnt(int cart_cnt) {
		this.cart_cnt = cart_cnt;
	}

	public int getCart_price() {
		return cart_price;
	}

	public void setCart_price(int cart_price) {
		this.cart_price = cart_price;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public String getPer_name() {
		return per_name;
	}

	public void setPer_name(String per_name) {
		this.per_name = per_name;
	}

	public String getOrder_no() {
		return order_no;
	}

	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}

	@Override
	public String toString() {
		return "CartDTO [cart_no=" + cart_no + ", seat_no=" + seat_no + ", p_id=" + p_id + ", pro_code=" + pro_code
				+ ", per_code=" + per_code + ", k_no=" + k_no + ", cart_cnt=" + cart_cnt + ", cart_price=" + cart_price
				+ ", pro_name=" + pro_name + ", per_name=" + per_name + ", order_no=" + order_no + "]";
	}
}//class end
