<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/campsite/campsite.css" />

<!-- 캠핑장목록조회(상세검색) 페이지 (작성자:수진) -->
	<div class="d-flex justify-content-center campsite-search-wrap">
		<div class="container-md w-75 p-4 m-auto rounded campsite-search">
			<div class="row m-0">
				<div class="col search-header">상세검색</div>
				<div class="col">
					<button type="button" id="searchThemeBtn" class="btn btn-success float-right">
						테마검색&nbsp;<i class="fa-solid fa-angle-right"></i>
					</button>
				</div>
			</div>
			<hr />
			<div class="row m-0">
				<div class="col-md">
					<label for="location">지역</label>
					<button type="button" class="btn btn-outline-success">○○도 ○○시</button>
				</div>
				<div class="col-md-7 input-group">
					<label for="keywordSearch">키워드 검색</label>&nbsp;
					<input type="text" class="form-control" placeholder="검색어를 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2">
				  	<div class="input-group-append">
				    	<button class="btn btn-outline-success" type="button" id="button-addon2"><i class="fa-solid fa-magnifying-glass"></i></button>
				  	</div>
				</div>
				<div class="col-md">
					<button type="button" id="conditions-btn" class="btn btn-success float-right" data-toggle="modal" data-target="#conditionsModal">
						<i class="fa-regular fa-square-plus"></i>&nbsp;상세조건
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- modal insert -->
	<%-- 나중에 파일 분리? --%>
	<div class="modal fade" id="conditionsModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="conditionsModalLabel" aria-hidden="true">
	  	<div class="modal-dialog modal-dialog-scrollable">
	    	<div class="modal-content">
		      	<div class="modal-header">
		        	<h5 class="modal-title" id="conditionsModalLabel">상세조건</h5>
		        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          	<span aria-hidden="true">&times;</span>
		        	</button>
		      	</div>
		      	<div class="modal-body">
		        	<h6>운영형태</h6>
		        	<div class="form-check-inline form-check">
						<input type="checkbox" class="form-check-input" name="facltDivNm" id="facltDivNm0" value="지자체">
						<label for="facltDivNm0" class="form-check-label">지자체</label>&nbsp;
						<input type="checkbox" class="form-check-input" name="facltDivNm" id="facltDivNm1" value="국립공원">
						<label for="facltDivNm1" class="form-check-label">국립공원</label>&nbsp;
						<input type="checkbox" class="form-check-input" name="facltDivNm" id="facltDivNm2" value="자연휴양림">
						<label for="facltDivNm2" class="form-check-label">자연휴양림</label>&nbsp;
						<input type="checkbox" class="form-check-input" name="facltDivNm" id="facltDivNm3" value="국민여가">
						<label for="facltDivNm3" class="form-check-label">국민여가</label>&nbsp;
						<input type="checkbox" class="form-check-input" name="facltDivNm" id="facltDivNm4" value="민간">
						<label for="facltDivNm4" class="form-check-label">민간</label>&nbsp;
					</div>
					<hr />
					<h6>입지구분</h6>
		        	<div class="form-check-inline form-check">
						<input type="checkbox" class="form-check-input" name="lctCl" id="lctCl0" value="해변">
						<label for="lctCl0" class="form-check-label">해변</label>&nbsp;
						<input type="checkbox" class="form-check-input" name="lctCl" id="lctCl1" value="계곡">
						<label for="lctCl1" class="form-check-label">계곡</label>&nbsp;
						<input type="checkbox" class="form-check-input" name="lctCl" id="lctCl2" value="숲">
						<label for="lctCl2" class="form-check-label">숲</label>&nbsp;
					</div>
		      	</div>
		      	<div class="modal-footer">
		        	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		        	<button type="button" class="btn btn-success conditions-submit-btns">확인</button>
		      	</div>
	    	</div>
	  	</div>
	</div>
	<script>
	/**
	 * 테마검색 페이지로 이동
	 */
	document.querySelector("#searchThemeBtn").addEventListener('click', (e) => {
		location.href = '${pageContext.request.contextPath}/campsite/searchTheme';
	});
	
	document.querySelector("#conditions-submit-btns").addEventListener('submit', (e) => {
		
	});
	</script>
	<div class="d-flex bd-highlight w-100 p-3 m-auto campsite-result-wrap">
		<div class="p-2 flex-fill bd-highlight campsite-result">
			<div class="d-flex bd-highlight m-1 result-list-wrap border border-light">
				<div class="result-list-img bg-light">
					캠핑장 이미지
					<img src="..." class="img-thumbnail" alt="...">
				</div>
				<div class="result-list-content">
					<ul class="list-group list-group-flush">
						<li class="list-group-item">
							<h6>[○○도 ○○시] ○○캠핑장</h6>
						</li>
						<li class="list-group-item border-bottom-0">낭만 가득한 프라이빗 캠핑장</li>
						<li class="list-group-item border-top-0">
							<span>○○도 ○○시</span>
							<span class="float-right">070-0000-0000</span>
						</li>
					</ul>
				</div>
			</div>
			<div class="d-flex bd-highlight m-1 result-list-wrap border border-light">
				<div class="result-list-img bg-light">
					캠핑장 이미지
					<img src="..." class="img-thumbnail" alt="...">
				</div>
				<div class="result-list-content">
					<ul class="list-group list-group-flush">
						<li class="list-group-item">
							<h6>[○○도 ○○시] ○○캠핑장</h6>
						</li>
						<li class="list-group-item border-bottom-0">낭만 가득한 프라이빗 캠핑장</li>
						<li class="list-group-item border-top-0">
							<span>○○도 ○○시</span>
							<span class="float-right">070-0000-0000</span>
						</li>
					</ul>
				</div>
			</div>
			<div class="d-flex bd-highlight m-1 result-list-wrap border border-light">
				<div class="result-list-img bg-light">
					캠핑장 이미지
					<img src="..." class="img-thumbnail" alt="...">
				</div>
				<div class="result-list-content">
					<ul class="list-group list-group-flush">
						<li class="list-group-item">
							<h6>[○○도 ○○시] ○○캠핑장</h6>
						</li>
						<li class="list-group-item border-bottom-0">낭만 가득한 프라이빗 캠핑장</li>
						<li class="list-group-item border-top-0">
							<span>○○도 ○○시</span>
							<span class="float-right">070-0000-0000</span>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="p-2 flex-fill m-auto bg-light result-map">
			지도 영역
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>