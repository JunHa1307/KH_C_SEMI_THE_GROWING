<%@page import="com.kh.classes.model.vo.Class"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   String contextPath = request.getContextPath();
    Member loginUser = (Member) session.getAttribute("loginUser");
    Class cInfo = (Class)session.getAttribute("cInfo");
	String alertMsg = (String) session.getAttribute("alertMsg");
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
	   
	<script src="<%= contextPath %>/resources/js/headerNotice.js"></script>   
	       
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/header.css">
    
    <style>
  /* 버튼 css */
 .box {
   display: flex;
   background: #ffffff;
   color: #000000;
}

.button_UI {
   float: left;
   display: block;
   border: none;
   background: none;
   color: inherit;
   position: relative;
   z-index: 1;
   -webkit-backface-visibility: hidden;
   -moz-osx-font-smoothing: grayscale;
} 

.button_UI :active {
   color: rgb(137, 180, 166);
}

.button_UI:focus {
   outline: none;
}

.button--winona {
   overflow: hidden;
   padding: 0;
   -webkit-transition: border-color 0.3s, background-color 0.3s;
   transition: border-color 0.3s, background-color 0.3s;
   -webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
   transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
}

.button--winona::after {
   content: attr(data-text);
   position: absolute;
   width: 100%;
   height: 100%;
   top: 0;
   left: 0;
   opacity: 0;
   color: rgb(137, 180, 166);
   font-weight: 600;
   -webkit-transform: translate3d(0, 25%, 0);
   transform: translate3d(0, 25%, 0);
}

 .button--winona::after, .button--winona>span {
   -webkit-transition: -webkit-transform 0.3s, opacity 0.3s;
   transition: transform 0.3s, opacity 0.3s;
   -webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
   transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
   display: block;
   font-weight: 600;
} 

.button--winona:hover {
   border-color: rgb(137, 180, 166);
   background-color: rgba(255, 255, 255, 0.1);
}

.button--winona:hover::after {
   opacity: 1;
   -webkit-transform: translate3d(0, 0, 0);
   transform: translate3d(0, 0, 0);
}

.button--winona:hover>span {
   opacity: 0;
   -webkit-transform: translate3d(0, -25%, 0);
   transform: translate3d(0, -25%, 0);
}
/* 화면 너비 780 이상일 떄 */

   .box {
   width: 2vw;
   height: 3vw;
   border-radius: 4vw;
   font-size:0.9vw;
   }
   
   .button_UI {
   width: 140px;
   height: 45px;
   border-radius: 4vw;
   border: 0.15vw solid;
   min-width:70px;
   min-height:27px;
   }
   
   .button--winona::after, .button--winona>span {
   -webkit-transition: -webkit-transform 0.3s, opacity 0.3s;
   transition: transform 0.3s, opacity 0.3s;
   -webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
   transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
   display: block;
   font-weight: 600;
   padding: 0.335vw;
   }
   
   
   
   
   
   
   
   
   
   

/* 화면 너비 780 이하일 떄 */



/* 게시판 헤더 및 정보(게시판마다 공통) */
#classInfo, #userInfo{
   padding:1.3em 0em 1em 1em;
   height:100%;
}
.small{
   font-size: 1vw;
}
.big{
   font-size: 1.3vw;
   font-weight: 900;
}
.info_text{
vertical-align: middle;
}


#info {
   background-color: rgb(228, 236, 226);
   width: 100%;
   height: 10%;
   justify-content: center;
   align-item: center;
   margin-top:20px;
      
}
.info_space{
   padding:1em 0em 1em 0em;
   width: 60%;
   min-width:350px;
   margin: auto;
   height: 100%;
   min-height:120px;
   display: flex;
   justify-content: center;
   align-item: center;
}


.profile_area{
   width: 8vw;
   min-width: 85px;
   min-height: 85px;
    height:8vw;
    border-radius: 50%;
    text-align: center;
    overflow: hidden;
    vertical-align: middle;
    
}

#classInfo{
   width: 50%;
   min-width:85px;
}
#userInfo {
   width: 25%;
   min-width:75px;
}


.profile {
   
   width:100%;
    object-fit: cover;
   height: 100%;
   vertical-align: middle;

        
}

.btnStyle {
   border: none;
   background: none;
   cursor: pointer;
   padding: 0;
}
@media only screen and (min-width: 1200px) {
/* 게시판 목록 css */
#board_wrap {
   margin-top: 30px;
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
   /* position: fixed; */
   
}

