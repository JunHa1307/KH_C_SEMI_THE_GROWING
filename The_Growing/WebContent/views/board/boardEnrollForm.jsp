<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int boardType = (int) request.getAttribute("boardType");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Growing</title>
<link rel="shortcut icon" type="image/svg" href="<%= request.getContextPath() %>/favicon.svg"/>
<style>
/* 자유게시판 작성하기 css */

#board_area {
	width: 80%;
}

#enrollWrap {
	width: 100%;
	height:100%;
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
#box>*{
	margin:3px;
}
#box{
	margin-top:10px;
}


</style>
</head>
<body>

		<%@ include file="/views/board/boardFrame.jsp"%>
		<!-- 자유게시판 작성하기-->

		<div id="board_area">
			<%
				if (boardType == 4) {
			%>
			<div id="album_header">
				<div id="album_area">
					<div id="album_title">자유게시판</div>
				</div>
				<div id="album_hr">
					<hr />
				</div>
			</div>
			<%
				} else {
			%>
			<div id="album_header">
				<div id="album_area">
					<div id="album_title">상담게시판</div>
				</div>
				<div id="album_hr">
					<hr />
				</div>
			</div>
			<%
				}
			%>

			<form action="<%=contextPath%>/insert.fr?boardType=<%=boardType%>"id="enroll-form" method="post">
			
				<div id="enrollWrap">
					<div style="font-size: larger; font-weight: 600">
						제목 : <input id="textInput" type="text" name="title" required
							style="width: 100%;">
					</div>
					<textarea id="summernote" name="content"></textarea>
					</div>
					<div id="box" style="float: right;">
						<button type="submit" class="button_UI button--winona"
							data-text="등록" style="width: 100px;">
							<span>등록</span>
						</button>
						<button type="button" class="button_UI button--winona back"
							data-text="취소" style="width: 100px;">
							<span>취소</span>
						</button>
					</div>	
				
			</form>
		</div>
	</div>
	</div>
	</div>
	
	<script>
	$(document).ready(function() {
		//여기 아래 부분
		$('#summernote').summernote({
			  height: 400,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
			  toolbar: [
	                ['fontname', ['fontname']],     // 글꼴 설정
	                ['fontsize', ['fontsize']],    // 글자 크기 설정
	                ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']], // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
	                ['color', ['forecolor','color']],    // 글자색
	                ['table', ['table']],    // 표만들기
	                ['para', ['ul', 'ol', 'paragraph']],    // 글머리 기호, 번호매기기, 문단정렬
	                ['height', ['height']],    // 줄간격
	                ['insert',['picture','link','video']]
	                  // 코드보기, 확대해서보기, 도움말
	    ],
	      // 추가한 글꼴
	    fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
	     // 추가한 폰트사이즈
	    fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	          
		});
		
		if(<%=boardType == 4 %>){
			  $("#board_free").css("fontWeight", "700");
		    $("#board_free").children().css("background", "rgb(237, 239, 243)");
			}else if(<%=boardType == 5 %>) {
				
				  $("#board_counsel").css("fontWeight", "700");
		        $("#board_counsel").children().css("background", "rgb(237, 239, 243)");
			};
          
      
	});
	
	$(".back").click(function(){
		history.back();
	})
	</script>
	</div>
</body>
</html>