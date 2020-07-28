<%@page import="project.user.dto.UserDto"%>
<%@page import="project.user.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
     	request.setCharacterEncoding("utf-8");
    	//세션에 저장된 아이디
    	String id=(String)session.getAttribute("id");
    	//수정할 회원의 정보를 읽어온다
    	UserDto dto=UserDao.getInstance().getData(id);
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* 프로필 업로드 폼을 화면에서 숨긴다. */
	#profileForm {
		display:none;
	}
	/* 이미지를 작은 원형으로 만든다 */
	#profileImage{
		width: 150px;
		height: 150px;
		border: 1px solid #cecece;
		border-radius: 50%;
		cusor: pointer;
	}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
</head>
<body>
	<div class="container">
	<h1>회원정보 수정</h1>
	<form action="update.jsp" method="post">
		<%if(dto.getUserProfile()==null){ %>
		<a id="profileLink" href="javascript:"><img id="profileImage" src="${pageContext.request.contextPath}/images/yellowbird.png"/></a>
		<%} else { %>
		<a id="profileLink" href="javascript:"><img id="profileImage" src="${pageContext.request.contextPath}<%=dto.getUserProfile() %>" /></a>
		<%} %>
		<input type="hidden" name="profile" id="profile" value="<%=dto.getUserProfile()%>"/>
		<div class="form-group">
			<label for="name">이름</label>
			<input class="form-control" type="text" id="name" value="<%=dto.getUserName() %>" disabled />
		</div>
		<div class="form-group">
			<label for="id">아이디</label>
			<input class="form-control" type="text" id="id" value="<%=dto.getUserId() %>" disabled />
		</div>
		<div class="form-group">
			<label for="pwd">비밀번호</label>
			<input class="form-control" type="password" id="pwd" value="<%=dto.getUserPw() %>" disabled />
		</div>
		<div class="form-group">
			<label for="phone">전화번호</label>
			<input class="form-control" type="text" name="phone" id="phone" value="<%=dto.getUserPhone() %>" />
		</div>
		<div class="form-group">
			<label for="sex">성별</label>
			<input class="form-control" type="text" id="sex" value="<%=dto.getUserGender() %>" disabled />
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<input class="form-control" type="text" id="eamil" name="email" value="<%=dto.getUserEmail() %>"/>
		</div>
		<button class="btn btn-outline-info" type="submit">수정확인</button>
		<button class="btn btn-outline-secondary" type="reset"><a href="${pageContext.request.contextPath}/index.jsp">취소 및 돌아가기</a></button>
	</form>
	
	<form action="profile_upload.jsp" method="post" enctype="multipart/form-data" id="profileForm">
		<input type="file" name="image" accept=".jpg, .jpeg, .png, .JPG, .JPEG" id="image"/>
	</form>
	
</div>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.3.0/jquery.form.min.js" integrity="sha384-qlmct0AOBiA2VPZkMY3+2WqkHtIQ9lSdAsAn5RUJD/3vA5MKDgSGcdmIv4ycVxyn" crossorigin="anonymous"></script>
<script>
	//프로필이미지를 클릭했을 때 실행할 함수등록
	$("#profileLink").on("click",function(){
		//input type="file"을 강제 클릭한다.
		$("#image").click();
	});
	
	//이미지를 선택했을 때 실행할 함수 등록"
	$("#image").on("change",function(){
		//폼을 강제로 제출한다.
		$("#profileForm").submit();
	});
	//폼이 ajax로 제출될 수 있도록 플러그인을 동작 시킨다.
	$("#profileForm").ajaxForm(function(data){
		//프로필 이미지를 업데이트 한다. data => {imageSrc:"/upload/xxx.jpg"}
		console.log(data.imageSrc);
		$("#profileImage").attr("src","${pageContext.request.contextPath}"+data.imageSrc);
		//회원정보 수정폼 전송될 때 같이 전송 되도록한다.
		$("#profile").val(data.imageSrc); //input type="hidden"의 value 값
	});
	
	
</script>
</body>
</html>