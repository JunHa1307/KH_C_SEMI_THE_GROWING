<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <!-- 자유게시판 상세보기-->
                
                <div id="board_area">
                    <h1 align="center">자유게시판</h1>
                
                <form action="<%= contextPath %>/insert.fr" id="enroll-form" method="post" enctype="multipart/form-data">
                    <table class="list-table"  border="5">
                        <tr >
                            <th>
                                  <input id="title_area" type="text" name="title" placeholder="제목을 입력하세요." autofocus style="width: 100%; font-size: 2em;" required>
                            </th>					        
                        </tr>
                       
                        <tr>
                            <th >
                                <textarea cols="100" rows="15" name="content" placeholder="내용을 입력하세요." style="font-size: 1.2em;" required></textarea>
                            </th>
                        </tr>
                       
                        <tr>
                            <th height="60px">
                                <div  style="float: left;">
                                    <label id="upload_file" for="input_file">
                                    	<img src="<%=contextPath %>/resources/image/icons8-붙이다-64.png" style="width: 50px; height:50px;">
                                    </label>
                                    <input type="file" id="input_file" name="upfile" style="display:none"/>
                                </div>
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
    </div>
</body>
</html>