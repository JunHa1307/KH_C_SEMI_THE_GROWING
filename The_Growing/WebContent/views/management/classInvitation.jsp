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

.count {
	height: 200px;
	width: 100%;
	border-radius: 10px;
	border: 1px solid rgb(224, 224, 224);
	display: flex;
	align-items: center;
	justify-content: center;
	position: relative;
	box-shadow: 0px 8px 6px -6px #666;
	
}

.num {
	font-size: 50px;
	font-weight: 700;
	margin-bottom: 7px;
	display: inline-block;
	color:white;
	text-shadow: 2px 2px 6px black;
	
}

#invitecode{
	position: absolute;
	left:69%;

}

</style>
</head>
<body>
	<%@include file="../board/boardFrame.jsp"%>
	<div id="board_area">
		<div id="invite_header">
			<div id="invite_area">
				<div id="invite_title">초대하기</div>
			</div>
			<div id="invite_hr">
				<hr />
			</div>
		</div>
		<div class="count">
			<span class="num"><%=cInfo.getClassCode()%></span>
			<button id="invitecode" class="button_UI button--winona"
				data-text="초대코드 다시받기">
				<span>초대코드 다시받기</span>
			</button>
		</div>




		<script>
		 $(function(){
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
			
		 
		/* 게시판목록 버튼 활성화 */
		 $("#board_invite").css("fontWeight", "700");
          $("#board_invite").children().css("background", "rgb(237, 239, 243)");
          
          
          $("#invitecode").click(function(){
	        	  Swal.fire({
	                  title: '초대코드를 \n다시 받으시겠습니까?',
	                  text: "다시 받을 경우 기존 코드를 사용할 수 없습니다.",
	                  icon: 'warning',
	                  showCancelButton: true,
	                  confirmButtonColor: '#3085d6',
	                  cancelButtonColor: '#d33',
	                  confirmButtonText: '승인',
	                  cancelButtonText: '취소'
	              }).then((result) => {
	                  if (result.isConfirmed) {
	                      Swal.fire(
	                          '초대코드가 생성되었습니다'
	                         
	                      )
	                    setTimeout(() => location.href="<%=contextPath%>/classCode.bo", 1000);
	                   
	                  }
	              })
         	 });
			});
		</script>
</body>
</html>