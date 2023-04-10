<%@page import="com.kh.board.model.vo.Reply"%>
<%@page import="com.kh.common.model.vo.Attachment"%>
<%@page import="com.kh.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Board b = (Board) request.getAttribute("b");
	Attachment at = (Attachment) request.getAttribute("at");
	
	int uno = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 자유게시판 상세보기 css */
        #board_area{
            width: 80%;
        }
       	
       	#reply-area {
       		width: 70%;
       		margin: 0% 0% 0% 12%;
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
            width: 40px; height: 40px;
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
            width: 50px; height: 50px; border-radius: 50%; float: left;
        }

        #lock_img {
            width: 30px; height: 30px; border-radius: 50%;  
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
	height: 300px;
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
	
	margin : 0;
}
/* 좋아요 / 댓글 / 스크랩 */
#mo_reply_list>ul {
	padding: 0;
	margin:0;
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
	top:55%;
	left:3%;
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
	text-align:center;
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
	height: 100px;
	padding-top: 5px;
}

</style>
</head>
<body>
	<%@ include file="/views/board/boardFrame.jsp" %>
	 <!-- 자유게시판 상세보기-->
                <div id="board_area">
                
                <%if(b.getBoardType() == 4) {%>
                    <h1 align="center">자유 게시판</h1>
				<%}else{ %>
					 <h1 align="center">상담 게시판</h1>
				<%} %>
                
                    <table class="list-table"  border="5">
	               		<tbody>
	                        <tr >
	                            <th>
	                            	<h1><%=b.getBoardTitle() %></h1>
	                                  <% if(loginUser != null && loginUser.getUserId().equals( b.getUserId())) {%>
	                                  <div class="dropdown" style="float: right; margin-top: -11%;">
	                                    <button 
	                                        class="btn btn-secondary" 
	                                        type="button" 
	                                        id="dropdownMenuButton" 
	                                        data-toggle="dropdown" 
	                                        aria-haspopup="true" 
	                                        aria-expanded="false">
	                                        
	                                        <img id="alarmIcon" src="<%=contextPath %>/resources/image/icons8-메뉴-2-48.png">
	                                    </button>
	                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
	                                      <a class="dropdown-item" href="<%=contextPath %>/update.fr?bno=<%=b.getBoardNo() %>&boardType=<%=b.getBoardType()%>">수정</a>
	                                      <a class="dropdown-item" id="deleteBoard">삭제</a>
	                                    </div>
	                                  </div>
	                                  <%}%>
	                                  <script>
											$("#deleteBoard").click(function(){
												if(!confirm("정말 삭제하시겠습니까?")){
													return;
												}
												
												location.href = "<%= contextPath %>/delete.fr?bno=<%= b.getBoardNo() %>&boardType=<%=b.getBoardType()%>"
											});
												
												
											
												
										</script>	
	                           
	                            </th>					        
	                        </tr>
	                	
	                        <tr>
	                           <th height="50">
	                            <img id="profile_img" src="<%=contextPath %>/resources/image/bono.jpg">
	                            <%=b.getUserId() %> <br> <%=b.getCreateDate() %> </th>
	                        </tr>
	                        <tr>
	                            <th height="200">
	                               
	                                	 <%=b.getBoardContent() %>
	                                
	                                <hr>
	                                 <%--    <button id="down_btn">
	                                        <img id="down_img" src="<%=contextPath %>/resources/image/다운로드.png">
	                                    </button>
	                                    
	                                    <button id="thumb_btn">   
	                                        <img id="thumb_img" src="<%=contextPath %>/resources/image/icons8-엄지-척-64.png">
	                                    </button>
	                                   
	                                    <button id="star_btn">    
	                                        <img id="star_img" src="<%=contextPath %>/resources/image/icons8-별-48.png">
	                                    </button> --%>
	                                    			<!-- 댓글란 -->

			<div class="mo_reply_wrap" style="overflow-y: scroll;">
				<%--     <%if(rlist.isEmpty()) {%>
            <div class="mo_reply">
              <div class="mo_reply_content">
                <div class="mo_reply_profile">
                </div>
                <div class="mo_reply_text">조회된 댓글이 없습니다 </div>
              </div>
              <div class="mo_reply_content2">
              <!--   <div class="mo_reply_id">하예솔 학생</div>
                <div class="mo_reply_date" >23.03.23 15:27</div> -->
              </div>
            </div>
            <%}else{ %> --%>
				<%--    	<%for(Reply r : rlist){ %>
            <div class="mo_reply">
              <div class="mo_reply_content">
                <div class="mo_reply_profile">
                  <div class="mo_reply_profileImg"><img src="/resources/image/bono.jpg"></div>
                </div>
                <div class="mo_reply_text"><%=r.getReplyContent()%></div>
              </div>
              <div class="mo_reply_content2">
                <div class="mo_reply_id"><%=r.getReplyWriter() %></div>
                <div class="mo_reply_date" ><%=r.getCreateDate() %></div>
              </div>
            </div>
            	<%} %> --%>

				<%-- <%} %>   --%>


				<div class="mo_reply"></div>
			</div>
			<!--    <div class="mo_reply">
              <div class="mo_reply_content">
                <div class="mo_reply_profile">
                  <div class="mo_reply_profileImg"><img src="/resources/image/bono.jpg"></div>
                </div>
                <div class="mo_reply_text">fff 늘 수고가 많으세요^^</div>
              </div>
              <div class="mo_reply_content2">
                <div class="mo_reply_id">박연진 부모</div>
                <div class="mo_reply_date" >23.03.23 16:47</div>
              </div>
            </div>
            <div class="mo_reply">
              <div class="mo_reply_content">
                <div class="mo_reply_profile">
                  <div class="mo_reply_profileImg"><img src="/resources/image/bono.jpg"></div>
                </div>
                <div class="mo_reply_text">ddd 늘 수고가 많으세요^^</div>
              </div>
              <div class="mo_reply_content2">
                <div class="mo_reply_id">박연진 부모</div>
                <div class="mo_reply_date" >23.03.23 16:47</div>
              </div>
            </div>
          </div> -->


			<div id="mo_reply_write">
				<div class="mo_reply_hr">
					<hr>
				</div>
				<div id="mo_reply_list">
					<ul id="mo_icon">
						<li><div class="heart" onclick="likeClick('<%=uno %>');"></div></li>
						<li class="like" onclick="likeClick('<%=uno %>');"><i class="bi"></i></li>
						<li class="chat"><i class="bi bi-chat-quote"></i></li>
						<li class="scrap" style="padding-right: 15px;"><i class="bi bi-star"
							style="padding-right: 10px;"></i>스크랩</li>
					</ul>

				</div>
	                            </th>
	                        </tr>
                       
	                    </table>

					 <div id="reply-area">
							<table class="list-table" border="5">
							<%-- 	<thead>
									 <% for(Reply re : list) { %> 
									<tr>
										<th height="50">
											<div id="reply_info"
												style="width: 150px; height: 50px; border-style: none;">
												<img id="profile_img"
													src="<%=contextPath %>/resources/image/bono.jpg">
												<%=re.getUserId() %> 
												 <br>
												
												 <%=re.getCreateDate() %> 
											</div>
											<% if(loginUser != null && loginUser.getUserId().equals( re.getUserId())) {%>
											<div id="menu" class="dropdown"
												style="float: right; margin: -7% 0% 0% 10%;">
												<button class="btn btn-secondary" type="button"
													id="dropdownMenuButton" data-toggle="dropdown"
													aria-haspopup="true" aria-expanded="false">
					
													<img id="alarmIcon"
														src="<%=contextPath %>/resources/image/icons8-메뉴-2-48.png" />
												</button>
												<div id="menu" class="dropdown-menu"
													aria-labelledby="dropdownMenuButton">
													<a class="dropdown-item" href="#">수정</a> 
												    <a class="dropdown-item" onclick="deleteReply();">삭제</a>
												</div>
											</div>
											<% } %>
											<script>
											function deleteReply(){
												if(!confirm("정말 삭제하시겠습니까?")){
													return;
												}
												
												location.href = "<%= contextPath %>/rdelete.fr?rno=<%= re.getReplyNo() %>";
											}
										</script>	
											<div id="reply_Content" style="width: 80%;">
												 <%=re.getReplyContent() %> 
											</div>
										</th>
									</tr>
									<% } %>
								</thead> --%>
									<tbody>
										<tr>
											<th><input style="width: 530px; height: 50px;"
												id="replyContent" type="text" placeholder="댓글을 입력하세요." required>
						
												<button id="lock_btn">
													<img id="lock_img"
														src="<%=contextPath %>/resources/image/icons8-잠금-해제-66.png">
												</button>
						
												<div id="box">
													<button id="insertReply" class="button_UI button--winona" data-text="등록"
														style="width: 80px; margin: -7% 0% 0% 88%;">
														<span>등록</span>
													</button>
												</div>
											</th>
										</tr>
									</tbody>														
							</table>					
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
   					content : $("#replyContent").val(), 
   					bno : <%=b.getBoardNo() %>
   				},
   				success : function(result){
   				 
   					if(result > 0){
   					
   						$("#replyContent").val("");
   						
   					}else{
   						alert("댓글작성에 실패했습니다");
   						
   					}
   				}, 
   				error : function(){
   					console.log("댓글 작성 실패")
   				} 
   			});
		});
		

		
		
	</script> 
	</body>
</html>