<%@page import="com.kh.member.model.vo.Member"%>
<%@page import="com.kh.board.model.vo.Reply"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Reply> list = (ArrayList<Reply>) request.getAttribute("list");
String contextPath = request.getContextPath();
Member loginUser = (Member) request.getSession().getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%if(list.size()!=0){ %>
		<% 	for (int i = 0; i < list.size(); i++) {%>
			<div class="mo_reply_content">
			<%if (loginUser.getUserId().equals(list.get(i).getReplyWriter())) {%>
			
			<div class="dropdown" style="float: right; margin-top: -4%;">
					<button class="btn btn-secondary" type="button"
						id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">

						<img id="alarmIcon"
							src="<%=contextPath%>/resources/image/icons8-메뉴-2-48.png">
					</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" onclick="update(<%=list.get(i).getReplyContent()%>,<%=list.get(i).getReplyNo()%>)">수정</a>
						<a class="dropdown-item" id="deleteBoard">삭제</a>
					</div>
				</div>
				
				
				<%} %>
			
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

	
			<%}%>
		<%}else{%>
			<div style="text-align: center; padding-top:30px; font-size:20px; font-weight:600; color:grey;">
				조회된 댓글이 없습니다.
			</div>
		
		<%} %>
		
		
		
				<script>
				function update(content, rno){
					$.ajax({
		   				url : "<%=contextPath%>/rSelect.bo",
		   				data : { rno},
		   				success : function(list){
		   					console.log(list);
		   					$("#mo_reply_textarea").html(list);  
		   				},
		   				error: function(){
		   					console.log("게시글 목록조회 실패")
		   				}
		        	});
				};
					$.ajax({
		   				url : "<%=contextPath%>/rUpdate.bo",
		   				data : { content, rno},
		   				success : function(list){
		   					 $(".mo_reply_text").html(list); 
		   				},
		   				error: function(){
		   					console.log("게시글 목록조회 실패")
		   				}
		        	});
					
					
					
			
						
						
				
											
				</script>
	
</body>
</html>