<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Growing</title>
<link rel="shortcut icon" type="image/svg" href="<%= request.getContextPath() %>/favicon.svg"/>
<style>
[id^=contentImg]{

	object-fit: cover;
}

#enrollWrap{
	width:100%;
	height:100%;
	border : 1px solid rgb(224, 224, 224);
	border-radius: 10px;
	padding:20px;
}

#textInput{
	border : 1px solid rgb(224, 224, 224);
}
</style>
</head>
<body>
<%@include file="boardFrame.jsp" %>
		<div id="board_area">
		
			<form action="<%= contextPath %>/insert.al" id="enroll-form" method="post" enctype="multipart/form-data">
            <div id="album_header">
                <div id="album_area">
                  <div id="album_title">앨범</div>
                  <div id="album_button" align="right" class="box">
                      <button type="submit" class="button_UI button--winona" data-text="글 등록" style="width:100%;"><span>글 등록</span></button>
                  </div>
                </div>
                <div id="album_hr">
                  <hr />
                </div>
              </div>
              <div id="enrollWrap">
           		 <div style="font-size:larger; font-weight:600">제목 : <input id="textInput" type="text" name="title" required style="width:100%;"></div>
                <textarea id="summernote" name="content"></textarea>
          
        		<div style="text-align: center;">
        		<br>
					 1개 이상의 이미지를 첨부해주세요.
					 <br><br>
					<img id="contentImg1" width="150" height="120">
					<img id="contentImg2" width="150" height="120">
					<img id="contentImg3" width="150" height="120">
					<img id="contentImg4" width="150" height="120">
					<img id="contentImg5" width="150" height="120">
				</div>
			
			<div id="file-area" style="display:none;">
				<input type="file" id ="file1" name="file1" onchange="loadImg(this, 1);">
				<input type="file" id ="file2" name="file2" onchange="loadImg(this, 2);" >
				<input type="file" id ="file3" name="file3" onchange="loadImg(this, 3);" >
				<input type="file" id ="file4" name="file4" onchange="loadImg(this, 4);" >
				<input type="file" id ="file5" name="file5" onchange="loadImg(this, 5);" >
			</div>
			</div>
		</form>
	
			</div>
			</div>
		</div>

			<script>
				$(function(){
			
					
					$("[id^=contentImg]").each(function(index, item){
						$(item).click(function(){
							$("#file"+(index+1)).click();
						})
					});
				});
				
				function loadImg(inputFile, num){
					
					
					if(inputFile.files.length != 0){
						
						let reader = new FileReader(); 
						
						reader.readAsDataURL(inputFile.files[0]);
						
						reader.onload=function(e){ 
							let url = e.target.result; 
							
							switch(num){
						
							case 1 : $("#contentImg1").attr("src",url); break;
							case 2 : $("#contentImg2").attr("src",url); break;
							case 3 : $("#contentImg3").attr("src",url); break;
							case 4 : $("#contentImg4").attr("src",url); break;
							case 5 : $("#contentImg5").attr("src",url); break;
							
							}
						}
					} else {
						switch(num){
							case 1 : $("#contentImg1").removeAttr("src"); break;
							case 2 : $("#contentImg2").removeAttr("src"); break;
							case 3 : $("#contentImg3").removeAttr("src"); break;
							case 4 : $("#contentImg4").removeAttr("src"); break;
							case 5 : $("#contentImg5").removeAttr("src"); break;
						}
					}
				}
				$(document).ready(function() {
					$('#summernote').summernote({
						  height: 300,                 // 에디터 높이
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
				                ['view', ['fullscreen', 'codeview', 'help']]    // 코드보기, 확대해서보기, 도움말
				    ],
				      // 추가한 글꼴
				    fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
				     // 추가한 폰트사이즈
				    fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
				          
					});
					
					   $("#board_album").css("fontWeight", "700");
				          $("#board_album").children().css("background", "rgb(237, 239, 243)");
			          
			      
				});
			
			</script>

			
		
</body>
</html>