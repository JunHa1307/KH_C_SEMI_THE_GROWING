<%@page import="com.kh.classes.model.vo.Class"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String contextPath = request.getContextPath();
    Member loginUser = (Member) session.getAttribute("loginUser");
    Class cInfo = (Class)request.getAttribute("cInfo");

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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

    <!-- 부트스트랩 게시판 목록을 위한 css -->

    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    
    <!-- 슬릭 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css"> 
    
    <!-- summernote -->
    <script src="resources/summernote/summernote-lite.js"></script>
	<script src="resources/summernote/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="resources/summernote/summernote-lite.css">
	
	    
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/button.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/header.css">
    
    <style>
/* 게시판 헤더 및 정보(게시판마다 공통) */
#classInfo, #userInfo {
	padding-left: 50px;
	vertical-align: middle;
	padding-top: 40px;
}


#classInfo>div, #userInfo>div {
	font-size: large;
	font-weight: 900;
}

#info {
	
	
	background-color: rgb(228, 236, 226);
	width: 100%;
	margin: auto;
	margin-top:20px;
	height: 170px;
	display: flex;
	justify-content: center;
	align-item: center;
}

.info_space {
	width: 20%;
	height: 170px;
	}

.profile_area{
	width:13%;
}

#classInfo{
	width: 50%;
}
#userInfo {
	width: 22%;
}


.profile {
	margin-top: 10px;
	margin-bottom: 10px;
	width: 100%;
	min-height: 7vw;
	border-radius: 50%;
	height: 90%;
}

.btnStyle {
	border: none;
	background: none;
	cursor: pointer;
	padding: 0;
}

/* 게시판 목록 css */
#board_wrap {
	margin-top: 50px;
	width: 100%;
	min-height: 700px;
}

#inner_wrap {
	width: 1200px;
	min-height: 700px;
	margin: auto;
}

#inner_wrap>div {
	height: 100%;
	float: left;
}

#board {
	width: 239px;
	height: 700px;
	position: fixed;
}

#board_fix {
	width: 20%;
	height: 700px;
	position: relative;
	border: 1px solid white;
}

#board_area {
	width: 80%;
	padding: 20px;
}

#board>ul>li {
	list-style-type: none;
}

#board>ul {
	padding: 0;
}

.board_li {
	height: 28px;
	cursor: pointer;
}

.board_title {
	font-size: large;
	font-weight: 700;
	padding-bottom: 10px;
	padding-left: 14px;
}

.board_li:hover {
	font-weight: 700;
}

.board_li>div {
	border-radius: 30px;
	width: 100%;
	height: 40px;
	padding: 9px;
	padding-left: 14px;
}

.board_li>div>a {
	color: black;
}

.board_li {
	margin-bottom: 13px;
}

.board_hr {
	padding: 7px;
}

#veil {
	position: fixed;
	width: 100%;
	height: 100%;
	bottom: 0px;
	background-color: black;
	opacity: 0.6;
	z-index: 1;
	display: none;
}

.board_hr {
	padding: 7px;
}

#album_header {
	height: 80px;
	width: 100%;
	position: sticky;
	/* background-color: antiquewhite; */
}

#album_area>div {
	float: left;
	height: 100%;
}

#album_title {
	width: 70%;
	font-size: 25px;
	font-weight: 700;
	padding-top: 13px;
	padding-left: 14px;
}

#album_button {
	width: 30%;
}

#album_area {
	width: 100%;
	height: 70%;
	/* background-color: aliceblue; */
}

#album_button {
	width: 30%;
}

#album_hr {
	width: 100%;
	height: 30%;

	/* background-color: aquamarine; */
}

#album_hr>hr {
	margin: 0;

	/* background-color: aquamarine; */
}
</style>
                <script>
              $(function(){
                  $(".board_li").click(function(){
                      $(this).css("fontWeight","700").fadeIn(1000);
                      $(this).children().css("background","rgb(239, 243, 239)");
                      $(this).siblings(".board_li").css({fontWeight:"", color:"black"})
                      $(this).siblings().children().css("background","");
                  
                  });
                  
                  
          	
        			$(".board_album").click(function(){
        				location.href = "<%=contextPath %>/list.al";
        			})
        			$("#board_album").click(function(){
        				location.href = "<%=contextPath %>/list.al";
        				
        			})
        			$("#board_survey").click(function(){
        				location.href="<%=contextPath %>/enroll.su";
        			})
              });
           
      
            </script>
