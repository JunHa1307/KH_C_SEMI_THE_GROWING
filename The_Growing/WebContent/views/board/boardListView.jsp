<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.board.model.vo.Board"%>
<%@page import="com.kh.common.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	PageInfo pi = (PageInfo) request.getAttribute("pi");
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");

	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	Member loginUser = (Member) session.getAttribute("loginUser");
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
        #board_area {
            width: 80%;
        }
        #list_search {
            width: 190px;
            height: 15%;
            margin: -1% 0% 0% 72%;
            
        }        
		
        #searchBoard {           
            width: 150px;
            border: none;
            outline: none;
            background: none;
        }

        #searchBtn_1 {
            border: 1px solid black;
            height: 40px;
            border-radius: 10px;
           
        }
		
		
        .list-table {
            margin: auto;
            min-width: 800px;
            max-width: 100%;
            border-collapse: collapse;
        }

        
        .list-table tr:first-child {
            border-top: none;
            background: #cff0cc;
            color: black;
        }

        .list-table tr {
            border-top: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
            background-color: #f5f9fc;
        }

        .list-table th {
            display: none;
        }

        @media screen and (min-width: 600px) {
            .list-table tr:hover:not(:first-child) {
                background-color: #d8e7f3;
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
			margin-left:60%;
    	}

		.pagination {
            display: inline-block;
        }
                    
        .pagination button {
            border-style : none;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
            border-radius:50%;
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
                    <h1 align="center">자유 게시판</h1>

                    <div id="list_search">                     
                            <button id="searchBtn_1" type="button">
                                <input id="searchBoard" type="text" placeholder="게시판 검색">
                                <img src="<%=contextPath %>/resources/searchIcon.png">
                            </button>           
                       <% if(loginUser != null) { %>    
                        <div id="box">
                            <a href="<%=contextPath%>/insert.fr" style="color:black;">
                            	<button class="button_UI button--winona" data-text="글 등록""><span>글 등록</span></button>
                            </a>
                        </div> 
                        <% } %>
                    </div>
                    
                    <table class="list-table">
                        <tbody>
                          <% if(list.isEmpty()) {%>
					<tr>
						<td colspan="6">조회된 리스트가 없습니다.</td>
					</tr>
						<% } else { %>
							<% for(Board b  :  list) { %>
								<tr>
									<td><%= b.getBoardNo() %></td>
									<td><%= b.getRefUno() %></td>
									<td><%= b.getBoardTitle() %></td>
									<td><%= b.getCreateDate() %></td>
								</tr>
							<% } %>
						<% } %>
                      </table>
                    </div>
            </div>
            
            <div align="center" class="paging-area">
               <div class="pagination">
				<% if(currentPage != 1) { %>
					<button onclick="location.href = '/list.fr?currentPage=<%= currentPage -1 %>'">&lt;</button>
				<% } %>
				
				<% for(int i = startPage; i <= endPage; i++ ) { %>
					
					<% if(i != currentPage) { %>
						<button onclick="location.href = '/list.fr?currentPage=<%= i %>'; "><%= i %></button>
					<% } else { %>
						<button disabled><%=i %></button>
					<% } %>
					
				<% } %>
				
				<% if(currentPage != maxPage) { %>
					<button onclick="location.href = '/list.fr?currentPage=<%=currentPage + 1 %>' ">&gt;</button>
				<% } %>
                
              </div>
            
            </div>
            
            
    </div>
</body>
</html>