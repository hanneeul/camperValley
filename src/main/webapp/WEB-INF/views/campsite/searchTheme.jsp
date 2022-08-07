<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/campsite/campsite.css" />

<!-- 캠핑장목록조회(테마검색) 페이지 (작성자:SJ) -->
<div class="d-flex justify-content-center campsite-search-wrap">
	<div class="container-md w-75 p-4 m-auto rounded campsite-search">
		<div class="row m-0">
			<div class="col search-header">테마검색</div>
			<div class="col">
				<button type="button" id="searchDetailBtn" class="btn btn-success btn-camper-color float-right">
					상세검색&nbsp;<i class="fa-solid fa-angle-right"></i>
				</button>
			</div>	
		</div>
		<hr />
		<div class="row m-0">
			<div class="btn-group-toggle col" data-toggle="buttons">
			  	<label class="btn btn-outline-success btn-outline-camper-color">
			    	<input type="checkbox">#테마1
			  	</label>
			</div>
			<div class="btn-group-toggle col" data-toggle="buttons">
			  	<label class="btn btn-outline-success btn-outline-camper-color">
			    	<input type="checkbox">#테마2
			  	</label>
			</div>
			<div class="btn-group-toggle col" data-toggle="buttons">
			  	<label class="btn btn-outline-success btn-outline-camper-color">
			    	<input type="checkbox">#테마3
			  	</label>
			</div>
			<div class="btn-group-toggle col" data-toggle="buttons">
			  	<label class="btn btn-outline-success btn-outline-camper-color">
			    	<input type="checkbox">#테마4
			  	</label>
			</div>
			<div class="btn-group-toggle col" data-toggle="buttons">
			  	<label class="btn btn-outline-success btn-outline-camper-color">
			    	<input type="checkbox">#테마5
			  	</label>
			</div>
			<div class="btn-group-toggle col" data-toggle="buttons">
			  	<label class="btn btn-outline-success btn-outline-camper-color">
			    	<input type="checkbox">#테마6
			  	</label>
			</div>
			<div class="btn-group-toggle col" data-toggle="buttons">
			  	<label class="btn btn-outline-success btn-outline-camper-color">
			    	<input type="checkbox">#테마7
			  	</label>
			</div>
		</div>
	</div>
</div>
<script>
/**
 * 상세검색 페이지로 이동
 */
document.querySelector("#searchDetailBtn").addEventListener('click', (e) => {
	location.href = '${pageContext.request.contextPath}/campsite/searchDetail';
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
						<span><i class="fa-solid fa-location-dot campsite-yellow"></i>&nbsp;○○도 ○○시</span>
						<span class="float-right"><i class="fa-solid fa-phone campsite-yellow"></i>&nbsp;070-0000-0000</span>
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
						<span><i class="fa-solid fa-location-dot campsite-yellow"></i>&nbsp;○○도 ○○시</span>
						<span class="float-right"><i class="fa-solid fa-phone campsite-yellow"></i>&nbsp;070-0000-0000</span>
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
						<span><i class="fa-solid fa-location-dot campsite-yellow"></i>&nbsp;○○도 ○○시</span>
						<span class="float-right"><i class="fa-solid fa-phone campsite-yellow"></i>&nbsp;070-0000-0000</span>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="p-2 flex-fill m-auto bg-light result-map">
		지도 영역
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>