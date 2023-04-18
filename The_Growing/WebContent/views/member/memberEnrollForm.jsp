<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	String contextPath = request.getContextPath(); 
	Member loginUser = (Member) session.getAttribute("loginUser");
	String alertMsg = (String) session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Growing</title>
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">


<style>
    	* {
			font-family: 'Noto Sans KR', sans-serif;
		  }
		  div{
		  	/* border: 1px solid red; */
		  }
html {
    height: 100%;
}

/* body {
    margin: 0;
    height: 100%;
	background-repeat : no-repeat;
    background-size : cover;
    background-image: linear-gradient( rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3) ), url('resources/image/forest.jpg');
	
} */
#logo {
    width: 500px;
    height: 200px;
    cursor: pointer;
}

#header {
    padding-top: 0px;
    padding-bottom: 0px;
    text-align: center;
}
#wrapper {
    /* position: relative; */
  	/*   height: 100%; */
  	border-radius: 20px;
  	 display: flex;
  	justify-content: center;
	align-items: center;
	box-sizing: border-box;
	display: ;
}

#content {
    position: absolute;
    left: 50%;
    transform: translate(-50%);
    width: 480px;
    height: 800px;
    
}




/* 입력폼 */


.join_title {
    margin: 19px 0 8px;
    font-size: 14px;
    font-weight: 700;
}


.box {
    display: block;
    width: 100%;
    height: 51px;
    border: solid 1px #dadada;
    padding: 10px 14px 10px 14px;
    box-sizing: border-box;
    background: #fff;
    position: relative;
}

input {
    font-family: 'Gowun Dodum', sans-serif;
}

.int {
    display: block;
    position: relative;
    width: 100%;
    height: 29px;
    border: none;
    background: #fff;
    font-size: 15px;
}

.box.int_id {
    padding-right: 110px;
}

.box.int_pass {
    padding: 10px 93px 10px 14px;
}

.box.int_pass_check {
    padding-right: 40px;
}

.step_url {
   
    position: absolute;
    top: 16px;
    right: 13px;
    font-size: 15px;
    color: #8e8e8e;
    line-height: 18px; 
}

.pswdImg {
    width: 18px;
    height: 20px;
    
    position: absolute;
    top: 50%;
    right: 16px;
    margin-top: -10px;
    
}



.sel {
    width: 100%;
    height: 29px;
    font-size: 15px;
    background-size: 20px 8px;
    -webkit-appearance: none;

}

select {
    display: inline-block;
    text-align: start;
    border: none;
    cursor: default;
   
}

/* 에러메세지 */

.error_next_box {
    display: block;
    margin: 9px 0 -2px;
    font-size: 12px;
    line-height: 14px;
    color: red;    
    display: none;
}

#alertTxt {
    display: inline-block;
    position: absolute;
    top: 19px;
    right: 38px;
    font-size: 12px;
    color: red;
    visibility: hidden;
}

/* 버튼 */

.btn_area {
    margin: 30px 0 91px;
}

#btnJoin {
    color: #fff;
    background-color: #095e04;
    display: block;
    width: 45%;
    
    padding: 21px 0px 17px;
    font-size: 20px;
    text-align: center;
    cursor: pointer;
    font-weight: 400;
    border: 0;
    font-family: 'Gowun Dodum', sans-serif;
    float : left;
    
}
div{
    /* border: 1px solid red; */
}

#header>h1{
	font-size: 80px;
    text-align: center;
      		font-weight: bold;
      		color: rgb(19, 94, 54);
      		margin-top: 20px;
      		margin-left: 50px;
}
#enroll-form, #signTxt{
	background-color: white;
}
#enroll-form{
	width: 700px;
	height:700px;
	border-radius: 20px;
}
#signTxt{
	font-size: 40px;
	border-radius: 20px;
	margin: 10px 20px;
	width: 400px;
}
#enroll-form>table{
	margin: auto;
	width: 500px;
	
}
input{
	width: 200px;
    height: 30px;
	border-color: rgb(161, 160, 160);
    border-radius: 500px;
    border-style: solid;
    background-size: 45px; 
    background-repeat: no-repeat;
    background-position: left; 
    text-align: center;
	margin-top: 10px;
}
td{
	font-size: 20px;
}
#idCheckBtn{
	border-radius: 50%;
	width: 40px;
	height: 40px;
	margin-top: 10px;
	cursor: pointer;
	border: none;
	background-color: rgb(19, 94, 54);
}

/* 화상표 체크 아이콘 확대 넣기 */
#idCheckBtn>img:hover{
	
}
#submit{
	color: white;
	background-color: darkblue;
	align-items: center;
}
#reset{
	border: 1px solid darkblue;
	margin-left: 100px;
}
#submit, #reset{
	
	width: 120px;
	height: 40px;
	border-radius: 20px;
	cursor:pointer;
}

