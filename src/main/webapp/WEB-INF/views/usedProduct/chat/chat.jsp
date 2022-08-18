<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/usedProduct/chat.css"/>
<meta charset="UTF-8">
<title>채팅하기</title>
</head>
<body>	
	<div class="container">
		<hr />
		<div class="chat_container">
			<div id="chatroom_container">
				<div class="info_container">
					<!-- 상단(닉네임, 아이디, 프로필) -->
					<div class="member-info_container" style="">
						<img src="" class="float-start" alt="">
						<div class="member-info_text-body">
							<div class="nickname_text">
								<p style="font-weight: 600">홍길동</p>
							</div>
							<div class="id_text">
								<p>honggd</p>
							</div>
						</div>
					</div>
					<button class="transaction_btn">거래완료</button>
				</div>
				<div id="chat_container">
					<div class="chat-box"><div class="chat">안녕하세용 상품에 관심 있어서 채팅드립니다.<input type="hidden"></div></div>
					<div class="my-chat-box"><div class="chat my-chat">안녕하세요!<input type="hidden"></div></div>
				</div>
				<!-- 하단 (입력창) -->
				<div id="bottom_container" style="margin-top: 10.4px;">
					<!-- 메세지 입력창 -->
					<!-- autofocus -> 페이지가 로드될 때 자동으로 포커스(focus) <input> 요소로 이동 -->
					<input type="text" id="inputMessage" onkeypress="" autofocus/>
					<input type="button" id="sendBtn" value="전송" onclick=""/>
					
					<!-- 추가 옵션 -->
					<div class="extra-menu">
						<div class="option" id="imgOption">
							<i class="fa-solid fa-camera"></i>
							<input type="file" id="uploadImg"/>
						</div>
					</div>
				</div>
			</div>
			<!-- 채팅방 목록 -->
	 		<div class="titleText">전체목록<img src="${pageContext.request.contextPath}/resources/images/cs/arrow.png" class="float-start" alt="화살표"></div>
			<div id="chatList_container">
				<div class="chatTitle">
	 			</div>
				<div class="one_member">
					<!-- 읽지 않은 메세지 개수 -->
					<div class="unread_message">
						<div class="red_circle">
							<span class="badge badge-danger unread-count">1</span>
						</div>
					</div>
					<div class="chatRoom_profile">
						<img class="other_member_img" src="" class="rounded float-start" alt="">
					</div>
					<div class="chatRoom_content">
						<div class="other_member_nickname">홍길동</div>
						<div class="last_message">안녕하세용 상품에 관심 있어서 채팅드립니다.</div>
					</div>
					<div class="chat_logtime">2022.08.07</div>
				</div>		
			</div>
		</div>
		<hr />
	</div>
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>