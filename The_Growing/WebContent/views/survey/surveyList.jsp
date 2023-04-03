<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.survey.model.vo.Survey, java.util.ArrayList"%>
<%
	ArrayList<Survey> surveyList = (ArrayList<Survey>) request.getAttribute("surveyList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!--부트스트랩 알림을 위한 css-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

    <!-- 부트스트랩 게시판 목록을 위한 css -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <style>

        /* 게시판 헤더 및 정보(게시판마다 공통) */
        *{
        
        font-family: 'Gowun Dodum', sans-serif;
        
        }
        /* div{
            border: 1px solid red;
        } */
        .wrap{
            width:100%;
            height:100%;
        }

        #header{
            display: inline-flex;
        }
        #searchBtn>img{
            width: 20px;
        }
        #search{
            margin-left: 390px;
        }
        #searchBtn{
            border: 1px solid black;
            height: 50px;
            border-radius: 10px;
            margin-top: 20px;
        }
        #logo{
            width: 100px;
        }
        #logoBtn{
            margin-left: 100px;
        }
        #seachClass{
            width: 700px;
            border: none;
            outline: none;
        }
        
        #header{
            width:100%;
            height: 10%;
            margin-top: 10px;
        }
        #info>div{
            display: table-cell;
            width: 25%;
        }
        #classInfo, #userInfo {
            padding-left: 50px;
            vertical-align: middle;
        }
        #classInfo>div, #userInfo>div {
            font-size: large;
            font-weight: 900;
        }
        #info{
            width: 100%;
            margin-top: 20px;
            display: table;
            height: 20%;
            background-color: #cff0cc;
        }
        #pSchool, #pUser{
            padding-left: 300px;
        }
        .profile{
            margin-top: 10px;
            margin-bottom: 10px;
            width: 150px;
            border-radius: 50%;
        }
        .btnStyle{
            border: none;
            background: none;
            cursor: pointer;
        }

        /* 버튼호버시 이벤트 css부여 */
        .btnStyle:hover{
            color:#209dce; transition:all .3s ease
        }
        .dropdown{
            margin-left: 350px;
        }
        .dropdown>button{
            background: none;
            border: none;
            border-radius: 40%;
            margin-top: 20px;
        }
        .dropdown-item {
            cursor: pointer;
        }
        #seachClass{
            background: none;
        }
        #alarmIcon{
            width: 30px;
        }

        .dropdown>button:hover{
            background-color: #cff0cc;
        }

        button:focus {outline:none;}


        /* 게시판 목록 css */
        #board_wrap {
            margin-top: 50px;
            width: 100%;
            min-height: 700px;
        }
        #inner_wrap {
            width: 1200px;
            height: 700px;
            margin: auto;
        }
        /* div {
            box-sizing: border-box;
            border: 1px solid red;
        } */
        #inner_wrap > div {
            height: 100%;
            float: left;
        }
        #board {
            width: 20%;
        }
        #board_area {
            width: 80%; 
        }
        #board >ul> li {
            list-style-type: none;
        }
        #board >ul {
            padding: 0;
        }
        .board_li {
            height: 28px;
            cursor: pointer;
        }
        .board_title{
            font-size: large; 
            font-weight: 700; 
            padding-bottom: 10px;
            padding-left: 14px;
        }
        .board_li:hover{
            font-weight: 700;
        } 
        .board_li>div{
            border-radius: 30px;
            width: 100%;
            height: 40px;
            padding: 9px;
            padding-left: 14px;
        }
        .board_li{
            margin-bottom: 13px;
        }
        .board_hr{
            padding: 7px;
        }

    </style>
</head>
<body>
    <%@include file="/views/board/boardFrame.jsp" %>
              <div id="board_area" style="padding-left: 1em;">
                
                <div style="margin-bottom: 1em;font-size: 1.5em;font-weight: 700;">설문조사</div>
                
                <button type="button" style="background-color: #209dce;color: #ffffff;width: 100%;height: 50px;border: 0;border-radius: 5em;">설문조사 작성하기</button>
                
                <div style="margin: 1em 0 1em 0;font-size: 1.5em;"><a href="/" style="text-decoration: none;color: #000000;font-weight: 700;">진행 중</a> | <a href="/" style="text-decoration: none;color: #000000;">종료</a></div>
                <div id="surveying">
	                <% for(int i = 0; i < surveyList.size(); i++) {%>
	                <% Survey s = surveyList.get(i); %>
		                <% if(s.getStatus().equals("Y")){ %>
			                <div style="width:100%;border: 1px solid #cff0cc;border-radius: 1em;background-color: #cff0cc;margin-bottom: 2em;">
			                    <div style="padding: 1em;box-sizing: border-box;display: flex;justify-content: space-between;">
			                        <span><h4><b><%= s.getTitle() %></b></h4> <%= s.getFirstDate() %> ~ <%= s.getLastDate() %></span>
			                        <button type="button" style="margin: 1em 0 1em 0;width: 15em;height: 3em;border: 0;border-radius: 1em;background-color: #209dce;color: #ffffff;">설문하기</button></div>
			                    <% if(loginUser.getUserLevel() == 1) { %>    
				                    <hr style="background-color: #000000;margin: 0;">
				                    <div style="display: flex;justify-content: space-between; padding: 1em 1em 0 1em;">
				                        응답인원 수 : <%= s.getSurveyCount() %> 
				                        <div style="padding: 0 0.5em 0.5em 0.5em;"> 
				                        <a href="/"><button type="button" style="border: 0.5px solid gray;border-radius: 0.5em;background-color: #ffffff;">결과보기</button></a>&nbsp;
				                        <a href="/"><button type="button" style="border: 0.5px solid gray;border-radius: 0.5em;background-color: #ffffff;">종료</button></a>
				                        </div>
				                    </div>
			                    <% } %>
			                </div>
		                <% } %>
	                <% } %>
                </div>
                <div id="surveyEnd">
                	<% for(int i = 0; i < surveyList.size(); i++) {%>
	                <% Survey s = surveyList.get(i); %>
		                <% if(s.getStatus().equals("N")){ %>
			                <div style="width:100%;border: 1px solid #cff0cc;border-radius: 1em;background-color: #cff0cc;margin-bottom: 2em;">
			                    <div style="padding: 1em;box-sizing: border-box;display: flex;justify-content: space-between;">
			                        <span><h4><b><%= s.getTitle() %></b></h4> <%= s.getFirstDate() %> ~ <%= s.getLastDate() %></span>
			                    </div>
			                    <% if(loginUser.getUserLevel() == 1) { %>    
				                    <hr style="background-color: #000000;margin: 0;">
				                    <div style="display: flex;justify-content: space-between; padding: 1em 1em 0 1em;">
				                        응답인원 수 : <%= s.getSurveyCount() %> 
				                        <div style="padding: 0 0.5em 0.5em 0.5em;"> 
				                        <a href="/"><button type="button" style="border: 0.5px solid gray;border-radius: 0.5em;background-color: #ffffff;">결과보기</button></a>&nbsp;
				                        <a href="/"><button type="button" style="border: 0.5px solid gray;border-radius: 0.5em;background-color: #ffffff;">종료</button></a>
				                        </div>
				                    </div>
			                    <% } %>
			                </div>
		                <% } %>
	                <% } %>
                </div>
              </div>
            </div><!-- boardFrame -->
        </div>
    </div>
</body>
</html>