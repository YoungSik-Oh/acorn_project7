<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
</head>
<body>
<div class="container">
<h1 style="text-align:center;">가게 올리기</h1>
	<form action="admin_store_insert.jsp" method="post" enctype="multipart/form-data">
	  <div class="form-group">
	    <label for="sname">상호명</label>
	    <input type="text" class="form-control" id="sname" name="sname" aria-describedby="emailHelp">
	  </div>
	  <div class="form-group">
	    <label for="saddr">가게 주소</label>
	    <input type="text" class="form-control" id="saddr" name="saddr">
	  </div>
	  <div class="form-group">
	    <label for="sphone">전화번호</label>
	    <input type="text" class="form-control" id="sphone" name="sphone">
	  </div>
	  <div class="form-group">
	    <label for="stmenu">음식 종류</label>
	    <input type="text" class="form-control" id="stmenu" name="stmenu">
	  </div>
	   <div class="form-group">
	    <label for="sprice">가격대</label>
	    <input type="text" class="form-control" id="sprice" name="sprice">
	  </div>
	   <div class="form-group">
	    <label for="stime">가게 운영시간</label>
	    <input type="text" class="form-control" id="stime" name="stime">
	  </div>
	   <div class="form-group">
	    <label for="sbtime">휴식 시간</label>
	    <input type="text" class="form-control" id="sbtime" name="sbtime">
	  </div>
	   <div class="form-group">
	    <label for="slorder">마지막 주문 시간</label>
	    <input type="text" class="form-control" id="slorder" name="slorder">
	  </div>
	   <div class="form-group">
	    <label for="srday">휴일</label>
	    <input type="text" class="form-control" id="srday" name="srday">
	  </div>
	   <div class="form-group">
	    <label for="smenu">메뉴</label>
	    <input type="text" class="form-control" id="smenu" name="smenu">
	  </div>
	  <div class="form-group">
	    <label for="contents">가게 소개</label>
	    <input type="text" class="form-control" id="contents" name="contents">
	  </div>
	  <div class="form-group">
		<label for="image">가게 이미지</label>
		<input class="form-control-file" type="file" id="image" name="image"/>
	 </div>
	  <button type="submit" class="btn btn-primary">입력 완료</button>
	  <button type="reset" class="btn btn-danger" >입력 취소</button>
	</form>
</div>
<hr/>
<%@include file="../../footer.jsp" %>
</body>
</html>