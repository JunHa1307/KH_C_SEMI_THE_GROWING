<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.board.model.vo.Board"%>
<%@page import="com.kh.common.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	PageInfo pi = (PageInfo) request.getAttribute("pi");
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");

	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유게시판 리스트</title>
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
        div{
            /* border: 1px solid red; */
        }
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

        #inner_wrap > div {
            height: 100%;
            float: left;
        }
        #board {
            width: 20%;      
        }

        /* #board_fixed {
            width: 20%;
             height:100%;
         	position: relative;
         	border : 1px solid white;
        } */

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

        /* 자유게시판 테이블 css */
        #board_area {
            width: 80%;
        }
        #list_search {
            width: 190px;
            height: 15%;
            margin: -1% 0% 0% 72%;
            
        }        

        #searchBoard {           
            width: 150px;
            border: none;
            outline: none;
            background: none;
        }

        #searchBtn_1 {
            border: 1px solid black;
            height: 40px;
            border-radius: 10px;
           
        }

        .list-table {
            margin: auto;
            min-width: 800px;
            max-width: 100%;
            border-collapse: collapse;
        }

        
        .list-table tr:first-child {
            border-top: none;
            background: #cff0cc;
            color: black;
        }

        .list-table tr {
            border-top: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
            background-color: #f5f9fc;
        }

        .list-table th {
            display: none;
        }

        @media screen and (min-width: 600px) {
            .list-table tr:hover:not(:first-child) {
                background-color: #d8e7f3;
        }
      
        .list-table th,.list-table td {
            display: table-cell;
            padding: .25em .5em;
        }
        .list-table td:hover {
            cursor: pointer;
        }
      
        .list-table th, .list-table td {
            padding: 1em !important;
        }
    	}
    	
    	.paging-area{
			margin-left: 10%;
    	}

		.pagination {
            display: inline-block;
        }
                    
        .pagination button {
            border-style : none;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
            border-radius:50%;
        }
                    
        .pagination button.active {
            background-color: #cff0cc;
             color: black;
        }
                    
       .pagination button:hover:not(.active) {background-color: silver;}
       
        /* 버튼 css */
    .box {
      display: flex;
      background: #ffffff;
      color: #000000;
      width: 150px;
      height: 50px;
      border-radius: 30px;
      
    }
    .button_UI {
      /* margin : 40% 0% 0% 0%; */
      width: 100px;
      height: 50px;
      display: block;
      border: none;
      background: none; 
      color: inherit;
      position: relative;
      z-index: 1;
      -webkit-backface-visibility: hidden;
      -moz-osx-font-smoothing: grayscale;
      border-radius: 30px;
      border: 3px solid;
      float: right;
      margin-top: 10px;
    }
    .button_UI :active{
     color :rgb(137, 180, 166);
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
    .button--winona::after,
    .button--winona > span {
      padding: 10px;
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
    .button--winona:hover > span {
      opacity: 0;
      -webkit-transform: translate3d(0, -25%, 0);
      transform: translate3d(0, -25%, 0);
    }
    </style>
</head>
<body>
    <div class="wrap">
       <!-- 게시판 공통-->
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
            <div id="pUser"><img class="profile" src="resources/image/bono.jpg"> </div>
            <div id="userInfo">
                <div>오현지 학부모</div>
                <div><button class="btnStyle" type="button">로그아웃</button></div>
                <div><button class="btnStyle" type="button">마이페이지</button></div>
            </div>
        </div>

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
                });
              </script>
                <!-- 자유게시판-->
                <div id="board_area">
                    <h1 align="center">자유 게시판</h1>

                    <div id="list_search">                     
                            <button id="searchBtn_1" type="button">
                                <input id="searchBoard" type="text" placeholder="게시판 검색">
                                <img src="resources/searchIcon.png">
                            </button>           
                           
                        <div id="box">
                            <button class="button_UI button--winona" data-text="글 등록"><span>글 등록</span></button>
                        </div> 
                    </div>
                    
                    <table class="list-table">
                        <tbody>
                          <% if(list.isEmpty()) {%>
					<tr>
						<td colspan="6">조회된 리스트가 없습니다.</td>
					</tr>
						<% } else { %>
							<% for(Board b  :  list) { %>
								<tr>
									<td><%= b.getBoardNo() %></td>
									<td><%= b.getBoardTitle() %></td>
									<td><%= b.getRefUno() %></td>
									<td><%= b.getCreateDate() %></td>
								</tr>
							<% } %>
						<% } %>
                      </table>
                    </div>
            </div>
            
            <div align="center" class="paging-area">
               <div class="pagination">
				<% if(currentPage != 1) { %>
					<button onclick="location.href = '/list.bo?currentPage=<%= currentPage -1 %>'">&lt;</button>
				<% } %>
				
				<% for(int i = startPage; i <= endPage; i++ ) { %>
					
					<% if(i != currentPage) { %>
						<button onclick="location.href = '/list.bo?currentPage=<%= i %>'; "><%= i %></button>
					<% } else { %>
						<button disabled><%=i %></button>
					<% } %>
					
				<% } %>
				
				<% if(currentPage != maxPage) { %>
					<button onclick="location.href = '/list.bo?currentPage=<%=currentPage + 1 %>' ">&gt;</button>
				<% } %>
                
              </div>
            
            </div>
            
            
    </div>
</body>
</html>