<%@page import="com.kh.common.model.vo.Attachment"%>
<%@page import="com.kh.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Board b = (Board) request.getAttribute("b");
	Attachment at = (Attachment) request.getAttribute("at"); 
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
        #list_search {
            width: 190px;
            height: 15%;
            margin: -1% 0% 0% 64%;           
        }               
        
        .list-table {
            margin: auto;
            min-width: 700px;
            max-width: 100%;
            border-collapse: separate;
            border-spacing: 15px 5px;
            border: 5px solid #cff0cc;
            border-radius: 5%;
        }

       	#upload_file{
	        border-radius: 50%;
	        border-style: none;
	        background-color: white;
	    }
    
    	#upload_file:hover {
	        background-color: #cff0cc;
	    }
	
     
    </style>
</head>
<body>
    <div class="wrap">
   	 <%@ include file="/views/board/boardFrame.jsp" %>
                <!-- 자유게시판 수정하기-->
                
                <div id="board_area">
                    <h1 align="center">자유게시판</h1>
                
                <form action="<%= contextPath %>/update.fr" id="update-form" method="post" >
                <input type="hidden" name="bno" value="<%= b.getBoardNo() %>">
                    <table class="list-table"  border="5">
                        <tr >
                            <th>
                                  <input id="title_area" type="text" name="title" value="<%=b.getBoardTitle() %>" placeholder="제목을 입력하세요." autofocus style="width: 100%; font-size: 2em; required">
                            </th>					        
                        </tr>
                       
                        <tr>
                            <th >
                                 <textarea id="summernote" name="content"><%=b.getBoardContent() %></textarea>
                         
                            </th>
                        </tr>
                        
                        <tr>
                            <th height="60px">
                                <div  style="float: left;">
                                    <button id="upload_file"><img src="<%=contextPath %>/resources/image/icons8-붙이다-64.png" style="width: 50px; height:50px;"></button>
                                </div>
                                <div id="box" style="float: right;">
                                    <button  onclick="deleteBoard();" class="button_UI button--winona" data-text="삭제" style="width: 100px;" ><span>삭제</span></button>
                                </div>
                                <script>
											function deleteBoard(){
												if(!confirm("정말 삭제하시겠습니까?")){
													return;
												}
												
												location.href = "<%= contextPath %>/delete.fr?bno=<%= b.getBoardNo() %>";
											}
										</script>	
                                <div id="box" style="float: right;">
                                    <button type="submit" class="button_UI button--winona" data-text="수정" style="width: 100px;"><span>수정</span></button>
                                </div>
                            </th>
                        </tr>
                    </table>
                </form>
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
				
            });
            </script>  
    </div>
</body>
</html>