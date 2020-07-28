<%@page import="project7.store.dto.StoreDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id=(String)session.getAttribute("id");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/insertform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
</head>
<body>

<div class="container">
<h1>리뷰 작성하는 곳.</h1>
	<form action="../insert_test.jsp" method="post" enctype="multipart/form-data">
	<input type="hidden" name="snum"  value="${snum}"/>
	<div class="form-group">
		<label class="col-sm-2 control-label" for="r_writer">아이디</label>
		<input class="form-control" type="text" name="r_writer" id="r_writer" value=<%=id %> disabled /><br />
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label" for="content">리뷰내용</label><br />
		<textarea class="form-control" name="r_content" id="r_content" cols="20" rows="5"></textarea><br />
	</div>
	
		<label for="image">사진 추가</label><br />
		<input type="file" name="image" id="image"  accept=".jpg, .jpeg, .png, .JPG, .JPEG"/><br />

		<input type="submit" value="등록"/>
		<input type="reset" value="취소"/>	
	</form>
</div>
</body>
</html>