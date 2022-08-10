
// 유효성검사 실패 메세지 출력
const printErrSmall = (target, msg) => {
    const msgSmall = document.querySelector(target);
    msgSmall.innerHTML = msg;
    msgSmall.classList.add('failMsg');
    msgSmall.classList.remove('SuccessMsg');
    msgSmall.classList.remove('hide');
};

// 유효성검사결과 메세지 초기화
const resetMsg = (target) => {
	const msgSmall = document.querySelector(target);
	msgSmall.innerHTML = "";
};

// 광고주 등록 신청 유효성검사
if(document.enrollAdvertiserFrm != null){
	document.enrollAdvertiserFrm.onsubmit = () => {
		let result = true;
		
		if(!/^[a-zA-Z가-힣0-9]{5,20}$/.test(bizName.value)) {
			printErrSmall("#bizNameMsg", "광고계정명은 5자 이상 20자 이내의 영문/한글/숫자로 구성되어야합니다.");
			result = false;
		} else resetMsg("#bizNameMsg");
		
		if(bizNoResult.value != "true") {
			printErrSmall("#bizNoMsg", "사업자등록번호 확인이 필요합니다.");
			result = false;
		}
		
		if(upFile.files.length == 0) {
			printErrSmall("#bizImgMsg", "사업자등록증 파일을 추가해주세요.");
			result = false;
		} else resetMsg("#bizImgMsg");
		
		return result;
	};
}

// 관리자페이지 광고주 검색 유효성검사
if(document.searchAdvertiserFrm != null) {
	document.searchAdvertiserFrm.onsubmit = (e) => {
		let result = true;
		if(!/^[0-9]{0,10}$/.test(searchBizLicenseNo.value)) {
			searchBizLicenseNo.classList.add('is-invalid');
			result = false;
		} else {
			searchBizLicenseNo.classList.remove('is-invalid');
		}
		return result;
	};
};