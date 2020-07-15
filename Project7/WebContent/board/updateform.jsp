<%@page import="project.board.dao.BoardDao"%>
<%@page import="project.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    int num=Integer.parseInt(request.getParameter("num"));
	BoardDto dto=BoardDao.getInstance().getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>글 수정 폼 </h1>
	<form action="update.jsp" method="post">
		<input type="text" name="num" value="<%=dto.getNum()%>"/>
		<label for="num">번호</label>
		<br/>
		<label for="writer">작성자</label>
		<input type="text" id="writer" name="writer" value="<%= dto.getWriter()%>"/>
		<br/>
		<label for="title">글 제목</label>
		<input type="text" id="title" name="title" value="<%= dto.getTitle()%>"/>
		<br/>
		<label for="content">내용</label><br/>
		<textarea name="content" id="content" cols="20" rows="5"><%=dto.getContent() %></textarea>
		<br/>
		<button type="submit">수정 확인</button>
		<button type="reset">취소</button>
	</form>
</body>
</html>