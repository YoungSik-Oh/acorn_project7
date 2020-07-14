<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/userz/signup_form.jsp</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
</head>
<body>

<div class="container">
	<h1>회원가입 폼 입니다.</h1>
	<form action="${pageContext.request.contextPath}/userz/signup.jsp" method="post" name="regForm">
		<div class="form-group">
			<h3><label for="name">이름(필수)</label></h3>
			<input type="text" name="name" id="name" required/>
		
			<h3><label for="id">아이디(필수)</label></h3>
			<input type="text" name="id" id="id" required />
			<input type="button" value="중복확인" onclick="idchk()"/>

		</div>
		<div class="form-group">
			<h3><label for="pwd">비밀번호</label></h3>
			<input type="password" class="pw" name="pwd" id="pwd"/>
		</div>
		<div class="form-group">
			<h3><label for="pwd2">비밀번호 확인</label></h3>
			<input type="password" class="pw" name="pwd2" id="pwd2"/>
			<span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span>
   		 <span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span>
		</div>
		<div class="form-group">
			<h3><label for="phone">전화번호(필수)</label></h3>
			<input type="text" name="phone" id="phone" required/>

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
<script type="text/javascript">
		function idchk(){
			var url="idchk.jsp"
			var uopt="width=400, height=350"
			window.open( url, " ", uopt);
			}
</script>

<script>
    $('.pw').focusout(function () {
        var pwd1 = $("#pwd").val();
        var pwd2 = $("#pwd2").val();
 
        if ( pwd1 != '' && pwd2 == '' ) {
            null;
        } else if (pwd1 != "" || pwd2 != "") {
            if (pwd1 == pwd2) {
                $("#alert-success").css('display', 'inline-block');
                $("#alert-danger").css('display', 'none');
            } else {
                alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
                $("#alert-success").css('display', 'none');
                $("#alert-danger").css('display', 'inline-block');
            }
        }
    });
</script>



</div>
</body>
</html>