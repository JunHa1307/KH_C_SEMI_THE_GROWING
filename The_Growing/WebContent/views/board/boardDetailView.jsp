<%@page import="com.kh.board.model.vo.Reply"%>
<%@page import="com.kh.common.model.vo.Attachment"%>
<%@page import="com.kh.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Board b = (Board) request.getAttribute("b");
	Attachment at = (Attachment) request.getAttribute("at");
	ArrayList<Reply> list = (ArrayList<Reply>) request.getAttribute("list");
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
</style>
</head>
<body>
	<%@ include file="/views/board/boardFrame.jsp" %>
	 <!-- 자유게시판 상세보기-->
                <div id="board_area">
                    <h1 align="center">자유게시판</h1>
                
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
	                                      <a class="dropdown-item" href="<%=contextPath %>/update.fr?bno=<%=b.getBoardNo() %>">수정</a>
	                                      <a class="dropdown-item" onclick="deleteBoard();">삭제</a>
	                                    </div>
	                                  </div>
	                                  <%}%>
	                                  <script>
											function deleteBoard(){
												if(!confirm("정말 삭제하시겠습니까?")){
													return;
												}
												
												location.href = "<%= contextPath %>/delete.fr?bno=<%= b.getBoardNo() %>";
											}
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
	                                
	                                <hr style="height: 10px;">
	                                    <button id="down_btn">
	                                        <img id="down_img" src="<%=contextPath %>/resources/image/다운로드.png">
	                                    </button>
	                                    
	                                    <button id="thumb_btn">   
	                                        <img id="thumb_img" src="<%=contextPath %>/resources/image/icons8-엄지-척-64.png">
	                                    </button>
	                                   
	                                    <button id="star_btn">    
	                                        <img id="star_img" src="<%=contextPath %>/resources/image/icons8-별-48.png">
	                                    </button>
	                            </th>
	                        </tr>
                       
	                    </table>

					 <div id="reply-area">
							<table class="list-table" border="5">
								<thead>
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
								</thead>
									<tbody>
										<tr>
											<th><input style="width: 530px; height: 50px;"
												id="replyContent" type="text" placeholder="댓글을 입력하세요." required>
						
												<button id="lock_btn">
													<img id="lock_img"
														src="<%=contextPath %>/resources/image/icons8-잠금-해제-66.png">
												</button>
						
												<div id="box">
													<button onclick="insertReply();" class="button_UI button--winona" data-text="등록"
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
			setInterval(selectReplyList, 1000);
		});
		function insertReply(){
			$.ajax({
				url : "<%= contextPath%>/rinsert.fr",
				data :{
					content : $("#replyContent").val() , 
					bno     : "<%= b.getBoardNo() %>"
				}, 
				success : function(result){
					//댓글등록성공시  result = 1
					
					// 댓글등록 실패시 result = 0
					if(result > 0){
						//새 댓글목록 불러오는 함수호출
						selectReplyList();
						// 댓글내용 비워주기
						$("#replyContent").val("");
					}else{
						alert("댓글작성에 실패했습니다.");	
					}
				}, error : function(){
					console.log("댓글작성실패")
				}
			})
		}
		
		<%-- function selectReplyList(){
			$.ajax({
				url : "<%= contextPath %>/rlist.fr",
				data : {bno : "<%= b.getBoardNo() %>"},
				success : function(list){
					// 서버로부터 전달받은 리스트를 반복문을통해 댓글목록으로 변환
					let result  = "";
					for(let i of list){ 
						result += "<tr>"
									+"<th>"+ i.userId +
									i.replyContent +
									 i.createDate +"</th>"
							   +  "</tr>"
						
					}
					
					$("#reply-area thead").html(result);
				},
				error : function(){
					console.log("게시글 목록조회 실패")
				}
			});
		} --%>
	</script> 
	</body>
</html>