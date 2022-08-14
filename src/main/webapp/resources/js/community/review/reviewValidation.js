/**
 * 캠핑장후기 등록폼 유효성 검사
 */
if(document.reviewEnrollFrm != null) {
	document.reviewEnrollFrm.onsubmit = (e) => {
		const frm = e.target;
		
		const reviewGradeVal = frm.reviewGrade.value.trim();
		if(!/[1-5]/g.test(reviewGradeVal)) {
			alert("평점을 선택해주세요.");
			frm.reviewGrade.select();
			return false;
		}
		
		return true;
	}
}

/**
 * 캠핑장후기 검색폼 유효성 검사
 */
if(document.reviewSearchFrm != null) {
	document.reviewSearchFrm.onsubmit = (e) => {
		const frm = e.target;
		
		const searchTypeVal = frm.searchType.value.trim();
		if(searchTypeVal == "") {
			alert("검색타입을 선택하세요.");
			frm.searchType.select();
			return false;
		}
		
		const searchKeywordVal = frm.searchKeyword.value.trim();
		if(searchKeywordVal == "") {
			alert("검색어를 입력하세요.");
			frm.searchKeyword.select();
			return false;
		}
		
		return true;
	}
}

/**
 * 캠핑장후기 수정폼 유효성 검사
 */
if(document.reviewUpdateFrm != null) {
	document.reviewUpdateFrm.onsubmit = (e) => {
		const frm = e.target;
		
		const reviewGradeVal = frm.reviewGrade.value.trim();
		if(!/[1-5]/g.test(reviewGradeVal)) {
			alert("평점을 선택해주세요.");
			frm.reviewGrade.select();
			return false;
		}
		
		return true;
	}
}