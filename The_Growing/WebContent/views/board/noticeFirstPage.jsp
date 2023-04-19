<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Growing</title>
<link rel="shortcut icon" type="image/svg" href="<%= request.getContextPath() %>/favicon.svg"/>
</head>
<body>
<%@ include file="boardFrame.jsp" %>
<div id="board_area">
	<form action="<%= contextPath %>/insert.no" method="post">
		<div id="album_header">
        	<div id="album_area">
        		<div id="album_title">알림장</div>
        		<div id="album_button" align="right" class="box">
                  <button id="notice_Enroll" type="submit" class="button_UI button--winona" data-text="글 등록" style="margin-right: 10px;"><span>글 등록</span></button>
              </div>
        	</div>
        <hr>
        </div>
	</form>	
</div>
	<%-- <script>
		$(function(){
			$("#notice_Enroll").on("click", function(){
				location.href = "<%= contextPath %>/views/board/noticeEnrollForm.jsp";
			});
		});
	</script> --%>
</body>
</html>