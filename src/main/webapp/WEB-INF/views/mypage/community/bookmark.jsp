<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/mypage.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/community/bookmark.css" />

<div class="container">
	<div class="row d-flex justify-content-between">
		<div class="col-lg-2">
			<jsp:include page="/WEB-INF/views/common/mypageSidebar.jsp" />
		</div>
		<div class="col-lg-10 px-5">
			<div class="bookmartPageWrapper mx-auto">
				<h2>관심캠핑장</h2>
				<div class="listWrapper px-5 py-2">
					<div class="row bookmarkWrapper py-4">
						<div class="col-3 d-flex align-items-center" id="imgWrapper">
							<div class="imgWrapper">
								<img class="campsiteImg" src="${pageContext.request.contextPath}/resources/images/mypage/advertiser/file.png" alt="메인 홈 슬라이드 배너 영역" />
							</div>
						</div>
						<div class="col campsiteInfo">
							<h5 class="mb-3 campsiteName">[ㅁㅁ도 ㅇㅇ시]블라블라숲 캠핑장</h5>
							<h6 class="pt-2 campsiteIntro">낭만 가득한 프라이빗 캠핑장</h6>
							<div class="d-flex detailInfo mt-4">
								<div>
									<i class="fa-solid fa-location-dot"></i>
									<span class="campsiteAddr">어쩔도 저쩔시 웅앵동 123</span>
								</div>
								<div>
									<i class="fa-solid fa-phone"></i>
									<span class="campsiteTel">070-0000-0000</span>
								</div>
							</div>
						</div>
						<div class="col-2 btnWrapper d-flex justify-content-center align-items-center">
							<button type="button" class="bmStatusBtn">
								<i class="fa-solid fa-heart"></i><!-- fa-regular -->
							</button>
						</div>
					</div>
					<div class="row bookmarkWrapper py-4">
						<div class="col-3 d-flex align-items-center" id="imgWrapper">
							<div class="imgWrapper">
								<img class="campsiteImg" src="${pageContext.request.contextPath}/resources/images/mypage/advertiser/file.png" alt="메인 홈 슬라이드 배너 영역" />
							</div>
						</div>
						<div class="col campsiteInfo">
							<h5 class="mb-3 campsiteName">[ㅁㅁ도 ㅇㅇ시]블라블라숲 캠핑장</h5>
							<h6 class="pt-2 campsiteIntro">낭만 가득한 프라이빗 캠핑장</h6>
							<div class="d-flex detailInfo mt-4">
								<div>
									<i class="fa-solid fa-location-dot"></i>
									<span class="campsiteAddr">어쩔도 저쩔시 웅앵동 123</span>
								</div>
								<div>
									<i class="fa-solid fa-phone"></i>
									<span class="campsiteTel">070-0000-0000</span>
								</div>
							</div>
						</div>
						<div class="col-2 btnWrapper d-flex justify-content-center align-items-center">
							<button type="button" class="bmStatusBtn">
								<i class="fa-solid fa-heart"></i>
							</button>
						</div>
					</div>
				</div>
				<div class="mt-5">
					<jsp:include page="/WEB-INF/views/common/pagebar.jsp" />
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />