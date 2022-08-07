<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/login.css" />
</head>
<body>
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="loginModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered px-5" role="document">
			<div class="modal-content px-2">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title mt-2 font-weight-bold" id="loginModalLabel">&nbsp;&nbsp;&nbsp;로그인</h4>
				</div>
				<form:form method="post">
					<div class="modal-body">
						<c:if test="${param.error != null}">
							  <span class="text-danger">아이디 또는 비밀번호가 일치하지 않습니다.</span>
						</c:if>
						<input 
							type="text" class="form-control mt-2" name="memberId"
							placeholder="아이디" required> 
						
						<input
							type="password" class="form-control" name="password"
							placeholder="비밀번호" required>
					</div>
                    <div class="modal-footer">
					<div class="justify-content-between">
						<div>
							<input type="checkbox" class="form-check-input" name="remember-me" id="remember-me" />
							<label for="remember-me" class="form-check-label">자동로그인</label>
						</div>				
						<div>
                            <a href="${pageContext.request.contextPath}/member/searchId">아이디찾기</a> /
                            <a href="${pageContext.request.contextPath}/member/searchPassword">비밀번호찾기</a>
						</div>
                    </div>
                    <div>				
						<div>
                            <button type="submit" class="btn btn-camper-color">로그인</button>
                        </div>
                        <div>
							<button type="button" class="btn btn-outline-camper-color bg-white">회원가입</button>
						</div>
					</div>
                </div>
				</form:form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

</script>
</html>