<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String alertMsg = (String) session.getAttribute("alertMsg");
%>
<html lang="en">
<head>
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

<!--부트스트랩&jquery-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

<!-- tabulator 테이블 라이브러리 -->
<link href="https://unpkg.com/tabulator-tables/dist/css/tabulator.min.css" rel="stylesheet">
<script type="text/javascript" src="https://unpkg.com/tabulator-tables/dist/js/tabulator.min.js"></script>

<!-- fullcalendar 캘린더 라이브러리 CDN -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>

<!-- Slick 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">

<!-- css -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/button.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/header.css">
</head>
<body>
	<script>
		const msg = "<%= alertMsg  %>";
		
		if(msg != "null"){
			alert(msg);
			<% session.removeAttribute("alertMsg"); %>
		}
	
	</script>
<div class="wrap">
    <div id="header">
       <button id="logoBtn" class="btnStyle" type="button">
           <img id="logo" src="../../resources/image/KakaoTalk_20230317_141025465-removebg-preview.png">
       </button>
       <div id="search">
           <button id="searchBtn" type="button">
               <input id="seachClass" type="text" placeholder="찾으시는 클래스를 입력해주세요.">
               <img src="<%= request.getContextPath() %>/resources/image/searchIcon.png">
           </button>
       </div>
       <div class="dropdown">
           <button 
               class="btn btn-secondary" 
               type="button" 
               id="dropdownMenuButton" 
               data-toggle="dropdown" 
               aria-haspopup="true" 
               aria-expanded="false">
               
               <img id="alarmIcon" src="<%= request.getContextPath() %>/resources/image/알림.png" />
           </button>
           <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
             <a class="dropdown-item" href="#">알림3</a>
             <a class="dropdown-item" href="#">알림2</a>
             <a class="dropdown-item" href="#">알림1</a>
           </div>
        </div>
    </div>
    <hr>
</body>
</html>