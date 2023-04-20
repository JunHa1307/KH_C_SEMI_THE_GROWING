
<%@page import="com.kh.board.model.vo.Reply"%>
<%@page import="com.kh.board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
	int cno = (int)request.getSession().getAttribute("cno");
	int level = ((Member)request.getSession().getAttribute("loginUser")).getUserLevel();
	int uno = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
	//ArrayList<Reply> rlist = (ArrayList<Reply>)request.getAttribute("rlist");
	ArrayList<Integer> arr = (ArrayList<Integer>) request.getAttribute("arr");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>The Growing</title>
<link rel="shortcut icon" type="image/svg" href="<%= request.getContextPath() %>/favicon.svg"/>

<style>




@keyframes post-ani {
    25% {
        transform: rotate(2deg) scale(1.01);
    }
 
    50% {
        transform: rotate(0deg) scale(1);
    }
 
    75% {
        transform: rotate(-2deg) scale(1.01);
    }
}


/* 좋아요 하트 */
.heart {
	width: 100px;
	height: 100px;
	transform: translate(-50%, -50%);
	background: url("resources/image/heart.png") no-repeat;
	background-position: 0 0;
	cursor: pointer;
	animation: fave-heart 1s steps(28);
	top:55%;
	left:5.5%;
	position: absolute;
}

@
keyframes fave-heart { 
	0% {
	background-position: 0 0;
	}
	100%{ 
	background-position:-2800px 0;
	}
}


div {
	box-sizing: border-box;
	/* border: 1px solid red; */
}

.album_content {
	height: 298px;
	width: 100%;
	
	
	/* background-color: blue; */
}

.album_content>div {
	float: left;
	height: 100%;
	
}

.album_con1 {
	width: 32.2%;
	border: 1px solid rgb(182, 182, 177);
	margin:auto;
	margin-right:4px;
	margin-bottom:8px;
	box-shadow: 0px 8px 6px -6px #666;
	
	
	/* background-color: bisque; */
}
.album_con1:hover{
opacity: 0.9;
	animation: post-ani 0.8s linear 1;
}

.album_con_title {
	width: 100%;
	height: 30px;
	margin: auto;
	padding : 2px 5% 5px 5%; 
	cursor: pointer;
	font-weight: 600;
	border-bottom: 1px solid rgb(182, 182, 177);
	margin-bottom: 10px;
	/* background-color: aqua; */
}


.album_con_title>p{
	overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.album_con_file {
	width: 90%;
	height: 190px;
	margin: auto;
	overflow: hidden;
	border-radius: 10px;
	margin-bottom: 10px;
}

.album_con_file>img:hover {
	transform: scale(1.1);
}

.album_con_file>img {
	width: 100%;
	height: 100%;
	cursor: pointer;
	transition: transform 0.7s;
	object-fit: cover;
}

.album_con_user {
	width: 90%;
	height: 28px;
	margin: auto;
	font-size: 14px;
	font-weight:400;
	color:grey;
}

.album_con_date_count {
	width: 100%;
	height: 28px;
	margin: auto;
	font-size: 12px;
	font-weight:400;
	color:black;
	background: rgb(242, 244, 247);
	border-top: 1px solid rgb(182, 182, 177);
	padding : 4px 5% 5px 5%; 
}
.album_con_date_count>div {
	height:100%;
	float: left;
}

#aDate{
	width:75%;
}
#aCount{
	width:25%;
	font-size:0.5vw; 
	margin-top:2px;
}

#modal {
	width: 72vw;
	height: 41vw;
	min-width: 750px;
	min-height: 500px;
	
	/* background-color: aqua; */
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	margin: auto;
	visibility: hidden;
	z-index: 9;
	border-radius:10px; 
	
}

#modal>div {
	float: left;
	height: 100%;
	border-radius:10px; 
}

#mo_picture {
	width: 40vw;
	background-color: black;
	min-height: 500px; 
}

#mo_picture_wrap {
	width: 40vw;
	height: 41vw;
	
	min-height: 500px; 

	/* background-color: aqua; */
}

#slider-div {
	width: 100%;
	height: 100%;

	/* background-color: black; */
}

#slider-div>div {
	width: 100%;
	height: 100%;
	


	/* background-color: rgb(164, 123, 123); */
}

.img_1 {
	width: 100%;
	min-height: 500px; 
	object-fit: cover;
	display: inline-block;
	margin: 0;
  height: 41vw;
  text-align: center;
  line-height: 41vw;
}

