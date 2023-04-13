<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Member> memberList = (ArrayList<Member>) request.getAttribute("memberList");
	ArrayList<Member> applyList = (ArrayList<Member>) request.getAttribute("applyList");
	Class c = (Class) request.getAttribute("Class");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구성원 관리</title>
<style>
#class_wrap{
	width:60%;
	min-height:250px;
	margin: auto;
	border:  1px solid rgb(224, 224, 224);
	border-radius:10px;
	padding:50px 0px 50px 0px;
	background: rgb(249, 250, 252);
}
#searchWord{
	height:40px;
	width:30%;
	border: 2px solid rgb(57, 70, 146);
	border-radius:10px;
	margin: auto;
	margin-bottom:30px;
	padding:7px 0px 0px 10px;
	font-size:15px;
	font-weight:700;
	background: white;
	
	
}
#class_inner{
	height:130px;
	width:80%;
	border-radius:100px;
display:flex;
align-items:center;
background-color: /* rgb(240, 246, 248); */ white;
box-shadow: -5px -5px 10px 0px rgba(255, 255, 255, 0.5), 5px 5px 10px 0px rgba(0, 0, 0, 0.3);
margin: auto;
margin-bottom:20px;

}
#class_inner>*{
	margin: auto;
}
#class_img{
	width:104px;
	height: 80%;
	
}
#class_img>img{
	width:100%;
	height: 100%;
	border-radius:50%;
	object-fit:cover;
}

.update, .delete{
	background-color: rgb(57, 70, 146);
	border-radius: 10px;
	color:white;
	border: none;
	width:80px;
	height:40px;
	font-weight:550;
	margin:0;
	
}
#searchSize{
	width:70%;
	margin:auto;
	height:40px;
	font-weight:600;
}
#noSearch{
 margin:auto; 
 margin-top:40px; 
 text-align: center; 
 font-weight:600; 
}
#class_text{
		width:40%;
		font-size:20px;
		font-weight:600;
		
	}


@media only screen and (max-width: 1020px) {
#class_wrap{
	width:90%;
	min-height:250px;
	margin: auto;
	border:  1px solid rgb(224, 224, 224);
	border-radius:10px;
	padding:50px 0px 50px 0px;
}
#class_inner{
	height:130px;
	width:95%;
	border-radius:100px;
display:flex;
align-items:center;
background-color: /* rgb(240, 246, 248); */ white;
box-shadow: -5px -5px 10px 0px rgba(255, 255, 255, 0.5), 5px 5px 10px 0px rgba(0, 0, 0, 0.3);
margin: auto;
margin-bottom:20px;

	}
	#searchWord{
	height:40px;
	width:60%;
	border: 2px solid rgb(57, 70, 146);
	border-radius:10px;
	margin: auto;
	margin-bottom:30px;
	padding:7px 0px 0px 10px;
	font-size:15px;
	font-weight:700;
	background: white;
	
	
}
	
	
}

