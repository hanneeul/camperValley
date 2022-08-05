<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
.logo{
    margin-right: 0;
    width: 40rem;
    padding-top: 44%;
    background-image: url('${pageContext.request.contextPath}/resources/images/logo.png');
    background-repeat: no-repeat;
    background-attachment: local;
    background-size: contain;
    font-size: 16px;
  }
.btn{
  width: 250px;
  border: 2px #639A67 solid;
}
.btn:hover{
  background-color: #2B380C;
  border: 2px #2B380C solid;
  
}
p{
 font-size: 22px;
}
</style>

<div id="container" class="my-5">
	<section id="content">
        <div class="mx-auto text-center " style="width: 640px;">
            <div class="logo">
            	<p class="font-weight-bold m-1 mt-3">회원가입이 완료되었습니다.</p>
                <div class="my-4">
                    <a href="${pageContext.request.contextPath}/" class="btn btn-camper-color btn-lg m-3 border-2" >홈으로 이동</a>
                    <a class="btn btn-outline-camper-color btn-lg m-3 border-2" >로그인</a><%--  모달창 연결예정 --%> 
                </div>
            </div>
        </div>
	</section>
</div>
<script>
	
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>