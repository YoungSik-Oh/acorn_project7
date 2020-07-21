<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/user/signup_form.jsp</title>
<script type="text/javascript">
		function idchk(){
			var url="idchk.jsp"
			var uopt="width=400, height=350"
			window.open( url, " ", uopt);
			}
</script>
</head>
<body>
<div class="container">
	<h1>회원가입 폼 입니다.</h1>
	<form action="${pageContext.request.contextPath}/user/signup.jsp" method="post">
		<div class="form-group">
			<h3><label for="name">이름</label></h3>
			<input type="text" name="name" id="name"/>
		
			<h3><label for="id">아이디</label></h3>
			<input type="text" name="id" id="id" />
			<input type="button" value="중복확인" onclick="idchk()"/>
		</div>
		<div class="form-group">
			<h3><label for="pwd">비밀번호</label></h3>
			<input type="password" name="pwd" id="pwd"/>
		</div>
		<div class="form-group">
			<h3><label for="pwd2">비밀번호 확인</label></h3>
			<input type="password" name="pwd2" id="pwd2"/>
		</div>
		<div class="form-group">
			<h3><label for="phone">전화번호</label></h3>
			<input type="text" name="phone" id="phone"/>
		</div>
		<div class="form-group">
			<h3><label for="sex">성별</label></h3>
			<select name="sex" id="sex" >
			<option value selected>성별</option>		
			<option value="M">남</option>
			<option value="W">여</option>
			</select>
		</div>
		<div class="form-group">
			<h3><label for="email">본인 확인 이메일<span>(선택)</span></label></h3>
			<input type="text" id="email" name="email" placeholder="선택입력"/>
		</div>
		<button type="submit">가입</button>
		<button type="reset">취소</button>
	</form>
</div>
</body>
</html>