</style>
</head>
<body>
<%@include file="../board/boardFrame.jsp" %>
			
	<div id="board_area">
		<div id="album_header">
			<div id="album_area">
				<div id="album_title">구성원 관리</div>
			</div>
			<div id="album_hr">
				<hr />
			</div>
		</div>
				
					<div style="text-align:center;">
						<div style="font-weight:700; font-size:25px; padding-bottom:30px;" align= "center">클래스 회원 목록
						
							<button align="right" data-toggle="modal" data-target="#insertMember">학생 임시 계정 생성</button>
						
						</div>
						<% for(int i = 0; i < memberList.size(); i++){ %>
							<div id="class_inner"  class="<%= i %>">
								<div  id="class_img">
									<img src="<%= contextPath + memberList.get(i).getFilePath()+ memberList.get(i).getChangeName()%>" onerror="this.src='<%= contextPath %>/resources/image/noImage.png'">
								</div>
								<div id="class_text">
									<%= memberList.get(i).getUserName() %>
								</div>
								<button class="update <%= memberList.get(i).getUserNo() %>" data-toggle="modal" data-target="#updateMember">수정</button>
								<button class="delete">탈퇴</button>
							</div>
						<% } %>
					</div>
					<hr>
					<div style="text-align:center;">
						<h3>가입신청</h3>
						<div style="text-align:center;">
						<% for(int i = 0; i < applyList.size(); i++){ %>
							<div style="background-color:lightgray;width:100%;display:flex;align-items:center;border-radius:3em;">
								<div style="width:30%">
									<img src="<%= contextPath + applyList.get(i).getFilePath() + applyList.get(i).getChangeName()%>" onerror="this.src='<%= contextPath %>/resources/image/noImage.png'">
								</div>
								<div style="width:30%">
									<%= applyList.get(i).getUserName() %>
								</div>
								<button onclick="location.href='<%= contextPath%>/applyResult.c?uno=<%= applyList.get(i).getUserNo() %>&type=1'">가입</button>
								<button onclick="location.href='<%= contextPath%>/applyResult.c?uno=<%= applyList.get(i).getUserNo() %>&type=2'">거절</button>
							</div>
						<% } %>
						</div>
					</div>
				</div>
			</div>
			<div id="updateMember" class="modal fade" id="registerModal"
            tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
	            <div class="modal-dialog modal-dialog-centered modal-xl">
	               <div class="modal-content">
	                  <div class="modal-header">
	                     <h5 class="modal-title" id="modalLabel">사용자 계정 정보 수정</h5>
	                     <button type="button" class="close" data-dismiss="modal"
	                        aria-label="Close">
	                        <span aria-hidden="true">&times;</span>
	                     </button>
	                  </div>
	                  	<form id="updateDetail" action="update.me" method="POST">
		                  <div class="modal-body">
		                      <input class="detailUno" type="hidden" name="uno">
		                      <input class="detailUno" type="hidden" name="id">
		                      <div>
		                      	<img>
		                      </div>
		                      <div>이름 : <input type="text" name="userName"></div>
		                      <br>
		                      <div>자녀이름 : <input type="text" name="childName"></div>
		                      <br>
		                      <div>번호 : <input type="text" name="phone"></div>
		                      <br>
		                      <div>주소 : <input type="text" name="address"></div>
							
		                  </div>
		                  <div class="modal-footer">
		                     <button type="button" class="btn btn-secondary"
	                           data-dismiss="modal">취소</button>
	                        <button type="submit" id="btn_register" class="btn btn-primary">확인</button>
		                  </div>
	                  </form>
	               </div>
	            </div>
	         </div>
	         <div id="insertMember" class="modal fade"
            tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
	            <div class="modal-dialog modal-dialog-centered modal-xl">
	               <div class="modal-content">
	                  <div class="modal-header">
	                     <h5 class="modal-title" id="modalLabel">임시 학생 계정 생성</h5>
	                     <button type="button" class="close" data-dismiss="modal"
	                        aria-label="Close">
	                        <span aria-hidden="true">&times;</span>
	                     </button>
	                  </div>
	                  	<form id="insertDetail" action="insert.me" method="POST">
		                  <div class="modal-body">
		                      <input class="detailUno" type="hidden" name="classCode" value="<%= c.getClassCode()%>">
		                      <div>아이디 : <input type="text" name="userId"></div>
		                      <br>
		                      <div>비밀번호 : <input type="text" name="userPwd"></div>
		                      <br>
		                      <div>이름 : <input type="text" name="userName"></div>
		                      <br>
		                      <div>번호 : <input type="text" name="phone"></div>
		                      <br>
		                      <div>주소 : <input type="text" name="address"></div>
							
		                  </div>
		                  <div class="modal-footer">
		                     <button type="button" class="btn btn-secondary"
	                           data-dismiss="modal">취소</button>
	                        <button type="submit" id="btn_register" class="btn btn-primary">확인</button>
		                  </div>
	                  </form>
	               </div>
	            </div>
	         </div>
		<!-- </div> boardFrame
	</div>
</div> -->
<script>
	$(function(){
		$(".update").click(function(){
			$(this).removeClass("update");
			$(".detailUno").attr("value",$(this).attr("class"));
			let uno = $(this).attr("class");
			$(this).addClass("update");
			$.ajax({
				url : "<%=contextPath%>/classmembermanagement.c",
				method : 'POST',
   				data : { uno},
   				success : function(list){
   					console.log(list);
   					$("#updateDetail input[name=userName]").attr("value",list[1]);
   					$("#updateDetail input[name=childName]").attr("value",list[2]);
   					$("#updateDetail input[name=phone]").attr("value",list[3]);
   					$("#updateDetail input[name=address]").attr("value",list[4]);
   					$("#updateDetail input[name=id]").attr("value",list[5]);
   				},
   			 	error:function(error,status,msg){
                 alert("상태코드 " + status + "에러메시지" + msg );
                },
			});
		});
		
		$(".delete").click(function(){
			$(this).siblings("button").removeClass("update");
			let uno = $(this).siblings("button").attr("class");
			$(this).siblings("button").addClass("update");
			$.ajax({
				url : "<%=contextPath%>/classmemberdelete.c",
				method : 'POST',
   				data : { uno},
   				success : function(result){
   					if(result == "Fail"){
   						alert("탈퇴 실패");	
   					}else{
   						alert("탈퇴 성공");
   						location.reload();
   					}
   				},
   			 	error:function(error,status,msg){
                 alert("상태코드 " + status + "에러메시지" + msg );
                },
			});
		});
	});
	
</script>
</body>
</html>