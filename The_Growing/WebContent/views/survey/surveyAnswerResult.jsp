<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.survey.model.vo.Survey, com.kh.survey.model.vo.Question, com.kh.survey.model.vo.Answer, java.util.ArrayList, java.util.Arrays"%>
<%
	Survey survey = (Survey)request.getAttribute("survey");
	Question ques = (Question)request.getAttribute("question");
	ArrayList<Answer> ans = (ArrayList<Answer>)request.getAttribute("answer");
%>
<!DOCTYPE html>
<html>
<head>
<!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>The Growing</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
	* {
	font-family: 'Gowun Dodum', sans-serif;
	}
	
	html{
		width:100%;
		background-color: rgba(242,245,247,.7);
	}
	
	#contentArea{
		max-width:1500px;
		width:70%;
		margin: auto;
	}
	
	.close {display:inline-block;*display:inline;float:right; border-style:none; background-color:rgba(242,245,247,.7);} 
	.close:after {content: "\00d7"; font-size:4vw; cursur:pointer;}
	.close:hover{background-color: rgba(242,545,547,.7); cursor: pointer;}
	.question1, .question2{
		background-color: #ffffff;
		border: 1px solid #ffffff;
		border-radius: 1em;
		padding: 1em;
		margin: 1vw 0 1vw 0;
	}
	
	.title{
		font-size: 1.5em;
		padding: 0.7vw 0 0.7vw 0;
		
	}
	
	.mContent{
		border: 1px solid rgba(242,245,247,.7);
		background-color: rgba(242,245,247,.7);
		padding: 0.5vw;
		margin-bottom: 1vw;
	}
	
	 .list-table {
            margin: auto;
            min-width: 55vw;
            min-height: 10vw;
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
            text-align: center;
        }


        @media screen and (min-width: 60vw) {
            .list-table tr:hover:not(:first-child) {
                background-color: #d8e7f3;
        }
      
        .list-table th, .list-table td {
            padding: 1em !important;
        }
    	}
	
</style>
</head>
<body>
	<% int m = 0; %>
	<% int s = 0; %>
	<% int item = 0; %>
	<div id="contentArea">
	<h1 style="display:inline-block;font-size:2vw;">설문  "<%= survey.getTitle() %>"  의 응답결과 </h1>
	<button class="close" onclick="javascript:history.back();"></button> 
	<% for(int i = 0; i < ques.getQuesType().length; i++){ %>
		<% if(ques.getQuesType()[i].contains("1") ){ %>
			<div class="question1">
				<span>질문<%= i+1 %>(객관식)</span>
				<div class="title"><b><%= ques.getmTitle()[m] %></b></div>
				<div class="mContent"><b><%= ques.getmContent()[m] %></b></div>
				<canvas id="myChart<%= i%>"></canvas>
			</div>
			<% 
				String[] arr= new String[Integer.parseInt(ques.getItemNo()[m].replace(" ", ""))];
				String[] backgroundColor = new String[arr.length];
				String[] borderColor = new String[arr.length];
				int[] data = new int[arr.length];
				
			    for(int j = 0; j < Integer.parseInt(ques.getItemNo()[m].replace(" ", "")); j++){ 
					 arr[j] =  ques.getItemContent()[item];
					 if(j%3 == 0){
						 backgroundColor[j] = "\"rgba(255, 99, 132, 0.2)\"";
						 borderColor[j] = "\"rgba(255, 99, 132, 1)\"";
					 }else if(j%3 == 1){
						 backgroundColor[j] = "\"rgba(54, 162, 235, 0.2)\"";
						 borderColor[j] = "\"rgba(54, 162, 235, 1)\"";
					 }else{
						 backgroundColor[j] = "\"rgba(255, 206, 86, 0.2)\"";
						 borderColor[j] = "\"rgba(255, 206, 86, 1)\"";
					 }
					 item++;
				} 
			    
				for(int j = 0; j < ans.size(); j++){ 
					data[(Integer.parseInt(ans.get(j).getItemAns()[m].replace(" ", "")))] += 1;
				} 
			%>
			<script type="text/javascript">
	            var context = document.getElementById('myChart<%= i%>').getContext('2d');
				var myChart = new Chart(context, {
					type : 'bar', // 차트의 형태
					data : { // 차트에 들어갈 데이터
						labels : //x 축 정보
							[<% for(int y = 0; y < data.length; y++){%>
										"<%= arr[y]%>",
									<% }%>],
						datasets : [ { //데이터
							label : "<%= ques.getmTitle()[m] %>", //차트 제목
							fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
							data : [<% for(int y = 0; y < data.length; y++){%>
										"<%= data[y]%>",
									<% }%>], // 그래프 값
							backgroundColor : <%= Arrays.toString(backgroundColor)%>,
							borderColor : <%= Arrays.toString(borderColor)%>,
							borderWidth : 1
						}]
					},
					options : {
						indexAxis:'y',
						scales : {
							 y: {
						          beginAtZero: true
					        }
						},
					}
				});
			</script>
			<% m++; %>
		<% }else { %>
			<div class="question2">
				<span>질문<%= i+1 %>(주관식)</span>
				<div class="title"><b><%= ques.getsTitle()[s] %></b></div>
				<table class="list-table">
					<tbody>
						<tr>
							<th>제출일시</th>
							<th>응답자명</th>
							<th>자녀명</th>
							<th>응답내용</th>
						</tr>
						<% for(int j = 0; j < ans.size(); j++){ %>
						<tr>
							<td><%= ans.get(j).getSubmitDate() %></td>
							<td><%= ans.get(j).getUserName() %></td>
							<td><%= ans.get(j).getChildName() == null ? "없음" : ans.get(j).getChildName() %></td>
							<td><%= ans.get(j).getWriteAns()[s] %></td>
						</tr>
						<% } %>
					</tbody>
				</table>
			</div>
			<% s++; %>
		<% } %>
	<% } %>
	</div>
</body>
</html>