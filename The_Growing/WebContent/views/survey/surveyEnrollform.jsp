<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Growing</title>
<!--부트스트랩 알림을 위한 css-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>

<!-- 부트스트랩 게시판 목록을 위한 css -->

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">


<!--  alert 창 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="<%= request.getContextPath() %>/resources/js/alert.js"></script>


<link rel="stylesheet"
   href="<%= request.getContextPath() %>/resources/css/surveyForm.css">
</head>
<style>
#survey_wrap{
	position: relative;
}
@media only screen and (max-width: 780px) {
		#survey_wrap {
			width:90%;
			margin: 0;
		}
		#s3 button {
			width:21vw;
		}
}

.button_UI {
	border-color: #209dce;
}

#s1,#s2 {
	border: 5px solid #209dce;
}
#s3{
	margin:0;
	right:0;
	top:50%;
	z-index:1;
}
</style>
<body>
	<div id="s3">
		<button type="button" class="m_plus button_UI button--winona"
					data-text="객관식 추가">객관식 추가</button>
			<div>
				<button style="margin-top: 10px;"type="button" class="s_plus button_UI button--winona"
					data-text="주관식 추가">주관식 추가</button>
			</div>
			<div>
				<button style="margin-top: 10px;" type="button" class="m_minus button_UI button--winona"
					data-text="질문 삭제">질문 삭제</button>
			</div>
			
	</div>
	<div id="survey_wrap">
		 <div id="s1" ></div>
		<h1 style="font-weight:bold; margin: 0% 0% 0% ; font-weight:bold;">설문조사</h1>
		<button class="close" onclick="javascript:history.back();"></button> 
		<br>
		<h2 style=" margin:0% 5%; font-weight:bold;">작성하기</h2>
		<form action="<%=request.getContextPath()%>/insert.su" method="post">
			<div id="insert-su">
				<div class="title">
					<div id="s2"></div>
					<table style="display:flex;" border-collapse:collapse; id="title_table">
					<br>
						<tr>
							<td width="50"><h4>기간</h4></td>
							<td width="330"><input type="date" name="fDate" required></td>
							<td width="140" style="text-align: center;">~</td>
							<td width="330"><input type="date" name="lDate" required></td>
						</tr>
						<tr>
							<td><h4>제목</h4></td>
							<td colspan="3"><input type="text" name="survey_title" size="55"
								placeholder="설문 제목을 입력해주세요" required></td>
						</tr>
					</table>
				</div>
				<div class="multiple">
					<div id="s2"></div>
					<table border-collapse:collapse; id="multiple_table">
					<br>
						<h3 style="font-weight: bold;">객관식 질문</h3>
						<tr>
							<td><h4 style="font-weight:bold;">Q.</h4></td>
							<td colspan="3"><input type="text" name="mTitle" size="155"
								placeholder="질문 제목을 입력해주세요" required></td>
						</tr>
						<tr>
							<td><h4 style="font-weight:bold;">A.</h4></td>
							<td colspan="3"><input type="text" name="mContent" size="155"
								placeholder="질문 내용을 입력해주세요"></td>
						</tr>
						<tr>
							<td align="center"><input type="radio" name="mCheck"></td>
							<td colspan="3"><input type="text" name="itemContent"
								size="55" placeholder="항목 내용을 입력해주세요" required><br></td>
						</tr>
						<tr>
							<td align="center"><input type="radio" name="mCheck"></td>
							<td colspan="3"><input type="text" name="itemContent"
								size="55" placeholder="항목 내용을 입력해주세요" required><br></td>
						</tr>
						<tr id="a">
							<td align="center"><input type="radio" name="mCheck"></td>
							<td colspan="3"><input type="text" name="itemContent"
								size="55" placeholder="항목 내용을 입력해주세요" required><br></td>
						</tr>
						<input type="hidden" name="type" value=1 readonly>
						<input type="hidden" name="itemCheck" value="3">
					</table>
					<div id="button_align" >
						<button type="button" class="item_plus button_UI button--winona"
							data-text="항목 추가">항목 추가</button>
						<button type="button" class="item_minus button_UI button--winona"
							data-text="항목 삭제">항목 삭제</button>
					</div>
				</div>
				
				<div class="short">
					<div id="s2"></div>
					<table border-collapse:collapse; id="short_table">
					<br>
						<h3 style="font-weight:bold;">주관식 질문</h3>
						<tr>
							<td><h4 style="font-weight:bold;">Q.</h4></td>
							<td colspan="3"><input type="text" name="sTitle" size="155"
								placeholder="질문 제목을 입력해주세요" required></td>
						</tr>
						<tr>
							<td><h4 style="font-weight:bold;">A.</h4></td>
							<td colspan="3"><textarea type="text" name="sContent"
									style="resize: none; border-radius:15px;"  rows="3" cols="56.5"
									placeholder="설문자가 대답하는 공간입니다." readonly></textarea></td>
						</tr>
						<input type="hidden" name="type" value=2 readonly>
					</table>
				</div>
			</div>
		  	<div id="bu_align">
				<button type="submit" class=" button_UI button--winona"
					data-text="등록">등록</button>
			</div>  
		</form>
	</div>
			<script>
				let multipleQues = $(".multiple").eq(0).html();
				let shortQues = $(".short").eq(0).html();
				$(function() {
					$(".m_plus").click(function() {
						$("#insert-su").append("<div class='multiple'>"+multipleQues+"</div>");
						clickEvent();
					});
					$(".s_plus").click(function() {
						$("#insert-su").append("<div class='short'>"+shortQues+"</div>");
					});
					$(".m_minus").click(function() {
						if($("#insert-su>div").length > 1){
							$("#insert-su>div").eq($("#insert-su>div").length-1).remove();						
						}else {

							error("질문은 0개 이하로 삭제할 수 없습니다.");

						}
					});
					clickEvent();
				});
				
				function clickEvent(){
					$(".item_plus").off("click");
					$(".item_minus").off("click");
					$(".item_plus, .item_minus").off("click");
					$(".item_plus").click(function() {
						let item = "<tr >"
								+ "<td align='center'><input type='radio' name='mCheck'></td>"
								+ "<td colspan='3'><input type='text' name='itemContent' size='55' placeholder='항목 내용을 입력해주세요' required><br></td>"
								+ "</tr>";
						$(this).parents('div').siblings('table').find("tr:last").after(item);
					});
					$(".item_minus").click(function() {
						if($(this).parents('div').siblings('table').find("input[name=mCheck]").length > 2) {
							$(this).parents('div').siblings('table').find("tr:last").remove();
						}else {

							error("항목은 2개 이하로 삭제할 수 없습니다.");

						}
					});
					$(".item_plus, .item_minus").on("click",function(){
						console.log($(this).parents('.multiple').find('input[name=itemContent]'));
						$(this).parents('.multiple').find('input[name=itemCheck]').attr("value",
								$(this).parents('.multiple').find('input[name=itemContent]').length);
					});
				}
			</script>
</body>
</html>
