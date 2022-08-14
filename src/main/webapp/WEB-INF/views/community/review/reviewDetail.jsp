<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>
<%@ page import="com.kh.campervalley.community.review.model.dto.CampsiteReviewExt" %>
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
<style>
.card-footer {
    position: relative;
    display: flex;
    padding:20px;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
}

.media img{
    width: 50px;
    height: 50px;
}

.reply a {
	text-decoration: none;
}

.reply-wrap {
	justify-content: right;
}
</style>


<!-- Swiper -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<!-- 캠핑장후기상세 페이지 (작성자:SJ) -->
<div class="container-md campsite-review-detail-wrap pt-2">
	<jsp:include page="/WEB-INF/views/community/communityHeading.jsp"/>
	</div>
	<hr />
	<sec:authentication property="principal" var="loginMember"/>
	<div class="d-flex px-2 review-detail-heading font-weight-bold row">
		<span class="col-md text-left ml-3">
			<i class="fa-solid fa-compass"></i>&nbsp;
			<c:if test="${not empty loginMember && loginMember.memberId eq review.memberId}">
				<a 
					class="text-decoration-none" 
					onMouseOver="this.innerHTML='마이페이지 바로가기'" 
					onMouseOut="this.innerHTML='${review.member.nickname}'" 
					href="${pageContext.request.contextPath}/mypage/info/main">
					${review.member.nickname} 
				</a>
			</c:if>
			<c:if test="${not empty loginMember && loginMember.memberId ne review.memberId}">
				<a 
					class="text-decoration-none" 
					onMouseOver="this.innerHTML='${review.member.nickname}님의 게시글 보러가기'" 
					onMouseOut="this.innerHTML='${review.member.nickname}'" 
					href="${pageContext.request.contextPath}/community/review/reviewList?searchType=memberId&searchKeyword=${review.member.nickname}">
					${review.member.nickname}
				</a>
			</c:if>
		</span>
		<span class="col-md text-right mr-3">
			<fmt:parseDate value="${review.createdAt}" pattern="yyyy-MM-dd'T'HH:mm" var="createdAt"/>
			<fmt:formatDate value="${createdAt}" pattern="yyyy-MM-dd"/>&nbsp;(조회수:${review.readCount})
		</span>
	</div>
	<hr />
	<div class="review-detail-content-wrap m-auto mb-4 pb-3">
		<div class="detail-title py-3 my-2">
			<h5 class="font-weight-bold m-0">${review.title}</h5>
		</div>
		<div class="detail-content-wrap shadow p-4 bg-light rounded font-weight-bold row">
			<div class="detail-content-table col m-auto">
				<table class="table table-borderless m-0">
					<tr>
						<th>캠핑장명</th>
						<td>${review.facltNm}</td>
					</tr>
					<tr>
						<th>이용기간</th>
						<td>${review.stay}</td>
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
				        		<input type="hidden" class="review-grade" id="reviewGrade" name="reviewGrade" value="${review.reviewGrade}">
				      		</div>
						</td>
					</tr>
				</table>
			</div>
			<div class="detail-tag-list col">
				<ul class="text-center p-0 m-0">
					<c:forEach items="${review.merit}" var="merit">
						<li class="badge badge-yellow my-2">#${merit}</li>
						<br />
					</c:forEach>
				</ul>
			</div>
		</div>
		<c:if test="${not empty review.photos}">
			<c:forEach items="${review.photos}" var="photo">
				<!-- Photo Swiper -->
				<div class="swiper-container detail-photo-list">
					<div class="swiper-wrapper">
						<div class="swiper-slide"><img id="photo" src="${pageContext.request.contextPath}/resources/upload/community/review/${photo.renamedFilename}" alt="${photo.originalFilename}"></div>
					</div>
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
				</div>
			</c:forEach>
			<!-- Photo Modal -->
			<div id="photoModal" class="modal photo-modal">
			  	<span class="modal-close">&times;</span>
			  	<img class="modal-content" id="photoModalContent">
			</div>
		</c:if>
		<div class="detail-content p-4 bg-light rounded">
			${review.content}
		</div>
		<form:form 
			name="reviewDeleteFrm" 
			method="POST" 
			action="${pageContext.request.contextPath}/community/review/reviewDelete">
			<input type="hidden" name="reviewNo" id="reviewNo" value="${review.reviewNo}" />
		</form:form>
		<!-- status가 'Y'일 경우 active 활성화 -->
		<c:if test="${not empty loginMember && loginMember.memberId ne review.memberId}">
			<div class="text-center mt-3 pt-3">
				<button type="button" id="recommendBtn" class="btn btn-outline-primary btn-outline-camper-blue">
					<i class="fa-regular fa-thumbs-up"></i>&nbsp;추천하기
				</button>
			</div>
		</c:if>
	</div>
	<hr />
	<c:if test="${not empty loginMember && loginMember.memberId eq review.memberId}">
		<div class="text-center m-3 p-3">
			<input 
				type="submit" 
				class="btn btn-outline-success btn-outline-camper-color px-4" 
				onclick="location.href='${pageContext.request.contextPath}/community/review/reviewUpdate?reviewNo=${review.reviewNo}';" 
				value="후기수정">
			<input type="button" class="btn btn-outline-danger btn-outline-camper-red ml-1 px-4" id="reviewDeleteBtn" value="후기삭제">
		</div>
	</c:if>
	<div class="review-detail-comment-wrap m-auto py-5">
		<div class="card my-3">
	  		<div class="card-header font-weight-bold m-0">
	    		<i class="fa-solid fa-comments camper-color"></i>&nbsp;comments (${review.commentCount})
	  		</div>
			<form:form name="commentEnrollFrm">
		  		<div class="card-body">
		  			<ul class="list-group list-group-flush">
						<li class="list-group-item">
							<div class="form-inline mb-2">
					    		<p class="card-text">
					    			<i class="fa-solid fa-compass"></i>&nbsp;${loginMember.getNickname()}
					    		</p>
							</div>
							<textarea class="form-control" name="commentContent" cols="60" rows="3" placeholder="권리침해, 욕설 및 특정 대상을 비하하는 내용을 게시할 경우 이용약관 및 관련 법률에 의해 제재될 수 있습니다." required></textarea>
							<input type="hidden" name="reviewNo" value="${review.reviewNo}" />
							<input type="hidden" name="memberId" value="${not empty loginMember ? loginMember.getMemberId() : ''}"/>
							<input type="hidden" name="commentLevel" value="1" />
                			<input type="hidden" name="commentRef" value="0" />
							<button type="button" class="btn btn-success btn-camper-color mt-3 float-right" id="commentEnrollBtn">등록</button>
					    </li>
					</ul>
		  		</div>
			</form:form>
			<c:if test="${not empty review.comments}">
		  		<div class="card-footer">
					<div class="row p-4">
						<c:forEach items="${review.comments}" var="comment">
							<div class="col-md-12">
								<div class="media">
									<c:if test="${not empty comment.member.profileImg}">
										<img class="mr-3 rounded-circle" src="${pageContext.request.contextPath}/resources/upload/member/default-profile.svg"/>
									</c:if>
									<c:if test="${empty comment.member.profileImg}">
										<img class="mr-3 rounded-circle" src="${pageContext.request.contextPath}/resources/upload/member/default-profile.svg"/>
									</c:if>
									<div class="media-body">
										<div class="row">
											<div class="col-md-8 d-flex my-2">
										    	<span>${comment.member.nickname}</span>&nbsp;
										    	<span>
										    		<fmt:parseDate value="${comment.createdAt}" pattern="yyyy-MM-dd'T'HH:mm" var="createdAt"/>
													<fmt:formatDate value="${createdAt}" pattern="yyyy-MM-dd"/>
										    	</span>
										 	</div>
										 	<div class="col-md-4 d-flex reply-wrap">
										 		<div class="reply">
										 			<button type="button" class="badge btn-outline-camper-color btn-reply" value="${comment.reviewCommentNo}"><i class="fa fa-reply"></i>&nbsp;답글</button>
										 			<button type="button" class="badge btn-outline-camper-delete btn-delete" value="${comment.reviewCommentNo}"><i class="fa-solid fa-circle-minus"></i>&nbsp;삭제</button>
											 	</div>
											</div>
											<div class="row mx-3">
												${comment.commentContent}
											</div>
										</div>
										<div class="media mt-4">
											<a class="pr-3" href="#"><img class="rounded-circle" alt="Bootstrap Media Another Preview" src="https://i.imgur.com/xELPaag.jpg" /></a>
											<div class="media-body">
												<div class="row">
													<div class="col-md d-flex my-2">
												    	<span>길동1</span>&nbsp;<span>22-08-14</span>
												 	</div>
												</div>
												<div class="row mx-1">
													Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat voluptatem consectetur quidem modi labore tempore nostrum possimus qui nihil amet dolorum doloribus tempora. Expedita in temporibus consequuntur hic optio eos.
					                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod earum nam quia nemo placeat delectus vitae fugit sint dolores deleniti. Optio perspiciatis dolorum commodi debitis nam totam! Inventore perspiciatis earum?     
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:if>
		</div>
	</div>
