<%@page import="project.user.dto.UserDto"%>
<%@page import="project.user.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
     	request.setCharacterEncoding("utf-8");
    	//세션에 저장된 아이디
    	String id=(String)session.getAttribute("id");
    	//수정할 회원의 정보를 읽어온다
    	UserDto dto=UserDao.getInstance().getData(id);
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<form action="update.jsp" method="post">
	<div class="form-group">
			<label for="name">이름</label>
			<input type="text" id="name" value="<%=dto.getUserName() %>" disabled />
		</div>
		<div class="form-group">
			<label for="id">아이디</label>
			<input type="text" id="id" value="<%=dto.getUserId() %>" disabled />
		</div>
		<div class="form-group">
			<label for="pwd">비밀번호</label>
			<input type="password" id="pwd" value="<%=dto.getUserPw() %>" disabled />
		</div>
		<div class="form-group">
			<label for="phone">전화번호</label>
			<input type="text" name="phone" id="phone" value="<%=dto.getUserPhone() %>" />
		</div>
		<div class="form-group">
			<label for="sex">성별</label>
			<input type="text" id="sex" value="<%=dto.getUserGender() %>" disabled />
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<input type="text" id="eamil" name="email" value="<%=dto.getUserEmail() %>"/>
		</div>
		<button type="submit">수정확인</button>
		<button type="reset">취소</button>
	</form>
</div>
</body>
</html>