<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.survey.model.vo.Survey, com.kh.survey.model.vo.Question, com.kh.survey.model.vo.Answer, java.util.ArrayList"%>
<%
	Survey survey = (Survey)request.getAttribute("survey");
	Question ques = (Question)request.getAttribute("question");
	ArrayList<Answer> ans = (ArrayList<Answer>)request.getAttribute("answer");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%= survey.getSurveyNo() %>
	<%= ques.getQuesNo() %>
	<%= ans.get(0).getRefUno() %>
</body>
</html>