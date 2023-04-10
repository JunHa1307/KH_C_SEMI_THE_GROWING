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
	
	.controllBtn{
	border: 1px solid red;
		float: right;
	}
	
	.ctBtn{
		cursor: pointer;
	}
	#checkIcon{
		width: 70px;
	}
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
     <script>
     	function folderDeleteClick(){
     	  
     	  
    	  var checkBoxArr = []; 
    	  $("input:checkbox[name='folderCheckname']:checked").each(function() {
    	  	checkBoxArr.push($(this).attr("id"));     // 체크된 것만 값을 뽑아서 배열에 push
    	  	console.log(checkBoxArr);
    	  });
		
    	  $.ajax({
    	      type  : "POST",
    	      url    : "<%= contextPath %>/boardDelete.no",
    	      data: {
    	          checkBoxArr : JSON.stringify(checkBoxArr)        // folder seq 값을 가지고 있음.
    	      },
    	      success: function(result){
    	      	console.log(result);
    	      },
    	      error: function(xhr, status, error) {
    	      	alert(error);
    	      }  
    	   });
    	  
    	  
    	  $("#notice_content").load(window.location.href + " #notice_content"); 
    	};
    	  
     </script>
     
     </form>
     <br>
     <div id="notice_content" class="notice_content">
     	<%-- <% if(list2 != null){ %> --%>
     		<% for( Board b : list2) {%>
     		<% if(loginUser.getUserLevel() == 1){ %>
     		<div class="controllBtn">
					<button type="button" class="ctBtn" onclick="location.href='<%= contextPath %>/update.no?bno=<%= b.getBoardNo() %>'">수정</button>
					<button type="button" class="ctBtn" onclick="divPrint('<%= b.getBoardNo() %>');">인쇄</button>
			</div>
			<% } else{%>
			<div class="controllBtn">
				<button type="button" class="ctBtn" onclick="divPrint('<%= b.getBoardNo() %>');">인쇄</button>
			</div>
			<% } %>
			<div>No. <%= b.getBoardNo() %></div>
			<% if(loginUser.getUserLevel() == 1) { %>
				<input id="<%=b.getBoardNo() %>" type="checkbox" name="folderCheckname"> <label>삭제할 게시글을 선택하세요</label>
			<% }else{ %>
				<input id="<%=b.getBoardNo() %>" type="checkbox" name="folderCheckname" style="display:none;">
			<% } %>
			<div class="notice_con1">
				<table class="notice_confirm marginSt">
					<tr>
						<th class="notice_date divSt"><%=b.getCreateDate() %></th>
						<th class="divSt"><pre>선생님<br>확  인</pre>
							<img class="divSt" id="teacherProfile" src="<%= contextPath %>/resources/image/teacherNoticeCheckIcon.png" style="width: 50px; height: 50px;">
						</th>
						<th class="divSt"><pre>학부모<label>(/본인)</label><br>확  인</pre>
							<div class="dropdown">
			                <button 
			                    class="btn btn-secondary" 
			                    type="button" 
			                    id="dropdownMenuButton" 
			                    data-toggle="dropdown" 
			                    aria-haspopup="true" 
			                    aria-expanded="false">
			                    
			                    <img id="checkIcon" src="resources/image/checkIcon.png"/>
			                </button>
			                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			                  <a class="dropdown-item" href="#">오현지 학생</a>
			                  
			                </div>
			              </div>
						</th>
					</tr>
				</table>	
				<div id="print<%= b.getBoardNo() %>">
					<input type="hidden" value="<%=b.getBoardNo() %>" id="hiddenNo">
					<div class="notice_con_title marginSt">
						<p style="width: 42px; display:inline-block;">(공지) <p style="display:inline-block;">&nbsp;&nbsp;<%= b.getBoardTitle() %></p></p>
					</div>
					<div class="notice_con_content marginSt">
						<pre><%=b.getBoardContent() %></pre>
					</div>
				</div>
				<div class="bookmark marginSt" style="float:right;"><button type="button">스크랩</button></div>
			</div>
			<br>
		<%} %>
		<%-- <% }else{ %>
			<span>알림장 게시글이 없습니다.</span>
		<%} %> --%>
     </div>
     
     <script>
     	
     	function divPrint(boardNo){
     		var printId = "print"+boardNo;
     		var initBody = document.body.innerHTML;
     		
     		window.onbeforeprint = function(){
     			document.body.innerHTML = document.getElementById(printId).innerHTML;
     		
     		}
     		window.onafterprint = function(){
     			document.body.innerHTML = initBody;
     		}
     		window.print();
     	}
     </script>
</div>

</body>
</html>