<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.classes.model.vo.Class, com.kh.member.model.vo.Member"%>
<%
	ArrayList<Class> list = (ArrayList<Class>)request.getAttribute("list");
	Member loginUser = (Member)request.getSession().getAttribute("loginUser");
	String searchClassName = (String)request.getAttribute("searchClassName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#class_wrap{
	width:60%;
	min-height:250px;
	margin: auto;
	border:  1px solid rgb(224, 224, 224);
	border-radius:10px;
	padding:50px 0px 50px 0px;
	background: rgb(249, 250, 252);
}
#searchWord{
	height:40px;
	width:30%;
	border: 2px solid rgb(57, 70, 146);
	border-radius:10px;
	margin: auto;
	margin-bottom:30px;
	padding:7px 0px 0px 10px;
	font-size:15px;
	font-weight:700;
	background: white;
	
	
}
#class_inner{
	height:130px;
	width:80%;
	border-radius:100px;
display:flex;
align-items:center;
background-color: /* rgb(240, 246, 248); */ white;
box-shadow: -5px -5px 10px 0px rgba(255, 255, 255, 0.5), 5px 5px 10px 0px rgba(0, 0, 0, 0.3);
margin: auto;
margin-bottom:20px;

}

#class_img{
	width: 6.5vw;
	height: 6.5vw;
	min-width:70px;
	min-height:70px;
	margin: auto;
}
#class_img>img{
	width:100%;
	height: 100%;
	border-radius:50%;
	object-fit:cover;
}

.apply{
	background-color: rgb(57, 70, 146);
	border-radius: 10px;
	color:white;
	border: none;
	width:80%;
	height:40px;
	font-weight:550;
	font-size:1.1vw;
	
	
}
#searchSize{
	width:70%;
	margin:auto;
	height:40px;
	font-weight:600;
}
#noSearch{
 margin:auto; 
 margin-top:40px; 
 text-align: center; 
 font-weight:600; 
}


@media only screen and (max-width: 1020px) {
#class_wrap{
	width:90%;
	min-height:250px;
	margin: auto;
	border:  1px solid rgb(224, 224, 224);
	border-radius:10px;
	padding:50px 0px 50px 0px;
}
#class_inner{
	height:130px;
	width:95%;
	border-radius:100px;
display:flex;
align-items:center;
background-color: /* rgb(240, 246, 248); */ white;
box-shadow: -5px -5px 10px 0px rgba(255, 255, 255, 0.5), 5px 5px 10px 0px rgba(0, 0, 0, 0.3);
margin: auto;
margin-bottom:20px;

	}
	#searchWord{
	height:40px;
	width:60%;
	border: 2px solid rgb(57, 70, 146);
	border-radius:10px;
	margin: auto;
	margin-bottom:30px;
	padding:7px 0px 0px 10px;
	font-size:15px;
	font-weight:700;
	background: white;
	
	
}
	
	
}




</style>
</head>
<body>
<%@include file="/views/common/header.jsp"%>
<div id="class_wrap">
<div id="searchWord">
	검색 내용 : <span style="color:rgb(75, 93, 193);"><%=searchClassName == "" ? " " :'"'+searchClassName+'"'%></span>
</div>
<div id="searchSize">
	검색 결과 : <%=list.size()==0?"없음":list.size()+"개"%>
</div>
<%if(list.size()!=0) {%>
<% for(int i = 0; i < list.size(); i++){ %>
	
	<div id="class_inner" class="<%= i %>" >
		<div id="class_img" >
			<img src="<%= request.getContextPath() + list.get(i).getFilePath()+ list.get(i).getChangeName()%>" onerror="this.src='<%= request.getContextPath() %>/resources/image/noImage.png'">
		</div>
		<div id="class_text"  style="width:55%">
			
			<span style="font-size:1.4vw; font-weight:600;"><%= list.get(i).getClassTypeName() + " " +(list.get(i).getClassGrade()+"").substring(5)+"학년 " + list.get(i).getClassName()+"반" %></span>
			<br><br>
			<span style="font-size:0.9vw; font-weight:600; color:grey; word-break:break-all;">구성원 <%= list.get(i).getUserCount() %>명 | 담임 : <%= list.get(i).getTeacherName() %> 선생님 | <%=(list.get(i).getClassGrade()+"").substring(0,4)+"년 " %></span>
		</div>
		<div style="width:23%"><button data-cno="<%= list.get(i).getClassNo() %>" class="apply ">가입 신청</button></div>
	</div>
	
		<% } %>
<%}else{ %>
		<div id="noSearch">조회된 결과가 없습니다.</div>
	<%} %>
</div>
<script>
$(function(){
	$(".apply").click(function(){
		let cno = $(this).data("cno");
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
</body>
</html>