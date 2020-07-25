<%@page import="project7.store.dao.StoreDao"%>
<%@page import="project7.store.dto.StoreDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />

</head>
<%
	int snum=Integer.parseInt(request.getParameter("snum"));
	StoreDto dto=StoreDao.getInstance().getData(snum);
%>
<body>
<div class="container">
<h3><%=dto.getSname() %><strong><span>4.6</span></strong></h3>
	 <figcaption class="figure-caption">조회수</figcaption>
		<a href="store_detail_modifyform.jsp?snum=<%=snum %>">수정하기</a>
<table class="table table-borderless">
		<tbody>
			<tr>
				<th>주소</th>
				<td><%=dto.getSaddr() %> </td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><%=dto.getSphone() %></td>
			</tr>
			<tr>
				<th>음식 종류</th>
				<td><%=dto.getStmenu() %></td>
			</tr>
			<tr>
				<th>가격대</th>
				<td><%=dto.getSprice() %></td>
			</tr>
			<tr>
				<th>영업시간</th>
				<td><%=dto.getStime() %></td>
			</tr>
			<tr>
				<th>쉬는시간</th>
				<td><%=dto.getSbtime() %></td>
			</tr>
			<tr>
				<th>마지막 주문</th>
				<td><%=dto.getSlorder() %></td>
			</tr>
			<tr>
				<th>휴일</th>
				<td><%=dto.getSrday() %></td>
			</tr>
			<tr>
				<th>메뉴</th>
				<td><%=dto.getSmenu() %></td>
			</tr>
			<tr>
				<th>가게 소개</th>
				<td><%=dto.getContents() %></td>
			</tr>
		</tbody>
	</table>
</div>
</body>
</html>