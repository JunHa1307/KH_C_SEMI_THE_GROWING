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
<title>The Growing</title>
<link rel="shortcut icon" type="image/svg" href="<%= request.getContextPath() %>/favicon.svg"/>
<style>
.classListWrap{
	padding-bottom: 20px;
	min-height:200px;
	max-height:520px;
	overflow-y: scroll;
}

.classListWrap::-webkit-scrollbar {
    width: 10px;  
}
  .classListWrap::-webkit-scrollbar-thumb {
    background: rgb(237, 237, 240);
    border-radius: 10px;
  }
  .classListWrap::-webkit-scrollbar-track {
    background: white;
    border-radius: 10px;
  }

#class_inner {
	height: 80px; width : 85%;
	border-radius: 100px;
	display: flex;
	align-items: center;
	background-color:  rgb(249, 245, 246);
	box-shadow: -5px -5px 7px 0px rgba(255, 255, 255, 0.5), 3px 3px 7px
		0px rgba(0, 0, 0, 0.3);
	margin: auto;
	margin-bottom: 20px;
	width: 85%;
}
#class_inner2 {
	height: 80px; width : 85%;
	border-radius: 100px;
	display: flex;
	align-items: center;
	background-color:  rgb(250, 248, 241);
	box-shadow: -5px -5px 7px 0px rgba(255, 255, 255, 0.5), 3px 3px 7px
		0px rgba(0, 0, 0, 0.3);
	margin: auto;
	margin-bottom: 20px;
	width: 85%;
}

.class_img {
	width: 4vw;
	min-width: 60px;
	min-height: 60px;
	height: 4vw;
	margin: auto;
}

.class_img>img {
	width: 100%;
	height: 100%;
	border-radius: 50%;
	object-fit: cover;
}

.btnCss  {
	background-color: rgb(57, 70, 146);
	border-radius: 10px;
	color: white;
	border: none;
	width: 80%; height : 40px;
	font-weight: 550;
	margin: 0;
	height: 35px;
	box-shadow: 0px 8px 6px -6px #666;
}


.class_text {
	width: 40%;
	font-size: 17px;
	font-weight: 600;
}

.btnn {
	width: 18%;
}

.title {
	width: 100%;
	height: 70px;
	font-size: 20px;
	font-weight: 600;
	text-align: center;
	position: relative;
	top: 10px;
}

.studentAccount {
	position: absolute;
	top: 0;
	bottom: 10px;
	left: 77%;
	width: 22%;
	font-size: 0.9vw;
	background-color: rgb(57, 70, 146);
	border-radius: 10px;
	color: white;
	border: none;
	height: 40px;
	font-weight: 550;
	margin: 0;
	box-shadow: 0px 8px 6px -6px #666;
}
.modal-body>table{
	margin: auto;
}
.modal-body>table>tbody>tr>td{
	padding:5px;
}
.modal-body>table>tbody>tr>td>input{
	width:100%;
}


