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
    <title>Document</title>   
</head>
<body>
    <%@include file="/views/board/boardFrame.jsp" %>
              <div id="board_area" style="padding-left: 1em;">
                
                <div style="margin-bottom: 1em;font-size: 1.5em;font-weight: 700;">설문조사</div>
                <% if(loginUser.getUserLevel() == 1) { %>  
                	<button type="button" onclick="location.href='<%= contextPath %>/enroll.su'" style="background-color: #209dce;color: #ffffff;width: 100%;height: 50px;border: 0;border-radius: 5em;">설문조사 작성하기</button>
                <% } %>
                <div style="margin: 1em 0 1em 0;font-size: 1.5em;"><a href='javascript:void(0);' id="canSurvey" style="text-decoration: none;color: #000000;font-weight: 700;">진행 중</a> | <a href='javascript:void(0);' id="cantSurvey" style="text-decoration: none;color: #000000;">종료</a></div>
                <div id="surveying">
                	<form action="answer.su" method="get">
	                <% for(int i = 0; i < surveyList.size(); i++) {%>
	                <% Survey s = surveyList.get(i); %>
		                <% if(s.getStatus().equals("Y")){ %>
			                <div class="surveys" style="width:100%;border: 1px solid #cff0cc;border-radius: 1em;background-color: #cff0cc;margin-bottom: 2em;">
			                	<input type="hidden" name="sno" value="<%= s.getSurveyNo() %>" readonly>
			                    <div style="padding: 1em;box-sizing: border-box;display: flex;justify-content: space-between;">
			                        <span><h4><b><%= s.getTitle() %></b></h4> <%= s.getFirstDate() %> ~ <%= s.getLastDate() %></span>
			                        <button type="submit" style="margin: 1em 0 1em 0;width: 15em;height: 3em;border: 0;border-radius: 1em;background-color: #209dce;color: #ffffff;">설문하기</button></div>
			                    <% if(loginUser.getUserLevel() == 1) { %>    
				                    <hr style="background-color: #000000;margin: 0;">
				                    <div style="display: flex;justify-content: space-between; padding: 1em 1em 0 1em;">
				                        응답인원 수 : <%= s.getSurveyCount() %> 
				                        <div style="padding: 0 0.5em 0.5em 0.5em;">
					                        <a href="javascript:void(0);"><button type="button" id="surveyResult" style="border: 0.5px solid gray;border-radius: 0.5em;background-color: #ffffff;">결과보기</button></a>&nbsp;
					                        <a href="javascript:void(0);"><button type="button" style="border: 0.5px solid gray;border-radius: 0.5em;background-color: #ffffff;">종료</button></a>
				                        </div>
				                    </div>
			                    <% } %>
			                </div>
		                <% } %>
	                <% } %>
	                </form>
                </div>
                <div id="surveyEnd" style="display:none;">
                	<% for(int i = 0; i < surveyList.size(); i++) {%>
	                <% Survey s = surveyList.get(i); %>
		                <% if(s.getStatus().equals("N")){ %>
			                <div class="surveys" style="width:100%;border: 1px solid #cff0cc;border-radius: 1em;background-color: #cff0cc;margin-bottom: 2em;">
			                	<input type="hidden" name="endSno" value="<%= s.getSurveyNo() %>" readonly>
			                    <div style="padding: 1em;box-sizing: border-box;display: flex;justify-content: space-between;">
			                        <span><h4><b><%= s.getTitle() %></b></h4> <%= s.getFirstDate() %> ~ <%= s.getLastDate() %></span>
			                    </div>
			                    <% if(loginUser.getUserLevel() == 1) { %>    
				                    <hr style="background-color: #000000;margin: 0;">
				                    <div style="display: flex;justify-content: space-between; padding: 1em 1em 0 1em;">
				                        응답인원 수 : <%= s.getSurveyCount() %> 
				                        <div style="padding: 0 0.5em 0.5em 0.5em;"> 
				                        <a href="javascript:void(0);"><button type="button" id="surveyResult" style="border: 0.5px solid gray;border-radius: 0.5em;background-color: #ffffff;">결과보기</button></a>&nbsp;
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
    		
    		$("#surveyResult").click(function(){
    			location.href="answerResult.su?sno="+$(this).closest(".surveys").children("input[name='sno']").val();
    		});
    		
    	});
    </script>
</body>
</html>