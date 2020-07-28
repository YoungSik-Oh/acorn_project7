<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String id=(String)session.getAttribute("id"); %>
 <header>
  <div class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container d-flex justify-content-between">
      <a href="${pageContext.request.contextPath}/index.jsp" class="navbar-brand d-flex align-items-center">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="mr-2" viewBox="0 0 24 24" focusable="false"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
        <strong>우리 로고 넣기!!</strong>
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
		        			<a class="space" class="nav-link" href="${pageContext.request.contextPath}/admin/admin_login_form.jsp">관리자 로그인 <span class="sr-only"></span></a>
		      			</li>
		      			<li class="nav-item">
		       			    <a class="space" class="nav-link" href="${pageContext.request.contextPath}/user/loginform.jsp">로그인</a>
		      			</li>
		      			<li class="nav-item">
		        			<a class="space" class="nav-link" href="${pageContext.request.contextPath}/user/signup_form.jsp">회원가입</a>
		      			</li>
		      		<%}else{ %>
		      			<li class="nav-item">
		      				<a class="space" href="${pageContext.request.contextPath}/user/info.jsp"><%=id %>님 환영합니다.</a>
		      			</li>
		      			<li class="nav-item">
		      				<a class="space" href="${pageContext.request.contextPath}/user/logout.jsp">로그아웃</a>
		      			</li>
		      		<%} %>
	    		</ul>
  			</div>
	     </nav>
	  </div>
    </div>
  </div>
</header>