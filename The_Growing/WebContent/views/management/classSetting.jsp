<%@page import="com.kh.member.model.vo.Member, com.kh.classes.model.vo.Class"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	/* int cno = (int) request.getSession().getAttribute("cno"); */
	Class cInfo = (Class)session.getAttribute("cInfo");
	Member loginUser = (Member) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    	
<!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/button.css">
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/header.css">
<meta charset="UTF-8">
<title>클래스 설정</title>
<style>
     form{
         width: 958.39px;
         height: 698px;
         border: 1px solid red;
     }
     div{
        border: 1px solid blue;
     }
     .list{
        display: inline-flex;
        text-align: center;
     }
     
     .button_UI :active {
	color: rgb(137, 180, 166);
	}
	
	.button_UI:focus {
		outline: none;
	}
	.button--winona::after {
	content: attr(data-text);
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	opacity: 0;
	color: rgb(137, 180, 166);
	font-weight: 600;
	-webkit-transform: translate3d(0, 25%, 0);
	transform: translate3d(0, 25%, 0);
}

.button--winona::after, .button--winona>span {
	-webkit-transition: -webkit-transform 0.3s, opacity 0.3s;
	transition: transform 0.3s, opacity 0.3s;
	-webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
	transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
	display: block;
	font-weight: 600;
}

.button--winona:hover {
	border-color: rgb(137, 180, 166);
	background-color: rgba(255, 255, 255, 0.1);
}

.button--winona:hover::after {
	opacity: 1;
	-webkit-transform: translate3d(0, 0, 0);
	transform: translate3d(0, 0, 0);
}

.button--winona:hover>span {
	opacity: 0;
	-webkit-transform: translate3d(0, -25%, 0);
	transform: translate3d(0, -25%, 0);
}
</style>
</head>
<body>
<div id="border_area">
<form action="<%=contextPath %>/??" name="update-class" method="post" enctype="multipart/form-data">
        <div>클래스 설정</div>
        <div class="list">
        	<!-- 선생님이름 불러오기 -->
            <%-- <div id="pUser" class="profile_area"><img class="profile" width="150" height="120" src="<%= loginUser.getFilePath() %>" alt="" onerror="this.src='<%= contextPath %>/resources/image/noImage.png'"></div> --%>            
            <div><%= cInfo.getTeacherName() %> 선생님</div>
        </div>
        <div>
            클래스 정보
        </div>
        <div>
            <label>학교</label>
            <div><%= cInfo.getClassTypeName() %></div>
            <div>
                <label>연도</label>
                <input class="year" type="number" name="classYear" min="2010"
                              max="2099" step="1" value="2023">
                
                <label>학년</label>
                <input class="grade"
                              type="number" name="classGrade" min="1" max="6" step="1"
                              value="1">
            </div>
            <div>
                <label>반(클래스 이름)</label>
                <input type="text" name="className" placeholder="수정할 클래스 이름">
            </div>
            <div>
                <label>대표 이미지</label><br>
                <% try {
                	if(cInfo.getFilePath() != null) { %>
                	<img id="contentImg" name="classFilePath" width="150" height="120" class="profile" src="<%= contextPath+cInfo.getFilePath()+cInfo.getChangeName()%>" alt="" onerror="this.src='<%= contextPath %>/resources/image/noImage.png'">
                <% }} catch(NullPointerException e) { %>
                	<img id="contentImg" name="classFilePath" width="150" height="120">
                <% } %>
                <br><br>
                <input type="file" name="classImg" onchange="loadImg(this);">
            	
            </div>
        </div>
        <br>
        <div>
            <button class="button_UI button--winona insert_bt" type="button" data-text="click" onclick="updateClass();"><span>수정</span></button> 
            <button class="button_UI button--winona insert_bt" type="button" data-text="click" onclick="deleteClass();"><span>클래스 삭제</span></button>
        </div>

</form>
</div>

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
		
		function updateClass(){
			<% int cno = cInfo.getClassNo(); 
			   System.out.println(cno);
			%>
			
			location.href="<%= contextPath%>/updateClass.ma?cno="+cno;
			
		};
		
		function deleteClass(){
			
		}
	</script>

</body>
</html>