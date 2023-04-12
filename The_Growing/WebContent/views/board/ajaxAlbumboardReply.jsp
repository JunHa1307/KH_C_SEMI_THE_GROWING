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

	<%
		for (int i = 0; i < list.size(); i++) {
	%>


	<div class="mo_reply_content">
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
</body>
</html>