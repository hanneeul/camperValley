<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community/review/review.css" />

<!-- Swiper -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<!-- 캠핑장후기상세 페이지 (작성자:SJ) -->
<div class="container-md campsite-review-detail-wrap pt-2">
	<jsp:include page="/WEB-INF/views/community/communityHeading.jsp"/>
	</div>
	<hr />
	<div class="d-flex px-2 review-detail-heading font-weight-bold row">
		<span class="col-md text-left ml-3"><i class="fa-solid fa-compass"></i>&nbsp;캠퍼길동</span>
		<span class="col-md text-right mr-3">2022-07-18</span>
	</div>
	<hr />
	<div class="review-detail-content-wrap m-auto mb-4 pb-3">
		<div class="detail-title py-3 my-2">
			<h5 class="font-weight-bold m-0">○○야영장 후기</h5>
		</div>
		<div class="detail-content-wrap shadow p-4 bg-light rounded font-weight-bold row">
			<div class="detail-content-table col">
				<table class="table table-borderless">
					<tr>
						<th>캠핑장명</th>
						<td>○○야영장</td>
					</tr>
					<tr>
						<th>이용기간</th>
						<td>08/04/2022 - 08/04/2022</td>
					</tr>
					<tr>
						<th>평점</th>
						<td>
						  	<div class="review-grade-list">
				        		<span class="fa fa-star-o" data-rating="1"></span>
				        		<span class="fa fa-star-o" data-rating="2"></span>
				        		<span class="fa fa-star-o" data-rating="3"></span>
				        		<span class="fa fa-star-o" data-rating="4"></span>
				        		<span class="fa fa-star-o" data-rating="5"></span>
				        		<input type="hidden" class="review-grade" id="reviewGrade" name="reviewGrade" value="4">
				      		</div>
						</td>
					</tr>
				</table>
			</div>
			<div class="detail-tag-list col">
				<ul class="text-center">
					<li>#시설물이 깨끗해요.</li>
					<li>#사장님이 친절해요.</li>
					<li>#놀이시설이 많아요.</li>
				</ul>
			</div>
		</div>
		<!-- images swiper -->
		<div class="swiper-container detail-photo-list">
			<div class="swiper-wrapper">
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/campsite/campsiteSearchBanner.jpg"></div>
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/campsite/campsiteSearchBanner.jpg"></div>
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/campsite/campsiteSearchBanner.jpg"></div>
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/campsite/campsiteSearchBanner.jpg"></div>
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/campsite/campsiteSearchBanner.jpg"></div>
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/campsite/campsiteSearchBanner.jpg"></div>
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/campsite/campsiteSearchBanner.jpg"></div>
			</div>
			<!-- swiper-button -->
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
			<!-- swiper-pagination -->
			<!-- <div class="swiper-pagination"></div> -->
		</div>
		<div class="detail-content p-4 bg-light rounded">
			Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facilis ad dolore porro asperiores mollitia nam assumenda alias id quos incidunt similique fugiat modi totam corrupti quia perspiciatis et qui aperiam.</textarea>
		</div>
		<!-- status가 'Y'일 경우 active 활성화 -->
		<div class="text-center mt-3 pt-3">
			<button type="button" id="recommendBtn" class="btn btn-outline-primary btn-outline-camper-blue">
				<i class="fa-regular fa-thumbs-up"></i>&nbsp;추천하기
			</button>
		</div>
	</div>
	<hr />
	<div class="text-center m-3 p-3">
		<input type="submit" class="btn btn-outline-success btn-outline-camper-color px-4" value="후기수정" >
		<input type="reset" class="btn btn-outline-danger btn-outline-camper-red ml-1 px-4" value="후기삭제">
	</div>
	<div class="review-detail-comment-wrap m-auto py-5">
		<form
			name="commentEnrollFrm"
			action="" 
			method="POST">
			<div class="card my-3">
		  		<div class="card-header font-weight-bold m-0">
		    		<i class="fa-solid fa-comments camper-color"></i>&nbsp;comments (1)
		  		</div>
		  		<div class="card-body">
		  			<ul class="list-group list-group-flush">
						<li class="list-group-item">
							<div class="form-inline mb-2">
					    		<p class="card-text"><i class="fa-solid fa-compass"></i>&nbsp;캠핑족장</p>
							</div>
							<textarea class="form-control" name="commentContent" cols="60" rows="3" placeholder="권리침해, 욕설 및 특정 대상을 비하하는 내용을 게시할 경우 이용약관 및 관련 법률에 의해 제재될 수 있습니다."></textarea>
							<button type="submit" class="btn btn-success btn-camper-color mt-3 float-right" id="commentEnrollBtn">등록</button>
					    </li>
					</ul>
		  		</div>
			</div>
		</form>
	</div>
</div>
<script>
/**
 * 리뷰평점 개수 제어
 */
let $reviewGradeList = $('.review-grade-list .fa');

let setReviewGrade = function() {
	return $reviewGradeList.each(function() {
		if (parseInt($reviewGradeList.siblings('input.review-grade').val()) >= parseInt($(this).data('rating'))) {
			return $(this).removeClass('fa-star-o').addClass('fa-star');
		} else {
			return $(this).removeClass('fa-star').addClass('fa-star-o');
		}
	});
};

setReviewGrade();

/**
 * 후기 이미지 제어
 */
new Swiper('.swiper-container', {
	slidesPerView : 3, // 동시에 보여줄 슬라이드 개수
	spaceBetween : 10, // 슬라이드 간 간격
	slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView와 같은 값을 지정하는 게 좋음

	// 그룹 수가 맞지 않을 경우 빈칸으로 메우기
	// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개 완성
	loopFillGroupWithBlank : true,
	loop : true, // 무한 반복
	/* pagination : { // 페이징
		el : '.swiper-pagination',
		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	}, */
	navigation : { // 네비게이션
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	},
});
</script>
<script src="${pageContext.request.contextPath}/resources/js/community/review/reviewValidation.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>