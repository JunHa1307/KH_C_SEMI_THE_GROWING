<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%
   /* Integer userLevel = (Integer) request.getAttribute("userLevel"); */
   Integer userLevel = (Integer) session.getAttribute("userLevel");
   String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- google login api -->
  	<meta name ="google-signin-client_id" content="973318692376-c7o87b7cpr11prfeltj32j3pc0i3n3c1.apps.googleusercontent.com">
    <title>loginPage</title>

    <!-- kakao login api cdn -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>    
   
	<!-- 네이버 스크립트 -->
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
   	<!-- <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script> -->
   	
	<!-- 구글 api 사용을 위한 스크립트 -->
	<script src="https://accounts.google.com/gsi/client" async defer></script>
	   
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
            background-color: rgba(220, 220, 220, 0.027)
        }

        .header {
            height: 15%;
            text-align: center;
        }

        #tree_img {
            height: 130px;
        }

        #text_img {
            width: 600px;
        }
        .content {
            height: 70%;
        }

        #content_1 {
            height: 10%;
            text-align: center;
        }
        
        #content_2 {
            height: 90%;
            text-align: center;
        }

        .start_btn {
            width: 500px;
            height: 100px;
            margin: 1%;
            border-radius: 500px;
            border-color: white;
            border-style: none;
            font-size: large;
            font-weight: bold;
            cursor: pointer;
            font-family: 'Gowun Dodum', sans-serif;
        }

        #start_btn1:hover,  #start_btn2:hover,  #start_btn3:hover,  #start_btn4:hover, #footer_1>a:hover{
            opacity: 70%;
        }

        #start_btn1{
            background-color: green;  
        }

        #start_btn2{
            background-color: rgb(248, 232, 6);           
        }

        #start_btn3{
            background-color: rgb(9, 212, 60);      
        }

        #start_btn4{
            background-color: white;
            border-color: rgb(182, 181, 181);
            border-style: solid;
        }
        #kakao {
            width: 50px;
            height: 50px;
            margin: -3%;           
        }

        #google, #naver{
            width: 30px;
            height: 30px;
            margin: -1%;
        }

        
        @keyframes fadeInUp {
            0% {
                opacity: 0;
                transform: translate3d(0, 100%, 0%);
            } 
                     
            50%{
                opacity: 0;
                transform: translateZ(50%);
            }
            100%{
                opacity: 1;
                transform: translateZ(0%);
            }
        }

        #start_btn1{animation: fadeInUp 0.5s;}
        #start_btn2{animation: fadeInUp 1s;}
        #start_btn3{animation: fadeInUp 1.5s;}
        #start_btn4{animation: fadeInUp 2s;}


        .footer {
            height: 12.8%;
            background-color: green;
            color: white;
            display: flex;
            text-align: center;
            font-size: 15pt;
           
        }

        .footer>* {
            width: 50%;
            height: 100%;
            padding: 2.5%;
        }
       
        #footer_1>a{
            text-decoration: none;
            color: white;
            font-weight: 600;
            margin: 15px;   
        }

        li{
            display: block;
            list-style: none;
        }
    </style>
