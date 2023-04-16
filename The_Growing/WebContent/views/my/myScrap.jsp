<%@page import="com.kh.board.model.vo.Board"%>
<%@page import="com.kh.board.model.vo.Scrap, java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ArrayList<Board> boardArr = (ArrayList<Board>) request.getAttribute("boardArr");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.myScWrap{
		display: inline-flex;
	}
	#myscrap_content{
		border: 2px solid #ffe4af;
		width: 250px;
		height: 300px;
		border-radius: 20px;
		margin: 10px 20px;
		
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
		<div class="myScWrap" style="width: 100%; height: 100%;">
			<% for(Board b : boardArr ){ %>
     			<form>
					<input type="hidden" value="<%= b.getBoardNo() %>">
				
					<div id = "myscrap_content" onclick="goScrapBoard('<%= b.getBoardType() %>', '<%= b.getBoardNo() %>');">
						<% if( b.getBoardType() == 1 ) { %>
							<div>앨범</div>
						<% } else if( b.getBoardType() == 2) {%>
							<div>알림장</div>
						<% } else if( b.getBoardType() == 3) { %>
							<div>자유 게시판</div>
						<% } else { %>
							<div>상담 게시판</div>
						<% } %>
						<div id="bTitle"> 제목 : <%= b.getBoardTitle() %></div>
						
						<div>생성 날짜 : <%= b.getCreateDate() %></div>
					</div>
			
				</form>
     		<% }  %>
		</div>
			
	</div>
	
	<script>
		function goScrapBoard(boardType, bno){
			if(boardType==1){
				location.href="<%= contextPath %>/movenotice.bo#noDiV"+bno;
			}else if(boardType==2){
				location.href="<%= contextPath %>/list.al?bno="+bno;
			}else if(boardType==3){
				
			}else{
				
			}
			location.href="<%= contextPath %>/goscrap.bo?bno="+bno;
		}
	</script>

</body>
</html>