#mo_write {
	width: 40%;
	background-color: white;
	min-width: 330px;
	
}
#a {
	width: 100%;
	background-color: white;
	
}

#mo_write_wrap {
	width: 100%;
	height: 100%;
	
}

#mo_write_wrap>div {
	float: left;
	height: 100%;
}

#mo_title {
	width: 80%;
	font-weight: 700;
	font-size: 20px;
}
#mo_title>p {
	
	overflow: hidden;
  text-overflow: ellipsis;
  margin: 0;
  white-space: nowrap;
}

#mo_date {
	width: 20%;
	vertical-align:bottom;
	
}

#mo_writer {
	min-height: 105px;
	height:8vw;
	width: 100%;
	/* background-color: aqua */
}

#mo_writer_content {
	width: 100%;
	min-height: 95px;
	height:8vw;
	/* background-color: azure; */
}

#mo_writer_content>div {
	float: left;
	height: 8vw;
	min-height:95px;
}

#mo_writer_content2 {
	width: 100%;
	height:2vw;
	min-height: 26px;
	/* background-color: rgb(95, 73, 46); */
}

#mo_writer_profile {
	width: 8vw;
	min-width: 95px;
}

#mo_writer_profileImg {
	width: 90%;
	height: 90%;
	border-radius: 100%;
	overflow: hidden;
}

#mo_writer_profileImg>img {
	border-radius: 100%;
	width: 100%;
	height: 100%;
	object-fit : cover;
}

#mo_writer_text {
	width: 70%;
	overflow-y: scroll;
	/* background-color: aqua; */
}
#mo_writer_text::-webkit-scrollbar {
	display: none;
}
#mo_writer_content2>div {
	float: left;
	height: 100%;
}

#mo_writer_id {
	width: 28%;
	text-align:center;
	font-weight: 600;
	font-size:1vw;
}

#mo_writer_date {
	width:72%;
	text-align: right;
	font-size: 0.8vw;
}

.mo_reply {
	width: 100%;
	height: 100px;
	padding-top: 5px;
}

.mo_reply_content {
	width: 100%;
	height: 67px;
	position: relative;
}

.mo_reply_content>div {
	float: left;
	height: 100%;
}

.mo_reply_content2 {
	width: 100%;
	height: 33px;
}

.mo_reply_profile {
	width: 22%;
	padding-left: 1vw;
}

.mo_reply_profileImg {
	width: 4vw;
	height: 4vw;
	min-width:50px;
	min-height:50px;
	border-radius: 100%;
	overflow: hidden;
	margin : auto;
}

.mo_reply_profileImg>img {
	border-radius: 100%;
	width: 100%;
	height: 100%;
	object-fit : cover;
}

.mo_reply_text {
	padding-left:1vw;
	width: 60%;
	word-break: break-all;
	overflow-y: scroll;
	
	/* background-color: aqua; */
}
.mo_reply_text::-webkit-scrollbar {
	display: none;
}

.mo_reply_content2>div {
	float: left;
	height: 100%;
}

.mo_reply_id {
	width: 5.5vw;
	min-width:60px;
	text-align:center;
	font-size: 0.7vw;
	font-weight: 600;
	margin-top:0.2vw;
	
}

.mo_reply_date {
	width: 95%;
	text-align: right;
	font-size: 0.8vw;
}

.mo_reply_wrap {
	width: 100%;
	
	height:calc(67% - 130px);
	min-height:205px;
	/* background-color: antiquewhite; */
	-ms-overflow-style: none;
}

.mo_reply_wrap::-webkit-scrollbar {
	display: none;
}

#mo_reply_write {
	width: 100%;
	height:125px;
}

#mo_reply_list {
	width: 100%;
	height: 50px;
	margin-bottom: 5px;
	position:relative;
	/* background-color: antiquewhite; */
}

.mo_reply_hr {
	height: 5px;
	width: 100%;
	/* background-color: aqua; */
}

.mo_reply_hr>hr {
	margin: 0;
}

/* 좋아요 / 댓글 / 스크랩 */
#mo_reply_list>ul {
	padding: 0;
	margin:0;
}

#mo_reply_list>ul>li {
	list-style-type: none;
	float: left;
	width: 8vw;
	min-width:90px;
	font-weight: 600;
	text-align: right;
	cursor: pointer;
	font-size:1vw;
	
}




#mo_reply_write_text>div {
	float: left;
	align-items: center;
}

#mo_reply_write_text {
	height:75px;
	padding:10px 10px 0 10px;
	display: flex;
	position: relative;
	text-align: center;
	
	/* background-color: antiquewhite; */
}

