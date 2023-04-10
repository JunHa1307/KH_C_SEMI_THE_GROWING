<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.board.model.vo.Board"%>
<%@page import="com.kh.board.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	PageInfo pi = (PageInfo) request.getAttribute("pi");
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
	Board bt = new Board();
	
	int boardType =(int) request.getAttribute("boardType");
	int currentPage = pi.getCurrentPage(); 
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage(); 
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유게시판 리스트</title>
    <style>
        /* 자유게시판 테이블 css */
      
        #list_search {
            width: 97%;
            height: 25%;
           
        }        
		
        #searchBoard {           
            width: 250px;
            border: none;
            outline: none;
            background: none;
            
            
        }

        #searchBtn_1 {
            border : 1px solid rgb(224, 224, 224);
            height: 40px;
            border-radius: 10px;
        }
		#searchBtn_1 >img{
	        width:20px;
	        height:20px;
        }
	
        .list-table {
            margin: auto;
            margin-top:20px;
           
            max-width: 100%;
            border-collapse: collapse;
            text-align : center;
        }

        
        .list-table tr:first-child {
            border-top: none;
            background: rgb(228, 234, 235);
            color: black;
        }

        .list-table tr {
            border-top: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
            background-color: rgb(244, 248, 248);
        }

        .list-table th {
            display: none;
        }

        @media screen and (min-width: 600px) {
            .list-table tr:hover:not(:first-child) {
                background-color: white;
        }
      
        .list-table th,.list-table td {
            display: table-cell;
            padding: .25em .5em;
        }
        .list-table td:hover {
            cursor: pointer;
        }
      
        .list-table th, .list-table td {
            padding: 1em !important;
        }
    	}
    	
    	.paging-area{
    			
			
			margin-top:20px;
    	}

		.pagination {
          justify-content: center;
        }
                    
        .pagination button {
            border-style : none;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
            border-radius:50%;
            margin-right: 4px;
            color : grey;
        }
                    
        .pagination button.active {
            background-color: #cff0cc;
             color: black;
        }
                    
       .pagination button:hover:not(.active) {background-color: silver;}
       
    
    }
    
    </style>
</head>
<body>
              <%@ include file="/views/board/boardFrame.jsp" %>
                <!-- 자유게시판-->
	<div id="board_area">

		<div id="album_header">
			<div id="album_area">
				<%if (boardType == 4) {%>
				<div id="album_title" style="width:82%" >자유게시판</div>
				<%} else {%>
				<div id="album_title" style="width:82%">상담게시판</div>
				<%}%>
				<% if(loginUser != null) { %>
				<div id="album_button" style="width:18%" class="box" >
					<a style="color: black;"
					href="<%=contextPath%>/insert.fr?boardType=<%=boardType %>">
					<button class="button_UI button--winona" data-text="글 등록">
						<span>글 등록</span>
					</button>
				</a>
				</div>
				<% } %>
			</div>
			<div id="album_hr">
				<hr />
			</div>
		</div>


		<div id="list_search" align="right">
			<button id="searchBtn_1" type="button" >
				<input id="searchBoard" type="text" placeholder="게시판 검색" > 
				<img src="resources/image/search.svg">
			</button>
		</div>

		<table class="list-table">
			
				<% if(list.isEmpty()) {%>
				<tr>
					<td colspan="6">조회된 리스트가 없습니다.</td>
				</tr>
				<tbody>
				<% } else { %>
				<tr>
					<th width="130">글번호</th>
					<th width="350">제목</th>
					<th width="130">작성자</th>
					<th width="130">작성일</th>
					<th width="120">조회수</th>
				</tr>
				<% for(Board b  :  list) { %>
				<tr id="table_tr">
					<td style="font-size: 13px; color:grey;"><%= b.getBoardNo() %></td>
					<td><%= b.getBoardTitle() %></td>
					<td><%= b.getUserId() %></td>
					<td style="font-size: 0.8vw;"><%= b.getCreateDate() %></td>
					<td style="font-size: 13px; color:grey;"><%= b.getCount() %></td>
				</tr>
				<% } %>
				<% } %>
			
		</table>
		<script>
						$(function(){
							$(".list-table>tbody>tr").click(function(){
								let bno = $(this).children().eq(0).text();
								location.href = '<%= contextPath %>/detail.fr?bno='+bno;
							});
						});
					</script>


		<div align="center" class="paging-area">
			<div class="pagination">
				<% if(currentPage != 1) { %>
				<button
					onclick="location.href = '<%=contextPath %>/list.fr?currentPage=<%= currentPage -1 %>&boardType=<%=boardType%>'">&lt;</button>
				<% } %>

				<% for(int i = startPage; i <= endPage; i++ ) { %>

				<% if(i != currentPage) { %>
				<button class=""
					onclick="location.href = '<%=contextPath %>/list.fr?currentPage=<%= i %>&boardType=<%=boardType%>' "><%= i %></button>
				<% } else { %>
				<button disabled><%=i %></button>
				<% } %>

				<% } %>

				<% if(currentPage != maxPage) { %>
				<button class=""
					onclick="location.href = '<%=contextPath %>/list.fr?currentPage=<%=currentPage + 1 %>&boardType=<%=boardType%>' ">&gt;</button>
				<% } %>

			</div>

		</div>
	</div>
</body>
</html>