
<%@page import="project.user.dao.UserDao"%>
<%@page import="project.user.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../header.jsp" %>
    <%
    request.setCharacterEncoding("utf-8");
   
    //로그인된 개인 정보를 읽어온다.
    UserDto dto=new UserDto();
    dto=UserDao.getInstance().getData(id);
    %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/user/info.jsp</title>
<style>
/* 이미지를 작은 원형으로 만든다 */
	#profileImage{
		width: 100px;
		height: 100px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
	
	a{
		text-decoration : none;
	}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<h1>개인정보 페이지</h1>
	<table class="table table-striped">
		<tr>
			<th scope="col">프로필 이미지</th>
			<%if(dto.getUserProfile()==null){ %>
				<td><img id="profileImage" src="${pageContext.request.contextPath}/images/yellowbird.png"/></td>
			<%} else { %>
				<td><img id="profileImage" src="${pageContext.request.contextPath}<%=dto.getUserProfile() %>"/></td>
			<%} %>	
		</tr>
		<tr>
			<th scope="col">이름</th>
			<td><%=dto.getUserName() %></td>
		</tr>
		<tr>
			<th scope="col">아이디</th>
			<td><%=dto.getUserId() %></td>
		</tr>
		<tr>
			<th scope="col">비밀번호</th>
			<td><a href="pwd_updateform.jsp">수정하기</a></td>
		</tr>
		<tr>
			<th scope="col">성별</th>
			<td><%=dto.getUserGender() %></td>
		</tr>
		<tr>
			<th scope="col">전화번호</th>
			<td><%=dto.getUserPhone() %></td>
		</tr>
		<tr>
			<th scope="col">이메일</th>
			<td><%=dto.getUserEmail() %></td>
		</tr>
		<tr>
			<th scope="col">가입일</th>
			<td><%=dto.getUserRegdate() %></td>
		</tr>
	</table>
	<button class="btn btn-outline-primary"><a href="updateform.jsp">개인정보 수정</a></button>
	<button class="btn btn-outline-danger"><a href="javascript:deleteConfirm()">탈퇴</a></button>
</div>
<script>
	function deleteConfirm(){
		var isDelete=confirm("<%=id%>회원님 탈퇴 하시겠습니까?");
		if(isDelete){
			location.href="delete.jsp";
		}
	}
</script>
</body>
</html>