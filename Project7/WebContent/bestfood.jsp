<%@page import="java.util.List"%>
<%@page import="project7.store.dao.StoreDao"%>
<%@page import="project7.store.dto.StoreDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="header.jsp" %>
    <%
   //한 페이지에 나타낼 row 의 갯수
   final int PAGE_ROW_COUNT=5;
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
    List<StoreDto> list= StoreDao.getInstance().getList(dto);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bestfood.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bestfood.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_index.css" />

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</head>

<body>

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

<div class="container" style="padding-top:30px;">
   <%for(StoreDto tmp:list){ %>
   <div class="card mb-3" style="max-width: 100%;">
     <div class="row no-gutters">
       <div class="col-md-4"><img style="height : 250px; width : 300px;" src="${pageContext.request.contextPath}<%=tmp.getS_imgpath() %>" class="card-img">
       </div>
       <div class="col-md-8">
         <div class="card-body">
           <h5 class="card-title"><a style="color : black" href="${pageContext.request.contextPath}/board/fooddetail.jsp?snum=<%=tmp.getSnum()%>"><%=tmp.getSname() %> </a></h5>
           <p class="card-text"><%=tmp.getContents() %></p>
           <p class="card-text"><small class="text-muted"><%=tmp.getUdate() %></small></p>
         </div>
       </div>
     </div>
   </div>
   <hr />
   <%} %>
   <div class="page-display">
      <ul>
         <%if(startPageNum != 1){ %>
            <li>
               <a href="bestfood?pageNum=<%=startPageNum-1 %>">&laquo;</a>
            </li>
         <%}else{ %>
            <li class="muted">
               <a href="javascript:">&laquo;</a>
            </li>
         <%} %>
         <%for(int i=startPageNum; i<=endPageNum; i++){ %>
            <%if(i == pageNum){ %>
               <li class="active">
                  <a href="bestfood.jsp?pageNum=<%=i %>"><%=i %></a>
               </li>
            <%}else{ %>
               <li>
                  <a href="bestfood.jsp?pageNum=<%=i %>"><%=i %></a>
               </li>
            <%} %>
         <%} %>
         <%if(endPageNum < totalPageCount){ %>
            <li>
               <a href="bestfood?pageNum=<%=endPageNum+1 %>">&raquo;</a>
            </li>
         <%}else{ %>
            <li class="muted">
               <a href="javascript:">&raquo;</a>
            </li>
         <%} %>
      </ul>
   </div>
</div>
<%@include file="footer.jsp" %>
</body>
</html>