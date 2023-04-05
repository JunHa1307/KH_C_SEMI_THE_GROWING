<%@page import="com.kh.member.model.vo.Member, com.kh.classes.model.vo.Class"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	Class cInfo = (Class)request.getAttribute("cInfo");
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
    
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/button.css">
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
     }
</style>
</head>
<body>
<div id="border_area">
<form action="<%=contextPath %>/??" name="update-class" method="post" enctype="multipart/form-data">
        <div>클래스 설정</div>
        <div class="list">
            <div>
            	
            </div>
            <div></div>
        </div>
        <div>
            클래스 정보
        </div>
        <div>
            <label>학교</label>
            <div>학교 이름</div>
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
                <input type="text" placeholder="수정할 클래스 이름">
            </div>
            <div>
                <label>대표 이미지</label>
                <% if(cInfo.getFilePath() != null) { %>
                	<img class="profile" src="<%= contextPath+cInfo.getFilePath()+cInfo.getChangeName()%>" alt="" onerror="this.src='<%= contextPath %>/resources/image/noImage.png'">
                <% } else{ %>
                	<img id="contentImg" width="150" height="120">
                <% } %>
                <input type="file" name="classImg" onchange="loadImg(this);">
            </div>
        </div>
        <div>
            <button type="button" onclick="updateClass();">수정</button> <button type="button" onclick="deleteClass();">클래스 삭제</button>
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
			
		};
		
		function deleteClass(){
			
		}
	</script>

</body>
</html>