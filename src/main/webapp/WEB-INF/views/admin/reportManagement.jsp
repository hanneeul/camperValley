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
	width: 80px !important;
	margin-left: 70px !important;
}

</style>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<div class="container" style="display: flex;" id="admin-container">
	<jsp:include page="/WEB-INF/views/common/adminSidebar.jsp" />
	<div class="admin-content" style="width: 80%;">
			<h5 class="admin-hd">신고 내역 관리</h5>

				<div class="report-hd" style="margin-top:40px;">

					<div class="select-box float-left" style="font-size: 0.87rem;">
						
						<label for="report-category">신고유형</label>
						<select class="report-category">
							<option>전체</option>
							<option>Ketchup</option>
							<option>Relish</option>
						</select>
						
						<label for="report-state" style="margin-left:20px;">상태</label>
						<select class="report-state" >
							<option>전체</option>
							<option>미처리</option>
							<option>처리</option>
						</select>
					</div>
					<div class="search-group float-right mb-2">
						<input class="input-search" type="text" placeholder="사용자 검색">
						<button class="btn-search" type="button">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div> <!--report-hd-->
					
			<table class="table table-hover text-center" id="tb-admin">
				<thead style="border-top: 2px solid #dee2e6;">
					<tr>
						<th class="col-md-1">No.</th>
						<th>회원ID</th>
						<th>신고자ID</th>
						<th class="col-md-2">신고유형</th>
						<th class="col-md-3">신고일</th>
						<th>상태</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>48</td>
						<td>honggd</td>
						<td>sinsa</td>
						<td>언어 폭력(~~~)</td>
						<td>2022-08-04 10:00:12</td>
						<td>미처리</td>
						<td>
							<button type="button" class="btn-update" data-toggle="modal" data-target="#adminReportModal">
								<i class="fa-solid fa-ellipsis"></i>
							</button>
						</td>
					</tr>
					<tr>
						<td>48</td>
						<td>honggd</td>
						<td>sinsa</td>
						<td>언어 폭력(~~~)</td>
						<td>2022-08-04 10:00:12</td>
						<td>미처리</td>
						<td>
							<button type="button" class="btn-update" data-toggle="modal" data-target="#adminReportModal">
								<i class="fa-solid fa-ellipsis"></i>
							</button>
						</td>
					</tr>
					<tr>
						<td>48</td>
						<td>honggd</td>
						<td>sinsa</td>
						<td>언어 폭력(~~~)</td>
						<td>2022-08-04 10:00:12</td>
						<td>미처리</td>
						<td>
							<button type="button" class="btn-update" data-toggle="modal" data-target="#adminReportModal">
								<i class="fa-solid fa-ellipsis"></i>
							</button>
						</td>
					</tr>
					<tr>
						<td>48</td>
						<td>honggd</td>
						<td>sinsa</td>
						<td>언어 폭력(~~~)</td>
						<td>2022-08-04 10:00:12</td>
						<td>미처리</td>
						<td>
							<button type="button" class="btn-update" data-toggle="modal" data-target="#adminReportModal">
								<i class="fa-solid fa-ellipsis"></i>
							</button>
						</td>
					</tr>
					<tr>
						<td>48</td>
						<td>honggd</td>
						<td>sinsa</td>
						<td>언어 폭력(~~~)</td>
						<td>2022-08-04 10:00:12</td>
						<td>미처리</td>
						<td>
							<button type="button" class="btn-update" data-toggle="modal" data-target="#adminReportModal">
								<i class="fa-solid fa-ellipsis"></i>
							</button>
						</td>
					</tr>
				</tbody>
			</table>
	</div>
</div>

<!-- 모달창 -->
<div class="modal fade" id="adminReportModal" tabindex="-1" role="dialog" aria-labelledby="#adminReportModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
	<div class="modal-content">
	  <div class="modal-header">
		<h5 class="modal-title" id="adminReportModalLabel">신고처리</h5>
		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		  <span aria-hidden="true" style="color:#fff">&times;</span>
		</button>
	  </div>
	  <div class="modal-body pb-1">
		<form name="adminMemberUpdateFrm">
			<div class="form-group mt-4">
			  <label for="memberId" class="col-form-label">회원ID</label>
			  <input type="text" class="input-report pt-1 pb-1 pl-2" id="" value="honggd" readonly>
			</div>
			<div class="form-group">
			  <label for="name" class="col-form-label">신고자ID</label>
			  <input type="text" class="input-report pt-1 pb-1 pl-2" id="" value="sinsa" readonly></input>
			</div>
			<div class="form-group">
			  <label for="nickname" class="col-form-label">신고유형</label>
			  <input type="text" class="input-report pt-1 pb-1 pl-2" id="" value="언어폭력(~~~)" readonly></input>
			</div>

			<div class="form-group">
				<label for="message-text" class="col-form-label float-left mr-1">신고내용</label>
				<textarea class="input-report pt-1 pb-1 pl-2" id="" style="display: inline; height: 100px;" readonly>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint provident voluptates veritatis nobis fuga optio modi cum minima explicabo est maxime magni doloremque dicta nihil temporibus esse ipsum numquam aliquam?</textarea>
			  </div>

			<div class="form-group">
			  <label for="phone" class="col-form-label">신고일</label>
			  <input type="text" class="input-report pt-1 pb-1 pl-2" id="" value="2022-08-04 10:00:12" readonly></input>
			</div>
			<div class="form-group mb-0">
			  <p class="form-check form-check-inline mr-4 ml-6" style="margin-left: 70px;">블랙리스트&nbsp;<span style="color:red;">*</span></p>
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
		<button type="button" class="btn btn-primary" id="btn-report-update">처리</button>
	  </div>
	</div>
  </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>