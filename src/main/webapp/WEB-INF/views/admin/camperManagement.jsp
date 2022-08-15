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
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<div class="container" style="display: flex;" id="admin-container">
	<jsp:include page="/WEB-INF/views/common/adminSidebar.jsp" />
	<div class="admin-content" style="width: 80%;">
		<h5 class="admin-hd">캠퍼모집 관리</h5>
		<div class="camper-hd" style="margin-top:40px;">
	<div class="search-group float-right mb-2">
						<select id="searchType">
							<option value="title">제목</option>
						<option value="content">내용</option>
							<option value="title">작성자</option>
						</select>
						<input type="hidden" name="searchType" value="title">
						<input type="hidden" name="searchType" value="content">
						<input class="input-search" type="text" name="searchType" placeholder="검색어 입력" name="searchKeyword" id="searchKeyword">
						<button class="btn-search" type="button">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>
					
			<table class="table text-center" id="tb-member">
				<thead>
					<tr>
						<th class="col-md-1">No.</th>
						<th>모집상태</th>
						<th class="col-md-4">제목</th>
						<th>지역</th>
						<th>모집인원</th>
						<th>작성자</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>48</td>
						<td>모집중</td>
						<td>같이가실분</td>
						<td>경기도 @@시</td>
						<td>2</td>
						<td>동그랑땡</td>
						<td>
							<button type="button" class="btn-update" data-toggle="modal" data-target="#adminCamperModal">
								<i class="fa-solid fa-ellipsis"></i>
							</button>
						</td>
					</tr>
					
				</tbody>
			</table>
	</div>
</div>

<!-- 모 -->
<div class="modal fade" id="adminCamperModal" tabindex="-1" role="dialog" aria-labelledby="#adminProductModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<h5 class="modal-title" id="adminCamperModalLabel">캠핑용품거래 관리</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				  <span aria-hidden="true" style="color:#fff">&times;</span>
				</button>
			  </div>
			  <div class="modal-body pb-1">
				 <form name="adminCamperUpdateFrm">
					<table class="table" id="tb-modal">
					<tr>
						<td>제목</td>
						<td><input class="form-control"></td>
					</tr>
					<tr>
						<td>모집상태</td>
						<td>
							<select class="modal-category ml-0">
								<option value="">모집중</option>
								<option value="">모집완료</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>출발일</td>
						<td><input class="form-control"></td>
					</tr>
					<tr>
						<td>도착일</td>
						<td><input class="form-control"></td>
					</tr>
					<tr>
						<td>지역</td>
						<td><input class="form-control"></td>
					</tr>
					<tr>
						<td>모집인원</td>
						<td><input class="form-control"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="" id="" cols="30" rows="10" class="form-control" style="height:150px;"></textarea></td>
					</tr>
				  </table>
				</div>
				  </form> 
			  <div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">수정</button>
				<button type="button" class="btn btn-primary" id="btn-product-update">처리</button>
			  </div>
			</div>
		  </div>
		</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>