<%@page import="com.kh.board.model.vo.Reply"%>
<%@page import="com.kh.common.model.vo.Attachment"%>
<%@page import="com.kh.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Board b = (Board) request.getAttribute("b");
Attachment at = (Attachment) request.getAttribute("at");
int boardType = (int) request.getAttribute("boardType");
int uno = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
ArrayList<Reply> list = (ArrayList<Reply>) request.getAttribute("list");
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
	width: 90%;
	margin: auto;
	height: 90%;
	display: flex;
	align-items: center;
}

/* #reply-area>*{
	width: 80%;
	margin: auto;
	height: 100%;
} */
#lock_btn {
	background-color: rgb(244, 247, 247);
	border-style: none;
	margin-left: 10px;
	width: 50px;
	height: 50px;
}

#lock_btn:hover {
	border-radius: 50%;
	background-color: grey;
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
	border-radius: 50%;
}

#mo_reply_list {
	width: 100%;
	height: 45px;
	margin-bottom: 5px;
	margin-left: 10px;
	position: relative;
	/* background-color: antiquewhite; */
}

.mo_reply_wrap {
	width: 100%;
	max-height: 300px;
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
	position: relative;
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
	width: 15%;
	padding-left: 2%;
}

.mo_reply_profileImg {
	width: 65px;
	height: 65px;
	border-radius: 100%;
	overflow: hidden;
}

.mo_reply_profileImg>img {
	border-radius: 100%;
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.mo_reply_text {
	width: 80%;
	word-break: break-all;
	overflow-y: scroll;
	position: absolute;
	top: 0;
	left: 100px;
	/* background-color: aqua; */
}

.mo_reply_text::-webkit-scrollbar {
	display: none;
}

.mo_reply_content2>div {
	float: left;
	height: 100%;
}

.mo_reply_id {
	width: 65px;
	text-align: center;
	font-size: 15px;
	font-weight: 600;
	height: 30px;
}

.mo_reply_date {
	width: 97%;
	text-align: right;
	font-size: smaller;
	color: grey;
}

.mo_reply {
	width: 100%;
	height: 100px;
	padding-top: 5px;
}

#mo_writer_profile {
	width: 60px;
	height: 100%;
	border-radius: 100%;
}

#mo_writer_profile>img {
	width: 100%;
	height: 100%;
	border-radius: 100%;
	object-fit: cover;
}

div {
	/*  border: 1px solid red; */
	
}

#board_content {
	width: 80%;
	min-width: 360px;
	min-height: 580px;
	border: 1px solid rgb(224, 224, 224);
	border-radius: 10px;
	margin: auto;
}

#board_content>div {
	width: 100%;
}

#boardTitle {
	height: 50px;
	padding: 0 10px 0 10px;
	margin-top: 10px;
}

#boardProfile {
	height: 60px;
	display: flex;
	align-items: center;
	padding: 0 10px 0 10px;
}

#boardProfile>div {
	float: left;
}

#boardProfile p {
	padding: 0;
	margin: 0;
}

#boardContent {
	min-height: 200px;
	padding: 0 10px 0 10px;
}

#boardContent img {
	display: block;
	margin: auto;
	max-width: 700px;
	object-fit: cover;
}

#boardReplyIcon {
	height: 60px;
	border-bottom: 1px solid rgb(224, 224, 224);
	border-top: 1px solid rgb(224, 224, 224);
	display: flex;
	align-items: center;
	background-color: rgb(244, 247, 247);
}

#boardReplyList {
	max-height: 300px;
	min-height: 10px;
}

#boardReplyWrite {
	height: 80px;
	background-color: rgb(244, 247, 247);
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
}

