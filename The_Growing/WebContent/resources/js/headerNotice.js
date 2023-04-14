/**
 * 
 */
function userNotice(contextPath,uno){
	 $.ajax({
         url : contextPath+"/userNotice.me",
         method : 'POST',
         data : {uno:uno},       
         dataType : 'json',
         success:function(result){
			newDate = new Date(result[0].noticeDate);
			currDate = sessionStorage.getItem("currAlarmDate");
			oldDate = new Date(currDate);
			if(currDate == null){
				sessionStorage.setItem("currAlarmDate", new Date());
				$(".isAlarmNew").attr('style',"display:none;");
			}else if(newDate > oldDate){
				$(".isAlarmNew").attr('style',"display:block;");
			}else{
				$(".isAlarmNew").attr('style',"display:none;");
			}
			
			list = '';
			for(let i = 0; i < result.length; i++){
				if(result[i].noticeType == 1){
					list += "<a class='dropdown-item'>"+result[i].className+"에 "+result[i].interactionName+"님이 가입했습니다.</a>"
				}
				else if(result[i].noticeType == 2){
					list += "<a class='dropdown-item'>"+result[i].className+"의 게시글'"+ result[i].boardTitle +"'에 "+result[i].interactionName+"님이 댓글을 남겼습니다.</a>"
				}
				else if(result[i].noticeType == 3){					
					list += "<a class='dropdown-item'>"+result[i].className+"에 '"+result[i].boardTitle+"'알림장이 작성되었습니다.</a>"
				}
			}
            $("#memberNotice").html(list);

			$("#alarmIcon").attr("class",result[0].noticeDate);
         },
         error:function(error,status,msg){
            alert("상태코드 " + status + "에러메시지" + msg );
         }
      });
}

$(function(){
	$("#dropdownMenuButton, #alarmIcon").click(function(){
		sessionStorage.setItem("currAlarmDate", new Date());
		$(".isAlarmNew").attr('style',"display:none;");
	});
});