</div>
<script>
/**
 * 답글 등록폼 동적 생성
 */
document.querySelectorAll('.btn-reply').forEach((btn) => {
	btn.onclick = (e) => {
		if(${empty loginMember}) {
			alert('로그인 후 이용할 수 있습니다.');
			return;
		}
		
		const {value : commentRef} = e.target;
		console.log(commentRef);
		
		const frm = document.createElement("form");
        frm.name = "commentReplyFrm";
        frm.action = "${pageContext.request.contextPath}/community/review/commentEnroll";
        frm.method = "POST";
		
        const outerDiv = document.createElement("div");
        outerDiv.className = "card-body";
        
        const ul = document.createElement("ul");
        ul.className= "list-group list-group-flush";
        
        const li = document.createElement("li");
        li.className = "list-group-item";
        
        const innerDiv = document.createElement("div");
        innerDiv.className = "form-inline mb-2";
        
        const p = document.createElement("p");
        p.className = "card-text";
        p.innerHTML = `<i class="fa-solid fa-compass"></i>&nbsp;${loginMember.getNickname()}`;
                
        const textarea = document.createElement("textarea");
        textarea.className = "form-control";
        textarea.name = "commentContent";
        textarea.cols = "60";
        textarea.rows = "3";
        textarea.placeholder = "권리침해, 욕설 및 특정 대상을 비하하는 내용을 게시할 경우 이용약관 및 관련 법률에 의해 제재될 수 있습니다.";
        
        const inputReviewNo = document.createElement("input");
        inputReviewNo.type = "hidden";
        inputReviewNo.name = "reviewNo";
        inputReviewNo.value = "${review.reviewNo}";
        
        const inputMemberId = document.createElement("input");
        inputMemberId.type = "hidden";
        inputMemberId.name = "memberId";
        inputMemberId.value = "${not empty loginMember ? loginMember.getMemberId() : ''}";
        
        const inputCommentLevel = document.createElement("input");
        inputCommentLevel.type = "hidden";
        inputCommentLevel.name = "commentLevel";
        inputCommentLevel.value = "2";
       	
        const inputCommentRef = document.createElement("input");
        inputCommentRef.type = "hidden";
        inputCommentRef.name = "commentRef";
        inputCommentRef.value = commentRef;
        
        const inputCsrf = document.createElement("input");
        inputCsrf.type = "hidden";
        inputCsrf.name = "${_csrf.parameterName}";
        inputCsrf.value = "${_csrf.token}";
        
        const button = document.createElement("button");
        button.className = "btn btn-success btn-camper-color mt-3 float-right";
        button.id = "commentReplyBtn";
        button.innerText = "등록";
        
        innerDiv.append(p);
        li.append(innerDiv);
        li.append(textarea);
        li.append(inputReviewNo);
        li.append(inputMemberId);
        li.append(inputCommentLevel);
        li.append(inputCommentRef);
        li.append(inputCsrf);
        li.append(button);
        ul.append(li);
        outerDiv.append(ul);
        frm.append(outerDiv);
        
		const target = e.target.parentElement.parentElement.parentElement;        
        target.insertAdjacentElement('afterend', frm);		
		e.target.onclick = null;
	};
});

