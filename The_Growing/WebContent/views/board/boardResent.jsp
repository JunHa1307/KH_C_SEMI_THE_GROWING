<%@page import="com.kh.board.model.vo.Board"%>
<%@page import="com.kh.board.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Board> list= (ArrayList<Board>)request.getAttribute("list");
	ArrayList<Integer> r = (ArrayList<Integer>) request.getAttribute("r");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#album_header {
	height: 80px;
	width: 100%;
	position: sticky;
	/* background-color: antiquewhite; */
}

#album_area>div {
	float: left;
	height: 100%;
}

#album_title {
	width: 70%;
	font-size: 25px;
	font-weight: 700;
	padding-left: 14px;
}

#album_button {
	width: 30%;
}

#album_area {
	width: 100%;
	height: 70%;
	/* background-color: aliceblue; */
}

#album_hr {
	width: 100%;
	height: 30%;

	/* background-color: aquamarine; */
}

#album_hr>hr {
	margin: 0;
}
/* background-color: aquamarine; */

#tableHead{
	 border-bottom: 1px solid rgb(244,244,244); 
	 background: rgb(242, 244, 247);
	 
	 
}

.list-area {
	text-align: center;
	box-shadow: 0 0 0 0.8px rgb(224, 224, 224);
	border-radius: 10px;
}

.list-area tr {
	height: 50px;
}

.list-area>tbody>tr:hover {
	background: rgb(245, 246, 247);
	cursor: pointer;
	
}

.type {
	width: 80%;
	height: 30px;
	border-radius: 50px;
	margin: 0 auto;
	padding-top: 3px;
	font-weight:500;
	box-shadow: 0px 8px 6px -6px #666;
		display: flex;
	align-items: center;
	justify-content: center;
}

#notice {
	background-color: rgb(186, 202, 197);
}

#album {
	background-color: rgb(245, 241, 241);
	
}

#free {
	background-color: rgb(90, 142, 163);
	font-size: 0.8vw;
	color:white;
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
#bno{
	color:rgb(64, 106, 131);
	font-size:13px;
	font-weight :300;
}
#user{
	font-size:0.8vw;
	font-weight:500;
	 overflow: hidden;
  text-overflow: ellipsis;
}
#cDate{
	font-size: 0.7vw; 
	color:rgb(64, 106, 131);
	font-weight:300;
}
#topLeftRadius{
	border-top-left-radius: 10px;

}
#topRightRadius{
	border-top-right-radius: 10px;
	
}

