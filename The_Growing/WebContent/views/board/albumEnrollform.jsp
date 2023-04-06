<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
[id^=contentImg]{

	object-fit: cover;
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
                      <button type="submit" class="button_UI button--winona" data-text="글 등록"><span>글 등록</span></button>
                  </div>
                </div>
                <div id="album_hr">
                  <hr />
                </div>
              </div>
           		 <div style="font-size:larger; font-weight:600">제목 <input type="text" name="title" required size="99"></div>
                <textarea id="summernote" name="content"></textarea>
          
        		<div style="padding: 10px">
					이미지 첨부
					<img id="contentImg1" width="150" height="120">
					<img id="contentImg2" width="150" height="120">
					<img id="contentImg3" width="150" height="120">
					<img id="contentImg4" width="150" height="120">
					<img id="contentImg5" width="150" height="120">
				</div>
			
			<div id="file-area" style="display:none;">
				<input type="file" id ="file1" name="file1" onchange="loadImg(this, 1);" required>
				<input type="file" id ="file2" name="file2" onchange="loadImg(this, 2);" >
				<input type="file" id ="file3" name="file3" onchange="loadImg(this, 3);" >
				<input type="file" id ="file4" name="file4" onchange="loadImg(this, 4);" >
				<input type="file" id ="file5" name="file5" onchange="loadImg(this, 5);" >
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
					// inputFile : 현재 변화가 생긴 input type="file" 요소
					// num : 몇번째 input요소인지 확인 후 해당 영역에 미리보기 하기위한 변수 
					
					//console.log(inputFile.files.length);
					/* 
						파일 선택시 length = 1, 파일 선택 취소시 length = 0 배열안의 내용이 비어있게 됨.
						length값을 가지고 파일의 존재유무를 알수가 있다.
						
						files속성은 업로드된 파일의 정보들을 "배열"형식으로 여러개 묶어서 반환, length 그 배열의 크기를 의미 
					*/
					
					if(inputFile.files.length != 0){
						// 선택된 파일이 존재할 경우에 선택된 파일들을 읽어들여서 그 영역에 맞는 곳에 미리보기를 추가 
						
						// 파일을 읽어들일 FileReader 객체 생성 
						let reader = new FileReader(); 
						
						// 파일을 읽어들이는 메소드 -> 어느파일을 읽을지 매개변수에 제시해줘야 함 
						// 0번째 인덱스에 담긴 파일 정보를 제시 
						// -> 해당 파일을 읽어들이는 순간 해당 파일만의 고유한 url 부여됨. 
						// -> 해당 url을 src속성값으로 제시 
						reader.readAsDataURL(inputFile.files[0]);
						
						// 파일 읽기가 완료되었을때 실행할 함수 정의
						reader.onload=function(e){ // e.target.result에 고유한 url부여됨. 
							// 각 영역에 맞춰서 이미지 미리보기 기능을 제시 
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
						// 선택된 파일이 없을 경우 미리보기도 함께 사라지게끔 작업. 
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