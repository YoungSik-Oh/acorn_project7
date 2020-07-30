<%@page import="project7.store.dto.StoreDto"%>
<%@page import="project7.store.dao.StoreDao"%>
<%@page import="java.util.List"%>
<%@page import="project.user.dto.UserDto"%>
<%@page import="project.user.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/admin_index.css" />
<%@include file="adminHeader.jsp" %>
    <%
    	
	  //MemberDao 객체의 참조값 얻어오기 
	  	UserDao dao=UserDao.getInstance();
	  	//회원 목록 얻어오기
	  	List<UserDto> list = null; 
	  	

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
	      
	  	  // 객체에 위에서 계산된 startRowNum 과 endRowNum 을 담는다.
	      UserDto dto=new UserDto();
	      dto.setStartRowNum(startRowNum);
	      dto.setEndRowNum(endRowNum);
	      
	      //전체 row 의 갯수를 읽어온다.
	      int totalRow=UserDao.getInstance().getCount();
	      
	      list = UserDao.getInstance().getList(dto);
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
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<style>
	.userAdd{
		float:right;
		padding: 0px 20px 20px 0px;
	}
</style>
</head>
<body>
<div class="container">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/admin_index.jsp">Home</a></li>
		<li class="breadcrumb-item active">회원목록</li>
	</ol>
	<h1>회원 목록입니다.</h1>
	<div class="userAdd"><a href="admin_userInsert_form.jsp">회원 추가</a></div>
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

	<div class="page-display">
      <ul>
         <%if(startPageNum != 1){ %>
            <li>
               <a href="admin_userList.jsp?pageNum=<%=startPageNum-1 %>">&laquo;</a>
            </li>
         <%}else{ %>
            <li class="muted">
               <a href="javascript:">&laquo;</a>
            </li>
         <%} %>
         <%for(int i=startPageNum; i<=endPageNum; i++){ %>
            <%if(i == pageNum){ %>
               <li class="active">
                  <a href="admin_userList.jsp?pageNum=<%=i %>"><%=i %></a>
               </li>
            <%}else{ %>
               <li>
                  <a href="admin_userList.jsp?pageNum=<%=i %>"><%=i %></a>
               </li>
            <%} %>
         <%} %>
         <%if(endPageNum < totalPageCount){ %>
            <li>
               <a href="admin_userList?pageNum=<%=endPageNum+1 %>">&raquo;</a>
            </li>
         <%}else{ %>
            <li class="muted">
               <a href="javascript:">&raquo;</a>
            </li>
         <%} %>
      </ul>
   </div>
   
</div>
<div style="height : 150px;"></div>
<hr/>
<%@include file="../footer.jsp" %>
</body>
</html>