#mo_reply_write_text_content {
	width: 70%;
	height:100%;
}

#mo_reply_bt {
	width: 18%;
	height: 90%;
}

#mo_reply_bt>div>button {
	width: 100%;
	align-items: center;
}

.bi {
	font-size: 30px;
	cursor: pointer;
	outline: none;
}

.bi-chat-quote {
	color: rgb(165, 227, 206);
	padding-right: 10px;
}
/* .like{
	position:relative;
}
#likeCount{
	position:absolute;
	top : 10px;
	left:-70px;
} */
#boardReplyIcon {
	height: 50px;
	border-bottom: 1px solid rgb(224, 224, 224);
	border-top: 1px solid rgb(224, 224, 224);
	display: flex;
	align-items: center;
	background-color: rgb(244, 247, 247);
}
#mo_write_inner{
	padding:0.4vw;
	height: 3vw;
	min-height:40px;
	
	
}
#mo_reply_textarea {
	border: 1px solid rgb(224, 224, 224);
	width:100%; 
	height:100%;
	 resize:none;
}
.grey{
	color:grey;
}
#lock_btn {
	background-color: white;
	border-style: none;
	margin-top:15px;
	margin-right:5px;
	margin-left:5px;
	width: 30px;
	height: 30px;
	
	border-radius: 50%;
	
}




#lock_img {
	width: 20px;
	height: 20px;
}

@media only screen and (max-width: 800px) {
#mo_write{
	display: none;
}
#mo_picture{
	height:100%;
	width:100%;
}
#mo_picture_wrap{
	height:100%;
	width:100%;
}
#modal{
min-height:500px;
	min-width:400px;
}
   
}

</style>
</head>
<body>
	<%@include file="boardFrame.jsp"%>
	<div id="board_area">
		<div id="album_header">
			<div id="album_area">
				<div id="album_title">앨범</div>
				<div id="album_button" align="right" class="box">
					<button id="album_Enroll" class="button_UI button--winona"
						data-text="글 등록" style="margin-right: 10px;">
						<span>글 등록</span>
					</button>
					<button id="album_file" class="button_UI button--winona"
						data-text="사진 모아보기">
						<span>사진 모아보기</span>
					</button>
				</div>
			</div>
			<div id="album_hr">
				<hr />
			</div>
		</div>
		<div class="album_content">

			<% for( int i = 0; i<list.size(); i++) {%>

			<div class="album_con1">
				<input type="hidden" value="<%=list.get(i).getBoardNo() %>" id="hiddenNo">
				<div class="album_con_title"
					onclick="albumClick('<%=list.get(i).getBoardNo() %>', '<%=level %>', '<%=uno%>');">
					<p><%=list.get(i).getBoardTitle() %></p>
				</div>
				
				<div class="album_con_file"
					onclick="albumClick('<%=list.get(i).getBoardNo() %>', '<%=level %>','<%=uno%>');">
					<img src="<%=contextPath %><%=list.get(i).getTitleImg() %> ">
				</div>
			
				<div class= "album_con_user"><%=list.get(i).getUserName() %> <%=list.get(i).getUserLevel() ==1 ? "선생님" :list.get(i).getUserLevel() ==2? "학부모" : "학생" %></div>
				<div class="album_con_date_count">
					<div id="aDate" ><%=list.get(i).getcDate()%></div>
					<div id="aCount" align="right"><img src="/growing/resources/image/eye-fill.svg" style="margin-bottom:3px; margin-right:20%; width:0.8vw; height:0.8vw; min-width:8px; min-height:8px"><%=list.get(i).getCount() %></div>
					
					</div>
				

			</div>
			<%} %>
		</div>

	</div>
	</div>
	<div id="modal">
		<div id="mo_picture">
			<div id="mo_picture_wrap">
				<div
					style="width: 100%; height: 100%; padding: 30px; "
					>

					<div id="slider-div">
						<div></div>

					</div>
				</div>
			</div>
		</div>
		<div id="mo_write">
		<div id="mo_write_inner">
