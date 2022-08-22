<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/mypage.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/community/bookmark.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/advertiser/advertiser.css" />

<div class="container">
	<div class="row d-flex justify-content-between">
		<div class="col-lg-2">
			<jsp:include page="/WEB-INF/views/common/mypageSidebar.jsp" />
		</div>
		<div class="col-lg-10 px-5">
			<div class="bookmartPageWrapper mx-auto">
				<h2>관심캠핑장</h2>
				<div class="listWrapper px-5 py-2">
					<c:forEach items="${bookmarkList}" var="bookmark">
						<div class="row bookmarkWrapper py-4">
							<div class="imgWrapper">
								<img class="campsiteImg" src="${bookmark.campsite.firstImageUrl}" alt="대표사진" />
							</div>
							<div class="col campsiteInfo">
								<h5 class="mb-3 campsiteName">
									<a href="${pageContext.request.contextPath}/campsite/infoView?contentId=${bookmark.contentId}">
										${bookmark.campsite.facltNm}
									</a>
								</h5>
								<h6 class="pt-2 campsiteIntro">${bookmark.campsite.lineIntro}</h6>
								<div class="d-flex detailInfo mt-4">
									<div>
										<i class="fa-solid fa-location-dot"></i>
										<span class="campsiteAddr">${bookmark.campsite.addr1}</span>
									</div>
									<div>
										<i class="fa-solid fa-phone"></i>
										<span class="campsiteTel">${bookmark.campsite.tel}</span>
									</div>
								</div>
							</div>
							<div class="col-2 btnWrapper d-flex justify-content-center align-items-center">
								<button type="button" class="bmStatusBtn">
									<i class="fa-solid fa-heart" data-content-id="${bookmark.contentId}"></i><!-- fa-regular -->
								</button>
							</div>
						</div>
					</c:forEach>
				</div>
				<c:if test="${not empty bookmarkList}">
					<div class="mt-5 pagebar">${pagebar}</div>
				</c:if>
			</div>
		</div>
	</div>
</div>
<sec:authentication property="principal" var="loginMember" scope="page"/>
<script>
const headers = {
	"${_csrf.headerName}" : "${_csrf.token}"
};
	
document.querySelectorAll('.bmStatusBtn i').forEach((icon) => {
	icon.addEventListener('click', (e) => {
		const contentId = e.target.dataset.contentId;
		
		$.ajax({
			url : '${pageContext.request.contextPath}/campsite/deleteBookmark',
			type : 'POST',
			headers,
			data : {
				contentId,
				memberId : '${loginMember.memberId}'
			},
			success(response) {
				location.reload();
			},
			error: console.log
		});
	});
})
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />