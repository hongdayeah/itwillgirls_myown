package kr.co.itwill.cart;

public class CartDTO {
	
	private int		cart_no;
	private String 	seat_no;
	private String 	p_id;
	private String	pro_code;
	private String 	per_code;
	private int 	k_no;
	private int  pro_cnt;
	
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

	public int getPro_cnt() {
		return pro_cnt;
	}

	public void setPro_cnt(int pro_cnt) {
		this.pro_cnt = pro_cnt;
	}

	@Override
	public String toString() {
		return "CartDTO [cart_no=" + cart_no + ", seat_no=" + seat_no + ", p_id=" + p_id + ", pro_code=" + pro_code
				+ ", per_code=" + per_code + ", k_no=" + k_no + ", pro_cnt=" + pro_cnt + "]";
	}
}//class end
