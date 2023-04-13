<%@page import="com.kh.board.model.vo.Scrap, java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ArrayList<Scrap> slist = (ArrayList<Scrap>) request.getSession().getAttribute("slist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#myscrap_content{
		border: 2px solid #ffe4af;
		width: 250px;
		height: 300px;
		border-radius: 20px;
		margin: 10px 20px;
		display: inline-flex;
		background-color: #fcffb0;
		box-shadow: 0 3px 10px rgba(0,0,0,0.25);
	}
	#myscrap_content:hover{
		background-color: #fdfa87;
	}
	
</style>
</head>
<body>
<%@include file="myInfoFrame.jsp"%>
	<div id="board_area">
		<div id="myclass_header">
		<div id="myclass_area">
				<div id="myclass_title">나의 스크랩</div>
		</div>
		<div id="myclass_hr">
			<hr />
		</div>
		</div>
		<div class="wrap" style="width: 100%; height: 100%;">
		<%-- <% try{ %>
		<% for(Scrap s : slist){ %>
			
		<div id = "myscrap_content">
				
		</div>
		
		
		<% } %>
		<% } catch(NullPointerException e) {%>
			<div>스크랩한 게시물이 없습니다.</div>
		<% } %>
		</div> --%>
			
			<div id = "myscrap_content">
				
			</div>		
		</div>

</body>
</html>