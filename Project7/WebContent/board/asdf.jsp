<%@page import="project.board.dao.BoardDao"%>
<%@page import="project.board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
//BoardDao 객체를 이용해서 글 목록 얻어오기
	List<BoardDto> list=BoardDao.getInstance().getList();
    String id=(String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<style>
	body{
		
	
	}
	.s_p{
		width: 350px;
		height: 350px;
		padding: 10px;
	}
	#test ul li{
		list-style:none;
		float:left;
		padding: 0,50px,0,0;
	}
	.test{
	
	}
	
	th{
		width:150px;
	}
	tr, th, td{
		padding:5px;
	}
	.right{
		float:right;
	}
	
	#profileImage{
		width: 50px;
		height: 50px;
		border: 1px solid #cecece;
		border-radius: 50%;
		cusor: pointer;
	}
</style>
</head>
<body>



<div id="test">
	<ul>
	<li><img class="s_p" src="../images/1-1.jpg"/></li>
	<li><img src="../images/1.jpg" class="s_p" /></li>
	<li><img src="../images/1.jpg" class="s_p" /></li>
	<li><img src="../images/1.jpg" class="s_p" /></li>
	<!-- 맛집 위치를 나타내는 지도   -->
	<li><div class="s_p" id="map" style="width:350px;height:350px;"></div></li>
	</ul>
</div>



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43578d6ca94ca121ac810f9ca817dd36&libraries=services"></script>
<script>
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 

// 키워드로 장소를 검색합니다
ps.keywordSearch('대전광역시 서구 청사서로 14', placesSearchCB); 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}
</script>

<div class="container">
<div class="title_wrap">
<span>
<button class="right"><a href="review.jsp">리뷰쓰러가기</a></button>
	<h3>
		토미야
	<strong><span>4.6</span></strong>
	</h3>
	 <figcaption class="figure-caption">조회수</figcaption>
</span>
</div>
	<table class="table table-borderless">
		<tbody>
			<tr>
				<th>주소</th>
				<td>대전광역시 서구 청사서로 14 /가게.addr() </td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>010-1234-5678 가게.phone()</td>
			</tr>
			<tr>
				<th>음식 종류</th>
				<td>라멘, 소바 /가게.t_menu()</td>
			</tr>
			<tr>
				<th>가격대</th>
				<td>만원 미만 /가게.price()</td>
			</tr>
			<tr>
				<th>영업시간</th>
				<td>11:00~20:00 / 가게.time()</td>
			</tr>
			<tr>
				<th>쉬는시간</th>
				<td>15:00~17:00 / 가게.r_time()</td>
			</tr>
			<tr>
				<th>마지막 주문</th>
				<td>19:30 / 가게.l_order()</td>
			</tr>
			<tr>
				<th>휴일</th>
				<td>일 / 가게.r_day()</td>
			</tr>
			<tr>
				<th>메뉴</th>
				<td>가게.menu()</td>
			</tr>
		</tbody>
	</table>
	<figcaption class="figure-caption text-right">업데이트 날짜</figcaption>
	<h4>리뷰(<%=list.size() %>)</h4>
		<table class="table table-hover">
			<tbody>
			<%for(BoardDto tmp:list){ %>
				<tr>
					<td>
					 <img src="../images/2.jpg" id="profileImage" />
					<%=tmp.getWriter()%>
					</td>
					<td>
						<%=tmp.getRegdate() %>
				 		<p>리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용</p>
					</td>
					<td>별점</td>
				</tr>
			<%} %>
			</tbody>
		</table>
</div>
<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
</body>
</html>