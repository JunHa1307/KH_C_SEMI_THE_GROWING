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
<title>The Growing</title>
<link rel="shortcut icon" type="image/svg" href="<%= request.getContextPath() %>/favicon.svg"/>
<style>
	.myScWrap{
		/* display: inline-flex; */
		float: left;
		display: inline-block;
	}
	#myscrap_content{
		border: 2px solid #ffe4af;
		height: 200px;
		margin: 10px 20px;
		padding: 100px 0;
		background-color: #fcffb0;
		box-shadow: 0 3px 10px rgba(0,0,0,0.25);
		width: 250px;
	}
 	.disWrap{
		display: inline-block;
	} 
	
	
	#myscrap_content:hover{
		background-color: #fdfa87;
	}

	.scrapTitle{
		/* margin: 10px 0px;  */
		/* height: 40px;*/
		/* background-color: white; */
		font-weight: 700;
		font-size: 25px;
		position:absolute;
		top: 10%;
		left: 20px;
	}
	.conSt{
		/* background-color: white; */
		display: inline-block;
		border-radius: 10px;
		margin-bottom: 10px;
		text-decoration: underline;
	}
	.scrapDelete{
		margin-left: 10px;
		margin-right: 50px;
		border: none;
		border-radius: 20px;
		height: 40px; 
	}
	.scrapDelete:hover{
		background-color:  #D3D3D3;
	}
	
	/* .scrollDiv::-webkit-scrollbar {
          width: 5px;
	}
	.scrollDiv::-webkit-scrollbar-track {
          background-color: transparent;
    }
    .scrollDiv::-webkit-scrollbar-thumb {
          border-radius: 5px;
          background-color: #D3D3D3;
    } */
    
    #bTitle{
    	margin-bottom: 10px;
    	position: absolute;
    	top: 60px;
    	left: 20px;
    }
    .disWrap{
    	cursor: pointer;
    }
    

