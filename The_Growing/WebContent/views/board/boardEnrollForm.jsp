<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int boardType =(int) request.getSession().getAttribute("boardType");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유게시판 작성하기</title>
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
                <!-- 자유게시판 작성하기-->
                
                <div id="board_area">
                <%if(boardType == 4) {%>
                    <h1 align="center">자유 게시판</h1>
				<%}else{ %>
					 <h1 align="center">상담 게시판</h1>
				<%} %>
               
                <form action="<%= contextPath %>/insert.fr?boardType=<%=boardType %>" id="enroll-form" method="post">
                    <table class="list-table"  border="5">
                        <tr >
                            <th>
                                  <input id="title_area" type="text" name="title" placeholder="제목을 입력하세요." autofocus style="width: 100%; font-size: 2em;" required>
                            </th>					        
                        </tr>
                       
                        <tr>
                            <th >
                                <textarea id="summernote" name ="content"></textarea>
                            </th>
                        </tr>
                       
                        <tr>
                            <th height="60px">
                                <%-- <div  style="float: left;">
                                    <label id="upload_file" for="input_file">
                                    	<img src="<%=contextPath %>/resources/image/icons8-붙이다-64.png" style="width: 50px; height:50px;">
                                    </label>
                                    <input type="file" id="input_file" name="board_upfiles" style="display:none"/>
                                </div> --%>
                                <div id="box" style="float: right;">
                                    <button type="submit" class="button_UI button--winona" data-text="등록" style="width: 100px;"><span>등록</span></button>
                                </div>
                                <div id="box" style="float: right;">
                                    <button type="reset" class="button_UI button--winona" data-text="취소" style="width: 100px;"><span>취소</span></button>
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