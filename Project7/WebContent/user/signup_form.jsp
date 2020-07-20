<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    %>
<!DOCTYPE html>
<style>
 	.h_logo {
    display: block;
    overflow: hidden;
    width: 240px;
    height: 44px;
    margin: 0 auto;
    background-repeat: no-repeat;
    background-position: 0 0;
    -webkit-background-size: 240px auto;
    background-size: 240px auto;
}
	.body-center {
	 	
	 
	}
</style>
<html>
<head>
<meta charset="UTF-8">
<title>/user/signup_form.jsp</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
</head>
<body>
<div class="body-center">
	<div class="container">
	
  	 	<h2 class="h_logo">로고 넣을 곳</h2>

   <form action="${pageContext.request.contextPath}/user/signup.jsp" method="post" id="regForm">
  
      <div class="form-group col-md-4">
         <h5><label for="name">이름(필수)</label></h5>
         <input type="text" class="form-control" name="name" id="name" required/>
      
         <h5><label for="id">아이디(필수)</label></h5>
         <input type="text" class="form-control" name="id" id="id" required />
         <button id="checkBtn">중복확인</button><br />
         <span id="checkResult"></span>
	</div>
	
      <div class="form-group col-md-4">
         <h5><label for="pwd">비밀번호</label></h5>
         <input type="password" class="form-control" name="pwd" id="pwd"/>
      </div>
      <div class="form-group col-md-4">
         <h5><label for="pwd2">비밀번호 확인</label></h5>
         <input type="password" class="form-control" name="pwd2" id="pwd2"/><br />
         <span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span>
         <span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span>
      </div>
      <div class="form-group col-md-4">
         <h5><label for="phone">전화번호(필수)</label></h5>
         <input type="text" class="form-control" name="phone" id="phone" required/>

      </div>
      <div class="form-group col-md-4">
         <h5><label for="gender">성별</label></h5>
         <select class="custom-select" name="gender" id="gender" >
         <option value selected>성별</option>      
         <option value="M">남</option>
         <option value="W">여</option>
         </select>
      </div>
      <div class="form-group col-md-4">
         <h5><label for="email">본인 확인 이메일<span>(선택)</span></label></h5>
         <input type="text" class="form-control" id="email" name="email" placeholder="선택입력"/>
      </div>
      <div class="form-group col-md-4">
      <button type="submit" class="btn btn-primary btn-lg">가입</button>
      <button type="reset" class="btn btn-secondary btn-lg">취소</button>
      </div>
   </form>
<script>
   //비밀번호 확인에서 벗어나면 실행되는 함수
    $('#pwd2').focusout(function () {
        var pwd1 = $("#pwd").val();
        var pwd2 = $("#pwd2").val();
 
        if ( pwd1 != '' && pwd2 == '' ) {
            null;
        } else if (pwd1 != "" || pwd2 != "") {
            if (pwd1 == pwd2) {
                $("#alert-success").css('display', 'inline-block');
                $("#alert-danger").css('display', 'none');
            } else {
                alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
                $("#alert-success").css('display', 'none');
                $("#alert-danger").css('display', 'inline-block');
            }
        }
    });

    //아이디 중복확인을 통과했는지 여부
   var canUseId=false;
   //중복확인 버튼을 눌렀을 때 실행할 함수 등록
   $("#checkBtn").on("click",function(){
   //입력한 아이디를 읽어온다.
   var inputId=$("#id").val();
   //ajax를 이용해서 서버에 보낸 후 결과를 응답 받는다.
   $.ajax({
      method:"GET",
      url:"checkid.jsp",
      data:"inputId="+inputId,
      success:function(data){
         //data=>{isExist:true} or {isExist:false}인 object이다
         if(data.isExist){ //이미 존재하는 아이디로 사용 불가
            $("#checkResult").text("사용불가").css("color","red");
            //아이디가 사용불가하다고 표시
            canUseId=false;
         }else{ //사용가능
            if(inputId.length<3){
               alert("아이디는 3자 이상 입력해주십시오.");
               return false;
               }else{
               $("#checkResult").text("사용가능").css("color","green");
               //아이디가 사용가능하다고 표시
               canUseId=true;
               }
         }
      }
      });
      //form안에 있는 일반 버튼을 눌러도 폼이 전송되기때문에 폼 전송을 막아준다.
      return false;
   });
   
   //폼에 submit 이벤트가 일어났을 때 호출될 함수 등록
   $("#regForm").on("submit",function(){
      if(!canUseId){//사용불가한 아이디면
         alert("아이디 중복확인을 하세요");
         return false; //폼 제출 막기
      }
   });
</script>
	</div>
</div>
</body>
</html>