<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/searchInfo.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/memberCommon.css" />
	<div class="mx-auto mt-5 container p-5 shadow-sm border"  id="search-my-info">
		<div  class="d-flex justify-content-center" >
			<a href="${pageContext.request.contextPath}/member/searchId" class="btn btn-block font-weight-bold pb-3 ">아이디 찾기</a>
			<a href="${pageContext.request.contextPath}/member/searchPassword" class="btn btn-block m-0 font-weight-bold pb-3 camper-color">비밀번호 찾기</a>
		</div>
		<form:form method="post" >
			<div class="mt-4 pt-4 input-group-lg">
				<input 
					type="text" class="form-control mb-3" name="memberId"
					placeholder="아이디" autocomplete="off" required value="honggd">
				<input
					type="email" class="form-control my-3" name="email"
					placeholder="이메일" autocomplete="off" required value="honggd@gmail.com">
			</div>
			<div class="p-0 m-0" id="searchBox">
			    <button type="button" name="searchBtn" class="btn btn-camper-color btn-block btn-lg font-weight-bold">확인</button>
				<p class="pt-4">&nbsp;-&nbsp;&nbsp;&nbsp;가입시 등록한 아이디와 이메일을 입력해주세요.</p>	
			</div>
			<div class="d-none" id="authenticationBox">
				<hr class="my-4" />
				<div class="p-0 d-flex">
					<input type="text" class="form-control authentication-number" name="authenticationNumber" placeholder="인증번호"/>
					<button type="button" name="resend" class=" btn w-25 btn-block resend resend-btn font-weight-bold camper-color text-right">재전송</button>
				</div>	
					<button type="button" name="chkNo" class="my-3 btn btn-camper-color btn-block btn-lg font-weight-bold">확인</button>
			</div>			
		</form:form>
	</div>
	<script>
	$("button").on('click', function () {
		const headers = {
			"${_csrf.headerName}" : "${_csrf.token}"
		};
		
		$.ajax({
		url:'${pageContext.request.contextPath}/member/searchPassword',
		method:"post",
		headers,
		async:false,
		data : {
			memberId : $("input[name=memberId]").val(),
			email: $("input[name=email]").val()
		},
		success(response){
			console.log(response.match)
			if(response.match === 1){
				console.log(1);
				$("#searchBox").addClass('d-none');
				$("#authenticationBox").addClass('d-block');
			}else{
				alert("입력하신 정보와 일치하는 회원이 없습니다.");
			}
			
		},
		error: console.log
		}); 
		
		return false;
	});
	
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>