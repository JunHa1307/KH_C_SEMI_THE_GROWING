<%@page import="com.kh.common.model.vo.Attachment"%>
<%@page import="com.kh.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Board b = (Board) request.getAttribute("b");
	Attachment at = (Attachment) request.getAttribute("at"); 
	int boardType =(int)request.getAttribute("boardType");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유게시판 수정하기</title>
    <style>
        /* 자유게시판 작성하기 css */
        #board_area {
            width: 80%;
        }
#enrollWrap {
	width: 100%;
	min-height: 615px; 
	/* height:100%; */
	border: 1px solid rgb(224, 224, 224);
	border-radius: 10px;
	padding: 20px;
	background: rgb(247, 245, 241);
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

.modal-title{
	align-items: flex-start;
}
     
    </style>
</head>
<body>
    <div class="wrap">
   	 <%@ include file="/views/board/boardFrame.jsp" %>
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

                <form action="<%= contextPath %>/update.fr?boardType=<%=boardType %>" id="update-form" method="post" >
                <input type="hidden" name="bno" value="<%= b.getBoardNo() %>">
                    
                    <div id="enrollWrap">
					<div style="font-size: larger; font-weight: 600">
						제목 : <input id="title_area" type="text" name="title" value="<%=b.getBoardTitle() %>" style="width: 100%;  required">
					</div>
					<textarea id="summernote" name="content"><%=b.getBoardContent() %></textarea>

					<div id="box" style="float: right;">
					
						
					<button type="submit" class="button_UI button--winona" data-text="수정" style="width: 100px;"><span>수정</span></button>
					<button  onclick="deleteBoard();" class="button_UI button--winona" data-text="삭제" style="width: 100px;" ><span>삭제</span></button>	
					</div>	
				</div>
                    
                    
                    
                </form>
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
      		
      	          
      		});
				
            	if(<%=boardType == 4 %>){
          		  $("#board_free").css("fontWeight", "700");
          	    $("#board_free").children().css("background", "rgb(239, 243, 239)");
          		}else if(<%=boardType == 5 %>) {
          			
          			  $("#board_counsel").css("fontWeight", "700");
          	        $("#board_counsel").children().css("background", "rgb(239, 243, 239)");
          		};
				
            });
            

			function deleteBoard(){
				if(!confirm("정말 삭제하시겠습니까?")){
					return;
				}
				
				location.href = "<%= contextPath %>/delete.fr?bno=<%= b.getBoardNo() %>";
			};
            
            </script>  
    </div>
</body>
</html>