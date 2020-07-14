<%@page import="project7.admin.dto.AdminDto"%>
<%@page import="project7.admin.dao.AdminDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String adminPw=request.getParameter("adminPw");
	String adminName=request.getParameter("adminName");
	AdminDto dto=new AdminDto();
	dto.setAdminPw(adminPw);
	dto.setAdminName(adminName);
	boolean isValid=AdminDao.getInstance().admingetData(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(isValid){ 
	//로그인 처리를 한다. 
	session.setAttribute("adminName", adminName);%>
	<p> <%=adminName %> 관리자님 로그인 되었습니다. <a href="admin_index.jsp">확인</a></p>
<%}else{ %>
	<p> 아이디 혹은 비밀번호가 틀려요! <a href="admin_login_form.jsp">다시 시도</a></p>
<%} %>
</body>
</html>