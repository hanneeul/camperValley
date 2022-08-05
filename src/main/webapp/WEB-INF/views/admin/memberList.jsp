<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/admin.css" />
<style>
.col-form-label {
	width: 80px;
	margin-left: 100px;
}
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<div class="container" style="display: flex;" id="admin-container">
	<jsp:include page="/WEB-INF/views/common/adminSidebar.jsp" />
	<div class="admin-content" style="width: 80%;">
		<h5 class="admin-hd">회원 관리</h5>
		<div class="search-box" style="display: flex;">
			<input class="ad-input-search" type="text" placeholder="전체 사용자 검색">
			<button class="ad-btn-search" type="button">
				<i class="fa fa-search"></i>
			</button>
		</div>
		<table class="table text-center" id="tb-member">
			<thead>
				<tr>
					<th>이름</th>
					<th>닉네임</th>
					<th>권한</th>
					<th>이메일</th>
					<th>상태</th>
					<th>최근 접속일</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>홍길동</td>
					<td>동그랑땡</td>
					<td>ROLE_USER</td>
					<td>honggd@naver.com</td>
					<td>블랙</td>
					<td>2022.08.03</td>
					<td>
						<button type="button" class="btn-update" data-toggle="modal" data-target="#adminMemberModal">
								<i class="fa-solid fa-ellipsis"></i>
							</button>
					</td>
				</tr>
				<tr>
					<td>홍길동</td>
					<td>동그랑땡</td>
					<td>ROLE_USER</td>
					<td>honggd@naver.com</td>
					<td>블랙</td>
					<td>2022.08.03</td>
					<td>
						<button type="button" class="btn-update" data-toggle="modal" data-target="#adminMemberModal">
								<i class="fa-solid fa-ellipsis"></i>
							</button>
					</td>
				</tr>
				<tr>
					<td>홍길동</td>
					<td>동그랑땡</td>
					<td>ROLE_USER</td>
					<td>honggd@naver.com</td>
					<td>블랙</td>
					<td>2022.08.03</td>
					<td>
						<button type="button" class="btn-update" data-toggle="modal" data-target="#adminMemberModal">
								<i class="fa-solid fa-ellipsis"></i>
							</button>
					</td>
				</tr>
				<tr>
					<td>홍길동</td>
					<td>동그랑땡</td>
					<td>ROLE_USER</td>
					<td>honggd@naver.com</td>
					<td>블랙</td>
					<td>2022.08.03</td>
					<td>
						<button type="button" class="btn-update" data-toggle="modal" data-target="#adminMemberModal">
								<i class="fa-solid fa-ellipsis"></i>
							</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<!-- 모달창 -->
<div class="modal fade" id="adminMemberModal" tabindex="-1" role="dialog" aria-labelledby="#adminMemberModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
	<div class="modal-content">
	  <div class="modal-header">
		<h5 class="modal-title" id="adminMemberModalLabel">회원정보</h5>
		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		  <span aria-hidden="true" style="color:#fff">&times;</span>
		</button>
	  </div>
	  <div class="modal-body pb-1">
		<form name="adminMemberUpdateFrm">
			<div class="form-group mt-4">
			  <label for="memberId" class="col-form-label">아이디</label>
			  <input type="text" class="input-member pt-1 pb-1 pl-2" id="memberId" value="honggd" readonly>
			</div>
			<div class="form-group">
			  <label for="name" class="col-form-label">이름</label>
			  <input type="text" class="input-member pt-1 pb-1 pl-2" id="name" value="홍길동"></input>
			</div>
			<div class="form-group">
			  <label for="nickname" class="col-form-label">닉네임</label>
			  <input type="text" class="input-member pt-1 pb-1 pl-2" id="nickname" value="동그랑땡"></input>
			</div>
			<div class="form-group">
			  <label for="email" class="col-form-label">이메일</label>
			  <input type="text" class="input-member pt-1 pb-1 pl-2" id="email" value="honggd@google.com"></input>
			</div>
			<div class="form-group">
			  <label for="phone" class="col-form-label">전화번호</label>
			  <input type="text" class="input-member pt-1 pb-1 pl-2" id="phone" value="010-1234-1234"></input>
			</div>
			 <div class="form-group">
					<label for="role" class="col-form-label">권한</label>
					<select class="member-role">
						<option value="">ROLE_USER</option>
						<option value="">ROLE_ADMIN</option>
					</select>
				  </div>
			<div class="form-group">
			  <p class="form-check form-check-inline mr-4 ml-6" style="margin-left: 100px;">블랙리스트</p>
			  <div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
				  <label class="form-check-label" for="inlineRadio1">일반</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
				  <label class="form-check-label" for="inlineRadio2">블랙</label>
				</div>
			</div>
		  </form>
		</div>
	  <div class="modal-footer">
		<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		<button type="button" class="btn btn-primary" id="btn-member-update">수정</button>
	  </div>
	</div>
  </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>