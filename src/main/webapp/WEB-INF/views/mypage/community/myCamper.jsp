<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/mypage.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/community/community.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="container">
	<div class="row d-flex justify-content-between">
		<div class="col-lg-2">
			<jsp:include page="/WEB-INF/views/common/mypageSidebar.jsp" />
		</div>
		<div class="col-lg-10 px-5">
		<%-- 본문 시작 --%>
		<h3 class="mt-1 mb-5">커뮤니티</h3>
		 
		<div class="d-flex justify-content-between align-items-center" id="my-community-header">
			<div class="d-flex">
				<a href="${pageContext.request.contextPath}/mypage/community/myCamper" class="pr2 camper-color">캠퍼모집</a>
				<a href="${pageContext.request.contextPath}/mypage/community/myReview" class="pl-2 text-dark">작성후기</a>
			</div>
			<div class="d-flex mr-2">
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <button id="search-option" class="btn btn-outline-camper dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">제목&nbsp;&nbsp;&nbsp;</button>
					  <ul id="search-option-item" class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
					    <li><a class="dropdown-item" href="#" value="title">제목&nbsp;&nbsp;&nbsp;</a></li>
					    <li><a class="dropdown-item" href="#" value="content">내용&nbsp;&nbsp;&nbsp;</a></li>
					  </ul>
				  </div>
				  <input type="text" class="form-control" aria-label="Text input with dropdown button">
				<button class="btn btn-outline-camper">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#639A67" class="bi bi-binoculars-fill" viewBox="0 0 16 16">
					  <path d="M4.5 1A1.5 1.5 0 0 0 3 2.5V3h4v-.5A1.5 1.5 0 0 0 5.5 1h-1zM7 4v1h2V4h4v.882a.5.5 0 0 0 .276.447l.895.447A1.5 1.5 0 0 1 15 7.118V13H9v-1.5a.5.5 0 0 1 .146-.354l.854-.853V9.5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v.793l.854.853A.5.5 0 0 1 7 11.5V13H1V7.118a1.5 1.5 0 0 1 .83-1.342l.894-.447A.5.5 0 0 0 3 4.882V4h4zM1 14v.5A1.5 1.5 0 0 0 2.5 16h3A1.5 1.5 0 0 0 7 14.5V14H1zm8 0v.5a1.5 1.5 0 0 0 1.5 1.5h3a1.5 1.5 0 0 0 1.5-1.5V14H9zm4-11H9v-.5A1.5 1.5 0 0 1 10.5 1h1A1.5 1.5 0 0 1 13 2.5V3z"/>
					</svg>
				</button>
				</div>
			</div>
		</div>
		<div class="review-list pb-3" id="my-community-body">
			<table class="table table-hover text-center border-bottom" id="my-camper-table">
            	<thead>
                	<tr>
                        <th>
                          상태
                        </th>
                        <th>
                          제목
                         </th>
                         <th>
                            작성자
                    	 </th>
                         <th>
                            캠핑기간
                        </th>
                        <th>
                            지역
                        </th>
                        <th>
                            모집인원
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                           	<select class="recruitment-status">
								<option value="">모집중</option>
								<option value="">모집완료</option>
							</select>
                        </td>
                        <td class="text-left">
                            <span class="title" data-toggle="modal" data-target="#camper-detail">제천 캠핑장 놀러가실분들...</span>
                        </td>
                        <td>
                            최강길동
                        </td>
                        <td>
                            2022-07-19 ~ 2022-07-20
                        </td>
                        <td>
                            충청북도 제천시
                        </td>
                        <td>
                            4명
                        </td>
	                    </tr>
                        <tr>
                        <td>
                           	<select class="recruitment-status">
								<option value="">모집중</option>
								<option value="">모집완료</option>
							</select>
                        </td>
                        <td class="text-left">
                            <span class="title" data-toggle="modal" data-target="#camper-detail">제천 캠핑장 놀러가실분들...</span>
                        </td>
                        <td>
                            최강길동
                        </td>
                        <td>
                            2022-07-19 ~ 2022-07-20
                        </td>
                        <td>
                            충청북도 제천시
                        </td>
                        <td>
                            4명
                        </td>
	                    </tr>
	                    <tr>
                        <td>
                           	<select class="recruitment-status">
								<option value="">모집중</option>
								<option value="">모집완료</option>
							</select>
                        </td>
                        <td class="text-left">
                            <span class="title" data-toggle="modal" data-target="#camper-detail">제천 캠핑장 놀러가실분들...</span>
                        </td>
                        <td>
                            최강길동
                        </td>
                        <td>
                            2022-07-19 ~ 2022-07-20
                        </td>
                        <td>
                            충청북도 제천시
                        </td>
                        <td>
                            4명
                        </td>
	                    </tr>
                  </tbody>
              </table>          
		</div>
		<%-- 페이징 --%>

		<div class="mt-3" id="pagebar-wrp">
			<jsp:include page="/WEB-INF/views/common/pagebar.jsp" />
		</div>
	</div>
		<%-- 본문 끝 --%>
	</div>
	</div>
	
		<div class="modal fade" id="camper-detail" tabindex="-1" role="dialog"
		aria-labelledby="camper-detail-label" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered px-5 modal-dialog-scrollable modal-lg" role="document">
				<div class="modal-content px-3  pt-3">
					<div class="modal-header  d-block  pb-4">
						<h4 class="text-center mb-4 font-weight-bold">캠퍼모집 제목</h4>
						<div class="d-flex justify-content-between font-weight-bold" >
							<div class="align-self-bottom align-self-end">
								2022-07-19 ~ 2022-07-20
								<br />
								충청북도 제천시
							</div>
							<div>
							<br />
								<div class="text-center">4명</div>
								<select class="recruitment-status font-weight-bold">
									<option value="" >모집중</option>
									<option value="">모집완료</option>
								</select>
							</div>
						</div>
					</div>
					<div class="modal-body py-4">
						<h6 class="font-weight-bold">상세내용</h6>
						<p>캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요. 캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요. 캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요. 캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요. 캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요. 캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요. 캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요.</p>
						<h6 class="font-weight-bold">이용수칙</h6>
						<p>캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요. 캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요. 캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요.</p>
						<h6 class="font-weight-bold">예상비용</h6>
						<p>캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요. 캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요.</p>
					</div>
					<div class="modal-footer px-0 pt-4">
							<a class="btn btn-outline-camper-color btn-lg border-2 shadow-sm">수정</a>
							<button class="btn btn-camper-color btn-lg shadow-sm" data-dismiss="modal">닫기</button>
					</div>
				</div>
	        </div>
		</div>
	
	
	
	
<script>
$('#search-option-item li > a').on('click', function() {
    // 버튼에 선택된 항목 텍스트 넣기 
    $('#search-option').text($(this).text());
    
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />