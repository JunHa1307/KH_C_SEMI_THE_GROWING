<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.member.model.vo.Member, com.kh.member.model.vo.SnsLogin"%>
<%
	Member loginUser = (Member) session.getAttribute("loginUser");
	SnsLogin snsLoginUser = (SnsLogin) session.getAttribute("snsLoginUser");
	int snsType0 = Integer.parseInt(request.getAttribute("snsType0").toString());
	String snsType1 = request.getAttribute("snsType1")+"";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Growing</title>
<link rel="shortcut icon" type="image/svg" href="<%= request.getContextPath() %>/favicon.svg"/>
<style>
	.chaegepro>* {
		font-size: 1vw;
	}
	.chaegepro {
	
	width: 80%;
	height:800px;
	margin:auto;
	border:1px rgb(224,224,224) solid;
	border-radius:10px;
	
	}

.chaegepro div {
	text-align: center;
}
.chaegepro>div{
	float: left;
	
}
span{
	display:block; 
	width:40%;
	min-height:30px;
}

.imgDiv{
	margin:auto;
	margin-bottom:20px;
	width:8vw;
	height:8vw;
	min-width:60px;
	min-height:60px;
	border-radius:50%;
	text-align: center;
    overflow: hidden;
    object-fit :cover;
    cursor: pointer;
}

.imgDiv>img{
	width: 100%;
	height: 100%;
	
	object-fit: cover;
}

.profile {
	width:100%;
}

.memberInfo {
	width: 80%;
	height:100px;
	margin:auto;
}


.btn15 {
	padding-top: 3%;
	width: 100%;
	height:100px;
	text-align: center;
	border: none;
	font-weight: 400;
	margin: auto;
	color: #fff;
}

.int {
	min-height: 26px;
	border: none;
	background: #fff;
	font-size: 0.9vw;
	width:100%;
	height:100%;
	text-align: center;
	
	
}
.int:focus{
box-shadow: 5px 5px 9px rgb(224,224,224) inset;
outline:1px solid rgb(224,224,224);
}


.box1 {
	width: 100%;
	height: 40px;
	border: solid 1px #dadada;
	box-sizing: border-box;
	background: #fff;
	margin: auto;
}


.btnJoin{

	min-width: 50px;
	min-height:30px;
	padding: 2px 9px 2px;
	border-radius: 4px;
	border: solid 1px rgba(212, 216, 229, .5);
	background-color: rgba(212, 216, 229, .25);
	box-sizing: border-box;
	text-align: center;
	box-shadow: 0px 8px 6px -6px #666;
	font-weight:600;
}



.memberInfo>button{
	border: solid 1px rgba(212, 216, 229, .5);
	padding: 3% 5%;
	border-radius: 4px;
	font-weight:600;
	background: rgba(212, 216, 229, .55);
	box-shadow: 0px 8px 6px -6px #666
}

#btnJoin1 {
	width: 80%;
	height:60px;
	border-radius: 4px;
	border: solid 1px rgba(212, 216, 229, .5);
	background-color: rgba(212, 216, 229, .25);
	box-sizing: border-box;
	text-align: center;
	font-weight:600;
	box-shadow: 0px 8px 6px -6px #666
}

.modal-body>span{
	width:35% 
}
#memberWrap>div{
	margin:auto;
}

#memberWrap{
 width:65%; 
 height:100%;
 background: rgba(212, 216, 229, .25);
 border-radius: 10px;
 padding:15px;
 box-shadow: -7px 0px 5px -1px gray ;
}
#profileWrap{
width:35%; 
 padding:15px;
 border-radius: 10px;
}
label{
	font-size:20px;
	font-weight:600;
}
.name{
	font-weight:600;
	color:grey;
	font-size:17px;
	
}
</style>

