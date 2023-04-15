<%@page import="com.kh.common.model.vo.Attachment"%>
<%@page import="com.kh.member.model.vo.Member, com.kh.classes.model.vo.Class"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	Class cInfo = (Class)session.getAttribute("cInfo");
	Member loginUser = (Member) session.getAttribute("loginUser");
	Attachment at = (Attachment) request.getAttribute("at");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<title>클래스 설정</title>
<style>
    /*  form{
         border: 1px solid red;
     }
     div{
        border: 1px solid blue;
     } */
     .list{
        display: inline-flex;
        text-align: center;
     }
     .bold{
     	font-weight: 900;
     }
     .classInfo{
     	border: 1px solid rgb(224, 224, 224);
        background-color: aliceblue;
        border-radius: 10px;
     	padding: 15px;
     	padding-left: 50px;
     }
     .classInfoTxt{
     	border: 1px solid rgb(224, 224, 224);
        background-color: aliceblue;
        border-radius: 10px;
     	width: 130px;
     	height: 40px;
     	display: inline-block;
     	margin-bottom : 10px;
     	padding-top: 3px;
     }
     .loadProfile{
     	border-radius: 50%;
     	width: 150px;
     	height: 150px;
     }
     .scLabel{
     	display: inline-block;
     }
     
     .scInfoSy{
     	background-color: white;
     	border-radius: 10px;
     	border: 1px solid lightgray;
     	display: inline-block;
     	text-align: center;
     }
     .classInfo>div, .classInfo>label{
     	padding : 5px 10px;
     	margin: 10px;
     }
     .btnSy{
     	float: right;
     }
     #updateBtn{
     	margin-right: 30px;
     
     }
     input[name=classYear], input[name=classGrade], input[name=className]{
     	border: 1px solid rgb(118, 118, 118);
     	border-radius: 10px;
     	text-align: center;
     	margin-left: 30px;
     	cursor: pointer;
     }
     input[name=classYear]:hover, input[name=classGrade]:hover, input[name=className]:hover{
     	background-color: rgb(255,230,247);
     }
     #contentImg{
     	margin-top:20px;
     	margin-bottom: 20px;
     	object-fit : cover;
     }
     input[type=file]::file-selector-button {
		  width: 150px;
		  height: 30px;
		  background: #fff;
		  border: 1px solid rgb(77,77,77);
		  border-radius: 10px;
		  cursor: pointer;
	}
	input[type=file]::file-selector-button:hover{
		background-color: rgb(255,230,247);
	}
</style>

