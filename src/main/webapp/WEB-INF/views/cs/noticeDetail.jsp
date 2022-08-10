<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/cs/cs.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
.bar-notice {
	color: black !important;
}
.cs-bar {
	margin-bottom: 0px !important;
}
</style>


	<h5 class="cs-header text-center">공지사항</h5>
<div class="notice-wrap" style="width: 85%; float:none; margin:0 auto">

		<div class="cs-bar float-left">
		<a href="${pageContext.request.contextPath}/cs/noticeList" class="bar-notice">공지사항</a>
		<a href="${pageContext.request.contextPath}/cs/faq" class="bar-faq">자주 묻는 질문</a>
	</div>

		<div class="float-right">
			<button class="btn btn-outline-primary btn-update btn-sm" onclick="location.href='${pageContext.request.contextPath}/cs/noticeUpdate';">수정</button>
			<button class="btn btn-outline-danger btn-delete btn-sm">삭제</button>
		</div>

		<div class="container" style="display: inline">


			<div class="noticeDetail_head">
				<h4 class="notice__head">${notice.title}</h4>
			</div>

			<div class="noticeSecond_head">
				<span class="noticeDetail_date">
				<fmt:parseDate value="${notice.createdAt}" pattern="yyyy-MM-dd'T'HH:mm" var="createdAt"/>
					<fmt:formatDate value="${createdAt}" pattern="yyyy-MM-dd"/>
			</span> <span
					class="noticeDetail_read">${notice.readCount}</span>
			</div>

			<div class="noticeDetail_view">
<c:if test="${not empty notice.attachments}">
		<c:forEach items="${notice.attachments}" var="attach" varStatus="vs">
			<img src="${pageContext.request.contextPath}/resources/upload/cs/${attach.renamedFilename}" alt="" class="mt-3"/>
			</c:forEach>
	</c:if>
			<p>${notice.content}</p>
			
			</div>

			<div class="notice-box">
				<span class="prev">이전글</span> <a href="#">Lorem, ipsum dolor sit
					amet consectetur adtetur adipisiciipisicing elit.</a>
			</div>
			<div class="notice-box">
				<span class="next">다음글</span> <a href="#">Lorem, ipsum dolor sit
					amet consectetur adipisicing elit.</a>
			</div>
		</div>
	</div>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>