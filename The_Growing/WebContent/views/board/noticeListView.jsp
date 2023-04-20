<%@page import="com.kh.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ArrayList<Board> list2 = (ArrayList<Board>) session.getAttribute("list2");
	ArrayList<Integer> arr = (ArrayList<Integer>) request.getAttribute("arr");
	
	int refCno = (int)request.getSession().getAttribute("refCno");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Growing</title>
<link rel="shortcut icon" type="image/svg" href="<%= request.getContextPath() %>/favicon.svg"/>
<style>
	.notice_con1 .divSt{
		display: inline-flex;
	}
	.notice_con1{
		height: 100%;
		border-radius: 20px;
		border: 2px solid #D3D3D3;
		background-color: rgb(235, 236, 240);
		margin-bottom: 50px;
	}
	.notice_content div{
		font-weight: 500;
	}
 	.notice_content{
		margin-right: 10px;
	} 
	.notice_confirm{
		width:100%;
		display:flex;
		border-bottom: 1px solid #BEBEBE;
	}
	.notice_confirm>th{
		margin: 10px;
	}
	.notice_date{
		width: 60%;
		margin-top: 15px;
		justify-content :center;
		font-size:1.2vw;
	}

	.notice_con_title{
		width: 20%;
		display: inline-flex;
		position: relative;
	}
	.notice_con_title>p{
		position: absolute;
	}
	.notice_con_content{
		height: 100%;	
	}


	
	.notice_con_content{
		width:100%;
		background-color: white;
		border-radius: 15px;
		margin: auto;
		
	}
	.notice_con_content>pre{
		text-decoration: underline;
		text-decoration-color: #D3D3D3;
	}
/* 		.notice_con_content>pre>p{
		margin: 0;
		width:100%;
		height:100%;
	} */
	
	.controllBtn{
		float: right;
	}
	
	.ctBtn{
		border: lightgray;
		border-radius: 30px;
		cursor: pointer;
	}
	#checkIcon{
		width:100%;
		margin-bottom: 5px;
		
	}
	.ctBtn:hover{
		background-color: #D3D3D3;
	}
	
	.scrollBox{
	   -ms-overflow-style: none;
	}
	.scrollBox::-webkit-scrollbar {
          width: 10px;
	}
	.scrollBox::-webkit-scrollbar-track {
          background-color: transparent;
    }
    .scrollBox::-webkit-scrollbar-thumb {
          border-radius: 5px;
          background-color: #D3D3D3;
    }
	
	#mo_reply_bt {
	width: 20%;
	height: 80%;
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
	#mo_reply_list>ul>li {
		list-style-type: none;
		float: right;
		width: 115px;
		font-weight: 600;
		text-align: right;
		cursor: pointer;
	}
	.clicked{
		color:orange;
	}
	.unclicked{
		color:black;
	}
	.noticeHeader{
		text-align: center;
		margin-bottom: 10px;
		position: relative;
		display:flex;
		width:100%;
	}
	#checkList{
		border: 2px solid white;
		width: 45px;
		height: 45px;
		margin: auto;
		margin-top: 10px;
	}
	.marginSt{
		margin-top: 5px;
		margin-right: 15px;
		
	}
	#teacherStamp{
		margin-top: 7px;
		margin-right: 15px;
		boarder: 2px solid black;
	}
/* 	.thStampWrap{
		margin-left: 500px;
		
	} */
	
/* 	@media only screen and (max-width: 780px) {
		.notice_con_content{
			width: 1vw;
			min-width:450px;
		}
		.thStampWrap{
			margin: 0px;
			position: absolute;
			left: 50px;
		}
	} */
	
