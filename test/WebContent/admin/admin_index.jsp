<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String adminName=(String)session.getAttribute("adminName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
</head>
<body>
<div class="container">
<%if(adminName !=null) {%>
	<p><%=adminName %>님 안녕하세요.</p>
	<a href="admin_logout.jsp">로그아웃</a>
	<a href="${pageContext.request.contextPath}/user/userList.jsp">회원 목록보기</a>
	
<%} %>	




</div>	
</body>
</html>