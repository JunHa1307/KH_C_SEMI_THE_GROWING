<%@page import="com.kh.board.model.vo.Reply"%>
<%@page import="com.kh.common.model.vo.Attachment"%>
<%@page import="com.kh.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Board b = (Board) request.getAttribute("b");
Attachment at = (Attachment) request.getAttribute("at");
int boardType = (int) request.getSession().getAttribute("boardType");
int uno = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 자유게시판 상세보기 css */
#board_area {
	width: 100%;
}

#reply-area {
	width: 80%;
	margin: auto;
	height: 100%;
}

#reply-area>di {
	width: 80%;
	margin: auto;
	height: 100%;
}

#list_search {
	width: 190px;
	height: 15%;
	margin: -1% 0% 0% 64%;
}

.list-table {
	margin: auto;
	min-width: 700px;
	max-width: 100%;
	border-collapse: separate;
	border-spacing: 15px 5px;
	border: 5px solid #cff0cc;
	border-radius: 5%;
}

#down_img, #thumb_img, #start_img {
	width: 40px;
	height: 40px;
}

#down_btn, #thumb_btn, #star_btn, #lock_btn {
	background-color: white;
	border-style: none;
}

#down_btn:hover, #thumb_btn:hover, #star_btn:hover, #lock_btn:hover {
	border-radius: 50%;
	background-color: #cff0cc;
}

#profile_img {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	float: left;
}

#lock_img {
	width: 40px;
	height: 40px;
	margin-bottom : 10px;
	border-radius: 50%;
}

#mo_reply_list {
	width: 100%;
	height: 45px;
	margin-bottom: 5px;
	position: relative;
	/* background-color: antiquewhite; */
}

.mo_reply_wrap {
	width: 100%;
	height: 200px;
	/* background-color: antiquewhite; */
	-ms-overflow-style: none;
}

.mo_reply_wrap::-webkit-scrollbar {
	display: none;
}

.mo_reply_hr {
	height: 5px;
	width: 100%;
	/* background-color: aqua; */
}

hr {
	margin: 0;
}
/* 좋아요 / 댓글 / 스크랩 */
#mo_reply_list>ul {
	padding: 0;
	margin: 0;
}

#mo_reply_list>ul>li {
	list-style-type: none;
	float: left;
	width: 115px;
	font-weight: 600;
	text-align: right;
	cursor: pointer;
}

.bi {
	font-size: 30px;
	cursor: pointer;
	outline: none;
}

.bi-chat-quote {
	color: rgb(165, 227, 206);
	padding-right: 10px;
}
/* 좋아요 하트 */
.heart {
	width: 100px;
	height: 100px;
	transform: translate(-50%, -50%);
	background: url("resources/image/heart.png") no-repeat;
	background-position: 0 0;
	cursor: pointer;
	animation: fave-heart 1s steps(28);
	top: 55%;
	left: 3%;
	position: absolute;
}

.mo_reply_content {
	width: 100%;
	height: 69%;
}

.mo_reply_content>div {
	float: left;
	height: 100%;
}

.mo_reply_content2 {
	width: 100%;
	height: 33px;
}

.mo_reply_profile {
	width: 20%;
	padding-left: 2%;
}

.mo_reply_profileImg {
	width: 60%;
	height: 100%;
	border-radius: 100%;
	overflow: hidden;
}

.mo_reply_profileImg>img {
	border-radius: 100%;
	width: 100%;
	height: 100%;
}

.mo_reply_text {
	width: 70%;
	/* background-color: aqua; */
}

.mo_reply_content2>div {
	float: left;
	height: 100%;
}

.mo_reply_id {
	width: 20%;
	padding-left: 3%;
	padding-right: 8.5%;
	text-align: center;
	font-size: smaller;
	font-weight: 600;
}

.mo_reply_date {
	width: 77%;
	text-align: right;
	font-size: smaller;
}

.mo_reply {
	width: 100%;
	min-height: 100px;
	padding-top: 5px;
}

