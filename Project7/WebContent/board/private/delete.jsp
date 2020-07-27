<%@page import="project.review.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int snum=Integer.parseInt(request.getParameter("snum"));
	int r_num=Integer.parseInt(request.getParameter("r_num"));
	ReviewDao.getInstance().delete(r_num);
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/board/fooddetail.jsp?snum"+snum);
	//위에 response.sendRedirect(cPath+"/board/fooddetail.jsp?snum=원래 있던 번호"); 로 받아오거나
	//돌아가는 함수?를 찾아서 돌아가게 해줘야함. url받아오기?  insert_test에도 똑같은 문제
	//snum을 어떻게 가져와야함?
%>