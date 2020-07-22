<%@page import="project.user.dto.UserDto"%>
<%@page import="project.user.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String userid=request.getParameter("userid");
	    UserDao dao=UserDao.getInstance();
		UserDto dto=dao.getData(userid);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
<style>
.btnScope{
	float:right;
}
</style>

</head>
<body>
<div class="container">
	<h1>Admin 전용 회원 정보 수정 form</h1>
	<form action="admin_userInfo_update.jsp" method="post">
	 <input type="hidden" name="userid" value="<%=dto.getUserId() %>"/>
	  <div class="form-group">
	    <label for="username">이름</label>
	    <input type="text" class="form-control" name="username" id="username" value="<%=dto.getUserName()%>">
	  </div>
	 <div class="form-group">
	    <label for="userid">아이디</label>
	    <input type="text" class="form-control" id="userid" value="<%=dto.getUserId()%>" disabled>
	  </div>
	 <div class="form-group">
	    <label for="userpw">비밀번호</label>
	    <input type="text" class="form-control" name="userpw" id="userpw" value="<%=dto.getUserPw()%>">
	  </div>
	 <div class="form-group">
	    <label for="userphone">핸드폰 번호</label>
	    <input type="text" class="form-control" name="userphone" id="userphone" value="<%=dto.getUserPhone()%>">
	  </div>
	 <div class="form-group">
	    <label for="useremail">이메일</label>
	    <input type="text" class="form-control" name="useremail" id="useremail" value="<%=dto.getUserEmail()%>">
	  </div>
	   <div class="form-group">
	    <label for="userregdate">회원가입일자</label>
	    <input type="text" class="form-control" name="userregdate" id="userregdate" value="<%=dto.getUserRegdate()%>" disabled>
	  </div>
	  <div class="btnScope">
		<button class="btn btn-outline-primary btn-sm" type="submit">수정</button>
		<button class="btn btn-outline-warning btn-sm" type="reset">수정전으로 초기화</button>
		<a class="btn btn-outline-danger" href="admin_userList.jsp">취소하고 돌아가기</a>
		</div>
	</form>
</div>

</body>
</html>