
<%@page import="com.kh.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ArrayList<Board> list2 = (ArrayList<Board>) session.getAttribute("list2");
	ArrayList<Integer> arr = (ArrayList<Integer>) request.getAttribute("arr");
	/* ArrayList<NoticeCheck> noticeCheckList = (ArrayList<NoticeCheck>) session.getAttribute("noticeCheckList"); */
	
	
	int refCno = (int)request.getSession().getAttribute("refCno");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice List View Page</title>
<style>
	.notice_con1 .divSt{
		display: inline-flex;
	}
	
	.notice_con1{
		height: 400px;
		border-radius: 20px;
		border: 2px solid #D3D3D3;
		background-color: rgb(235, 236, 240);
	}
	.notice_content div{
		font-weight: 900;
	}
 	.notice_content{
		margin-right: 10px;
	} 
	.notice_confirm{
		
		width:100%;
		border-bottom: 1px solid gray;
	}
	.notice_confirm>th{
		margin: 10px;
		border-left: 1px solid gray;
	}
	.notice_date{
		
		width: 60%;
	}
	.notice_date>div{
		text-align:center;
	}
	.notice_con_title, .notice_con_content{
		width: 20%;
	}
	
	.notice_con_title{
		display: inline-flex;
	}
	
	.notice_con_content{
		width:850px;
		background-color: white;
		border-radius: 15px;
		margin: auto;
		
	}
	.notice_con_content>pre{
		text-decoration: underline;
		text-decoration-color: #D3D3D3;
	}
	
	.controllBtn{
		float: right;
	}
	
	.ctBtn{
		border: lightgray;
		border-radius: 30px;
		cursor: pointer;
	}
	#checkIcon{
		width: 45px;
	}
	.ctBtn:hover{
		background-color: #D3D3D3;
	}
	
	.scrollBox{
	   -ms-overflow-style: none;
	}
	.scrollBox::-webkit-scrollbar{
	  display:none;
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
	
</style>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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
            	  <button type="button" class="ctBtn button_UI button--winona" onclick="folderDeleteClick();">삭제</button>
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
    	      	console.log(result);
    	      },
    	      error: function(xhr, status, error) {
    	      	alert(error);
    	      }  
    	   });
    	  
    	  location.reload();
    	  
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
			<div id="noDiV<%=b.getBoardNo() %>">No. <%= b.getBoardNo() %></div>
			<% if(loginUser.getUserLevel() == 1) { %>
				<input id="<%=b.getBoardNo() %>" type="checkbox" name="folderCheckname"> <label>삭제할 게시글을 선택하세요</label>
			<% }else{ %>
				<input id="<%=b.getBoardNo() %>" type="checkbox" name="folderCheckname" style="display:none;">
			<% } %>
			<div class="notice_con1">
				<table class="notice_confirm marginSt">
					<tr>
						<th class="notice_date divSt"><%=b.getCreateDate() %></th>
						<th class="divSt"><div>선생님<br>확&nbsp;&nbsp; 인</div>
							<img class="divSt" id="teacherProfile" src="<%= contextPath %>/resources/image/teacherStemp.png" style="width: 50px; height: 50px;">
						</th>
						<th class="divSt"><div>학부모<label style="font-weight: lighter;">(/본인)</label><br>확&nbsp;&nbsp; 인</div>
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
			                    <img id="checkIcon" src="resources/image/checkIcon.png"/>
			                </button>
			                <% if(loginUser.getUserLevel() == 1){ %>
				                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="overflow-y:scroll; height: 150px;">
				                	
				                </div>
			                <%}else{ %>
			                	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="overflow-y:scroll; height: 150px; display:none;">
				                	
				                </div>
			                <% } %>
			              </div>
			              
			              
			              
						</th>
					</tr>
				</table>
				
				<div id="print<%= b.getBoardNo() %>">
					<input type="hidden" value="<%=b.getBoardNo() %>" id="hiddenNo">
					<div class="notice_con_title marginSt">
						<p style="width: 42px; display:inline-block; margin: 8px 5px 20px 16px;">(공지) <p style="display:inline-block; margin: 8px;"><%= b.getBoardTitle() %></p></p>
					</div>
					<div class="notice_con_content">
						<pre><%=b.getBoardContent() %></pre>
					</div>
				</div>
				<div id="mo_reply_list">
					<ul class="scrapIc">
						<li id="<%= loginUser.getUserNo() %>" class="scrap" style="padding-right: 15px;" onclick="scrapClick('<%= b.getBoardNo() %>');">
							<i class="bi bi-star <%= isScraped ? "clicked" : "uncliked" %>" style="padding-right: 10px;"></i>
						</li>
					</ul>
				</div>
			</div>
			<br>
		<%} %>
		
     </div>
     </div>
     <script>
				              $(function(){
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
					              	            confirmButtonText: '<button type="button" onclick="noticeCheck('+bno+');">확인</button>',
					              	            cancelButtonText: '취소'
				              						
				              				}).then((result) => {
				              		            if (result.isConfirmed) {
				             
				              		                Swal.fire({
				              		                	icon: 'success',
						              					title: '확인되었습니다!'
						              					/* ,confirmButtonText: '<button type="button" onclick="checkFin();">확인</button>' */
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
				              					result += '<div class="dropdown-item">'+list[i].userName
						              					/* if(list[i].userLevel == 2){
						              						+" 부모님"
						              					}else if(list[i].userLevel == 3){
						              						+" 학생"
						              					} */
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
     		//let bno = $(".scrap").attr("class"); ex) scrap_1
     		/* let scrapBno = $(".scrap").attr("class");
     		let bno = scrapBno.substring(scrapBno.indexOf('_')+1, scrapBno.indexOf('_', scrapBno.indexOf('_')+1)); // ex) 1 */
     		let uno =  $(".scrap").attr("id");
     		
     		/* boardNo를 가져와서 해당 bno의 스크랩의 색을 바꿔줘야함 */
    		
     		
     		$.ajax({
     			url: "<%= contextPath %>/scrap.bo",
     			type: "post",
     			data: {bno, uno},
     			/* 성공시 데이터 스크랩리스트 받아서 for문 돌리면서 하나하ㅏ 색변하게 */
     			success: function(scrap){
     					console.log(scrap);
     					console.log("스크랩 잘됨");
     					/* let arr[] = 0;
     					
     					for(let i=0; i<scrapList.size(); i++){
     						JSONObject jsonObject = scrapList.getJSONObject(i);
     						let bno = jsonObject.getString("refBno");
     						arr.push(bno);
     						console.log("bno:"+bno);
     						console.log("arr:"+arr);
     					} */
     					
     					/* 15, 25 */
     					/* scrap.subString(14, 15) */
     					<%-- 
      					$.ajax({
     						url: "<%= contextPath %>/goMyScrap.s",
     						type:"post",
      						data: { 
      							scrap : JSON.stringify(scrap)
      						},
      						success: function(){
      							location.href="<%= contextPath%>/views/my/myScrap.jsp";
      							console.log("스크랩 데이터 보내기 성공");
      						},
      						error: function(){
     							console.log("스크랩 데이터 보내기 실패");
      						}
     						
      					}); --%>
     			},
     			error: function(){
     				console.log("게시글 스크랩 실패");
     			}
     			
     		});
     	
     	
     	
     	};
     	
     	
     	/* boardNo를 가져와서 해당 bno의 스크랩의 색을 바꿔줘야함  */
     	 /* let j = 0;
          $('.scrap').on('click',function(){
   			if(j==0){
                   $(this).children($(".bi-star")).css({color : "orange"});
                   console.log("1j"+j);
                   j++;
                   console.log("2j"+j);
            }else if(j==1){
            	console.log("3j"+j);
               	$(this).children($(".bi-star")).css('color','black');
                   j--;
                console.log("4j"+j);
            }
   			console.log("5j"+j);
           });	
          console.log("6j"+j);	  */
          
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