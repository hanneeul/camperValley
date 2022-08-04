<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community/review/review.css" />

<!-- Date Range Picker -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<!-- 캠핑장후기등록 페이지 (작성자:SJ) -->
<div class="container-md campsite-review-enroll-wrap pt-2">
	<jsp:include page="/WEB-INF/views/community/communityHeading.jsp"/>
	</div>
	<hr />
	<div>
		<h4>캠핑장 후기 등록</h4>
	</div>
	<hr />
	<div class="review-enroll-form-wrap">
		<form name="reviewEnrollFrm"
			  method="POST" 
			  action="">
			<div class="form-group row">
			  	<label for="name" class="col-sm-2 col-form-label">작성자</label>
			  	<div class="col-sm-10">
			    	<input type="text" class="form-control" id="nickname" name="nickname" value="캠퍼길동" readonly>
			  	</div>
			</div>
			<div class="form-group row">
			  	<label for="career" class="col-sm-2 col-form-label">평점</label>
			  	<div class="col-sm-10 review-grade-list">
	        		<span class="fa fa-star-o" data-rating="1"></span>
	        		<span class="fa fa-star-o" data-rating="2"></span>
	        		<span class="fa fa-star-o" data-rating="3"></span>
	        		<span class="fa fa-star-o" data-rating="4"></span>
	        		<span class="fa fa-star-o" data-rating="5"></span>
	        		<input type="hidden" name="reviewGrade" class="review-grade" value="3">
	      		</div>
			</div>
			<div class="form-group row">
			  	<label for="facltNm" class="col-sm-2 col-form-label">캠핑장명</label>
			  	<div class="col-sm-10">
			  		<input 
			  			type="button" 
			  			class="form-control" 
			  			id="facltNm" 
			  			name="facltNm" 
			  			value="이용하신 캠핑장을 선택해주세요."
			  			data-toggle="modal" 
			  			data-target="#facltNmModal"/>
			  	</div>
			</div>
			<!-- facltNmModal -->
			<div class="modal fade" id="facltNmModal" tabindex="-1" aria-labelledby="facltNmModalLabel" aria-hidden="true">
			  	<div class="modal-dialog modal-dialog-centered">
			    	<div class="modal-content">
			      		<div class="modal-header">
			        		<h5 class="modal-title" id="facltNmModalLabel">캠핑장 선택</h5>
			        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          			<span aria-hidden="true">&times;</span>
			        		</button>
			      		</div>
				      	<div class="modal-body">
				        	검색창 들어갈 예정
				      	</div>
				      	<div class="modal-footer">
				        	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				        	<button type="button" class="btn btn-primary">선택</button>
				      	</div>
			    	</div>
			  	</div>
			</div>
			<div class="form-group row">
			  	<label for="name" class="col-sm-2 col-form-label">이용기간</label>
			  	<div class="col-sm-10">
					<div class="mb-0">
					    <input 
					    	class="form-control form-control-solid" 
					    	id="stay"
					    	name="stay" 
					    	value=""
					    	placeholder="이용기간을 선택하세요."
					    	required/>
					</div>
			  	</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">이런 점이 좋았어요.</label>
				<div class="col-sm-10">
					<div class="form-check form-check-inline">
				  		<input class="form-check-input" type="checkbox" name="merit" id="merit0" value="merit0">
				  		<label class="form-check-label" for="merit0">시설물이 깨끗해요.</label>
					</div>
					<div class="form-check form-check-inline">
				  		<input class="form-check-input" type="checkbox" name="merit" id="merit1" value="merit1">
				  		<label class="form-check-label" for="merit1">사장님이 친절해요.</label>
					</div>
					<div class="form-check form-check-inline">
				  		<input class="form-check-input" type="checkbox" name="merit" id="merit2" value="merit2">
				  		<label class="form-check-label" for="merit2">매너타임이 잘 준수되고 있어요.</label>
					</div>
					<div class="form-check form-check-inline">
				  		<input class="form-check-input" type="checkbox" name="merit" id="merit3" value="merit3">
				  		<label class="form-check-label" for="merit3">가족/아이들과 함께 이용하기 좋아요.</label>
					</div>
					<div class="form-check form-check-inline">
				  		<input class="form-check-input" type="checkbox" name="merit" id="merit4" value="merit4">
				  		<label class="form-check-label" for="merit4">놀이시설이 많아요.</label>
					</div>
				</div>
			</div>
		    <div class="form-group row">
			  	<label for="title" class="col-sm-2 col-form-label">제목</label>
			  	<div class="col-sm-10">
			    	<input 
			    		type="text" 
			    		class="form-control" 
			    		id="title" 
			    		name="title" 
			    		value="" 
			    		placeholder="제목을 입력해주세요."
			    		required/>
			  	</div>
			</div>
			<div class="form-group row">
			  	<label for="name" class="col-sm-2 col-form-label">내용</label>
			  	<div class="col-sm-10">
			    	<textarea class="form-control" id="content" name="content" placeholder="내용을 입력해주세요." required></textarea>
			  	</div>
			</div>
			<div class="form-group row">
			  	<label for="name" class="col-sm-2 col-form-label">첨부파일</label>
				<div class="input-group col-sm-10">
				  	<div class="custom-file">
				    	<input type="file" class="custom-file-input" name="reviewPhoto" id="reviewPhoto" multiple>
				    	<label class="custom-file-label" for="reviewPhoto">첨부파일을 선택해주세요.</label>
				  	</div>
				</div>
			</div>
		</form>
	</div>
	<hr />
</div>
<script>
/**
 * 이용기간 선택
 */
$("#stay").daterangepicker();

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

$reviewGradeList.on('click', function() {
	$reviewGradeList.siblings('input.review-grade').val($(this).data('rating'));
  	return setReviewGrade();
});

setReviewGrade();
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>