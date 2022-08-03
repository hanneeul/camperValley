<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community/camper/camperList.css" />
<div id="communitySection" class="container mx-auto mt-5">
	<div id="communityHeader" class="mx-auto">
		<div class="font-weight-bold text-center text-22" style="font-size: 22px;">커뮤니티</div>
		<nav class="nav">
			<a class="d-inline-block p-1 nav-link text-15 text-dark mr-2" id="active"  href="">캠퍼모집</a>
			<a class="d-inline-block p-1 nav-link text-15 text-dark" href="#">캠핑장후기</a>
		</nav>
	</div>
	<div id="camperSection" class="mt-5">
		<div id="listSection">
			</div>
		<div id="detailSection">
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />