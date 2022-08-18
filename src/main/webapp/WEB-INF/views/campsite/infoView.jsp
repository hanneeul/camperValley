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

<!-- 캠핑장상세조회 페이지 (작성자:SJ) -->
<div class="container-md campsite-basic-info-wrap p-3">
	<div class="w-100 p-4 m-auto rounded campsite-info-view-wrap">
		<div class="row m-0">
			<div class="col-md info-view-title">
				<h4 class="font-weight-bold m-0">${campsite.facltNm}</h4>
			</div>
			<div class="col-md info-view-back-btn">
				<button class="btn btn-success float-right bg-camper-color" onclick="history.go(-1);">
					<i class="fa-solid fa-arrow-rotate-left"></i>&nbsp;목록으로 돌아가기
				</button>
			</div>
		</div>
		<hr />
		<div class="row m-0 basic-info-wrap p-3 justify-content-center">
			<div class="col-md basic-info-img bg-light mr-3">
				<c:if test="${not empty campsite.firstImageUrl}">
					<img src="${campsite.firstImageUrl}" class="img-thumbnail" alt="${campsite.facltNm} 대표이미지">
				</c:if>
				<c:if test="${empty campsite.firstImageUrl}">
					<img src="${pageContext.request.contextPath}/resources/images/noImg.png" class="img-thumbnail" alt="${campsite.facltNm} 대표이미지">
				</c:if>
			</div>
			<div class="col-md ml-3">
				<table class="table basic-info-table mb-0">
			    	<tr>
			      		<th scope="row">주소</th>
	      				<td>${not empty campsite.addr1 ? campsite.addr1 : '-'} ${not empty campsite.addr2 ? campsite.addr2 : ''}</td>
			    	</tr>
			    	<tr>
			      		<th scope="row">문의처</th>
			      		<td>${not empty campsite.tel ? campsite.tel : '-'}</td>
			    	</tr>
			    	<tr>
			      		<th scope="row">캠핑장 유형</th>
			      		<td>${not empty campsite.induty ? campsite.induty : '-'}</td>
			    	</tr>
			    	<tr>
			      		<th scope="row">운영기간</th>
			      		<td>${not empty campsite.operPdCl ? campsite.operPdCl : '-'}</td>
			    	</tr>
			    	<tr>
			      		<th scope="row">운영일</th>
			      		<td>${campsite.operDeCl ? campsite.operDeCl : '-'}</td>
			    	</tr>
			    	<tr>
			      		<th scope="row">홈페이지</th>
			      		<td>
			      			<c:if test="${not empty campsite.homepage}">
			      				<a href="${campsite.homepage}">홈페이지 바로가기</a>
			      			</c:if>
			      			<c:if test="${empty campsite.homepage}">
			      				-
			      			</c:if>
			      		</td>
			    	</tr>
			    	<tr>
			      		<th scope="row">예약방법</th>
			      		<td>${not empty campsite.resveCl ? campsite.resveCl : '-'}</td>
			    	</tr>
			    	<tr>
			    		<td scope="col" colspan="2" class="pb-0">
			    			<button type="button" id="bookmarkBtn" class="btn btn-outline-success btn-outline-camper-color font-weight-bold">
			    				<i class="fa-solid fa-star"></i>&nbsp;즐겨찾기
			    			</button>
			    		</td>
			    	</tr>
			    </table>
			</div>
		</div>
	</div>
</div>
<div class="container campsite-info-tab-wrap p-3">
	<ul class="row nav nav-pills nav-justified" id="infoViewTab" role="tablist">
	  	<li class="nav-item" role="presentation">
	  	  <button class="col nav-link active" id="campsite-info-tab" data-toggle="tab" data-target="#campsiteInfo" type="button" role="tab" aria-controls="campsiteInfo" aria-selected="true">캠핑장소개</button>
	  	</li>
	  	<li class="nav-item" role="presentation">
	    	<button class="col nav-link" id="facility-info-tab" data-toggle="tab" data-target="#facilicyInfo" type="button" role="tab" aria-controls="facilicyInfo" aria-selected="false">시설정보</button>
	  	</li>
	  	<li class="nav-item" role="presentation">
	   	 	<button class="col nav-link" id="location-info-tab" data-toggle="tab" data-target="#locationInfo" type="button" role="tab" aria-controls="locationInfo" aria-selected="false">위치정보</button>
	  	</li>
	</ul>
	<div class="tab-content" id="infoViewTabContent">
	  	<div class="tab-pane fade show active p-4" id="campsiteInfo" role="tabpanel" aria-labelledby="campsite-info-tab">
	  		<ul class="list-group list-group-flush">
			  	<li class="list-group-item">				  
		  			<h6>
			  			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;캠핑장 시설
		  			</h6>
			  	</li>
			  	<li class="list-group-item">
			  		<span>기본시설</span>
			  	</li>
			  	<li class="list-group-item">
			  		<span>부가시설</span>
			  	</li>
			</ul>
	  	</div>
	  	<div class="tab-pane fade" id="facilicyInfo" role="tabpanel" aria-labelledby="facility-info-tab">
	  		<div class="tab-pane fade show active p-4" id="campsiteInfo" role="tabpanel" aria-labelledby="campsite-info-tab">
		  		<ul class="list-group list-group-flush">
				  	<li class="list-group-item">				  
			  			<h6>
				  			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;캠핑장 시설
			  			</h6>
				  	</li>
				  	<li class="list-group-item">
				  		<span>기본시설</span>
				  	</li>
				  	<li class="list-group-item">
				  		<span>부가시설</span>
				  	</li>
				</ul>
		  	</div>
	  	</div>
	  	<div class="tab-pane fade" id="locationInfo" role="tabpanel" aria-labelledby="location-info-tab">
	  		<div class="tab-pane fade show active p-4" id="campsiteInfo" role="tabpanel" aria-labelledby="campsite-info-tab">
		  		<ul class="list-group list-group-flush">
				  	<li class="list-group-item">				  
			  			<h6>
				  			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;캠핑장 시설
			  			</h6>
				  	</li>
				  	<li class="list-group-item">
				  		<span>기본시설</span>
				  	</li>
				  	<li class="list-group-item">
				  		<span>부가시설</span>
				  	</li>
				</ul>
		  	</div>
	  	</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>