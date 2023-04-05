<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
   href="<%= request.getContextPath() %>/resources/css/surveyForm.css">
</head>
<body>

	<div id="survey_wrap">
		<h1>설문조사</h1>
		<h2 style="text-align: center;">작성하기</h2>
		<form action="<%=request.getContextPath()%>/insert.su" method="post">
			<div id="insert-su">
				<div class="title">
					<table border-collapse:collapse; id="title_table">
						<tr>
							<td width="50">기간</td>
							<td width="130"><input type="date" name="fDate" required></td>
							<td width="140" style="text-align: center;">~</td>
							<td width="130"><input type="date" name="lDate" required></td>
						</tr>
						<tr>
							<td>제목</td>
							<td colspan="3"><input type="text" name="survey_title" size="55"
								placeholder="설문 제목을 입력해주세요" required></td>
						</tr>
					</table>
				</div>
				<div class="multiple">
					<table border-collapse:collapse; id="multiple_table">
						<h3>객관식 질문</h3>
						<tr>
							<td>제목</td>
							<td colspan="3"><input type="text" name="mTitle" size="55"
								placeholder="질문 제목을 입력해주세요" required></td>
						</tr>
						<tr>
							<td>내용</td>
							<td colspan="3"><input type="text" name="mContent" size="55"
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
					<div id="button_align">
						<button type="button" class="item_plus button_UI button--winona"
							data-text="항목 추가">항목 추가</button>
						<button type="button" class="item_minus button_UI button--winona"
							data-text="항목 삭제">항목 삭제</button>
					</div>
					<script>
						$(function() {
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
									alert("항목은 2개 이하로 삭제할 수 없습니다.");
								}
							});
							$(".item_plus, .item_minus").on("click",function(){
								console.log($(this).parents('.multiple').find('input[name=itemContent]'));
								$(this).parents('.multiple').find('input[name=itemCheck]').attr("value",
										$(this).parents('.multiple').find('input[name=itemContent]').length);
							})
						});
					</script>

				</div>



				<div class="short">
					<table border-collapse:collapse; id="short_table">
						<h3>주관식 질문</h3>
						<tr>
							<td>제목</td>
							<td colspan="3"><input type="text" name="sTitle" size="55"
								placeholder="질문 제목을 입력해주세요" required></td>
						</tr>
						<tr>
							<td>내용</td>
							<td colspan="3"><textarea type="text" name="sContent"
									style="resize: none;" rows="3" cols="56.5"
									placeholder="설문자가 대답하는 공간입니다." readonly></textarea></td>
						</tr>
						<input type="hidden" name="type" value=2 readonly>
					</table>
				</div>

			</div>
			<div id="bu_align">
				<button type="button" class="m_plus button_UI button--winona"
					data-text="객관식 질문 추가">객관식 질문 추가</button>
				<button type="button" class="s_plus button_UI button--winona"
					data-text="주관식 질문 추가">주관식 질문 추가</button>
				<button type="button" class="m_minus button_UI button--winona"
					data-text="질문 삭제">질문 삭제</button>
				<button type="submit" class=" button_UI button--winona"
					data-text="등록">등록</button>
			</div>
		<script>
			$(function() {
				$(".m_plus").click(function() {
					$("#insert-su").append($(".multiple").eq(0).clone(true));
				});
				$(".s_plus").click(function() {
					$("#insert-su").append($(".short").eq(0).clone(true));
				});
				$(".m_minus").click(function() {
					if($("#insert-su>div").length > 3){
						$("#insert-su>div").eq($("#insert-su>div").length-1).remove();						
					}else {
						alert("질문은 2개 이하로 삭제할 수 없습니다.");
					}
				});
			})
		</script>
		</form>
	</div>
</body>
</html>
