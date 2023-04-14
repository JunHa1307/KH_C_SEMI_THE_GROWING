<%@page import="com.kh.board.model.vo.Board"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@page import="com.kh.board.model.vo.Reply"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
Board b = (Board) request.getAttribute("b");
	ArrayList<Reply> list = (ArrayList<Reply>) request.getAttribute("list");
String contextPath = request.getContextPath();
Member loginUser = (Member) request.getSession().getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<!-- <head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head> -->
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
						<a class="dropdown-item deleteReply" data-rno='<%= list.get(i).getReplyNo()%>' data-bno='<%= b.getBoardNo()%>'>삭제</a>
					</div>
				</div>
				
				
				<%} %>
			
				<div class="mo_reply_profile">
					<div class="mo_reply_profileImg">
						<img
							src="<%=contextPath + list.get(i).getFilePath() + list.get(i).getChangeName()%>"
							alt=""
							onerror="this.src='<%=contextPath%>/resources/image/noImage.png'">
					</div>
					<div class="mo_reply_id"><%=list.get(i).getReplyWriter()%></div>
				</div>
				<div class="mo_reply_text"><%=list.get(i).getReplyContent()%></div>
			</div>
		
			<div class="mo_reply_content2">
				
				<div class="mo_reply_date grey"><%=list.get(i).getCreateDate()%></div>
			</div>

	
			<%}%>
		<%}else{%>
			<div style="text-align: center; padding-top:30px; font-size:20px; font-weight:600; color:grey;">
				조회된 댓글이 없습니다.
			</div>
		
		<%} %>
		
		<script>
		   $(".deleteReply").click(function(){
				let rno = $(this).data('rno'); 
				let bno = $(this).data('bno'); 
				$.ajax({
	   				url : "<%=contextPath%>/rDelete.bo",
	   				data : { rno},
	   				type : "get",
	   				success : function(result){
	   					albumClick(bno);
	   			<%-- 		if(result>0){
	   					$.ajax({
			   				url : "<%=contextPath%>/rlist.bo",
			   				data : { bno :bno},
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
			   				data : { bno : bno},
			   				success : function(list){
			   					 $("#chat_count").html(list);
			   				},
			   				error: function(){
			   					console.log("게시글 목록조회 실패")
			   				}
			        	});   
	   					}else {
							alert("댓글삭제에 실패했습니다");

						} --%>
	   					
	   				},
	   				error: function(){
	   					console.log("게시글 목록조회 실패")
	   				}
	        		});
			});
	 
		</script>
	
</body>
</html>