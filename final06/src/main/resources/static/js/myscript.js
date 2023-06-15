//대관신청 유효성 검사
function rentCheck() {
		//1) 대관일자선택
		//2) 대관목적
		let rent_per=document.getElementById("rent_per").value;
		rent_per=rent_per.trim();
		if(rent_per.length<2){
			alert("대관목적을 2글자이상 입력해주세요.");
			document.getElementById("rent_per").focus();
			return false;
		}//if end
		
		//3) 단체명
		let rent_group=document.getElementById("rent_group").value;
		rent_group=rent_group.trim();
		if(rent_group.length<1){
			alert("단체명을 입력해주세요.");
			document.getElementById("rent_group").focus();
			return false;
		}
		
		//4) 담당자 성함
		let rent_name=document.getElementById("rent_name").value;
		rent_name=rent_name.trim();
		if(rent_name.length<2){
			alert("성함을 2글자이상 입력해주세요.");
			document.getElementById("rent_name").focus();
			return false;
		}//if end
		
		//5) 연락처
		let rent_phone=document.getElementById("rent_phone").value;
		rent_phone=rent_phone.trim();
		if(!(rent_phone.length==1)){
			alert("연락처 11자리를 입력해주세요.");
			document.getElementById("rent_phone").focus();
			return false;
		}
		
		//6) 이메일 주소
		let rent_email=document.getElementById("rent_email").value;
		rent_email=rent_email.trim();
		if(rent_email.length<5){
		    alert("이메일 5글자 이상 입력해 주세요");
		    document.getElementById("rent_email").focus();
		    return false;
		}//if end
		
		//7) 개인정보 수집동의
		if(document.getElementById("agreement").checked==true){
			return true;
		}else{
			alert("약관에 동의한 후 대관신청이 가능합니다.");
			return false;
		}//if end
		return true; //서버로 전송
		}//rentCheck() end