#mo_reply_textarea {
	border: 1px solid rgb(224, 224, 224);
}
</style>
</head>
<body>
	<%@ include file="/views/board/boardFrame.jsp"%>
	<!-- 자유게시판 상세보기-->
	<div id="board_area">
		<div id="album_header">
			<div id="album_area">
				<%
					if (boardType == 4) {
				%>
				<div id="album_title">자유게시판</div>
				<%
					} else {
				%>
				<div id="album_title">상담게시판</div>
				<%
					}
				%>
				<%
					if (loginUser != null) {
				%>
				<div id="album_button">
					<a style="color: black;"
						href="<%=contextPath%>/insert.fr?boardType=<%=boardType%>">
						<button class="button_UI button--winona" data-text="글 등록">
							<span>글 등록</span>
						</button>

					</a>
				</div>
				<%
					}
				%>
			</div>
			<div id="album_hr">
				<hr>
			</div>
		</div>

		<div id="board_content">
			<div id="boardTitle">
				<h1><%=b.getBoardTitle()%></h1>
				<%
					if (loginUser != null && loginUser.getUserId().equals(b.getUserId())) {
				%>
				<div class="dropdown" style="float: right; margin-top: -9%;">
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

				<script>
					$("#deleteBoard").click(function(){
						if(!confirm("정말 삭제하시겠습니까?")){
							return;
						}
						
						location.href = "<%=contextPath%>/delete.fr?bno=<%=b.getBoardNo()%>&boardType=<%=b.getBoardType()%>"
					});
											
				</script>
			</div>

			<div id="boardProfile">
				<div id="mo_writer_profile">
					<img
						src="<%=contextPath + loginUser.getFilePath() + loginUser.getChangeName()%>"
						alt=""
						onerror="this.src='<%=contextPath%>/resources/image/noImage.png'">
				</div>
				<div style="padding-left: 10px; height: 50px;">
					<p style="font-size: 17px;"><%=b.getUserId()%></p>
					<p style="font-size: 13px; color: grey;"><%=b.getcDate()%></p>

				</div>

			</div>
			<div id="boardContent">
				<hr><%=b.getBoardContent()%></div>
			<div id="boardReplyIcon">
				<div id="mo_reply_list">
					<ul id="mo_icon">
						<li><div class="heart" onclick="likeClick('<%=uno%>');"></div></li>
						<li class="like" onclick="likeClick('<%=uno%>');"><i
							class="bi"></i>좋아요 <span id="like_count">0</span>개</li>

						<li class="chat"><i class="bi bi-chat-quote"></i>댓글 <span
							id="chat_count">0</span>개</li>
						<li class="scrap" style="padding-right: 15px;"><i
							class="bi bi-star" style="padding-right: 10px;"></i>스크랩</li>
					</ul>
				</div>

			</div>

			<div id="boardReplyList">

				<div class="mo_reply_wrap" style="overflow-y: scroll;">
					<div class="mo_reply">
						<%
							if (list.size() != 0) {
						%>
						<%
							for (int i = 0; i < list.size(); i++) {
						%>
						<div class="mo_reply_content">
							<%
								if (loginUser.getUserId().equals(list.get(i).getReplyWriter())) {
							%>

							<div class="dropdown" style="float: right; margin-top: -4%;">
								<button class="btn btn-secondary" type="button"
									id="dropdownMenuButton" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false">

									<img id="alarmIcon"
										src="<%=contextPath%>/resources/image/icons8-메뉴-2-48.png">
								</button>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									<a class="dropdown-item deleteReply"
										data-rno='<%=list.get(i).getReplyNo()%>'>삭제</a>
								</div>
							</div>


							<%
								}
							%>

							<div class="mo_reply_profile">
								<div class="mo_reply_profileImg">
									<img
										src="<%=contextPath + loginUser.getFilePath() + loginUser.getChangeName()%>"
										alt=""
										onerror="this.src='<%=contextPath%>/resources/image/noImage.png'">
								</div>
								<div class="mo_reply_id"><%=list.get(i).getReplyWriter()%></div>
							</div>
							<div class="mo_reply_text"><%=list.get(i).getReplyContent()%></div>
						</div>

						<div class="mo_reply_content2">

							<div class="mo_reply_date"><%=list.get(i).getCreateDate()%></div>
						</div>


						<%
							}
						%>
						<%
							} else {
						%>
						<div
							style="text-align: center; padding-top: 30px; font-size: 20px; font-weight: 600; color: grey;">
							조회된 댓글이 없습니다.</div>

						<%
							}
						%>

					</div>
				</div>

			</div>
			<div id="boardReplyWrite">
				<hr style="margin: 5px;">
				<div id="reply-area">
					<div style="width: 70%; height: 85%">
						<textarea id="mo_reply_textarea" placeholder="댓글을 입력하여 주세요."
							style="resize: none; width: 100%; height: 100%;"></textarea>
					</div>
					<div style="width: 12%">
						<button id="lock_btn">
							<img id="lock_img"
								src="<%=contextPath%>/resources/image/icons8-잠금-해제-66.png">
						</button>
					</div>

					<div id="replyInsert" style="width: 18%">
						<button id="insertReply" class="button_UI button--winona"
							data-text="등록" style="width: 80px;">
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
			
	<%-- 		 $.ajax({
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
        	}); --%>
        	
         	$.ajax({
   				url : "<%=contextPath%>/rCount.bo",
   				data : { bno : <%=b.getBoardNo()%>},
   				success : function(list){
   					 $("#chat_count").html(list);
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
 							$("#like_count").html(ls[1]);
 							
 					}else{
 						 $('.heart').css({  backgroundPosition: '-2800px 0', transition:' background 0s steps(28)'})
 						 $("#like_count").html(ls[1]);
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
			   					 $("#chat_count").html(list);
			   				},
			   				error: function(){
			   					console.log("게시글 목록조회 실패")
			   				}
			        	}); 

					} else {
						alert("댓글작성에 실패했습니다");

					}
				},
				error : function() {
					console.log("댓글 작성 실패")
				}
			});
		});
           
           $(".deleteReply").click(function(){
				let rno = $(this).data('rno'); 
				$.ajax({
	   				url : "<%=contextPath%>/rDelete.bo",
	   				data : { rno},
	   				type : "get",
	   				success : function(result){
	   					if(result>0){
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
			   					 $("#chat_count").html(list);
			   				},
			   				error: function(){
			   					console.log("게시글 목록조회 실패")
			   				}
			        	}); 
	   					}else {
							alert("댓글삭제에 실패했습니다");

						}
	   					
	   				},
	   				error: function(){
	   					console.log("게시글 목록조회 실패")
	   				}
	        		});
			});
	
       
	</script>
</body>
</html>