<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int lastDay = (int)request.getAttribute("lastDay");
	String month = request.getAttribute("month") +"";
	int classMember = 2;
	String[] arr = (request.getAttribute("attendTable")+"").replace("[","").replace(" ","").replace("]","").split(",");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TheGrowing</title>
<style>
	#main-title{
		   width: 70%;
		   font-size: 25px;
		   font-weight: 700;
		   padding-left: 14px;

	}
	
	#board_area{
		height: 60%;
    	padding: 0px 20px 20px 20px;
    	overflow: auto;
	}
	
	#board_hr{
		width: 100%;
    	height: 30%;
	}
		
	 .okc{
	 	width:100%;
	 	height:80%;
	 }
	 
	#attendTable {
		border-collapse: separate;
  		border-spacing: 0;
  		border-radius: 1em;
  		box-shadow: -5px -5px 7px 0px rgba(255, 255, 255, 0.5), 3px 3px 7px 0px rgba(0, 0, 0, 0.3);
	}
	
	tr:first-child th:first-child {
	  border-top-left-radius: 1em;
	}
	tr:first-child th:last-child {
	  border-top-right-radius: 1em;
	}
	tr:first-child th:first-child {
	  border-top-left-radius: 1em;
	}
	tr:first-child th:last-child {
	  border-top-right-radius: 1em;
	}
	td {
	  border-right: 1px solid #c6c9cc;
	  border-bottom: 1px solid #c6c9cc;
	}
	td:first-child {
	  border-left: 1px solid #c6c9cc;
	}
	tr:last-child td:first-child {
	  border-bottom-left-radius: 1em;
	}
	tr:last-child td:last-child {
	  border-bottom-right-radius: 1em;
	}
	tr{
		text-align:center;
	}
	th, td {
		width:1%;
		min-width: 25px;
	}
	.tableHead {
		background-color: #ff5500;
		color: #ffffff;
	}
	tr:nth-child(odd){
		background-color: #eaeaed;
	}
	.memberName {
		min-width: 60px;
	}
	
	@media only screen and (max-width: 1200px) {
		#board_area {
			width: 100%;
		}
	}
	 
	@media only screen and (min-width: 1200px) {
		#board_area {
			width: 80%;
		}
	}
	 
</style>
</head>
<body>
<%@include file="boardFrame.jsp" %>
	<div id="board_area">
		<div id="album_header">
		 	<div id="album_area">
				<div id="main-title">출석표</div>
				<% if(loginUser.getUserLevel() == 1){ %>
				<div id="album_button" align="right" class="box">
					<button id="album_Enoroll" class="button_UI button--winona" data-text="업데이트" style="margin-right: 10px;"  onclick="update();">
						<span>업데이트</span>
					</button>
				</div>
				<%} %>
			</div>
			<div id="album_hr">
				<hr>
			</div>
		</div>  
			<div class="okc">
				<% if(loginUser.getUserLevel() == 1){ %>
					<p style="font-size:1vw;">표 안을 클릭하면 출석 상태가 변경됩니다.( 'X' = 미출석, 'O' = 출석, 'E' = 기타 )</p>
				<%} %>
				<h3></h3>
				<table id="attendTable">
					<tr>
						<% for(int i =0; i < lastDay + 1; i++){ %>
						
							<th class="tableHead"><%= i == 0 ? "이름" : i %></th>	
						<% } %>
					</tr>
					<% for(int i = 0; i < arr.length; i++){ %>
						<tr>
							<td class="memberName"><%= arr[i].split("/")[0].toString() %></td>
							<% for(int j = 0; j < lastDay; j++){ %>
								<td title="<%= arr[i].split("/")[0].toString() + " , " + (j+1)+"일" %>"><%= arr[i].split("/")[1].toString().charAt(j) %></td>					
							<% } %>
						</tr>
					<% } %>
				</table>
			</div>
		</div>
 	</div>
</div>
<script>
$("#board_check").css("fontWeight", "700");
$("#board_check").children().css("background", "rgb(237, 239, 243)");

	let month = ("0" + (1 + new Date().getMonth())).slice(-2)+"월";
	$(".okc>h3").text(month+" 출석 현황");
	
	<% if(loginUser.getUserLevel() == 1){ %>
		$(function(){
			$("td").each(function(){
				if($(this).text() == "X"){
					$(this).attr("class","notAttend");
				}
				else if($(this).text() == "O"){
					$(this).attr("class","attendChecked");
				}else if($(this).text() == "E"){
					$(this).attr("class","attendLate");
				}
			});
			$("td").on("click", function(e) {
				if($(this).attr("class") == "notAttend"){
					$(this).attr("class","attendChecked");
					$(this).text("O");
				}else if($(this).attr("class") == "attendChecked"){
					$(this).removeClass("attendChecked");
					$(this).attr("class","attendLate");
					$(this).text("E");
				}else if($(this).attr("class") == "attendLate"){
					$(this).removeClass("attendLate");
					$(this).attr("class","notAttend");
					$(this).text("X");
				} 
			});
		});
		
		function update(){
			let arr = [];
							 
			let table =document.getElementById('attendTable');
			let rowList = table.rows; // 행들 구하기
			
			for (i=1; i<rowList.length; i++) {//thead부분 제외.
				let str = ""; 
				let row = rowList[i];
				let tdsNum = row.childElementCount;// 자식요소 갯수 구하기.
				
				for (var j = 0; j < tdsNum; j++){//row안에 있는 값 순차대로 가져오기.
					let row_value;
					if(j == 0){
						row_value = row.cells[j].innerHTML + "/"; 
					}else{
						row_value = row.cells[j].innerHTML; // 셀 값 구하기
					}
						str += row_value;//값을 하나의 text값으로 만듦						
        
    	  		};
        		arr.push(str);
			}
			arr.sort();
			arr = JSON.stringify(arr);
			$.ajax({
	             url : "<%= contextPath %>/attendance.bo",
	             method : 'POST',
	             data : {arr:arr, cno : <%= cInfo.getClassNo()%>, month : <%= month%>},       
	             dataType : 'text',
	             success:function(result){
	                if(result != 'Fail'){
	                   
	                      alertMsg("수정되었습니다");
	                      setTimeout(() =>  location.reload(), 1000);
	                }else{
	                   error("수정 실패");
	                }
	             },
	             error:function(error,status,msg){
	                error("상태코드 " + status + "에러메시지" + msg );
	             }
	          });
		}
	<% } %>
</script>
</body>
</html>