<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/mypage.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/info/edit.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="container">	
	<div class="row d-flex justify-content-between">
		<div class="col-lg-2">
			<jsp:include page="/WEB-INF/views/common/mypageSidebar.jsp" />
		</div>
		<div class="col-lg-10 px-5 mt-2" id="edit-container">
		<%-- 본문시작 --%>
		<h4>
			회원정보관리
		</h4>
		<!-- <hr> -->
		<form action="" class="shadow-sm">
            <table  style="width: 40rem;">
			<tbody>
				<tr>
					<td rowspan="2" style="width:9.5rem;">
						<input type="file" accept="image/*" name="" id="file" />
						<img id="profileImg" alt="누구님의 프로필사진" src="${pageContext.request.contextPath}/resources/upload/member/oo.jpg" class="rounded-circle shadow-sm mt-2" width="100px" height="100px"/>
					</td>
					<td style="width:6.4rem;"class="font-weight-bold">
						아이디
					</td>
					<td colspan="2" style="width:14rem;">
                            honggd
					</td>
				</tr>
				<tr>
					<td class="font-weight-bold">
						닉네임
					</td>
					<td>
						<input type="text" class="form-control" name="name" id="name" placeholder="닉네임" autocomplete="off" required>
						<input type="hidden" id="idValid" value="0" /> <!-- 0-사용불가 1-사용가능 -->
					</td>
					<td style="width:6.6rem; text-align: right;">
						<button class="btn btn-outline-secondary">중복확인</button>
					</td>
				</tr>
				<tr>
					<td class="font-weight-bold">
						이름
					</td>
					<td colspan="3">
						<input type="text" class="form-control" name="name" id="name" placeholder="이름" autocomplete="off" required>
					</td>
                    </tr>
                    <tr >
					<td class="font-weight-bold">
						새 비밀번호
					</td>
					<td colspan="3">
						<input type="password" class="form-control" name="password" id="password" placeholder="새 비밀번호" autocomplete="off" required>
					</td>								
				</tr>
                    <tr>
					<td class="font-weight-bold">
						새 비밀번호 확인
					</td>
					<td colspan="3">
						<input type="password" class="form-control" id="passwordCheck" placeholder="새 비밀번호확인" autocomplete="off" required>
					</td>								
					</tr>
                    <tr>
						<td class="font-weight-bold">
							이메일
						</td>
						<td colspan="2">
							<input type="email" class="form-control" placeholder="이메일" name="email" id="email" autocomplete="off" required>
						</td>
						<td style="width:6.6rem; text-align: right;">
							<button class="btn btn-outline-secondary">중복확인</button>
						</td>							
					</tr>
                    <tr>
						<td class="font-weight-bold">
							전화번호
						</td>
						<td colspan="3">
							<input type="tel" class="form-control" placeholder="-없이 입력하세요" name="phone" id="phone" maxlength="11" autocomplete="off" required>
						</td>								
					</tr>
				</tbody>
			</table>
		</form>
		<!-- <hr> -->
			<div style="text-align: right; ">
				<a href="#" class="btn btn-outline-secondary" type="button">회원탈퇴</a> 
			</div>
			<div style="text-align: center;">
				<button type="button" class="btn btn-success shadow-sm">
					회원정보 수정하기
				</button>
			</div>
			<script>
				$("#profileImg").click(()=>{
					$("#file").click();
				});
				$("input[type=file]").on("change", function (e) {
					        if (e.target.files && e.target.files[0]) {
					            var reader = new FileReader();
					            reader.onload = function (e) {
					                $('#profileImg').attr('src', e.target.result);
					            };
					            reader.readAsDataURL(e.target.files[0]);
					        } else {
					            document.getElementById('profileImg').src = "";
					        }
					    });
				
			</script>
		<%-- 본문끝 --%>
		</div>
	</div>
</div>