</style>
</head>
<body>
	<%@include file="../board/boardFrame.jsp"%>

	<div id="board_area">
		<div id="album_header">
			<div id="album_area">
				<div id="album_title">구성원 관리</div>
			</div>
			<div id="album_hr">
				<hr />
			</div>
		</div>

		<div class="classListWrap" >
			<div class="title">
				클래스 회원 목록
				<button class="studentAccount" data-toggle="modal"
					data-target="#insertMember">학생 임시 계정 생성</button>
			</div>
			<div style="padding-left:10%; padding-bottom:20px; font-weight:600">총 <%=memberList.size() %>명</div>
			<%
				for (int i = 0; i < memberList.size(); i++) {
					String filePath = memberList.get(i).getFilePath();
					String changeName = memberList.get(i).getChangeName();
			%>
			<div id="class_inner" class="<%=i%>">
				<div class="class_img">
					<% if("ISSNSMEMBERATTACHMENT".equals(filePath)){ %>
						<img src="<%= changeName%>">	
					<% }else { %>					
						<img src="<%= contextPath + filePath + changeName%>" onerror="this.src='<%=contextPath%>/resources/image/noImage.png'">
					<% } %>
				</div>
				<div class="class_text">
					<%=memberList.get(i).getUserName()%> <%=memberList.get(i).getUserLevel() ==1 ? "선생님" : memberList.get(i).getUserLevel() ==2 ? "부모님" :  "학생"   %>
				</div>
				<div class="btnn">
					<button  class="btnCss update" data-uno="<%=memberList.get(i).getUserNo()%>" 
						data-toggle="modal" data-target="#updateMember">수정</button>
				</div>
				<div class="btnn">
					<button  class="btnCss delete" data-uno="<%=memberList.get(i).getUserNo()%>">탈퇴</button>
				</div>
			</div>
			<%
				}
			%>
		</div>
		<hr>
		<div class="classListWrap" >
			<div class="title">가입 신청</div>
			<div style="padding-left:10%; padding-bottom:20px; font-weight:600">총 <%=applyList.size() %>건</div>
				<%
					for (int i = 0; i < applyList.size(); i++) {
				%>
				<div id="class_inner2">
					<div class="class_img">
						<img
							src="<%= contextPath + applyList.get(i).getFilePath() + applyList.get(i).getChangeName()%>"
							onerror="this.src='<%=contextPath%>/resources/image/noImage.png'">
					</div>
					<div class="class_text">
						<%=applyList.get(i).getUserName()%> <%=applyList.get(i).getUserLevel() ==1 ? "선생님" : applyList.get(i).getUserLevel() ==2 ? "부모님" :  "학생"   %>
					</div>
					<div class="btnn">
					<button class="btnCss"
						onclick="location.href='<%=contextPath%>/applyResult.c?uno=<%=applyList.get(i).getUserNo()%>&type=1'">가입</button>
					</div>
					<div class="btnn">
					<button class="btnCss"
						onclick="location.href='<%=contextPath%>/applyResult.c?uno=<%=applyList.get(i).getUserNo()%>&type=2'">거절</button>
					</div>
				</div>
				<%
					}
				%>
			</div>
		</div>
	</div>
	</div>
	<div id="updateMember" class="modal fade" id="registerModal"
		tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
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
						<table width=350>
						<tr>
							<td >이름 </td>
							<td>:</td>
							<td><input type="text" name="userName"> </td>
						</tr>
						<tr >
							<td >자녀 이름 </td>
							<td>:</td>
							<td ><input type="text" name="childName"> </td>
						</tr>
						<tr >
							<td >번호 </td>
							<td>:</td>
							<td ><input type="text" name="phone"> </td>
						</tr>
						<tr >
							<td >주소 </td>
							<td>:</td>
							<td ><input type="text" name="address"> </td>
						</tr>
					
						</table>
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
	<div id="insertMember" class="modal fade" tabindex="-1"
		aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
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
						<input class="detailUno" type="hidden" name="classCode"
							value="<%=c.getClassCode()%>">
							
						<table width=350>
						<tr>
							<td >아이디 </td>
							<td>:</td>
							<td><input type="text" name="userId"> </td>
						</tr>
						<tr>
							<td >비밀번호 </td>
							<td>:</td>
							<td><input type="text" name="userPwd"> </td>
						</tr>
						<tr>
							<td >이름 </td>
							<td>:</td>
							<td><input type="text" name="userName"> </td>
						</tr>
						<tr>
							<td >번호 </td>
							<td>:</td>
							<td><input type="text" name="phone"> </td>
						</tr>
						<tr>
							<td >주소 </td>
							<td>:</td>
							<td><input type="text" name="address"> </td>
						</tr>
						</table>
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
		$("#board_manage").css("fontWeight", "700");
		$("#board_manage").children().css("background", "rgb(237, 239, 243)");
		
		$(".update").click(function(){
			let uno = $(this).data("uno");
			$(".detailUno").attr("value",uno);
			
			$.ajax({
				url : "<%=contextPath%>/classmembermanagement.c",
				method : 'POST',
   				data : { uno},
   				success : function(list){
   					$("#updateDetail input[name=userName]").attr("value",list[1]);
   					$("#updateDetail input[name=childName]").attr("value",list[2]);
   					$("#updateDetail input[name=phone]").attr("value",list[3]);
   					$("#updateDetail input[name=address]").attr("value",list[4]);
   					$("#updateDetail input[name=id]").attr("value",list[5]);
   				},
   			 	error:function(error,status,msg){
                 error("상태코드 " + status + "에러메시지" + msg );
                },
			});
		});
		
		$(".delete").click(function(){
			let uno = $(this).data("uno");
			$.ajax({
				url : "<%=contextPath%>/classmemberdelete.c",
				method : 'POST',
   				data : { uno},
   				success : function(result){
   					if(result == "Fail"){
   						error("탈퇴 실패");	
   					}else{
   						alertMsg("탈퇴 성공");
   						location.reload();
   					}
   				},
   			 	error:function(error,status,msg){
                 error("상태코드 " + status + "에러메시지" + msg );
                },
			});
		});
	});
	
</script>
</body>
</html>