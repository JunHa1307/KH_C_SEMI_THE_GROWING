<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- 부트스트랩 게시판 목록을 위한 css -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- css -->
	<link rel="stylesheet" href="../../resources/css/button.css">
    <style>
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
 	<script>
      $(function(){
          $(".board_li").click(function(){
              $(this).css("fontWeight","700").fadeIn(1000);
              $(this).children().css("background","rgb(239, 243, 239)");
              $(this).siblings(".board_li").css({fontWeight:"", color:"black"})
              $(this).siblings().children().css("background","");
          
          });
      });
    </script>
	<%@ include file="../common/header.jsp" %>
    <div id="info">
        <div id="pSchool">
            <img class="profile" src="../../resources/image/bono.jpg">
        </div>
        <div id="classInfo">
            <div>준하초등학교</div>
            <div>1학년 3반</div>
            <div>담임 : 류준하 선생님</div>
            <div>학급 수 : 18명</div>
        </div>
        <div id="pUser"><img class="profile" src="../../resources/image/bono.jpg"> </div>
        <div id="userInfo">
            <div>오현지 학부모</div>
            <div><button class="btnStyle" type="button">로그아웃</button></div>
            <div><button class="btnStyle" type="button">마이페이지</button></div>
        </div>
    </div>
    <div id="board_wrap">
        <div id="inner_wrap">
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
                <li class="board_li" id="board_survey" style="color: black; font-weight: 700;"><div style="background: rgb(239, 243, 239);">설문조사</div></li>
                <li class="board_li" id="board_check"><div>출석체크</div></li>
                <li class="board_hr"><hr></li>
                <li class="board_title">클래스 관리</li>
                <li class="board_li" id="board_option"><div>클래스 설정</div></li>
                <li class="board_li"  id="board_manage"><div>구성원 관리</div></li>
                <li class="board_li" id="board_invite"><div>초대하기</div></li>
              </ul>
          </div>
          <div id="board_area" style="padding-left: 1em;">
            
            <div style="margin-bottom: 1em;font-size: 1.5em;font-weight: 700;">설문조사</div>
            
            <button type="button" style="background-color: #209dce;color: #ffffff;width: 100%;height: 50px;border: 0;border-radius: 5em;">설문조사 작성하기</button>
            
            <div style="margin: 1em 0 1em 0;font-size: 1.5em;"><a href="/" style="text-decoration: none;color: #000000;font-weight: 700;">진행 중</a> | <a href="/" style="text-decoration: none;color: #000000;">종료</a></div>
            
            
            <div style="width:100%;border: 1px solid #cff0cc;border-radius: 1em;background-color: #cff0cc;margin-bottom: 2em;">
                <div style="padding: 1em;box-sizing: border-box;display: flex;justify-content: space-between;">
                    <span><h4><b>우리아이 급식 투표에 대한 설문</b></h4> 2023-03-21 ~ 2023-03-25</span>
                    <button type="button" style="margin: 1em 0 1em 0;width: 15em;height: 3em;border: 0;border-radius: 1em;background-color: #209dce;color: #ffffff;">설문하기</button></div>
               
            </div>
            <div style="width:100%;border: 1px solid #cff0cc;border-radius: 1em;background-color: #cff0cc;margin-bottom: 2em;">
                <div style="padding: 1em;box-sizing: border-box;display: flex;justify-content: space-between;">
                    <span><h4><b>우리아이 급식 투표에 대한 설문</b></h4> 2023-03-21 ~ 2023-03-25</span>
                    <button type="button" style="margin: 1em 0 1em 0;width: 15em;height: 3em;border: 0;border-radius: 1em;background-color: #209dce;color: #ffffff;">설문하기</button></div>
                <hr style="background-color: #000000;margin: 0;">
                <div style="display: flex;justify-content: space-between; padding: 1em 1em 0 1em;">
                    응답인원 수 : 0 
                    <div style="padding: 0 0.5em 0.5em 0.5em;"> 
                    <a href="/"><button type="button" style="border: 0.5px solid gray;border-radius: 0.5em;background-color: #ffffff;">결과보기</button></a>&nbsp;
                    <a href="/"><button type="button" style="border: 0.5px solid gray;border-radius: 0.5em;background-color: #ffffff;">종료</button></a>
                    </div>
                </div>
            </div>
            
          </div>
        </div>
    </div>
</body>

</html>