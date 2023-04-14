<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<%
	Member loginUser = (Member) session.getAttribute("loginUser");
	int snsType0 = (int)request.getAttribute("snsType0");
	int snsType1 = (int)request.getAttribute("snsType1");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<style>
@media only screen and (max-width: 780px) {
	* {
		font-family: 'Gowun Dodum', sans-serif;
		font-size: 3vw;
	}
	
	.chaegepro {
		padding-left: 1em;
		width: 100%;
	}
}

@media only screen and (min-width: 780px) {
	* {
		font-family: 'Gowun Dodum', sans-serif;
		font-size: 1.125vw;
	}
	.chaegepro {
	padding-left: 1em;
	width: 80%;
	}
}

.chaegepro div {
	/* border: 1px solid red;  */
	float: left;
	text-align: center;
}

span{
	display:block; 
	width:40%;
	min-height:30px;
}

.imgDiv{
	margin: 1vw 25%; 
	width:50%;
	height:50%;
	text-align: center;
    overflow: hidden;
}

.imgDiv>img{
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.prople {
	padding-top: 120px;
	width: 28%;
}

.member {
	width: 72%;
	padding-top: 3%;
}

.phone {
	width: 72%;
	padding-top: 3%;
	margin-left: 28%;
}

.btn15 {
	padding-top: 3%;
	width: 72%;
	text-align: center;
	border: none;
	font-weight: 400;
	margin: auto;
	color: #fff;
}

.int {
	position: relative;
	min-height: 26px;
	border: none;
	background: #fff;
	font-size: 15px;
}

.box1 {
	width: 70%;
	border: solid 1px #dadada;
	box-sizing: border-box;
	background: #fff;
	position: relative;
	margin: auto;
}

#btnJoin1, #btnJoin {
	display: inline-block;
	min-width: 44px;
	padding: 2px 9px 2px;
	border-radius: 4px;
	border: solid 1px rgba(212, 216, 229, .5);
	background-color: rgba(212, 216, 229, .25);
	box-sizing: border-box;
	text-align: center;
}

.loginset {
	width: 72%;
	text-align: center;
	padding-top: 7%;
	margin-left: 28%;
}

.loginset>button{
	border: solid 1px rgba(212, 216, 229, .5);
	padding: 3% 5%;
	border-radius: 4px;
}

#btnJoin1 {
	padding: 3% 23%;
	margin: auto;
	text-align: center;
}

.modal-body>span{
	width:35% 
}
</style>