#board_fix {
/*    width: 20%;
   height: 700px;
   position: relative;
   border: 1px solid white;
   display:block; */
}

#board_area {
   width: 80%;
   padding: 0px 20px 20px 20px;
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
   
}

#album_area>div {
   float: left;
   height: 100%;
}

#album_title {
   width: 70%;
   font-size: 25px;
   font-weight: 700;
   padding-left: 14px;
}

#album_button {
   width: 30%;
   align-item : right;
}

#album_area {
   width: 100%;
   height: 70%;
   /* background-color: aliceblue; */
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

   #hamburgur {
      display: none;
      
   }
   
   
}
@media only screen and (max-width: 1200px) {
#hamburgur {
      position: fixed;
      top: 230px;
      display: block;
      padding-left: 30px;
      cursor: pointer;
      z-index: 9;
   }
   #hamburgur>img {
      width: 30px;
   }

   #board {
      opacity: 0.9;
      left: -300px;
      transition: left .3s;
      background-color: white;
      top: 260px;
      border-radius: 10px;
      max-width: 150px;
      width: 239px;
   height: 700px;
   position: fixed;
   z-index:9;
   }



#board_wrap {
   margin-top: 40px;

}

#inner_wrap {
   
   margin: auto;
}




#board_fix {
/*    width: 20%;
   height: 700px;
   position: relative;
   border: 1px solid white;
   display:none; */
}

#board_area {
   padding: 0px 20px 20px 20px;
   
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
   margin-top:10px;
}

#album_area>div {
   float: left;
   height: 100%;
}

#album_title {
   width: 70%;
   font-size: 25px;
   font-weight: 700;
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

#album_hr {
   width: 100%;
   height: 30%;

   /* background-color: aquamarine; */
}

#album_hr>hr {
   margin: 0;

   /* background-color: aquamarine; */
}
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
                  
                  $("#board_recent").click(function(){

                  location.href="<%=contextPath%>/resent.bo";
               });
             
                 $(".board_album").click(function(){
                    location.href = "<%=contextPath %>/list.al";
                 });
                 $("#board_album").click(function(){
                    location.href = "<%=contextPath %>/list.al";
                 });
                 
                 $("#board_free").click(function(){
                    location.href = "<%=contextPath %>/list.fr?boardType="+4;
                 });
                 
                 $("#board_counsel").click(function(){
                    location.href = "<%=contextPath %>/list.fr?boardType="+5;
                 });
                 
                 $("#board_survey").click(function(){
                    location.href="<%=contextPath %>/list.su";
                 });
                 
                 $("#mypage").click(function(){
                    location.href="<%=contextPath%>/info.c";
                 });
                 
                 $("#hamburgur>img").click(function() {
                    if ($("#board").css("left") == "-300px") {
                       $("#board").css("left", "0");
                    } else {
                       $("#board").css("left", "-300px");
                    }
                 });
                 
                 $("#board_check").click(function(){
                    location.href="<%=contextPath%>/attendance.bo";
                 });
                 

                 $("#board_invite").click(function(){
                    location.href="<%=contextPath%>/invite.bo";
                 });
                 
                 $("#board_option").click(function(){
                    location.href="<%=contextPath%>/infor.bo";
                 });
                 
                 $("#board_notice").click(function(){
                    location.href="<%=contextPath%>/movenotice.bo";
                 });
                 
                 $("#class_option").click(function(){
                    location.href="<%=contextPath%>/moveManagement.bo";
                 });
                 
                 $("#board_manage").click(function(){
                     location.href="<%=contextPath%>/classmembermanagement.c";
                  });


              });
            </script>
</head>
<body>
<script>
	const msg = "<%= alertMsg  %>";
	
	if(msg != "null"){
		alert(msg);
		<% session.removeAttribute("alertMsg"); %>
	}

