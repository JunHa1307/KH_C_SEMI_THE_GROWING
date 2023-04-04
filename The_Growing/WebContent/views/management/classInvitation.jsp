<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#invite_header {
	height: 80px;
	width: 100%;
	
}

#invite_area>div {
	float: left;
	height: 100%;
}

#invite_title {
	width: 70%;
	font-size: 25px;
	font-weight: 700;
	padding-left: 14px;
}



#invite_area {
	width: 100%;
	height: 70%;
}


#invite_hr {
	width: 100%;
	height: 30%;

}

#invite_hr>hr {
	margin: 0;
}

.invite_content {
	height:200px;
	width:100%;
	border-radius: 10px;
	border: 1px solid rgb(224, 224, 224);
	background-color: rgb(241, 253, 247);
	 display: flex;
align-items: center;
 justify-content: center;
}

#class_code{
	font-size:60px;
	font-weight: 700;
	margin-right:50px;

}


</style>
</head>
<body>
	<%@include file="../board/boardFrame.jsp" %>
	<div id="board_area">
			<div id="invite_header">
				<div id="invite_area">
					<div id="invite_title">초대하기</div>
				</div>
				<div id="invite_hr">
					<hr />
				</div>
			</div>
			<div class="invite_content">
				<div id="class_code"><%=cInfo.getClassCode() %></div>
				
				<button id="invitecode" class="button_UI button--winona"
						data-text="초대코드 다시받기">
						<span>초대코드 다시받기</span>
					</button>
			</div>
			
			
		<script>
		 $(function(){
		 
		/* 게시판목록 버튼 활성화 */
		 $("#board_invite").css("fontWeight", "700");
          $("#board_invite").children().css("background", "rgb(239, 243, 239)");
          
          
          $("#invitecode").click(function(){
        		   if (!confirm("초대코드를 다시 받으시겠습니까?\n다시 받을 경우 기존 코드를 사용할 수 없습니다.")) {
        			   location.reload();
        	        } else {
        	        	location.href="<%=contextPath%>/classCode.bo";
        	        	 
        	        }
          
          });
      });
		</script>
</body>
</html>