<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림장 등록 페이지</title>
</head>
<body>
<%@ include file="boardFrame.jsp" %>
<div id="board_area">
	<form action="<%= contextPath %>/insert.no" id="enroll-form" method="post">
		<div id="album_header">
        	<div id="album_area">
        		<div id="album_title">알림장</div>
        		<div id="album_button" align="right" class="box">
                      <button type="submit" class="button_UI button--winona" data-text="알림장 등록"><span>등록하기</span></button>
                </div>
        	</div>
        	<div id="album_hr">
                  <hr />
            </div>
        </div>
		<div style="font-size:larger; font-weight:600">제목 <input type="text" name="title" required size="99"></div>
		<textarea id="summernote" name="content"></textarea>
	</form>
</div>
</div>
</div>

	<script>
		$(document).ready(function() {
			//여기 아래 부분
			$('#summernote').summernote({
				  height: 300,                 // 에디터 높이
				  minHeight: null,             // 최소 높이
				  maxHeight: null,             // 최대 높이
				  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
				  lang: "ko-KR",					// 한글 설정
				  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
		          
			});
			
		      $("#board_album").css("fontWeight", "700");
	          $("#board_album").children().css("background", "rgb(239, 243, 239)");
		});
	</script>
</body>
</html>