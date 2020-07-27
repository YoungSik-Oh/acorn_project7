<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bestfood.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bestfood.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
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
</header>
<!-- 슬라이드쇼 -->
<div id="carousel" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carousel" data-slide-to="0" class="active"></li>
    <li data-target="#carousel" data-slide-to="1"></li>
    <li data-target="#carousel" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="slide-size" class="d-block w-100 "  src="${pageContext.request.contextPath}/images/container5.jpg" alt="First slide">
    </div>
    <div class="carousel-item">
      <img  class="slide-size" class="d-block w-100 " src="${pageContext.request.contextPath}/images/container2.jpg" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="slide-size" class="d-block w-100" src="${pageContext.request.contextPath}/images/food3.jpg" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carousel" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carousel" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div><!-- 슬라이드쇼 종료 -->

<div class="container">
	<div class="card mb-3" style="max-width: 100%;">
	  <div class="row no-gutters">
	    <div class="col-md-4">
	      <img src="${pageContext.request.contextPath}/image/chinese.jpg" class="card-img" alt="...">
	    </div>
	    <div class="col-md-8">
	      <div class="card-body">
	        <h5 class="card-title">Card title</h5>
	        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
	        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
	      </div>
	    </div>
	  </div>
	</div>
	<hr />

	<div class="card mb-3" style="max-width: 100%;">
	  <div class="row no-gutters">
	    <div class="col-md-4">
	      <img src="${pageContext.request.contextPath}/image/chinese.jpg" class="card-img" alt="...">
	    </div>
	    <div class="col-md-8">
	      <div class="card-body">
	        <h5 class="card-title">Card title</h5>
	        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
	        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
	      </div>
	    </div>
	  </div>
	</div>
	<hr />

	<div class="card mb-3" style="max-width: 100%;">
	  <div class="row no-gutters">
	    <div class="col-md-4">
	      <img src="${pageContext.request.contextPath}/image/chinese.jpg" class="card-img" alt="...">
	    </div>
	    <div class="col-md-8">
	      <div class="card-body">
	        <h5 class="card-title">Card title</h5>
	        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
	        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
	      </div>
	    </div>
	  </div>
	</div>
	<hr />
	
</div>


<!-- Footer -->
<footer class="page-footer font-small unique-color-dark">
  <div class="container text-center text-md-left mt-5">
    <!-- Grid row -->
    <div class="row mt-3">
      <!-- Grid column -->
      <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
        <!-- Content -->
        <h6 class="text-uppercase font-weight-bold">logo 들어갈 위치</h6>
        <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
        <p>Yogi logo
		Eat, Share, Be Happy.
		</p>
      </div><!-- Grid column -->
      <!-- Grid column -->
      <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
        <!-- Links -->
        <h6 class="text-uppercase font-weight-bold">Semi_Project7 조</h6>
        <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
        <p><a href="#!">김택근</a></p>      
        <p><a href="#!">조민석</a></p>
        <p><a href="#!">오영식</a></p>
      </div><!-- Grid column -->
      <!-- Grid column -->
      <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
        <!-- Links -->
        <h6 class="text-uppercase font-weight-bold">(주) 요기어때</h6>
        <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
        <p><i class="fas fa-home mr-3" style="float:left; width:230px;"></i>서울특별시 강남구 테헤란로 124 삼원타워 5층</p> 
        <p><i class="fas fa-envelope mr-3"></i> Yogi@acorn.com</p>
        <p><i class="fas fa-phone mr-3"></i> 02-0000-0000</p>
      </div><!-- Grid column -->
    </div>    <!-- Grid row -->
  </div><!-- Footer Links -->
  <!-- Copyright -->
  <div class="footer-copyright text-center py-3">© 2020 Copyright:
    <a href="${pageContext.request.contextPath}/index.jsp/"> Acorn Semi_project 7 </a>
  </div>
  <!-- Copyright -->

</footer>
<!-- Footer -->
</body>
</html>