</head>
<body>
	<%@ include file="myInfoFrame.jsp"%>

	<div class="chaegepro">
		<form id="update-profile-img" action="<%=contextPath %>/updateImg.me" method="post" enctype="multipart/form-data">
			<div class="prople">
				<h3 class="title_text">프로필정보</h3>
				<div class="imgDiv">
					<img src="<%= request.getContextPath()+ loginUser.getFilePath()+loginUser.getChangeName() %>" onerror="this.src='<%= contextPath %>/resources/image/noImage.png'">
					 <div id="file-area" style="display: none;">
	                           <input type="file" id="profileImgFile" name="upfile" onchange="loadImg(this);">
	                 </div>
				</div>
				<% if(snsType0 == 0){ %>
					<%if(loginUser.getChangeName() != null){ %>
						<input type="hidden" name="changeFileName" value="<%= loginUser.getChangeName()%>">
					<%} %>
					<input type="hidden" name="uno" value="<%= loginUser.getUserNo() %>">
					<input type="submit" id="btnJoin" onclick="updateProfile();" value="변경">
					<input type="button" id="btnJoin" class="fileDelete" value="삭제">
				<% } %>
			</div>
		</form>
		<form id="update-form" action="<%=contextPath %>/update.me" method="post">
			<div class="member">
				<h3>
					<label for="id">아이디</label>
				</h3>
				<span class="box1 int_id">
					<input type="text" id="name" name="id" maxlength="20" class="int" value="<%=snsType0 ==0 ? loginUser.getUserId():"sns유저는 변경불가."%>" <%= snsType0==0?"":"readonly"  %>><br>
				</span>
			</div>
			<% if(snsType0 == 0){ %>
			<div class="btn15">
				<input type="button" id="btnJoin1" data-toggle="modal" data-target="#changePassword" value="비밀번호 변경">
			</div>
			<% } %>
			<br>
			<div class="member">
				<h3>
					<label for="id">역할 </label>
				</h3>
				<span class="box1 int_name">
					<input type="text" id="name" maxlength="20" class="int" value="<%= loginUser.getUserLevel() == 1?"선생님": loginUser.getUserLevel() == 2?"학부모":"학생" %>(수정불가)" readonly><br>
				</span>
			</div>
			<div class="phone">
				<h3>
					<label for="id">이름</label><br>
				</h3>
				<span class="box1 int_phone">
					<input type="text" id="phoneNo" name="userName" maxlength="20" class="int" value="<%= loginUser.getUserName()%>">
				</span>
			</div>
			
			<div class="phone">
				<h3>
					<label for="id">휴대전화</label><br>
				</h3>
				<span class="box1 int_phone">
					<input type="text" id="phoneNo" name="phone" maxlength="20" class="int" value="<%= loginUser.getPhone()==null ? "": loginUser.getPhone() %>">
				</span>
			</div>
			
			<div class="phone">
				<h3>
					<label for="id">주소</label><br>
				</h3>
				<span class="box1 int_phone">
					<input type="text" name="address" class="int" value="<%= loginUser.getAddress()==null ? "": loginUser.getAddress()%>" style="width:100%">
				</span>
			</div>
	
			<div class="loginset">
				<label for="loginid"><h3>로그인 계정 정보</h3></label><br> <span
					class="box1 int_login"> <input type="text" id="login"
					maxlength="20" class="int" value="<%=snsType0==0?"일반":snsType0==1?"카카오":snsType0==2?"네이버":"구글" %>가입(<%= snsType0!=0?snsType1:loginUser.getEnrollDate() %>)" readonly></span>
			</div>
			<div class="loginset">
				<button type="submit">수정</button>	
				<button type="button" onclick="deleteMember();">회원탈퇴</button>	
			</div> 
		</form>
	</div>
	<%-- 비밀번호 변경 모달창 --%>
	 <div id="changePassword" class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered">
             <div class="modal-content">
                <form id="changePwdForm" action="updatePassword.me" method="post">
                   <div class="modal-body">
                      <h3 style="display: inline-block; font-weight: 700;">비밀번호 변경</h3>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                         <span aria-hidden="true">&times;</span>
                      </button>
                      <h5>현재 비밀번호와 변경할 비밀번호를 입력하세요.</h5>
                      <span>현재 비밀번호 : </span><input type="password" name="oldPwd"><br><br>
                      <span>변경할 비밀번호 : </span><input type="password" name="newPwd"><br><br>
                      <span>비밀번호 확인 : </span><input type="password" name="pwdCheck"><br><br>
                   </div>

                   <div class="modal-footer">
                      <button type="button" class="btn btn-secondary"
                         data-dismiss="modal">취소</button>
                      <button type="button" id="btn_register" class="btn btn-primary">확인</button>
                   </div>
                </form>
             </div>
          </div>
       </div>
	<script>
		function deleteMember(){
			if(confirm("돌이킬 수 없습니다. 정말 회원탈퇴를 하시겠습니까?")){
				location.href="<%=request.getContextPath()%>/delete.me";
			}
		}
	
		
		// 파일 선택
		$(".imgDiv>img").on('click',function(){
			$("#profileImgFile").click();
		});
		
		// 파일 삭제
		$(".fileDelete").on('click',function(){
			$(".imgDiv>img").attr("src", "");
		    $("#profileImgFile").val("");
		});
		
		// 파일 변경 시 이미지 표시
		function loadImg(inputFile){
			
			if(inputFile.files.length != 0){
				
				let reader = new FileReader();
				
				reader.readAsDataURL(inputFile.files[0]);
				
				reader.onload = function(e){
					
					let url = e.target.result;
					
					$(".imgDiv>img").attr("src",url);
				}	
		
			}else {
				
				$(".imgDiv>img").removeAttr("src");
			}
		}
		
		$("#btn_register").on('click',function(){
			if($("input[name=newPwd]").val() == $("input[name=pwdCheck]").val() && $("input[name=newPwd]").val()!=""){
				$("#changePwdForm").submit();
			}else{
				alert("비밀번호가 일치하지 않습니다.");
			}
		});
	</script>

</body>
</html>