
<%@page import="project.user.dao.UserDao"%>
<%@page import="project.user.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	//수정할 것들
	String id=(String)session.getAttribute("id");
	String phone=request.getParameter("phone");
	String email=request.getParameter("email");
	String profile=request.getParameter("profile");
	if(profile.equals("null")){
		profile=null;
	}
	//수정할 정보를 UsersDto객체에 담고
	UserDto dto=new UserDto();
	dto.setUserId(id);
	dto.setUserPhone(phone);
	dto.setUserEmail(email);
	dto.setUserProfile(profile);
	//UsersDao객체를 이용해서 수정반영한다.
	UserDao.getInstance().update(dto);
%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/update.jsp</title>
</head>
<body>
	<script>
		alert("수정했습니다.");
		location.href="${pageContext.request.contextPath}/user/info.jsp";
	</script>
</body>
</html>