@import url(https://fonts.googleapis.com/css?family=Oswald);
@import url(https://fonts.googleapis.com/css?family=Quattrocento);
.snip1361 {
  font-family: 'Quattrocento', Arial, sans-serif;
  position: relative;
  overflow: hidden;
  margin: 10px;
  
  width: 1920px;
  height: 1057px;
  color: #141414;
  text-align: left;
  line-height: 1.4em;
  font-size: 16px;
}
.snip1361 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
}
.snip1361 img {
  max-width: 100%;
  vertical-align: top;
}
.snip1361 figcaption {
  position: absolute;
  top: calc(77%);
  width: 100%;
  background-color: #ffffff;
  padding: 15px 25px 65px;
}
.snip1361 figcaption:before {
  position: absolute;
  content: '';
  z-index: 2;
  bottom: 100%;
  left: 0;
  width: 100%;
  height: 80px;
  background-image: -webkit-linear-gradient(top, transparent 0%, #ffffff 100%);
  background-image: linear-gradient(to bottom, transparent 0%, #ffffff 100%);
}
.snip1361 h3,
.snip1361 p {
  margin: 0 0 10px;
}
.snip1361 h3 {
  font-weight: 300;
  font-size: 1.4em;
  line-height: 1.2em;
  font-family: 'Oswald', Arial, sans-serif;
  text-transform: uppercase;
}
.snip1361 p {
  font-size: 0.9em;
  letter-spacing: 1px;
  opacity: 0.9;
}
.snip1361 a {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  z-index: 2;
}
.snip1361:hover figcaption,
.snip1361.hover figcaption {
  top: 80px;
}
.inputTitle{
	padding-top:10px;
}
</style>
</head>
<body>
	<figure class="snip1361">
	
		<img src="resources/image/enrollform2.jpg" />
		<figcaption>
		
		
	<div id="header">
		<h1 id="goFirst" style="color:black; font-weight: 900; margin-bottom: 0px;">THE GROWING</h1>
		
		<br><br><br><br><br>
		<span id="signTxt">회원가입</span>
		
	</div>
	<br><br>
	
	<div id="wrapper">
		<form id="enroll-form" action="<%=contextPath %>/insert.me" method="post">
	            <table>
	                <!-- (tr>td*3)*8 -->
	                <tr>
	                    <td class="inputTitle">아이디</td>
	                    <td><input type="text" id="userId" name="userId" maxlength="12" required></td>
	                    <td>
	                    	<button id="idCheckBtn" type="button" onclick="idCheck();">
	                    		<img style="width: 20px;" src="resources/image/whiteCheckIc.png">
	                    	</button>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="inputTitle">비밀번호</td>
	                    <td><input type="password" name="userPwd" maxlength="15" required></td>
	                    <td></td>
	                </tr>
	                <tr>
	                    <td class="inputTitle">비밀번호 확인</td>
	                    <td><input type="password" name="userPwdCheck" maxlength="15" required></td> <!-- 단순 비교 확인 용도라 key 값을 부여 안해도 됨 -->
	                    <td></td>
	                </tr>
	                <tr>
	                    <td class="inputTitle">이름</td>
	                    <td><input type="text" name="userName" maxlength="6" required></

>
	                    <td></td>
	                </tr>
	                <tr>
	                    <td class="inputTitle">전화번호</td>
	                    <td><input type="text" name="phone" placeholder="- 없이 입력 가능"><td>
	                    <td></td>
	                </tr>
	                <tr>
	                    <td class="inputTitle">주소</td>
	                    <td><input type="text" name="address"></td>
	                    <td></td>
	                </tr>
	            </table>
	            
	            <br><br><br><br>
	            <div style="text-align:center;">전화번호 및 주소는 선택사항 입니다</div>
	            <br>
	            <div align="center">
	            	<button id="submit" type="submit" disabled>회원가입</button>
	            	<button id="reset" type="reset">취소</button>
	            </div>
	            <br><br>
		</form>
		
		
	</div>
<!-- 	<figure class="snip1361"><img src="https://bit.ly/2NZ6ahm" />
		
		  <figcaption>
		  	<h3>THE GROWING</h3>
		    <h2>회원가입</h2>
		    <p>The only skills I have the patience to learn are those that have no real application in life. </p>
		  </figcaption>
		  <a href="#"></a> -->
	
	
	<script>
	/* Demo purposes only */
		$(".hover").mouseleave(
		  function () {
		    $(this).removeClass("hover");
		  }
		);

	</script>
	
	<script>
		function idCheck(){
			// 아이디를 입력하는 input 요소 얻어오기.
			// #enroll-form [name=userId]
			// name이 userId인 요소가 menubar.jsp에서도 존재하므로, 확실하게 어디에 속해있는지 잘 적어줘야한다.
			// id값을 설정하는 것보다 #enroll-form [name=userId]와 같이 명확히 제시하는것이 좋음
			let userId = $("#userId").val();
			
			// 비동기 요청 보내기
			$.ajax({
				url : "<%= contextPath %>/idCheck.me",
				data : {userId},
				success : function(result){
					
					if(result > 0){
						// 이미 존재하는 아이디인 경우
						alert("이미 존재하거나 회원탈퇴한 아이디입니다.");
						userId.focus();
					
					} else {
						console.log(userId);
						// 사용가능한 경우
						// confirm() 의 반환값은 true/false
						if(confirm("사용 가능한 아이디입니다. 사용 하시겠습니까?")){
							
							// 아이디값 수정할 수 없게 막기
							$("#userId").attr("readonly", true);
							
							// (그이전까지는 회원가입 불가능) 회원가입 버튼 활성화
							// #enroll-form :submit
							$("#submit").removeAttr("disabled");
							
						} else{
							$("#userId").val("");
							$("#userId").focus();
						}
						
					}

				},
				error : function(){
					console.log("아이디 중복체크 실패");
				}
					
			});
		}
		
		/* 비밀번호 확인 */
		$("#submit").click(function(){
			let userPwd = $("#enroll-form [name=userPwd]").val();
			let userPwdCheck = $("#enroll-form [name=userPwdCheck]").val();
			
			if(userPwd != userPwdCheck){
				$("#enroll-form [name=userPwdCheck]").val("");
				$("#enroll-form [name=userPwdCheck]").focus();
				alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요^^");
			}
		});
		$("#goFirst").click(function(){
			location.href="<%= contextPath %>";
		});
	</script>
	 </figcaption>
	</figure>
</body>
</html>