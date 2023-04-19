<%@page import="com.kh.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Board b = (Board) request.getAttribute("b");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Growing</title>
<link rel="shortcut icon" type="image/svg" href="<%= request.getContextPath() %>/favicon.svg"/>
<style>
#enrollWrap {
	width: 100%;
	min-height: 470px; 
	/* height:100%; */
	border: 1px solid rgb(224, 224, 224);
	border-radius: 10px;
	padding: 20px;
	background: rgb(247, 247, 247);
}
.note-frame{
 background: white;
}

.note-toolbar {
	background: rgb(242, 242, 250);
}

#textInput {
	border: 1px solid rgb(224, 224, 224);
}
</style>
</head>
<body>
<%@include file="boardFrame.jsp" %>
      <div id="board_area">
         <form action="<%= contextPath %>/update.no" id="enroll-form" method="post">
            <div id="album_header">
                <div id="album_area">
                  <div id="album_title">알림장</div>
                  <div id="album_button" align="right" class="box">
                      <button type="submit" class="button_UI button--winona" data-text="알림장 등록" style="width:100%;"><span>등록하기</span></button>
                  </div>
                </div>
                <div id="album_hr">
                  <hr />
                </div>
              </div>
              
              	<div id="enrollWrap">
					<div style="font-size: larger; font-weight: 600">
						제목 : <input id="textInput" type="text" name="title" required value="<%= b.getBoardTitle() %>"
							style="width: 100%;">
					</div>
					<textarea id="summernote" name="content"><%= b.getBoardContent() %></textarea>
				</div>
              
    
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
                    lang: "ko-KR",               // 한글 설정
                    placeholder: '최대 2048자까지 쓸 수 있습니다'   //placeholder 설정
                      
               });
               
               $("#board_notice").css("fontWeight", "700");
               $("#board_notice").children().css("background", "rgb(237, 239, 243)");
            });
         
         </script>

         
      
</body>
</html>