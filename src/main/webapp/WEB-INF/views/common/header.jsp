<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>campervalley</title>
	<!-- jquery js -->
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<!-- bootstrap js -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	<!-- bootstrap css -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<!-- 사용자작성 css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
	<!-- font awesome -->
	<script src="https://kit.fontawesome.com/535d5e7249.js" crossorigin="anonymous"></script>
	<script>
	<c:if test="${not empty msg}">
		alert('${msg}');
	</c:if>
	</script>
</head>
<body>
	<div class="container p-0 m-0">
		<header>
			<div class="container fixed-top p-0">
				<nav class="navbar navbar-expand-lg navbar-light bg-light" id="navbarMain" style="background-image: url('${pageContext.request.contextPath}/resources/images/logo.png');">
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse p mr-0" id="navbarText">
						<ul class="navbar-nav offset-md-4 col-md-6 mt-4 justify-content-start">
							<!-- 선택시 active -->
							<li class="nav-item"><a class="mainMenu nav-link text-dark" href="#">캠핑장</a></li>
							<li class="nav-item"><a class="mainMenu nav-link text-dark" href="#">캠핑용품거래</a></li>
							<li class="nav-item"><a class="mainMenu nav-link text-dark" href="#">커뮤니티</a></li>
							<li class="nav-item"><a class="mainMenu nav-link text-dark" href="#">마이페이지</a></li>
							<li class="nav-item"><a class="mainMenu nav-link text-dark" href="#">고객센터</a></li>
							<li class="nav-item"><a class="mainMenu nav-link text-dark" href="#">관리자페이지</a></li>
						</ul>
						<ul class="navbar-nav mt-4">
							<!-- 선택시 active -->
							<li class="nav-item"><a class="nav-link small text-dark" href="#"><i class="fa-regular fa-user"></i>&nbsp;로그인</a></li>
							<li class="nav-item"><a class="nav-link small text-dark" href="#"><i class="fa-solid fa-user-plus"></i>&nbsp;회원가입</a></li>
						</ul>
					</div>
				</nav>
				<nav class="navbar navbar-light p-1 justify-content-center" id="navbarSub" style="background-color: #639A67"></nav>
			</div>
			<script>
			const $subNavbar = $(navbarSub);
			$(document).ready(() => $subNavbar.hide());
			
			// // 서브메뉴바보여주기 - mouseenter event
			$(".mainMenu").mouseenter((menu) => {
			  	const mainMenu = menu.target.innerHTML;
			  	switch(mainMenu) {
					case "커뮤니티" : renderSubMenu(0, "캠퍼모집", "캠핑장후기"); break;
					case "마이페이지" : renderSubMenu(1,"회원관리", "중고거래", "커뮤니티", "광고주"); break;
					case "고객센터" : renderSubMenu(2, "공지사항", "Q&A"); break;
					case "관리자페이지" : renderSubMenu(3, "회원관리", "게시판관리", "신고내역관리"); break;
					default : $subNavbar.stop().slideUp('fast');
			  	}
			});
		
			const renderSubMenu = function(index, ...subMenuList) {
				$subNavbar.html("");
				for(let i = 0; i < subMenuList.length; i++) {
					const aTag = document.createElement("a");
					aTag.className = "navbar-brand p-0 mr-3 ml-3 text-light position-relative";
					aTag.style.left = `\${index * 65}px`;
					
					aTag.innerHTML = subMenuList[i];
					$subNavbar.append(aTag);
					if(i != subMenuList.length - 1) {
						const spanTag = document.createElement("span");
						spanTag.className = "bar text-light position-relative";
						spanTag.innerHTML = "|";
						spanTag.style.left = `\${index * 65}px`;
						$subNavbar.append(spanTag);
					}
				}
				$subNavbar.stop().slideDown('fast');
			};
		
			// 서브메뉴바숨기기 - scroll event
			$(window).scroll(() => {
			  	$subNavbar.stop().slideUp('fast');
			});
			</script>
		</header>
		<section id="content">
