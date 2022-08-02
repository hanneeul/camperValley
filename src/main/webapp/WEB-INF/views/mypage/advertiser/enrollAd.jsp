<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/mypage.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/advertiser/advertiser.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<style>
.adDetailWrapper {
	width: 45rem;
}
.divAdZoneOption .imgWrapper {
	background-color: #f0f0f0;
	height: 9rem;
}
.divAdZoneOption .selectedImgWapper {
	border: 0.3rem solid #D8EBB5;
}
.divAdZoneOption p {
	font-weight: 600;
	font-size: 0.9rem;	
}
.divAdZoneOption span {
	font-size: 0.8rem;
}
</style>

<div class="container">
	<div class="row d-flex justify-content-between">
		<div class="col-lg-2">
			<jsp:include page="/WEB-INF/views/common/mypageSidebar.jsp" />
		</div>
		<div class="col-lg-10 px-5">
			<div class="adDetailWrapper mx-auto">
				<h2>광고소재 등록하기</h2>
				<form action="" name="enrollAdFrm">
					<div class="divInputWrapper">
						<label for="adName">광고소재명</label>
						<input type="text" name="adName" id="adName" class="form-control form-control-sm"
							placeholder="광고소재의 이름을 작성해주세요.">
						<small class="form-text text-muted">광고소재명은~</small>
					</div>
					<div class="divInputWrapper">
						<label for="">노출위치 선택</label>
						<div class="row divAdZoneOption">
							<div class="col">
								<div class="imgWrapper" id="imgWrapper1">
									<%-- <img src="${pageContext.request.contextPath}/resources/images/mypage/advertiser/file.png" alt="메인 홈 슬라이드 배너 영역" /> --%>
								</div>
								<p class="my-1">메인 홈 슬라이드 배너</p>
								<span>캠퍼밸리 메인 홈에 노출되는 슬라이드배너 영역광고입니다. 광고이미지 규격은 0000 0000 입니다.</span>
							</div>
							<div class="col">
								<div class="imgWrapper" id="imgWrapper2"></div>								
								<p class="my-1">중고거래 홈</p>
								<span>캠퍼밸리 캠핑용품거래 게시판의 슬라이드배너에 노출됩니다. 광고이미지 규격은 0000 0000 입니다.</span>
							</div>
							<div class="col">
								<div class="imgWrapper" id="imgWrapper3"></div>								
								<p class="my-1">중고거래 피드</p>
								<span>캠퍼밸리 캠핑용품거래 게시판의 중고거래 게시글 사이에 노출됩니다. 광고이미지 규격은 0000 0000 입니다.</span>
							</div>
						</div>
					</div>
					<div class="divInputWrapper">
						<label for="adLink">링크</label>
						<input type="text" name="adLink" id="adLink" class="form-control form-control-sm"
							placeholder="광고 클릭 시 이동할 주소를 입력해주세요.">
					</div>
					<div class="divInputWrapper">
						<label for="adImg">이미지</label>
					</div>
					<div class="divInputWrapper">
						<label for="adCpc">클릭당 단가(CPC) 설정</label>
						<div class="form-row">
							<div class="col-4">
								<input type="number" name="adCpc" id="adCpc" class="form-control form-control-sm" />
							</div>
							<div class="col align-items-bottom">
								<span>원</span>
							</div>
						</div>
					</div>
					<div class="divInputWrapper adPolicy">
						<div class="d-flex justify-content-between" id="adPolicyHead">
							<span>광고 노출 정책 안내</span>
						</div>
						<div id="adPolicyBody">
							Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto quisquam nesciunt obcaecati voluptatem illum alias deserunt ut corporis modi fuga deleniti officiis dolorum temporibus maiores vero saepe repellendus? Nulla porro.
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>