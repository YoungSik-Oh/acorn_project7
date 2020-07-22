<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.0.1">
    <title>Album example · Bootstrap</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/album/">

    <!-- Bootstrap core CSS -->
<link href="/docs/4.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/4.5/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/4.5/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/4.5/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/4.5/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/4.5/assets/img/favicons/safari-pinned-tab.svg" color="#563d7c">
<link rel="icon" href="/docs/4.5/assets/img/favicons/favicon.ico">
<meta name="msapplication-config" content="/docs/4.5/assets/img/favicons/browserconfig.xml">
<meta name="theme-color" content="#563d7c">
<link rel="stylesheet" href="css/bootstrap.css" />
<link href="album.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css" />
<link href="album.css" rel="stylesheet">
  </head>
  <body>
  <header>
  <div class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container d-flex justify-content-between">
      <a href="#" class="navbar-brand d-flex align-items-center">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="mr-2" viewBox="0 0 24 24" focusable="false"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
        <strong>우리 로고 넣기!!</strong>
      </a>
      <ul>
        <a href="#"><li>로그인</li></a>
        <a href="#"><li>회원가입</li></a>
      </ul>
    </div>
  </div>
</header>



<main role="main">
  <section class="jumbotron text-center">
    <div class="container">
      <h1 class="mainSearch">검색창 들어갈 자리</h1>
      <p class="searchBar"></p>
    </div>
  </section>

  <h1 class="Head">내 맘대로 정하는 메뉴</h1>
  <div class="album py-5 bg-light">
    <div class="container">
      <div class="row">
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm bgBlack">
          	<img class="foodMenu" style="height : 225px;" src="${pageContext.request.contextPath}/image/korean.gif"/>
          	<div class="info">
          		<h2>한식</h2>
          	</div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm bgBlack">
          	<a href="#s"><img style="height : 225px;" src="${pageContext.request.contextPath}/image/chinese.jpg"/></a>
          	<div class="info">
          		<h2>중식</h2>
          	</div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm bgBlack">
          	<img style="height : 225px;" src="${pageContext.request.contextPath}/image/japanese.jpg">
         	<div class="info">
          		<h2>일식</h2>
          	</div>
          </div>
        </div>

        <div class="col-md-4">
          <div class="card mb-4 shadow-sm bgBlack">
         	<img style="height : 225px;" src="${pageContext.request.contextPath}/image/fastfood.jpg">
          	<div class="info">
          		<h2>분식</h2>
          	</div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm bgBlack">
          	<img style="height : 225px;" src="${pageContext.request.contextPath}/image/snack.jpg">
          	<div class="info">
          		<h2>패스트 푸드</h2>
          	</div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm bgBlack">
          	<img style="height : 225px;" src="${pageContext.request.contextPath}/image/coffee.jpg">
         	<div class="info">
          		<h2>카페</h2>
          	</div>
          </div>
        </div>
       </div>
      </div>
     </div>
        <h1 class="Head">관리자가 추천해주는 믿고 보는 맛집!</h1>
           
      <div class="album py-5 bg-light">
      <div class="container">
      <div class="row">
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
            <div class="card-body">
              <p class="card-text">영식님이 추천해주시는 맛집 1</p>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
            <div class="card-body">
              <p class="card-text">택근님이 추천해주시는 맛집 2</p>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
            <div class="card-body">
              <p class="card-text">민석이가 추천하는 맛집 3</p>
            </div>
          </div>
        </div>
      </div>
    </div>
   </div>
</main>

<footer class="text-muted">
  <div class="container">
    <p class="float-right">
      <a href="#">맨 위로</a>
    </p>
    <h1>에이콘 아카데미 세미 프로젝트</h1>
    <p>갑자기 팀원이 세명이 되었다 ???????</p>
  </div>
</footer>
<script>
 $('.bgBlack').hover(function() {
	    var img = $(this).children().first();
	    var info = $(this).children().last();
	 	$(img).css("opacity", "0.3");
		$(info).css("display","block");
	}, function(){
		var img = $(this).children().first();
	    var info = $(this).children().last();
		$(img).css("opacity", "1");
	    $(info).css("display","none");
	});
 </script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
      <script>window.jQuery || document.write('<script src="/docs/4.5/assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="/docs/4.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-1CmrxMRARb6aLqgBO7yyAxTOQE2AKb9GfXnEo760AUcUmFx3ibVJJAzGytlQcNXd" crossorigin="anonymous"></script></body>
</html>
