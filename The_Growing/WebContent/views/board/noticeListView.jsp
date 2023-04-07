<%@page import="com.kh.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ArrayList<Board> list2 = (ArrayList<Board>) request.getAttribute("list2");
	int refCno = (int)request.getSession().getAttribute("refCno");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice List View Page</title>
<style>
	.notice_con1 .divSt{
		display: inline-flex;
	}
	
	.notice_con1{
		height: 400px;
		border-radius: 20px;
		border: 5px solid gray;
		background-color: rgb(235, 236, 240);
	}
	.notice_content div{
		font-weight: 900;
	}
	.notice_confirm{
		width:100%;
		border-bottom: 1px solid gray;
	}
	.notice_confirm>th{
		border-left: 1px solid gray;
	}
	.notice_date{
		margin: auto;
		width: 70%;
	}
	.notice_con_title, .notice_con_content{
		width: 15%;
	}
	
	.notice_con_title{
		display: inline-flex;
	}
	
	.notice_con_content{
		width:850px;
		background-color: white;
	}
	.notice_con_content>pre{
		text-decoration: underline black;
	}
/* 	.marginSt{
		margin-left: 20px;
		margin-right: 20px;
	} */
	
	
</style>
</head>
<body>
<%@include file="boardFrame.jsp" %>
<div id="board_area">
	<form action="<%= contextPath %>/views/board/noticeEnrollForm.jsp" method="post">
	<div id="album_header">
    	<div id="album_area">
       		<div id="album_title">알림장</div>
        	<div id="album_button" align="right" class="box">
                  <button id="notice_Enroll" type="submit" class="button_UI button--winona" data-text="글 등록" style="margin-right: 10px;"><span>글 등록</span></button>
            </div>
        </div>
        <hr>
     </div>
     </form>
     <br>
     <div class="notice_content">
     	<% for( Board b : list2) {%>
			<div class="notice_con1">
				<table class="notice_confirm marginSt">
					<tr>
						<th class="notice_date divSt"><%=b.getCreateDate() %></th>
						<th class="divSt"><pre>선생님<br>확  인</pre>
							<img class="divSt" id="teacherProfile" src="<%= contextPath %>/resources/image/cat.jpg" style="width: 50px; height: 50px;">
						</th>
						<th class="divSt"><pre>학부모<label>(/본인)</label><br>확  인</pre>
							<img class="divSt" id="teacherProfile" src="<%= contextPath %>/resources/image/cat.jpg" style="width: 50px; height: 50px;">
						</th>
					</tr>
				</table>
				<input type="hidden" value="<%=b.getBoardNo() %>" id="hiddenNo">
				<div class="notice_con_title marginSt">
					<p>(공지) <p>&nbsp;&nbsp;<%= b.getBoardTitle() %></p></p>
				</div>
				<div class="notice_con_content marginSt">
					<pre><%=b.getBoardContent() %></p>
				</div>
				<div class="bookmark marginSt" style="float:right;"><button type="button">스크랩</button></div>
			</div>
			<br>
		<%} %>
     </div>
</div>

</body>
</html>