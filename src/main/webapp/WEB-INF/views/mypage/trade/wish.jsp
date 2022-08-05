<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/mypage.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/trade/trade.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="container">	
	<div class="row d-flex justify-content-between">
		<div class="col-lg-2">
			<jsp:include page="/WEB-INF/views/common/mypageSidebar.jsp" />
		</div>
		<div class="col-lg-10 px-5">
		<%-- 본문시작 --%>
		   <h3 class="mt-1 mb-5">관심상품</h3>
		    <div >
		    <hr />
		        <div class="d-flex justify-content-between" class="mt-3 mb-5">
		            <div class="d-flex">
		            <a href=""><img src="/upload/member/ㅇㅇ.jpg" alt="" width="120px" class="mr-3 ml-3"></a>
		                <div class="d-flex">
		                    <ul class="list-unstyled mt-2">
		                        <li>
		                            <a href="" class="text-dark font-weight-bold">상품이름</a>
		                        </li>
		                        <li>100원</li>
		                        <br>
		                        <li>경기도 군포시 ~동</li>
		                    </ul>
		                </div>
		            </div>
		            <button class="border-0 bg-transparent">
			            <svg xmlns="http://www.w3.org/2000/svg" width="42" height="42" fill="rgb(241, 196, 15)" class="m2-1 mr-2 bi bi-heart-fill" viewBox="0 0 16 16">
							  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
						</svg>
					</button>
		        </div>
		        <hr />
		        	<div class="d-flex justify-content-between class="mt-3 mb-5">
		            <div class="d-flex">
		            <img src="/Final/img/ㅇㅇ.jpg" alt="" width="120px" class="mr-3 ml-3">
		                <div class="d-flex">
		                    <ul class="list-unstyled mt-2">
		                        <li>
		                            상품이름
		                        </li>
		                        <li>100원</li>
		                        <br>
		                        <li>경기도 군포시 ~동</li>
		                    </ul>
		                </div>
		            </div>
		            <button class="border-0 bg-transparent">
		            <svg xmlns="http://www.w3.org/2000/svg" width="42.5" height="42.5" fill="rgb(241, 196, 15)" class="bi bi-heart-fill mt-1 mr-2" viewBox="0 0 16 16">
						<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
					</svg>
		        </div>
		    </div>

		<%-- 본문끝 --%>
		</div>
	</div>
</div>