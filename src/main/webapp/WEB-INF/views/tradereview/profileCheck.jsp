<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>profile check</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<!-- bootstrap js -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	<!-- bootstrap css -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<!-- 사용자작성 css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tradereview/profileCheck.css" />
	<!-- font awesome -->
	<spring:eval var="fontawesomeKey" expression="@customProperties['api.fontawesome']" />
	<script src="https://kit.fontawesome.com/${fontawesomeKey}.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="modal fade" id="profileCheck">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content px-5 py-2">
				<div class="modal-header px-2 py-3">
					<div>
						<div><i class="fa-solid fa-circle-user fa-6x" style="color: #639A67;"></i></div>
					</div>
					<div class="ml-5">
						<div class="text-15">캠퍼길동</div>
						<div>
							<span class="text-13">판매상품 : 10개, </span>
							<span class="text-13">거래리뷰 : 12개</span>
						</div>
						<div class="mt-4">
							<span><i class="fa-solid fa-star"></i></span>
							<span>&nbsp;4.5점</span>
						</div>
					</div>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
					<div class="modal-body px-0 my-3">
						<div class="col-md-7 mb-4">
							<ul class="nav profile-nav">
							  	<li id="productList" class="nav-item mr-3 active">판매상품</li>
							  	<li id="reviewList" class="nav-item">거래리뷰</li>
							</ul>
						</div>
						
						<%-- product Box --%>
						<%-- 
						<div class="productBox d-flex ml-3 mb-4">
							<div class="image col-md-3 px-0">
								<img src="${pageContext.request.contextPath}/resources/images/index/caravan.jpg" />
							</div>
							<div class="info col-md-9 px-0">
								<div class="d-flex justify-content-between">
									<div class="title text-15 font-weight-bold">Title Title Title Title</div>
									<div class="createdAt text-13 text-secondary">2022-07-20</div>
								</div>
								<div class="price my-2">20,000원</div>
								<div class="content text-13">좋은 상품입니다. 좋은 상품입니다. 좋은 상품입니다. 좋은 상품입니다. ...더보기</div>
							</div>
						</div>
						<div class="productBox d-flex ml-3 mb-4">
							<div class="image col-md-3 px-0">
								<img src="${pageContext.request.contextPath}/resources/images/index/caravan.jpg" />
							</div>
							<div class="info col-md-9 px-0">
								<div class="d-flex justify-content-between">
									<div class="title text-15 font-weight-bold">Title Title Title Title</div>
									<div class="createdAt text-13 text-secondary">2022-07-20</div>
								</div>
								<div class="price my-2 font-weight-bold">20,000원</div>
								<div class="content text-13">좋은 상품입니다. 좋은 상품입니다. 좋은 상품입니다. 좋은 상품입니다. ...더보기</div>
							</div>
						</div>
						<div class="productBox d-flex ml-3 mb-4">
							<div class="image col-md-3 px-0">
								<img src="${pageContext.request.contextPath}/resources/images/index/caravan.jpg" />
							</div>
							<div class="info col-md-9 px-0">
								<div class="d-flex justify-content-between">
									<div class="title text-15 font-weight-bold">Title Title Title Title</div>
									<div class="createdAt text-13 text-secondary">2022-07-20</div>
								</div>
								<div class="price my-2">20,000원</div>
								<div class="content text-13">좋은 상품입니다. 좋은 상품입니다. 좋은 상품입니다. 좋은 상품입니다. ...더보기</div>
							</div>
						</div> 
						--%>
						
						
						<%-- review Box --%>
						<div class="reviewBox d-flex ml-3 mb-5">
							<div class="image col-md-3 px-0">
								<i class="fa-solid fa-circle-user fa-5x" style="color:rgb(235,235,235);"></i>
							</div>
							<div class="info col-md-9 px-0">
								<div class="d-flex justify-content-between">
									<div>
										<span>
											<i class="fa-solid fa-star fa-xs"></i>
											<i class="fa-solid fa-star fa-xs"></i>
											<i class="fa-solid fa-star fa-xs"></i>
											<i class="fa-solid fa-star fa-xs"></i>
											<i class="fa-solid fa-star fa-xs"></i>
										</span>
										<span class="ml-2 text-14">	캠퍼길동</span>
									</div>
									<div class="report text-13 text-secondary mt-1">
										<i class="fa-regular fa-lightbulb fa-sm position-relative"></i>
										<span>신고하기</span>
									</div>
								</div>
								<div class="content text-13">
									좋은 상품입니다. 좋은 상품입니다. 좋은 상품입니다. 좋은 상품입니다.
									좋은 상품입니다. 좋은 상품입니다. 좋은 상품입니다.
								</div>
								<div class="text-right text-secondary text-13">2022-07-20</div>
							</div>
						</div>
						<div class="reviewBox d-flex ml-3 mb-5">
							<div class="image col-md-3 px-0">
								<i class="fa-solid fa-circle-user fa-5x" style="color:rgb(235,235,235);"></i>
							</div>
							<div class="info col-md-9 px-0">
								<div class="d-flex justify-content-between">
									<div>
										<span>
											<i class="fa-solid fa-star fa-xs"></i>
											<i class="fa-solid fa-star fa-xs"></i>
											<i class="fa-solid fa-star fa-xs"></i>
											<i class="fa-solid fa-star fa-xs"></i>
											<i class="fa-solid fa-star fa-xs"></i>
										</span>
										<span class="ml-2 text-14">	캠퍼길동</span>
									</div>
									<div class="report text-13 text-secondary mt-1">
										<i class="fa-regular fa-lightbulb fa-sm position-relative"></i>
										<span>신고하기</span>
									</div>
								</div>
								<div class="content text-13">
									좋은 상품입니다. 좋은 상품입니다. 좋은 상품입니다. 좋은 상품입니다.
									좋은 상품입니다. 좋은 상품입니다. 좋은 상품입니다.
								</div>
								<div class="text-right text-secondary text-13">2022-07-20</div>
							</div>
						</div>
						<div class="reviewBox d-flex ml-3 mb-5">
							<div class="image col-md-3 px-0">
								<i class="fa-solid fa-circle-user fa-5x" style="color:rgb(235,235,235);"></i>
							</div>
							<div class="info col-md-9 px-0">
								<div class="d-flex justify-content-between">
									<div>
										<span>
											<i class="fa-solid fa-star fa-xs"></i>
											<i class="fa-solid fa-star fa-xs"></i>
											<i class="fa-solid fa-star fa-xs"></i>
											<i class="fa-solid fa-star fa-xs"></i>
											<i class="fa-solid fa-star fa-xs"></i>
										</span>
										<span class="ml-2 text-14">	캠퍼길동</span>
									</div>
									<div class="report text-13 text-secondary mt-1">
										<i class="fa-regular fa-lightbulb fa-sm position-relative"></i>
										<span>신고하기</span>
									</div>
								</div>
								<div class="content text-13">
									좋은 상품입니다. 좋은 상품입니다. 좋은 상품입니다. 좋은 상품입니다.
									좋은 상품입니다. 좋은 상품입니다. 좋은 상품입니다.
								</div>
								<div class="text-right text-secondary text-13">2022-07-20</div>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
</body>
<script>
$("#profileCheck")
.modal()
.on('hide.bs.modal', (e) => {
});

$(".profile-nav li").click((e) => {
	$(".profile-nav li").removeClass("active");
	$(e.target).addClass("active");
});
</script>
</html>