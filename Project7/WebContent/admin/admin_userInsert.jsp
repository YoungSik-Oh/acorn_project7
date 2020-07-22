<%@page import="project.user.dao.UserDao"%>
<%@page import="project.user.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
    //폼 전송되는 가입할 회원의 정보를 읽어온다
    String username=request.getParameter("username");
   	String userid=request.getParameter("userid");
   	String userpw=request.getParameter("userpw");
   	String usergender=request.getParameter("usergender");
   	String userphone=request.getParameter("userphone");
   	String useremail=request.getParameter("useremail");
   	
   	
   	//UserDto객체에 회원정보를 담고
   	UserDto dto=new UserDto();
   	dto.setUserName(username);
   	dto.setUserId(userid);
   	dto.setUserPw(userpw);
   	dto.setUserGender(usergender);
   	dto.setUserPhone(userphone);
   	dto.setUserEmail(useremail);
   	//UserDao 객체를 이용해서 DB에 저장한다
   	boolean isSuccess=UserDao.getInstance().insert(dto);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(isSuccess){ %>
		<p><strong><%=userid %></strong>회원님 가입되었습니다.</p><br />	
		<a href="admin_userList.jsp">회원 목록 보기</a>
	<%}else{ %>
		<p>가입이 실패했습니다.</p><a href="admin_userInsert_form.jsp">다시 시도하기</a>
	<%} %>
</body>
</html>