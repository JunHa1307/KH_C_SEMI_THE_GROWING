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
       	
       	#reply_area {
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
	                                      <a class="dropdown-item" href="<%=contextPath %>/update.fr">수정</a>
	                                      <a class="dropdown-item" href="#">삭제</a>
	                                    </div>
	                                  </div>
	                           
	                            </th>					        
	                        </tr>
	                	
	                        <tr>
	                           <th height="50">
	                            <img id="profile_img" src="<%=contextPath %>/resources/image/bono.jpg">
	                            <%=b.getUserId() %> <br> <%=b.getCreateDate() %> </th>
	                        </tr>
	                        <tr>
	                            <th height="200">
	                                <p style="height: 250px;">
	                                	 <%=b.getBoardContent() %>
	                                </p>
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

						<div id="reply_area">
							<table class="list-table" border="5">
								<thead>
									<%--  <% for(Reply r : list) { %> --%>
									<tr>
										<th height="50">
											<div id="reply_info"
												style="width: 150px; height: 50px; border-style: none;">
												<img id="profile_img"
													src="<%=contextPath %>/resources/image/bono.jpg">
												<%-- <%=r.getReplyWriter() %> --%>
												댓글작성자 <br>
												<%-- <%=r.getCreateDate() %> --%>
												작성일
											</div>
					
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
													<a class="dropdown-item" href="#">수정</a> <a
														class="dropdown-item" href="#">삭제</a>
												</div>
											</div>
					
											<div id="reply_content" style="width: 80%;">
												<%-- <%=r.getReplyContent() %> --%>
												댓글 내용댓글 내용댓글 내용댓글 내용댓글 내용댓글 내용댓글 내용댓글 내용댓글 내용댓글 내용댓글 내용댓글 내용댓글
												내용댓글 내용
											</div>
										</th>
									</tr>
									
									<%-- <% } %> --%>
								</thead>
								
								<form action="">
									<tbody>
										<tr>
											<th><input style="width: 530px; height: 50px;"
												id="replyContent" type="text" placeholder="댓글을 입력하세요." required>
						
												<button id="lock_btn">
													<img id="lock_img"
														src="<%=contextPath %>/resources/image/icons8-잠금-해제-66.png">
												</button>
						
												<div id="box">
													<button class="button_UI button--winona" data-text="등록"
														style="width: 80px; margin: -7% 0% 0% 88%;"
														onclick="insertReply();">
														<span>등록</span>
													</button>
												</div>
											</th>
										</tr>
									</tbody>
								</form>
							</table>
				
						</div>
	</body>
</html>