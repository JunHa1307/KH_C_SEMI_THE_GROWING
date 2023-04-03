/**
 * 
 */
document.write('<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>');

function googleLogout() {
	  gapi.load('auth2', function() {
	    gapi.auth2.init();
	  });		
		
	  var auth2 = gapi.auth2.getAuthInstance();
	  auth2.signOut().then(function () {
	    console.log('User signed out.');
	  });
}

document.write('<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>'); 
	
function kakaoLogout() {
		Kakao.init('2cbf161eadf2b860fc5c71113e38ec12'); //발급받은 키 중 javascript키를 사용해준다.
        console.log(Kakao.isInitialized());
		
		if(!Kakao.Auth.getAccessToken()) {
			console.log('Not logged in.');
			return;
		}
			
		Kakao.Auth.logout(function(){
			location.href="<%= contextPath %>/logout.me";
			console.log(Kakao.Auth.getAccessToken());
		});
}