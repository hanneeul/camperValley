$('#msg').on('keydown', function(e) {
    if (event.keyCode == 13)
        if (!event.shiftKey){
            event.preventDefault();
	    	const msg = document.querySelector("#msg").value;
	    	if(!msg) return;
	    	
	    	const payload = {
	    		chatroomId,
	    		buyerNickname,
	    		sellerNickname,
	    		msg,
	    		time : new Date(+new Date() + 3240 * 10000).toISOString().replace("T", " ").replace(/\..*/,''),
	    		type : 'CHAT'
	    	};
	    	
	    	stompClient.send(`/app/chat/${chatroomId}`, {}, JSON.stringify(payload));
	    	document.querySelector("#msg").value = '';
        }
});
    
    setTimeout(() => {
    	const container = document.querySelector('.prev_message');
    	const mesgeContainer = $('.chat_room');
    	const msgHistory = $('.prev_message');
    
    	stompClient.subscribe(`/app/chat/${chatroomId}`, (message) => {
    		/* console.log(`/app/chat/${chatroomId} : `, message); */
    		const {'content-type' : contentType} = message.headers;
    		if(!contentType) return;
    		
    		
    		const {buyerNickname, sellerNickname, msg, time} = JSON.parse(message.body);
    		if(buyerNickname == loginMemberNickname){
    			const html = `<div class="buyer_message">
    				              <div class="sent_msg">
    				                <p>${msg}</p>
    				                <span class="time_date"> ${buyerNickname} | ${time} </span> 
    			                  </div>
    				          </div>`;
    			container.insertAdjacentHTML('beforeend', html);
    			msgHistory.scrollTop(msgHistory[0].scrollHeight); 
    		}
    		if(buyerNickname != loginMemberNickname){
    			const html = `<div class="seller_message">
    				              <div class="received_msg">
    				                <div class="received_content">
    				                  <p>${msg}</p>
    				                  <span class="time_date"> ${buyerNickname} | ${time} </span></div>
    				              </div>
    			              </div>`;
    			container.insertAdjacentHTML('beforeend', html);
    			msgHistory.scrollTop(msgHistory[0].scrollHeight); 
    		}
    	});
    }, 500);