const commentReplyHandler = (e) => {
	if(${empty loginMember}) {
		alert('로그인 후 이용할 수 있습니다.');
		return;
	}
	
	const commentContentVal = e.target.commentContent.value.trim();
	if(!/^(.|\n)+$/.test(commentContentVal)) {
		alert("댓글 내용을 작성해주세요.");
		e.target.commentContent.focus();
		return false;
	}
};

/**
 * 답글 등록
 */
$('#commentReplyBtn').click(function() {
	const commentData = $('[name=commentReplyFrm]').serialize();
	commentEnroll(commentData);
});

/**
 * 댓글 등록
 */
$('#commentEnrollBtn').click(function() {
	const commentData = $('[name=commentEnrollFrm]').serialize();
	commentEnroll(commentData);
});

function commentEnroll(commentData) {
	const headers = {
		"${_csrf.headerName}" : "${_csrf.token}"
	};
	
	$.ajax({
		url : '${pageContext.request.contextPath}/community/review/commentEnroll',
		method : "POST",
		headers,
		data : commentData,
		success(response) {
			alert('댓글 등록이 완료되었습니다.');
			$('[name=commentContent]').val('');
			location.reload();
		},
		error : console.log
	});
};

/**
 * 캠핑장 후기 삭제
 */
document.querySelector('#reviewDeleteBtn').addEventListener('click', (e) => {
	const bool = confirm('정말 삭제하시겠습니까?');
	
	if(!bool) {
		alert('삭제를 취소했습니다.');
	}
	else {
		const frm = document.reviewDeleteFrm;
		frm.submit();
	}
});

/**
 * 이미지 클릭시 모달창 실행
 */
let photoModal = document.getElementById("photoModal");
let photo = document.getElementById("photo");
let photoModalContent = document.getElementById("photoModalContent");
photo.onclick = function() {
	photoModal.style.display = "block";
	photoModalContent.src = this.src;
};

let modalClose = document.getElementsByClassName("modal-close")[0];
modalClose.addEventListener('click', () => {
	photoModal.style.display = "none";
});

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