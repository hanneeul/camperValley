/**
 * 캠핑장후기 유효성 검사
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