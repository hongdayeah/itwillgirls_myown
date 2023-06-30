package kr.co.itwill.program;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class ProgramDTO {
	private String obj_code; 	//프로그램 구분(A,S,E,M)
	private String pro_obj; 	//프로그램 코드
	private String pro_name;	//프로그램 명
	private String prochar_no;	//성향정보
	private int pro_limit;		//정원
	private int pro_fee;		//수강료
	private String prorec_start;//접수시작
	private String prorec_end;	//접수종료
	private String proper_start;//수강시작
	private String proper_end;	//수강종료
	private String pro_day;		//수강요일
	private String pro_age;		//대상
	private String pro_exp;		//설명
	private String pro_poster;	//썸네일
	private String pro_img;		//설명이미지
	private String pro_regdate;	//등록일
	private int pro_readcnt;	//조회수
	
	public ProgramDTO() {}

	/////////////////////////////////////////////////
	//첨부된 파일을 저장하기 위해 
	//1) 스프링 파일 객체 멤버변수 선언
	//<input type='file' name='posterMF'>
	private MultipartFile pro_posterMF;
	//<input type='file' name='filenameMF'>
	private MultipartFile pro_imgMF;
	
	//2) getter setter 함수 선언
	public MultipartFile getPro_posterMF() {
		return pro_posterMF;
	}

	public void setPro_posterMF(MultipartFile pro_posterMF) {
		this.pro_posterMF = pro_posterMF;
	}

	public MultipartFile getPro_imgMF() {
		return pro_imgMF;
	}

	public void setPro_imgMF(MultipartFile pro_imgMF) {
		this.pro_imgMF = pro_imgMF;
	}
	/////////////////////////////////////////////////

	public String getObj_code() {
		return obj_code;
	}

	public void setObj_code(String obj_code) {
		this.obj_code = obj_code;
	}

	public String getPro_obj() {
		return pro_obj;
	}

	public void setPro_obj(String pro_obj) {
		this.pro_obj = pro_obj;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public String getProchar_no() {
		return prochar_no;
	}

	public void setProchar_no(String prochar_no) {
		this.prochar_no = prochar_no;
	}

	public int getPro_limit() {
		return pro_limit;
	}

	public void setPro_limit(int pro_limit) {
		this.pro_limit = pro_limit;
	}

	public int getPro_fee() {
		return pro_fee;
	}

	public void setPro_fee(int pro_fee) {
		this.pro_fee = pro_fee;
	}

	public String getProrec_start() {
		return prorec_start;
	}

	public void setProrec_start(String prorec_start) {
		this.prorec_start = prorec_start;
	}

	public String getProrec_end() {
		return prorec_end;
	}

	public void setProrec_end(String prorec_end) {
		this.prorec_end = prorec_end;
	}

	public String getProper_start() {
		return proper_start;
	}

	public void setProper_start(String proper_start) {
		this.proper_start = proper_start;
	}

	public String getProper_end() {
		return proper_end;
	}

	public void setProper_end(String proper_end) {
		this.proper_end = proper_end;
	}

	public String getPro_day() {
		return pro_day;
	}

	public void setPro_day(String pro_day) {
		this.pro_day = pro_day;
	}

	public String getPro_age() {
		return pro_age;
	}

	public void setPro_age(String pro_age) {
		this.pro_age = pro_age;
	}

	public String getPro_exp() {
		return pro_exp;
	}

	public void setPro_exp(String pro_exp) {
		this.pro_exp = pro_exp;
	}

	public String getPro_poster() {
		return pro_poster;
	}

	public void setPro_poster(String pro_poster) {
		this.pro_poster = pro_poster;
	}

	public String getPro_img() {
		return pro_img;
	}

	public void setPro_img(String pro_img) {
		this.pro_img = pro_img;
	}

	public String getPro_regdate() {
		return pro_regdate;
	}

	public void setPro_regdate(String pro_regdate) {
		this.pro_regdate = pro_regdate;
	}

	public int getPro_readcnt() {
		return pro_readcnt;
	}

	public void setPro_readcnt(int pro_readcnt) {
		this.pro_readcnt = pro_readcnt;
	}

	@Override
	public String toString() {
		return "ProgramDTO [obj_code=" + obj_code + ", pro_obj=" + pro_obj + ", pro_name=" + pro_name + ", prochar_no="
				+ prochar_no + ", pro_limit=" + pro_limit + ", pro_fee=" + pro_fee + ", prorec_start=" + prorec_start
				+ ", prorec_end=" + prorec_end + ", proper_start=" + proper_start + ", proper_end=" + proper_end
				+ ", pro_day=" + pro_day + ", pro_age=" + pro_age + ", pro_exp=" + pro_exp + ", pro_poster="
				+ pro_poster + ", pro_img=" + pro_img + ", pro_regdate=" + pro_regdate + ", pro_readcnt=" + pro_readcnt
				+ ", pro_posterMF=" + pro_posterMF + ", pro_imgMF=" + pro_imgMF + "]";
	}

	
}//class end