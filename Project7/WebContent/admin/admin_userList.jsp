<%@page import="java.util.List"%>
<%@page import="project.user.dto.UserDto"%>
<%@page import="project.user.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	
	  //MemberDao 객체의 참조값 얻어오기 
	  	UserDao dao=UserDao.getInstance();
	  	//회원 목록 얻어오기
	  	List<UserDto> list=dao.getList();
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
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
		<li class="breadcrumb-item active">회원목록</li>
	</ol>
	<h1>회원 목록입니다.</h1>
	<table class="table table-sm">
		<thead class="thead-dark">
			<tr>
				<th> 이름</th>
				<th> 아이디</th>
				<th> 비밀번호</th>
				<th> 성별</th>
				<th> 핸드폰 번호</th>
				<th> 이메일</th>
				<th> 가입 일자</th>
				<th>회원 정보 수정</th>
				<th>회원 정보 삭제</th>
			</tr>
		</thead>
		<tbody>
			<%for(UserDto tmp:list){ %>
			<tr>
				<td><%=tmp.getUserName() %></td>
				<td><%=tmp.getUserId() %></td>
				<td><%=tmp.getUserPw() %></td>
				<td><%=tmp.getUserGender() %></td>
				<td><%=tmp.getUserPhone() %></td>
				<td><%=tmp.getUserEmail() %></td>
				<td><%=tmp.getUserRegdate()%></td>
				<td><a href="admin_userInfo_updateform.jsp?userid=<%=tmp.getUserId() %>">수정</a></td>
				<td><a href="delete.jsp?userid=<%= tmp.getUserId()%>">회원 삭제</a></td>
			</tr>
			
		<%} %>	
		</tbody>
	</table>
	<a href="admin_userInsert_form.jsp">회원 추가 하러 가기</a>
</div>

</body>
</html>