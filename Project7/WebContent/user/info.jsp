
<%@page import="project.user.dao.UserDao"%>
<%@page import="project.user.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    String id=(String)session.getAttribute("id");
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
		width: 50px;
		height: 50px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
</style>
</head>
<body>
<div class="container">
	<h1>개인정보 페이지</h1>
	<table>
		<tr>
			<th>프로필 이미지</th>
			<%if(dto.getUserProfile()==null){ %>
				<td><img id="profileImage" src="${pageContext.request.contextPath}/images/yellowbird.png"/></td>
			<%} else { %>
				<td><img id="profileImage" src="${pageContext.request.contextPath}<%=dto.getUserProfile() %>"/></td>
			<%} %>	
		</tr>
		<tr>
			<th>이름</th>
			<td><%=dto.getUserName() %></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><%=dto.getUserId() %></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><a href="pwd_updateform.jsp">수정하기</a></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><%=dto.getUserGender() %></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><%=dto.getUserPhone() %></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=dto.getUserEmail() %></td>
		</tr>
		<tr>
			<th>가입일</th>
			<td><%=dto.getUserRegdate() %></td>
		</tr>
	</table>
	<a href="updateform.jsp">개인정보 수정</a>
	<a href="javascript:deleteConfirm()">탈퇴</a>
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