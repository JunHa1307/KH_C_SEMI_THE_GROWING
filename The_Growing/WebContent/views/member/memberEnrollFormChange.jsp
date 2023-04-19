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
<link rel="shortcut icon" type="image/svg" href="<%= request.getContextPath() %>/favicon.svg"/>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<style>
* {
	font-family: 'Gowun Dodum', sans-serif;
}
html {
    height: 100%;
}

body {
    margin: 0;
    height: 100%;
    background: #f5f6f7;
    
}
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
    position: relative;
  /*   height: 100%; */
    
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
</style>
</head>
<body>
	
	<!--  ../ : 현재 위치로부터 한번 빠져나감(상위 디렉토리로 이동) -->
	<div id="header">
		<a href="https://www.hiclass.net/" target="_blank"
			title="클래스 회원가입 페이지 보러가기"><img src="<%=contextPath %>/resources/image/로고2.png"
			id="logo"></a>
	</div>


	<!-- wrapper -->
	<div id="wrapper">

		<!-- content-->
		<div id="content">

			<!-- ID -->
			<div class="join_row">
				<h3 class="join_title">
					<label for="id">아이디 *</label>
				</h3>
				<span class="box int_id"> <input type="text" id="id" class="int" maxlength="12" onkeyup="idCheck()" action="<%=contextPath %>/insert.me" method="post">
					 <img src="<%=contextPath %>/resources/image/V.JPG" id="pswd1_img1" class="pswdImg">
					<img src="<%=contextPath %>/resources/image/X.JPG" id="pswd1_img2" class="pswdImg">
					<br>
				</span> 
				<span class="error_next_box" id="idMsg">필수 정보입니다.</span>

			</div>

			<!-- PW1 -->
			<div class="join_row">
				<h3 class="join_title">
					<label for="pswd1">비밀번호 *</label>
				</h3>
				<span class="box int_pass"> <input type="password" id="pswd1" class="int" maxlength="20"> <span id="alertTxt">사용불가</span>

				</span> <span class="error_next_box" , id="pswd1Msg">필수
					정보입니다.</span>
			</div>

			<!-- PW2 -->
			<div class="join_row">
				<h3 class="join_title">
					<label for="pswd2">비밀번호 재확인 *</label>
				</h3>
				<span class="box int_pass_check"> <input type="password"
					id="pswd2" class="int" maxlength="20">

				</span> <span class="error_next_box" id="pswd2Msg">필수
					정보입니다.</span>
			</div>

			<!-- NAME -->
			<div class="join_row">
				<h3 class="join_title">
					<label for="name">이름 *</label>
				</h3>
				<span class="box int_name"> <input type="text" id="name"
					class="int" maxlength="20">
				</span> <span class="error_next_box" id="nameMsg">필수 정보입니다.</span>
			</div>

			<!-- EMAIL -->
			<div class="join_row">
				<h3 class="join_title">
					<label for="email">본인확인 이메일<span class="optional">(선택)</span></label>
				</h3>
				<span class="box int_email"> <input type="text" id="email"
					class="int" maxlength="100" placeholder="선택입력">
				</span> <span class="error_next_box" id="emailMsg">이메일 주소를 다시
					확인해주세요.</span>
			</div>

			<!-- MOBILE -->
			<div class="join_row">
				<h3 class="join_title">
					<label for="phoneNo">휴대전화(선택)</label>
				</h3>
				<span class="box int_mobile"> <input type="tel" id="mobile"
					class="int" maxlength="16" placeholder="- 포함해서 입력">
				</span> <span class="error_next_box" id="mobileMsg">필수 정보입니다.</span>
			</div>

			<br>
			<br>

			<!-- JOIN BTN-->
			<div align="center">
				<button type="submit" id="btnJoin" disabled>회원가입</button>
				<button type="reset" id="btnJoin" style="margin-left: 45px;">초기화</button>
			</div>
		</div>



	</div>
	<!-- content-->

	</div>
	<!-- wrapper -->
	
	<script>
		
            $("#pswd1_img2").css("display" ,  "none");
            $("#pswd1_img1").css("display" ,  "none");
            
            function idCheck(){
                
                // 아이디를 입력하는 input 요소 얻어오기
                const $userId = $("#id");
                // name이 userId인 요소가 menubar.jsp에서도 존재하므로, 확실하게 어디에 속해있는지 잘 적어줘야한다
                
                // 비동기 요청 보내기    
                $.ajax({
                    url : "<%=contextPath%>/idCheck.me",
                    data : {userId : $userId.val()},
                    success : function(result){
                        if(result == 'NNNNN'){
                            /* $("#id").val('').focus(); */
                            $("#pswd1_img2" ).css("display" ,  "block");
                            $("#pswd1_img1").css("display" ,  "none");
                            
                            
                            $("#enroll-form :submit").attr("disabled", 'disabled');
                            
                        }else{
                            
                            $("#pswd1_img1" ).css("display" ,  "block");
                            $("#pswd1_img2").css("display" ,  "none");
                            
    
                            $("#enroll-form :submit").removeAttr("disabled");
                         
                        
                        }
                        
                        /* 	if(result == 'NNNNN'){
                        // 이미 존재하는 아이디인경우
                                alert("이미 존재하거나 회원 탈퇴한 아이디입니다");
                                    
                            }else{ */
                                
                        
                        // 사용가능한경우
                        /* 
                            if(confirm("사용 가능한 아이디입니다. 사용하시겠습니까?")){
                            // 아이디값 수정할수없게 막기 
                            
                            $userId.attr("readonly", true);//아이디값 확정
                            // 회원가입버튼 활성화
                            
                            $("#enroll-form :submit").removeAttr("disabled");//회원가입 버튼 활성화
                            
                        }else{//사용안함
                            $userId.val("");
                            $userId.focus();
                                }
                            } */
                            
                        },
        
                    error : function(){
                        console.log("아이디 중복 체크 실패");
                    }							
                    
                })	
            }
         
        	  
        		  
            </script>
        

</body>
</html>