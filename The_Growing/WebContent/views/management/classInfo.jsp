<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Class c = (Class)request.getAttribute("c");
Member m = (Member)request.getAttribute("m");

%>
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
	height:600px;
	width:100%;
	border-radius: 10px;
	border: 1px solid rgb(224, 224, 224);

	
}


.content_title{
width:80%;
	height:8%;
	background-color: white;
	margin-bottom:10px;
	margin:auto;
	margin-top:25px;
}

.name>div{
	float: left;
	height: 100%;
	width:50%;
text-align: center;
font-size:18px;
font-weight:700;

}

.name>div>input{

text-align: center;
border-radius :10px; 
border: 1px solid rgb(224, 224, 224);


}
.content_title{
	font-size:20px;
	font-weight: 700;
	
}
#class_code{
	font-size:40px;
	font-weight: 700;
	text-align: center;
	text-shadow: 2px 2px 6px black;
	color:white;
}
.bColor{
	background-color:  rgb(243, 248, 255);
	width:80%;
	height:15%;
	margin:auto;	
	border-radius: 10px;
	justify-content: center;
	padding-top:15px;
	box-shadow: 0px 8px 6px -6px #666;
}
.bColor>div{
	margin: auto;
	
}


</style>
</head>
<body>
	<%@include file="../board/boardFrame.jsp" %>
	<div id="board_area">
			<div id="invite_header">
				<div id="invite_area">
					<div id="invite_title">클래스 정보</div>
				</div>
				<div id="invite_hr">
					<hr />
				</div>
			</div>
			<div class="invite_content">
				<div class="content_title" style="margin-top:30px;">클래스 코드</div>
				<div id="class_code" class="bColor"><span class="num"><%=c.getClassCode() %></span></div>
				<div class="content_title">클래스 가입정보</div>
				<%if(loginUser.getUserLevel()==2) {%>
				<div class="name bColor" >
					<div>본인이름 <br> <input type="text" readonly value="<%=m.getUserName()%>"></div>
					<div>자녀이름 <br> <input type="text" readonly value="<%=m.getChildrenName()%>"></div>
				</div>
				<%}else{ %>
				<div class="name bColor" >
					<div>본인이름 <br> <input type="text" readonly value="<%=m.getUserName()%>"></div>
					<div>반 이름 <br> <input type="text" readonly value="<%=c.getClassName()%>"></div>
				</div>
				<%} %>
				<div class="content_title">클래스 탈퇴</div>
				<div class="bColor"><div class="box" style="width:250px; height:60px">  <button class="button_UI button--winona" data-text="클래스 탈퇴하기" style="width:100%; height:100%;" id="button"><span>클래스 탈퇴하기</span></button></div></div>
                </div>				
			
			</div>
			
			
			
			
		<script>
			$(function(){
		 
				/* 게시판목록 버튼 활성화 */
				 $("#board_option").css("fontWeight", "700");
		          $("#board_option").children().css("background", "rgb(237, 239, 243)");
		          
		          
		          $("#button").click(function(){
		        		 Swal.fire({
		                     title: '탈퇴하시겠습니까?',
		                     text: "",
		                     icon: 'warning',
		                     showCancelButton: true,
		                     confirmButtonColor: '#3085d6',
		                     cancelButtonColor: '#d33',
		                     confirmButtonText: '삭제',
		                     cancelButtonText: '취소'
		                 }).then((result) => {
		                     if (result.isConfirmed) {
		                    	 
		                         Swal.fire(
		                             '탈퇴가 완료되었습니다.'
		                         )
		                         setTimeout(() => 	location.href="<%=contextPath%>/classmemberdelete.c", 1000);
		                     }
		                 })
		          });
		          
		          $('.num').each(function(){
				        $(this).prop('Counter', 0).animate({
				            Counter: $(this).text()}, {
				            duration: 1000,
				            easing: 'swing',
				            step: function (now){
				                $(this).text(Math.ceil(now));
				            }
				        });
				    });
			 });
		</script>
</body>
</html>