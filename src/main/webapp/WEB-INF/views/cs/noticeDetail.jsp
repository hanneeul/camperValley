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
	border-bottom: 2px solid black;
}

.bar-notice {
	color: black !important;
}
.cs-bar {
	margin-bottom: 0px !important;
}
</style>


	<h5 class="cs-header text-center">공지사항</h5>
<div class="notice-wrap" style="width: 80%; float:none; margin:0 auto">

		<div class="cs-bar float-left">
		<a href="${pageContext.request.contextPath}/cs/noticeList" class="bar-notice">공지사항</a>
		<a href="${pageContext.request.contextPath}/cs/faq" class="bar-faq">자주 묻는 질문</a>
	</div>

		<div class="float-right">
			<button class="btn btn-success btn-sm" onclick="location.href='${pageContext.request.contextPath}/cs/noticeUpdate';">수정</button>
			<button class="btn btn-danger btn-sm">삭제</button>
		</div>

		<div class="container" style="display: inline">


			<div class="noticeDetail_head">
				<h4 class="notice__head">올해 야영장 사업자 안전교육 매뉴얼 배포</h4>
			</div>

			<div class="noticeSecond_head">
				<span class="noticeDetail_date">2022-06-08</span> <span
					class="noticeDetail_read">조회수 10</span>
			</div>

			<div class="noticeDetail_view">Lorem ipsum dolor sit, amet
				consectetur adipisicing elit. Excepturi sapiente necessitatibus
				quisquam, laboriosam quae voluptatem cumque et modi corrupti
				doloribus impedit officia voluptatibus, corporis est magnam quis
				incidunt amet. Placeat. Lorem ipsum dolor sit amet consectetur
				adipisicing elit. Facilis quis sunt libero, labore ullam placeat
				maxime officia ea vitae. Esse exercitationem obcaecati minima fugit
				magni facere vitae aut ipsa repellat! Placeat cumque commodi ipsum
				eligendi. Adipisci alias magnam excepturi corrupti mollitia nostrum,
				cupiditate libero molestiae quia quod quidem? Quaerat excepturi quia
				obcaecati, iure sequi dolores non provident corporis reiciendis
				recusandae. Provident deleniti esse cupiditate accusantium nam hic
				pariatur enim vero. Nulla minus in soluta! Dolorem veniam odit error
				ea quia natus ducimus amet earum labore non, enim hic ab! Sit.</div>

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