<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.survey.model.vo.Survey, java.util.ArrayList"%>
<%
	ArrayList<Survey> surveyList = (ArrayList<Survey>) request.getAttribute("surveyList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The Growing</title>   
</head>
<style>
.topTitle {
	margin-bottom: 1em;
	font-size: 1.5em;
	font-weight: 700;
}

.surveyWriteBtn {
	background-color: #209dce;
	color: #ffffff;
	width: 100%;
	height: 50px;
	border: 0;
	border-radius: 5em;
}

#canSurvey {
	text-decoration: none;
	color: #000000;
}

#cantSurvey {
	text-decoration: none;
	color: #000000;
}

.surveys {
	width:100%;
	border: 1px solid rgb(5, 3, 52);
	border-radius: 1em;
	background-color:  rgb(5, 3, 52);
	margin-bottom: 2em;
	color:white;
	box-shadow: -5px -5px 7px 0px rgba(255, 255, 255, 0.5), 3px 3px 7px 0px rgba(0, 0, 0, 0.3);
}

.surveyInfo {
	padding: 1em;
	box-sizing: border-box;
	display: flex;
	justify-content: space-between;
}

.doSurvey {
		margin: 1em 0 1em 0;
		height: 3em;
		border: 0;
		border-radius: 1em;
		background-color: white;
		color: rgb(5, 3, 52);
		box-shadow: 0px 8px 6px -6px #666;
	}
	
@media only screen and (min-width: 780px) {
	.doSurvey {
		width: 15em;
	}
}

@media only screen and (max-width: 780px) {
	.doSurvey {
		width: 7em;
	}
}

.hiddenInfo {
	display: flex;
	justify-content: space-between;
	padding: 1em 1em 0 1em;
}

.upSurvey, .surveyResult, .endSurvey {
	border: 0.5px solid #dfd3c3;
	border-radius: 0.5em;
	background-color:  #dfd3c3;
	box-shadow: 0px 8px 6px -6px #666;
}
</style>
<body>
    <%@include file="/views/board/boardFrame.jsp" %>
              <div id="board_area" style="padding-left: 1em;">
                
                <div class="topTitle">설문조사</div>

                <% if(loginUser.getUserLevel() == 1) { %>  
                	<button type="button" class="surveyWriteBtn" onclick="location.href='<%= contextPath %>/enroll.su'">설문조사 작성하기</button>
                <% }else{ %>
					<hr style="padding:0;margin:0;">                
                <% } %>
                <div style="margin: 1em 0 1em 0;font-size: 1.5em;"><a href='javascript:void(0);' id="canSurvey" style="font-weight:700;">진행 중</a> | <a href='javascript:void(0);' id="cantSurvey">종료</a></div>
                <div id="surveying">
	                <% for(int i = 0; i < surveyList.size(); i++) {%>
	                <% Survey s = surveyList.get(i); %>
		                <% if(s.getStatus().equals("Y")){ %>
			                <div class="surveys">
			                	<input type="hidden" name="sno" value="<%= s.getSurveyNo() %>" readonly>
				                    <div class="surveyInfo">
				                        <span><h4><b><%= s.getTitle() %></b></h4> <%= s.getFirstDate() %> ~ <%= s.getLastDate() %></span>
				                        <button type="button" class="doSurvey">설문하기</button></div>
			                    <% if(loginUser.getUserLevel() == 1) { %>    
				                    <hr style="background-color: grey;margin: 0;">
				                    <div class="hiddenInfo">
				                        응답인원 수 : <%= s.getSurveyCount() %> 
				                        <div style="padding: 0 0.5em 0.5em 0.5em;">
					                        <a href="javascript:void(0);"><button type="button" class="upSurvey">수정하기</button></a>&nbsp;
					                        <a href="javascript:void(0);"><button type="button" class="surveyResult">결과보기</button></a>&nbsp;
					                        <a href="javascript:void(0);"><button type="button" class="endSurvey">종료</button></a>
				                        </div>
				                    </div>
			                    <% } %>
			                </div>
		                <% } %>
	                <% } %>
                </div>
                <div id="surveyEnd" style="display:none;">
                	<% for(int i = 0; i < surveyList.size(); i++) {%>
	                <% Survey s = surveyList.get(i); %>
		                <% if(s.getStatus().equals("N")){ %>
			                <div class="surveys"">
			                	<input type="hidden" name="sno" value="<%= s.getSurveyNo() %>" readonly>
			                    <div class="surveyInfo">
			                        <span><h4><b><%= s.getTitle() %></b></h4> <%= s.getFirstDate() %> ~ <%= s.getLastDate() %></span>
			                    </div>
			                    <% if(loginUser.getUserLevel() == 1) { %>    
				                    <hr style="background-color: #000000;margin: 0;">
				                    <div class="hiddenInfo">
				                        응답인원 수 : <%= s.getSurveyCount() %> 
				                        <div style="padding: 0 0.5em 0.5em 0.5em;"> 
				                        <a href="javascript:void(0);"><button type="button" class="surveyResult">결과보기</button></a>&nbsp;
				                        </div>
				                    </div>
			                    <% } %>
			                </div>
		                <% } %>
	                <% } %>
                </div>
              </div>
            </div><!-- boardFrame -->
        </div>
    </div>
    <script>
    	$(function(){
    		 $("#board_survey").css("fontWeight", "700");
    	     $("#board_survey").children().css("background", "rgb(237, 239, 243)");
    		
    		
    		$("#canSurvey").click(function(){
    			$("#surveying").css("display","block");
    			$("#canSurvey").css("font-weight", "700");
    			$("#surveyEnd").css("display","none");
    			$("#cantSurvey").css("font-weight", "");
    		});
    		
    		$("#cantSurvey").click(function(){
    			$("#surveying").css("display","none");
    			$("#canSurvey").css("font-weight", "");
    			$("#surveyEnd").css("display","block");
    			$("#cantSurvey").css("font-weight", "700");
    		});
    		
    		$(".surveyResult").click(function(){
    			location.href="answerResult.su?sno="+$(this).closest(".surveys").children("input[name='sno']").val();
    		});
    		
    		$(".endSurvey").click(function(){
    			let sno = $(this).closest(".surveys").children("input[name='sno']").val();
        		console.log(sno);
        		$.ajax({
                    url : "<%= contextPath %>/list.su",
                    method : 'POST',
                    data : {sno},       
                    dataType : 'text',
                    success:function(result){
                       if(result != 'Fail'){
                          
                             alertMsg("설문을 종료했습니다.");
                             location.reload();
                       }else{
                          error("설문 종료 실패");
                       }
                    },
                    error:function(error,status,msg){
                       error("상태코드 " + status + "에러메시지" + msg );
                    }
                 });
    		});
	    	$(".doSurvey").click(function(){
	    		location.href ="answer.su?sno="+$(this).closest(".surveys").children("input[name='sno']").val();
	    	});
    	});
    	/* 수정 */
    	$(".upSurvey").click(function(){
    		location.href ="update.su?sno="+$(this).closest(".surveys").children("input[name='sno']").val();
    	});
    </script>
</body>
</html>