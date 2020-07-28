<%@page import="project7.store.dao.StoreDao"%>
<%@page import="project7.store.dto.StoreDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
	int snum=Integer.parseInt(request.getParameter("snum"));
    	   
    
    String sname=request.getParameter("sname");
	String saddr=request.getParameter("saddr");
	String sphone=request.getParameter("sphone");
	String stmenu=request.getParameter("stmenu");
	String sprice=request.getParameter("sprice");
	String stime=request.getParameter("stime");
	String sbtime=request.getParameter("sbtime");
	String slorder=request.getParameter("slorder");
	String srday=request.getParameter("srday");
	String contents=request.getParameter("contents");
	String smenu=request.getParameter("smenu");
	
	StoreDto dto=new StoreDto();
	dto.setSnum(snum);
	dto.setSname(sname);
	dto.setSaddr(saddr);
	dto.setSphone(sphone);
	dto.setStmenu(stmenu);
	dto.setSprice(sprice);
	dto.setStime(stime);
	dto.setSbtime(sbtime);
	dto.setSlorder(slorder);
	dto.setSrday(srday);
	dto.setContents(contents);
	dto.setSmenu(smenu);
    
	boolean isSuccess=StoreDao.getInstance().update(dto);
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>store_modify.jsp</title>
</head>
<body>
<% if(isSuccess){%>
	<script>
		alert(" 글을 수정했습니다.");
		location.href="store_detail.jsp?snum=<%=snum%>";
	</script>
	<%}else{ %>
	<script>
		alert("글 수정 실패!");
		history.back();
	</script>
<%} %>
</body>
</html>