</style>
</head>
<body>
	<%@include file="boardFrame.jsp"%>

	<div id="board_area">
		<div id="album_header">
			<div id="album_area">
				<div id="album_title">최근게시글</div>
			</div>
			<div id="album_hr">
				<hr />
			</div>
		</div>
			<table class="list-area" align="center">
			<thead id="tableHead" >
				<tr>
					<th width="100" id="topLeftRadius">번호</th>
					<th width="150">카테고리</th>
					<th width="300">제목</th>
					<th width="150">작성자</th>
					<th width="150" id="topRightRadius">작성일</th>
				</tr>
			</thead>
			<tbody>
			<% if(list.isEmpty()) {%>
				<tr>
					<td colspan="6">조회된 리스트가 없습니다.</td>
				</tr>
			<%} else { %>
				<%-- <% for(int i =0; i<list.size(); i++) { %>
					<tr>
						<td id="bno"><%=list.get(i).getBoardNo() %></td>
						<input type="hidden" id="type" value="<%=list.get(i).getBoardType() %>">
						<%if (list.get(i).getBoardType()==2){%>
							<td>	<div class="type" id="notice">알림장</div></td>
						<% }else if (list.get(i).getBoardType()==3) {%>
							<td>	<div class="type" id="album">앨범</div></td>
						<%}else if (list.get(i).getBoardType()==4){ %>
							<td>	<div class="type" id="free">자유게시판</div></td>
						<%} %>
					
						<td ><%=list.get(i).getBoardTitle() %><span style="font-size:14px; font-weight:600; "><%=r.get(i) == 0 ? "" :"["+r.get(i)+"]" %> </span><div id="title" onclick="count(<%=list.get(i).getBoardNo() %>);"></div></td>
						<td><%=list.get(i).getUserId() %></td>
						<td style=" font-size: 0.8vw; color:grey;"><%=list.get(i).getCreateDate() %>
					</tr>
				<%} %> --%>
				
				<% for(int i =0; i<list.size(); i++) { %>
					<tr>
						<td id="bno"><%=list.get(i).getBoardNo() %></td>
						<input type="hidden" id="type" value="<%=list.get(i).getBoardType() %>">
						<%if (list.get(i).getBoardType()==2){%>
							<td>	<div class="type" id="notice">알림장</div></td>
						<% }else if (list.get(i).getBoardType()==3) {%>
							<td>	<div class="type" id="album">앨범</div></td>
						<%}else if (list.get(i).getBoardType()==4){ %>
							<td>	<div class="type" id="free">자유게시판</div></td>
						<%} %>
					
					<td><%=list.get(i).getBoardTitle() %><span style=" font-size:14px; font-weight:400; color:rgb(64, 106, 131);"><%=r.get(i) == 0 ? "" : "  <img style='margin-bottom:4px; widht:13px; height:13px;' src="+ contextPath+"/resources/image/chat.svg>  "+r.get(i) %> </span></td>
						<td id="user"><%=list.get(i).getUserName() %> <%=list.get(i).getUserLevel() ==1 ? "선생님" :list.get(i).getUserLevel() ==2? "학부모" : "학생" %></td>
						<td id="cDate" ><%=list.get(i).getCreateDate() %>	
					</tr>
				<%} %>
			<%} %>
				
			</tbody>
		</table>
		
			<script>
	 	$(function(){ 
	 		 $("#board_recent").css("fontWeight", "700");
	          $("#board_recent").children().css("background", "rgb(237, 239, 243)");
	 		
	 		
			 $(".list-area>tbody>tr").click(function(){
				// 클릭시 해당 공지사항의 글번호를 알아야함
				// tr요소의 자손중에서 첫번째 td태그의 영역안의 내용을 가져올 예정
				
				let bno = $(this).children().eq(0).text();
				// 현재 내가 클릭한 tr의 자손들 중 0번째에 위치한 자식의 textNode값을 가져온다. 
				let type = $(this).children("#type").val();
				console.log(type);
				
				if(type==2){
					location.href = "<%=contextPath %>/movenotice.bo#"+"noDiV"+bno;
					
				}else if(type==3){
					location.href = "<%=contextPath %>/list.al?bno="+bno;
				}else  if(type==4){
					location.href = "<%=contextPath %>/detail.fr?bno="+bno+'&boardType='+4;
				}
				
				
			}); 
		
		
		
			
			
	 	}); 
	</script>
		
			<br><br>
			
			<!-- 페이징바 영역 -->
			
			<div align="center" class="paging-area">
			<div class="pagination">
				<% if(currentPage != 1) { %>
					<button onclick="location.href='<%=contextPath %>/resent.bo?currentPage=<%=currentPage -1 %>'">&lt;</button>
				<%} %>
				
				<%for(int i = startPage; i<=endPage; i++){ %>
					<% if(i != currentPage) { %>
						<button onclick="location.href='<%=contextPath %>/resent.bo?currentPage=<%=i %>'"><%=i %></button>
					<%} else { %>
						<button disabled><%=i %></button>
					<%} %>
				<%} %>
			
				
				<% if(currentPage != maxPage) { %>
					<button onclick="location.href='<%=contextPath%>/resent.bo?currentPage=<%=currentPage +1 %>'">&gt;</button>
				<%} %>
			
			</div>
	</div>

	</div>

</body>
</html>