/*포스트잇 css*/
div.rgyPostIt {
    position: relative;
    display: inline-block;
    padding: 20px 45px 20px 15px;
    margin: 5px 0;
    border: 1px solid #f8f861;
    border-left: 30px solid #f8f861;
    border-bottom-right-radius: 60px 10px;
    font-family: 'Nanum Pen Script';
    font-size: 20px;
    color: #555;
    word-break: break-all;
    background: #ffff88; /* Old browsers */
    background: -moz-linear-gradient(-45deg, #ffff88 81%, #ffff88 82%, #ffff88 82%, #ffffc6 100%); /* FF3.6+ */
    background: -webkit-gradient(linear, left top, right bottom, color-stop(81%, #ffff88), color-stop(82%, #ffff88), color-stop(82%, #ffff88), color-stop(100%, #ffffc6)); /* Chrome,Safari4+ */
    background: -webkit-linear-gradient(-45deg, #ffff88 81%, #ffff88 82%, #ffff88 82%, #ffffc6 100%); /* Chrome10+,Safari5.1+ */
    background: -o-linear-gradient(-45deg, #ffff88 81%, #ffff88 82%, #ffff88 82%, #ffffc6 100%); /* Opera 11.10+ */
    background: -ms-linear-gradient(-45deg, #ffff88 81%, #ffff88 82%, #ffff88 82%, #ffffc6 100%); /* IE10+ */
    background: linear-gradient(135deg, #ffff88 81%, #ffff88 82%, #ffff88 82%, #ffffc6 100%); /* W3C */
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffff88', endColorstr='#ffffc6', GradientType=1); /* IE6-9 fallback on horizontal gradient */
    transition: all 0.2s;
    -webkit-transition: all 0.2s;
}

div.rgyPostIt::after {
    content: " ";
    position: absolute;
    z-index: -1;
    right: 0;
    bottom: 35px;
    width: 150px;
    height: 30px;
    background-color: rgba(0, 0, 0, 0);
    box-shadow: 2px 35px 5px rgba(0, 0, 0, 0.4);
    -webkit-box-shadow: 2px 35px 5px rgba(0, 0, 0, 0.4);
    transform: matrix(-1, -0.1, 0, 1, 0, 0);
    -webkit-transform: matrix(-1, -0.1, 0, 1, 0, 0);
    -moz-transform: matrix(-1, -0.1, 0, 1, 0, 0);
    -ms-transform: matrix(-1, -0.1, 0, 1, 0, 0);
    -o-transform: matrix(-1, -0.1, 0, 1, 0, 0);
    transition: all 0.2s;
    -webkit-transition: all 0.2s;
}

div.rgyPostIt:hover {
    border-bottom-right-radius: 75px 30px;
}

div.rgyPostIt:hover::after {
    box-shadow: 2px 37px 7px rgba(0, 0, 0, 0.37);
    -webkit-box-shadow: 2px 37px 7px rgba(0, 0, 0, 0.37);
}

div.rgyPostIt > p {
    padding: 5px 0 !important;
}

div.rgyPostIt > p::before {
    content:"\f198";
    margin-right: 7px;
    font-family: "FontAwesome";
    font-weight: normal;
    font-size: 20px;
    vertical-align: middle;
}

div.rgyPostIt > p > a {
    color: #555;
}
/* 포스트잇 css 끝 */

.createDt{
	margin-top: 40px;
	margin-left: 20px;
}

</style>

<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Naum+Pen+Script&display=swap" rel="stylesheet">
<script src="<%= request.getContextPath() %>/resources/js/alert.js"></script>
<!--  alret 창 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

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
		<div class="myclass_content myScWrap" style="width: 100%; height: 360px;">
			<% for(Board b : boardArr ){ %>

			<input type="hidden" value="<%= b.getBoardNo() %>">
				<div class="disWrap" data-aos="fade-up" data-aos-duration="1000">
					<div id = "myscrap_content" class="rgyPostIt" onclick="goScrapBoard('<%= b.getBoardType() %>', '<%= b.getBoardNo() %>');">
						<% if( b.getBoardType() == 3 ) { %>
							<div class="scrapTitle">앨범</div>
						<% } else if( b.getBoardType() == 2) {%>
							<div class="scrapTitle">알림장</div>
						<% } else if( b.getBoardType() == 4) { %>
							<div class="scrapTitle">자유 게시판</div>
						<% } else if( b.getBoardType() == 5)  { %>
							<div class="scrapTitle">상담 게시판</div>
						<% } %>
						<div id="bTitle"> 제목 &nbsp;<div class="conSt"><%= b.getBoardTitle() %></div></div>
						<%-- <div>내용<div style=""><%= b.getBoardContent() %></div></div> --%>
						<div class="createDt">생성 날짜 &nbsp;<div class="conSt"><%= b.getCreateDate() %></div></div>
						
					</div>
					<br>
					<div style="display:inline-block; margin-left: 100px; margin-top: 8px;">스크랩</div>
					<button id="<%= loginUser.getUserNo() %>" type="button" class="scrapDelete" onclick="scrapDelete('<%= b.getBoardNo() %>');">취소</button>
				
				</div>
     		<% }  %>
		</div>
			
	</div>
	
	<script>
	 $("#myScrap").css("fontWeight", "700");
     $("#myScrap").children().css("background", "rgb(237, 239, 243)");
	
	
		function goScrapBoard(boardType, bno){
			if(boardType==3){
				location.href="<%= contextPath %>/list.al?bno="+bno;
			}else if(boardType==2){
				location.href="<%= contextPath %>/movenotice.bo#noDiV"+bno;
			}else if(boardType==4){
				location.href="<%= contextPath %>/detail.fr?bno="+bno+"&boardType="+boardType;
			}else if(boardType==5){
				location.href="<%= contextPath %>/detail.fr?bno="+bno+"&boardType="+boardType;
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
	 					/* alertMsg('스크랩이 취소되었습니다.'); */
	 					window.location.reload();
	 					
	 			},
	 			error: function(){
	 				error("스크랩 취소 실패");
	 			}
	 			
	 		});
	 	
	 	
	 	
	 	};
	</script>

</body>
</html>