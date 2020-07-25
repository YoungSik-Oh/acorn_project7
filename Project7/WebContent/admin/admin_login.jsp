<%@page import="java.net.URLEncoder"%>
<%@page import="project7.admin.dto.AdminDto"%>
<%@page import="project7.admin.dao.AdminDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String adminName=request.getParameter("adminName");
	String adminPw=request.getParameter("adminPw");
	AdminDto dto=new AdminDto();
	dto.setAdminPw(adminPw);
	dto.setAdminName(adminName);
	boolean isValid=AdminDao.getInstance().admingetData(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/admin/admin_login.jsp</title>
</head>
<body>
<%if(isValid){ %>
	<!-- 로그인 처리 -->
	<%session.setAttribute("adminName", adminName); %>
	<p><%=adminName %> 님 관리자님 로그인 되었습니다. <a href="admin_index.jsp">확인</a></p>
<%}else{ %>
	<p>관리자가 아니면 로그인하지 말아주세요 <a href="${pageContext.request.contextPath}/index.jsp">홈페이지로 돌아가기</a></p>
	<p><a href="admin_login_form.jsp">다시 시도</a></p>
<%} %>
</body>
</html>