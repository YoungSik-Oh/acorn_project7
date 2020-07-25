<%@page import="project7.store.dao.StoreDao"%>
<%@page import="project7.store.dto.StoreDto"%>
<%@page import="project.board.dto.BoardDto"%>
<%@page import="project.board.dao.BoardDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String adminName=(String)session.getAttribute("adminName");
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
<div style="text-align:center;"><h1> 관리자 페이지</h1></div>
	
	<%if(adminName !=null) {%>
		<div style="float:right;">
			<p ><%=adminName %>님 안녕하세요.</p>
			<a href="admin_logout.jsp">로그아웃</a>
		</div>
	<%} %>
	
<p> <!-- logo 들어갈 자리 -->
	<a href="${pageContext.request.contextPath}/index.jsp">홈페이지</a>
</p>
<ul>
	<li><a href="${pageContext.request.contextPath}/admin/admin_userList.jsp">회원 목록</a></li>

</ul>
<%
	List<StoreDto> list=StoreDao.getInstance().getList();
 %>
<h2>게시글 List </h2>
<a href="admin_store/admin_store_insertform.jsp"><span style="float:right; padding-bottom:5px;">글작성하기</span></a>
<table class="table">
	<thead class="thead-dark">
		<tr>
			<th>글번호</th>
			<th>가게 이름 </th>
			<th>대표 메뉴</th>
			<th>contents(가게설명)</th>
			<th>가게 등록일</th>
			<th>글 수정</th>
			<th>글 삭제</th>
		</tr>
	</thead>
	<tbody>
	<!-- store 로 바꿔야함 -->
		<form action="">
		<%for(StoreDto tmp:list){%>
			<tr>
				<td><%=tmp.getSnum() %></td>
				<td><a href="admin_store/store_detail.jsp?snum=<%=tmp.getSnum() %>"><%=tmp.getSname() %></a></td>
				<td><%=tmp.getSmenu() %></td>
				<td><%=tmp.getContents() %></td>
				<td><%=tmp.getUdate() %></td>
				<td><a href="admin_store/store_detail_modifyform.jsp?snum=<%=tmp.getSnum()%>">수정</a></td>
			</tr>
		<%}%>
		</form>
	</tbody>
</table>
</div>	
</body>
</html>