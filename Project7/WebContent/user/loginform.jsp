<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../header.jsp" %>
    <%
	//url 파라미터가 넘어오는지 읽어와보기
	String url=request.getParameter("url");
	if(url==null){//목적지 정보가 없다면
		String cPath=request.getContextPath();
		url=cPath+"/index.jsp"; //로그인 후 인덱스 페이지로 가도록 하기 위해
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/user/loginform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
</head>
<body>
	<div class="container">
		<h1>로그인 폼</h1>
		<form action="login.jsp" method="post">
		<%--원래 가려던 목적지 정보를 url이라는 파라미터명으로 가지고 간다 --%>
			<input type="hidden" name="url" value="<%=url %>"/>
			<div class="form-group">
				<label for="id">아이디</label>
				<input class="form-control" type="text" name="id" id="id" />
			</div>
			<div class="form-group">
				<label for="pwd">비밀번호</label>
				<input class="form-control" type="password" name="pwd" id="pwd" />
			</div>
			<button class="btn  btn-outline-primary" type="submit">로그인</button>
			<a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/index.jsp">취소</a>
		</form>
	</div>
	<div style="height : 200px;"></div>
	<hr/>
	<%@include file="../footer.jsp" %>
</body>
</html>