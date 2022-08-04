<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community/review/review.css" />

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta3/dist/css/bootstrap-select.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta3/dist/js/bootstrap-select.min.js"></script>
<!-- (Optional) Latest compiled and minified JavaScript translation files -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta3/dist/js/i18n/defaults-*.min.js"></script>

<!-- 캠핑장후기목록조회 페이지 (작성자:SJ) -->
<div class="container-md campsite-review-list-wrap pt-2">
	<jsp:include page="/WEB-INF/views/community/communityHeading.jsp"/>
		<div class="col-md float-right">
			<div class="input-group align-items-center community-search-enroll">
		    	<select id="searchType" class="selectpicker" data-style="btn-outline-success btn-outline-camper-color">
					<option value="" disabled selected>선택</option>
					<option value="memberId">작성자</option>
				   	<option value="title">제목</option>
				    <option value="content">내용</option>
				</select>
				<input type="text" name="searchKeyword" class="form-control border-camper-color community-search-input rounded" placeholder="검색어를 입력하세요." aria-label="Recipient's username" aria-describedby="communitySearchBtn">
			  	<div class="input-group-append">
			    	<button class="btn btn-outline-success btn-outline-camper-color rounded" type="button" id="communitySearchBtn">
			    		<i class="fa-solid fa-magnifying-glass camper-color"></i>
			    	</button>
			  	</div>
				<div class="ml-1">
					<button type="button" id="communityEnrollBtn" class="btn btn-success bg-camper-color">글쓰기</button>
				</div>
			</div>
		</div>
	</div>
	<script>
	document.querySelector("#communityEnrollBtn").addEventListener('click', (e) => {
		location.href = "${pageContext.request.contextPath}/community/review/reviewEnroll";
	});
	
	/* communitySearchBtn 작동하는지 테스트. 삭제할 예정 */
	const communitySearchBtn = document.querySelector('#communitySearchBtn');
	const communitySearchInput = document.querySelector('.community-search-input');
	communitySearchBtn.addEventListener('click', () => {
		const communitySearchInputValue = communitySearchInput.value;
		alert(communitySearchInputValue);
	});
	</script>
	<hr />
	<div class="review-list py-3">
		<table class="table table-hover text-center review-list-table">
		  	<thead>
		    	<tr>
		      		<th scope="col">No.</th>
		      		<th scope="col">제목</th>
		      		<th scope="col">작성자</th>
		      		<th scope="col">평점</th>
		      		<th scope="col">추천수</th>
		      		<th scope="col">조회수</th>
		      		<th scope="col">작성일</th>
		    	</tr>
		  	</thead>
		  	<tbody>
		    	<tr>
		      		<th scope="row">1</th>
		      		<td>
		      			<a 
		      				class="font-weight-bold text-decoration-none review-title"
		      				href="${pageContext.request.contextPath}/community/review/reviewDetail">○○야영장 후기 (1)
		      			</a>
		      		</td>
		     		<td>캠퍼길동</td>
		      		<td>4</td>
		      		<td>2</td>
		      		<td>3</td>
		      		<td>2022-07-18</td>
		    	</tr>
		    	<tr>
		      		<th scope="row">1</th>
		      		<td>○○야영장 후기 (1)</td>
		     		<td>캠퍼길동</td>
		      		<td>4</td>
		      		<td>2</td>
		      		<td>3</td>
		      		<td>2022-07-18</td>
		    	</tr>
		    	<tr>
		      		<th scope="row">1</th>
		      		<td>○○야영장 후기 (1)</td>
		     		<td>캠퍼길동</td>
		      		<td>4</td>
		      		<td>2</td>
		      		<td>3</td>
		      		<td>2022-07-18</td>
		    	</tr>
		    	<tr>
		      		<th scope="row">1</th>
		      		<td>○○야영장 후기 (1)</td>
		     		<td>캠퍼길동</td>
		      		<td>4</td>
		      		<td>2</td>
		      		<td>3</td>
		      		<td>2022-07-18</td>
		    	</tr>
		    	<tr>
		      		<th scope="row">1</th>
		      		<td>○○야영장 후기 (1)</td>
		     		<td>캠퍼길동</td>
		      		<td>4</td>
		      		<td>2</td>
		      		<td>3</td>
		      		<td>2022-07-18</td>
		    	</tr>
		    	<tr>
		      		<th scope="row">1</th>
		      		<td>○○야영장 후기 (1)</td>
		     		<td>캠퍼길동</td>
		      		<td>4</td>
		      		<td>2</td>
		      		<td>3</td>
		      		<td>2022-07-18</td>
		    	</tr>
		  	</tbody>
		</table>
		<!-- CamperValleyUtils에서 가져올 예정! -->
		<div class="my-5">
			<jsp:include page="/WEB-INF/views/common/pagebar.jsp"></jsp:include>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>