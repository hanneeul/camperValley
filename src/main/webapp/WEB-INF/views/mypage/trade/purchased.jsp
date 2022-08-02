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
		<div class="col-lg-10">
		<%-- 본문시작 --%>
		   <h4 class="mt-3 mb-5">구매내역</h4>
		    <div >
		        <div class="d-flex justify-content-between class="mt-3 mb-5">
		            <div class="d-flex">
		            <img src="/upload/member/ㅇㅇ.jpg" alt="" width="120px" class="mr-3 ml-3">
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
		                <a href="거래후기url" class="btn btn-success btn-sm align-self-center mr-3" >거래후기 작성</a>
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
		                <a href="거래후기url" class="btn btn-outline-success btn-sm align-self-center mr-3" >거래후기 수정</a>
		        </div>
		    </div>

		<%-- 본문끝 --%>
		</div>
	</div>
</div>