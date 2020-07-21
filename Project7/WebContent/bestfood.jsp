<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bestfood.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bestfood.css" />
</head>
<%
	//id라는 키값으로 세션에 저장된 문자열이 있는지 읽어와 본다.
	String id=(String)session.getAttribute("id");
%>
<body>
<header>
  <div class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container d-flex justify-content-between">
      <a href="${pageContext.request.contextPath}/index.jsp" class="navbar-brand d-flex align-items-center">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="mr-2" viewBox="0 0 24 24" focusable="false"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
        <strong>우리 로고 넣기!!</strong>
      </a>
      <ul class="login_info">
      <%if(id!=null){ %> 
		<li><a href="user/info.jsp"><%=id %>님</a> 환영합니다.</li>
		<li><a href="user/logout.jsp">로그아웃</a></li>
		<%}else{ %>
	       <li><a href="user/signup_form.jsp">회원가입</a></li>
      	  <li><a href="user/loginform.jsp">로그인</a></li>
		<%} %>
		<li><a href="admin/admin_login_form.jsp">관리자 로그인</a></li>
      </ul>
    </div>
  </div>

<img class="img-fluid" src="${pageContext.request.contextPath}/images/1.jpg" />
</header>
<div class="container">
	<!-- 이 부분이 글 작성 할 때마다 추가가 된다. -->
  <div class="row">
    <div class="col-sm-9">
    <ul>
      Level 1: .col-sm-9
      <div class="row">
        <div class="col-5 col-sm-5">
          Level 2: .col-5 .col-sm-5  
         <a href="${pageContext.request.contextPath}/board/fooddetail.jsp"> <img id="img" src="${pageContext.request.contextPath}/images/1.jpg" /></a>
        </div>
        <div class="col-7 col-sm-7">
          Level 2: .col-7 .col-sm-7
          <span><h3>맛집 제목(title)</h3></span>
          <p><strong>글 내용</strong> 닭도리탕계의 신세계. 닭이 입안에서 살아 뛰논다. 어디서 한약 먹인 닭을 공수해오시는 건지, 
          	닭고기 아주 야들야들하고 결대로 쫙쫙 찢어지는 것이 지금까지 먹던 닭들과는 다른 류의 것이 분명하다.
          	 양념 역시 찰떡! 이 맛을 아는 사람과 함께라면 대기줄을 겸허히 받아들일 것이다.</p>
     		 <a  href="#"><span class="detail">자세히보기</span></a>'
        </div>
      </div>
     </ul>
    </div>
  </div>
</div>
</body>
</html>