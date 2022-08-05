<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/searchInfo.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/memberCommon.css" />
	<div class="mx-auto mt-5 container p-5 shadow-sm border"  id="search-my-info">
		<h5 class="font-weight-bold pb-3 camper-color text-center m-0">비밀번호 재설정</h5>
	<%-- 들여쓰기 수정 --%>
		<form:form method="post" >
			<div class="mt-4 pt-4 input-group-lg">
				<input 
					type="password" class="form-control mb-3" name="password"
					placeholder="새 비밀번호" autocomplete="off" required>
					<span class="password-validation-msg text-danger"></span>
				<input
					type="password" class="form-control my-3 input-lg" name="password-confirm"
					placeholder="새 비밀번호 확인" autocomplete="off" required>
					<span class="password-confirm-validation-msg text-danger"></span>
			</div>
		    <button class="btn btn-camper-color btn-block btn-lg font-weight-bold mt-3">확인</button>
		    	<div class="d-flex pt-4">
				-<p class="pl-3">영문, 숫자, 특수문자(공백제외)를 모두 포함시켜 8~20자리로 입력하세요.</p>					
				</div>
		</form:form>
	</div>
	<script>
	
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>