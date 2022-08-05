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
				<a class="pr2 text-dark">캠퍼모집</a>
				<a class="pl-2 camper-color">작성후기</a>
			</div>
			<div class="d-flex mr-2">
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <button id="search-option" class="btn btn-outline-camper dropdown-toggle pb-4" type="button" data-toggle="dropdown" aria-expanded="false">제목&nbsp;&nbsp;&nbsp;</button>
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
		<hr class="m-0"/>
		<div class="review-list py-3" id="my-community-body">
			<table class="table table-hover mt-2 text-center border-bottom">
            	<thead>
                	<tr>
                        <th>
                          No.
                        </th>
                        <th>
                          제목
                         </th>
                         <th>
                            작성자
                    	 </th>
                         <th>
                            평점
                        </th>
                        <th>
                            추천수
                        </th>
                        <th>
                            조회수
                        </th>
                        <th>
                            작성일
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            1
                        </td>
                        <td class="text-left">
                            <a href="">제목제목</a>
                        </td>
                        <td>
                            닉네임
                        </td>
                        <td>
                            4
                        </td>
                        <td>
                            10
                        </td>
                        <td>
                            1
                        </td>
                        <td>
                            01/04/2012
                        </td>
	                    </tr>
                        <tr>
                        <td>
                            1
                        </td>
                        <td>
                            제목제목
                        </td>
                        <td>
                            닉네임
                        </td>
                        <td>
                            4
                        </td>
                        <td>
                            10
                        </td>
                        <td>
                            1
                        </td>
                        <td>
                            01/04/2012
                        </td>
                      </tr>
                      <tr>
                        <td>
                            1
                        </td>
                        <td>
                            제목제목
                        </td>
                        <td>
                            닉네임
                        </td>
                        <td>
                            4
                        </td>
                        <td>
                            10
                        </td>
                        <td>
                            1
                        </td>
                        <td>
                            01/04/2012
                        </td>
                      </tr>
                      <tr>
                        <td>
                            1
                        </td>
                        <td>
                            제목제목
                        </td>
                        <td>
                            닉네임
                        </td>
                        <td>
                            4
                        </td>
                        <td>
                            10
                        </td>
                        <td>
                            1
                        </td>
                        <td>
                            01/04/2012
                        </td>
	                    </tr>
                        <tr>
                        <td>
                            1
                        </td>
                        <td>
                            제목제목
                        </td>
                        <td>
                            닉네임
                        </td>
                        <td>
                            4
                        </td>
                        <td>
                            10
                        </td>
                        <td>
                            1
                        </td>
                        <td>
                            01/04/2012
                        </td>
                      </tr>
                      <tr>
                        <td>
                            1
                        </td>
                        <td>
                            제목제목
                        </td>
                        <td>
                            닉네임
                        </td>
                        <td>
                            4
                        </td>
                        <td>
                            10
                        </td>
                        <td>
                            1
                        </td>
                        <td>
                            01/04/2012
                        </td>
                      </tr>
                      <tr>
                        <td>
                            1
                        </td>
                        <td>
                            제목제목
                        </td>
                        <td>
                            닉네임
                        </td>
                        <td>
                            4
                        </td>
                        <td>
                            10
                        </td>
                        <td>
                            1
                        </td>
                        <td>
                            01/04/2012
                        </td>
	                    </tr>
                        <tr>
                        <td>
                            1
                        </td>
                        <td>
                            제목제목
                        </td>
                        <td>
                            닉네임
                        </td>
                        <td>
                            4
                        </td>
                        <td>
                            10
                        </td>
                        <td>
                            1
                        </td>
                        <td>
                            01/04/2012
                        </td>
                      </tr>
                      <tr>
                        <td>
                            1
                        </td>
                        <td>
                            제목제목
                        </td>
                        <td>
                            닉네임
                        </td>
                        <td>
                            4
                        </td>
                        <td>
                            10
                        </td>
                        <td>
                            1
                        </td>
                        <td>
                            01/04/2012
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
	
<script>
$('#search-option-item li > a').on('click', function() {
    // 버튼에 선택된 항목 텍스트 넣기 
    $('#search-option').text($(this).text());
    
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />