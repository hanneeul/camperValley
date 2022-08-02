<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/usedProduct/index.css" />
<script src="https://kit.fontawesome.com/97c6ec6a69.js" crossorigin="anonymous"></script>

<!-- 검색창 영역 -->
<div class="search-area">
	<!-- 검색 입력 -->
	<div class="input-group">
		<!-- autocomplete=off 자동완성기능X -->
		<input id="searchProduct" name="searchProduct" type="text"
				autocomplete="off" placeholder=" 상품명, @상점명"> <i
				id="searchBtn" style="cursour:pointer;" onclick=""
				class="fas fa-search"></i>
	</div>
</div>

<!-- 상세 검색 -->
<div class="dropdown-button"
					style="margin-top: 20px; height: 25px;">
	<a id="btn_menu" class="cateList"> <i class="fas fa-bars"></i></a>
</div>

<div class="dropdown-area"
					style="display: inline-block; height: 0px;">
	<div>
		 <div class="dropmenu" style="display: none;">
			<ul>
				<li id="category">
					<p>카테고리 선택</p>
					<ul>
						<a href="">텐트/타프</a>
						<a href="">침낭/매트</a>
						<a href="">테이블/의자</a>
						<a href="">조명기구</a>
						<a href="">주방용품</a>
						<a href="">화로/버너/BBQ</a>
						<a href="">안전/위생용품</a>
						<a href="">전기/전자제품</a>
						<a href="">캠핑카/카라반/용품</a>
						<a href="">루프탑/트레일러</a>
						<a href="">차박용품</a>
						<a href="">의류/수납용품</a>
						<a href="">겨울용품</a>
						<a href="">기타캠핑용품</a>
						<a href="">기타생활용품</a>
					</ul>
				</li>
			</ul>
		</div>  
	</div>
</div>
<!-- container -->
<div class="content">

	<!-- section -->
	<div id="section" style="margin-left:-41.5px;">
		<div>
			<c:if test="${not empty display}">
				<jsp:include page="${display}" />
			</c:if>
			<c:if test="${empty display}">
				<jsp:include page="/WEB-INF/views/usedProduct/display.jsp"/>
			</c:if>
		</div>
	</div>
	<!-- 아이템  -->
</div>

<!-- nav -->
<div id="nav">
	<jsp:include page="/WEB-INF/views/usedProduct/nav.jsp"/>
</div>

<script>
// 카테고리 마우스 오버 이벤트
$("#btn_menu").hover(function(){
	// 카테고리 보이기
	$(".dropmenu").show();
})

// 카테고리 마우스 벗어나면 숨김
$(".dropmenu").mouseleave(function() {
	$(".dropmenu").hide();
})
</script>