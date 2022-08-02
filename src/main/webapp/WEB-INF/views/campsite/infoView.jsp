<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/campsite/campsite.css" />

<!-- 캠핑장상세조회 페이지 (작성자:수진) -->
	<div class="container-md campsite-basic-info-wrap p-3">
		<div class="w-100 p-4 m-auto rounded campsite-info-view-wrap">
			<div class="row m-0">
				<div class="col-md info-view-title">
					<h4 class="font-weight-bold m-0">○○ 캠핑장</h4>
				</div>
				<div class="col-md info-view-back-btn">
					<button class="btn btn-success float-right" onclick="history.go(-1);">목록으로 돌아가기</button>
				</div>
			</div>
			<hr />
			<div class="row m-0 basic-info-wrap p-3">
				<div class="col-md basic-info-img bg-light">
					<img src="#" class="rounded" alt="">
				</div>
				<div class="col-md">
					<table class="table basic-info-table">
				    	<tr>
				      		<th scope="row">주소</th>
				      		<td>○○도 ○○시 ○○동</td>
				    	</tr>
				    	<tr>
				      		<th scope="row">문의처</th>
				      		<td>070-0000-0000</td>
				    	</tr>
				    	<tr>
				      		<th scope="row">캠핑장 유형</th>
				      		<td>일반야영장</td>
				    	</tr>
				    	<tr>
				      		<th scope="row">운영기간</th>
				      		<td>봄, 여름, 가을, 겨울</td>
				    	</tr>
				    	<tr>
				      		<th scope="row">운영일</th>
				      		<td>평일 + 주말</td>
				    	</tr>
				    	<tr>
				      		<th scope="row">홈페이지</th>
				      		<td><a href="#">홈페이지 바로가기</a></td>
				    	</tr>
				    	<tr>
				      		<th scope="row">예약방법</th>
				      		<td>전화</td>
				    	</tr>
				    	<tr>
				    		<td scope="col" colspan="2">
				    			<button type="button" id="bookmarkBtn" class="btn btn-success">
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
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>