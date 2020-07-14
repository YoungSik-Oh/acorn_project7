<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<style>
.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}
</style>
</head>
<body>
<%
	//id라는 키값으로 세션에 저장된 문자열이 있는지 읽어와 본다.
	String id=(String)session.getAttribute("id");
%>
<div class="container">
<%if(id!=null){ %>
	<p>
		<a href="userz/info.jsp"><%=id %></a>님 로그인 중
		<a href="userz/logout.jsp">로그아웃</a>
	</p>
<%} %>
	<h1>인덱스 페이지 입니다.</h1>
	<ul>
		<li><a href="userz/signup_form.jsp">회원가입</a></li>
		<li><a href="userz/loginform.jsp">로그인</a></li>
		<li><a href="board/list.jsp">보드</a></li>
	</ul>
</div>
<div class="starRev">
  <span class="starR on">별1</span>
  <span class="starR">별2</span>
  <span class="starR">별3</span>
  <span class="starR">별4</span>
  <span class="starR">별5</span>
  <span class="starR">별6</span>
  <span class="starR">별7</span>
  <span class="starR">별8</span>
  <span class="starR">별9</span>
  <span class="starR">별10</span>
</div>
<script>
$('.starRev span').click(function(){
  $(this).parent().children('span').removeClass('on');
  $(this).addClass('on').prevAll('span').addClass('on');
  return false;
});
</script>
</body>
</html>