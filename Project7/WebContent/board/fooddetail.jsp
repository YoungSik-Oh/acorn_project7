<%@page import="project.review.dao.ReviewDao"%>
<%@page import="project.review.dto.ReviewDto"%>
<%@page import="project.user.dao.UserDao"%>
<%@page import="project.user.dto.UserDto"%>
<%@page import="project7.store.dto.StoreDto"%>
<%@page import="project7.store.dao.StoreDao"%>
<%@page import="project.board.dao.BoardDao"%>
<%@page import="project.board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    //StoreDao 객체를 이용해서 글 목록 얻어오기
    String id=(String)session.getAttribute("id");
    
    int snum=Integer.parseInt(request.getParameter("snum"));
    
	StoreDto dto=StoreDao.getInstance().getData(snum);

	application.setAttribute("snum",snum);

    UserDao dao=UserDao.getInstance();	
    
    //review 테이블에서 쓸 것
    List<ReviewDto> list2=ReviewDao.getInstance().getList();
    ReviewDto dto2=new ReviewDto();
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<style>
	#profileImage{
	width:50px;
	height:50px;
	border: 1px solid #cecece;
	border-radius: 50%;
	}
</style>
</head>
<body>
<div class="container">
  <div class="row">
    <div class="col-sm-8 col-md-6" > <img style="height:300px; width:500px;" class="s_p"  %> </div>
    <div class="col-sm-4 col-md-6 ">
         <div class="s_p" id="map" style="height:300px; width:500px;"></div>
     </div>
  </div>
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

		 <a class="iconn" href="private/review.jsp">
				<svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-pencil" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	 		 		<path fill-rule="evenodd" d="M11.293 1.293a1 1 0 0 1 1.414 0l2 2a1 1 0 0 1 0 1.414l-9 9a1 1 0 0 1-.39.242l-3 1a1 1 0 0 1-1.266-1.265l1-3a1 1 0 0 1 .242-.391l9-9zM12 2l2 2-9 9-3 1 1-3 9-9z"/>
	  				<path fill-rule="evenodd" d="M12.146 6.354l-2.5-2.5.708-.708 2.5 2.5-.707.708zM3 10v.5a.5.5 0 0 0 .5.5H4v.5a.5.5 0 0 0 .5.5H5v.5a.5.5 0 0 0 .5.5H6v-1.5a.5.5 0 0 0-.5-.5H5v-.5a.5.5 0 0 0-.5-.5H3z"/>
				</svg>
			<input type="hidden" name="snum"  value="<%=dto.getSnum()%>"/>

			<figcaption id="rcaption" class="figure-caption">리뷰쓰기</figcaption>
		</a>
				<h3><%=dto.getSname()%> <strong><span>4.6</span></strong></h3>
		 <figcaption class="figure-caption">조회수</figcaption>
		</span>
		<hr style="clear:left" />
	</div>
	<table style="width: 50%" class="table table-borderless">
		<tbody>
			<tr>
				<th>주소</th>
				<td><%=dto.getSaddr()%></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><%=dto.getSphone()%></td>
			</tr>
			<tr>
				<th>음식 종류</th>
				<td><%=dto.getSmenu() %></td>
			</tr>
			<tr>
				<th>가격대</th>
				<td><%=dto.getSprice()%></td>
			</tr>
			<tr>
				<th>영업시간</th>
				<td><%=dto.getStime()%></td>
			</tr>
			<tr>
				<th>쉬는시간</th>
				<td><%=dto.getSbtime() %></td>
			</tr>
			<tr>
				<th>마지막 주문</th>
				<td><%=dto.getSlorder() %></td>
			</tr>
			<tr>
				<th>휴일</th>
				<td><%=dto.getSrday()%></td>
			</tr>
			<tr>
				<th>메뉴</th>
				<td>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">Cras justo odio</li>
						  <li class="list-group-item">Dapibus ac facilisis in</li>
						  <li class="list-group-item">Morbi leo risus</li>
						  <li class="list-group-item">Porta ac consectetur ac</li>
						  <li class="list-group-item">Vestibulum at eros</li>
					</ul>
				</td>
			</tr>
		</tbody>
	</table>
	<figcaption class="figure-caption text-right">업데이트 날짜 :<%=dto.getUdate()%></figcaption>
	<hr style="clear:left" />
	<h6><figcaption class="figure-caption">식당 소개</figcaption></h6>
	<p>어쩌구 저쩌구저쩌구저쩌구</p>
	<hr style="clear:left" />
	<h4>리뷰(<%=list2.size() %>)</h4>
		<table class="table table-hover">
			<tbody>
				
					<%for(ReviewDto tmp2:list2){%>
					<tr>
						<td>
						<%if(dao.getData(tmp2.getR_writer()).getUserProfile()==null){ %>
							<img id="profileImage" src="${pageContext.request.contextPath}/images/yellowbird.png"/>
						<%}else{ %>
							<img id="profileImage" src="${pageContext.request.contextPath}<%=dao.getData(tmp2.getR_writer()).getUserProfile() %>"/>
						<%} %>
						<br/>
							<%=tmp2.getR_writer() %>
						</td>
						<td>
							<%=tmp2.getR_regdate() %><br/>
								<%=tmp2.getR_content() %><br/>
							
								<img style="width:120px; height:120px;" src="${pageContext.request.contextPath}<%=tmp2.getR_imagePath() %>" onError="this.style.display='none'" />
							
						</td>
						<%if(tmp2.getR_writer().equals(id)){ %>
						<td>
						<input type="hidden" name="snum"  value="<%=dto.getSnum()%>"/>
						<a href="javascript:deleteConfirm(<%=tmp2.getR_num()%>)">삭제</a>
						</td>
						<%} %>
					</tr>
					<%} %>
			</tbody>
		</table>
</div>
<script>
	function deleteConfirm(r_num){
		var isDelete=confirm("작성하신 리뷰를 삭제 하시겠습니까?");
		if(isDelete){
			location.href="private/delete.jsp?r_num="+r_num;
		}
	}
</script>
<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
<%@include file="../footer.jsp" %>
</body>
</html>