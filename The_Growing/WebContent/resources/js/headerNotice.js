/**
 * 
 */
function userNotice(contextPath,uno){
	console.log(contextPath,uno);
	 $.ajax({
         url : contextPath+"/userNotice.me",
         method : 'POST',
         data : {uno:uno},       
         dataType : 'json',
         success:function(result){
			list = '';
			console.log(result[0].noticeDate);
			for(let i = 0; i < result.length; i++){
				if(result[i].noticeType == 3){					
					list += "<a class='dropdown-item'>"+result[i].className+"반의 게시글에 "+result[i].interactionName+"님이 댓글을 남겼습니다.</a>"
				}
			}
			
            $("#memberNotice").html(list);
           	console.log(result);

         },
         error:function(error,status,msg){
            alert("상태코드 " + status + "에러메시지" + msg );
         }
      });
	
}