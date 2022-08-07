<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review report enroll</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<!-- bootstrap js -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	<!-- bootstrap css -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<!-- 사용자작성 css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tradereview/reportEnroll.css" />
	<!-- font awesome -->
	<spring:eval var="fontawesomeKey" expression="@customProperties['api.fontawesome']" />
	<script src="https://kit.fontawesome.com/${fontawesomeKey}.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="modal fade" id="reportEnroll">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content px-5 py-2">
				<div class="modal-header">
					<div>
						<div class="text-20">
						<i class="fa-solid fa-circle-exclamation fa-lg pr-1" style="color:#d9bf77;"></i>
						<span>신고하기</span>
						</div>
					</div>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="" name="reportEnrollFrm" method="POST">
					<div class="modal-body px-0 my-3">
						<div class="gubun gubun-first px-3 py-2">
							<div class="d-flex justify-content-between">
								<div class="py-1 text-15">언어 폭력(욕설 및 성희롱)</div>
							 	<div class="sliding"><i id="language" class="fa-solid fa-angle-down pt-2"></i></div>
							</div>
							<div>
								<textarea class="p-2" cols="45" rows="5" placeholder="신고내용을 적어주세요."></textarea>
							</div>
						</div>
						<div class="gubun px-3 py-2">
							<div class="d-flex justify-content-between">
								<div class="py-1 text-15">광고</div>
							 	<div class="sliding"><i id="advertisement" class="fa-solid fa-angle-down pt-2"></i></div>
							</div>
							<div>
								<textarea class="p-2" cols="45" rows="5" placeholder="신고내용을 적어주세요."></textarea>
							</div>
						</div>
						<div class="gubun px-3 py-2">
							<div class="d-flex justify-content-between">
								<div class="py-1 text-15">게시글과 무관</div>
							 	<div class="sliding"><i id="relation" class="fa-solid fa-angle-down pt-2"></i></div>
							</div>
							<div>
								<textarea class="p-2" cols="45" rows="5" placeholder="신고내용을 적어주세요."></textarea>
							</div>
						</div>
						<div class="gubun px-3 py-2">
							<div class="d-flex justify-content-between">
								<div class="py-1 text-15">기타</div>
							 	<div class="sliding"><i id="etc" class="fa-solid fa-angle-down pt-2"></i></div>
							</div>
							<div>
								<textarea class="p-2" cols="45" rows="5" placeholder="신고내용을 적어주세요."></textarea>
							</div>
						</div>
					
					</div>
                    <div class="modal-footer justify-content-center">
						<div>
							<button type="submit" class="btn btn-outline-camper-color px-5 m-2">등록</button>
							<button type="button" class="btn btn-outline-camper-color px-5 m-2">취소</button>
						</div>
	                </div>
				</form>
			</div>
		</div>
	</div>
</body>
<script>
$("#reportEnroll")
.modal()
.on('hide.bs.modal', (e) => {
});

$(document).ready(() => {
	$("textarea").hide();
});
document.querySelectorAll(".sliding i").forEach((i) => {
	i.addEventListener("click", (e) => {
		const iTag = e.target;
		const category = $(iTag).attr('id');
		
		if($(iTag).hasClass("fa-angle-down")) {
			$("textarea").stop().hide();
			$(".gubun i").removeClass("fa-angle-up").addClass("fa-angle-down");
			$(".gubun").css("backgroundColor", "white");
		
			$(iTag).removeClass("fa-angle-down").addClass("fa-angle-up");
			$(iTag).parent().parent().parent().css("backgroundColor", "rgb(245, 245, 245)");
			$(iTag).parent().parent().next().children("textarea").stop().slideDown('fast');
			
		} else {
			$(iTag).removeClass("fa-angle-up").addClass("fa-angle-down");
			$(iTag).parent().parent().parent().css("backgroundColor", "white");
			$(iTag).parent().parent().next().children("textarea").stop().slideUp('fast');
		}
	});
});
</script>
</html>