</head>
<body>
	<%@ include file="myInfoFrame.jsp"%>
	<div id="board_area">
		<div id="myclass_header">
		<div id="myclass_area">
				<div id="myclass_title">개인정보</div>
		</div>
		<div id="myclass_hr">
			<hr />
		</div>
		</div>
		<% if(snsType0 == 0){ %>
	<div class="chaegepro" style="height:800px;"  data-aos="fade-up" data-aos-duration="1000">
	<%}else{ %>
		<div class="chaegepro" style="height:731px;">
	<%} %>
	<div id="profileWrap" >
			<form id="update-profile-img" action="<%=contextPath %>/updateImg.me" method="post" enctype="multipart/form-data">
			<div class="profile">
				<label for="id" style="font-size:1.3vw;">프로필 정보</label>
				<div class="imgDiv">
					<img src="<%= snsLoginUser == null ? request.getContextPath()+ loginUser.getFilePath()+loginUser.getChangeName() : snsLoginUser.getFilePath()%>" onerror="this.src='<%= contextPath %>/resources/image/noImage.png'">
					 <% if(snsType0 == 0){ %>
					 <div id="file-area" style="display: none;">
	                           <input type="file" id="profileImgFile" name="upfile" onchange="loadImg(this);">
	                 </div>
	                 <%} %>
				</div>
				<% if(snsType0 == 0){ %>
					<%if(loginUser.getChangeName() != null){ %>
						<input type="hidden" name="changeFileName" value="<%= loginUser.getChangeName()%>">
					<%} %>
					<input type="hidden" name="uno" value="<%= loginUser.getUserNo() %>">
					<input type="submit" class="btnJoin" onclick="updateProfile();" value="변경">
					<input type="button" class="btnJoin fileDelete" value="삭제">
				<% } %>
			</div>
		</form>
	</div>
	<div id="memberWrap" >
		<form id="update-form" action="<%=contextPath %>/update.me" method="post">
			<div class="memberInfo">
					<label for="id">아이디</label>
				<span class="box1">
					<input type="text" class="int name" value="<%=snsType0 ==0 ? loginUser.getUserId():"sns유저"%>" readonly  ><br>
				</span>
			</div>
			<% if(snsType0 == 0){ %>
			<div class="btn15">
				<input type="button" id="btnJoin1" data-toggle="modal" data-target="#changePassword" value="비밀번호 변경">
			</div>
			<% } %>
			
			<div class="memberInfo">
					<label for="id">역할 </label>
				<span class="box1">
					<input type="text" class="int name" value="<%= loginUser.getUserLevel() == 1?"선생님": loginUser.getUserLevel() == 2?"학부모":"학생" %>" readonly><br>
				</span>
			</div>
			<div class="memberInfo">
					<label for="id">이름</label><br>
				<span class="box1">
					<input type="text" name="userName" class="int" value="<%= loginUser.getUserName()%>">
				</span>
			</div>
			
			<div class="memberInfo">
				
					<label for="id">휴대전화</label><br>
				
				<span class="box1">
					<input type="text" name="phone" class="int" value="<%= loginUser.getPhone()==null ? "": loginUser.getPhone() %>">
				</span>
			</div>
			
			<div class="memberInfo">
					<label for="id">주소</label><br>
				<span class="box1">
					<input type="text" name="address" class="int" value="<%= loginUser.getAddress()==null ? "": loginUser.getAddress()%>">
				</span>
			</div>
	
			<div class="memberInfo">
				<label for="loginid">로그인 계정 정보</label><br> <span
					class="box1"> <input type="text" 
					maxlength="20" class="int" value="<%=snsType0==0?"일반":snsType0==1?"카카오":snsType0==2?"네이버":"구글" %>가입(<%= snsType0!=0?snsType1:loginUser.getEnrollDate() %>)" readonly></span>
			</div>
			<div class="memberInfo">
				<button type="submit">수정</button>	
				<button type="button" onclick="deleteMember();">회원탈퇴</button>	
			</div> 
		</form>
	</div>
	
		
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
       </div>
          </div>
             </div>
                </div>
	<script>
	$(function(){
        $("#myInfo").css("fontWeight","700").fadeIn(1000);
        $("#myInfo").children().css("background","rgb(237, 239, 243)");
	});
		function deleteMember(){
			 if($(".box1").eq(5).children("input").val().includes("일반")){
				 Swal.fire({
	                 title: '탈퇴하시겠습니까?',
	                 text: "",
	                 icon: 'warning',
	                 showCancelButton: true,
	                 confirmButtonColor: '#3085d6',
	                 cancelButtonColor: '#d33',
	                 confirmButtonText: '삭제',
	                 cancelButtonText: '취소'
	             }).then((result) => {
	                 if (result.isConfirmed) {
	                	 location.href="<%=request.getContextPath()%>/delete.me";
	                     
	                 }
	             })
			 }else {
				 error("sns회원은 따로 sns에서 로그인 접근 권한을 취소하시기 바랍니다.")
			 }
		};

		
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
				warn("비밀번호가 일치하지 않습니다.");
			}
		});
	</script>

</body>
</html>