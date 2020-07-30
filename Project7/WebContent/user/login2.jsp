<%@page import="project.user.dao.UserDao"%>
<%@page import="project.user.dto.UserDto"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		//로그인 후 가야하는 목적지 정보
		String url=request.getParameter("url");
		//목적지 정보도 미리 인코딩 해놓는다.
		String encodedUrl=URLEncoder.encode(url);
		
		//1. 폼 전송되는 로그인 아이디와 비밀번호를 읽어온다.
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		//2. DB에 실제로 존재하는지(유효한 정보인지) 확인한다.
		UserDto dto=new UserDto();
		dto.setUserId(id);
		dto.setUserPw(pwd);
		boolean isValid=UserDao.getInstance().isValid(dto);
		//3. 유효한 정보이면 로그인 처리를 하고 응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/user/login.jsp</title>
</head>
<body>
<%if(isValid){ %>
	<script>
		setTimeout(function(){
			openr.location.reload();
			self.close();
		}, 0);
	</script>
	
<%}else{ %>
	<p>아이디 혹은 비밀번호가 틀려요! <a href="loginform.jsp?url="<%=encodedUrl %>>다시 시도</a></p>
<%} %>
</body>
</html>