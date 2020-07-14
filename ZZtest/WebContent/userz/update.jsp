
<%@page import="test.userz.dao.UserzDao"%>
<%@page import="test.userz.dto.UserzDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	//수정할 것들
	String id=(String)session.getAttribute("id");
	String phone=request.getParameter("phone");
	String email=request.getParameter("email");
	//수정할 정보를 UsersDto객체에 담고
	UserzDto dto=new UserzDto();
	dto.setId(id);
	dto.setPhone(phone);
	dto.setEmail(email);
	//UsersDao객체를 이용해서 수정반영한다.
	UserzDao.getInstance().update(dto);
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
		location.href="${pageContext.request.contextPath}/userz/info.jsp";
	</script>
</body>
</html>