</script>
    <div class="wrap">
        <div id="header">
            <button id="logoBtn" class="btnStyle" type="button">
                 <img id="logo" src="resources/image/logo.png" onclick="location.href='<%= request.getContextPath()%>/mainpage.me'">
            </button>
            <div id="search">
                <button id="searchBtn" type="button">
                    <form id="classSearchForm" action="searchClass.c" method="get">
		               <input id="seachClass" type="text" name="searchClassName" placeholder="찾으시는 클래스를 입력해주세요.">
		               <img onclick="$('#classSearchForm').submit();" src="<%= request.getContextPath() %>/resources/image/search.svg">
	       	   		</form>
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
              <div class="info_space">
            <div id="pSchool" class="profile_area">
                 <img class="profile"  onclick="location.href='<%= request.getContextPath()%>/mainpage.me'" src="<%= contextPath+cInfo.getFilePath()+cInfo.getChangeName()%>" alt="" onerror="this.src='<%= contextPath %>/resources/image/noImage.png'">   
            </div>
            <div id="classInfo">
     
                <div class="info_text big"><%=cInfo.getClassTypeName() %> <%=cInfo.getClassGrade()%>학년 <%=cInfo.getClassName() %>반</div>
                <div class="info_text small">담임 : <%=cInfo.getTeacherName() %> 선생님</div>
                <div class="info_text small"> 학급 수 : <%=cInfo.getUserCount() %></div>  
              
            </div>
            <div id="pUser" class="profile_area"><img class="profile" src="<%= contextPath+loginUser.getFilePath()+loginUser.getChangeName()%>" alt="" onerror="this.src='<%= contextPath %>/resources/image/noImage.png'"></div>
            <div id="userInfo" >
                <div class="info_text big"><%=loginUser.getUserName() + " " + ( loginUser.getUserLevel() == 1 ? "선생님" : loginUser.getUserLevel() == 2 ? "부모님" : "학생") %></div>
                <div class="info_text small"><button class="btnStyle" type="button" onclick="location.href='<%= contextPath %>/logout.me'">로그아웃</button></div>
                <div class="info_text small"><button id="mypage" class="btnStyle" type="button">마이페이지</button></div>
            </div>
             </div>
        </div>
        
      <div id="veil"></div>
      <%if( loginUser.getUserLevel() == 1) {%>
        <div id="board_wrap">
            <div id="inner_wrap">
               <div id="board_fix"></div>
               <div id="hamburgur">
               <img src="resources/image/list.svg">
            </div>
              <div id="board">
                  <ul>
                    <li class="board_title">게시판</li>
                    <li class="board_li" id="board_recent"><div>최근 게시글</div></li>
                    <li class="board_li" id="board_notice"><div>알림장</div></li>
                    <li class="board_li" id="board_album" class="board_album"><div>앨범</div></li>
                    <li class="board_li" id="board_free"><div>자유게시판</div></li>
                    <li class="board_li" id="board_counsel"><div>상담게시판</div></li>
                    <li class="board_hr"><hr></li>
                    <li class="board_title">수업 관리</li>
                    <li class="board_li" id="board_survey"><div>설문조사</div></li>
                    <li class="board_li" id="board_check"><div>출석체크</div></li>
                    <li class="board_hr"><hr></li>
                    <li class="board_title">클래스 관리</li>
                    <li class="board_li" id="_option"><div>클래스 설정</div></li>
                    <li class="board_li"  id="board_manage"><div>구성원 관리</div></li>
                    <li class="board_li" id="board_invite"><div>초대하기</div></li>
                  </ul>
             </div>
          
             
           <%}else{ %>
           <div id="board_wrap">
            <div id="inner_wrap">
               <div id="board_fix"></div>
               <div id="hamburgur">
               <img src="resources/image/list.svg">
            </div>
              <div id="board">
                  <ul>
                    <li class="board_title">게시판</li>
                    <li class="board_li" id="board_recent"><div>최근 게시글</div></li>
                    <li class="board_li" id="board_notice"><div>알림장</div></li>
                    <li class="board_li" id="board_album" class="board_album"><div>앨범</div></li>
                    <li class="board_li" id="board_free"><div>자유게시판</div></li>
                    <li class="board_li" id="board_counsel"><div>상담게시판</div></li>
                    <li class="board_hr"><hr></li>
                    <li class="board_title">수업</li>
                    <li class="board_li" id="board_survey"><div>설문조사</div></li>
                    <li class="board_li" id="board_check"><div>출석조회</div></li>
                    <li class="board_hr"><hr></li>
                    <li class="board_title">클래스</li>
                    <li class="board_li" id="board_option"><div>클래스 정보</div></li>
                  </ul>
             </div>
           
           <%} %>
           
            


   
</body>
</html>