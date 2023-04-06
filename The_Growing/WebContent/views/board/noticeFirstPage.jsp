<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림장 게시판 페이지</title>
</head>
<body>
<%@ include file="boardFrame.jsp" %>
<div id="board_area">
	<%-- <form action="<%= contextPath %>/noticeEnrollForm.jsp" method="post"> --%>
		<div id="album_header">
        	<div id="album_area">
        		<div id="album_title">알림장</div>
        		<div id="album_button" align="right" class="box">
                  <button id="notice_Enroll" class="button_UI button--winona" data-text="글 등록" style="margin-right: 10px;"><span>글 등록</span></button>
                  <span>수정삭제버튼</span>
              </div>
        	</div>
        <hr>
        </div>
	<!-- </form> -->	
</div>
	<script>
		$(function(){
			$("#notice_Enroll").on("click", function(){
				location.href = "<%= contextPath %>/views/board/noticeEnrollForm.jsp";
			});
		});
	</script>
</body>
</html>