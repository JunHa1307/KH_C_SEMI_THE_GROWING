<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.classes.model.vo.Class, com.kh.member.model.vo.Member"%>
<%
	ArrayList<Class> list = (ArrayList<Class>)request.getAttribute("list");
	Member loginUser = (Member)request.getSession().getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/views/common/header.jsp"%>
<% for(int i = 0; i < list.size(); i++){ %>
	<div class="<%= i %>" style="background-color:lightgray;width:100%;display:flex;align-items:center;border-radius:3em;">
		<div style="width:30%">
			<img src="<%= request.getContextPath() + list.get(i).getFilePath()+ list.get(i).getChangeName()%>" onerror="this.src='<%= request.getContextPath() %>/resources/image/noImage.png'">
		</div>
		<div style="width:30%">
			<%= list.get(i).getClassTypeName() + " " +(list.get(i).getClassGrade()+"").substring(5)+"학년 " + list.get(i).getClassName() %>
			<br><br>
			구성원 <%= list.get(i).getUserCount() %>명 | 담임 : <%= list.get(i).getTeacherName() %> 선생님 <%=(list.get(i).getClassGrade()+"").substring(0,4)+"년 " %>
		</div>
		<button class="apply <%= list.get(i).getClassNo() %>">가입신청</button>
	</div>
<% } %>
<script>
$(function(){
	$(".apply").click(function(){
		$(this).removeClass("apply");
		let cno = $(this).attr("class");
		$(this).addClass("apply");
		$.ajax({
			url : "<%=request.getContextPath()%>/classapply.c",
			method : 'GET',
				data : { uno:<%= loginUser.getUserNo()%>, cno:cno},
				dataType:"text",
				success : function(result){
					if(result == "0"){
						alert("이미 가입/가입신청 되었습니다");
					}else if(result == "1"){
						alert("가입신청에 성공했습니다.");
					}else{
						alert("가입신청에 실패했습니다");
					}
				},
		 	error:function(error,status,msg){
             	alert("상태코드 " + status + "에러메시지" + msg );
            },
		});
	});
});
</script>
<!-- 	</div>
	</div>
</div> -->

</body>
</html>