package kr.co.itwill.performance;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class PerformanceDTO {
 
	private String per_code;
	private String per_name;
	private String per_date;
	private String per_time;
	private int	   per_fee;
	private String per_exp;
	private String per_img;
	private long   per_size;
	private String per_filename;
	private String class_code;
	private int per_limit;
	private String per_img2;
	private long   per_size2;
	private String per_timedetail;
	
	public PerformanceDTO() {}
	
	///////////////////////////////////////////////
	//첨부된 파일 저장하기 위해 
	
	//1)스프링 파일 객체 멤버변수 선언
    //<input type='file' name='per_imgMF'>
    private MultipartFile per_imgMF;
    private MultipartFile per_imgMFD;

    //2)getter와 setter함수 작성

	public MultipartFile getPer_imgMF() {
		return per_imgMF;
	}
	
	public void setPer_imgMF(MultipartFile per_imgMF) {
		this.per_imgMF = per_imgMF;
	}
	
	public MultipartFile getPer_imgMFD() {
		return per_imgMFD;
	}

	public void setPer_imgMFD(MultipartFile per_imgMFD) {
		this.per_imgMFD = per_imgMFD;
	}


	
	///////////////////////////////////////////////////////////// 
	
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
	public String getPer_date() {
		return per_date;
	}
	public void setPer_date(String per_date) {
		this.per_date = per_date;
	}
	public String getPer_time() {
		return per_time;
	}
	public void setPer_time(String per_time) {
		this.per_time = per_time;
	}
	public int getPer_fee() {
		return per_fee;
	}
	public void setPer_fee(int per_fee) {
		this.per_fee = per_fee;
	}
	public String getPer_exp() {
		return per_exp;
	}
	public void setPer_exp(String per_exp) {
		this.per_exp = per_exp;
	}
	public String getPer_img() {
		return per_img;
	}
	public void setPer_img(String per_img) {
		this.per_img = per_img;
	}
	public long getPer_size() {
		return per_size;
	}
	public void setPer_size(long per_size) {
		this.per_size = per_size;
	}
	public String getPer_filename() {
		return per_filename;
	}
	public void setPer_filename(String per_filename) {
		this.per_filename = per_filename;
	}
	public String getClass_code() {
		return class_code;
	}
	public void setClass_code(String class_code) {
		this.class_code = class_code;
	}
	public int getPer_limit() {
		return per_limit;
	}
	public void setPer_limit(int per_limit) {
		this.per_limit = per_limit;
	}

	public String getPer_img2() {
		return per_img2;
	}

	public void setPer_img2(String per_img2) {
		this.per_img2 = per_img2;
	}

	public long getPer_size2() {
		return per_size2;
	}

	public void setPer_size2(long per_size2) {
		this.per_size2 = per_size2;
	}

	public String getPer_timedetail() {
		return per_timedetail;
	}

	public void setPer_timedetail(String per_timedetail) {
		this.per_timedetail = per_timedetail;
	}

	@Override
	public String toString() {
		return "PerformanceDTO [per_code=" + per_code + ", per_name=" + per_name + ", per_date=" + per_date
				+ ", per_time=" + per_time + ", per_fee=" + per_fee + ", per_exp=" + per_exp + ", per_img=" + per_img
				+ ", per_size=" + per_size + ", per_filename=" + per_filename + ", class_code=" + class_code
				+ ", per_limit=" + per_limit + ", per_img2=" + per_img2 + ", per_size2=" + per_size2
				+ ", per_timedetail=" + per_timedetail + ", per_imgMF=" + per_imgMF + ", per_imgMFD=" + per_imgMFD
				+ "]";
	}


	
	
	
	
   
    
	
	
}
