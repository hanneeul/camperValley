<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/usedProduct/main.css"/>
<script src="https://kit.fontawesome.com/97c6ec6a69.js" crossorigin="anonymous"></script>

<hr />
<!-- 광고 -->
<div class="adPlace">
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<ol class="carousel-indicators">
			<li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
				class="active"></li>
			<li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></li>
			<li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="" id="ad1" class="d-block w-100"
					alt="광고이미지" style="cursor: pointer;">
			</div>
			<div class="carousel-item">
				<img src="" id="ad2"
					class="d-block w-100" alt="ad2" style="cursor: pointer;">
			</div>
			<div class="carousel-item">
				<img src="" id="ad3"
					class="d-block w-100" alt="ad3" style="cursor: pointer;">
			</div>
		</div>
		<a class="carousel-control-prev mx-auto" href="#carouselExampleIndicators"
			role="button" data-bs-slide="prev" style="margin-top: 133px;"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Previous</span>
		</a> <a class="carousel-control-next mx-auto" href="#carouselExampleIndicators"
			role="button" data-bs-slide="next" style="margin-top: 133px;"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Next</span>
		</a>
	</div>
</div>

<div id="displayHeader">
	<p class="displayName">전체 상품 목록</p>
</div>

<div id="display-list" class="row">
	<!-- for 구문 -->
		<div class="item col-3"
			onclick="location.href=''">
			<div class="item">
				<div id="itemSolid">
					<img src="${pageContext.request.contextPath}/resources/images/usedProduct/travlerPouch.jpg" class="rounded float-start" alt="상품이미지">
					<h5 id="displayTitle">&nbsp&nbsp상품 이름</h5>
					<div class="price-time">
						<p class="displayPrice">&nbsp&nbsp000000원</p>
						<h5 class="displayTime">몇일 전&nbsp&nbsp</h5>
					</div>
				</div>
			</div>
		</div>
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
				
<!-- for문 부분 -->

<div id="moreShow" style="text-align: center;">
	<a id="pe-auto" class="pe-auto" onclick="" 
		style="cursor: pointer; text-decoration: none; color: #61615b; font-size: 20px; line-height: 0.01em;">더 보기<br>▼
	</a>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>