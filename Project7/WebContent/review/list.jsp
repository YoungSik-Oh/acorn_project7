<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	li{
	float:left;
	list-style : none;
	}

</style>
<link rel="stylesheet" href="../css/bootstrap.css" />
</head>
<body>
<section class="module main_popular_restaurant_wrap">
  <h2 class="title">EAT딜을 판매중인 식당</h2>
  <div class="slider-container popular_restaurant_container">
    <ul class="list-restaurants main_popular_restaurant_list type-main">
        <li class="restaurant-item">
          <div class="popular_restaurant_inner_wrap">
            <a href="${pageContext.request.contextPath}/index.jsp">
              <figure class="restaurant-item">
                <div class="thumb">
                  <img class="center-croping lazy" src="${pageContext.request.contextPath}/images/0.png"/>
                </div>
                <figcaption>
                  <div class="info">
                    <span class="title">지노스뉴욕피자</span>
                    <strong class="point search_point ">4.3</strong>
                    <p class="etc">
                      신사/압구정 -
                      기타 양식
                    </p>
                  </div>
                </figcaption>
              </figure>
            </a>
          </div>
        </li>
        <li class="restaurant-item">
          <div class="popular_restaurant_inner_wrap">
            <a href="${pageContext.request.contextPath}/user/loginform.jsp">
              <figure class="restaurant-item">
                <div class="thumb">
                  <img class="center-croping lazy" src="${pageContext.request.contextPath}/images/1.png"/>
                </div>
                <figcaption>
                  <div class="info">
                    <span class="title">지노스뉴욕피자</span>
                    <strong class="point search_point ">4.3</strong>
                    <p class="etc">
                      신사/압구정 -
                      기타 양식
                    </p>
                  </div>
                </figcaption>
              </figure>
            </a>
          </div>
        </li>
        <li class="restaurant-item">
          <div class="popular_restaurant_inner_wrap">
            <a href="${pageContext.request.contextPath}/board/asdf.jsp">
              <figure class="restaurant-item">
                <div class="thumb">
                  <img class="center-croping lazy" src="${pageContext.request.contextPath}/images/2.png"/>
                </div>
                <figcaption>
                  <div class="info">
                    <span class="title">지노스뉴욕피자</span>
                    <strong class="point search_point ">4.3</strong>
                    <p class="etc">
                      신사/압구정 -
                      기타 양식
                    </p>
                  </div>
                </figcaption>
              </figure>
            </a>
          </div>
        </li>
        <li class="restaurant-item">
          <div class="popular_restaurant_inner_wrap">
            <a href="${pageContext.request.contextPath}/user/loginform.jsp">
              <figure class="restaurant-item">
                <div class="thumb">
                  <img class="center-croping lazy" src="${pageContext.request.contextPath}/images/3.png"/>
                </div>
                <figcaption>
                  <div class="info">
                    <span class="title">지노스뉴욕피자</span>
                    <strong class="point search_point ">4.3</strong>
                    <p class="etc">
                      신사/압구정 -
                      기타 양식
                    </p>
                  </div>
                </figcaption>
              </figure>
            </a>
          </div>
        </li>
       </ul>
       </div>
       </section>
       <a href="javascript:history.back()">돌아가기</a>
</body>
</html>