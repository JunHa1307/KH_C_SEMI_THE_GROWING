<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String errorMsg = (String) request.getAttribute("errorMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="/growing/resources/js/alert.js"></script>
</head>
<body>
	<script>
	error("<%=errorMsg%>");
	setTimeout(() =>  history.back(), 2000);
	</script>
	
</body>
</html>