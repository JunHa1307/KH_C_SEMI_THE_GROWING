<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
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
       *{
        
        font-family: 'Gowun Dodum', sans-serif;
        
        }
/* 화면 너비 900 이상 */
@media only screen and (min-width: 1200px){
        /* 게시판 목록 css */
        #my_wrap {
            margin-top: 50px;
            width: 100%;
           min-height: 700px;
           
        }
        #my_inner_wrap {
            width: 1200px;
    	    min-height: 700px;
            margin: auto;
        }
        
        #my_inner_wrap > div {
            height: 100%;
            float: left;
        }
        #myli {
            width: 20%;
           
         	display:block;
           
        }
 
   
        #myli >ul> li {
            list-style-type: none;
        }
        #myli >ul {
            padding: 0;
        }
        .my_li {
            height: 28px;
            cursor: pointer;
        }
        .mypage_title{
            font-size: large; 
            font-weight: 700; 
            padding-bottom: 10px;
            padding-left: 14px;
        }
        .my_li:hover{
            font-weight: 700;
        } 
        .my_li>div{
            border-radius: 30px;
            width: 100%;
            height: 40px;
            padding: 9px;
            padding-left: 14px;
        }
        .my_li>div>a{
        		color:black;
        	}
        .my_li{
            margin-bottom: 13px;
        }
        .my_hr{
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

  #board_area {
            width: 80%;
            padding : 20px;
           
        }
        
            #myclass_header {
        height: 80px;
        width: 100%;
        position: sticky;
        /* background-color: antiquewhite; */
      }
      #myclass_area > div {
        float: left;
        height: 100%;
      }
      #myclass_title {
        width: 70%;
        font-size: 25px;
        font-weight: 700;
        padding-top: 13px;
        padding-left: 14px;
      }
   


      #myclass_hr {
        width: 100%;
        height: 30%;

      }
      #myclass_hr > hr {
        margin: 0;

      }
      #hamburgur{
 		display:none;
 	}
  }      
 
@media only screen and (max-width: 1200px) {
    #myli {
         	display:none;
        }
 	#hamburgur{
 		
 		display:block;
 		    padding-top: 13px;
        padding-left: 14px;
 	}
 	#hamburgur>img{
 		
 		width:30px;
 	}
 	 #myclass_title {
        width: 70%;
        font-size: 1.5em;
        font-weight: 700;
        padding-top: 13px;
       
      }
       #my_wrap {
            margin-top: 50px;
           
           
        }
          #board_area {
       
            padding : 20px;
         
           
        }

        

}  
    </style>
                <script>
              $(function(){
                  $(".my_li").click(function(){
                      $(this).css("fontWeight","700").fadeIn(1000);
                      $(this).children().css("background","rgb(239, 243, 239)");
                      $(this).siblings(".my_li").css({fontWeight:"", color:"black"})
                      $(this).siblings().children().css("background","");
                  
                  });
                  
                  
          	
        			$("#myClass").click(function(){
        				location.href = "<%=contextPath %>/info.c";
        				
        			})
        			
              });
           
      
            </script>
</head>
<body>
    <div class="wrap">
        <div id="header">
            <button id="logoBtn" class="btnStyle" type="button">
                <img id="logo" src="resources/image/logo.png">
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
                    
                    <img id="alarmIcon" src="resources/image/bell.svg" />
                 
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                  <a class="dropdown-item" href="#">알림3</a>
                  <a class="dropdown-item" href="#">알림2</a>
                  <a class="dropdown-item" href="#">알림1</a>
                </div>
              </div>
        </div>
         <div id="my_wrap">
            <div id="my_inner_wrap">
          	  <div id="hamburgur"><img src="resources/image/list.svg"></div>
              <div id="myli">
                  <ul>
                    <li class="mypage_title">마이페이지</li>
                    <li class="my_li" id="myInfo"><div>개인정보</div></li>
                    <li class="my_li" id="myClass"><div>나의 클래스</div></li>
                    <li class="my_li" id="myScrap"><div>나의 스크랩</div></li>
             
                  </ul>
             </div>
	
</body>
</html>