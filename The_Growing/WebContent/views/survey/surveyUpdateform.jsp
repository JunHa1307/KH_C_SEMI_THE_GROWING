<%@page import="com.kh.survey.model.vo.Question"%>
<%@page import="com.kh.survey.model.vo.Survey"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	Survey survey = (Survey) request.getAttribute("s");
	Question ques=  (Question) request.getAttribute("q");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
   href="<%= request.getContextPath() %>/resources/css/surveyForm.css">
</head>
<body>
	<div id="s3">
		<button type="button" class="m_plus button_UI button--winona"
					data-text="객관식 질문 추가">객관식 질문 추가</button>
			<div>
				<button style="margin-top: 10px;"type="button" class="s_plus button_UI button--winona"
					data-text="주관식 질문 추가">주관식 질문 추가</button>
			</div>
			<div>
				<button style="margin-top: 10px;" type="button" class="m_minus button_UI button--winona"
					data-text="질문 삭제">질문 삭제</button>
			</div>
			
	</div>
	<div id="survey_wrap">
		 <div id="s1" ></div>
		<h1 style="font-weight:bold; margin: 0% 0% 0% ; font-weight:bold;">설문조사</h1>
		<button class="close" onclick="javascript:history.back();"></button> 
		<br>
		<h2 style=" margin:0% 5%; font-weight:bold;">수정하기</h2>
		<form action="<%=request.getContextPath()%>/update.su" method="post">
		<input type="hidden" name="sno" value="<%= survey.getSurveyNo() %>">
		 <input type="hidden" name="qNo" value="<%= ques.getQuesNo() %>">
			<div id="insert-su">
				<div class="title">
				<div id="s2"></div>
					<table border-collapse:collapse; id="title_table">
					<br>
						<tr>
							<td width="50"><h4>기간</h4></td>
							<td width="330"><input type="text" name="fDate" value="<%= survey.getFirstDate() %>" ></td>
							<td width="140" style="text-align: center;">~</td>
							<td width="330"><input type="text" name="lDate" value="<%= survey.getLastDate() %>" ></td>
						</tr>
						<tr>
							<td><h4>제목</h4></td>
							<td colspan="3"><input type="text" name="survey_title" value="<%= survey.getTitle() %>" ></td>
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
									<td colspan="3"><input type="text" name="mTitle" size="155" value="<%= ques.getmTitle()[m] %>" ></td>
								</tr>
								<tr>
									<td><h4 style="font-weight:bold;">A.</h4></td>
									<td colspan="3"><input type="text" name="mContent" value="<%= ques.getmContent()[m] %>" ></td>
								</tr>
								<% for(int j = 0; j < Integer.parseInt(ques.getItemNo()[m].replace(" ","")); j++){ %>
								<tr>
									<td align="center"><input type="radio" name="mCheck<%= m %>" value="<%= j %>"></td>
									<td colspan="3"><input type="text" name="itemContent" value="<%= ques.getItemContent()[item] %>" ><br></td>
								</tr>
								<% item++; %>
								<% } %>
								<input type="hidden" name="type" value=1 readonly>
								<input type="hidden" name="itemCheck" value="3">
							</table>
							<div id="button_align" >
						<button type="button" class="item_plus button_UI button--winona"
							data-text="항목 추가">항목 추가</button>
						<button type="button" class="item_minus button_UI button--winona"
							data-text="항목 삭제">항목 삭제</button>
					</div>
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
									<td colspan="3"><input type="text" name="sTitle" size="155" value="<%= ques.getsTitle()[s] %>" ></td>
								</tr>
								<tr>
									<td><h4 style="font-weight:bold;">A.</h4></td>
									<td colspan="3">
										<textarea type="text" name="sContent"
											style="resize: none; border-radius:15px;" rows="3" cols="56.5"
											placeholder="설문자가 대답하는 공간입니다." readonly></textarea>
									</td>
								</tr>
								<input type="hidden" name="type" value=2 readonly>
							</table>
						</div>
						<% s++; %>
					<% } %>
				<% } %>

			</div>
			  <div id="bu_align">
				<button type="submit" class=" button_UI button--winona"
					data-text="수정">수정</button>
			</div>  
			<script>
						$(function() {
							$(".item_plus").click(function() {
								let item = "<tr >"
										+ "<td align='center'><input type='radio' name='mCheck'></td>"
										+ "<td colspan='3'><input type='text' name='itemContent' size='55' placeholder='항목 내용을 입력해주세요' required><br></td>"
										+ "</tr>";
								$(this).parents('div').siblings('table').find("tr:last").after(item);
							});
							$(".item_minus").click(function() {
								if($(this).parents('div').siblings('table').find("input[name=mCheck]").length > 2) {
									$(this).parents('div').siblings('table').find("tr:last").remove();
								}else {
									alert("항목은 2개 이하로 삭제할 수 없습니다.");
								}
							});
							$(".item_plus, .item_minus").on("click",function(){
								console.log($(this).parents('.multiple').find('input[name=itemContent]'));
								$(this).parents('.multiple').find('input[name=itemCheck]').attr("value",
										$(this).parents('.multiple').find('input[name=itemContent]').length);
							})
						});
					</script>
		<script>
			$(function() {
				$(".m_plus").click(function() {
					$("#insert-su").append($(".multiple").eq(0).clone(true));
				});
				$(".s_plus").click(function() {
					$("#insert-su").append($(".short").eq(0).clone(true));
				});
				$(".m_minus").click(function() {
					if($("#insert-su>div").length > 3){
						$("#insert-su>div").eq($("#insert-su>div").length-1).remove();						
					}else {
						alert("질문은 2개 이하로 삭제할 수 없습니다.");
					}
				});
			})
		</script>
		</form>
	</div>
</body>
</html>
