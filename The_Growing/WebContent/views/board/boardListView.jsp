<%@page import="com.kh.board.model.vo.Reply"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.board.model.vo.Board"%>
<%@page import="com.kh.board.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int boardType = (int) request.getAttribute("boardType");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
	ArrayList<Integer> r = (ArrayList<Integer>) request.getAttribute("r");
	Board bt = new Board();
	int level = ((Member)request.getSession().getAttribute("loginUser")).getUserLevel();
	String user =((Member)request.getSession().getAttribute("loginUser")).getUserId();
	
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
	width: 100%;
	height: 100%;
	border-radius: 10px;
	border: none;
	outline: none;
	background: none;
	padding-left: 10px;
}

#searchBtn_1 {
	border: 1px solid rgb(224, 224, 224);
	height: 40px;
	border-radius: 10px;
	width: 250px;
	display: flex;
	align-items: center;
	position: relative;
}

#searchBtn_1>img {
	width: 20px;
	height: 20px;
	position: absolute;
	left: 85%;
	cursor: pointer;
}

#searchBtn_1 :focus {
	box-shadow: 5px 5px 9px rgb(224, 224, 224) inset;
}

.list-table {
	margin: auto;
	margin-top: 20px;
	max-width: 100%;
	border : 1px solid rgb(224,224,224);
	text-align: center;
}

/* .list-table tr:first-child {
	border-top: none;
	background: rgb(228, 234, 235);
	color: black;
} */

.list-table tr {
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
}


.list-table tr:hover:not(:first-child) {
	background-color: rgb(231, 231, 231);
}

.list-table th, .list-table td {
	display: table-cell;
	padding: .25em .5em;
}

.list-table td:hover {
	cursor: pointer;
}

.list-table th, .list-table td {
	padding: 1em !important;
}

.paging-area {
	margin-top: 20px;
}

.pagination {
	justify-content: center;
}

.pagination button {
	border-style: none;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	border-radius: 50%;
	margin-right: 4px;
	color: grey;
}

.pagination button.active {
	background-color: #cff0cc;
	color: black;
}

.pagination button:hover:not(.active) {
	background-color: silver;
}



.titleOver>p {
	overflow: hidden;
	text-overflow: ellipsis;
	  margin: 0;
	 max-width:250px;
	 white-space:nowrap;

	
}


.user {
	font-size: 0.7vw;
	font-weight: 500;
}

.cDate {
	color: grey;
	font-weight: 300;
	font-size: 0.7vw;
}

.count, .bNumber {
	font-size: 13px;
	color: grey;
	font-weight: 300;
}

.fontSize>th {
	color: grey;
	font-weight: 500;
	height: 57px;

}

#freeType {
	border-top: 3px solid rgb(206, 206, 206);
	background: rgb(253, 255, 244);
	color: black;
	height:58px;
}
#freeType>th {
	font-size:0.9vw;
}

#counselType {
	border-top: 3px solid rgb(206, 206, 206);
	background:  rgb(247, 247, 247);
	color: grey;
	height:58px;
}
#counselType>th {
	font-size:0.9vw;
}


