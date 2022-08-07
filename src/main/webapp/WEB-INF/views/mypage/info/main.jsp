<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/mypage.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/info/main.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="container">	
	<div class="row d-flex justify-content-between">
		<div class="col-lg-2">
			<jsp:include page="/WEB-INF/views/common/mypageSidebar.jsp" />
		</div>
		<div class="col-lg-10 pl-5 pr-2 mt-1" id="mypage-main-container">
		<%-- 본문시작 --%>
		<div class="px">
		  <div class="row justify-content-between" >
                <div class="col-md-6 align-self-center border-right pl-4 font-weight-bold">
                    <img alt="누구님의 프로필사진" src="${pageContext.request.contextPath}/resources/upload/member/oo.jpg" class="rounded-circle ml-3 mt-2 shadow" width="120px" height="120px"/>
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 닉네임
                    <a href="${pageContext.request.contextPath}/mypage/info/edit"  class="shadow-sm btn btn-camper d-block mt-3 ml-2 mb-2">
                        회원정보 수정
                    </a>
                </div>
                <div class="col-md-6 pl-4 ">
                    <h4 class="ml-3 mt-y mb-3 ">
                        중고거래 내역
                    </h4>
                    <div class="row text-center">
                        <div class="col-md-4 ">
                            <div class="m-4">
	                            <a href="${pageContext.request.contextPath}/mypage/trade/selling">
	                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="#639A67" class="bi bi-currency-dollar" viewBox="0 0 16 16">
									  <path d="M4 10.781c.148 1.667 1.513 2.85 3.591 3.003V15h1.043v-1.216c2.27-.179 3.678-1.438 3.678-3.3 0-1.59-.947-2.51-2.956-3.028l-.722-.187V3.467c1.122.11 1.879.714 2.07 1.616h1.47c-.166-1.6-1.54-2.748-3.54-2.875V1H7.591v1.233c-1.939.23-3.27 1.472-3.27 3.156 0 1.454.966 2.483 2.661 2.917l.61.162v4.031c-1.149-.17-1.94-.8-2.131-1.718H4zm3.391-3.836c-1.043-.263-1.6-.825-1.6-1.616 0-.944.704-1.641 1.8-1.828v3.495l-.2-.05zm1.591 1.872c1.287.323 1.852.859 1.852 1.769 0 1.097-.826 1.828-2.2 1.939V8.73l.348.086z"/>
									</svg>
								</a>
                            </div>
                            <a href="${pageContext.request.contextPath}/mypage/trade/selling" class="font-weight-bold">
                           		판매내역
                            </a>
                        </div>
                        <div class="col-md-4">
                            <div class="m-4">
	                            <a href="${pageContext.request.contextPath}/mypage/trade/purchased">
	                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="#639A67" class="bi bi-bag-fill" viewBox="0 0 16 16">
									  <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5z"/>
									</svg>
								</a>
                            </div>
                            <a href="${pageContext.request.contextPath}/mypage/trade/purchased" class="font-weight-bold">
                            	구매내역
                            </a>
                        </div>
                        <div class="col-md-4">
                            <div class="m-4">
	                            <a href="${pageContext.request.contextPath}/mypage/trade/wish">
	                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="#639A67" class="bi bi-heart-fill" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
									</svg>
								</a>
                            </div>
                            <a href="${pageContext.request.contextPath}/mypage/trade/wish" class="font-weight-bold">
                            	관심상품
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-12 d-flex justify-content-between p-0 pt-5 mt-5 mb-3">
                        <h4 class="mb-3 pt-2 ">
                            즐겨찾기한 캠핑장
                        </h4> 
                        <a type="button" class="btn btn-link ">
                            >> 더보기
                        </a>
                    </div>
                    <div class="listWrapper px-3 py-2">
					<div class="row bookmarkWrapper py-4">
						<div class="col-2 pl-3 d-flex align-items-center" id="imgWrapper">
							<div class="imgWrapper">
								<img class="campsiteImg" src="${pageContext.request.contextPath}/resources/images/mypage/advertiser/file.png" alt="메인 홈 슬라이드 배너 영역" />
							</div>
						</div>
						<div class="col campsiteInfo p-0 pl-3 pt-2"">
							<h5 class="mb-3 campsiteName">[ㅁㅁ도 ㅇㅇ시]블라블라숲 캠핑장</h5>
							<h6 class="pt-2 campsiteIntro">낭만 가득한 프라이빗 캠핑장</h6>
							<div class="d-flex detailInfo mt-4">
								<div>
									<i class="fa-solid fa-location-dot"></i>
									<span class="campsiteAddr">어쩔도 저쩔시 웅앵동 123</span>
								</div>
								<div>
									<i class="fa-solid fa-phone"></i>
									<span class="campsiteTel">070-0000-0000</span>
								</div>
							</div>
						</div>
					</div>
					<div class="row bookmarkWrapper py-4">
						<div class="col-2 pr-3 d-flex align-items-center" id="imgWrapper">
							<div class="imgWrapper">
								<img class="campsiteImg" src="${pageContext.request.contextPath}/resources/images/mypage/advertiser/file.png" alt="메인 홈 슬라이드 배너 영역" />
							</div>
						</div>
						<div class="col campsiteInfo  p-0 pl-3 pt-2">
							<h5 class="mb-3 campsiteName">[ㅁㅁ도 ㅇㅇ시]블라블라숲 캠핑장</h5>
							<h6 class="pt-2 campsiteIntro">낭만 가득한 프라이빗 캠핑장</h6>
							<div class="d-flex detailInfo mt-4">
								<div>
									<i class="fa-solid fa-location-dot"></i>
									<span class="campsiteAddr">어쩔도 저쩔시 웅앵동 123</span>
								</div>
								<div>
									<i class="fa-solid fa-phone"></i>
									<span class="campsiteTel">070-0000-0000</span>
								</div>
							</div>
						</div>
					</div>
				</div>
            <div class="row">
                <div class="col-md-12 mt-5">
                    <div class="col-md-12  d-flex justify-content-between p-0 mt-5">
                        <h4 class="mb-4">
                            작성후기
                        </h4> 
                        <a href="${pageContext.request.contextPath}/mypage/community/myReview" type="button" class="btn btn-link">
                            >> 더보기
                        </a>
                    </div>
                </div>
                <div class="col-md-12">
                    <table class="table table-hover border-bottom">
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
                                <td>
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
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row mt-3 mb-5">
                <div class="col-md-12">
                    <div class="col-md-12 d-flex justify-content-between p-0 mt-5">
                        <h4 class="mb-4">
                            캠퍼모집
                        </h4> 
                        <a type="button" class="btn btn-link">
                            >> 더보기
                        </a>
                    </div>
			<table class="table table-hover text-center border-bottom" id="#my-camper-table">
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
                </div>
            </div>
         </div>          
                      
		<%-- 본문끝 --%>
		</div>
	</div>
</div>