</head>
<body>
    <div class="wrap">
        <div id="header">
            <button id="logoBtn" class="btnStyle" type="button">
                 <img id="logo" src="resources/image/logo.png" >
            </button>
            <div id="search">
                <button id="searchBtn" type="button">
                    <input id="seachClass" type="text" placeholder="찾으시는 클래스를 입력해주세요."><img src="resources/image/search.svg">
                </button>
            </div>
            <div class="dropdown">
                <button 
                    class="btn btn-secondary" 
                    type="button" 
                    id="dropdownMenuButton" 
                    data-toggle="dropdown" 
                    aria-haspopup="true" 
                    aria-expanded="false">
                    
                    <img id="alarmIcon" src="resources/image/bell.svg"/>
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                  <a class="dropdown-item" href="#">알림3</a>
                  <a class="dropdown-item" href="#">알림2</a>
                  <a class="dropdown-item" href="#">알림1</a>
                </div>
              </div>
        </div>
        <div id="info">
        		<div class="info_space"></div>
            <div id="pSchool" class="profile_area">
                <img class="profile" src="<%= contextPath+cInfo.getFilePath()+cInfo.getChangeName()%>" alt="" onerror="this.src='<%= contextPath %>/resources/image/noImage.png'">
            </div>
            <div id="classInfo">
          
                <div style="font-size:20px; font-weight: 900;"><%=cInfo.getClassTypeName() %> <%=cInfo.getClassName() %>반</div>
                <div style=" font-weight: 450;">담임 : <%=cInfo.getTeacherName() %> 선생님</div>
                <div style=" font-weight: 450;"> 학급 수 : <%=cInfo.getUserCount() %></div>
             
            </div>
            <div id="pUser" class="profile_area"><img class="profile" src="<%= contextPath+loginUser.getFilePath()+loginUser.getChangeName()%>" alt="" onerror="this.src='<%= contextPath %>/resources/image/noImage.png'"></div>
            <div id="userInfo" >
                <div style="font-size:20px; font-weight: 900;"><%=loginUser.getUserName() + " " + ( loginUser.getUserLevel() == 1 ? "선생님" : loginUser.getUserLevel() == 2 ? "부모님" : "학생") %></div>
                <div><button class="btnStyle" type="button">로그아웃</button></div>
                <div><button class="btnStyle" type="button">마이페이지</button></div>
            </div>
       		<div class="info_space"></div>
        </div>
        
		<div id="veil"></div>
		
        <div id="board_wrap">
            <div id="inner_wrap">
          	  <div id="board_fix"></div>
              <div id="board">
                  <ul>
                    <li class="board_title">게시판</li>
                    <li class="board_li" id="board_recent"><div>최근 게시글</div></li>
                    <li class="board_li" id="board_notice"><div>알림장</div></li>
                    <li class="board_li" id="board_album" class="board_album"><div>앨범</div></li>
                    <li class="board_li" id="board_free"><div>자유게시판</div></li>
                    <li class="board_li" id="board_counsel"><div>상담게시판</div></li>
                    <li class="board_hr"><hr></li>
                    <li class="board_title">수업관리</li>
                    <li class="board_li" id="board_survey"><div>설문조사</div></li>
                    <li class="board_li" id="board_check"><div>출석체크</div></li>
                    <li class="board_hr"><hr></li>
                    <li class="board_title">클래스 관리</li>
                    <li class="board_li" id="board_option" onclick="<%= request.getContextPath() %>/moveManagement.bo"><div>클래스 설정</div></li>
                    <li class="board_li"  id="board_manage"><div>구성원 관리</div></li>
                    <li class="board_li" id="board_invite"><div>초대하기</div></li>
                  </ul>
             </div>
           
           
            


   
</body>
</html>