<%@page import="project.review.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int r_num=Integer.parseInt(request.getParameter("r_nurm"));
	ReviewDao.getInstance().delete(r_num);
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/bestfood.jsp");
%>
