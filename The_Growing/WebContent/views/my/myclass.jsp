<%@page import="com.kh.classes.model.vo.Class"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Class> list = (ArrayList<Class>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Growing</title>
<link rel="shortcut icon" type="image/svg" href="<%= request.getContextPath() %>/favicon.svg"/>
<style>

.myclass_content {
	height: 250px;
	width: 100%;
	/* background-color: blue; */
}

.myclass_content>div {
	float: left;
	height: 100%;
}

.myclass_info {
	width: 33.3%;
	
	/* background-color: bisque; */
}





#user_profile {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	margin: auto;
	 box-shadow:0px 8px 6px -6px;
overflow: hidden;
background-color: white;
z-index:9;
}

#top {
	height: 50px;
	width: 100%;
	background-color: white;
	
}

#bottom {
	height: 175px;
	width: 100%;
	border-radius:10px;
	 box-shadow: 0 3px 10px rgba(0,0,0,0.25);
	 background-color: rgb(246, 241, 252);
	 
	
}

#user_profile>img{
	width: 100%;
	height: 100%;
	object-fit: cover;
	cursor:pointer;
	 transition : 0.5s;
	  box-shadow:0px 8px 6px -6px;
	
	
}
#user_profile>img:hover{

	 transform: scale(1.1);
	
	
}

#myclass_small{
	width: 90%;
	height: 90%;
	
	margin : auto;
	min-width: 270px;
	border-radius: 10px;
	
}

.b1{
padding:5px; 
font-size:16px; 
font-weight:300;
border-radius: 10px;
color:grey;

}
.b2{
text-align: center; 
padding-top:25px;
font-size:20px; 
font-weight:700;
}
.b3{
text-align: center;
font-size:17px; 
font-weight:500;
}
.b_hover:hover{
	cursor: pointer;
	color : grey;
}



@media only screen and (max-width: 1000px){
.myclass_info {
	width: 50%;
	

}


}
@media only screen and (max-width: 800px){
.myclass_info {
	width: 100%;

}


}
</style>
</head>
<body>
	<%@include file="myInfoFrame.jsp"%>
	<div id="board_area">
		<div id="myclass_header">
		<div id="myclass_area">
				<div id="myclass_title">나의 클래스</div>
		</div>
		<div id="myclass_hr">
			<hr />
		</div>
		</div>
		
		<div class="myclass_content">
			<%
				for (int i =0; i<list.size(); i++) {
					
			%>
				<%if(i%3==0){ %>
				<div class="myclass_info" data-aos="fade-up" data-aos-duration="300" >
				<%}else if(i%3==1){ %>
				<div class="myclass_info" data-aos="fade-up" data-aos-duration="700" >
				<%}else{ %>
				<div class="myclass_info" data-aos="fade-up" data-aos-duration="1000" >
				<%} %>
			<div id="index<%=i%>" class="index"></div>
				<div id="myclass_small">
				<div id="top">
					<div id="user_profile">
					<img class="move" src="<%= contextPath +list.get(i).getFilePath()+list.get(i).getChangeName() %>" alt="클래스 프로필" onerror="this.src='<%= contextPath %>/resources/image/noImage.png'"></div>
				</div>
				<div id="bottom">
				 	<div class="b1 move"><%=list.get(i).getClassDate()%>년</div>
					<div class="b2 b_hover move" ><%=list.get(i).getClassTypeName() %> <%=list.get(i).getClassGrade()%>학년 <%=list.get(i).getClassName() %></div>
					<div class="b3 b_hover move">
						담임 : <%=list.get(i).getTeacherName() %> 선생님 <br>학급 수 : <%=list.get(i).getUserCount() %>명
					</div>
				</div>
				</div>
			</div>
			<%
				}
			%>
			
		
	</div>
	</div>
	</div>
	</div>
	
	<script>
	$(function(){
	        $("#myClass").css("fontWeight","700").fadeIn(1000);
	        $("#myClass").children().css("background","rgb(237, 239, 243)");
	       
	        let classList = []; 
	       
	        
	        <% for(int i = 0; i < list.size(); i++){%>
	          classList.push("<%= list.get(i).getClassNo()%>");
	          
	          <%}%>
	        
	        $(".move").click(function(){
	       
	      let index = $(this).parents(".myclass_info").children(".index").attr("id").substr(-1);
		    		let cno = classList[index];
		    		location.href="<%=contextPath%>/boardmove.bo?cno="+ cno;
	        });
		    	
		    
		    
	   
	});

	
	
	</script>
	
	
	
	
	
	
	
	
</body>
</html>