</head>
<body>
<jsp:include page="../board/boardFrame.jsp" />
<div id="board_area" class="updateClWrap">
<form action="<%=contextPath %>/updateClass.ma" name="update-class" method="post" enctype="multipart/form-data">
        <div id="album_header">
        <div id="album_area">
        	<div id="album_title">클래스 설정</div>
        </div>
        <hr>
        </div>
        <div class="list">
        	<!-- 선생님이름 불러오기 -->
            <%-- <div id="pUser" class="profile_area"><img class="profile" width="150" height="120" src="<%= loginUser.getFilePath() %>" alt="" onerror="this.src='<%= contextPath %>/resources/image/noImage.png'"></div> --%>            
            <div style="padding: 14px;">클래스 관리자는 <span class="bold"><%= cInfo.getTeacherName() %> 선생님</span> 입니다.</div>
        </div>
        <br>
        <div class="bold classInfoTxt" style="font-size: 20px; padding-left: 14px;">
         	클래스 정보
        </div>
        <br>
        <div class="classInfo">
            <label class="bold scLabel">학교</label>
            <div class="scInfoSy"><%= cInfo.getClassTypeName() %></div>
            <div>
                <label class="bold">연도</label>
                <input class="year" type="number" name="classYear" min="2010"
                              max="2099" step="1" value="2023">
                
                <label class="bold" style="margin-left: 50px;">학년</label>
                <input class="grade"
                              type="number" name="classGrade" min="1" max="6" step="1"
                              value="1">
            </div>
            <div>
                <label class="bold">반(클래스 이름)</label>
                <input type="text" name="className" value="<%= cInfo.getClassName() %>" placeholder="수정할 클래스 이름">
            </div>
            <div>
               	<%if(cInfo.getFilePath() != null) { %>
                	
                	<img id="contentImg" name="classFilePath" class="loadProfile" src="<%= contextPath+cInfo.getFilePath()+cInfo.getChangeName()%>" alt="" onerror="this.src='<%= contextPath %>/resources/image/noImage.png'">
                		<input type="hidden" name="originFileRefCno" value="<%= cInfo.getClassNo() %>">
                		<input type="hidden" name="originFileNo" value="<%= at.getFileNo() %>">
						<%-- <input type="hidden" name="changeFileName" value="<%= originFileChangeName %>"> --%>
					<%-- <% } catch(NumberFormatException e){ %>
						<input type="hidden" name="originFileNo" value="<%= at.getFileNo() %>">
						<input type="hidden" name="changeFileName" value="<%= at.getChangeName() %>">
					
					<% } %> --%>
                <% } else { %>
                	<img id="contentImg" name="classFilePath" class="loadProfile" onerror="this.src='<%= contextPath %>/resources/image/noImage.png'">
                <% } %>

                <br><br>
                <input type="file" id="classImg" name="classImg" onchange="loadImg(this);">
            	
            </div>
        </div>
        <br>
        <div class="btnSy">
            <button id="updateBtn"class="button_UI button--winona insert_bt" type="submit" data-text="click"><span>수정</span></button> 
            <button id="deleteBtn" class="button_UI button--winona insert_bt" type="button" data-text="click"><span>클래스 삭제</span></button>
        </div>
</form>
</div>
	<script>
		$().ready(function () {
	        $("#deleteBtn").click(function () {
	            Swal.fire({
	                title: '정말 삭제하시겠습니까?',
	                text: "삭제된 데이터는 복구되지 않습니다.",
	                icon: 'warning',
	                showCancelButton: true,
	                confirmButtonColor: '#3085d6',
	                cancelButtonColor: '#d33',
	                confirmButtonText: '확인',
	                cancelButtonText: '취소'
	            }).then((result) => {
	                if (result.isConfirmed) {
	                	
	                	$.ajax({
	                		type: "POST",
	                		url: "<%= contextPath%>/deleteclass.ma",
	                		data: <%= cInfo %> ,
	                		success: function(){
	                			Swal.fire({
	    	                     	title: '클래스 삭제가 완료되었습니다.',
	    	                        text: '새로운 클래스를 생성해보세요!',
	    	                        icon: 'success',   
	    	                        confirmButtonText: '확인'
	    	                    })
	                		},
	    	                error: function(){
	    	                	console.log("실패");
	    	                }
	    	                	
	                	});
	                	
	                    
	                }
	            } )
	        });
	    });
		
		/* $(function(){
			$("button[class=swal2-confirm]").click(function(){
				console.log("?");
			});
			
		}); */
	</script>
	
	<script>
		function loadImg(inputImg){
			if(inputImg.files.length != 0){
				
				let reader = new FileReader(); 
				reader.readAsDataURL(inputImg.files[0]);
				
				reader.onload=function(e){ // e.target.result에 고유한 url부여됨. 
					// 각 영역에 맞춰서 이미지 미리보기 기능을 제시 
					let url = e.target.result; 
					
					$("#contentImg").attr("src",url);
				}
			} else{
				$("#contentImg").removeAttr("src");
			}
		};
		
		<%-- function updateClass(){
			int cno = cInfo.getClassNo(); 
			location.href="<%= contextPath%>/updateClass.ma";
		}; --%>
		
	</script>

</body>
</html>