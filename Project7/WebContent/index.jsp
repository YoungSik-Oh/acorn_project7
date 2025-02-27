<%@page import="project7.store.dto.StoreDto"%>
<%@page import="java.util.List"%>
<%@page import="project7.store.dao.StoreDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v4.0.1">
<link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/album/">
<title>index.jsp</title>

    <!-- Bootstrap core CSS -->
<link href="/docs/4.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common/navbar.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
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
<!-- nav script 입니다. -->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
 <%
   ///한 페이지에 나타낼 row 의 갯수
   final int PAGE_ROW_COUNT=9;
   //하단 디스플레이 페이지 갯수
   final int PAGE_DISPLAY_COUNT=5;
   
   //보여줄 페이지의 번호
   int pageNum=1;
   //보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와 본다.   
   String strPageNum=request.getParameter("pageNum");
   if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
      //페이지 번호를 설정한다<div class=""></div>
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
    %>
 
</head>
<%
	//id라는 키값으로 세션에 저장된 문자열이 있는지 읽어와 본다.
	String id=(String)session.getAttribute("id");
%>
<body>
 <header>
  <div class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container d-flex justify-content-between">
      <a href="index.jsp" class="navbar-brand d-flex align-items-center">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="mr-2" viewBox="0 0 24 24" focusable="false"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
        <strong>야요기어떄</strong>
      </a>
      
      <div class="row">
      	<nav class="navbar navbar-expand-lg navbar-light">
  			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
   			 <span class="navbar-toggler-icon"></span>
  			</button>
  			
  	  		<div class="collapse navbar-collapse" id="navbarNav">
	    		<ul class="navbar-nav">
		      		<%if(id == null){ %>
		      			<li class="nav-item">
		        			<a class="space" class="nav-link" href="admin/admin_login_form.jsp">관리자 로그인 <span class="sr-only"></span></a>
		      			</li>
		      			<li class="nav-item">
		       			    <a class="space" class="nav-link" href="user/loginform.jsp">로그인</a>
		      			</li>
		      			<li class="nav-item">
		        			<a class="space" class="nav-link" href="user/signup_form.jsp">회원가입</a>
		      			</li>
		      		<%}else{ %>
		      			<li class="nav-item">
		      				<a class="space" href="user/info.jsp"><%=id %>님 환영합니다.</a>
		      			</li>
		      			<li class="nav-item">
		      				<a class="space" href="user/logout.jsp">로그아웃</a>
		      			</li>
		      		<%} %>
	    		</ul>
  			</div>
	     </nav>
	  </div>
    </div>
  </div>
</header>

<main role="main">
  <section class="jumbotron text-center">
  
  </section>

  <h1 class="Head">내 맘대로 정하는 메뉴</h1>

  <div class="album py-5 bg-light">
    <div class="container">
      <div class="row">
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm bgBlack">
          	<img class="foodMenu" style="height : 225px;" src="${pageContext.request.contextPath}/images/korean.gif"/>
          	<div class="info">
          		<a href="bestfood.jsp"><h2>한식</h2></a>
          	</div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm bgBlack">
          <img style="height : 225px;" src="${pageContext.request.contextPath}/images/chinese.jpg"/>
          	<div class="info">
          		<a href="bestfood.jsp"><h2>중식</h2></a>
          	</div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm bgBlack">
          	<img style="height : 225px;" src="${pageContext.request.contextPath}/images/japanese.jpg">
         	<div class="info">
          		<a href="bestfood.jsp"><h2>일식</h2></a>
          	</div>
          </div>
        </div>

        <div class="col-md-4">
          <div class="card mb-4 shadow-sm bgBlack">
         	<img style="height : 225px;" src="${pageContext.request.contextPath}/images/fastfood.jpg">
          	<div class="info">
          		<a href="bestfood.jsp"><h2>패스트 푸드</h2></a>
          	</div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm bgBlack">
          	<img style="height : 225px;" src="${pageContext.request.contextPath}/images/snack.jpg">
          	<div class="info">
          		<a href="bestfood.jsp"><h2>분식</h2></a>
          	</div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm bgBlack">
          	<img style="height : 225px;" src="${pageContext.request.contextPath}/images/coffee.jpg">
         	<div class="info">
          		<a href="bestfood.jsp"><h2>카페</h2></a>
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
      	<%
      		 
      		List<StoreDto> list = StoreDao.getInstance().getList(dto);
      		
      		for(StoreDto tmp : list){
      	%>
      		<div class="col-md-4">
          		<div class="card mb-4 shadow-sm">	
            		<a href="${pageContext.request.contextPath}/board/fooddetail.jsp?snum=<%=tmp.getSnum()%>"><img class="bd-placeholder-img card-img-top" height="225" src="${pageContext.request.contextPath}<%=tmp.getS_imgpath() %>" /></a>
            		<div class="card-body">			
             	   		<p class="card-text"><%=tmp.getSname() %></p>
            		</div>
         	    </div>
            </div>
      	
      	<%} %>
      
      </div>
    </div>
   </div>
</main>

 <span style="float:right;"><a href="#">맨위로</a></span>	
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
      <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4"><!-- Grid column -->
        <!-- Links -->
        <h6 class="text-uppercase font-weight-bold">Semi_Project7 조</h6>
        <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
        <p><a href="#!">김택근</a></p>      
        <p><a href="#!">조민석</a></p>
        <p><a href="#!">오영식</a></p>
      </div><!-- Grid column -->
      <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">  <!-- Grid column -->
        <!-- Links -->
        <h6 class="text-uppercase font-weight-bold">(주) 요기어때</h6>
        
        <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
        <p><i class="fas fa-home mr-3" style="float:left; width:230px;"></i>서울특별시 강남구 테헤란로 124 삼원타워 5층</p> 
        <p><i class="fas fa-envelope mr-3"></i> Yogi@acorn.com</p>
        <p><i class="fas fa-phone mr-3"></i> 02-0000-0000</p>
      </div> <!-- Grid column -->
    </div> <!-- Grid row -->
  </div><!-- Footer Links -->
  <div class="footer-copyright text-center py-3">© 2020 Copyright: <!-- Copyright -->
    <a href="${pageContext.request.contextPath}/index.jsp/"> Acorn Semi_project 7 </a>
  </div> <!-- Copyright -->

</footer><!-- Footer -->


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
<script>window.jQuery || document.write('<script src="/docs/4.5/assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="/docs/4.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-1CmrxMRARb6aLqgBO7yyAxTOQE2AKb9GfXnEo760AUcUmFx3ibVJJAzGytlQcNXd" crossorigin="anonymous"></script>



</body>
</html>