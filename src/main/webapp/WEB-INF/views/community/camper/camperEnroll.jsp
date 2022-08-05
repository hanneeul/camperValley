<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community/camper/camperEnroll.css" />
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta3/dist/css/bootstrap-select.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta3/dist/js/bootstrap-select.min.js"></script>
	<div class="container-md campsite-review-list-wrap pt-3">
		<jsp:include page="/WEB-INF/views/community/communityHeading.jsp"/>
		</div>
		<div class="p-3">
			<hr />
			<div class="d-flex justify-content-start">
				<div class="text-20">캠퍼모집 등록</div>
				<div class="text-danger text-13 pl-4 pt-1">*표시는 필수 입력사항입니다.</div>
			</div>
			<hr />
			<form action="" name="camperEnrollFrm" method="POST">
				<table>
					<tbody>
						<tr>
							<td class="label col-md-2 px-0 pt-2">
								<label for="area">캠핑지역<span class="text-danger">*</span></label>
							</td>
							<td class="col-md-10 px-0">
								<input type="text" name="area" class="input" style="width:40%" placeholder="지역을 입력해주세요. ex) 경상북도 경주"/>
							</td>
						</tr>
						<tr>
							<td class="label col-md-2 px-0 pt-2">
								<label for="dates">캠핑기간<span class="text-danger">*</span></label>
							</td>
							<td class="col-md-10 px-0">
								<input type="text" name="dates" class="input" style="width:40%" placeholder="0000년 00월 00일 ~ 0000년 00월 00일"/>
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
								<input type="text" name="title" class="input" style="width:98%" placeholder="제목을 입력해주세요."/>
							</td>
						</tr>
						<tr>
							<td class="label col-md-2 px-0 pt-2">
								<label for="content">상세내용<span class="text-danger">*</span></label>
							</td>
							<td class="col-md-10 px-0">
								<textarea name="content" cols="30" rows="5" style="width:98%" placeholder="상세내용을 입력해주세요."></textarea>
							</td>
						</tr>
						<tr>
							<td class="label col-md-2 px-0 pt-2">
								<label for="purpose">모임취지</label>
							</td>
							<td class="col-md-10 px-0">
								<textarea name="purpose" cols="30" rows="2" style="width:98%" placeholder="모임취지를 입력해주세요."></textarea>
							</td>
						</tr>
						<tr>
							<td class="label col-md-2 px-0 pt-2">
								<label for="expectedCost">예상비용</label>
							</td>
							<td class="col-md-10 px-0">
								<textarea name="expectedCost" cols="30" rows="2" style="width:98%" placeholder="예상비용과 비용내용 입력해주세요."></textarea>
							</td>
						</tr>
						<tr>
							<td class="label col-md-2 px-0 pt-2">
								<label for="openURL">오픈채팅 URL<span class="text-danger">*</span></label>
							</td>
							<td class="col-md-10 px-0">
								<input type="text" name="openURL" class="input" style="width:98%" placeholder="오픈채팅방 URL을 입력해주세요."/>
							</td>
						</tr>
					</tbody>
				</table>
				<hr />
				<div class="text-right">
					<button type="submit" class="btn btn-outline-camper-color px-5 m-4">등록</button>
					<button type="button" class="btn btn-outline-camper-color px-5 my-4" onclick="location.href='${pageContext.request.contextPath}/community/camper/camperList'">취소</button>
				</div>
			</form>
		</div>
		
		
		
		
	</div>
	
		
<script>
$(document).ready(() => {
	$(review).removeClass("active");
	$(camper).addClass("active");
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>