<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String contextPath = request.getContextPath();
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
    
    <style>
        /* 게시판 헤더 및 정보(게시판마다 공통) */
        *{
        
        font-family: 'Gowun Dodum', sans-serif;
        
        }
         div{
           /*  border: 1px solid red; */
            box-sizing: border-box;
        } 
        .wrap{
            width:100%;
            min-height: 100%;
            position: absolute;
            top: 0;
  			left: 0;
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
           height: 100%
           
        }
        #inner_wrap {
            width: 1200px;
    			height: 100%;
            margin: auto;
        }
        
        #inner_wrap > div {
            height: 100%;
            float: left;
        }
        #board {
            width: 239px;
            height:700px;
           position: fixed;
        }
         #board_fixed {
            width: 20%;
             height:100%;
         	position: relative;
         	border : 1px solid white;
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
        .board_li>div>a{
        		color:black;
        	}
        .board_li{
            margin-bottom: 13px;
        }
        .board_hr{
            padding: 7px;
        }
        #veil{
        position: fixed;
        width: 100%; 
        height: 100%;
        bottom: 0px; 
        background-color: black; 
        opacity: 0.6;
        z-index: 1; 
        display: none;
      }
    

    </style>
</head>
<body>
    <div class="wrap">
        <div id="header">
            <button id="logoBtn" class="btnStyle" type="button">
                <img id="logo" src="resources/KakaoTalk_20230317_141025465-removebg-preview.png">
            </button>
            <div id="search">
                <button id="searchBtn" type="button">
                    <input id="seachClass" type="text" placeholder="찾으시는 클래스를 입력해주세요.">
                    <img src="resources/searchIcon.png">
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
                    
                    <img id="alarmIcon" src="resources/알림.png" />
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                  <a class="dropdown-item" href="#">알림3</a>
                  <a class="dropdown-item" href="#">알림2</a>
                  <a class="dropdown-item" href="#">알림1</a>
                </div>
              </div>
        </div>
        <div id="info">
            <div id="pSchool">
                <img class="profile" src="resources/image/bono.jpg">
            </div>
            <div id="classInfo">
                <div>준하초등학교</div>
                <div>1학년 3반</div>
                <div>담임 : 류준하 선생님</div>
                <div>학급 수 : 18명</div>
            </div>
            <div id="pUser"><img class="profile" src="/resources/image/bono.jpg"> </div>
            <div id="userInfo">
                <div>오현지 학부모</div>
                <div><button class="btnStyle" type="button">로그아웃</button></div>
                <div><button class="btnStyle" type="button">마이페이지</button></div>
            </div>
        </div>
		<div id="veil"></div>
		
        <div id="board_wrap">
            <div id="inner_wrap">
          	    <div id="board_fixed"></div>
              <div id="board">
                  <ul>
                    <li class="board_title">게시판</li>
                    <li class="board_li" id="board_recent"><div>최근 게시글</div></li>
                    <li class="board_li" id="board_notice"><div>알림장</div></li>
                    <li class="board_li" id="board_album"><div>앨범</div></li>
                    <li class="board_li" id="board_free"><div>자유게시판</div></li>
                    <li class="board_li" id="board_counsel"><div>상담게시판</div></li>
                    <li class="board_hr"><hr></li>
                    <li class="board_title">수업관리</li>
                    <li class="board_li" id="board_survey"><div>설문조사</div></li>
                    <li class="board_li" id="board_check"><div>출석체크</div></li>
                    <li class="board_hr"><hr></li>
                    <li class="board_title">클래스 관리</li>
                    <li class="board_li" id="board_option"><div>클래스 설정</div></li>
                    <li class="board_li"  id="board_manage"><div>구성원 관리</div></li>
                    <li class="board_li" id="board_invite"><div>초대하기</div></li>
                  </ul>
             </div>
           
           
            
            <script>
              $(function(){
                  $(".board_li").click(function(){
                      $(this).css("fontWeight","700").fadeIn(1000);
                      $(this).children().css("background","rgb(239, 243, 239)");
                      $(this).siblings(".board_li").css({fontWeight:"", color:"black"})
                      $(this).siblings().children().css("background","");
                  
                  });
                  
                  
          	
        			$("#board_album").click(function(){
        				location.href = "<%=contextPath %>/list.al";
        			})
        		
              });
           
      
            </script>

   
</body>
</html>