</style>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
</head>
<body>
<%@include file="boardFrame.jsp" %>
<div id="board_area">
	<form action="<%= contextPath %>/enroll.no" method="post">
	
	<div id="album_header">
    	<div id="album_area">
       		<div id="album_title">알림장</div>
        	<div id="album_button" align="right" class="box">
        		<% if(loginUser.getUserLevel() == 1){ %>
                  <button id="notice_Enroll" type="submit" class="button_UI button--winona" data-text="글 등록" style="margin-right: 10px;"><span>글 등록</span></button>
            	  <button type="button" class="button_UI button--winona" data-text="삭제" onclick="folderDeleteClick();"><span>삭제</span></button>
            	<% } else{ %>
				  <button id="notice_Enroll" type="submit" class="button_UI button--winona" data-text="글 등록" style="margin-right: 10px; display:none;"><span>글 등록</span></button>				
				<% } %>
            </div>
        </div>
        <div id="album_hr">
			<hr />
		</div>
     </div>

     <script>
     	function folderDeleteClick(){
    	  var checkBoxArr = []; 
    	  $("input:checkbox[name='folderCheckname']:checked").each(function() {
    	  	checkBoxArr.push($(this).attr("id"));     // 체크된 것만 값을 뽑아서 배열에 push
    	  	console.log(checkBoxArr);
    	  });
		
    	  $.ajax({
    	      type  : "POST",
    	      url    : "<%= contextPath %>/boardDelete.no",
    	      data: {
    	          checkBoxArr : JSON.stringify(checkBoxArr)      
    	      },
    	      success: function(result){
    	    	  alertMsg("선택된 게시물이 모두 삭제되었습니다.");
    	    	  setTimeout(()=> location.reload(), 1500);
    	    	  
    	      },
    	      error: function(xhr, status, error) {
    	      	alert(error);
    	      }  
    	   });
    	  
    	  
    	  /* $("#board_area").load(window.location.href + " #board_area");  */
    	};
    	  
     </script>
     
     </form>
     <br>
     <div class="scrollBox" style="overflow-y:scroll; width:100%; height: 500px;">
     <div id="notice_content" class="notice_content">
     		<%-- <% for( Board b : list2) {%> --%>
     		<% for(int i = 0; i < list2.size(); i++) {%>
     		<% Board b = list2.get(i); boolean isScraped =false; %>
     		<% for(int a : arr){ %>
     		<% if(a == b.getBoardNo()){ %>
     		<% 	isScraped = true;} %>
     		<% } %>
     		<% if(loginUser.getUserLevel() == 1){ %>
     		<div class="controllBtn">
					<button type="button" class="ctBtn" onclick="location.href='<%= contextPath %>/update.no?bno=<%= b.getBoardNo() %>'"><img src="resources/image/editIcon.png" style="width:45px;"></button>
					<button type="button" class="ctBtn" onclick="divPrint('<%= b.getBoardNo() %>');"><img src="resources/image/printIcon.png" style="width:45px;"></button>
			</div>
			<% } else{%>
			<div class="controllBtn">
				<button type="button" class="ctBtn" onclick="divPrint('<%= b.getBoardNo() %>');"><img src="resources/image/printIcon.png" style="width:45px;"></button>
				
			</div>
			<br>
			<% } %>
			<div id="noDiV<%=b.getBoardNo() %>" style="padding-bottom: 10px;">No. <%= b.getBoardNo() %></div>
			<% if(loginUser.getUserLevel() == 1) { %>
				<input id="<%=b.getBoardNo() %>" type="checkbox" name="folderCheckname"> <label>삭제할 게시글을 선택하세요</label>
			<% }else{ %>
				<input id="<%=b.getBoardNo() %>" type="checkbox" name="folderCheckname" style="display:none;">
			<% } %>
			<div class="notice_con1">
				<div class="notice_confirm marginSt">
					<div class="noticeHeader">
						<div class="notice_date divSt"><fmt:formatDate value="<%=b.getCreateDate() %>" pattern="yyyy년 M월 dd일" /></div>
						<div class="divSt thStampWrap" style="width:140px;"><div class="marginSt" style="width:100px; ">선생님<br>확&nbsp;&nbsp; 인</div>
							<img class="divSt" id="teacherStamp" src="<%= contextPath %>/resources/image/teacherStampIc.png" style="width: 50px; height: 50px;">
						</div>
						<div class="mycheck divSt" style="width:150px"><div class="marginSt" style="width:100px; ">학부모<label style="font-size: small; font-weight: 400; margin-bottom: 0px;">/(본인)</label><br>확&nbsp;&nbsp; 인</div>
							<div class="dropdown">

			                <%if(loginUser.getUserLevel() == 1){ %>
			                	<button 

			                	id="checkList"
			                    class="btn btn-secondary checkList" 
			                    type="button" 
			                    id="dropdownMenuButton" 
			                    data-toggle="dropdown" 
			                    aria-haspopup="true" 
			                    aria-expanded="false"
			                    onclick="check('<%=b.getBoardNo() %>')"
			                    >
			                <%}else{ %>
			                	<button 
			                	id="checkList"
			                    class="btn btn-secondary checkList" 
			                    type="button" 
			                    id="dropdownMenuButton"
			                    data-bno="<%=b.getBoardNo() %>" 
			                    data-toggle="dropdown" 
			                    aria-haspopup="true" 
			                    aria-expanded="false"
			                    >
			                <% } %>
			                    <img id="checkIcon" src="resources/image/blue-check-mark.png"/>
			                </button>
			                <% if(loginUser.getUserLevel() == 1){ %>
				                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="overflow-y:scroll; height: 150px;">
				                	
				                </div>
			                <%}else{ %>
			                	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="overflow-y:scroll; height: 150px; display:none;">
				                	
				                </div>
			                <% } %>
			              </div>
			              
			              
			              
						</div>
					</div>
				</div>
				
				<div id="print<%= b.getBoardNo() %>">
					<input type="hidden" value="<%=b.getBoardNo() %>" id="hiddenNo">
					<div class="notice_con_title marginSt" style="padding-bottom: 30px">
						<p style="width: 50px; margin-left: 20px;">(공지)</p> <p style="width: 750px; margin-left: 70px;"><%= b.getBoardTitle() %></p>
					</div>
					<div class="notice_con_content">
						<pre style="height: 100%; width:100%;"><%=b.getBoardContent() %></pre>
					</div>
				</div>
				<div id="mo_reply_list">
					<ul class="scrapIc">
						<li id="<%= loginUser.getUserNo() %>" class="scrap" style="padding-right: 15px;" onclick="scrapClick('<%= b.getBoardNo() %>');">
							<i class="bi bi-star <%= isScraped ? "clicked" : "uncliked" %>" style="padding-right: 10px;"></i>
						</li>
					</ul>
				</div>
				<br><br>
			</div>
			<br>
		<%} %>
		
     </div>
     </div>
     <script>
				              $(function(){
				            	   $("#board_notice").css("fontWeight", "700");
				                   $("#board_notice").children().css("background", "rgb(237, 239, 243)");
				            	  
				              	if(<%= loginUser.getUserLevel() != 1 %>){
				              		$().ready(function(){
				              			$(".checkList").click(function(){
				              				let bno = this.dataset.bno;
				              				Swal.fire({
				              					icon: 'question',
				              					title: '알림장을 확인하시겠습니까?',
				              					text: '꼼꼼히 확인해주세요~',
				              				  	showCancelButton: true,
					              	            confirmButtonColor: '#3085d6',
					              	            cancelButtonColor: '#d33',
					              	            confirmButtonText: '<button type="button" style="border:none; background-color: #3085D6; color: white;" onclick="noticeCheck('+bno+');">확인</button>',
					              	            cancelButtonText: '취소'
				              						
				              				}).then((result) => {
				              		            if (result.isConfirmed) {
				             
				              		                Swal.fire({
				              		                	icon: 'success',
						              					title: '확인되었습니다!'
						              					,confirmButtonText: '확인'
						              						/* '<button type="button" onclick="checkFin();">확인</button>'  */
				              		                });
				              		              
				              		            }
				              		        })
				              		         
				              		    });
				              		});
				              	}
				              	});
			              			
				              	function noticeCheck(bno){
				              		$.ajax({
				              			type: 'post',
				              			url: "<%=contextPath%>/checkinsert.no",
				              			data: {bno},
				              			success: function(result){
				              				console.log(result);
				              			},
				              			error: function(){
				              				console.log("실패");			              			
				              			}
				              		});
				              	};
				              	
				              	function check(result){
				              		$.ajax({
				              			type: 'post',
				              			url: "<%=contextPath%>/checklist.no",
				              			data: {bno : result},
				              			dataType: "json",
				              			success: function(list){
				              				let result = "";
				              				console.log(list);
				              				for(let i = 0 ; i< list.length ; i++){
				              					result += '<div class="dropdown-item">'
				              							+list[i].userName
						              					
						              					+'</div>'
				              				}
				              				console.log(result);
				              			/* 	$("#name").html(result);*/
				              			$('.dropdown-menu').html(result);
				              			},
				              			error: function(){
				              				console.log("실패");			              			
				              			}
				              		});
			              		};
			              		
			              		/* function checkFin(){
			              			$("#checkList").attr("disabled", "true");
			              		} */
			              </script>
     <script>
     	// 인쇄
     	function divPrint(boardNo){
     		var printId = "print"+boardNo;
     		var initBody = document.body.innerHTML;
     		
     		window.onbeforeprint = function(){
     			document.body.innerHTML = document.getElementById(printId).innerHTML;
     		
     		}
     		window.onafterprint = function(){
     			document.body.innerHTML = initBody;
     		}
     		window.print();
     	};

     	//스크랩
     	function scrapClick(bno){
     		
     		let uno =  $(".scrap").attr("id");
     		
     		$.ajax({
     			url: "<%= contextPath %>/scrap.bo",
     			type: "post",
     			data: {bno, uno},
     			
     			success: function(scrap){
     					console.log(scrap);
     					console.log("스크랩 잘됨");
     					
     			},
     			error: function(){
     				console.log("게시글 스크랩 실패");
     			}
     			
     		});
     	
     	
     	
     	};
     	

          
      $(function(){
          $('.scrap').on('click',function(){
        	  
        	  if($(this).children($(".bi-star")).hasClass('unclicked')){
        		  $(this).children($(".bi-star")).removeClass('unclicked');
        		  $(this).children($(".bi-star")).addClass('clicked');
        	  }else if($(this).children($(".bi-star")).hasClass('clicked')){
        		  $(this).children($(".bi-star")).removeClass('clicked');
        		  $(this).children($(".bi-star")).addClass('unclicked');
        	  }else{
        		  $(this).children($(".bi-star")).addClass('clicked');
        	  }
	     		
             });	
          
     });
        
        
     	
     </script>
</div>
</div>
</div>
</div>



</body>
</html>