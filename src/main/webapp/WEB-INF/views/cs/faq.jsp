<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cs/cs.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
.bar-faq {
	border-bottom: 2px solid black;
}
.bar-faq {
	color: black !important;
}
.container {
	padding: 0px;
}
.cs-bar {
	margin-bottom: 0px;
}
</style>
			
<h5 class="cs-header text-center">자주 묻는 질문</h5>

<div class="notice-wrap" style="width: 80%; float:none; margin:0 auto">
	
	<div class="cs-bar float-left">
		<a href="${pageContext.request.contextPath}/cs/noticeList" class="bar-notice">공지사항</a>
		<a href="${pageContext.request.contextPath}/cs/faq" class="bar-faq">자주 묻는 질문</a>
	</div>

	
		<div class="search-group float-right">
			<input class="input-search" type="text" placeholder="search">
			<button class="btn-search" type="button">
				<i class="fa fa-search"></i>
			</button>
		</div>
	



<div class="container">
	
		<div class="faq">
			
			<p class="test-div" style="color: #FFF; margin-bottom:-9px;">.</p>
				
				<ul class="faqBody" style="display: inline;">
                    <li class="article" id="a1" >
                        <p class="q"><a href="#a1">
                        <span class="icon_q">Q</span>
                        <span style="margin-left : 9px;">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</span>
                        <span class="q_img"><img src="${pageContext.request.contextPath}/resources/images/cs/arrow.png" style="width:20px" alt=""></span>
                        </a></p>

                        <div class="a">
                        <span class="icon_a" >A</span>
                        <div style="margin-left: 47px; display: inline-flex; margin-top: -28px;">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates ipsum at pariatur aut odio architecto repellendus assumenda illo atque nulla consequuntur nam cum quas voluptas non exercitationem dignissimos quos quae.</div>
                        </div>
                    </li>                  
                    <li class="article" id="a1" >
                        <p class="q"><a href="#a1">
                        <span class="icon_q">Q</span>
                        <span style="margin-left : 9px;">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</span>
                        <span class="q_img"><img src="${pageContext.request.contextPath}/resources/images/cs/arrow.png" style="width:20px" alt=""></span>
                        </a></p>

                        <div class="a">
                        <span class="icon_a" >A</span>
                        <div style="margin-left: 47px; display: inline-flex; margin-top: -28px;">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates ipsum at pariatur aut odio architecto repellendus assumenda illo atque nulla consequuntur nam cum quas voluptas non exercitationem dignissimos quos quae.</div>
                        </div>
                    </li>                  
                    <li class="article" id="a1" >
                        <p class="q"><a href="#a1">
                        <span class="icon_q">Q</span>
                        <span style="margin-left : 9px;">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</span>
                        <span class="q_img"><img src="${pageContext.request.contextPath}/resources/images/cs/arrow.png" style="width:20px" alt=""></span>
                        </a></p>

                        <div class="a">
                        <span class="icon_a" >A</span>
                        <div style="margin-left: 47px; display: inline-flex; margin-top: -28px;">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates ipsum at pariatur aut odio architecto repellendus assumenda illo atque nulla consequuntur nam cum quas voluptas non exercitationem dignissimos quos quae.</div>
                        </div>
                    </li>                  
                    <li class="article" id="a1" >
                        <p class="q"><a href="#a1">
                        <span class="icon_q">Q</span>
                        <span style="margin-left : 9px;">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</span>
                        <span class="q_img"><img src="${pageContext.request.contextPath}/resources/images/cs/arrow.png" style="width:20px" alt=""></span>
                        </a></p>

                        <div class="a">
                        <span class="icon_a" >A</span>
                        <div style="margin-left: 47px; display: inline-flex; margin-top: -28px;">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates ipsum at pariatur aut odio architecto repellendus assumenda illo atque nulla consequuntur nam cum quas voluptas non exercitationem dignissimos quos quae.</div>
                        </div>
                    </li>                  
                    <li class="article" id="a1" >
                        <p class="q"><a href="#a1">
                        <span class="icon_q">Q</span>
                        <span style="margin-left : 9px;">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</span>
                        <span class="q_img"><img src="${pageContext.request.contextPath}/resources/images/cs/arrow.png" style="width:20px" alt=""></span>
                        </a></p>

                        <div class="a">
                        <span class="icon_a" >A</span>
                        <div style="margin-left: 47px; display: inline-flex; margin-top: -28px;">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates ipsum at pariatur aut odio architecto repellendus assumenda illo atque nulla consequuntur nam cum quas voluptas non exercitationem dignissimos quos quae.</div>
                        </div>
                    </li>                  
                       
                  
                    
                </ul>


		
</div> 
</div> 
</div>

<script>
    jQuery(function($){
        // Frequently Asked Question
        var article = $('.faq>.faqBody>.article');
        article.addClass('hide');
        article.find('.a').hide();
        article.eq(0).removeClass('hide');
        article.eq(0).find('.a').show();
        $('.faq>.faqBody>.article>.q>a').click(function(){
            var myArticle = $(this).parents('.article:first');
            if(myArticle.hasClass('hide')){
                article.addClass('hide').removeClass('show');
                article.find('.a').slideUp(100);
                myArticle.removeClass('hide').addClass('show');
                myArticle.find('.a').slideDown(100);
            } else {
                myArticle.removeClass('show').addClass('hide');
                myArticle.find('.a').slideUp(100);
            }
            return false;
        });
        $('.faq>.faqHeader>.showAll').click(function(){
            var hidden = $('.faq>.faqBody>.article.hide').length;
            if(hidden > 0){
                article.removeClass('hide').addClass('show');
                article.find('.a').slideDown(100);
            } else {
                article.removeClass('show').addClass('hide');
                article.find('.a').slideUp(100);
            }
        });
    });
    </script>