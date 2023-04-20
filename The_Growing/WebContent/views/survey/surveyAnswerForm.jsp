<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.survey.model.vo.Survey , com.kh.survey.model.vo.Question"%>
<%
	Question ques = (Question)request.getAttribute("question");
	Survey survey = (Survey)request.getAttribute("survey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Growing</title>
<link rel="shortcut icon" type="image/svg" href="<%= request.getContextPath() %>/favicon.svg"/>
<!--부트스트랩 알림을 위한 css-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>

<!-- 부트스트랩 게시판 목록을 위한 css -->

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<link rel="stylesheet"
   href="<%= request.getContextPath() %>/resources/css/surveyForm.css"> 
</head>
<style>
.button_UI {
	border-color: #7593ff;
}
</style>
<body>
	<div id="survey_wrap">
		<div id="s1" style="width:4vw;" ></div>
		<h1 style="font-weight:bold; margin: 0% 0% 0% ; font-weight:bold;">설문</h1>
		<button class="close" onclick="javascript:history.back();"></button> 
		<br><br>
		<h2 style=" margin:0% 5%; font-weight:bold;">설문하기</h2>
		<form action="<%=request.getContextPath()%>/answer.su" method="post">
			<input type="hidden" name="qNo" value="<%= ques.getQuesNo() %>">
			<div id="insert-su">
				<div class="title">
				<div id="s2"></div>
					<table border-collapse:collapse; id="title_table">
					<br>
						<tr>
							<td width="50"><h4>기간</h4></td>
							<td width="330"><input type="text" name="fDate" value="<%= survey.getFirstDate() %>" readonly></td>
							<td width="140" style="text-align: center;">~</td>
							<td width="330"><input type="text" name="lDate" value="<%= survey.getLastDate() %>" readonly></td>
						</tr>
						<tr>
							<td><h4>제목</h4></td>
							<td colspan="3"><input type="text" name="survey_title" value="<%= survey.getTitle() %>" readonly></td>
						</tr>
					</table>
				</div>
				<% int m = 0; %>
				<% int s = 0; %>
				<% int item = 0; %>
				<% for(int i = 0; i < ques.getQuesType().length ; i++){ %>
					<% if(ques.getQuesType()[i].contains("1") ){ %>
						<div class="multiple">
						<div id="s2"></div>
							<table border-collapse:collapse; id="multiple_table">
							<br>
								<h3 style="font-weight:bold;">질문<%= i+1 %></h3>
								<tr>
									<td><h4 style="font-weight:bold;">Q.</h4></td>
									<td colspan="3"><input type="text" name="mTitle" size="155" value="<%= ques.getmTitle()[m] %>" readonly></td>
								</tr>
								<tr>
									<td><h4 style="font-weight:bold;">A.</h4></td>
									<td colspan="3"><input type="text" name="mContent" value="<%= ques.getmContent()[m] %>" readonly></td>
								</tr>
								<% for(int j = 0; j < Integer.parseInt(ques.getItemNo()[m].replace(" ","")); j++){ %>
								<tr>
									<td align="center"><input type="radio" name="mCheck<%= m %>" value="<%= j %>"></td>
									<td colspan="3"><input type="text" name="itemContent" value="<%= ques.getItemContent()[item] %>" readonly><br></td>
								</tr>
								<% item++; %>
								<% } %>
								<input type="hidden" name="mNo" value="<%= m %>">
							</table>
						</div>
						<% m++; %>
					<% }else{ %>
						<div class="short">
						<div id="s2"></div>
							<table border-collapse:collapse; id="short_table">
							<br>
								<h3 style="font-weight:bold;">질문<%= i+1 %></h3>
								<tr>
									<td><h4 style="font-weight:bold;">Q.</h4></td>
									<td colspan="3"><input type="text" name="sTitle" size="155" value="<%= ques.getsTitle()[s] %>" readonly></td>
								</tr>
								<tr>
									<td><h4 style="font-weight:bold;">A.</h4></td>
									<td colspan="3">
										<textarea type="text" name="sContent"
											style="resize: none; border-radius:15px;" rows="3" cols="56.5"
											placeholder="질문 내용을 입력해주세요"></textarea>
									</td>
								</tr>
							</table>
						</div>
						<% s++; %>
					<% } %>
				<% } %>
				<div id="bu_align">
					<button type="submit" class=" button_UI button--winona"
						data-text="등록" >등록</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>