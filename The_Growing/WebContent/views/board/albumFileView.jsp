<%@page import="com.kh.common.model.vo.Attachment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%  
     ArrayList<Attachment> list= (ArrayList<Attachment>)request.getAttribute("list");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

/* 버튼 css */
.box {
      display: flex;
      background: #ffffff;
      color: #000000;
      width: 150px;
      height: 50px;
      border-radius: 30px;
    }
    .button_UI {
      float: left;
      width: 150px;
      height: 50px;
      display: block;
      border: none;
      background: none; 
      color: inherit;
      position: relative;
      z-index: 1;
      -webkit-backface-visibility: hidden;
      -moz-osx-font-smoothing: grayscale;
      border-radius: 30px;
      border: 3px solid;
    }
    .button_UI :active{
     color :rgb(137, 180, 166);
    }
    .button_UI:focus {
      outline: none;
    }
    
    .button--winona {
      overflow: hidden;
      padding: 0;
      -webkit-transition: border-color 0.3s, background-color 0.3s;
      transition: border-color 0.3s, background-color 0.3s;
      -webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
      transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
    }
    .button--winona::after {
      content: attr(data-text);
      position: absolute;
      width: 100%;
      height: 100%;
      top: 0;
      left: 0;
      opacity: 0;
      color: rgb(137, 180, 166);
      font-weight: 600;
      -webkit-transform: translate3d(0, 25%, 0);
      transform: translate3d(0, 25%, 0);
    }
    .button--winona::after,
    .button--winona > span {
      padding: 10px;
      -webkit-transition: -webkit-transform 0.3s, opacity 0.3s;
      transition: transform 0.3s, opacity 0.3s;
      -webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
      transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
      display: block;
      font-weight: 600;
    }
    .button--winona:hover {
      border-color: rgb(137, 180, 166);
      background-color: rgba(255, 255, 255, 0.1);
    }
    
    .button--winona:hover::after {
      opacity: 1;
      -webkit-transform: translate3d(0, 0, 0);
      transform: translate3d(0, 0, 0);
    }
    .button--winona:hover > span {
      opacity: 0;
      -webkit-transform: translate3d(0, -25%, 0);
      transform: translate3d(0, -25%, 0);
    }



/* 좋아요 하트 */
.heart {
  width: 100px;
  height: 100px;
  transform: translate(-50%, -50%);
  background: url(/resources/image/heart.png) no-repeat;
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
 
      #board_area {
        min-height: 698px;
        width: 957px;
      }
     
      .board_hr {
        padding: 7px;
      }
      #album_header {
        height: 80px;
        width: 100%;
        position: sticky;
        /* background-color: antiquewhite; */
      }
      #album_area > div {
        float: left;
        height: 100%;
      }
      #album_title {
        width: 70%;
        font-size: 25px;
        font-weight: 700;
        padding-top: 13px;
        padding-left: 14px;
      }
      #album_button {
        width: 30%;
      }
      #album_area {
        width: 100%;
        height: 70%;
        /* background-color: aliceblue; */
      }


     
      #album_hr {
        width: 100%;
        height: 30%;

        /* background-color: aquamarine; */
      }
      #album_hr > hr {
        margin: 0;

        /* background-color: aquamarine; */
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
        width: 25%;
        position: relative;
        
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
        height: 210px;
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
      }

      .album_con_date {
        width: 90%;
        height: 28px;
        margin: auto;
        text-align: right;
      }
      #modal {
         width: 800px;
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
   
     
      #mo_picture_wrap {
        width: 100%;
        height: 100%;
       background-color: black;
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
      #veil{
        position: absolute;
         width: 100%; 
         height: 100%;
          bottom: 0px; 
          background-color: black; 
          opacity: 0.6;
           z-index: 4; 
           display: none;
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
        height: 100%;
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

    
    .file_check{
       position: absolute;
       left: 20px;
       top: 10px;
       z-index: 3;
 
    
 
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
                <button class="button_UI button--winona" data-text="다운로드" style="margin-right: 10px;" ><span>다운로드</span></button>
                  <button class="button_UI button--winona board_album" data-text="게시물 보기" ><span>게시물 보기</span></button>
              </div>
            </div>
            <div id="album_hr">
              <hr />
            </div>
          </div>
          <div class="album_content">
          
          <% int[] albumlist; %>
          <%for(int i = 0; i<list.size(); i++) {%>
          	
            <div class="album_con1 class<%=i%>">
            <input type="hidden" id="fno"  value="<%=list.get(i).getFileNo() %>">
               <input type="checkbox" class="file_check">
              <div  class="album_con_file album_click">
                <img src="<%=contextPath %><%=list.get(i).getFilePath()+list.get(i).getChangeName() %> " width="200" height="150" >
              </div>
            </div>
            <%} %>
         
       
          </div>
         
      
         
        </div>
         </div>
        <div id="modal">
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
                 <%for(int i = 0; i<list.size(); i++) {%>
                 <div ><img src="<%=contextPath %><%=list.get(i).getFilePath()+list.get(i).getChangeName() %>" class="img_1" ></div>
                  <%} %>
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
    </script>

    <script>
      $(function () {
          $("#board_album").css("fontWeight", "700");
          $("#board_album").children().css("background", "rgb(239, 243, 239)");



        $(".album_click").click(function(){
        	console.log($("#fno").val());
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
      
   
            $('.button_UI').on('click',function(){
                if($(this).css('color')=='rgb(137, 180, 166)'){
                  $(this).css('color', "black" );
                }else{
                  ($(this).css('color','rgb(137, 180, 166)'));
                }
              });

        

     $('.file_check').change(function(){
                    if($(this).prop("checked")){ 
                        $(this).siblings().css('border','3px rgb(50, 113, 231) solid');
                    }else{
                        $(this).siblings().css('border','none');
                    }
               });
     
    
    
      });
      
    </script>
  </body>
</html>
