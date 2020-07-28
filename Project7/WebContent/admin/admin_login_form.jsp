<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String adminName=request.getParameter("adminName");
    %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		  align-items: center;
	}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
</head>
<body>
<div class="container">
	
	<div class="card align-middle" style="width:20rem; border-radius:20px;">
		<div class="card-title" style="margin-top:30px;">
			<h2 class="card-title text-center" style="color:#113366;">관리자 로그인</h2>
		</div>
		<div class="card-body">
		
      <form class="form-signin" action="admin_login.jsp" method="POST" >
        <h5 class="form-signin-heading">로그인 정보를 입력하세요</h5>
        
	        <label for="adminName" class="sr-only">Your ID</label>
	        <input type="text" id="adminName" name="adminName" class="form-control" placeholder="이름을 입력하세요" required autofocus><br />
	        
	        <label for="adminPw" class="sr-only">Password</label>
	        <input type="password" id="adminPw" name="adminPw" class="form-control" placeholder="비밀번호를 입력하세요" required><br>

	       	<button class="btn btn-lg btn-primary btn-block" type="submit">로 그 인</button><br />
	       	<a class="btn btn-lg btn-primary btn-block" href="${pageContext.request.contextPath}/index.jsp">취소</a>
      </form>
      
		</div>
	</div>
	
</div>

</body>
</html>