package kr.co.itwill.qna;

public class QnaDTO {

	private int q_no;
	private String q_sub;
	private String q_con;
	private String q_regdt;
	private int q_grpno;
	private int q_indent;
	private int q_ansnu;
	private String p_id;
	public int getQ_no() {
		return q_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	public String getQ_sub() {
		return q_sub;
	}
	public void setQ_sub(String q_sub) {
		this.q_sub = q_sub;
	}
	public String getQ_con() {
		return q_con;
	}
	public void setQ_con(String q_con) {
		this.q_con = q_con;
	}
	public String getQ_regdt() {
		return q_regdt;
	}
	public void setQ_regdt(String q_regdt) {
		this.q_regdt = q_regdt;
	}
	public int getQ_grpno() {
		return q_grpno;
	}
	public void setQ_grpno(int q_grpno) {
		this.q_grpno = q_grpno;
	}
	public int getQ_indent() {
		return q_indent;
	}
	public void setQ_indent(int q_indent) {
		this.q_indent = q_indent;
	}
	public int getQ_ansnu() {
		return q_ansnu;
	}
	public void setQ_ansnu(int q_ansnu) {
		this.q_ansnu = q_ansnu;
	}
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	@Override
	public String toString() {
		return "QnaDTO [q_no=" + q_no + ", q_sub=" + q_sub + ", q_con=" + q_con + ", q_regdt=" + q_regdt + ", q_grpno="
				+ q_grpno + ", q_indent=" + q_indent + ", q_ansnu=" + q_ansnu + ", p_id=" + p_id + "]";
	}
	
	
	
}
