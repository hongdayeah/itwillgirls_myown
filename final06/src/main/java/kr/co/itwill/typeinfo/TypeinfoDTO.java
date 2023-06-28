package kr.co.itwill.typeinfo;

public class TypeinfoDTO {

	private String typename;
	private String typeanimal;
	private String typeexp;
	private String typespec1;
	private String typespec2;
	private String typespec3;
	private String typespec4;
	
	public TypeinfoDTO() {}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public String getTypeanimal() {
		return typeanimal;
	}

	public void setTypeanimal(String typeanimal) {
		this.typeanimal = typeanimal;
	}

	public String getTypeexp() {
		return typeexp;
	}

	public void setTypeexp(String typeexp) {
		this.typeexp = typeexp;
	}

	public String getTypespec1() {
		return typespec1;
	}

	public void setTypespec1(String typespec1) {
		this.typespec1 = typespec1;
	}

	public String getTypespec2() {
		return typespec2;
	}

	public void setTypespec2(String typespec2) {
		this.typespec2 = typespec2;
	}

	public String getTypespec3() {
		return typespec3;
	}

	public void setTypespec3(String typespec3) {
		this.typespec3 = typespec3;
	}

	public String getTypespec4() {
		return typespec4;
	}

	public void setTypespec4(String typespec4) {
		this.typespec4 = typespec4;
	}

	@Override
	public String toString() {
		return "TypeinfoDTO [typename=" + typename + ", typeanimal=" + typeanimal + ", typeexp=" + typeexp
				+ ", typespec1=" + typespec1 + ", typespec2=" + typespec2 + ", typespec3=" + typespec3 + ", typespec4="
				+ typespec4 + "]";
	}	
}//class end
