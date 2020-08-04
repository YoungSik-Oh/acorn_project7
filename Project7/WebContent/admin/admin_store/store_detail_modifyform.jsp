<%@page import="jdk.nashorn.internal.ir.SetSplitState"%>
<%@page import="java.util.Set"%>
<%@page import="project7.store.dao.StoreDao"%>
<%@page import="project7.store.dto.StoreDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../adminHeader.jsp" %>
    <%
   int snum=Integer.parseInt(request.getParameter("snum"));
   StoreDto dto=StoreDao.getInstance().getData(snum);
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<title>store_modifyform.jsp</title>

</head>
<body>
<h1 style="text-align:center;">글 수정 폼 </h1>
<div class="container">
   <form action="store_modify.jsp" method="post">
     <div class="form-group">
       <label for="sname">상호명</label>
       <input type="hidden" name="snum" value="<%=dto.getSnum() %>"> 
       <input type="text" class="form-control" id="sname" value="<%=dto.getSname() %>" name="sname" >
     </div>
     <div class="form-group">
       <label for="saddr">가게 주소</label>
       <input type="text" class="form-control" value="<%=dto.getSaddr() %>"  id="saddr" name="saddr">
     </div>
     
     <div class="row">
           <div class="col">
             <label for="sphone">가게 전화번호</label>
             <input type="text" class="form-control" value="<%=dto.getSphone() %>" id="sphone" name="sphone">
           </div>
        <div class="col">
          <label for="stmenu">음식 종류</label>
          <input type="text" class="form-control"  value="<%=dto.getStmenu() %>" id="stmenu" name="stmenu">
        </div>
         <div class="col">
          <label for="sprice">가격대</label>
          <input type="text" class="form-control" value="<%=dto.getSprice()%>" id="sprice" name="sprice">
        </div>
     </div>
        
      <div class="row">
         <div class="col">
             <label for="stime">가게 운영시간</label>
             <input type="text" class=" form-control" value="<%=dto.getStime()%>" id="stime" name="stime">
          </div>
          <div class="col">
             <label for="sbtime">휴식 시간</label>
             <input type="text" class=" form-control" value="<%=dto.getStime()%>" id="sbtime" name="sbtime">
             </div>
     </div>
     
      <div class="form-group">
       <label for="slorder">마지막 주문 시간</label>
       <input type="text" class="form-control" value="<%=dto.getSlorder()%>" id="slorder" name="slorder">
     </div>
     
      <div class="row">
         <div class="col">
          <label for="srday">휴일</label>
          <input type="text" class="form-control" value="<%=dto.getSrday()%>" id="srday" name="srday">
        </div>
        <div class="col">
          <label for="smenu">메뉴</label>
          <input type="text" class="form-control" value="<%=dto.getSmenu() %>" id="smenu" name="smenu">
       </div>
     </div>
     
      <div class="form-group">
       <label for="contents">가게 소개</label>
       <textarea class="form-control" name="contents" id="contents" cols="100" rows="5" ><%=dto.getContents()%></textarea>
     </div>
     
     <button type="submit" class="btn btn-primary">수정</button>
     <button type="reset" class="btn btn-danger" >취소</button>
   </form>
</div>
<%@include file="../../footer.jsp" %>
</body>
</html>