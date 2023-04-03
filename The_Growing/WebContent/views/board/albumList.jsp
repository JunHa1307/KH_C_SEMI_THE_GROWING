
<%@page import="com.kh.board.model.vo.Reply"%>
<%@page import="com.kh.board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
	int cno = (int)request.getSession().getAttribute("cno");
	//ArrayList<Reply> rlist = (ArrayList<Reply>)request.getAttribute("rlist");

%>    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>The Growing</title>
    
 
   
    <style>



/* 좋아요 하트 */
.heart {
  width: 100px;
  height: 100px;
  transform: translate(-50%, -50%);
  background: url("views/resources/image/heart.png") no-repeat;
  background-position: 0 0;
  cursor: pointer;
  animation: fave-heart 1s steps(28);
  margin: 25px;
  position: absolute;
  
}

@keyframes fave-heart {
  0% {
    background-position: 0 0;
  }
  100% {
    background-position: -2800px 0;
  }
}


      * {
        font-family: "Gowun Dodum", sans-serif;
      }

      div {
        box-sizing: border-box;
        /* border: 1px solid red; */
      }
    

      .album_content {
        height: 250px;
        width: 100%;
        /* background-color: blue; */
      }

      .album_content > div {
        float: left;
        height: 100%;
      }
      .album_con1 {
        width: 33.3%;
        /* background-color: bisque; */
      }
      .album_con_title {
        width: 90%;
        height: 30px;
        margin: auto;
        cursor: pointer;
        font-weight: 600;
        /* background-color: aqua; */
      }
      .album_con_title > p:hover {
        font-weight: 700;
      }

      .album_con_file {
        width: 90%;
        height: 190px;
        margin: auto;
        overflow: hidden;
        border-radius: 10px;
      }
      .album_con_file > img:hover {
        transform: scale(1.1);
      }

      .album_con_file > img {
        width: 100%;
        height: 100%;
        cursor: pointer;
        transition: transform 0.7s;
        object-fit: cover;
      }

      .album_con_date {
        width: 90%;
        height: 28px;
        margin: auto;
        text-align: right;
      }
      #modal {
        width: 1200px;
        height: 700px;
        /* background-color: aqua; */
        position: fixed;
         top: 0;
		  bottom: 0;
		  left: 0;
		  right: 0;
 		 margin:auto;
        visibility: hidden;
        z-index: 5;
      }
      #modal > div {
        float: left;
        height: 100%;
      }
      #mo_picture {
        width: 60%;
        background-color: black;
      
      }
     
      #mo_picture_wrap {
        width: 100%;
        height: 100%;
       
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
        width: 80%;
        height: 100%;
        margin: auto;
     
      }
      #mo_write{
        width: 40%;
        background-color: white;
        padding: 15px;
      }
      #mo_write_wrap{
        width: 100%;
        height: 60px;
      }
      #mo_write_wrap>div{
       float: left;
       height: 100%;
      }
      #mo_title{
        width: 80%;
        font-weight: 700;
      }
      #mo_date{
        width: 20%;
        text-align: right;
      }
      #mo_writer{
        height: 165px;
        width: 100%;
        /* background-color: aqua */
      }
      #mo_writer_content{
        width: 100%;
        height: 130px;
        /* background-color: azure; */
      }
      #mo_writer_content>div{
        float: left;
        height: 100%;
        
      }
      #mo_writer_content2{
        width: 100%;
        height: 30px;
        /* background-color: rgb(95, 73, 46); */
      }
      #mo_writer_profile{
        width: 30%;
      }
      #mo_writer_profileImg{
        width: 90%;
        height: 100%;
        border-radius: 100%;
        overflow: hidden;
      
      }
      #mo_writer_profileImg>img{
        border-radius: 100%;
        width: 100%;
        height: 100%;
      }
      #mo_writer_text{
        width: 70%;
        /* background-color: aqua; */
      }
      
      #mo_writer_content2>div{
        float: left;
        height: 100%;
        
      }
  
      #mo_writer_id{
        width: 30%;
        text-align: center;
        font-weight: 600;

      }
      #mo_writer_date{
        width: 70%;
        text-align: right;
        font-size: smaller;
      }
      

      
      .mo_reply{
        width: 100%;
        height: 100px;
        padding-top: 5px;
      }
      .mo_reply_content{
        width: 100%;
        height: 69%;
      }
      .mo_reply_content>div{
        float: left;
        height: 100%;
        
      }
      .mo_reply_content2{
        width: 100%;
        height: 33px;
      }
      .mo_reply_profile{
        width: 30%;
        padding-left: 5%;
     
      }
      .mo_reply_profileImg{
        width: 60%;
        height: 100%;
        border-radius: 100%;
        overflow: hidden;
    
      
      }
      .mo_reply_profileImg>img{
        border-radius: 100%;
        width: 100%;
        height: 100%;
      }
      .mo_reply_text{
        width: 70%;
        /* background-color: aqua; */
      }
      .mo_reply_content2>div{
        float: left;
        height: 100%;
      }
      .mo_reply_id{
        width: 30%;
        padding-left: 5%;
        font-size: smaller;
        font-weight: 600;
      }
      .mo_reply_date{
        width: 70%;
        text-align: right;
        font-size: smaller;
      }
 
      .mo_reply_wrap{ 
        width: 100%;
        height: 300px;
        /* background-color: antiquewhite; */
     
        -ms-overflow-style: none;
      }
      .mo_reply_wrap::-webkit-scrollbar{
         display:none;
      }
      #mo_reply_write{
        width: 100%;
        height: 130px;
      }
      #mo_reply_list{
        width: 100%;
        height: 35px;
        /* background-color: antiquewhite; */
      }
      .mo_reply_hr{
        height: 5px;
        width: 100%;
        /* background-color: aqua; */
       
      }
      .mo_reply_hr>hr{
      margin: 0;
      }
    
      /* 좋아요 / 댓글 / 스크랩 */
      #mo_reply_list>ul{
        padding: 0;
      }
      #mo_reply_list>ul>li{
       list-style-type: none;
       float: left;
        width: 110px;
        font-weight: 600;
        text-align: right;
        cursor: pointer;
      }
      #mo_reply_write_text>div{
        float: left;
        
      }
      #mo_reply_write_text{
        height: 90px;
        /* background-color: antiquewhite; */

      }
      #mo_reply_write_text_content{
        width: 80%;
       
      }
      #mo_reply_bt{
        width: 20%;
        height: 80%;
      }
      #mo_reply_bt>div>button{
        width: 100%;
        align-items: center;
      }
      .bi{
       font-size: 30px;
       cursor: pointer;
       outline: none;
       padding-left: 20px;
      }
      
    .bi-chat-quote{
       color: rgb(165, 227, 206);
       padding-right: 10px;
    }

    
    
    </style>
  </head>
  <body>
  <%@include file="boardFrame.jsp" %>
        <div id="board_area">
          <div id="album_header">
            <div id="album_area">
              <div id="album_title">앨범</div>
              <div id="album_button" align="right" class="box">
                  <button id="album_Enroll" class="button_UI button--winona" data-text="글 등록" style="margin-right: 10px;"><span>글 등록</span></button>
                  <button id="album_file" class="button_UI button--winona" data-text="사진 모아보기"><span>사진 모아보기</span></button>
              </div>
            </div>
            <div id="album_hr">
              <hr />
            </div>
          </div>
          <div class="album_content">
          	<% for( Board b : list) {%>
            <div class="album_con1" >
            	<input type="hidden" value="<%=b.getBoardNo() %>" id="hiddenNo">
              <div class="album_con_title album_click"><p><%=b.getBoardTitle() %></p></div>
              <div class="album_con_file album_click">
                <img src="<%=contextPath %><%=b.getTitleImg() %> ">
              </div>
              <div class="album_con_date" ><%=b.getCreateDate() %></div>
              
            </div>
            <%} %>
         </div>
   
   </div>
  </div>
          <div id="modal">
          <div id="mo_picture" >
            <div id="mo_picture_wrap">
              <div
                style="
                  width: 100%;
                  height: 100%;
                  padding-left: 60px;
                  padding-right: 60px;
                "
              >
                <div id="slider-div" >
                   <!--  <div ><img src="../../resources/img/flower" class="img_1" ></div>
              	 <div><img src="/resources/image/사진 11_1.png" class="img_1"></div>
                  <div><img src="/resources/image/사진 11_1.png" class="img_1"></div>  -->
                </div>
              </div>
            </div>
          </div>
          <div id="mo_write">
            <div id="mo_write_wrap">
              <div id="mo_title">봄이 왔어요</div>
              <div id="mo_date">23.03.01</div>
            </div>
            <div class="mo_reply_hr"><hr></div>
            <div id="mo_writer">
              <div id="mo_writer_content">
                <div id="mo_writer_profile">
                  <div id="mo_writer_profileImg"><img src="/resources/image/bono.jpg"></div></div>
                <div id="mo_writer_text">따듯한 날씨에 핀 꽃들입니다</div>
              </div>
              <div id="mo_writer_content2">
                <div id="mo_writer_id">문동은 선생님</div>
                <div id="mo_writer_date" >23.03.23 11:06</div>
              </div>
              <div class="mo_reply_hr"><hr></div>
            </div>

            <!-- 댓글란 -->
          
           <div class="mo_reply_wrap" style="overflow-y: scroll;">
           <%--     <%if(rlist.isEmpty()) {%>
            <div class="mo_reply">
              <div class="mo_reply_content">
                <div class="mo_reply_profile">
                </div>
                <div class="mo_reply_text">조회된 댓글이 없습니다 </div>
              </div>
              <div class="mo_reply_content2">
              <!--   <div class="mo_reply_id">하예솔 학생</div>
                <div class="mo_reply_date" >23.03.23 15:27</div> -->
              </div>
            </div>
            <%}else{ %> --%>
         <%--    	<%for(Reply r : rlist){ %>
            <div class="mo_reply">
              <div class="mo_reply_content">
                <div class="mo_reply_profile">
                  <div class="mo_reply_profileImg"><img src="/resources/image/bono.jpg"></div>
                </div>
                <div class="mo_reply_text"><%=r.getReplyContent()%></div>
              </div>
              <div class="mo_reply_content2">
                <div class="mo_reply_id"><%=r.getReplyWriter() %></div>
                <div class="mo_reply_date" ><%=r.getCreateDate() %></div>
              </div>
            </div>
            	<%} %> --%>
			 			
		<%-- <%} %>   --%>
            
            
            <div class="mo_reply">
         
            </div>
            </div>
         <!--    <div class="mo_reply">
              <div class="mo_reply_content">
                <div class="mo_reply_profile">
                  <div class="mo_reply_profileImg"><img src="/resources/image/bono.jpg"></div>
                </div>
                <div class="mo_reply_text">fff 늘 수고가 많으세요^^</div>
              </div>
              <div class="mo_reply_content2">
                <div class="mo_reply_id">박연진 부모</div>
                <div class="mo_reply_date" >23.03.23 16:47</div>
              </div>
            </div>
            <div class="mo_reply">
              <div class="mo_reply_content">
                <div class="mo_reply_profile">
                  <div class="mo_reply_profileImg"><img src="/resources/image/bono.jpg"></div>
                </div>
                <div class="mo_reply_text">ddd 늘 수고가 많으세요^^</div>
              </div>
              <div class="mo_reply_content2">
                <div class="mo_reply_id">박연진 부모</div>
                <div class="mo_reply_date" >23.03.23 16:47</div>
              </div>
            </div>
          </div> -->


            <div id="mo_reply_write">
              <div class="mo_reply_hr"><hr></div>
              <div id="mo_reply_list">
                <ul id="mo_icon">
                  <li><div class="heart like"></div></li>
                  <li class="like"><i class="bi"></i>좋아요 3</li>
                  <li class="chat"><i class="bi bi-chat-quote"></i>댓글 4</li>
                  <li class="scrap"><i class="bi bi-star" style="padding-right: 10px;"></i>스크랩</li>
                </ul>
                
              </div>
            
              <div id="mo_reply_write_text">
                <div id="mo_reply_write_text_content"><textarea id="mo_reply_textarea" cols="45" rows="3" placeholder="댓글을 입력하여 주세요." style="resize: none;"></textarea></div>
                <div id="mo_reply_bt" class="box">
                  <button class="button_UI button--winona insert_bt" data-text="click" id="insertReply"><span>등록</span></button>
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
      });
 
      $(function () {
   
          $("#board_album").css("fontWeight", "700");
          $("#board_album").children().css("background", "rgb(239, 243, 239)");
       
      



        $(".album_click").click(function(){
          	let bno = ($(this).parents(".album_con1").children("#hiddenNo").val());
        	console.log(bno);
        	$("#modal").attr("class",bno);
        	
        	
        	$.ajax({
   				url : "<%=contextPath%>/rlist.bo",
   				data : { bno : ($(this).parents(".album_con1").children("#hiddenNo").val())},
   				success : function(list){
   					 console.log(list);
   					// 서버로부터 전달받은 리스트를 반복문을 통해 댓글목록으로 변환 
   				 	 let result = "";
   					for(let i = 0; i<list.length; i++){
   						
   					result  += 
   						
   					  '<div class="mo_reply_content">'+
   					 	'<div class="mo_reply_profile">'+
   	                  '<div class="mo_reply_profileImg"><img src="'+list[i].filePath+list[i].changeName+'" alt="" onerror="this.src=\'resources/image/noImage.png\'"></div></div>'+
   	                '<div class="mo_reply_text">'+list[i].replyContent+'</div></div>'+
   	             
   	              '<div class="mo_reply_content2">'+
   	                '<div class="mo_reply_id">'+list[i].replyWriter+'</div>'+
   	                '<div class="mo_reply_date" >'+list[i].createDate +'</div></div>'; 
   						 
   					}
   					 $(".mo_reply").html(result);  
   				},
   				error: function(){
   					console.log("게시글 목록조회 실패")
   				}
        	});
        	
         	  $.ajax({
   				url : "<%=contextPath%>/innerlist.al",
   				data : { bno : ($(this).parents(".album_con1").children("#hiddenNo").val())},
   				success : function(list){
   					 console.log(list);
   					// 서버로부터 전달받은 리스트를 반복문을 통해 댓글목록으로 변환 
   				 	 let result = "";
   					for(let i = 0; i<list.length; i++){
   						
   					result  += 
   						
   					  '<div><img src="'+list[i].filePath+list[i].changeName+'"></div>';
   						 
   					}
   					 $(".slick-slide>div").html(result);  
   				},
   				error: function(){
   					console.log("게시글 목록조회 실패")
   				}
        	});  
        	
        	
      
        	
                if($("#modal").css("visibility")=="hidden"){
                   $("#modal").css("visibility","visible");
                    $('body').css({overflow :"hidden",scroll:"no"});
                    $("#veil").css("display","block");
                   
                }
                
                
               
            });
        
        
        
        
        
        
        
        


            $("#veil").click(function(){
                if($("#modal").css("visibility")=="visible"){
                    $("#modal").css("visibility","hidden"); 
                    $('body').css({overflow :"scroll",scroll:"yes"});
                    $("#veil").css("display","none");
               

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

        let i = 0;
        $('.like').on('click',function(){
          if(i==0){
          $('.heart').css({  backgroundPosition: '-2800px 0', transition:' background 1s steps(28)'})
          i++;
        }else if(i==1){
          $('.heart').css({  backgroundPosition: '0', transition:' background 0s steps(28)'})
          i--;
          }
        });

        $('.button_UI').on('click',function(){
          if($(this).css('color')=='rgb(137, 180, 166)'){
            $(this).css('color', "black" );
          }else{
            ($(this).css('color','rgb(137, 180, 166)'));
          }
        });
        
        
        $("#album_Enroll").click(function () {
    		location.href="<%=contextPath%>/insert.al?cno="+<%=cno%>;
    	});
                
           $("#album_file").click(function () {
    		location.href="<%=contextPath%>/att.al?cno="+<%=cno%>;
    	});

        $("#insertReply").click(function(){
   			$.ajax({
   				url : "<%=contextPath%>/rinsert.bo",
   				data : {
   					content : $("#mo_reply_textarea").val(), 
   					bno     : $("#modal").attr("class")
   				},
   				success : function(result){
   					console.log(result);
   					
   					// 댓글등록 성공시 result = 1
   					
   					// 댓글등록 실패시 result = 0 
   					if(result > 0){
   						// 새 댓글목록 불러오는 함수 호출
   						//selectReplyList();
   						// 댓글내용 비워두기 
   						$("#mo_reply_textarea").val("");
   						
   					}else{
   						alert("댓글작성에 실패했습니다");
   					}
   				}, 
   				error : function(){
   					console.log("댓글 작성 실패")
   				} 
   			});
   		}); 
/*    		
        $(function(){
			setInterval(selectReplyList, 1000); 
		}); */
        
        
    		function selectReplyList(){
   			$.ajax({
   				url : "<%=contextPath%>/rlist.bo",
   				data : { bno : $("#modal").attr("class")},
   				success : function(rlist){
   					 console.log(rlist);
   					// 서버로부터 전달받은 리스트를 반복문을 통해 댓글목록으로 변환 
   				 	 let result = "";
   					for(let i of rlist){
   					result  += 
   						
   					 '<div class="mo_reply_content">'+
   					 	'<div class="mo_reply_profile">'+
   	                  '<div class="mo_reply_profileImg"><img src="/resources/image/bono.jpg"></div></div>'+
   	                '<div class="mo_reply_text">'+i.getReplyContent+'</div></div>'
   	             
   	              '<div class="mo_reply_content2">'+
   	                '<div class="mo_reply_id">'+i.getReplyWriter+'</div>'
   	                '<div class="mo_reply_date" >'+i.getCreateDate +'</div></div>';
   						 
   					}
   					 $("#slider-div").html(result);  
   				},
   				error: function(){
   					console.log("게시글 목록조회 실패")
   				}
   			}); 
           

     
 
      };
   
      });
     
    </script>
  </body>
</html>