</head>
<body>
    <div class="wrap">
        <div class="header">
            <img id="treelogo.png" class="goFirst" src="resources/image/treelogo.png">
            <img id="textlogo.png" class="goFirst" src="resources/image/textlogo.png">
        </div>

        <div class="content">
            <div id="content_1">
            <%
               String userType;
               
               if(userLevel.intValue() == 1){
                  userType = "선생님으";
               } else if(userLevel.intValue() == 2){
                  userType = "학부모";
               } else {
                  userType = "학생으";
               }
            %>
               <h1><%= userType %>로 로그인</h1>
            </div>  
            <div id="content_2">  
                <button class="start_btn" id="start_btn1">The Growing으로 시작하기</button><br>

                <li onclick="kakaoLogin();">
                    <a href="javascript:void(0)">
                        <button class="start_btn" id="start_btn2">
	                        <img id="kakao" src="https://www.hiclass.net/img/icon_login_kakao.7b0cff84.png">
	                        카카오로 시작하기
                		</button>
                    </a>
                </li>
                <%-- 네이버 로그인(java) --%>
                <%
				    String clientId = "AoXLANkB0ykozQKaSUNj";//애플리케이션 클라이언트 아이디값";
				    String redirectURI = URLEncoder.encode("http://localhost:8085/growing/naverlogin.me", "UTF-8");
				    SecureRandom random = new SecureRandom();
				    String state = new BigInteger(130, random).toString();
				    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
				    apiURL += "&client_id=" + clientId;
				    apiURL += "&redirect_uri=" + redirectURI;
				    apiURL += "&state=" + state;
				    session.setAttribute("state", state);
				 %>
				<li>
	  				<a href="<%=apiURL%>">
		  				<button class="start_btn start_btn3" id="start_btn3">
		  					네이버로 시작하기
		  				</button>
	  				</a>
               	</li>         
				<%-- 구글 로그인 --%>
				<li>
					<div class="gDid_signin" data-type="standard" data-size="large" data-width="100%"
					  	data-theme="filled_blue" data-text="sign_in_with" data-shape="circle" data-logo_alignment="right"></div>
	                <a><button id="buttonDiv" class="start_btn">
	                구글로 시작하기
	                </button></a>
				</li>
            </div>   
        </div>

        <div class="footer">

        </div>

      <script>
           $(".goFirst").click(function(){
              location.href = "<%= contextPath %>";
           });
           
           $("#start_btn1").click(function(){
              location.href = "<%= contextPath %>/views/member/theGrowingLoginForm.jsp";
           });
        </script>

        <!-- 카카오로그인 스크립트 -->
        <script>
            Kakao.init('2cbf161eadf2b860fc5c71113e38ec12'); //발급받은 키 중 javascript키를 사용해준다.
            console.log(Kakao.isInitialized()); // sdk초기화여부판단
            
            //카카오로그인
            function kakaoLogin() {
             /* Kakao.Auth.login( */
                Kakao.Auth.loginForm({
                success: function (response) {
                    Kakao.API.request({
                    url: '/v2/user/me',
                    success: function (response) {
                       let accessToken = Kakao.Auth.getAccessToken();
                       Kakao.Auth.setAccessToken(accessToken);
                    	
                       console.log(response);
                       console.log(response.id);
                       console.log(response.properties.nickname);
                       console.log(response.properties.profile_image);
                        
                        let snsId = response.id;
                        let snsName = response.properties.nickname;
                        let snsType = 1;
                        let filePath = response.properties.profile_image;
                        
                        $.ajax({
                           url : "<%= request.getContextPath() %>/apinsert.me",
                           data : {snsId, snsName, snsType, filePath},
                           method : 'post',
                           success: function(data){
                        	   alert("카카오로 정상 로그인되었습니다.");
                        	   location.replace("<%= request.getContextPath() %>/mainpage.me");
                           },
                           error: function(){
                              console.log("카카오로그인db저장실패");
                           }
                        });
                    },
                    fail: function (error) {
                        console.log(error)
                    },
                    })
                },
                fail: function (error) {
                    console.log(error)
                }
                });
            } 
        </script>

        <script>
        
	        // 구글 로그인 정보 받아서 로그인
	        function handleCredentialResponse(response) {
	        	// response.credential == 구글 로그인 토큰
	        	// parseJwt(token) = json web token 파싱(디코딩)
	            const responsePayload = parseJwt(response.credential);
	            
	            let snsId = responsePayload.sub;
	            let snsName = responsePayload.name;
	            let snsType = 3;
	            let filePath = responsePayload.picture;
	            
				$.ajax({
                    url : "<%= request.getContextPath() %>/apinsert.me",
                    data : {snsId, snsName, snsType, filePath},
                    method : 'post',
                    success: function(data){
                 	   alert("구글로 정상 로그인되었습니다.");
                 	   location.replace("<%= request.getContextPath() %>/mainpage.me");
                    },
                    error: function(){
                       console.log("구글로그인db저장실패근데왜db저장이죠");
                    }
                 });
	        }
	        
	        // jwt 알아볼수있도록 변환
	        function parseJwt(token) {
	            var base64Url = token.split('.')[1];
	            var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
	            var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
	                return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
	            }).join(''));

	            return JSON.parse(jsonPayload);
	        };
	        
	        // 구글 로그인 버튼 만들기
	        window.onload = function () {
	          google.accounts.id.initialize({
	            client_id: "973318692376-c7o87b7cpr11prfeltj32j3pc0i3n3c1.apps.googleusercontent.com",
	            callback: handleCredentialResponse
	          });
	          google.accounts.id.renderButton(
	            document.getElementById("buttonDiv"),
	            {theme: "filled_blue", size: "large", shape: "circle", width: "400", logo_alignment: "center" }  // customization attributes
	          );
	        }
	    </script>
        </div>
    
</body>
</html>