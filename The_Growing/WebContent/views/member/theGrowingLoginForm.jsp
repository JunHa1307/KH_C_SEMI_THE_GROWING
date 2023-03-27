<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();


	Member loginUser = (Member) session.getAttribute("loginUser");
	// 로그인 전 : null값이 담김
	// 로그인 후 : 로그인한 회원의 Member객체
	
	String alertMsg = (String) session.getAttribute("alertMsg");
	// 모든 서비스 요청 전 : null
	//         요청 성공 : alert으로 띄워줄 메세지 문구 ex)로그인에 성공했습니다. 게시글등록에 성공했습니다
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 페이지</title>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

    <style>
        div {
            box-sizing: border-box;
            font-family: 'Gowun Dodum', sans-serif;
            /* border: 1px solid red; */
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

        .header {
            height: 15%;
            text-align: center;        
        }
       
        .header>* {
            float: left;
        }

        #header_1, #header_3 {
            width: 20%;
            height: 100%;
            background-color: green;
        }

        #header_2 {
            width: 60%;
            height: 100%;
        }
        
        #tree_img {
            height: 100px;
            position: absolute;
            margin: 2%;
        }

        #text_img {
            width: 500px;
            margin: -13% 0% 0% 20%;
        }
        
        .content {
            height: 85%;            
        }

        .content>* {
           float: left;
        }

        .content_2 {
            width: 60%;
            height: 100%;
            text-align: center;    
        }
        
        .content_1, .content_3 {
            width: 20%;
            height: 100%;
            background-color: green;
        }
        
        #title_area {
            height: 25%;
        }
      
        #loginForm_area, #pwdForm_area, #start_area {         
            height: 10%;        
        }   

        #userId, #userPwd {
            width: 70%;
            height: 70%;
            font-size: 1.5em;
            border-color: rgb(161, 160, 160);
            border-radius: 500px;
            border-style: solid;
        }
       
        #start_btn {
            margin: 5%;
            width: 200px;
            height: 60px;
            border-radius: 500px; 
            border-color: black;
            font-size: 1.1em;
            font-weight: bold;
            cursor: pointer;
            background-color: greenyellow;
        }

        #enroll_btn {      
            width: 300px;
            height: 60px;
            border-radius: 500px;    
            border-color: black;
            font-size: 1.1em;
            font-weight: bold;
            cursor: pointer;
            background-color: green;
            color: white;
        }
       
        #start_btn:hover, #enroll_btn:hover {
            opacity: 70%;
        }
        #text_area {
            height: 20%;
            margin: 5%;
        }
       
        #loginEnroll_area {
            height: 20%;
            margin: -10%;
        }
       
        #title_1 {
            font-size: 35pt;
        }

    </style>
</head>
<body>
    <div class="wrap">
        <div class="header">
            <div id="header_1"></div>
            
            <div id="header_2">
                <img id="tree_img" src="https://media.discordapp.net/attachments/1083632858645663788/1087912949311619073/treelogo.png">
                <img id="text_img" src="resources/image/그로잉.png">
            </div>
           
            <div id="header_3"></div>
        </div>
		
		<form class="content" id="login-form" action="<%= request.getContextPath() %>/login.me" method="post">
	        <!-- <div > -->
	
	            <div class="content_1"></div>
	
	            <div class="content_2">
	                <div id="title_area">
	                   <h1 id="title_1">The Growing 계정으로 로그인</h1>
	                   <h2 id="title_2">The Growing 회원가입 후에 이용 가능한 서비스 입니다.</h2>
	                   
	                </div>
	
	                <div id="loginForm_area">                
	                    <input id="userId" type="text" name="userId" placeholder="아이디를 입력하세요."
	                    style="background-image: url('https://search.pstatic.net/sunny/?src=https%3A%2F%2Favatars.githubusercontent.com%2Fu%2F94160753%3Fv%3D4%3Fs%3D400&type=a340');
	                    background-size: 60px; background-repeat: no-repeat; text-align: center"> 
	                </div>   
	                
	                <div id="pwdForm_area">
	                    <input id="userPwd" type="password" name="userPwd"  placeholder="비밀번호를 입력하세요."
	                    style="background-image: url('https://search.pstatic.net/sunny/?src=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F00%2F5e%2Fe3%2F005ee3d4096f948347b994294e5a552a.jpg&type=a340');
	                    background-size: 60px; background-repeat: no-repeat; text-align: center"> 
	                </div>    
	                
	                <div id="start_area"> <!-- 시작하기 버튼-->
	                        <button id="start_btn" onclick="submitLogin();">시작하기</button>
	                </div>
	
	                <div id="text_area">
	                    <span style="font-weight: bold;">
	                        The Growing 계정이 없으신가요? <br>
	                        회원가입 바로가기 버튼을 통해 회원가입 후 로그인 서비스를 이용하세요.
	                    </span>
	                </div>
	
	                <div id="loginEnroll_area"> <!-- 회원가입 버튼-->
	                        <button id="enroll_btn" onclick="enrollPage();">회원가입 바로가기</button>
	                </div>
	            </div>
	
	            <div class="content_3"></div>
	        <!-- </div> -->
	    </form>
        
       	<script>
       		/* 회원가입을 위한 페이지 */
			function enrollPage(){
				// 단순한 정적인 페이지 이동요청이라고해도 반드시 servlet을 거쳐갈것 => url에 서블릿 매핑값만 노출되도록 하기
				location.href = "<%= contextPath %>/enrollForm.me";
			}
			
			function submitLogin(){
				$("#login-form").submit();
			}
       	</script>
    </div>
</body>
</html>