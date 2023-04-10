<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Member> memberList = (ArrayList<Member>) request.getAttribute("memberList");
	Class c = (Class) request.getAttribute("Class");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구성원 관리</title>
<style>

</style>
</head>
<body>
<%@include file="../board/boardFrame.jsp" %>
			<div id="board_area">
				<div>
					<h2><b>구성원 관리<b></b></h4>
					<hr>
					<div style="text-align:center;">
						<h3><span style="font-weight:700;">클래스 회원 목록</span></h3>
						<div style="float:right;">
							<button>학생 임시 계정 생성</button>
						</div>
						<% for(int i = 0; i < memberList.size(); i++){ %>
							<div class="<%= i %>" style="background-color:lightgray;width:100%;display:flex;align-items:center;border-radius:3em;">
								<div style="width:30%">
									<img src="<%= contextPath + memberList.get(i).getFilePath()+ memberList.get(i).getChangeName()%>" onerror="this.src='<%= contextPath %>/resources/image/noImage.png'">
								</div>
								<div style="width:30%">
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
							<div style="background-color:lightgray;width:100%;display:flex;align-items:center;border-radius:3em;">
								<div style="width:30%">
									<img src="<%= contextPath%>/resources/image/bono.jpg">
								</div>
								<div style="width:30%">
									학생이름
								</div>
								<button>수정</button>
								<button>탈퇴</button>
							</div>
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