</style>
</head>
<body>
              <%@ include file="/views/board/boardFrame.jsp" %>
                <!-- 자유게시판-->

	<div id="board_area">

		<div id="album_header">
			<div id="album_area">
				<%
					if (boardType == 4) {
				%>
				<div id="album_title">자유게시판</div>
				<%
					} else {
				%>
				<div id="album_title" >상담게시판</div>
				<%
					}
				%>
				<%
					if (loginUser != null) {
				%>
				<div id="album_button" >
					<a style="color: black;"
					href="<%=contextPath%>/insert.fr?boardType=<%=boardType %>">
					<button class="button_UI button--winona enter" data-text="글 등록" style="width:100%;">
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

		<%if (boardType == 4) {%>
		<div id="list_search" align="right">
			<div id="searchBtn_1"  >
				<input id="searchBoard" type="text" placeholder="게시판 검색" > 
				<img src="resources/image/search.svg" onclick="location.href='<%=contextPath%>/list.fr?boardType=<%= boardType%>&search='+$('#searchBoard').val();">
			</div>
		</div>
		<%} %>
		<table class="list-table">
			
				<% if(list.isEmpty()) {%>
				<tr>
					<td width="800">조회된 리스트가 없습니다.</td>
				</tr>
				<tbody>
				<% } else { %>
					<% if(boardType == 4){ %>
					<tr id="freeType" >
						<th width="100">번호</th>
						<th width="300">제목</th>
						<th width="150">작성자</th>
						<th width="150">작성일</th>
						<th width="100">조회수</th>
					</tr>
					<%}else if(boardType==5){ %>
						<tr id="counselType" >
						<th width="100">번호</th>
						<th width="300">제목</th>
						<th width="150">작성자</th>
						<th width="150">작성일</th>
						<th width="100">조회수</th>
					</tr>
					<%} %>
					
				<%} %>
				<% for(int i =0; i<list.size(); i++) { %>
				<%if (boardType == 4) {%>
				<tr  class="fontSize" onclick="level1(<%= list.get(i).getBoardNo() %>);">
					<td class="bNumber"><%= list.get(i).getBoardNo() %></td>
					<td class="titleOver"><p ><%=list.get(i).getBoardTitle() %><span style=" font-size:14px; font-weight:400; color:rgb(64, 106, 131);"><%=r.get(i) == 0 ? "" : "  <img style='margin-bottom:4px; widht:13px; height:13px;' src="+ contextPath+"/resources/image/chat.svg>  "+r.get(i) %> </span></p></td>
					<td class="user"><%= list.get(i).getUserName() %> <%=list.get(i).getUserLevel() ==1 ? "선생님" :list.get(i).getUserLevel() ==2? "학부모" : "학생" %></td>
					<td class= "cDate" ><%= list.get(i).getCreateDate() %></td>
					<td class= "count" ><%= list.get(i).getCount() %></td>
				</tr>
				<%}else if(boardType==5){ %>
							<%if (level == 1) {%>
						<tr class="fontSize" onclick="level2(<%= list.get(i).getBoardNo() %>);">
							<td class="bNumber"><%= list.get(i).getBoardNo() %></td>
							<td class="titleOver"><p ><%=list.get(i).getBoardTitle() %><span style=" font-size:14px; font-weight:400; color:rgb(64, 106, 131);"><%=r.get(i) == 0 ? "" : "  <img style='margin-bottom:4px; widht:13px; height:13px;' src="+ contextPath+"/resources/image/chat.svg>  "+r.get(i) %> </span></p></td>
							<td class="user"><%= list.get(i).getUserName() %> <%=list.get(i).getUserLevel() ==1 ? "선생님" :list.get(i).getUserLevel() ==2? "학부모" : "학생" %></td>
							<td class= "cDate" style="font-size: 0.8vw;"><%= list.get(i).getCreateDate() %></td>
							<td class= "count"><%= list.get(i).getCount() %></td>
	
						</tr>
						<%}else if(loginUser.getUserId().equals(list.get(i).getUserId())){ %>
						<tr class="fontSize" id="level3" onclick="level3(<%= list.get(i).getBoardNo() %>);">
							<td class="bNumber"><%= list.get(i).getBoardNo() %></td>
							<td class="titleOver"><p><%=list.get(i).getBoardTitle() %><span style=" font-size:14px; font-weight:400; color:rgb(64, 106, 131);"><%=r.get(i) == 0 ? "" : "  <img style='margin-bottom:4px; widht:13px; height:13px;' src="+ contextPath+"/resources/image/chat.svg>  "+r.get(i) %> </span></p></td>
							<td class="user"><%= list.get(i).getUserName() %> <%=list.get(i).getUserLevel() ==1 ? "선생님" :list.get(i).getUserLevel() ==2? "학부모" : "학생" %></td>
							<td class= "cDate" ><%= list.get(i).getCreateDate() %></td>
							<td class= "count"><%= list.get(i).getCount() %></td>
						</tr>
						
						<%} else{%>
						<tr class="fontSize" onclick="level4();">
							<td class="bNumber"><%= list.get(i).getBoardNo() %></td>
							<td>비밀글 입니다</td>
							<td class="user">비밀 작성자</td>
							<td class= "cDate"><%= list.get(i).getCreateDate() %></td>
							<td class= "count"><%= list.get(i).getCount() %></td>
						</tr>
						<%} %>
					<%} %>
				<% } %>
			
		</table>
		<script>
						function level1(bno){
							
							location.href = "<%=contextPath%>/detail.fr?bno="+bno+'&boardType=4';
								
						};
							
							function level2(bno){
								
								location.href = "<%= contextPath %>/detail.fr?bno="+bno+'&boardType=5';
									
							};
							function level3(bno){
								location.href = "<%= contextPath %>/detail.fr?bno="+bno+'&boardType=5';
						
							};
							
							function level4(){
								warn('해당 작성자만 확인할 수 있습니다.');
						
							};
							
							
						
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
<script>
$(function (){
	if(<%=boardType == 4 %>){
		  $("#board_free").css("fontWeight", "700");
	    $("#board_free").children().css("background", "rgb(237, 239, 243)");
		}else if(<%=boardType == 5 %>) {
			
			  $("#board_counsel").css("fontWeight", "700");
	        $("#board_counsel").children().css("background", "rgb(237, 239, 243)");
		};
});


</script>
</body>
</html>