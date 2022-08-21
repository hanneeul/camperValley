<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<div class="input-group mb-3">
  <input type="text" id="msg" class="form-control" placeholder="유저에게 보내는 Message">
  <div class="input-group-append" style="padding: 0px;">
    <button id="sendBtn" class="btn btn-outline-secondary" type="button">Send</button>
  </div>
</div>
<div>
	<ul class="list-group list-group-flush" id="msg-container"></ul>
	<c:forEach items="${chatLogList}" var="chatLog">
		<li class="list-group-item">${chatLog.memberId} : ${chatLog.msg}</li>
	</c:forEach>
</div>

<script>
const chatroomId = '${chatroomId}';
</script>
<script src="${pageContext.request.contextPath}/resources/js/chat/chat.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>