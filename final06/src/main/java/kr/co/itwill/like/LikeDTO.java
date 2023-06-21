package kr.co.itwill.like;


public class LikeDTO {
	private int like_no;		//시퀀스
	private String pro_obj;		//프로그램 코드
	private String p_id;		//아이디
	
	public LikeDTO() {}

	public int getLike_no() {
		return like_no;
	}

	public void setLike_no(int like_no) {
		this.like_no = like_no;
	}

	public String getPro_obj() {
		return pro_obj;
	}

	public void setPro_obj(String pro_obj) {
		this.pro_obj = pro_obj;
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	@Override
	public String toString() {
		return "LikeDTO [like_no=" + like_no + ", pro_obj=" + pro_obj + ", p_id=" + p_id + "]";
	}
	
}//class end
