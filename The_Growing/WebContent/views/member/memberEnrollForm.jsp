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
<title>회원가입 폼</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
	
	#enroll-form table{margin:auto;}
	#enroll-form input{margin:5px;}
	
</style>
</head>
<body>
	<!--  ../ : 현재 위치로부터 한번 빠져나감(상위 디렉토리로 이동) -->
	<div class="outer">
		<br>
		<h2 align="center">The Growing 회원가입</h2>
		<form id="enroll-form" action="<%=contextPath %>/insert.me" method="post">
	            <table>
	                <!-- (tr>td*3)*8 -->
	                <tr>
	                    <td>* 아이디</td>
	                    <td><input type="text" id="userId" name="userId" maxlength="12" required></td>
	                    <td><button type="button" onclick="idCheck();">중복확인</button></td>
	                </tr>
	                <tr>
	                    <td>* 비밀번호</td>
	                    <td><input type="password" name="userPwd" maxlength="15" required></td>
	                    <td></td>
	                </tr>
	                <tr>
	                    <td>* 비밀번호 확인</td>
	                    <td><input type="password" name="userPwdCheck" maxlength="15" required></td> <!-- 단순 비교 확인 용도라 key 값을 부여 안해도 됨 -->
	                    <td></td>
	                </tr>
	                <tr>
	                    <td>* 이름</td>
	                    <td><input type="text" name="userName" maxlength="6" required></td>
	                    <td></td>
	                </tr>
	                <tr>
	                    <td>&nbsp;&nbsp;휴대전화</td>
	                    <td><input type="text" name="phone" placeholder="- 없이 입력 가능"><td>
	                    <td></td>
	                </tr>
	                <tr>
	                    <td>&nbsp;&nbsp;주소</td>
	                    <td><input type="text" name="address"></td>
	                    <td></td>
	                </tr>
	            </table>
	            
	            <br><br>
	            
	            <div align="center">
	            	<button id="submit" type="submit" disabled>회원가입</button>
	            	<button type="reset">취소</button>
	            </div>
	            <br><br>
		</form>
	
	</div>
	
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
	</script>
	
</body>
</html>