<%@page import="project7.store.dao.StoreDao"%>
<%@page import="project7.store.dto.StoreDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sname=request.getParameter("sname");
	String saddr=request.getParameter("saddr");
	String sphone=request.getParameter("sphone");
	String stmenu=request.getParameter("stmenu");
	String sprice=request.getParameter("sprice");
	String stime=request.getParameter("stime");
	String sbtime=request.getParameter("sbtime");
	String slorder=request.getParameter("slorder");
	String srday=request.getParameter("srday");
	String smenu=request.getParameter("smenu");
	
	StoreDto dto=new StoreDto();
	dto.setSname(sname);
	dto.setSaddr(saddr);
	dto.setSphone(sphone);
	dto.setStmenu(stmenu);
	dto.setSprice(sprice);
	dto.setStime(stime);
	dto.setSbtime(sbtime);
	dto.setSlorder(slorder);
	dto.setSrday(srday);
	dto.setSmenu(smenu);
	
	boolean isSuccess=StoreDao.getInstance().insert(dto);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
</head>
<body>
<h1>알림</h1>
	<%if(isSuccess){%>
		<script>
			alert("<%=sname %>의 가게가 등록 되었습니다.");
			location.href="${pageContext.request.contextPath}/admin/admin_index.jsp";
		</script>
	<%}else{ %>
		<script>
			alert("등록에 실패하였습니다. 다시 시도해 주십시오.");
			history.back();
		</script>
	
	<%} %>
</body>
</html>