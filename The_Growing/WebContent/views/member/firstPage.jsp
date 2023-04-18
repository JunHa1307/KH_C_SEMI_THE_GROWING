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
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <style>
    	* {
			font-family: 'Noto Sans KR', sans-serif;
		  }
        div {
            box-sizing: border-box;
            /* border: 1px solid red; */
        }
         
        html, body {
            width: 100%;
            height: 100%;    
            margin: 0;     
        }
        .wrap {
			background-image : url('resources/image/mainEx.jpg');
			background-repeat : no-repeat;
        	background-size : cover;
            width: 100%;
            height: 1076.7px;
            overflow-y: scroll;
        }
        .wrap::-webkit-scrollbar {
		   display: none;
		}
        #header {
            height: 20%;
        }
        
        #logo {
            height: 100%;
           
            display: inline-flex;
        }
        #content {
            height: 65%;
            width: 100%;
            
        }
        #footer div{
        	float: left;
        }
        
		.backgroundW{
			margin-left: 135px;
			width: 300px;
			background-color: rgba(263,230,204, 0.6);
			border-radius: 10px;
			padding-top: 20px;
		}
        #content_1{
        	color:white;
            width: 30%;
            height: 90%;
            float: left;
            margin-top: 40px;
             text-align : center;
 			 padding : 100px 0;
        }

        #content_2{
           height: 100%;
           float: left;
           width: 70%;
        }

        /* #grow_btn {
        	margin-top: 5px;
        	margin-left: 10px;
        	background-color: rgb(19, 94, 54);
            border-radius: 100%;
            width: 33px;
            height: 33px;
            border : none;
            cursor: pointer;
        	display: block;
        } */

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
            border: none;  
            margin: 1%;
            /* background-color: white; */
            background-color: #ffffff;
        	background-color: rgba( 255, 255, 255, 0.5 );
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
        #text1, .backgroundW{animation: fadeInUp 1s; font-weight: 600;}
        #text2{animation: fadeInUp 2s; font-weight: 600;}
        #text3{animation: fadeInUp 3s; font-weight: 700;}
        #text4{animation: fadeInUp 3.5s; font-weight: 800;}
        #teacher{animation: fadeInUp 1s;}
        #parent{animation: fadeInUp 2s;}
        #student{animation: fadeInUp 3s;}
        
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
        	float:left;
        	margin-left: 135px;
        	margin-top: 10px;
        	border-radius: 10px;
        	background-color: white;
        	width: 300px;
        	display: inline-flex;
        }
        .mainTitle{
        	font-size: 30px;
        	font-weight: bold; 
        }
        @keyframes ball {
		  0% {
		    top:0px;
		  }
		  95% {
		    width: 40px;
		  }
		  to {
		    top:15px;
		  } 
		}
		
		#grow_btn{
		  position:relative;
		  top:0;
        	margin-left: 10px;
        	background-color: rgb(19, 94, 54);
            border-radius: 100%;
            width: 33px;
            height: 33px;
            border : none;
            cursor: pointer;
        	display: block;
		  border-radius:50%;
		  animation:ball 1s ease-in Infinite Alternate;
		}
		.outline{position: relative; 
			border: 1px solid #ccc;}
		
		.outline span{position: absolute; background: rgb(0, 86, 102); transition: all 0.5s;}
		
		.outline span:nth-child(1) {left: 0; top: 180px; width: 0; height: 5px; }
		.outline span:nth-child(2) {left: 500px; top: 180px; bottom: 180px; width: 5px; height: 0;}
		.outline span:nth-child(3) {right: 0; bottom: 155px; width: 0; height: 5px; }
		
		.outline:hover span:nth-child(1) {width: 100%;}
		.outline:hover span:nth-child(2) {height: 100%;}
		.outline:hover span:nth-child(3) {width: 100%;}
				
		.mainDt{
			
			font-weight: 400;
		}
		#footer{
			width: 100%;
			height: 15%;
			background-color: #ffffff;
        	background-color: rgba( 255, 255, 255, 0.5 );
		}
		#footer>div{
			float:left;
		}
		#developerW{
			margin-top: 30px;
			margin-left: 40px;
			width: 30%;
		}
		#developerW>div{
			margin-left: 10px;
		}
		#gitBtn{
			background-color: black;
			color: white;
			border: none;
			border-radius: 20px;
		}
    </style>
</head>

<body>
    <div class="wrap outline">
    	
        <div id="header">
            <div id="logo">
                <img id="logo_img" src="resources/image/treelogo.png">
                <div id="logo_txt">THE GROWING</div>
                
            </div>
        </div>
        <span></span>
        <span></span>

        <div id="content">
            <div id="content_1">
                <div class="backgroundW">
                	<h1 id="text1">학교 소식부터</h1>
	                <h1 id="text2">스터디까지</h1><br>
	                <h1 id="text3">우리의 성장 기록</h1><br><br>
                </div>
                <div id="text4" class="btnWrap">
                	<h1 style="color:rgb(19, 94, 54); font-weight: 900; margin-left:20px;">THE GROWING</h1>
                	<button id="grow_btn"><img src="resources/image/rightWhiteIcon.png" style="width:18px;"></button>
                </div>
            </div>
			
            <div id="content_2">
                <div class="btn">
                    <button class="c_btn" id="teacher">
                        <div id="img_area">
                            <img src="resources/image/teacherIc2.png" style="margin-top: 70px; margin-right: 20px; width: 200px; height: 200px;">
                        </div>
                       
                        <div>
                            <div class="mainTitle">선생님</div>
                            <br>
                            <div class="mainDt">선생님으로 클래스를 만들어보세요</div>
                        </div>
                    </button>

                    <button class="c_btn" id="parent">
                        <div id="img_area">
                            <img src="resources/image/parents-removebg-preview.png" style="margin-top: 70px; margin-left: 20px; width: 220px; height: 220px;">
                        </div>
					
                        <div>
                            <div class="mainTitle">학부모</div><br>
                            <div class="mainDt">자녀가 있는 학부모</div>
                        </div>
                    </button>

                    <button class="c_btn" id="student">
                        <div id="img_area">
                            <img src="resources/image/student_custom.png" style="margin-top: 90px; margin-left: 20px; width: 200px; ">
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
        <div id="footer">
        	<span></span>
        	<div id="developerW">
        		<div id="developer" style="font-weight: 700; width: 100px; margin-left: 10px;">Developer</div><div style="font-weight: 500; width: 150px;">OH HYUNJI<br>RYU JUNHA<br>JANG HAEUN</div><div style="font-weight: 500; width: 200px;">LEE CHOONGYOONG<br>OH MINSEOK</div>      	
        	</div>
        	<br><br><br><br><br>
        	<button id="gitBtn" type="button" style="margin-left: 45px;">GitHub</button>
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
    	
    	$("#gitBtn").click(function(){
    		window.open("https://github.com/JunHa1307/KH_C_SEMI_THE_GROWING", "_blank");
    	});
    </script>
    
</body>
</html>