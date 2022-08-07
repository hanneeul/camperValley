<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>camper update</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<!-- bootstrap js -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	<!-- bootstrap css -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<!-- 사용자작성 css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community/camper/camperUpdate.css" />
</head>
<body>
<div class="modal fade" id="camperUpdate">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content px-5 py-2">
				<div class="modal-header">
					<div class="d-flex justify-content-start">
						<div class="text-20">캠퍼모집 등록</div>
						<div class="text-danger text-13 pl-4 pt-1">*표시는 필수 입력사항입니다.</div>
					</div>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="" name="camperEnrollFrm" method="POST">
					<div class="modal-body">
						<table>
							<tbody>
								<tr>
									<td class="label col-md-2 px-0 pt-2">
										<label for="area">캠핑지역<span class="text-danger">*</span></label>
									</td>
									<td class="col-md-10 px-0">
										<input type="text" name="area" class="input" style="width:40%"/>
									</td>
								</tr>
								<tr>
									<td class="label col-md-2 px-0 pt-2">
										<label for="dates">캠핑기간<span class="text-danger">*</span></label>
									</td>
									<td class="col-md-10 px-0">
										<input type="text" name="dates" class="input" style="width:40%" />
									</td>
								</tr>
								<tr>
									<td class="label col-md-2 px-0 pt-2">
										<label for="memberCount">모집인원<span class="text-danger">*</span></label>
									</td>
									<td class="col-md-10 px-0">
										<input type="number" name="memberCount" class="input" style="width:20%"/> &nbsp;명
									</td>
								</tr>
								<tr>
									<td class="label col-md-2 px-0 pt-2">
										<label for="title">제목<span class="text-danger">*</span></label>
									</td>
									<td class="col-md-10 px-0">
										<input type="text" name="title" class="input" style="width:98%"/>
									</td>
								</tr>
								<tr>
									<td class="label col-md-2 px-0 pt-2">
										<label for="content">상세내용<span class="text-danger">*</span></label>
									</td>
									<td class="col-md-10 px-0">
										<textarea name="content" cols="30" rows="5" style="width:98%"></textarea>
									</td>
								</tr>
								<tr>
									<td class="label col-md-2 px-0 pt-2">
										<label for="purpose">모임취지</label>
									</td>
									<td class="col-md-10 px-0">
										<textarea name="purpose" cols="30" rows="2" style="width:98%"></textarea>
									</td>
								</tr>
								<tr>
									<td class="label col-md-2 px-0 pt-2">
										<label for="expectedCost">예상비용</label>
									</td>
									<td class="col-md-10 px-0">
										<textarea name="expectedCost" cols="30" rows="2" style="width:98%"></textarea>
									</td>
								</tr>
								<tr>
									<td class="label col-md-2 px-0 pt-2">
										<label for="openURL">오픈채팅 URL<span class="text-danger">*</span></label>
									</td>
									<td class="col-md-10 px-0">
										<input type="text" name="openURL" class="input" style="width:98%"/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
                    <div class="modal-footer">
						<div class="text-right">
							<button type="submit" class="btn btn-outline-camper-color px-5 m-4">수정</button>
							<button type="button" class="btn btn-outline-camper-color px-5 my-4">삭제</button>
						</div>
	                </div>
				</form>
			</div>
		</div>
	</div>
</body>
<script>
	$("#camperUpdate")
	.modal()
	.on('hide.bs.modal', (e) => {
	});
</script>
</html>