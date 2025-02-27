<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/user/signup_form.jsp</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
</head>
<body>

<div class="container">
   <h1>admin_userInsert_form.jsp</h1>
   <form action="${pageContext.request.contextPath}/admin/admin_userInsert.jsp" method="post" id="regForm">
      <div class="form-group">
         <h3><label for="username">이름(필수)</label></h3>
         <input type="text" name="username" id="username" required/>
      
         <h3><label for="userid">아이디(필수)</label></h3>
         <input type="text" name="userid" id="userid" required />
         <button id="checkBtn">중복확인</button><br />
         <span id="checkResult"></span>

      </div>
      <div class="form-group">
         <h3><label for="userpw">비밀번호</label></h3>
         <input type="password" class="userpw" name="userpw" id="userpw"/>
      </div>
      <div class="form-group">
         <h3><label for="userpw2">비밀번호 확인</label></h3>
         <input type="password" class="pw" name="userpw2" id="userpw2"/><br />
         <span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span>
          <span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span>
      </div>
      <div class="form-group">
         <h3><label for="userphone">전화번호(필수)</label></h3>
         <input type="text" name="userphone" id="userphone" required/>

      </div>
      <div class="form-group">
         <h3><label for="usergender">성별</label></h3>
         <select name="usergender" id="usergender" >
         <option value selected>성별</option>      
         <option value="M">남</option>
         <option value="W">여</option>
         </select>
      </div>
      <div class="form-group">
         <h3><label for="useremail">본인 확인 이메일<span>(선택)</span></label></h3>
         <input type="text" id="useremail" name="useremail" placeholder="선택입력"/>
      </div>
      <button type="submit">회원 추가 </button>
      <button type="reset">취소</button>
   </form>
<script>
   //비밀번호 확인에서 벗어나면 실행되는 함수
    $('.pw').focusout(function () {
        var pwd1 = $("#userpw").val();
        var pwd2 = $("#userpw2").val();
 
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
   var inputId=$("#userid").val();
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
</body>
</html>