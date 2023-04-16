<%@page import="com.kh.board.model.vo.Board"%>
<%@page import="com.kh.board.model.vo.Scrap, java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ArrayList<Board> boardArr = (ArrayList<Board>) request.getAttribute("boardArr");
	Member loginUser = (Member) request.getSession().getAttribute("loginUser");
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
		padding: 100px 0;
		background-color: #fcffb0;
		box-shadow: 0 3px 10px rgba(0,0,0,0.25);
	}
	#myscrap_content:hover{
		background-color: #fdfa87;
	}
	.divStyle{
		text-align: center;
		
	}
	.scrapTitle{
		margin: 10px 0px; 
		height: 40px;
		background-color: white;
		font-weight: 700;
		font-size: 25px;
	}
	.conSt{
		background-color: white;
	}
	.scrapDelete{
		float: right;
		margin-right: 30px;
		border: none;
		border-radius: 20px;
		height: 40px; 
	}
	.scrapDelete:hover{
		background-color:  #D3D3D3;
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
							<div class="divStyle scrapTitle">앨범</div>
						<% } else if( b.getBoardType() == 2) {%>
							<div class="divStyle scrapTitle">알림장</div>
						<% } else if( b.getBoardType() == 3) { %>
							<div class="divStyle scrapTitle">자유 게시판</div>
						<% } else if( b.getBoardType() == 4)  { %>
							<div class="divStyle scrapTitle">상담 게시판</div>
						<% } %>
						<div id="bTitle" class="divStyle"> 제목 <div class="conSt"><%= b.getBoardTitle() %></div></div>
						
						<div id="" class="divStyle">생성 날짜<div class="conSt"><%= b.getCreateDate() %></div></div>
						
					</div>
					<div style="display:inline-block; margin-left: 60px; margin-top: 8px;">게시물 No. <%= b.getBoardNo() %> 스크랩</div>
					<button id="<%= loginUser.getUserNo() %>" type="button" class="scrapDelete" onclick="scrapDelete('<%= b.getBoardNo() %>');">취소</button>
				</form>
     		<% }  %>
		</div>
			
	</div>
	
	<script>
		function goScrapBoard(boardType, bno){
			if(boardType==1){
				location.href="<%= contextPath %>/list.al?bno="+bno;
			}else if(boardType==2){
				location.href="<%= contextPath %>/movenotice.bo#noDiV"+bno;
			}else if(boardType==4){
				location.href="<%= contextPath %>/detail.fr?bno="+bno+"&boardType=4"+boardType;
			}else if(boardType==5){
				location.href="<%= contextPath %>/detail.fr?bno="+bno+"&boardType=5"+boardType;
			}
			
		}
	</script>

	<script>
		function scrapDelete(bno){
	 		
			let uno =  $(".scrapDelete").attr("id");
	 		
	 		$.ajax({
	 			url: "<%= contextPath %>/scrapDelete.bo",
	 			type: "post",
	 			data: {bno, uno},
	 			
	 			success: function(result){
	 					console.log("스크랩 취소");
	 					alert('스크랩이 취소되었습니다.');
	 					window.location.reload();
	 					
	 			},
	 			error: function(){
	 				console.log("스크랩 취소 실패");
	 			}
	 			
	 		});
	 	
	 	
	 	
	 	};
	</script>
</body>
</html>