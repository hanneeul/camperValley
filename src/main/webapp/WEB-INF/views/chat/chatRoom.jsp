<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- sockjs, stomp, ws -->
<sec:authorize access="isAuthenticated()">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js" integrity="sha512-1QvjE7BtotQjkq8PxLeF6P46gEpBRXuskzIVgjFpekzFVF4yjRgrQvTG1MTOJ3yQgvTteKAcO7DSZI92+u/yZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="${pageContext.request.contextPath}/resources/js/chat/ws.js"></script>
</sec:authorize>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chat/chat.css"/>

<script>
const loginMemberNickname = '${loginMember.nickname}';
</script>

<div id="section">
	<div class="container">
		<div class="chat_container">
	        <div class="chat_member__list">
	        	<div>
		            <div class="chat_list__title">
		            	채팅목록
		            </div>
	            </div>

	          <div class="chat_box"></div>
	          
	        </div>
	        
	        <div class="chat_room">
	        	<div class="chat_room__title">
		            <div class="camperval_talk">
		           		<i style="color: #639A67;" class="fa-solid fa-campground"></i>캠밸TALK
		            </div>
	          	</div>
	          	<div class="prev_message">
		            <c:forEach items="${chatContentList}" var="chatContent">
			            <c:if test="${loginMember.nickname ne chatContent.buyerNickname}">
				            <div class="seller_message">
				            	<div class="received_msg">
				                	<div class="received_content">
				                  		<p>${chatContent.messageContent}</p>
				                  		<span class="time_date"></span>
				                  	</div>
				            	</div>
				            </div>
			            </c:if>
			            <c:if test="${loginMember.nickname eq chatContent.buyerNickname}">
			            	<div class="buyer_message">
			              		<div class="sent_msg">
			                		<p>${chatContent.messageContent}</p>
			                		<span class="time_date"></span> 
		                 		</div>
			            	</div>
			            </c:if>
		            </c:forEach>
	          </div>
	          <div class="buyer_send">
	          	  <div class="input_msg">
	              		<input type="text" id="msg" placeholder="  메세지를 입력하세요" />
	              		<button class="send_btn" type="button" onKeyDown="pressEnter()">전송</button>
	              </div>
	          </div> 
	        </div>
		</div>
	</div>
</div>
<script>
function pressEnter(){
    if(event.keyCode == 13){}
}
/* 채팅 목록 */
setInterval(function() {
	$(document).ready(function(){
		
		$.ajax({
			
			url : `${pageContext.request.contextPath}/chat/chatList`,
			data:{
				loginMemberNickname : loginMemberNickname
			},
			contentType : 'application/json;',
			type: "GET",
			success : function(list){
				$('.chat_box').html('');
				/* console.log(list);*/
				const chatList = document.querySelector('.chat_box');
				for(var i = 0; list.length > i; i++){
					let html = "";
					let contentNo = list[i]['contentNo']
					let roomId = list[i]['chatroomId']
					let seller = list[i]['buyerNickname'] == loginMemberNickname ? list[i]['sellerNickname'] : list[i]['buyerNickname'];
					let buyer = list[i]['sellerNickname'] == loginMemberNickname ? list[i]['buyerNickname'] : list[i]['sellerNickname'];
					let messageContent = list[i]['messageContent']
					let messageTime = list[i]['messageTime']
					
					html += `<div class="chat_list" data-room-id=\${roomId} data-room-nickname=\${seller}>
								 <div class="one_chat">
								     <div class="chat_img"> <img src="/campervalley/resources/images/usedProduct/noProfile.png" alt="sunil"> </div>
								     <div class="chat_message">
								     
									     <h5> \${seller} <span class="chat_date">\${messageTime}</span></h5>
									     <p>
									     \${messageContent}
									     <button type="button" class="btn btn-outline-success" id="deleteChatRoom" style="float:right; font-size:10px;" data-room-id=\${roomId}>방나가기</button>
									     </p>
								     </div>
								 </div>
							 </div> `;
					chatList.insertAdjacentHTML('beforeend', html);
				}
				
			},
			error : function(err) {
	        }
		});
	});
}, 500);

/* 채팅방 삭제 */
$(document).on('click', '#deleteChatRoom', function(){
	var chatroomId = $(this).data('roomId');
	console.log(chatroomId);
	
	$.confirm({
		title: '',
	    content: '채팅방을 나가시겠습니까?',
	    buttons: {
	        '확인': function () {
	        	
	    		$.ajax({
	    			
	    			url : `${pageContext.request.contextPath}/chat/deleteChatRoom`,
	    			data : {
	    				chatroomId : chatroomId
	    			},
	    			contentType : 'application/json;',
	    			type : "GET",
	    			success(response) {
	    			},
	    			error : function(err) {
	    			}
	    		});
	        },
	        '취소': function () {
	        	$.alert({
				    title: '',
				    content: '취소했습니다.',
				    buttons: {'확인': function() {
						return;
				    }}
				});
	        }
	    }
	});

});

/* 목록 선택시 */
$(document).on('click', '.chat_list', function() {
    var chatroomId = $(this).data('roomId');
    var sellerNickname = $(this).data('roomNickname');
    
    $.ajax({
    	
    	url : `${pageContext.request.contextPath}/chat/room.do`,
    	data : {
    		chatroomId : chatroomId
    	},
    	contentType : 'application/json;',
    	type : "GET",
    	success : function(list) {
    		/* console.log(list);  */
    		$('.prev_message').html('');
    		const container = document.querySelector('.prev_message');
    		
    		for(var i = 0; list.length > i; i++){
				let html = "";
				let contentNo = list[i]['contentNo']
				let roomId = list[i]['chatroomId']
				let sellerNickname = list[i]['sellerNickname'];
				let buyerNickname = list[i]['buyerNickname']; 
				let messageContent = list[i]['messageContent']
				let messageTime = list[i]['messageTime']

				if(buyerNickname == loginMemberNickname){
					const html = `<div class="buyer_message">
						              <div class="sent_msg">
						                <p>\${messageContent}</p>
						                <span class="time_date"> \${buyerNickname} | \${messageTime} </span> 
					                  </div>
						          </div>`;
						          
					container.insertAdjacentHTML('beforeend', html);				
				}
				if(buyerNickname != loginMemberNickname){
					const html = `<div class="seller_message">
						              <div class="received_msg">
						                <div class="received_content">
						                  <p>\${messageContent}</p>
						                  <span class="time_date"> \${buyerNickname} | \${messageTime} </span></div>
						              </div>
					              </div>`;
					              
					container.insertAdjacentHTML('beforeend', html);

				}
				
    		};
    		
    	},
    	error : function(err) {
        }
    });
});

const chatroomId = '${chatroomId}';
const buyerNickname = '${loginMember.nickname}';
const sellerNickname = '${sellerNickname}';

console.log("chatroomId = " + chatroomId);
console.log("buyerNickname = " + buyerNickname);
console.log("sellerNickname = " + sellerNickname); 

</script>

<script src="${pageContext.request.contextPath}/resources/js/chat/chatRoom.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>