<%@page import="com.kh.member.model.vo.Member"%>
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
    <title>첫 화면</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <style>
    	* {
			font-family: 'Noto Sans KR', sans-serif;
		  }
        div {
            box-sizing: border-box;
            border: 1px solid red;
        }
         
        html, body {
            width: 100%;
            height: 100%;    
            margin: 0;     
        }
        .wrap {
            width: 100%;
            height: 100%;  
        }
        #header {
            height: 20%;
            background-color: white;
        }
        
        #logo {
            height: 100%;
           
            display: inline-flex;
        }
        #content {
            height: 60%;
            width: 100%;
            
        }

        #content_1{
            width: 30%;
            height: 100%;
            float: left;
            /* padding: 5%; */
             text-align : center;
 			 padding : 100px 0;
        }

        #content_2{
           height: 100%;
           float: left;
           width: 70%;
        }

        #grow_btn {
        	margin-top: 5px;
        	margin-left: 10px;
        	
            border-radius: 100%;
            width: 33px;
            height: 33px;
            border : none;
            cursor: pointer;
        	display: block;
        }

        .btn {
            width: 90%;
            height: 80%;
            margin: 5% 0%;        
            display: flex;    
                               
        }

        .c_btn{
            width: 399px;
            height: 500px;
            cursor: pointer;
            border-radius: 11%;
            border-color: white;  
            margin: 1%
        }

        #teacher:hover, #parent:hover, #student:hover{
            box-shadow: 5px 20px 5px 10px rgba(0,0,0,0.20);
            transition: 0.1s ease-in;
            transform: translate(-10px,-10px);
        }
              
        @keyframes fadeInUp {
            0% {
                opacity: 0;
                transform: translate3d(0, 100%, 0);
            } 
            50%{
                opacity: 0;
                transform: translateZ(100%);
            }
            100%{
                opacity: 1;
                transform: translateZ(0);
            }
        }
		h1{
			font-size: 30px;
			
		}
        #text1{animation: fadeInUp 1s;}
        #text2{animation: fadeInUp 2s;}
        #text3{animation: fadeInUp 3s;}
        #text4{animation: fadeInUp 3.5s; font-weight: 600;}
        #teacher{animation: fadeInUp 0.5s;}
        #parent{animation: fadeInUp 1s;}
        #student{animation: fadeInUp 1.5s;}
        
        #img_area{
            height: 70%;
            width: 395px;
            margin: -1%;   
            border-radius: 40px 40px 0px 0px;
        }

        #img{
            height: 100%;
            width: 400px;
            margin: -1.5% 0% 0% -1.3%;   
            border-radius: 40px 40px 0px 0px;
           	
        }
      	#logo_txt{
      		font-size: 80px;
      		text-align: center;
      		font-weight: bold;
      		color: rgb(19, 94, 54);
      		margin-top: 20px;
      		margin-left: 50px;
      	}
      	#logo_img{
      		margin-top: 30px;
      		margin-left: 150px;
      		width: 250px;
      		height: 100px;
      	}
        .btnWrap{
        	display: inline-flex;
        }
        .mainTitle{
        	font-size: 30px;
        	font-weight: bold; 
        }
    </style>
</head>

<body>
    <div class="wrap">
        <div id="header">
            <div id="logo">
                <img id="logo_img" src="resources/image/treelogo.png">
                <div id="logo_txt">THE GROWING</div>
            </div>
        </div>

        <div id="content">
            <div id="content_1">
                <h1 id="text1">학교 소식부터</h1>
                <h1 id="text2">스터디까지</h1><br>
                <h1 id="text3">우리의 성장 기록</h1><br>
                <div class="btnWrap">
                	<h1 id="text4">THE GROWING</h1>
                	<button id="grow_btn"></button>
                </div>
            </div>

            <div id="content_2">
                <div class="btn">
                    <button class="c_btn" id="teacher">
                        <div id="img_area">
                            
                        </div>
                       
                        <div>
                            <div class="mainTitle">선생님</div>
                            <br>
                            <div class="mainDt">선생님으로 클래스를 만들어보세요.</div>
                        </div>
                    </button>

                    <button class="c_btn" id="parent">
                        <div id="img_area">
                            
                        </div>

                        <div>
                            <div class="mainTitle">학부모</div><br>
                            <div class="mainDt">자녀가 있는 학부모</div>
                        </div>
                    </button>

                    <button class="c_btn" id="student">
                        <div id="img_area">
                            
                        </div>
                        
                        <div>
                            <div class="mainTitle">학생</div>
                            <br>
                            <div class="mainDt">초중고등, 유치원, 대학교, 스터디 학생</div>
                        </div>
                    </button>
                </div>
            </div>
        </div>
    </div>
    
    <script>
    	$("#logo").click(function(){
    		window.location.reload();
    		
    	});
    	let userLevel;
    	
    	$(".c_btn").click(function(){
    		
    		var userType = $(this).attr('id');
    		
    		if( userType == 'teacher' ){
				userLevel = 1;
			} else if(userType == 'parent'){
				userLevel = 2;
			} else if(userType == 'student'){
				userLevel = 3;
			} else{
				userLevel = 0;
			}
    		
    		location.href = "<%= contextPath%>/loginpage.me?userLevel="+userLevel;
    		
    	});
    	
    </script>
    
</body>
</html>