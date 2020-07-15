<%@page import="project.board.dao.BoardDao"%>
<%@page import="project.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	int num=Integer.parseInt(request.getParameter("num"));
    	String writer=request.getParameter("wirter");
    	String title=request.getParameter("title");
    	String content=request.getParameter("content");
    	BoardDto dto=new BoardDto();
    	dto.setNum(num);
    	dto.setWriter(writer);
    	dto.setTitle(title);
    	dto.setContent(content);
    	boolean isSuccess=BoardDao.getInstance().update(dto);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if(isSuccess){%>
	<script>
		alert("<%= num%> 번 글을 수정했습니다.");
		location.href="list.jsp?num=<%=num%>";
	</script>
	<%}else{ %>
	<script>
		alert("글 수정 실패!");
		location.href="updateform.jsp?num=<%=num%>";
	</script>
<%} %>
</body>
</html>