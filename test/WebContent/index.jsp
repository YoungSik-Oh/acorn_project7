<<<<<<< HEAD
<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<<<<<<< HEAD
>>>>>>> refs/remotes/origin/oh1
=======
>>>>>>> refs/heads/oh1
<<<<<<< HEAD
=======
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

>>>>>>> refs/remotes/origin/cho
=======
>>>>>>> refs/remotes/origin/master
>>>>>>> refs/remotes/project/T1
<!DOCTYPE html>
<html>
<head>
<<<<<<< HEAD
<meta charset="UTF-8">
<title>Scroll.jsp</title>
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/index-section.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
=======
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/main.css" />
>>>>>>> refs/remotes/origin/cho
</head>
<body>
<<<<<<< HEAD
<<<<<<< HEAD
<header>
	<div>
		<div class="navbar navbar-expand-sm navbar-dark bg-primary">
			<a class="navbar-brand" href="${pageContext.request.contextPath}">logo</a>
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="#">맛집</a></li> 
				<li class="nav-item"><a class="nav-link" href="#">추천</a></li>
				<li class="nav-item"><a class="nav-link" href="/user/login.jsp">로그인</a></li>
			</ul>
		</div>
	</div>
	<div >
		container
=======

<a href="admin/admin_login_form.jsp">관리자 로그인</a>
<div class="scroll-container">
  <section>
    <h2>Section 1</h2>
    <div class="search" >
<<<<<<< HEAD
>>>>>>> refs/remotes/origin/oh1
=======
>>>>>>> refs/heads/oh1
>>>>>>> refs/remotes/origin/master
		<form action="">
			<legend>검색창</legend>
			<input type="text" name="search" placeholder="검색할 내용을 입력하세요."/>
			<button type="submit">검색</button>
		</form>
	</div>
<<<<<<< HEAD
</header>

<section> contents
	<div>제목
		<div>
			내용들
			
		</div>
	</div>
</section>
=======
  </section>
  <section>
    <h2>Section 2</h2>
    <div class="container">
   		container
   	</div>
  </section>
  <section>
    <h2>Section 3</h2>
  </section>
  <section>
    <h2>Section 4</h2>
  </section>
</div>
<<<<<<< HEAD
>>>>>>> refs/remotes/origin/oh1
=======
>>>>>>> refs/heads/oh1
>>>>>>> refs/remotes/origin/master
</body>
=======
	<h1 class="head">프로젝트 테스트를 시작합니다.</h1>
	<div class="container">
		<div class="row">
			<div class="col-md">
				<a href="${pageContext.request.contextPath}/Food/koreanFood.jsp"><img src="https://res.heraldm.com/phpwas/restmb_idxmake.php?idx=507&simg=/content/image/2019/07/01/20190701000670_0.jpg"/></a>
				<div class="info">
					<h1>한식</h1>
					<p>한식입니다. 드세요.</p>
				</div>
			</div>
			<div class="col-md">
				<a href="${pageContext.request.contextPath}/Food/chineseFood.jsp"><img src="https://mnews.imaeil.com/inc/photos/2019/01/22/2019012219212338149_l.jpg"/></a>
				<div class="info">
					<h1>중식</h1>
					<p>마라롱샤 먹어보고 싶다</p>
				</div>
			</div>
			<div class="col-md">
				<a href="${pageContext.request.contextPath}/Food/japanesFood.jsp"><img src="data:image/jpeg;base64,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"/></a>
				<div class="info">
					<h1>일식</h1>
					<p>초밥을 가장 좋아합니다.</p>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md">
				<a href="https://www.google.com/?&bih=750&biw=792&hl=ko"><img src="https://post-phinf.pstatic.net/MjAxOTEwMDFfNjkg/MDAxNTY5OTE5NzUxNDc2.mnGT1DcIaEY9os4ftETl5Bc_SudAwsUq8O3KaqlpQtQg.qhcMdUjcKqBoTC6hR1j7OnsY4BIpK1aulSmv0mlwO14g.JPEG/%EB%B6%84%EC%8B%9D.jpg?type=w1200"/></a>
				<div class="info">
					<h1>분식</h1>
					<p>분식입니다.. 드세요.</p>
				</div>
			</div>
			<div class="col-md">
				<a href="https://www.naver.com/"><img src="https://youthassembly.or.kr/old/niabbs5/upload/userfile/o_1b2gt73iu1ovghrt1k7sjki6i0a.jpg"/></a>
				<div class="info">
					<h1>패스트 푸드</h1>
					<p>햄버거 먹고싶다.</p>
				</div>
			</div>
			<div class="col-md">
				<a href="https://www.daum.net/"><img src="https://www.lightingnews.net/images/theme/cafe_01.png"/></a>
				<div class="info">
					<h1>카페</h1>
					<p>아이스티를 마십니다.</p>
				</div>
			</div>
		</div>
	</div>
	<a href="upload.jsp">업로드</a>
	<script>
		$('a').on('mouseover',function(){
			$(this).children().css('opacity','0.5');
// 			$(this).next().css('display','block');
			$(this).next().stop().show(500);
// 			$(this).next().fadeIn(500);
		});
		
		$('a').on('mouseleave',function(){
			$(this).children().css('opacity','1');
// 			$(this).next().css('display','none');
			$(this).next().stop().hide(500);
// 			$(this).next().fadeOut(500);
		});
	</script>
>>>>>>> refs/remotes/origin/cho
</html>