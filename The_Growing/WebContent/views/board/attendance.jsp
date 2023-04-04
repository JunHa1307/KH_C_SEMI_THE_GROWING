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
<title>Insert title here</title>
</head>
<body>
<%@include file="boardFrame.jsp" %>
<!--<div id="board_wrap"> -->
			<div>
				<table id="attendTable" border=2>
				<caption>출석표</caption>
					<tr>
						<% for(int i =0; i < lastDay + 1; i++){ %>
							<th><%= i == 0 ? "이름" : i %></th>	
						<% } %>
					</tr>
					<% for(int i = 0; i < arr.length; i++){ %>
						<tr>
							<th><%= arr[i].split("/")[0].toString() %></th>
							<% for(int j = 0; j < lastDay; j++){ %>
								<td><%= arr[i].split("/")[1].toString().charAt(j) %></td>					
							<% } %>
						</tr>
					<% } %>
				</table>
				<button onclick="update();">업데이트</button>
			</div>
		</div>
 	</div>
</div>
<script>
	<% if(loginUser.getUserLevel() == 1){ %>
		$(function(){
			$("td").each(function(){
				if($(this).text() == "X"){
					$(this).attr("class","notAttend");
				}
				else if($(this).text() == "O"){
					$(this).attr("class","attendChecked");
				}else if($(this).text() == "/"){
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
					$(this).text("/");
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
	                   
	                      alert("수정되었습니다");
	                      location.reload();
	                }else{
	                   alert("수정 실패");
	                }
	             },
	             error:function(error,status,msg){
	                alert("상태코드 " + status + "에러메시지" + msg );
	             }
	          });
		}
	<% } %>
</script>
</body>
</html>