#mo_writer_profile {
	width: 60px;
	height:60px;
	border-radius: 50%;
}

#mo_writer_profile>img {
	width: 100%;
	height: 100%;
}

#b>* {
	float: left;
	height: 100%;
}

div {
	/*  border: 1px solid red; */
} 

#board_content {
	width: 100%;
	min-height: 600px;
	border:1px solid black;
	border-radius: 10px;
	padding : 10px;

}

#board_content>div {
	width: 100%;
}

#a {
	height: 10%;
	
}

#b {
	height: 60px;
	
}

#c {
	height: 30%;
	
}
#c img{
	display:block;
	margin: auto;
	cursor: pointer;
}


#d {
	height: 10%;
}

#e {
	height: 200px;
	
}

#f {
	height:80px;
}
#mo_reply_textarea{
	margin-top:10px;
}


</style>
</head>
<body>
	<%@ include file="/views/board/boardFrame.jsp"%>
	<!-- 자유게시판 상세보기-->
	<div id="board_area">
		<div id="album_header">
			<div id="album_area">
				<%if (boardType == 4) {%>
				<div id="album_title">자유게시판</div>
				<%} else {%>
				<div id="album_title">상담게시판</div>
				<%}%>
				<%if (loginUser != null) {%>
				<div id="album_button">
					<a style="color: black;"
						href="<%=contextPath%>/insert.fr?boardType=<%=boardType%>">
						<button class="button_UI button--winona" data-text="글 등록">
							<span>글 등록</span>
						</button>

					</a>
				</div>
				<%}%>
			</div>
			<div id="album_hr">
				<hr />
			</div>
		</div>

		<div id="board_content">
			<div id="a">
				<h1><%=b.getBoardTitle()%></h1>
				<%if (loginUser != null && loginUser.getUserId().equals(b.getUserId())) {%>
				<div class="dropdown" style="float: right; margin-top: -7%;">
					<button class="btn btn-secondary" type="button"
						id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">

						<img id="alarmIcon"
							src="<%=contextPath%>/resources/image/icons8-메뉴-2-48.png">
					</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item"
							href="<%=contextPath%>/update.fr?bno=<%=b.getBoardNo()%>&boardType=<%=b.getBoardType()%>">수정</a>
						<a class="dropdown-item" id="deleteBoard">삭제</a>
					</div>
				</div>
				<%
					}
				%>
				<hr>
				<script>
					$("#deleteBoard").click(function(){
						if(!confirm("정말 삭제하시겠습니까?")){
							return;
						}
						
						location.href = "<%=contextPath%>/delete.fr?bno=<%=b.getBoardNo()%>&boardType=<%=b.getBoardType()%>"
					});
											
				</script>
			</div>

			<div id="b">
				<hr>
				<div id="mo_writer_profile">
					<img src="<%=b.getFilePath() + b.getChangeName()%>" alt=""
						onerror="this.src='resources/image/noImage.png'">
				</div>
				<div style="padding-left:10px; text-align:center;">
				<%=b.getUserId()%>
				<br>
				<%=b.getCreateDate()%>
				</div>
				
			</div>
			<div id="c"><hr><%=b.getBoardContent()%><hr></div>
			<div id="d">

				<div id="mo_reply_list">
					<ul id="mo_icon">
						<li><div class="heart" onclick="likeClick('<%=uno%>');"></div></li>
						<li class="like" onclick="likeClick('<%=uno%>');"><i
							class="bi"></i></li>
						<li class="chat"><i class="bi bi-chat-quote"></i></li>
						<li class="scrap" style="padding-right: 15px;"><i
							class="bi bi-star" style="padding-right: 10px;"></i>스크랩</li>
					</ul>
				</div>
				
			</div>
			<hr>
			<div id="e">
			
				<div class="mo_reply_wrap" style="overflow-y: scroll;">
					<div class="mo_reply"></div>
				</div>
		
			</div>
			<div id="f">
						<hr style="margin : 0">
				<div id="reply-area">
					<textarea id="mo_reply_textarea" 
							placeholder="댓글을 입력하여 주세요." style="resize: none; width:70%;"></textarea>
					<button id="lock_btn">
						<img id="lock_img"
							src="<%=contextPath%>/resources/image/icons8-잠금-해제-66.png">
					</button>

					<div id="box">
						<button id="insertReply" class="button_UI button--winona"
							data-text="등록" style="width: 80px; margin: -7% 0% 0% 88%;">
							<span>등록</span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	</div>
	</div>
	<script>
		$(function(){
		
			
			
			$.ajax({
   				url : "<%=contextPath%>/rlist.bo",
   				data : { bno :<%=b.getBoardNo()%>},
   				type : "get",
				dataType : "html", 
   				success : function(list){
   					 $(".mo_reply").html(list); 
   				},
   				error: function(){
   					console.log("게시글 목록조회 실패")
   				}
        	});
        	
         	$.ajax({
   				url : "<%=contextPath%>/rCount.bo",
   				data : { bno : <%=b.getBoardNo()%>},
   				success : function(list){
   					 $(".chat").html('<i class="bi bi-chat-quote"></i>댓글 '+list+'개</li>');
   				},
   				error: function(){
   					console.log("게시글 목록조회 실패")
   				}
        	}); 
         	 $.ajax({
 				url : "<%=contextPath%>/likeSelect.bo",
 				data : { bno : <%=b.getBoardNo()%> ,
 						 uno : <%=uno%>
 				},
 				success : function(list){
 					 let ls = list.split(",");
 					if(ls[0]==0){
 						  $('.heart').css({  backgroundPosition: '0', transition:' background 0s steps(28)'})
 							$(".like").html('<i class="bi"></i>좋아요  '+ls[1]+"개");
 							
 					}else{
 						 $('.heart').css({  backgroundPosition: '-2800px 0', transition:' background 0s steps(28)'})
 						 $(".like").html('<i class="bi"></i>좋아요  '+ls[1]+"개");
 					}
 					 
 				},
 				error: function(){
 					console.log("게시글 목록조회 실패")
 				}
     	});
         	  let j = 0;
              $('.scrap').on('click',function(){
                  if(j==0){
                      $('.bi-star').css({color : "orange", fontSize : "30px"});
                      j++;
                  }else if(j==1){
                      $('.bi-star').css('color','black');
                      j--;
                  }

              });

              $('.chat').on('click',function(){
                    $('#mo_reply_textarea').focus();
              });

		});
           	//좋아요 클릭 시 
              function likeClick(uno){
                
              	$.ajax({
      				url : "<%=contextPath%>/like.bo",
      				data : { bno : <%=b.getBoardNo()%> ,
						 uno : <%=uno%>
      						
      				},
      				
      				success : function(list){
      					 let ls = list.split(",");
      					if(ls[0]==0){
      						  $('.heart').css({  backgroundPosition: '0', transition:' background 0s steps(28)'})
      							$(".like").html('<i class="bi"></i> 좋아요  '+ls[1]+"개");
      							
      					}else{
      						 $('.heart').css({  backgroundPosition: '-2800px 0', transition:' background 1s steps(28)'})
      						 $(".like").html('<i class="bi"></i> 좋아요  '+ls[1]+"개");
      					}
      				
      					 
      					 
      					 
      				},
      				error: function(){
      					console.log("게시글 목록조회 실패")
      				}
          	});
           	};
      
           $("#insertReply").click(function(){
	    	let bno = $("#modal").attr("class"); 
   			$.ajax({
   				url : "<%=contextPath%>/rinsert.bo",
				data : {
					content : $("#mo_reply_textarea").val(),
					bno :<%=b.getBoardNo()%>},
				success : function(result) {

					if (result > 0) {

						$("#mo_reply_textarea").val("");
						$(".mo_reply").html(list); 

					} else {
						alert("댓글작성에 실패했습니다");

					}
				},
				error : function() {
					console.log("댓글 작성 실패")
				}
			});
		});
	</script>
</body>
</html>