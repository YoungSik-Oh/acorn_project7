<%@page import="project.user.dao.UserDao"%>
<%@page import="project.user.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   	String username=request.getParameter("username");
    String userpw=request.getParameter("userpw");
    String userphone=request.getParameter("userphone");
    String useremail=request.getParameter("useremail");
    String userid=request.getParameter("userid");
    
    UserDto dto=new UserDto();
    dto.setUserName(username);
    dto.setUserPw(userpw);
    dto.setUserPhone(userphone);
    dto.setUserEmail(useremail);
    dto.setUserId(userid);
    boolean isSuccess=UserDao.getInstance().admin_userInfo_update(dto);
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Client에게 보내는 jsp page</title>
</head>
<body>
<%if(isSuccess){ %>
		<script>
			alert("<%=dto.getUserId() %> 님의 정보를 수정했습니다.");
			location.href="admin_userList.jsp";
		</script>
	<%}else{ %>
		<script>
			alert("수정 실패!");
			location.href="admin_userInfo_updateform.jsp?userid=<%=dto.getUserId() %>";
		</script>
	<%} %>
</body>
</html>