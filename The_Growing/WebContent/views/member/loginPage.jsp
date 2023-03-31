<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>loginPage</title>

    <!-- kakao login api cdn -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>    

    <!-- google login api -->
    <!-- content에 자신의 OAuth2.0 클라이언트ID를 넣습니다. -->
    <meta name ="google-signin-client_id" content="169084417109-f19btt7tlefea954g1c90s7qjo6i2u4r.apps.googleusercontent.com">

   <!-- 구글 api 사용을 위한 스크립트 -->
   <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
   
   <!-- 네이버 스크립트 -->
   <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
   
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
                <!-- <li>

                    <a id="naverIdLogin_loginButton" href="javascript:void(0)">
                        <span>네이버 로그인</span>
                    </a>
                </li> -->

                <!-- 아래와같이 아이디를 꼭 써준다. -->
                <a id="naverIdLogin_loginButton" href="javascript:void(0)">
                    <button class="start_btn" id="start_btn3">
                        <img id="naver" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20160504_295%2Fzzlidde_1462360339348GT0M2_PNG%2F2016-05-04_20.11.40.png&type=a340">
                        네이버로 시작하기
                    </button><br>
                </a>
               
                <li id="GgCustomLogin">
                    <a href="javascript:void(0)">
                     <span>Google로 시작하기</span>
                    </a>
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
                Kakao.Auth.login({
                success: function (response) {
                    Kakao.API.request({
                    url: '/v2/user/me',
                    success: function (response) {
                       
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
                },
                });
            } 
        </script>

<!--         <script>

            var naverLogin = new naver.LoginWithNaverId(
                    {
                        clientId: "AoXLANkB0ykozQKaSUNj", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
                        callbackUrl: "http://localhost:8085/growing/views/member/mainPage.jsp", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
                        isPopup: false,
                        callbackHandle: true
                    }
                );   

            naverLogin.init();

            window.addEventListener('load', function () {
                naverLogin.getLoginStatus(function (status) {
                    if (status) {
                        var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
                        // 이부분 수정해야함!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        
                        console.log(naverLogin.user); 
                        
                        if( email == undefined || email == null) {
                            alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
                            naverLogin.reprompt();
                            return;
                        }
                    } else {
                        console.log("callback 처리에 실패하였습니다.");
                    }
                });
            });


            var testPopUp;
            function openPopUp() {
                testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
            }
            function closePopUp(){
                testPopUp.close();
            }

        </script>

        <script>

            //처음 실행하는 함수
            function init() {
                gapi.load('auth2', function() {
                    gapi.auth2.init();
                    options = new gapi.auth2.SigninOptionsBuilder();
                    options.setPrompt('select_account');
                    // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
                    options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
                    // 인스턴스의 함수 호출 - element에 로그인 기능 추가
                    // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
                    gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
                })
            }
            
            function onSignIn(googleUser) {
                var access_token = googleUser.getAuthResponse().access_token
                $.ajax({
                    // people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
                    url: 'https://people.googleapis.com/v1/people/me'
                    // key에 자신의 API 키를 넣습니다.
                    , data: {personFields:'birthdays', key:'AIzaSyDDEQvcspx5BuggZOJ0k6XaYWEVyg2Oh3k', 'access_token': access_token}
                    , method:'GET'
                })
                .done(function(e){
                    //프로필을 가져온다.
                    var profile = googleUser.getBasicProfile();
                    console.log(profile)
                })
                .fail(function(e){
                    console.log(e);
                })
            }
            function onSignInFailure(t){      
                console.log(t);
            }
            </script> -->
        </div>
    
</body>
</html>