</div>
			<!-- 댓글란 -->

			<div class="mo_reply_wrap" style="overflow-y: scroll;">
				


				<div class="mo_reply"></div>
			</div>
			


			<div id="mo_reply_write">
			
				<div id="boardReplyIcon">
				<div id="mo_reply_list">
					<ul id="mo_icon">
						<li><div class="heart" onclick="likeClick('<%=uno %>');"></div></li>
						<li class="like" onclick="likeClick('<%=uno %>');"><i class="bi"></i></li>
						<li class="chat"><i class="bi bi-chat-quote"></i>댓글 <span
							id="chat_count">0</span>개</li>
						<li id="<%= uno %>" class="scrap" style="padding-right: 15px;" onclick="scrapClick();">
							<i class="bi bi-star" style="padding-right: 0.5vw;"></i>
							스크랩
						</li>
					</ul>

				</div>
				
			</div>
				<div id="mo_reply_write_text">
					<div id="mo_reply_write_text_content">
						<textarea id="mo_reply_textarea" 
							placeholder="댓글을 입력하여 주세요." style="resize: none;"></textarea>
					</div>
					<div>
						<button id="lock_btn" data-lock="N">
							<img id="lock_img"
								src="<%=contextPath%>/resources/image/unlock.png" >
						</button>
					</div>
					<div id="mo_reply_bt" class="box">
						<button class="button_UI button--winona insert_bt"
							data-text="click" id="insertReply" style="margin-top:0.5vw; min-width:50px;">
							<span>등록</span>
						</button>
					</div>
				</div>


			</div>

		</div>

	</div>

	</div>


	</div>




	<script>
      $(function () {
    	  $("#slider-div").slick({
		          slide: "div", //슬라이드 되어야 할 태그 ex) div, li
		          infinite: false, //무한 반복 옵션
		          slidesToShow: 1, // 한 화면에 보여질 컨텐츠 개수
		          slidesToScroll: 1, //스크롤 한번에 움직일 컨텐츠 개수
		          speed: 100, // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
		          arrows: true, // 옆으로 이동하는 화살표 표시 여부
		          dots: false, // 스크롤바 아래 점으로 페이지네이션 여부
		          autoplay: false, // 자동 스크롤 사용 여부
		          autoplaySpeed: 10000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
		          pauseOnHover: true, // 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
		          vertical: false, // 세로 방향 슬라이드 옵션
		          prevArrow:
		            "<button type='button' class='slick-prev'>Previous</button>", // 이전 화살표 모양 설정
		          nextArrow: "<button type='button' class='slick-next'>Next</button>", // 다음 화살표 모양 설정
		          dotsClass: "slick-dots", //아래 나오는 페이지네이션(점) css class 지정
		          draggable: true, //드래그 가능 여부
	        });
    	  

   
   		// 목록 클릭 시 css 
          $("#board_album").css("fontWeight", "700");
          $("#board_album").children().css("background", "rgb(237, 239, 243)");
       
          });

        

        function albumClick(bno, level,uno){
        	
          //댓글
 		$("#modal").attr("class",bno); 
      	$.ajax({
   				url : "<%=contextPath%>/rlist.bo",
   				data : { bno },
   				type : "get",
				dataType : "html", 
   				success : function(list){
   					 $(".mo_reply").html(list); 
   				},
   				error: function(){
   					console.log("게시글 목록조회 실패")
   				}
        	});  
        	
         	$.ajax({
   				url : "<%=contextPath%>/rCount.bo",
   				data : { bno : bno},
   				success : function(list){
   				 $("#chat_count").html(list);
   				},
   				error: function(){
   					console.log("게시글 목록조회 실패")
   				}
        	}); 
        	
        	
        	
        	// 게시물 
        	  $.ajax({
  				url : "<%=contextPath%>/boardSelect.bo",
  				data : { bno},
  				success : function(b){
  				 	 let result = ""; 
  				 	if(level==1 || b.refUno == uno){
  						  result  += 
  		   						 
  								'<div id="mo_write_wrap">'+
  							'<div id="mo_title"><p>'+b.boardTitle+'</p></div>'+
  							'<div id="mo_date" class="grey">'+
  							
  							'<div id="menu" class="dropdown"'+
                                'style="float: right; margin: -7% 0% 0% 10%;">'+
                                '<button class="btn btn-secondary" type="button"'+
                                   'id="dropdownMenuButton" data-toggle="dropdown"'+
                                   'aria-haspopup="true" aria-expanded="false" style="margin-top:0.4vw; padding:0;"><img id="alarmIcon"'+
                                      'src="/growing/resources/image/icons8-메뉴-2-48.png" /></button><div id="menu" class="dropdown-menu"'+
                                   'aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="/growing/update.al?bno='+b.boardNo+'">수정</a>'+ 
                                   '<a onclick="deleteAlbum('+b.boardNo+');" class="dropdown-item" >삭제</a></div></div>'+
                                   '</div></div>'+
  						'<div class="mo_reply_hr"><hr></div><div id="mo_writer"><div id="mo_writer_content"><div id="mo_writer_profile">'+
  									'<div id="mo_writer_profileImg"><img src="'+( b.filePath== 'ISSNSMEMBERATTACHMENT'? b.changeName : '/growing/'+b.filePath+b.changeName)+'" alt="" onerror="this.src=\'resources/image/noImage.png\'">'+
  									'</div></div>'+
  								'<div id="mo_writer_text">'+b.boardContent+'</div></div>'+
  							'<div id="mo_writer_content2">'+
  								'<div id="mo_writer_id">'+b.userName+" "+(b.userLevel == 1 ? "선생님" : b.userLevel == 2 ? "학부모" : "학생")+'</div>'+
  								'<div id="mo_writer_date" class="grey">'+b.cDate+'</div></div><div class="mo_reply_hr"><hr></div></div>'; 
  				 	}else{
  				 	  result  += 
	   						
							'<div id="mo_write_wrap">'+
						'<div id="mo_title">'+b.boardTitle+'</div>'+
						'<div id="mo_date">'+
						

                             '</div></div>'+
					'<div class="mo_reply_hr"><hr></div><div id="mo_writer"><div id="mo_writer_content"><div id="mo_writer_profile">'+
								'<div id="mo_writer_profileImg"><img src="'+( b.filePath== 'ISSNSMEMBERATTACHMENT'? b.changeName : '/growing/'+b.filePath+b.changeName)+'" alt="" onerror="this.src=\'resources/image/noImage.png\'">'+
								'</div></div>'+
							'<div id="mo_writer_text">'+b.boardContent+'</div></div>'+
						'<div id="mo_writer_content2">'+
							'<div id="mo_writer_id">'+b.userName+" "+(b.userLevel == 1 ? "선생님" : b.userLevel == 2 ? "학부모" : "학생")+'</div>'+
							'<div id="mo_writer_date">'+b.cDate+'</div></div><div class="mo_reply_hr"><hr></div></div>';
  				 		
  				 	}
  		   						 
  		   					
  		   					 $("#mo_write_inner").html(result); 
  					 
  				 
  				},
  				error: function(){
  					error();
  				}
       	});   
        	  
        	//사진
        	  
         $.ajax({
   				url : "<%=contextPath%>/innerlist.al",
   				data : { bno},
   				success : function(list){
   					console.log(list);
   				let slength = $("#slider-div .slick-slide").length;
   					 for(let i = 0; i<slength; i++){ 
   						$("#slider-div").slick('slickRemove',false);
   					 }
   				 	 let result = ""; 
   					  for(let i = 0; i<list.length; i++){ 
   						$("#slider-div").slick('slickAdd','<div><img class="img_1" src="resources/album_upfiles/'+list[i].changeName+'"></div>'); 
   					 }
   				 
   				},
   				error: function(){
   					error('댓글 작성에 실패했습니다.');
   				}
        	});        
         
        	


            
            
           
            $.ajax({
				url : "<%=contextPath%>/likeSelect.bo",
				data : { bno ,
						 uno 
				},
				success : function(list){
					 let ls = list.split(",");
					if(ls[0]==0){
						  $('.heart').css({  backgroundPosition: '0', transition:' background 0s steps(28)'})
							$(".like").html('<i class="bi"></i>좋아요  '+ls[1]+"개");
							
					}else{
						 $('.heart').css({  backgroundPosition: '-2800px 0', transition:' background 0s steps(28)'})
						 $(".like").html('<i class="bi"></i>좋아요  '+ls[1]+"개");
					}
					 if($("#modal").css("visibility")=="hidden"){
			               $("#modal").css("visibility","visible");
			                $('body').css({overflow :"hidden",scroll:"no"});
			                $("#veil").css("display","block");
			              
			            }
					 
				},
				error: function(){
					error();
				}
    	});
		
           
        };

        $("#veil").click(function(){
            if($("#modal").css("visibility")=="visible"){
                $("#modal").css("visibility","hidden"); 
                $('body').css({overflow :"scroll",scroll:"yes"});
                $("#veil").css("display","none");
                location.reload();
           

            }
        });
        
             let j = 0;
        $('.scrap').on('click',function(){
            if(j==0){
                $('.bi-star').css({color : "orange", fontSize : "30px"});
                j++;
            }else if(j==1){
                $('.bi-star').css('color','black');
                j--;
            }

        }); 

        $('.chat').on('click',function(){
              $('#mo_reply_textarea').focus();
        });

        
     	//좋아요 클릭 시 
        function likeClick(uno){
        let bno = $("#modal").attr("class");
  
          
        	$.ajax({
				url : "<%=contextPath%>/like.bo",
				data : { bno ,
						 uno 
						
				},
				
				success : function(list){
					 let ls = list.split(",");
					if(ls[0]==0){
						  $('.heart').css({  backgroundPosition: '0', transition:' background 0s steps(28)'})
							$(".like").html('<i class="bi"></i> 좋아요  '+ls[1]+"개");
							
					}else{
						 $('.heart').css({  backgroundPosition: '-2800px 0', transition:' background 1s steps(28)'})
						 $(".like").html('<i class="bi"></i> 좋아요  '+ls[1]+"개");
					}
				
					 
					 
					 
				},
				error: function(){
					error();
				}
    	});
  
          
          
        };

        
        
        
        
        $("#album_Enroll").click(function () {
    		location.href="<%=contextPath%>/insert.al?cno="+<%=cno%>;
    	});
                
           $("#album_file").click(function () {
    		location.href="<%=contextPath%>/att.al?cno="+<%=cno%>;
    	});

           
           
           let i = 0;
          	$("#lock_btn").click(function(){
          		if(i==0){
        		 $(this).data("lock","Y");
        		$("#lock_img").attr("src","/growing/resources/image/icons8-잠금-해제-66.png");
        		$("#lock_img").css({"width":"23px", "height":"26px", "margin-right":"3px"});
        		
        		i++;
          		}else{
          		 $(this).data("lock","N");
         		$(this).children("#lock_img").attr("src","/growing/resources/image/unlock.png");
         		$("#lock_img").css({"width":"20px", "height":"20px"});
         		i--;
          		}
        	});
    	
        $("#insertReply").click(function(){
          	let bno = $("#modal").attr("class"); 
          	let lock = $("#lock_btn").data("lock");
   			$.ajax({
   				url : "<%=contextPath%>/rinsert.bo",
   				data : {
   					content : $("#mo_reply_textarea").val(), 
   					bno,  lock
   				},
   				success : function(result){
   					if(result > 0){
   						
   						$("#mo_reply_textarea").val("");
   						$.ajax({
   			   				url : "<%=contextPath%>/rlist.bo",
   			   				data : { bno : bno},
   			   				type : "get",
   							dataType : "html", 
   			   				success : function(list){
   			   					 $(".mo_reply").html(list); 
   			   				},
   			   				error: function(){
   			   					error();
   			   				}
   			        	});
   						$.ajax({
			   				url : "<%=contextPath%>/rCount.bo",
			   				data : { bno },
			   				success : function(list){
			   					console.log(list);
			   					 $("#chat_count").html(list);
			   				},
			   				error: function(){
			   					error();
			   				}
			        	}); 
   						$("#lock_btn").data("lock","N");
						$("#lock_btn").css("background", "");
   					}else{
   						error('댓글 작성에 실패했습니다.');
   						
   					}
   				}, 
   				error : function(){
   					error('댓글 작성에 실패했습니다.');
   				} 
   			});
   		}); 

     
		//스크랩
     	function scrapClick(){
     		
     		let uno =  $(".scrap").attr("id");
     		let bno = $("#modal").attr("class");
     		
     		$.ajax({
     			url: "<%= contextPath %>/scrap.bo",
     			type: "post",
     			data: {bno, uno},
     			
     			success: function(scrap){
     					console.log(scrap);
     					console.log("스크랩 잘됨");
     					
     			},
     			error: function(){
     				error('게시글 스크랩을 실패하였습니다.');
     			}
     			
     		});
     	
     	};
     	
     	function deleteAlbum(bno){
     	     Swal.fire({
                 title: '게시물을 삭제하시겠습니까?',
                 text: "삭제된 게시물은 다시 볼 수 없습니다.",
                 icon: 'warning',
                 showCancelButton: true,
                 confirmButtonColor: '#3085d6',
                 cancelButtonColor: '#d33',
                 confirmButtonText: '삭제',
                 cancelButtonText: '취소'
             }).then((result) => {
                 if (result.isConfirmed) {
                	 
                     Swal.fire(
                         '삭제가 완료되었습니다.'
                     )

                     setTimeout(() =>  location.href="<%=contextPath%>/delete.al?bno="+bno, 1000);

                    
                 }
                 
             })
     	};
     		
     		
     	

		

    </script>
</body>
</html>
