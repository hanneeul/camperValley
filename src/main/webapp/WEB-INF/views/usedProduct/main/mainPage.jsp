<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/usedProduct/sidebar.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/usedProduct/main.css"/>

<div id="section" style="width: 90%; margin:50px auto">
	<div class="container">
		<p class="usedProduct-title">캠퍼밸리 중고거래</p>
		<hr class="line"/>
		
		<!-- 검색창 영역 -->
		<div class="input-group">
		  <div class="form-outline">
		    <input type="search" id="form1" class="form-control" 
		    				placeholder="상품명, @닉네임 검색" style="border: 1px solid gray;"/>
		  </div>
		  <button type="button" class="btn btn-primary" style="background-color: #639A67;">
		    <i class="fas fa-search"></i>
		  </button>
		</div>
			
		<!-- 카테고리 선택 -->
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
			<div id="section">
				<div>
					<c:if test="${not empty display}">
						<jsp:include page="${display}" />
					</c:if>
					<c:if test="${empty display}">
						<jsp:include page="/WEB-INF/views/usedProduct/main/display.jsp"/>
					</c:if>
				</div>
			</div>
			<!-- 아이템  -->
		</div>
		
		<!-- nav -->
		<div id="nav">
			<jsp:include page="/WEB-INF/views/usedProduct/main/sidebar.jsp"/>
		</div>
	</div>
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