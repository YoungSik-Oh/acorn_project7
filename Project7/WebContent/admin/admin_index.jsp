<%@page import="project7.store.dao.StoreDao"%>
<%@page import="project7.store.dto.StoreDto"%>
<%@page import="project.board.dto.BoardDto"%>
<%@page import="project.board.dao.BoardDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="adminHeader.jsp" %>
<% 
	
	//한 페이지에 나타낼 row 의 갯수
	final int PAGE_ROW_COUNT=5;
	//하단 디스플레이 페이지 갯수
	final int PAGE_DISPLAY_COUNT=5;
	
	//보여줄 페이지의 번호
	int pageNum=1;
	//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와 본다.	
	String strPageNum=request.getParameter("pageNum");
	if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
		//페이지 번호를 설정한다.
		pageNum=Integer.parseInt(strPageNum);
	}
	//보여줄 페이지 데이터의 시작 ResultSet row 번호
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지 데이터의 끝 ResultSet row 번호
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	//전체 row 의 갯수를 읽어온다.
	int totalRow=StoreDao.getInstance().getCount();
	//전체 페이지의 갯수 구하기
	int totalPageCount=
			(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//시작 페이지 번호
	int startPageNum=
		1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	//끝 페이지 번호
	int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	//끝 페이지 번호가 잘못된 값이라면 
	if(totalPageCount < endPageNum){
		endPageNum=totalPageCount; //보정해준다. 
	}		
	// CafeDto 객체에 위에서 계산된 startRowNum 과 endRowNum 을 담는다.
	StoreDto dto=new StoreDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	//1. DB 에서 글 목록을 얻어온다.
	List<StoreDto> list=StoreDao.getInstance().getList(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_index.css" />
</head>
<body>
<div class="container">
<div style="text-align:center; padding-top : 30px;"><h1> 관리자 페이지</h1></div>
	
<p> <!-- logo 들어갈 자리 -->
<%-- 	<a href="${pageContext.request.contextPath}/index.jsp">홈페이지</a> --%>
</p>
<ul>
	<li><a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/admin/admin_userList.jsp">회원 목록</a></li>

</ul>

<h2>게시글 List </h2>
<a href="admin_store/admin_store_insertform.jsp"><span class="btn btn-outline-info" style="float:right; padding-bottom:5px;">글작성하기</span></a>
<table class="table">
	<thead class="thead-dark">
		<tr>
			<th>글번호</th>
			<th>가게 이름 </th>
			<th>대표 메뉴</th>
			<th>contents(가게설명)</th>
			<th>가게 등록일</th>
			<th>글 삭제</th>
		</tr>
	</thead>
	<tbody>
	<!-- store 로 바꿔야함 -->
		<%for(StoreDto tmp:list){%>
			<tr>
				<td><%=tmp.getSnum() %></td>
				<td><a href="admin_store/store_detail.jsp?snum=<%=tmp.getSnum() %>"><%=tmp.getSname() %></a></td>
				<td><%=tmp.getSmenu() %></td>
				<td><%=tmp.getContents() %></td>
				<td><%=tmp.getUdate() %></td>
				<td><a class="btn btn-outline-danger" href="javascript:deleteConfirm(<%=tmp.getSnum() %>)">삭제</a></td>
			</tr>
		<%}%>
	</tbody>
</table>
	<div class="page-display" style="padding-bottom : 30px;">
		<ul>
			<%if(startPageNum != 1){ %>
				<li>
					<a href="list.jsp?pageNum=<%=startPageNum-1 %>">&laquo;</a>
				</li>
			<%}else{ %>
				<li class="muted">
					<a href="javascript:">&laquo;</a>
				</li>
			<%} %>
			<%for(int i=startPageNum; i<=endPageNum; i++){ %>
				<%if(i == pageNum){ %>
					<li class="active">
						<a href="admin_index.jsp?pageNum=<%=i %>"><%=i %></a>
					</li>
				<%}else{ %>
					<li>
						<a href="admin_index.jsp?pageNum=<%=i %>"><%=i %></a>
					</li>
				<%} %>
			<%} %>
			<%if(endPageNum < totalPageCount){ %>
				<li>
					<a href="admin_index.jsp?pageNum=<%=endPageNum+1 %>">&raquo;</a>
				</li>
			<%}else{ %>
				<li class="muted">
					<a href="javascript:">&raquo;</a>
				</li>
			<%} %>
		</ul>
	</div>
</div>	


</body>
<script>
function deleteConfirm(snum){
	var isDelete=confirm(snum+" 번 글을 삭제 하시겠습니까?");
	if(isDelete){
		location.href="admin_store/store_delete.jsp?snum="+snum;
	}
}
</script>
<hr/>
<%@include file="../footer.jsp" %>
</html>