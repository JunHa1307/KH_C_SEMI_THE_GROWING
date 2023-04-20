<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String snsId = (String)session.getAttribute("snsId");
	int userLevel = Integer.parseInt(session.getAttribute("userLevel")+"");
	String snsName = (String)session.getAttribute("snsName");
	int snsType = Integer.parseInt(session.getAttribute("snsType")+"");
	String filePath = (String)session.getAttribute("filePath");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style>
	html{
		display:none;
	}
</style>
</head>
<body>
	<form id="form" action="<%=request.getContextPath() %>/apinsert.me" method="post">
		<input type="text" name="snsId" value="<%= snsId %>">
		<input type="text" name="userLevel" value="<%= userLevel %>">
		<input type="text" name="snsName" value="<%= snsName %>">
		<input type="text" name="snsType" value="<%= snsType %>">
		<input type="text" name="filePath" value="<%= filePath %>">
	</form>
	<script>
	$(function(){
	    document.getElementById('form').submit();		
	});
	</script>
</body>
</html>