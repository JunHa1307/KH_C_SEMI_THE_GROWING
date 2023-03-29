<%@page import="com.kh.classes.model.vo.Class"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Class> list = (ArrayList<Class>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.myclass_content {
	height: 250px;
	width: 100%;
	/* background-color: blue; */
}

.myclass_content>div {
	float: left;
	height: 100%;
}

#myclass_info {
	width: 33.3%;
	
	/* background-color: bisque; */
}





#user_profile {
	width: 100px;
	height: 100px;
	border-radius: 100%;
	margin: auto;
}

#top {
	height: 50px;
	width: 100%;
	background-color: white;
}

#bottom {
	height: 200px;
	width: 100%;
	
}

#bottom>div {

	font-size: large;
}
#user_profile>img{
	width: 100%;
	height : 100%;
	border-radius: 100%;
}
#myclass_small{
	width: 90%;
	height: 90%;
	background-color:rgb(244, 248, 240);
	margin : auto;
}
</style>
</head>
<body>
	<%@include file="myInfoFrame.jsp"%>
	<div id="board_area">
		<div id="myclass_header">
			<div id="myclass_area">
				<div id="myclass_title">나의 클래스</div>
				<div id="myclass_hr">
					<hr />
				</div>
			</div>
		</div>
		<div class="myclass_content">
			<%
				for (int i =0; i<list.size(); i++) {
					
			%>
			<div id="myclass_info">
				<div id="myclass_small">
				<div id="top">
					<div id="user_profile">
					<img src="<%= contextPath +list.get(i).getFilePath()+list.get(i).getChangeName() %>" alt="클래스 프로필" onerror="this.src='<%= contextPath %>/resources/image/noImage.png'"></div>
				</div>
				<div id="bottom">
				 	<div style="padding:5px; font-size:16px; font-weight:700"><%=list.get(i).getClassGrade()%></div>
					<div style=" text-align: center; padding-top:30px;"><%=list.get(i).getClassTypeName() %> <%=list.get(i).getClassName() %>반</div>
					<div style=" text-align: center">
						담임 : <%=list.get(i).getTeacherName() %> 선생님 <br>학급 수 : <%=list.get(i).getUserCount() %>명
					</div>
				</div>
				</div>
			</div>
			<%
				}
			%>
			
		
	</div>
	</div>
	</div>
	</div>
	
	
	
	
	
	
	
	
	
	
</body>
</html>