<%@page import="project.review.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int r_num=Integer.parseInt(request.getParameter("r_num"));
	ReviewDao.getInstance().delete(r_num);
	
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/board/fooddetail.jsp?snum="+application.getAttribute("snum"));
%>


	
