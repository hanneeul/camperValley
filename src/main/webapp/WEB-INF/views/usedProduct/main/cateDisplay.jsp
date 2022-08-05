<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/usedProduct/main.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/usedProduct/sidebar.css"/>
<script src="https://kit.fontawesome.com/97c6ec6a69.js" crossorigin="anonymous"></script>

<div id="section" style="width: 90%; margin:50px auto"> auto">
	<div id="productTop">
		<!-- 상품+개수 -->
		<div>
			<span id="productName">캠핑용품</span>
										<span style="color: #639A67">수저파우치</span>&nbsp;<span
					class="productNum">1</span>
		</div>
	</div>
	
	<div class="productListTop" style="height: 30px;">
		<div class="listTopInner">
			<div class="group" style="float: right;">
				<!-- DB-카테고리 정렬 -->
				<a class="groupChecked">최신순</a> <a
					class="groupOther">인기순</a> <a
					class="groupOther">저가순</a> <a
					class="groupOther">고가순</a>
			</div>
		</div>
	</div>
	
	<div id="display-list" class="row" style="width: 100%;">
			<div class="item col-3"
			onclick="location.href=''">
			<div class="item">
				<div id="itemSolid">
					<img src="${pageContext.request.contextPath}/resources/images/usedProduct/travlerPouch.jpg" class="rounded float-start" alt="상품이미지">
					<h5 id="displayTitle">&nbsp상품 제목</h5>
					<div class="price-time">
						<p class="displayPrice">&nbsp&nbsp000000원</p>
						<h5 class="displayTime">몇일 전&nbsp&nbsp</h5>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- sidebar -->
	<div id="nav">
		 <jsp:include page="/WEB-INF/views/usedProduct/main/sidebar.jsp"/>
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>