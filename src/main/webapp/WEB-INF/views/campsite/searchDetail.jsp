<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<script src="https://kit.fontawesome.com/97c6ec6a69.js" crossorigin="anonymous"></script>

<!-- 캠핑장목록조회(상세검색) 페이지 (작성자:수진) -->
<section id="campsiteSearchDetail" style="margin: 10px;">
	<div class="d-flex justify-content-center" style="background-color: lightgray; height: 350px;">
		<div class="container-md w-75 p-4 m-auto" style="background-color: beige;">
			<div class="row m-0">
				<div class="col">상세검색</div>
				<div class="col">
					<button type="button" class="btn btn-success float-right">테마검색&nbsp;<i class="fa-solid fa-angle-right"></i></button>
				</div>	
			</div>
			<hr />
			<div class="row m-0">
				<div class="col-md">
					<label for="location">지역</label>
					<button type="button" class="btn btn-outline-success">○○도 ○○시</button>
				</div>
				<div class="col-md-7 input-group mb-3">
					<label for="keywordSearch">키워드 검색</label>
					<input type="text" class="form-control" placeholder="검색어를 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2">
				  	<div class="input-group-append">
				    	<button class="btn btn-outline-secondary" type="button" id="button-addon2"><i class="fa-solid fa-magnifying-glass"></i></button>
				  	</div>
				</div>
				<div class="col-md">
					<button type="button" class="btn btn-success float-right"><i class="fa-regular fa-square-plus"></i>&nbsp;상세조건</button>
				</div>
			</div>
		</div>
	</div>
	<div class="d-flex bd-highlight w-75 p-3 m-auto">
		<div class="p-2 flex-fill bd-highlight">
			<div class="d-flex bd-highlight m-1" style="border: 1px solid beige;">
				<div style="width: 150px; height: 150px; background-color: beige;">
					캠핑장 이미지
				</div>
				<div style="width: 300px; height: 150px;">
					<ul style="list-style-type: none;">
						<li>[○○도 ○○시] ○○캠핑장</li>
						<li>낭만 가득한 프라이빗 캠핑장</li>
						<li>
							<span>○○도 ○○시</span>
							<span>070-0000-0000</span>
						</li>
					</ul>
				</div>
			</div>
			<div class="d-flex bd-highlight m-1" style="border: 1px solid beige;">
				<div style="width: 150px; height: 150px; background-color: beige;">
					캠핑장 이미지
				</div>
				<div style="width: 300px; height: 150px;">
					<ul style="list-style-type: none;">
						<li>[○○도 ○○시] ○○캠핑장</li>
						<li>낭만 가득한 프라이빗 캠핑장</li>
						<li>
							<span>○○도 ○○시</span>
							<span>070-0000-0000</span>
						</li>
					</ul>
				</div>
			</div>
			<div class="d-flex bd-highlight m-1" style="border: 1px solid beige;">
				<div style="width: 150px; height: 150px; background-color: beige;">
					캠핑장 이미지
				</div>
				<div style="width: 300px; height: 150px;">
					<ul style="list-style-type: none;">
						<li>[○○도 ○○시] ○○캠핑장</li>
						<li>낭만 가득한 프라이빗 캠핑장</li>
						<li>
							<span>○○도 ○○시</span>
							<span>070-0000-0000</span>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="p-2 flex-fill bd-highlight m-auto" style="width: 450px; height: 470px; background-color: beige;">
			지도 영역
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>