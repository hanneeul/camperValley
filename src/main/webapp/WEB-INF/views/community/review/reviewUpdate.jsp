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

<!-- Date Range Picker -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<!-- 캠핑장후기수정 페이지 (작성자:SJ) -->
<div class="container-md campsite-review-update-wrap pt-2">
	<jsp:include page="/WEB-INF/views/community/communityHeading.jsp"/>
	</div>
	<hr />
	<div class="d-flex px-2 review-update-heading">
		<h5 class="font-weight-bold m-0">캠핑장 후기 수정</h5>
		<span class="ml-3 required-red">* 표시가 된 곳은 필수 입력사항입니다.</span>
	</div>
	<hr />
	<div class="review-update-form-wrap mb-4 pb-4">
		<form 
			name="reviewUpdateFrm" 
			method="POST" 
			action=""
			enctype="multipart/form-data">
			<div class="form-group row">
				<div class="form-group col display-contents">
				  	<label for="name" class="col-md-1 col-form-label font-weight-bold">작성자</label>
				  	<div class="col-md-5">
				    	<input type="text" class="form-control" id="nickname" name="nickname" value="캠퍼길동" readonly>
				  	</div>
				</div>
				<div class="form-group col display-contents">
				  	<label for="reviewGrade" class="col-md-1 col-form-label font-weight-bold">
				  		평점<sup class="required-red">*</sup>
				  	</label>
				  	<div class="col-md-5 review-grade-list">
		        		<span class="fa fa-star-o" data-rating="1"></span>
		        		<span class="fa fa-star-o" data-rating="2"></span>
		        		<span class="fa fa-star-o" data-rating="3"></span>
		        		<span class="fa fa-star-o" data-rating="4"></span>
		        		<span class="fa fa-star-o" data-rating="5"></span>
		        		<input type="hidden" class="review-grade" id="reviewGrade" name="reviewGrade" value="4">
		      		</div>
				</div>
			</div>
			<div class="form-group row">
				<div class="form-group col display-contents">
				  	<label for="facltNm" class="col-md-1 col-form-label font-weight-bold">
				  		캠핑장명<sup class="required-red">*</sup>
				  	</label>
				  	<div class="col-md-5">
				  		<input 
				  			type="button" 
				  			class="form-control text-left" 
				  			id="facltNm" 
				  			name="facltNm" 
				  			value="○○야영장"
				  			data-toggle="modal" 
				  			data-target="#facltNmModal"
				  			required/>
				  	</div>
				</div>
				<!-- facltNmModal start -->
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
					        	<button type="button" class="btn btn-success btn-camper-color">선택</button>
					      	</div>
				    	</div>
				  	</div>
				</div>
				<!-- facltNmModal end -->
				<div class="form-group col display-contents">
				  	<label for="name" class="col-md-1 col-form-label font-weight-bold">
				  		이용기간<sup class="required-red">*</sup>
				  	</label>
				  	<div class="col-md-5">
						<div class="mb-0">
						    <input 
						    	class="form-control form-control-solid" 
						    	id="stay"
						    	name="stay" 
						    	value=""
						    	placeholder="08/04/2022 - 08/04/2022"
						    	required/>
						</div>
				  	</div>
				</div>
			</div>
			<div class="form-group col text-center my-3">
				<label class="col col-form-label font-weight-bold">이런 점이 좋았어요.</label>
				<div class="col py-3">
					<div class="form-check form-check-inline">
				  		<input class="form-check-input" type="checkbox" name="merit" id="merit0" value="merit0" checked>
				  		<label class="form-check-label" for="merit0">시설물이 깨끗해요.</label>
					</div>
					<div class="form-check form-check-inline">
				  		<input class="form-check-input" type="checkbox" name="merit" id="merit1" value="merit1">
				  		<label class="form-check-label" for="merit1">사장님이 친절해요.</label>
					</div>
					<div class="form-check form-check-inline">
				  		<input class="form-check-input" type="checkbox" name="merit" id="merit2" value="merit2" checked>
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
			<hr class="my-4" />
		    <div class="form-group row">
			  	<label for="title" class="col-md-1 col-form-label font-weight-bold">
			  		제목<sup class="required-red">*</sup>
			  	</label>
			  	<div class="col-md-11">
			    	<input 
			    		type="text" 
			    		class="form-control" 
			    		id="title" 
			    		name="title" 
			    		value="○○야영장 후기" 
			    		placeholder="제목을 입력해주세요."
			    		required/>
			  	</div>
			</div>
			<div class="form-group row">
			  	<label for="name" class="col-md-1 col-form-label font-weight-bold">
			  		내용<sup class="required-red">*</sup>
			  	</label>
			  	<div class="col-md-11">
			    	<textarea class="form-control" name="content" placeholder="내용을 입력해주세요." required>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint ad culpa veniam fugit aliquid sequi soluta vitae eligendi rem eos sapiente aut optio maiores! Assumenda dolore illo sed saepe velit!</textarea>
			  	</div>
			</div>
			<div class="form-group row">
			  	<label for="name" class="col-md-1 col-form-label font-weight-bold">첨부파일</label>
				<div class="form-group col-md-5 mx-3 mb-0">
					<div class="input-group row mb-3">
						<div class="btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-outline-danger btn-outline-camper-red delete-file-ckb-wrap" title="삭제할파일임.jpg 삭제">
								<input type="checkbox" id="delFile" name="delFile" value="삭제할파일임.jpg">
								삭제할파일임.jpg... 삭제
							</label>
		                </div>
		            </div>
					<div class="input-group row my-3">
					  	<div class="custom-file">
					    	<input type="file" class="custom-file-input" name="reviewPhoto" multiple>
					    	<label class="custom-file-label" for="reviewPhoto">첨부파일을 선택해주세요.</label>
					  	</div>
					</div>
				</div>
			</div>
			<hr />
			<div class="text-center m-3 p-3">
				<input type="reset" class="btn btn-outline-secondary px-4" value="작성취소">
				<input type="submit" class="btn btn-outline-success btn-outline-camper-color ml-1 px-4" value="후기수정" >
			</div>
		</form>
	</div>
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