function CheckAddProduct(){
	
	var productId = document.getElementById("productId");
	var name = document.getElementById("name");
	var unitPrice = document.getElementById("unitPrice");
	var id = document.getElementById("id");
	var password = document.getElementById("password");
	//아이디 체크
	if(!check(/^GAME[a-zA-Z0-9]{1,8}$/, productId,
		"[상품 코드]\nGAME과 숫자를 조합하여 5~12까지 입력하세요.\n첫글자는 반드시 GAME으로 시작하세요."))
		return false;
	
	//상품명 체크
	if(name.value.length < 1 || name.value.length > 30){
		alert("[게임명]\n최소 1자에서 30자까지 입력하세요.");
		name.select();
		name.focus();
		return false;
	}
	
	//상품가격 체크
	if(unitPrice.value.length == 0 || isNaN(unitPrice.value)){
		alert("[가격]\n숫자만 입력하세요.");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}
	

	if(unitPrice.value < 0){
		alert("[가격]\n음수는 입력할 수 없습니다.");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}else if(!check(/^\d+(?:[.]?[\d]?[\d])?$/, unitPrice, "[가격]\n소수점 둘째 자리까지만 입력하세요."))
		return false;
	
	
	
	function check(regExp, e, msg){
		if(regExp.test(e.value))
			return true;
		
		alert(msg);
		e.select();
		e.focus();
		return false;
	}
	document.newProduct.submit()
}