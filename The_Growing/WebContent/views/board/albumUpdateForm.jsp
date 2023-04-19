<%@page import="com.kh.common.model.vo.Attachment"%>
<%@page import="com.kh.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
	Board b = (Board)request.getAttribute("b");
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
	
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
[id^=contentImg]{
	
	object-fit: cover;
	margin-right:4px;
}
#contentImg1{

}
.x{
	position:absolute;
	top:-67px;
	left:133px;
	cursor: pointer;
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
			<form action="<%= contextPath %>/update.al" id="enroll-form" method="post" enctype="multipart/form-data">
			<input type="hidden" name="bno" value="<%= b.getBoardNo()%>">
            <div id="album_header">
                <div id="album_area">
                  <div id="album_title">앨범</div>
                  <div id="album_button" align="right" class="box">
                      <button type="submit" class="button_UI button--winona enter" data-text="수정" style="width:100%;"><span>수정</span></button>
                  </div>
                </div>
                <div id="album_hr">
                  <hr />
                </div>
              </div>
              
               <div id="enrollWrap">
           		 <div style="font-size:larger; font-weight:600">제목 : <input id="textInput" type="text" name="title" required style="width:100%;"  value="<%=b.getBoardTitle()%>"></div>
                <textarea id="summernote" name="content"><%=b.getBoardContent() %></textarea>
              
              
          
        		<div style="text-align: center;">
        		<br>
					1개 이상의 이미지를 첨부해주세요.<br><br><br>
					<div >
					<%for (int i = 1; i<=list.size(); i++){ %>
					<span  style="position:relative; width:155px"><img id="contentImg<%=i%>"  src="resources/album_upfiles/<%=list.get(i-1).getChangeName() %>" style="width:150px; height:120px;"><img data-bno="<%=b.getBoardNo()%>" data-index="<%=i%>" data-level="<%=list.get(i-1).getFileLevel() %>"  class="x" src="resources/image/x-circle.svg"></span>
					<%} %>
					<%for (int i = list.size()+1; i<=5; i++){ %>
					<span  style="position:relative; width:155px"><img id="contentImg<%=i%>"  style="width:150px; height:120px;"><img data-bno="<%=b.getBoardNo()%>" data-index="<%=i%>"  class="x" src="resources/image/x-circle.svg"></span>
					<%} %>
					</div>
				</div>
			
			<div id="file-area" style="display:none;">
				<input type="file" id ="file1" name="file1" value="1" onchange="loadImg(this, 1);">
				<input type="file" id ="file2" name="file2" value="2"  onchange="loadImg(this, 2);" >
				<input type="file" id ="file3" name="file3" value="3"  onchange="loadImg(this, 3);" >
				<input type="file" id ="file4" name="file4" value="4"  onchange="loadImg(this, 4);" >
				<input type="file" id ="file5" name="file5" value="5"  onchange="loadImg(this, 5);" >
			</div>
			</div>
					<%for (int i =0; i<list.size(); i++){ %>
						<% if(list.get(i) != null) { %>
							
							<!-- 원본파일의 파일번호, 수정명을 hidden으로 함께 전송할 예정 -->
							<input type="hidden" name="originFileNo<%=i %>" value="<%=list.get(i).getFileNo() %>">
							<input type="hidden" name="changeFileName<%=i %>" value="<%=list.get(i).getChangeName() %>">
							<input type="hidden" name="filelevel<%=i %>" value="<%=list.get(i).getFileLevel() %>">
							
						<%} %>
							
					<%} %>
							
			
		</form>
	
			</div>
			</div>
		</div>

			<script>
				$(function(){
					//여기 아래 부분
					$('#summernote').summernote({
						  height: 300,                 // 에디터 높이
						  minHeight: null,             // 최소 높이
						  maxHeight: null,             // 최대 높이
						  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
						  lang: "ko-KR",					// 한글 설정
						  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
				          
					});
					
					
					$("[id^=contentImg]").each(function(index, item){
						$(item).click(function(){
							$("#file"+(index+1)).click();
						})
					});
				});
				
				// 파일 삭제 
			 	$(".x").click(function(){
		      		let index = $(this).data("index");
		      		let level = $(this).data("level");
		      		let bno = $(this).data("bno");
		      		$(this).siblings("img").attr("src", "<%= contextPath %>/resources/image/noImage.png");
		      		
		      	   	$.ajax({
		   				url : "<%=contextPath%>/deleteAttachment.al",
		   				data : { bno, index, level},
		   				success : function(list){
		   				},
		   				error: function(){
		   					error("게시글 목록조회 실패")
		   				}
		        	});
		      	  	let element1 = document.getElementsByName("originFileNo" + (index-1));
		      		element1.parentNode.removeChild(element);
		      		let element2 = document.getElementsByName("changeFileName" + (index-1));
		      		element2.parentNode.removeChild(element);
		      		let element3 = document.getElementsByName("filelevel" + (index-1));
		      		element3.parentNode.removeChild(element);
		      		
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
			
				   $("#board_album").css("fontWeight", "700");
			          $("#board_album").children().css("background", "rgb(237, 239, 243)");
			          
			     
			      	
			     
					
			
			</script>

</body>
</html>