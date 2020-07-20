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
<body>

<header  >
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
         <li>
          Level 2: .col-5 .col-sm-5
          <img id="img" src="${pageContext.request.contextPath}/images/1.jpg" />
        </div>
        <div class="col-7 col-sm-7">
          Level 2: .col-7 .col-sm-7
          <span><h3>맛집 제목(title)</h3></span>
          <p><strong>글 내용</strong> 닭도리탕계의 신세계. 닭이 입안에서 살아 뛰논다. 어디서 한약 먹인 닭을 공수해오시는 건지, 
          	닭고기 아주 야들야들하고 결대로 쫙쫙 찢어지는 것이 지금까지 먹던 닭들과는 다른 류의 것이 분명하다.
          	 양념 역시 찰떡! 이 맛을 아는 사람과 함께라면 대기줄을 겸허히 받아들일 것이다.</p>
     	 <a  href="#"><span class="detail">자세히보기</span></a>
         </li>
        </div>
      </div>
     </ul>
    </div>
  </div>
  
</div>
</body>
</html>